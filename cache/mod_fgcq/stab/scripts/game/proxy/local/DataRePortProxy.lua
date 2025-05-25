local DebugProxy    = requireProxy( "DebugProxy" )
local DataRePortProxy    = class( "DataRePortProxy", DebugProxy )
DataRePortProxy.NAME = global.ProxyTable.DataRePortProxy

local cjson = require("cjson")

local simpleEncryKey = {50,30,20,43}
local stringToByteSimpleDecry = function(byteStr)
    local bytes = cjson.decode(byteStr)
    local newBytes = {}
    local i = 1
    local str = ""
    for k,v in ipairs(bytes) do
        newBytes[k] = v-simpleEncryKey[i]
        if i > #simpleEncryKey then
            i = 1
        end
    end
    local str = string.char(unpack(newBytes))
    return str
end

-- 获取系统版本
local function getWindownVersion()
    if getWindowsVersion then
        local windowVersion = getWindowsVersion()
        local versions = string.split(windowVersion,"_")
        local majorVer = tonumber(versions[1])
        local minorVer = tonumber(versions[2])
        local buildNum = tonumber(versions[3])
        if majorVer >= 10 then
            if buildNum >= 22000 then
                return "Win11"
            end
            return "Win10"
        elseif majorVer >= 6 then
            if minorVer >= 3 then
                return "Win8.1"
            elseif minorVer >= 2 then
                return "Win8"
            elseif minorVer >= 1 then
                return "Win7"
            end
        elseif majorVer >= 5 then            
            return "WinXP"
        end
    end
    return "windows"
end

function DataRePortProxy:ctor()
    DataRePortProxy.super.ctor(self)
    self._infoData = nil
    self._login_game_time = -1
    self._game_duration_schedule_id = -1
    self:InitData()
end

-- 初始化数据
function DataRePortProxy:InitData()
    local isMac = global.L_GameEnvManager:GetEnvDataByKey("platform") == "mac"
    if not (SL:GetMetaValue("WINPLAYMODE") or isMac) then
        return
    end

    local LuaBridgeCtl = LuaBridgeCtl:Inst()
    if not LuaBridgeCtl or LuaBridgeCtl:GetModulesSwitch( global.MMO.Modules_Index_Protobuf_Pbc ) ~= 1 then
        return
    end

    -- 读取launch位置的userdata数据
    UserData:Cleanup()
    UserData:setVersionPath("")

    local userData   = UserData:new("data_report")
    local deviceID  = userData:getStringForKey( "id" )

    -- 统一文件夹//localUserData
    self:InitUserData()

    if not isMac then 
        if not deviceID or deviceID == "" then
            return
        end
        deviceID = stringToByteSimpleDecry(deviceID)
    end
    
    local appid = global.L_GameEnvManager:GetEnvDataByKey("sdkAppid")
    if not appid then
        return
    end

    local secretKey = global.L_GameEnvManager:GetEnvDataByKey("sdkAppkey")
    if not secretKey then
        return
    end

    local channelid = global.L_GameEnvManager:GetEnvDataByKey("sdkChannel")
    if not channelid then
        return
    end

    local boxID = nil
    if global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") == 1 then
        local boxBoxGameID  = global.L_ModuleManager:GetCurrentModule():GetOperID() or ""
        local boxChannelID  = global.L_GameEnvManager:GetChannelID() or ""
        boxID               = boxBoxGameID .. ":" .. boxChannelID
    end
    
    local type = isMac and "mac" or "pc"
    local macID = isMac and (global.L_GameEnvManager:GetEnvDataByKey("macAddress") or "") or (deviceID)
    local width = isMac and (global.L_GameEnvManager:GetEnvDataByKey("displayWidth") or 1136) or (getWindowWidth and getWindowWidth() or 1136)
    local height = isMac and (global.L_GameEnvManager:GetEnvDataByKey("displayHeight") or 1136) or (getWindowHeight and getWindowHeight() or 640)
    local model = isMac and (global.L_GameEnvManager:GetEnvDataByKey("model") or "") or "pc"
    local osVersion = isMac and (global.L_GameEnvManager:GetEnvDataByKey("osVersion") or "") or (getWindownVersion() or "")
    self._infoData = {
        ["device"] = {
            type = type,
            id = macID,
            width = width, 
            height = height,
            model = model,
            os = osVersion
        },
        appid = appid,
        boxid = boxID,
        channel = channelid or "",
        sdk_ver = "1.0.0",
        app_ver = isMac and (global.L_GameEnvManager:GetEnvDataByKey("app_ver") or "") or (global.L_GameEnvManager:GetAPKVersionName() or ""),
        net_type = "UNKNOWN",
    }

end

function DataRePortProxy:GetDeviceInfo()
    return self._infoData or {}
end

--统一文件夹//localUserData
function DataRePortProxy:InitUserData()
    local module        = global.L_ModuleManager:GetCurrentModule()
    local modulePath    = module.GetSubModPath and module:GetSubModPath() or module:GetStabPath()
    local moduleGameEnv = module:GetGameEnv()
    local storagePath   = string.format("%s%s", modulePath,global.MMO.LOCAL_USERDATA)  
    local WritablePath = cc.FileUtils:getInstance():getWritablePath()
    -- 文件夹创建
    local modulePathDir = WritablePath..modulePath
    if not global.FileUtilCtl:isDirectoryExist(modulePathDir) then
        global.FileUtilCtl:createDirectory(modulePathDir)
    end
    if not global.FileUtilCtl:isDirectoryExist(WritablePath..storagePath) then
        global.FileUtilCtl:createDirectory(WritablePath..storagePath)
    end
    UserData:Cleanup()
    UserData:setVersionPath(storagePath)
end

function DataRePortProxy:CheckValid()
    if not self._infoData then
        return false
    end
    local isMac = global.L_GameEnvManager:GetEnvDataByKey("platform") == "mac"
    if not (SL:GetMetaValue("WINPLAYMODE") or isMac) then
        return false
    end

    return true
end

-- 用户登录
function DataRePortProxy:UserLogin()
    if not self:CheckValid() then
        return
    end

    local dataParam = {
        event={time=os.time(),name = "user_login",type = "track"}
    }

    table.merge(dataParam, self._infoData)
    
    return string.urlencode(cjson.encode(dataParam))
end

-- 用户注册
function DataRePortProxy:UserRegister()
    if not self:CheckValid() then
        return
    end

    local dataParam = {
        event={time=os.time(),name = "user_register",type = "track"}
    }

    table.merge(dataParam, self._infoData)

    return string.urlencode(cjson.encode(dataParam))
end

-- 创建订单(预支付)
function DataRePortProxy:PrePay()
    if not self:CheckValid() then
        return
    end

    local dataParam = {
        event={time=os.time(),name = "prepay",type = "track"}
    }

    table.merge(dataParam, self._infoData)

    return string.urlencode(cjson.encode(dataParam))
end

-- 进入游戏 (直接上报ali)
function DataRePortProxy:GameLogin(data)
    if not self:CheckValid() then
        return
    end

    if not global.L_DataRePort then
        return
    end

    local LoginProxy    = global.Facade:retrieveProxy(global.ProxyTable.Login)
    local serviceVer    = " " .. LoginProxy:GetServiceVer()
    self._login_game_time = os.time()
    local dataParam = {
        event={time=os.time(),name = "game_login",type = "track"},
        user={id=tostring( data.userId )},
        properities={
            servid=tostring(data.zoneId),
            server_name=tostring(data.zoneName),
            role_id=tostring(data.roleId),
            role_name=data.roleName,
            role_level=data.roleLevel,
            job_id=tostring(data.roleJobId),
            job_name=tostring(data.roleJobName),
            server_version = string.gsub(serviceVer, "^%S*(.-).%d$", "%1"),
        }
    }

    local selSerInfo        = LoginProxy:GetSelectedServer()
    local main_servid      = selSerInfo and selSerInfo.mainServerId
    local main_server_name  = selSerInfo and selSerInfo.mainServerName
    
    global.L_DataRePort:SendRePortData(dataParam)

    self._game_duration_schedule_id = Schedule(function()
        self:PlayGame({isScheduleFunc=true})
        if self._login_game_time > 0 then
            self._login_game_time = os.time()
        end
    end,5 * 60)
end

--游戏时长 (直接上报ali)
function DataRePortProxy:PlayGame(data)
    if not self:CheckValid() then
        return
    end

    if not global.L_DataRePort then
        return
    end

    if self._login_game_time < 0 then
        return
    end

    local AuthProxy         = global.Facade:retrieveProxy(global.ProxyTable.AuthProxy)
    local loginProxy        = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local PlayerProperty    = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local diffTimes= os.time() - self._login_game_time

    if not data or not data.isScheduleFunc then
        UnSchedule(self._game_duration_schedule_id)
        self._login_game_time = -1
    end

    local jobID         = PlayerProperty:GetRoleJob()
    local PShowAttType  = GUIFunction:PShowAttType()
    local JOB_ATT_TYPE = {
        [0] = PShowAttType.Max_ATK,
        [1] = PShowAttType.Max_MAT,
        [2] = PShowAttType.Max_Daoshu,
    }
    
    local dataParam = {
        event={time=os.time(),name = "game_duration",type = "track"},
        user={id=tostring( AuthProxy:GetUID() )},
        properities={
            servid=tostring(loginProxy:GetSelectedServerId()),
            server_name=tostring(loginProxy:GetSelectedServerName()),
            role_id=tostring(PlayerProperty:GetRoleUID()),
            role_name=PlayerProperty:GetName(),
            role_level=PlayerProperty:GetRoleLevel(),
            times=diffTimes,
            duration=diffTimes,
            job_id=tostring(PlayerProperty:GetRoleJob()),
            job_name=tostring(PlayerProperty:GetRoleJobName()),
            role_att=PlayerProperty:GetRoleAttByAttType( JOB_ATT_TYPE[jobID] or PShowAttType.Max_ATK) or 0,
        }
    }

    local selSerInfo        = loginProxy:GetSelectedServer()
    local main_servid       = selSerInfo and selSerInfo.mainServerId
    local main_server_name  = selSerInfo and selSerInfo.mainServerName

    dataParam.properities.main_servid = tostring(main_servid) or tostring(server_id)
    dataParam.properities.main_server_name = tostring(main_server_name) or tostring(server_name)

    global.L_DataRePort:SendRePortData(dataParam)
end

-- 创建角色 (直接上报ali)
function DataRePortProxy:CreateRole(data)
    if not self:CheckValid() then
        return
    end

    if not global.L_DataRePort then
        return
    end

    local dataParam = {
        event={time=os.time(),name = "create_role",type = "track"},
        user={id=tostring( data.userId )},
        properities={
            servid=tostring(data.zoneId),
            server_name=tostring(data.zoneName),
            role_id=tostring(data.roleId),
            role_name=data.roleName,
            role_level=data.roleLevel,
            job_id=tostring(data.roleJobId),
            job_name=tostring(data.roleJobName)
        }
    }

    local LoginProxy        = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local selSerInfo        = LoginProxy:GetSelectedServer()
    local main_servid       = selSerInfo and selSerInfo.mainServerId
    local main_server_name  = selSerInfo and selSerInfo.mainServerName
    
    dataParam.properities.main_servid = tostring(main_servid) or tostring(server_id)
    dataParam.properities.main_server_name = tostring(main_server_name) or tostring(server_name)

    global.L_DataRePort:SendRePortData(dataParam)
end

-- 任务数据 (直接上报ali)
function DataRePortProxy:RoleTask(data)
    if not self:CheckValid() then
        return
    end

    if not data or not data.taskid then
        return
    end
    
    local starTime = 0
    local endTime = 0
    if data.flag == 0 or data.flag == 2 or data.flag == 3 then
        endTime = os.time()
    else
        return
    end

    if not global.L_DataRePort then
        return
    end

    local taskName          = ""
    local headData          = data.oldHead or data.head
    if headData and headData.content then
        taskName = headData.content
    end
    taskName                = string.gsub(taskName,"<font .->","")  --替换<font *****>
    taskName                = string.gsub(taskName,"</font>","")    --替换</font>

    local AuthProxy         = global.Facade:retrieveProxy(global.ProxyTable.AuthProxy)
    local loginProxy        = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local PlayerProperty    = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local dataParam = {
        event={time=os.time(),name = "role_task",type = "track"},
        user={id=tostring( AuthProxy:GetUID() )},
        properities={
            servid=tostring(loginProxy:GetSelectedServerId()),
            server_name=tostring(loginProxy:GetSelectedServerName()),
            role_id=tostring(PlayerProperty:GetRoleUID()),
            role_name=PlayerProperty:GetName(),
            role_level=PlayerProperty:GetRoleLevel(),
            task_id = data.taskid,
            task_name = taskName,
            start_time = starTime,
            end_time = endTime,
            flag = data.flag,
        }
    }

    local selSerInfo        = loginProxy:GetSelectedServer()
    local main_servid       = selSerInfo and selSerInfo.mainServerId
    local main_server_name  = selSerInfo and selSerInfo.mainServerName
    
    dataParam.properities.main_servid = tostring(main_servid) or tostring(server_id)
    dataParam.properities.main_server_name = tostring(main_server_name) or tostring(server_name)

    global.L_DataRePort:SendRePortData(dataParam)
end

-- 自定义数据上报 (直接上报ali)
function DataRePortProxy:ReportCustomEvent(data)
    if not self:CheckValid() then
        return
    end

    if not data then
        return
    end

    local AuthProxy = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
    local dataParam = {
        event={time=os.time(),name = data.event_name or "",type = "track"},
        properities=data.map,
        user_id=tostring( AuthProxy:GetUID() ),
    }

    global.L_DataRePort:SendRePortData(dataParam)
end

-- 主界面按钮/图片点击上报
function DataRePortProxy:MainUIClickEvent(data)
    if not self:CheckValid() then
        return
    end

    if not data then
        return
    end
    
    local AuthProxy         = global.Facade:retrieveProxy(global.ProxyTable.AuthProxy)
    local loginProxy        = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local PlayerProperty    = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local PShowAttType      = GUIFunction:PShowAttType()
    local dataParam = {
        event={time=os.time(),name = "click_xmb",type = "track"},
        user={id=tostring( AuthProxy:GetUID() )},
        properities={
            servid=tostring(loginProxy:GetSelectedServerId()),
            server_name=tostring(loginProxy:GetSelectedServerName()),
            job_id=tostring(PlayerProperty:GetRoleJob()),
            job_name=tostring(PlayerProperty:GetRoleJobName()),
            role_id=tostring(PlayerProperty:GetRoleUID()),
            role_name=PlayerProperty:GetName(),
            role_level=PlayerProperty:GetRoleLevel(),
            consumable_grade=PlayerProperty:GetRoleReinLv(),
            role_att=PlayerProperty:GetRoleAttByAttType(PShowAttType.Max_ATK) or 0,
            main_id=data.index or "",
            node_id=data.id or "",
            func_tag=data.link or "",
        }
    }

    global.L_DataRePort:SendRePortData(dataParam)
end

----------------------云真机  货币上报begin------------------------------
function DataRePortProxy:SetCloundCheckMoneyList(data)
    -- body
    if data and data[1] then
        local cloudList = {}
        local moneyIdNmber = 0
        for k,moneyId in ipairs(data) do
            moneyIdNmber = tonumber(moneyId)
            if moneyIdNmber then
                cloudList[moneyIdNmber] = moneyIdNmber
            end
        end

        if moneyIdNmber and moneyIdNmber > 0 then
            self.m_cloudMoneyList = cloudList
            self:InitCloudMoney()
        end
    end
end

function DataRePortProxy:InitCloudMoney()
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        if self.m_moneyScheduleID then
            UnSchedule(self.m_moneyScheduleID)
            self.m_moneyScheduleID = nil
        end

        self.m_moneyMaxID = 99              --货币的最大道具id
        self.m_moneys = {}                  --监听的money
        self.m_moneyScheduleID = nil        --监听事件ID
        self.m_moneyListenTimes = 5 * 60    --5分钟

        local MoneyProxy = global.Facade:retrieveProxy(global.ProxyTable.MoneyProxy)
        for k,moneyID in pairs(self.m_cloudMoneyList) do
            if moneyID < self.m_moneyMaxID then
                if not self.m_moneys[moneyID] then
                    local itemMeonyData = SL:GetMetaValue("ITEM_DATA", moneyID)
                    if itemMeonyData and itemMeonyData.Name then
                        self.m_moneys[moneyID] = {
                            currencyId = moneyID,
                            currencyNum = MoneyProxy:GetMoneyCountById(moneyID) or 0,
                            currencyName = itemMeonyData.Name
                        }
                    end
                end
            end
        end

        self.m_moneyScheduleID = Schedule(function()
            self:ReportCloudMoney()
        end,self.m_moneyListenTimes)

        releasePrint("=======InitCloudMoney")
    end
end

function DataRePortProxy:ReportCloudMoney()
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        -- 经验不在监听范围内
        local MoneyProxy = global.Facade:retrieveProxy(global.ProxyTable.MoneyProxy)
        local ExpID      = MoneyProxy:GetMoneyType().Exp
        -- 重新获取下  有些没按照顺序注销配置就不是数组了
        local moneyList = {}
        local count     = 0
        for k,v in pairs(self.m_moneys) do
            if v.currencyId == ExpID then
                v.currencyNum = SL:GetMetaValue("EXP")
            end
            count = count + 1
            moneyList[count] = v
        end

        if count > 0 then
            local AuthProxy = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
            AuthProxy:RequestCloudMoney( cjson.encode(moneyList) )
        end

        releasePrint("=======ReportCloudMoney")
    end
end

function DataRePortProxy:HandlerOnEnterWorld()
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        -- 检测云机货币列表
        local AuthProxy = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
        AuthProxy:RequestCloudMoneyCheckList()

        releasePrint("=======*HandlerOnEnterWorld")
    end
end

function DataRePortProxy:HandlerOnUpdateMoney( data )
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        if not data or not self.m_moneyMaxID then
            return
        end

        local moneyID = data.id
        if moneyID  > self.m_moneyMaxID then
            return
        end

        if not self.m_cloudMoneyList or not self.m_cloudMoneyList[moneyID] then
            return
        end

        if not self.m_moneys then
            self.m_moneys = {}
        end

        if not self.m_moneys[moneyID] then
            self.m_moneys[moneyID] = {
                currencyId = data.id,
                currencyNum = 0,
                currencyName = SL:GetMetaValue("ITEM_NAME", moneyID)
            }
        end

        if data.count and self.m_moneys[moneyID].currencyNum ~= data.count then
            self.m_moneys[moneyID].currencyNum = data.count
        end
    end
end

----------------------云真机  货币上报end------------------------------

function DataRePortProxy:onRemove()
    -- 检测是否云手机
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        SL:UnRegisterLUAEvent(LUA_EVENT_ENTER_WORLD, "DataRePortProxy")
        SL:UnRegisterLUAEvent(LUA_EVENT_MONEYCHANGE, "DataRePortProxy")
    end

    DataRePortProxy.super.onRemove(self)
end

function DataRePortProxy:onRegister()
    -- 检测是否云手机
    if global.L_GameEnvManager:GetEnvDataByKey("isCloudLogin") then
        SL:RegisterLUAEvent(LUA_EVENT_ENTER_WORLD, "DataRePortProxy", handler(self, self.HandlerOnEnterWorld))
        SL:RegisterLUAEvent(LUA_EVENT_MONEYCHANGE, "DataRePortProxy", handler(self, self.HandlerOnUpdateMoney))
    end

    DataRePortProxy.super.onRegister(self)
end

return DataRePortProxy