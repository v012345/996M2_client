local RemoteProxy = requireProxy("remote/RemoteProxy")
local BuffProxy = class("BuffProxy", RemoteProxy)
BuffProxy.NAME = global.ProxyTable.Buff

BuffProxy.DIS_ACTION_TYPE = {
    NO_WALK = 1,        --禁止走
    NO_RUN  = 2,        --禁止跑
    NO_ATTACK = 3,      --禁止平砍动作技能（不要按照普攻）
    NO_MAGIC = 4,       --禁止施法动作技能
    NO_USE_ITEM = 5,    --禁止使用物品
    NO_CHAT = 6,        --禁止说话
}

function BuffProxy:ctor()
    BuffProxy.super.ctor(self)
    
    self._data = {}
    self._config = {}
    self._buff_config_sfx = {}
    
    self._auto_skill_buff = {}
    self._launch_skill_buff = {}
end

function BuffProxy:RegisterMsgHandler()
    BuffProxy.super.RegisterMsgHandler(self)
end

function BuffProxy:LoadConfig()
    self._config = requireGameConfig("cfg_buff")

    for k, v in pairs(self._config or {}) do
        local parseArray = string.split(v.RSRules or "", "#")
        for i, iv in ipairs(parseArray) do
            local skillID = tonumber(iv)
            if skillID then
                if not self._auto_skill_buff[skillID] then
                    self._auto_skill_buff[skillID] = {}
                end
                self._auto_skill_buff[skillID][v.ID] = v.ID
            end
        end

        parseArray =  string.split(v.target_no_skill_launch or "", "#")
        for i, iv in ipairs(parseArray) do
            local skillID = tonumber(iv)
            if skillID then
                if not self._launch_skill_buff[skillID] then
                    self._launch_skill_buff[skillID] = {}
                end
                self._launch_skill_buff[skillID][v.ID] = v.ID
            end
        end
    end
end

function BuffProxy:GetConfig()
    return self._config
end

function BuffProxy:GetConfigByID( id )
    return self._config[id]
end

-- 自动释放时身上有哪些buff时不能释放
function BuffProxy:GetNoSkillAuto( skillID )
    return self._auto_skill_buff[skillID]
end

-- 手动释放时有身上有哪些buff时不能释放
function BuffProxy:GetNoSkillLaunch( skillID )
    return self._launch_skill_buff[skillID]
end

-- 手动释放时不能释放时的提示
function BuffProxy:GetNoSkillBuffTitle( buffid )
    local config = self._config[buffid]
    return config and config.target_buff_title
end

-- 获取音效声音
function BuffProxy:GetAudio( buffid )
    local config = self._config[buffid]
    return config and tonumber(config.buff_audio) or nil
end

-- 检测是否禁止动作, 位运算( 1:禁止走  2:禁止跑  4: 禁止普攻  8:禁止施法   16:禁止使用物品   32: 禁止说话)
function BuffProxy:CheckDisAction( dis_action, dis_action_type )
    if not tonumber(dis_action) or not tonumber(dis_action_type) then
        return false
    end

    return CheckBit( tonumber(dis_action), tonumber(dis_action_type) - 1 )
end

local function parseSfx( value )
    if not value then
        return nil
    end
    value = tostring(value)
    if string.len(value) == 0 then
        return nil
    end

    local offsetList = string.split(value, "|")
    value = offsetList[1]
    local unOffset = offsetList[2] and tonumber(offsetList[2]) or 0

    local slices    = string.split( value, "#" )
    local sfxID     = tonumber(slices[1]) or tonumber(slices[2])
    local loop      = tonumber(slices[3]) or 0
    local is8dir    = slices[4]
    local dirfollow = (tonumber(slices[5]) or 0) == 1
    return {sfxID = sfxID, loop = loop, is8dir = is8dir, dirfollow = dirfollow, unOffset = unOffset}
end

function BuffProxy:GetBuffSfxByID( id )
    local sfxConfig = self._buff_config_sfx[id]
    if sfxConfig then
        return sfxConfig
    end

    local config = self._config[id]
    if not config then
        return nil
    end

    sfxConfig = {
        front        = parseSfx(config.front_sfx),
        front_stuck  = parseSfx(config.front_sfx_stuck),
        behind       = parseSfx(config.behind_sfx),
        behind_stuck = parseSfx(config.behind_sfx_stuck),
        play_sfx     = {sfxID = tonumber(config.play_sfx), loop = 1, is8dir = false}
    }

    self._buff_config_sfx[id] = sfxConfig

    return sfxConfig
end

function BuffProxy:GetSfxOffset(id)
    local config = self._config[id]
    if not config then
        return cc.p(0,0)
    end

    local offsetxArray = string.split(config.offsetx or "", "#") 
    local offsetyArray = string.split(config.offsety or "", "#") 
    local offsetX = tonumber(offsetxArray[1]) or 0
    local offsetY = tonumber(offsetyArray[1]) or 0
    return cc.p(offsetX, offsetY)
end

-- 骑马buff特效偏移
function BuffProxy:GetHorseOffset(id)
    local config = self._config[id]
    if not config then
        return cc.p(0,0)
    end

    local offsetxArray = string.split(config.offsetx or "", "#") 
    local offsetyArray = string.split(config.offsety or "", "#") 
    local offsetX = tonumber(offsetxArray[2]) or 0
    local offsetY = tonumber(offsetyArray[2]) or 0
    return cc.p(offsetX, offsetY)
end

-- 骑马是否显示buff特效
function BuffProxy:IsHorseShow(id)
    local config = self._config[id]
    if not config then
        return true
    end

    local offsetxArray = string.split(config.offsetx or "", "#") 
    local offsetyArray = string.split(config.offsety or "", "#") 
    local showX = tonumber(offsetxArray[3]) or 1
    local showY = tonumber(offsetyArray[3]) or 1
    return showX == 1 and showY == 1
end

function BuffProxy:GetSfxSpeed(id)
    local config = self._config[id]
    if not config then
        return 1
    end

    return config.speed or 1
end

-- 是否配置avatar、scale、color
function BuffProxy:IsAvatarBuff( id )
    local config = self._config[id]
    if not config then
        return false
    end

    if config.color or config.buff_sacle or config.avatar then
        return true
    end

    return false
end

-- buff配置颜色
function BuffProxy:GetBuffColorByID( id )

    if id == global.MMO.BUFF_ID_POISONING_RED then
        return cc.c3b(128, 0x00, 0x00)
    elseif id == global.MMO.BUFF_ID_POISONING_GREEN then
        return cc.c3b(0x00, 128, 0x00)
    elseif id == global.MMO.BUFF_ID_THUNDER_SWORD then
        return cc.c3b(0xff, 0xff, 0x00)
    end

    local config = self._config[id]
    if not config or not config.color then
        return nil
    end

    return GetColorFromHexString( GET_COLOR_BYID( config.color ) )
end

-- buff 配置缩放
function BuffProxy:GetBuffScaleByID( id )
    local config = self._config[id]
    if not config then
        return nil
    end
    return tonumber( config.buff_sacle )
end

-- buff 配置变形
function BuffProxy:GetBuffAvatarByID( id )
    local config = self._config[id]
    if not config or not config.avatar then
        return nil
    end

    local avatarArray = string.split( config.avatar, "#" )
    local data = nil
    if avatarArray[2] then
        data = {}
        data.avatarType = tonumber(avatarArray[1])
        data.avatarID   = tonumber(avatarArray[2])
        data.avatarSex  = data.avatarType == 0 and tonumber(avatarArray[3]) or nil
    end
    return data
end

function BuffProxy:CheckUseItemEnable( typeID )
    local ret = true
    local buffid = nil
    for _, buffData in pairs( self._data ) do
        if not self:checkOneBuffUseItemEnable( buffData.id, typeID ) then
            ret = false
            buffid = buffData.id
            break
        end
    end

    return ret,buffid
end


function BuffProxy:CheckSkillEnable( skillID )
    local ret = true
    for _, buffData in pairs( self._data ) do
        if not self:checkOneBuffSkillEnable( buffData.id, skillID ) then
            ret = false
            break
        end
    end

    return ret
end


function BuffProxy:CheckMoveEnable()
    local ret = true
    for _, buffData in pairs( self._data ) do
        if not self:checkOneBuffMoveEnable( buffData.id ) then
            ret = false
            break
        end
    end

    return ret
end

function BuffProxy:CheckRunEnable()
    local ret = true
    for _, buffData in pairs( self._data ) do
        if not self:checkOneBuffRunEnable( buffData.id ) then
            ret = false
            break
        end
    end

    return ret
end

-- 检测聊天启用
function BuffProxy:CheckChatEnable()
    local ret = true
    local buffid = nil
    for _, buffData in pairs( self._data ) do
        if not self:checkOneBuffChatEnable( buffData.id ) then
            ret = false
            buffid = buffData.id
            break
        end
    end

    return ret
end

function BuffProxy:CheckExistControlBuff()
    for _, buffData in pairs( self._data ) do
        if self:checkOneBuffIsControlBuff( buffData.id ) then
            return true
        end
    end

    return false
end


function BuffProxy:checkOneBuffUseItemEnable( id, typeID )
    local config = self._config[id]
    if not config then
        return true
    end

    if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_USE_ITEM ) then
        return false
    end

    if nil == config.no_item or 0 == config.no_item then
        return true
    end
    
    if -1 == config.no_item then
        return false
    end

    local slices = string.split( tostring(config.no_item), "#" )
    local strTypeID = tostring( typeID )
    for _, value in ipairs( slices ) do
        if strTypeID == value then
            return false
        end
    end

    return true
end


function BuffProxy:checkOneBuffSkillEnable( id, skillID )
    local config = self._config[id]
    if not config then
        return true
    end

    local SkillProxy = global.Facade:retrieveProxy(global.ProxyTable.Skill)
    -- 冰冻 麻痹  技能忽略该buff
    local checkBit = {
        [global.MMO.BUFF_ID_FREEZED_GRAY] = {[1]=true,[3]=true},
        [global.MMO.BUFF_ID_ICE] = {[2]=true,[3]=true},
    }
    if checkBit[id] then
        local skillData  = SkillProxy:GetSkillByID(skillID) or {}
        local igornAct   = tonumber(skillData.IgornAct)
        if igornAct then
            local isEnable = false
            for k, v in pairs(checkBit[id]) do
                if CheckBit(igornAct, k-1) then
                    return true
                end
            end
        end
    end

    local skillConfig = SkillProxy:FindConfigBySkillID(skillID)
    if skillConfig then
        if skillConfig.action == 0 then
            if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_ATTACK ) then
                return false
            end
        else
            if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_MAGIC ) then
                return false
            end
        end
    end
    
    if -2 == config.no_skill or nil == config.no_skill then
        return true
    end                                          

    if -1 == config.no_skill then
        return false
    end

    local strSkillID = tostring( skillID )
    local slices = string.split( tostring(config.no_skill), "#" )
    for _, value in ipairs( slices ) do
        if strSkillID == value then
            return false
        end
    end

    return true
end


function BuffProxy:checkOneBuffMoveEnable( id )
    local config = self._config[id]
    if not config then
        return true
    end

    if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_WALK ) then
        return false
    end

    if 0 == config.no_move or nil == config.no_move then
        return true
    end

    if -1 == config.no_move then
        return false
    end

    return true
end

function BuffProxy:checkOneBuffRunEnable( id )
    local config = self._config[id]
    if not config then
        return true
    end

    if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_RUN ) then
        return false
    end

    if -2 == config.no_move then
        return false
    end

    return true
end

-- 检测说话启用
function BuffProxy:checkOneBuffChatEnable( id )
    local config = self._config[id]
    if not config then
        return true
    end

    if self:CheckDisAction( config.dis_action, BuffProxy.DIS_ACTION_TYPE.NO_CHAT ) then
        return false
    end

    return true
end

function BuffProxy:checkOneBuffIsControlBuff( id )
    local config = self._config[id]
    if not config then
        return false
    end

    return config.control_skill == 1
end


function BuffProxy:AddBuffItem( data, isHero )
    if isHero then
        local buffID = data.id
        local cofig = self:GetConfigByID( buffID )
        if cofig and cofig.bufftitle then
            ShowSystemTips( GET_STRING(310000501) .. cofig.bufftitle )
        end
        return
    end

    local moveEnable = self:CheckMoveEnable()

    local buffID = data.id

    -- set
    self._data[buffID] = data

    -- buff是否限制移动
    if moveEnable and not self:checkOneBuffMoveEnable(buffID) then
        global.Facade:sendNotification(global.NoticeTable.ForbiddenMoveBuffBegan, buffID)
    end

    -- buff 提示
    local cofig = self:GetConfigByID( buffID )
    if cofig and cofig.bufftitle then
        ShowSystemTips( cofig.bufftitle )
    end
end

function BuffProxy:RmvBuffItem( data )
    local buffID = data.id

    -- reset
    self._data[buffID] = nil

    -- buff是否限制移动
    local moveEnable = self:CheckMoveEnable()
    if moveEnable and not self:checkOneBuffMoveEnable(buffID) then
        global.Facade:sendNotification(global.NoticeTable.ForbiddenMoveBuffEnd, buffID)
    end
end

function BuffProxy:UpdateBuffItem( data )
    local buffID = data.id

    -- set
    self._data[buffID] = data
end


return BuffProxy
