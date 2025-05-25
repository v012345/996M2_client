local DebugProxy = requireProxy("DebugProxy")
local ThrowDamageNumProxy = class("ThrowDamageNumProxy", DebugProxy)
ThrowDamageNumProxy.NAME = global.ProxyTable.ThrowDamageNumProxy

ThrowDamageNumProxy.PARAM_TYPE = {
    TIME_PARAM     = 1,
    ANCHOR_PARAM   = 2,

    MOVEBY_ACTION  = 3,
    SCALETO_ACTION = 4,
    FADETO_ACTION  = 5,
    DELAY_ACTION   = 6,

    MAX            = 6,
}

local duration = 0.2


--[[
    自己的参数字段名:own_param
    其他人的参数字段名:other_param

    参数说明:
    TIME_PARAM     = 1
    时间变量(1#多少秒)

    ANCHOR_PARAM   = 2,
    锚点(2#x#Y)
    左下角为(0,0),右上角为(1,1)

    MOVEBY_ACTION  = 3,
    移动(3#X#Y)

    SCALETO_ACTION = 4,
    缩放(4#value)
    value范围为:0-1

    FADETO_ACTION  = 5,
    透明度(5#value)
    value范围为:0-1

    DELAY_ACTION   = 6,
    等待时间(6#多少秒)

]]--



function ThrowDamageNumProxy:ctor()
    ThrowDamageNumProxy.super.ctor(self)
    self._config = {}
end

function ThrowDamageNumProxy:onRegister()
    ThrowDamageNumProxy.super.onRegister(self)
end

function ThrowDamageNumProxy:LoadConfig()
    self._config = requireGameConfig("cfg_damage_number")
end

function ThrowDamageNumProxy:GetConfig( type )
    if not type then
        return nil
    end

    return self._config[type]
end

function ThrowDamageNumProxy:IsThrowNum( type )
    local config = self:GetConfig( type )
    if not config then
        return false
    end

    return config.type == 1
end

function ThrowDamageNumProxy:GetThrowShowType( type )
    local config = self:GetConfig( type )
    if not config then
        return false
    end

    return config.type
end

function ThrowDamageNumProxy:GetAnimID( type )
    local config = self:GetConfig( type )
    if not config then
        return nil
    end

    if config.animID and config.animID ~= 0 then
        return config.animID
    end

    return nil
end

function ThrowDamageNumProxy:IsShake( type )
    local config = self:GetConfig( type )
    if not config then
        return false
    end

    return config.shake == 1
end

-- 低血预警
function ThrowDamageNumProxy:IsBeDamaged( type )
    local config = self:GetConfig( type )
    if not config then
        return false
    end

    return config.damage_type == 1
end

function ThrowDamageNumProxy:GetOwnActionData( type )
    local config = self:GetConfig( type )
    if not config then
        return nil
    end

    if not config.ownData then
        config.ownData = self:parseAllStepParam( config.own_param )
    end

    return config.ownData
end

function ThrowDamageNumProxy:GetOtherActionData( type )
    local config = self:GetConfig( type )
    if not config then
        return nil
    end

    if not config.otherData then
        config.otherData = self:parseAllStepParam( config.other_param )
    end

    return config.otherData
end

function ThrowDamageNumProxy:GetOffsetData( type )
    local config = self:GetConfig( type )
    if not config then
        return nil
    end

    if not config.offsetData then
        config.offsetData = self:parseOffsetParam( config.offset_param )
    end

    return config.offsetData
end

local function checkSplitParam( param )
    if not param or string.len( param ) <= 0 then
        return false
    end

    return true
end

function ThrowDamageNumProxy:parseAllStepParam( all_steps_param )
    if not checkSplitParam( all_steps_param ) then
        return {}
    end

    -- 1#X#Y|2#0.5|3#0.5|1#X#Y&1#X#Y
    local steps_actions = {}
    local steps_param = string.split( all_steps_param, "&" )
    for _, step_param in ipairs( steps_param ) do               -- steps
        if checkSplitParam( step_param ) then
            local actions = {}
            local actions_param = string.split( step_param, "|" )
            for _, action_param in ipairs( actions_param ) do   -- actions
                if checkSplitParam( action_param ) then
                    local param = string.split( action_param, "#" )
                    if #param > 0 then
                        local action_data = self:parseActionParam( param )
                        if action_data then
                            table.insert( actions, action_data )
                        end
                    end
                end
            end

            if #actions > 0 then
                table.insert( steps_actions, actions )
            end
        end
    end

    return steps_actions
end

function ThrowDamageNumProxy:parseActionParam( param )
    if (not param) or (#param <= 0) then
        return nil
    end

    local paramType = tonumber(param[1])
    if not paramType or paramType < 1 or paramType > self.PARAM_TYPE.MAX then
        return nil
    end

    local ret = { type = paramType }
    if paramType == self.PARAM_TYPE.ANCHOR_PARAM or paramType == self.PARAM_TYPE.MOVEBY_ACTION then
        ret.x = tonumber( param[2] or 0 )
        ret.y = tonumber( param[3] or 0 )
        ret.duration = duration
    elseif paramType == self.PARAM_TYPE.TIME_PARAM then
        duration = tonumber( param[2] ) or 0.2
    else
        ret.value = tonumber( param[2] ) or 1
        ret.duration = duration
    end

    return ret
end

function ThrowDamageNumProxy:parseOffsetParam( param )
    if not checkSplitParam( param ) then
        return {}
    end

    local ret = {}
    -- push origin pos
    table.insert( ret, cc.p( 0, 0 ) )

    local all_offsets_param = string.split( param, "|" )
    for _, offset_param in ipairs( all_offsets_param ) do
        local offset = string.split( offset_param, "#" )
        table.insert( ret, cc.p( tonumber( offset[1] ) or 0, tonumber( offset[2] ) or 0 ) )
    end

    return ret
end

function ThrowDamageNumProxy.OnUnloaded()
    local facade = global.Facade
    facade:removeProxy(ThrowDamageNumProxy.NAME)
end

function ThrowDamageNumProxy.Onloaded()
    local proxy = ThrowDamageNumProxy.new()
    global.Facade:registerProxy(proxy)
end


return ThrowDamageNumProxy
