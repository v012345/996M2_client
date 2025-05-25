local RemoteProxy = requireProxy("remote/RemoteProxy")
local LoginOtpPassWordProxy = class("LoginOtpPassWordProxy", RemoteProxy)
LoginOtpPassWordProxy.NAME = global.ProxyTable.LoginOtpPassWordProxy
local cjson = require("cjson")

-- "https://security-center-api-test.tj.996sdk.com"        --测试域名
local baseURL = nil
local signkey = "1a3695c8b32665ad02267f972e281156"

local function urlencodechar(char)
    return "%" .. string.format("%02X", string.byte(char))
end

local function urlencodeT(input)
    -- convert line endings
    input = string.gsub(tostring(input), "\n", "\r\n")
    -- escape all characters but alphanumeric, '.' and '-'
    input = string.gsub(input, "([^%w%.%-%_%~ ])", urlencodechar)
    -- convert spaces to "+" symbols
    return string.gsub(input, " ", "+")
end

local function calcSuffix(originData)
    -- ascii排序
    table.sort(originData, function(a, b)
        return a.key < b.key
    end)

    -- 计算sign
    local origin = ""
    for i, v in ipairs(originData) do
        local send_value = v.value
        if send_value then
            if string.find(send_value, "%%") then
                local strList = string.split(send_value, "%")
                local t = urlencodeT("%")
                send_value = table.concat(strList, t)
            end

            if string.find(send_value, "%+") then
                local strList = string.split(send_value, "+")
                local t = urlencodeT("+")
                send_value = table.concat(strList, t)
            end

            if string.find(send_value, "%&") then
                local strList = string.split(send_value, "&")
                local t = urlencodeT("&")
                send_value = table.concat(strList, t)
            end
        end
        origin = origin .. string.format("%s=%s", v.key, v.value)
        origin = origin .. (i < #originData and "&" or "")
    end

    local tempOrigin = string.format("%s%s", origin, signkey)
    local sign = get_str_MD5(tempOrigin)

    -- 拼接sign
    local suffix = origin .. "&" .. string.format("sign=%s", sign)
    return suffix
end


function LoginOtpPassWordProxy:ctor()
    LoginOtpPassWordProxy.super.ctor(self)

    self._is_open = "/api/v1/game/isOpenValidate"
    self._check_code = "/api/v1/game/checkCode"

    self._is_open_otp = false

    local envProxy = global.Facade:retrieveProxy(global.ProxyTable.GameEnvironment)
    baseURL = envProxy:GetCustomDataByKey("securityCodeUrl")
    
    if baseURL and string.len(baseURL) > 0 then
        self._is_open_otp = true
    end

    self._check_type = "1"
    self._otp_code = 0
end

function LoginOtpPassWordProxy:getCheckType()
    return self._check_type or "1"
end

function LoginOtpPassWordProxy:getOtpCode()
    return self._otp_code or 0
end

function LoginOtpPassWordProxy:isOpenVerifyOtpPassWord()
    if not self._is_open_otp then
        global.Facade:sendNotification(global.NoticeTable.Layer_Login_OtpPassWord_Refresh, {
            isOpen = false
        })
        return false
    end

    local requestURL = baseURL .. self._is_open

    local function httpCB(success, response)
        local isOpen = false
        if success then
            local jsonData = cjson.decode(response)
            isOpen = jsonData and jsonData.code == 200
        end

        releasePrint("======是否开启response: ", response)
        -- data.result 是否开启保护 false：未开启 true：开启

        global.Facade:sendNotification(global.NoticeTable.Layer_Login_OtpPassWord_Refresh, {
            isOpen = isOpen == true
        })
    end

    local AuthProxy     = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
    local currModule    = global.L_ModuleManager:GetCurrentModule()
    local account       = AuthProxy:GetUsername()
    local account_id    = AuthProxy:GetUID()
    local game_id       = currModule:GetOperID()

    local originData = {
        {key = "account_id", value = account_id or ""},     -- uid
        {key = "game_id", value = game_id or ""},           -- 游戏id
        {key = "type",    value = self._check_type},               -- 账号类型，默认为1。 1：996sdk
    }

    local isAccount     = true
    local currentModule = global.L_ModuleManager:GetCurrentModule()
    local envProxy      = global.Facade:retrieveProxy(global.ProxyTable.GameEnvironment)
    local moduleGameEnv = currentModule:GetGameEnv()
    local loginData     = moduleGameEnv:GetLoginData()
    local token         = global.L_GameEnvManager:GetEnvDataByKey("token")
    local boxtoken      = envProxy:getBoxtoken()
    local isPcSdk       = global.L_GameEnvManager:GetEnvDataByKey("isPcSdk")

    if loginData and loginData.password then
        isAccount = false
    elseif token and string.len(string.trim(token)) > 0 then
        isAccount = false
    elseif boxtoken then
        isAccount = false
    elseif isPcSdk then
        isAccount = false
    end
    
    -- 账号检测
    if isAccount then
        originData[#originData] = {key = "account", value = account or ""}           -- 账号
    end

    local suffix = calcSuffix(originData)
    HTTPRequestPost(requestURL, httpCB, suffix)
end

function LoginOtpPassWordProxy:verifyOtpPassWord( otp )
    if not self._is_open_otp then
        return false
    end

    local requestURL = baseURL .. self._check_code

    self._otp_code = otp

    local function httpCB(success, response)
        local verufySuccess = false
        local jsonData = {}
        if success then
            jsonData = cjson.decode(response)
            verufySuccess = jsonData and jsonData.code == 200
        end

        releasePrint("======验证response: ", response)

        local jsonMsg = tostring(jsonData.msg)
        local msg = GET_STRING(310000902)
        if jsonMsg and string.len(jsonMsg) > 0 then
            msg = jsonMsg
        end

        -- data.result -- false：验证失败 true：验证成功
        global.Facade:sendNotification(global.NoticeTable.Layer_Login_OtpPassWord_Refresh, {
            verufySuccess = verufySuccess == true,
            msg = msg
        })
    end

    local AuthProxy     = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
    local currModule    = global.L_ModuleManager:GetCurrentModule()
    local account       = AuthProxy:GetUsername()
    local account_id    = AuthProxy:GetUID()
    local game_id       = currModule:GetOperID()

    local originData = {
        {key = "account_id", value = account_id or ""},     -- uid
        {key = "game_id",  value = game_id or ""},        -- 游戏id
        {key = "code", value = otp or ""},                -- 验证码
        {key = "type",    value = self._check_type},             -- 账号类型，默认为1。 1：996sdk
    }

    local isAccount     = true
    local currentModule = global.L_ModuleManager:GetCurrentModule()
    local envProxy      = global.Facade:retrieveProxy(global.ProxyTable.GameEnvironment)
    local moduleGameEnv = currentModule:GetGameEnv()
    local loginData     = moduleGameEnv:GetLoginData()
    local token         = global.L_GameEnvManager:GetEnvDataByKey("token")
    local boxtoken      = envProxy:getBoxtoken()
    local isPcSdk       = global.L_GameEnvManager:GetEnvDataByKey("isPcSdk")

    if loginData and loginData.password then
        isAccount = false
    elseif token and string.len(string.trim(token)) > 0 then
        isAccount = false
    elseif boxtoken then
        isAccount = false
    elseif isPcSdk then
        isAccount = false
    end
    
    -- 账号检测
    if isAccount then
        originData[#originData] = {key = "account", value = account or ""}           -- 账号
    end

    local suffix = calcSuffix(originData)
    HTTPRequestPost(requestURL, httpCB, suffix)
end

function LoginOtpPassWordProxy:RegisterMsgHandler()
    LoginOtpPassWordProxy.super.RegisterMsgHandler(self)
end

return LoginOtpPassWordProxy