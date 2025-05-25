local AppViewNameChangeCommand = class('AppViewNameChangeCommand', framework.SimpleCommand)

function AppViewNameChangeCommand:ctor()
end
-- 分辨率改变  游戏内调整
function AppViewNameChangeCommand:execute(notification)
    local data = notification:getBody()

    local appName = data and data.appName

    local isTest  = data and data.isTest

    if not global.isWindows then
        return
    end

    local envProxy = global.Facade:retrieveProxy( global.ProxyTable.GameEnvironment )
    if isTest and global.isDebugMode and SL:GetMetaValue("PLATFORM_WINDOWS") and tonumber(envProxy:GetChannelID()) == 1 then
        local currentModule = global.L_ModuleManager:GetCurrentModule()
        local moduleGameEnv = currentModule:GetGameEnv()
        local server        = moduleGameEnv:GetSelectedServer()
        local viewName      = global.L_GameEnvManager:GetEnvDataByKey("viewName")
        if viewName then
            appName = string.format( "%s-%s", viewName, server.serverName)
        else
            appName = server.serverName
        end

        local AuthProxy= global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
        local MapProxy = global.Facade:retrieveProxy(global.ProxyTable.Map)
        local userName = AuthProxy:GetUsername() or ""
        local userId   = AuthProxy:GetUID() or ""
        local mapId    = MapProxy and MapProxy:GetMapID()

        local LoginProxy  = global.Facade:retrieveProxy(global.ProxyTable.Login)
        local ip          = LoginProxy:GetSelectedServerIp()
        local port        = LoginProxy:GetSelectedServerPort()
        local proxyport   = LoginProxy:GetSelectedServerProxyPort()
        local connectPort = tonumber(proxyport or port)

        if mapId then
            appName = string.format("%s—账号:%s—UID:%s—地图:%s—IP:%s—端口:%s", appName, userName, userId, mapId, ip or "", connectPort or "")
        else
            appName = string.format("%s—账号:%s—UID:%s—IP:%s—端口:%s", appName, userName, userId, ip or "", connectPort or "")
        end

    end

    if not appName then
        return
    end

    local glview   = cc.Director:getInstance():getOpenGLView()
    if not glview then
        return
    end
    glview:setViewName(appName)
end

return AppViewNameChangeCommand