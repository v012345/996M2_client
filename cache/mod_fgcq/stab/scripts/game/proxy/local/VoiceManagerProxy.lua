local DebugProxy = requireProxy("DebugProxy")
local VoiceManagerProxy = class("VoiceManagerProxy", DebugProxy)
VoiceManagerProxy.NAME = global.ProxyTable.VoiceManagerProxy

VoiceManagerProxy.VOICE_TYPE = {
    INIT                    = 1,            --初始化
    GUILD_CHANGE            = 2,            --行会更变
    GUILD_ROLE_CHANGE       = 3,            --行会角色更变
    TEAM                    = 4,            --组队操作
    EXIT                    = 5,            --游戏退出
    TEAM_UPDATE             = 6,            --队伍队长信息刷新  --针对2.0
}

-- 1创建队伍 2解散队伍 3加入队伍 4离开队伍 5换队长  6行会角色信息同步  7踢人
local TEAM_CHANGE_NEW= {
    CREATE          = 1,
    DISMISS         = 2,
    JOIN_IN         = 3,
    LEAVE           = 4,
    UPDATE          = 5,
    SYNC_UPATE      = 6,                    -- 行会角色信息同步
    REMOVE          = 7,                    -- 踢人
}

local GUILD_CHANGE_NEW = {
    CREATE          = 1,                    -- 创建
    DISMISS         = 2,                    -- 解散
    JOIN_IN         = 3,                    -- 加入
    LEAVE           = 4,                    -- 离开
    UPDATE          = 5,                    -- 职位变更
    SYNC_UPATE      = 6,                    -- 行会角色信息同步
    REMOVE          = 7,                    -- 踢人
}

-- 游戏+区服唯一标识
local function GetUniqueId()
    local loginProxy    = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local currModule    = global.L_ModuleManager:GetCurrentModule()
    local gameid        = currModule:GetOperID()
    local serverId      = loginProxy:GetSelectedServerId()
    return string.format("%s%s",gameid,serverId)
end

function VoiceManagerProxy:ctor()
    VoiceManagerProxy.super.ctor(self)

    -- ios旋转屏幕会调用初始化， 暂时没找到问题， 做个状态检测
    self.isInit = false
end

--[[
    GameInfo {
        // 游戏id
        var gameId: Int = 0
        // 游戏名称
        var gameName: String = ""
        // 区服名
        var gameServer: String = ""
        // 行会id
        var guildId: Int = 0
        // 行会名称
        var guildName: String = ""
        // 头像
        var headImg: String = ""
        // 角色id 0会长 1副会长 2其他
        var roleId: Int = 2
        // 区服id
        var serverId: Int = 0
        // 游戏+区服唯一标识
        var uniqueId: String = ""
        // 人员id
        var userId: Int = 0
        // 用户昵称
        var userName: String = ""
        // 组队角色id 0队长 2其他 非必传
        var teamRoleId: Int = 2
        // 组队id，非必传
        var teamId: Int = 0
    }
]]

function VoiceManagerProxy:VoiceInit( msgData )
    if self.isInit then
        return
    end

    self.isInit = true

    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.INIT         --初始化类型
    }

    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
    local loginProxy            = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local GuildProxy            = global.Facade:retrieveProxy( global.ProxyTable.GuildProxy )
    local GuildPlayerProxy      = global.Facade:retrieveProxy( global.ProxyTable.GuildPlayerProxy )
    local TeamProxy             = global.Facade:retrieveProxy( global.ProxyTable.TeamProxy )
    local propertyProxy         = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )

    local isBoxLogin    = global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") and global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") == 1 --盒子登录
    data.enterType      = isBoxLogin and 1 or 0 --0 游戏   1 盒子
    -- data.emOptions      = nil  --环信初始化配置,非必传
    if isBoxLogin then
        data.boxUserId  = AuthProxy:GetUID()
    end

    local GameInfo      = {} --游戏相关信息  必传
    local currModule    = global.L_ModuleManager:GetCurrentModule()
    local gameid        = currModule:GetOperID() 
    GameInfo.gameId     = gameid
    GameInfo.gameName   = currModule:GetName()
    GameInfo.gameServer = loginProxy:GetSelectedServerName()
    GameInfo.guildId    = GuildPlayerProxy:GetGuildId()
    GameInfo.guildName  = GuildPlayerProxy:GetGuildName()
    GameInfo.headImg    = ""
    local guildJob      = GuildPlayerProxy:GetRank() or 0
    guildJob            = guildJob - 1
    GameInfo.roleId     = (guildJob > 2 or guildJob < 0) and 2 or guildJob
    GameInfo.serverId   = loginProxy:GetSelectedServerId()
    GameInfo.uniqueId   = GetUniqueId()  -- 游戏+区服唯一标识
    GameInfo.userId     = global.playerManager:GetMainPlayerID()
    GameInfo.userName   = propertyProxy:GetName()
    GameInfo.teamRoleId = ""
    GameInfo.teamId     = 0
    GameInfo.account    = AuthProxy:GetUID()
    GameInfo.guildNumber= GuildProxy:GetGuildMember()

    data.GameInfo       = GameInfo

    if GameInfo.roleId == 0 then --会长传创建行会的时间戳
        GameInfo.guildCreateTime = GuildPlayerProxy:GetGuildCreateTime()
    end

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice( data )

    self:VoiceInit_New()
end

function VoiceManagerProxy:VoiceGuildChange( msgData )
    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE         --行会变更类型
    }
   
    local GuildPlayerProxy      = global.Facade:retrieveProxy(global.ProxyTable.GuildPlayerProxy)
    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )

    data.operatorType           = msgData.operatorType
    data.guildId                = msgData.guildId or GuildPlayerProxy:GetGuildId()
    data.uniqueId               = GetUniqueId()    --游戏+区服唯一标识
    data.userId                 = global.playerManager:GetMainPlayerID()

    if msgData.operatorType == GuildPlayerProxy.ChangeType.CREATE then --如果是创建就传创建时间戳
        data.guildCreateTime = GuildPlayerProxy:GetGuildCreateTime()
        data.guildName       = GuildPlayerProxy:GetGuildName()
    end

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice( data )
end

function VoiceManagerProxy:VoiceGuildRoleChange( msgData )
    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.GUILD_ROLE_CHANGE         --行会角色变更类型
    }

    local GuildPlayerProxy      = global.Facade:retrieveProxy(global.ProxyTable.GuildPlayerProxy)
    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )

    data.guildId                = GuildPlayerProxy:GetGuildId()
    local guildJob              = GuildPlayerProxy:GetRank() or 0
    guildJob                    = guildJob - 1
    data.roleId                 = (guildJob > 2 or guildJob < 0) and 2 or guildJob
    data.uniqueId               = GetUniqueId()   --游戏+区服唯一标识
    data.userId                 = global.playerManager:GetMainPlayerID()

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice( data )
end

function VoiceManagerProxy:VoiceTeam( msgData )
    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.TEAM         --组队操作
    }

    local TeamProxy             = global.Facade:retrieveProxy(global.ProxyTable.TeamProxy)
    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )

    data.guildId                = msgData.teamId or TeamProxy:GetTeamLeaderId() --队伍id
    data.operatorType           = msgData.operateType --0创建队伍  1解散队伍 2加入队伍 3离开队伍
    local job                   = msgData.myRank or TeamProxy:GetMyRank() --1 队长 0其它
    job                         = job == 1 and 0 or 2
    data.roleId                 = job --0队长 2其他
    data.uniqueId               = GetUniqueId() --游戏+区服唯一标识
    data.userId                 = msgData.teamUserId or global.playerManager:GetMainPlayerID()

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice( data )
end

function VoiceManagerProxy:VoiceExit( msgData )
    self.isInit = false

    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.EXIT         --退出
    }

    local GuildPlayerProxy      = global.Facade:retrieveProxy(global.ProxyTable.GuildPlayerProxy)
    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )

    data.guildId                = GuildPlayerProxy:GetGuildId()
    data.uniqueId               = GetUniqueId() --游戏+区服唯一标识
    data.userId                 = global.playerManager:GetMainPlayerID()

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice( data )

    self:VoiceExit_New()
end


-----------------------------------------new Voice 2.0  begin-----------------------------------------------------
function VoiceManagerProxy:GetVoiceNormalData_New()
    local data = {}

    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )
    local loginProxy            = global.Facade:retrieveProxy( global.ProxyTable.Login )
    local GuildProxy            = global.Facade:retrieveProxy( global.ProxyTable.GuildProxy )
    local GuildPlayerProxy      = global.Facade:retrieveProxy( global.ProxyTable.GuildPlayerProxy )
    local TeamProxy             = global.Facade:retrieveProxy( global.ProxyTable.TeamProxy )
    local propertyProxy         = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local currModule            = global.L_ModuleManager:GetCurrentModule()

    local guildId               = GuildPlayerProxy:GetGuildId()
    local teamId                = TeamProxy:GetTeamLeaderId()
    local guildRoleType         = GuildPlayerProxy:GetRank()
    local teamRoleType          = TeamProxy:GetMyRank()
    data.gameId                 = tostring(currModule:GetOperID())
    data.serverId               = loginProxy:GetSelectedServerId()
    data.userId                 = tostring( AuthProxy:GetUID() )
    data.roleId                 = global.playerManager:GetMainPlayerID()
    data.roleName               = loginProxy:GetSelectedRoleName()


    if guildId and string.len(guildId) > 0 then
        data.guildId = guildId
    end

    if teamId and teamId ~= 0 then
        data.teamId = teamId
    end

    if data.guildId then
        data.roleType = guildRoleType  -- 1 会长  2 副会长  3 成员
        if guildRoleType ~= 1 and guildRoleType ~= 2 then
            data.roleType = 3
        end
    end

    if data.teamId then
        data.teamRoleType = teamRoleType
        if teamRoleType ~= 1 then
            data.teamRoleType = 3
        end
    end

    return data
end

-- 初始化
function VoiceManagerProxy:VoiceInit_New( msgData )
    local data = self:GetVoiceNormalData_New()
    data.voiceType = VoiceManagerProxy.VOICE_TYPE.INIT  -- 初始化类型

    data.printName = "初始化"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end
--[[
    行会操作：
    1、会长-创建行会   由会长调 operationType-1  roleType  changeRoleType  changeRoleId都传会长本人id或type
    2、会长-解散行会   由会长调 operationType-2  roleType  changeRoleType  changeRoleId都传会长本人id或type
    3、成员新加入行会    由成员调  operationType-3 roleType  changeRoleType  changeRoleId都传成员本人id或type
    4、成员/副会长主动离开行会   由成员/副会长调  operationType-4  roleType  changeRoleType  changeRoleId都传成员/副会长本人id或type
    5、行会角色变更  会长转让 由会长调 perationType-5  roleType传会长转让后type  changeRoleType  changeRoleId都传新会长id或type
    5、行会角色变更  会长指定职位变更 由会长调 operationType-5  roleType传会长type  changeRoleType  changeRoleId都传新职位的id或type
    6、行会角色信息同步 使用改名卡的人调用 operationType-6 roleType  changeRoleType  changeRoleId都传本人id或type
    7、会长/副会长踢人 由会长/副会长调  operationType-7  roleType传会长/副会长type  changeRoleType  changeRoleId传被踢者的type和ID
]]

-- 创建行会
function VoiceManagerProxy:VoiceGuildCreate_New( msgData )
    if not msgData then
        msgData = {}
    end

    local data = self:GetVoiceNormalData_New()
    if data.roleType ~= 1 then
        return
    end

    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.CREATE
    data.changeRoleType = data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = data.roleId

    data.printName = "创建行会"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 解散行会
function VoiceManagerProxy:VoiceGuildDisMiss_New( msgData )
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.DISMISS
    data.changeRoleType = data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = data.roleId
    data.guildId        = msgData.guildId

    data.printName = "解散行会"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 新加入行会
function VoiceManagerProxy:VoiceGuildJoinIn_New( msgData )
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.JOIN_IN
    data.changeRoleType = data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = data.roleId

    data.printName = "加入行会"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 离开行会
function VoiceManagerProxy:VoiceGuildLeave_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.LEAVE
    data.changeRoleType = data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = data.roleId
    data.guildId        = msgData.guildId

    data.printName = "离开行会"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 行会角色职业变更  由之前的会长操作
function VoiceManagerProxy:VoiceGuildRankChange_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    -- 1 会长  2 副会长  3 成员
    if msgData.newRank then
        if msgData.newRank ~= 1 and msgData.newRank ~= 2 then
            msgData.newRank = 3
        end
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_ROLE_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.UPDATE
    data.changeRoleType = msgData.newRank or data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = msgData.guildRoleId or data.roleId -- userid

    data.printName = "行会角色职业变更"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 行会角色信息同步
function VoiceManagerProxy:VoiceGuildSyncChange_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.SYNC_UPATE
    data.changeRoleType = data.roleType   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = data.roleId

    data.printName = "行会角色信息同步"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 行会踢人
function VoiceManagerProxy:VoiceGuildRemove_New( msgData )
    if not msgData then
        msgData = {}
    end

    -- 1 会长  2 副会长  3 成员
    if msgData.removeRank then
        if msgData.removeRank ~= 1 then
            msgData.removeRank = 3
        end
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.GUILD_CHANGE
    data.operationType  = GUILD_CHANGE_NEW.REMOVE
    data.changeRoleType = msgData.removeRank   -- 1 会长  2 副会长  3 成员
    data.changeRoleId   = msgData.guildRoleId

    data.printName = "行会踢人"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

--[[
    组队操作：
    1、队长-创建组队  由队长调 operationType-1  teamRoleType changeRoleType  changeRoleId都传队长本人id或type
    2、队长-解散行会   由队长调 operationType-2  teamRoleType changeRoleType  changeRoleId都传队长本人id或type
    3、成员新加入组队  由成员调  operationType-3 teamRoleType changeRoleType  changeRoleId都传成员本人id或type
    4、成员离开组队   由成员调  operationType-4 teamRoleType changeRoleType  changeRoleId都传成员本人id或type
    5、队长角色变更（队长离开队伍/转让队长给成员）统一由新队长调用  老队长不用调 operationType-5 teamRoleType changeRoleType  changeRoleId都传新队长本人id或type
    6、组队角色信息同步 使用改名卡的人调用 operationType-6 teamRoleType changeRoleType  changeRoleId都传本人id或type
    7、队长踢人 由队长调  operationType-7  teamRoleType 传队长type  changeRoleType  changeRoleId传被踢者的type和ID
]]
-- 队伍创建
function VoiceManagerProxy:VoiceTeamCreate_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.CREATE
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = data.roleId

    data.printName = "队伍创建"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队伍解散
function VoiceManagerProxy:VoiceTeamDisMiss_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.DISMISS
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = data.roleId

    data.printName = "队伍解散"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队伍新队员加入
function VoiceManagerProxy:VoiceTeamJoinIn_New( msgData )
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.JOIN_IN
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = data.roleId

    data.printName = "队伍新队员加入"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队员离开
function VoiceManagerProxy:VoiceTeamLeave_New( msgData )
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.LEAVE
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = data.roleId

    data.printName = "队伍队员离开"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队伍职位变更  由新队长操作
function VoiceManagerProxy:VoiceTeamRankChange_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.UPDATE
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = msgData.roleId or data.roleId

    data.printName = "队伍职位变更"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队伍角色信息同步
function VoiceManagerProxy:VoiceTeamSyncChange_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.SYNC_UPATE
    data.changeRoleType = data.teamRoleType   -- 1 队长 3 队员
    data.changeRoleId   = msgData.roleId or data.roleId

    data.printName = "队伍角色信息同步"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队伍踢人  队长操作
function VoiceManagerProxy:VoiceTeamRemove_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM
    data.operationType  = TEAM_CHANGE_NEW.REMOVE
    data.changeRoleType = 3   -- 1 队长 3 队员
    data.changeRoleId   = msgData.teamRoleId   --队员id

    data.printName = "队伍踢人"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-- 队长更换  其他成员操作
function VoiceManagerProxy:VoiceTeamUpdate_New( msgData )
    -- body
    if not msgData then
        msgData = {}
    end

    if msgData.newRank then
        if msgData.newRank ~= 1 then
            msgData.newRank = 3
        end
    end

    local data          = self:GetVoiceNormalData_New()
    data.voiceType      = VoiceManagerProxy.VOICE_TYPE.TEAM_UPDATE
    data.operationType  = TEAM_CHANGE_NEW.UPDATE
    data.changeRoleType = 1   -- 1 队长 3 队员
    data.changeRoleId   = msgData.roleId or data.roleId

    data.printName = "更换队长"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

function VoiceManagerProxy:VoiceExit_New( msgData )
    local data = {
        voiceType = VoiceManagerProxy.VOICE_TYPE.EXIT         --退出
    }

    local GuildPlayerProxy      = global.Facade:retrieveProxy(global.ProxyTable.GuildPlayerProxy)
    local AuthProxy             = global.Facade:retrieveProxy( global.ProxyTable.AuthProxy )

    data.guildId                = GuildPlayerProxy:GetGuildId()
    data.uniqueId               = GetUniqueId() --游戏+区服唯一标识
    data.userId                 = global.playerManager:GetMainPlayerID()

    data.printName = "退出"

    local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
    NativeBridgeProxy:GN_Voice_New( data )
end

-----------------------------------------new Voice 2.0  end-----------------------------------------------------

return VoiceManagerProxy
