local BaseLayer = requireLayerUI("BaseLayer")
local LoginOtpPassWordLayer = class("LoginOtpPassWordLayer", BaseLayer)


local function urlencodechar(char)
    return "%" .. string.format("%02X", string.byte(char))
end

local function urlencodeT(input)
    -- convert line endings
    input = string.gsub(tostring(input), "\n", "\r\n")

    -- escape all characters but alphanumeric, '.' and '-'
    input = string.gsub(input, "([^%w%.%-%_%~ :/=?&])", urlencodechar)
    -- convert spaces to "+" symbols
    return string.gsub(input, " ", "+")
end


function LoginOtpPassWordLayer:ctor()
    LoginOtpPassWordLayer.super.ctor(self)
end

function LoginOtpPassWordLayer.create()
    local node = LoginOtpPassWordLayer.new()
    if node:Init() then
        return node
    else
        return nil
    end
end

function LoginOtpPassWordLayer:Init()
    self._root = CreateExport("login/login_otp_password_layer.lua")
    if not self._root then
        return false
    end
    self:addChild(self._root)

    self._ui = ui_delegate(self._root)

    self._editBox = CreateEditBoxByTextField(self._ui.TextField)
    self._editBox:setMaxLength(6)
    self._editBox:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)
    self._editBox:setPlaceHolder(GET_STRING(310001100))
    
    self._ui.Button_ok:setVisible(true)

    local proxy = global.Facade:retrieveProxy(global.ProxyTable.LoginOtpPassWordProxy)
    self._ui.Button_ok:addClickEventListener(function()
        local str = self._editBox:getString()

        if not str or string.trim(str) == "" then
            ShowSystemTips(GET_STRING(310001100))
            return
        end

        if string.len(str) < 6 then
            ShowSystemTips(GET_STRING(310001100))
            return
        end

        proxy:verifyOtpPassWord(str)
    end)

    self._editBox:registerScriptEditBoxHandler(function(event, editBox)
        local str = editBox:getText()
        local inputText = string.gsub(str, "[^%d]", "")     --过滤掉非数字字符
        if inputText ~= str then
            editBox:setText(inputText)
        end
    end)

    self._ui.Text_app:setTouchEnabled(true)
    self._ui.Text_app:getVirtualRenderer():enableUnderline()

    local envProxy            = global.Facade:retrieveProxy(global.ProxyTable.GameEnvironment)
    local securityProjectName = envProxy:GetCustomDataByKey("securityProjectName")
    local securityJumpLink    = envProxy:GetCustomDataByKey("securityJumpLink")

    local jsonData = {}
    if securityProjectName and string.len(securityProjectName) > 0 then
        jsonData.projectName = securityProjectName
    end

    if securityJumpLink and string.len(securityJumpLink) > 0 then
        jsonData.jumpLink = securityJumpLink
    end

    self._ui.Text_app:addClickEventListener(function()
        -- body
        local NativeBridgeProxy = global.Facade:retrieveProxy(global.ProxyTable.NativeBridgeProxy)
        NativeBridgeProxy:GN_JumpToSpecifyApp(jsonData or {})
    end)
    
    self._ui.Image_1:setVisible(false)
    self:InitAdapte()

    return true
end

function LoginOtpPassWordLayer:InitAdapte()
    local visibleSize = global.Director:getVisibleSize()
    self._ui.Image_bg:setContentSize(visibleSize)
    self._ui.Image_bg:loadTexture(string.format(global.MMO.PATH_RES_PRIVATE .. "login/open_door/%02d.png", 0))
    self._ui.Image_bg:setPosition(visibleSize.width / 2, visibleSize.height / 2)
end

function LoginOtpPassWordLayer:IsOpenVerifyOtpPassWord()
    local LoginOtpPassWordProxy = global.Facade:retrieveProxy(global.ProxyTable.LoginOtpPassWordProxy)
    LoginOtpPassWordProxy:isOpenVerifyOtpPassWord()
end

function LoginOtpPassWordLayer:OnRefresh(data)
    if data and data.isOpen then
        self._ui.Image_1:setVisible(true)
        return
    end

    if data and data.verufySuccess == false then
        ShowSystemTips(data.msg or "")
        return
    end

    global.Facade:sendNotification(global.NoticeTable.Layer_Login_OtpPassWord_Close)
    global.Facade:sendNotification(global.NoticeTable.Layer_Login_Server_Open)
    global.Facade:sendNotification(global.NoticeTable.RequestLoginServer)
end

return LoginOtpPassWordLayer
