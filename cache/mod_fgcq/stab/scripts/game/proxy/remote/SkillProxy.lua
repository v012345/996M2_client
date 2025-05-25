local RemoteProxy = requireProxy("remote/RemoteProxy")
local SkillProxy = class("SkillProxy", RemoteProxy)
SkillProxy.NAME = global.ProxyTable.Skill
local cjson     = require("cjson")
local optionsUtils = requireProxy( "optionsUtils" )
local socket = require("socket")

local function parseOneSkillData(data)
    data.id = data.MagicID
    data.DelayTime = data.DelayTime or 0
    
    -- extension
    data.isCD = false
    data.curTime = 0
    return data
end


function SkillProxy:ctor()
    SkillProxy.super.ctor(self)
    
    self._data = {}
    self._configs = {}

    --锁定技能是普攻，技能点击开启时，要进行释放（本来是内挂有设置优先级（设置为0），现在内挂好像乱了，这里就单独处理下）
    self._skill_on_launch = {
        [66] = 53,
        [26] = 16,
        [42] = -1,
        [43] = -1,
        [81] = -1
    } 

    self._double_skill_cd = {
        [26] = {
            swith_data = {id=global.MMO.SERVER_OPTION_BAN_DOUBLE_FIREHIT,value=1}
        }
    }  --双烈火cd

    self._skill_present_replace_id = {}     --替代表现数据

    self._skill_custon_skill_fighter = {}   --战士自定义攻击技能 

    self._skill_custom_skill = {}           --自定义技能

    self._isDelayLaunch     = false             -- 是否延迟(释放了一个技能之后延迟释放下一个技能)
    self._delayLauchEndTime = 0                 -- 记录延迟结束释放时的时间戳

    self._skillIgnoreMon = {}                   -- 技能忽略怪

    self._comboSkillLaunchID = nil              -- 释放连击ID
    
    self._canLaunchComboStatus = true           -- 可释放连击状态

    self._configs_skill_action = {}             -- 技能动作      
    
    self._specialXPSpellParam = {}              -- 特殊血魄消耗配置

    self._canLaunchComboStatus = true           -- 可释放连击状态                  
    
    self._mootebo_with_cd = 0                   -- 野蛮立即释放状态
    self._mootebo_with_hit_cd = 0               -- 野蛮技能释放技能动作状态可释放
    self:Init()
end

function SkillProxy:Init()
    -- self._configs = {
    --     -- global.MMO.SKILL_INDEX_BASIC    
    --     [0]  = {id = 0,  launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 普攻
    --     [1]  = {id = 1,  launchmode = 3, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 火球术
    --     [2]  = {id = 2,  launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 治愈术
    --     [3]  = {id = 3,  launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 基本剑术
    --     [4]  = {id = 4,  launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 精神力剑法
    --     [5]  = {id = 5,  launchmode = 3, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 大火球
    --     [6]  = {id = 6,  launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 2, lockTarget = 0, isline = 0,},      -- 施毒术
    --     [7]  = {id = 7,  launchmode = 5, action = 0, onoff = 1, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 攻杀
    --     [8]  = {id = 8,  launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 抗拒火环
    --     [9]  = {id = 9,  launchmode = 3, action = 1, onoff = 0, bestPos = 0, addition = 2, lockTarget = 0, isline = 1,},      -- 地狱火
    --     [10] = {id = 10, launchmode = 3, action = 1, onoff = 0, bestPos = 0, addition = 2, lockTarget = 0, isline = 1,},      -- 疾光电影
    --     [11] = {id = 11, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 雷电术
    --     [12] = {id = 12, launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 刺杀剑术
    --     [13] = {id = 13, launchmode = 3, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 灵魂火符
    --     [14] = {id = 14, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 幽灵盾     4
    --     [15] = {id = 15, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 神圣咒     4
    --     [16] = {id = 16, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 2, lockTarget = 0, isline = 0,},      -- 困魔咒
    --     [17] = {id = 17, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 召唤骷髅 4
    --     [18] = {id = 18, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 隐身术
    --     [19] = {id = 19, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 群体隐身术  4
    --     [20] = {id = 20, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 诱惑之光    4
    --     [21] = {id = 21, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 瞬息移动
    --     [22] = {id = 22, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 火墙
    --     [23] = {id = 23, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 爆裂火焰    4
    --     [24] = {id = 24, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 0, lockTarget = 1, isline = 0,},      -- 地狱雷光
    --     [25] = {id = 25, launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 半月弯刀
    --     [26] = {id = 26, launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1,},      -- 烈火剑法
    --     [27] = {id = 27, launchmode = 1, action = 1, onoff = 0, bestPos = 0, addition = 2, lockTarget = 0, isline = 1, maxDistance = 1},      -- 野蛮冲撞
    --     [28] = {id = 28, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 心灵启示
    --     [29] = {id = 29, launchmode = 4, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 群体治愈术
    --     [30] = {id = 30, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 召唤神兽
    --     [31] = {id = 31, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 魔法盾
    --     [32] = {id = 32, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 1, lockTarget = 0, isline = 0,},      -- 圣言术     4
    --     [33] = {id = 33, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 冰咆哮     4
    --     [34] = {id = 34, launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1, maxDistance = 4},      -- 逐日剑法
    --     [36] = {id = 36, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 灭天火
    --     [37] = {id = 37, launchmode = 5, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 流星火雨
    --     [38] = {id = 38, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 气功波
    --     [39] = {id = 39, launchmode = 5, action = 0, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 1, maxDistance = 4},      -- 开天斩
    --     [40] = {id = 40, launchmode = 3, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 嗜血术
    --     [60] = {id = 60, launchmode = 3, action = 1, onoff = 0, bestPos = 1, addition = 0, lockTarget = 1, isline = 0,},      -- 寒冰掌
    --     [61] = {id = 61, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 无极真气
    --     [62] = {id = 62, launchmode = 2, action = 1, onoff = 0, bestPos = 0, addition = 1, lockTarget = 0, isline = 0,},      -- 护体神盾
    -- }

    
    -- 手机端
    -- 1方向.目标（不自动选）： 野蛮冲撞.
    -- 2自己坐标：             抗拒火环.魔法盾.召唤骷髅.隐身术.召唤神兽.地狱雷光
    -- 3方向.目标：            火球术.大火球.灵魂火符.地狱火.疾光电影
    -- 4自己坐标和传入坐标：    火墙.群体治愈术.群体隐身术.幽灵盾.神圣战甲术 .雷电术.心灵启示.诱惑之光.爆裂火焰.圣言术.治愈术.困魔咒.冰咆哮.
    -- 5方向和目标（必须）：    普攻.施毒术.基本剑法.刺杀剑术.半月弯刀.烈火剑法.精神力剑法
    -- id  
    -- launchmode(释放类型)  
    -- action(攻击/释放)  
    -- isonoff(开关型技能)
    -- addition(增益型)  
    -- mindistance(最小释放距离)  
    -- maxdistance(最大释放距离) 
    -- bestPos(需要走位)  
    -- isline(直线释放)  
    -- locktarget(锁定目标)


    -- pc端
    -- 2鼠标方向                    抗拒火环.魔法盾.召唤骷髅.隐身术.召唤神兽.地狱雷光.疾光电影.地狱火
    -- 3鼠标坐标                    火墙.群体治愈术.群体隐身术.幽灵盾.神圣战甲术.冰咆哮.雷电术.心灵启示.诱惑之光.爆裂火焰.圣言术.治愈术.困魔咒.冰咆哮.
    -- 4鼠标所在方向(攻击锁定)       普攻.施毒术.基本剑法.刺杀剑术.攻杀剑术.半月弯刀.烈火剑法.精神力剑法
    -- 5鼠标所在目标(魔法锁定）      火球术.大火球.灵魂火符. 
    -- id  
    -- launchmode(释放类型)  
    -- action(攻击/释放)  
    -- isonoff(开关型技能)
    -- addition(增益型)  
    -- mindistance(最小释放距离)  
    -- maxdistance(最大释放距离) 
    -- bestPos(需要走位)  
    -- isline(直线释放)  
    -- locktarget(锁定目标)
    -- magiclock(魔法锁定)

    self._data.skills   = {}            -- 所有拥有技能
    self._data.select   = nil           -- 选择的技能，如范围技能
    self._data.custom   = {}            -- 自定义数据
    self._data.onskills = {}            -- 已开启技能列表
    self._priorities    = {}
    self._prioritiesT   = {}

    self._data.ngSkills         = {}          -- 所有拥有内功技能
    self._data.setComboSkill    = {}          -- 设置加入连击的连击技能
    self._data.comboSkills      = {}          -- 所有拥有的连击技能
    self._data.openComboNum     = 3           -- 默认开启三个连击
end

function SkillProxy:LoadConfig()
    self._configs = requireGameConfig("cfg_magicinfo")

    -- 初始化优先级
    local priorities = {}
    for k, v in pairs(self._configs) do
        priorities[v.MagicID] = priorities[v.MagicID] or 0
        priorities[v.MagicID] = math.max(v.priority or 0, priorities[v.MagicID])
    end
    self._priorities  = clone(priorities)
    self._prioritiesT = clone(priorities)

    -- 加载配置表
    local androidFilePath = "scripts/game_config/cfg_skill_action.lua"

    if global.FileUtilCtl:isFileExist(androidFilePath) then
        self._configs_skill_action = requireGameConfig("cfg_skill_action")
    end
end

function SkillProxy:ReadLocalKey()
    local key  = global.isWinPlayMode and "skill_key_pc" or "skill_key"
    local data = GET_CLOUD_DATA(key)
    return data or {}
end

function SkillProxy:WriteLocalKey()
    local jsonData = {}
    for k, v in pairs(self._data.skills) do
        jsonData[tostring(v.MagicID)] = v.Key
    end
    local key = global.isWinPlayMode and "skill_key_pc" or "skill_key"
    SET_CLOUD_DATA(key, jsonData)
end

function SkillProxy:SetXPSpellParam(type, value, way)
    if not self._specialXPSpellParam then
        self._specialXPSpellParam = {}
    end
    self._specialXPSpellParam.spellType = type
    self._specialXPSpellParam.spellValue = value
    self._specialXPSpellParam.spellHPWay = way -- 0:点 1:百分比
end

function SkillProxy:GetXPSpellParam()
    return self._specialXPSpellParam
end

function SkillProxy:SetMooteboWithCD(state)
    self._mootebo_with_cd = state
end

function SkillProxy:SetMooteboWithHitCD(state)
    self._mootebo_with_hit_cd = state
end

function SkillProxy:GetMooteboWithHitCD()
    return self._mootebo_with_hit_cd
end

-- 技能配置
function SkillProxy:GetConfigs()
    return self._configs
end

function SkillProxy:FindConfigBySkillID(skillID)
    return self._configs[skillID]
end

function SkillProxy:FindAllSkillsByJob(job)
    if not job then
        local PlayerProperty = global.Facade:retrieveProxy(global.ProxyTable.PlayerProperty)
        job = PlayerProperty:GetRoleJob()
    end
    local configs = self:GetConfigs()
    local items   = {}
    for _, v in pairs(configs) do
        if v.job == job or v.job == 3 or job == 3 then
            table.insert(items, v)
        end
    end
    return items
end

-- 优先级
function SkillProxy:GetPriorityBySkillID(skillID)
    if not skillID then
        return 0
    end
    return self._prioritiesT[skillID] or 0
end

-- 本地表的优先级(开启了持续攻击时   优先级读取本地)
function SkillProxy:GetLocalPriorityBySkillID(skillID)
    if not skillID then
        return 0
    end
    return self._priorities[skillID] or 0
end
-- 优先级相关


function SkillProxy:GetLaunchMode(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return 1
    end
    local launchmode = global.isWinPlayMode and config.launchmode_pc or config.launchmode
    return launchmode or 1
end

-- 获取技能名字
function SkillProxy:GetSkillNameByID(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return "ERROR SKILL NAME"
    end
    return config.magicName
end

-- 根据名字获取技能ID
function SkillProxy:GetSkillIDByName(skillName)
    for _, v in pairs(self._configs) do
        if v.magicName == skillName then
            return v.MagicID
        end
    end
    return nil
end


-- 获取技能Icon 圆形
function SkillProxy:GetIconPathByID(skillID, isCombo)
    if skillID == 0 then
        local PlayerInputProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerInputProxy)
        if PlayerInputProxy:CheckMiningAble() then
            skillID = 999
        end
    end

    local config = self:FindConfigBySkillID(skillID)
    if not config then
        local path = string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON_C, "default")
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON_C, "default")
    end

    local data = isCombo and self:GetComboSkillByID(skillID) or self:GetSkillByID(skillID)
    if not data or not data.LevelUpIcon or data.LevelUpIcon <= 0 then
        local path = string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON_C, config.icon)
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON_C, config.icon)
    end

    local path = string.format("%s%s_%s.jpg", global.MMO.PATH_RES_SKILL_ICON_C, config.icon, data.LevelUpIcon)
    if global.FileUtilCtl:isFileExist(path) then
        return path
    end

    return string.format("%s%s_%s.png", global.MMO.PATH_RES_SKILL_ICON_C, config.icon, data.LevelUpIcon)
end

-- 获取技能Icon 矩形
function SkillProxy:GetIconRectPathByID(skillID, isCombo)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        local path = string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON, "default")
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON, "default")
    end

    local data = isCombo and self:GetComboSkillByID(skillID) or self:GetSkillByID(skillID)
    if not data or not data.LevelUpIcon or data.LevelUpIcon <= 0 then
        local path = string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON, config.icon)
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON, config.icon)
    end

    local path = string.format("%s%s_%s.png", global.MMO.PATH_RES_SKILL_ICON, config.icon, data.LevelUpIcon)
    if global.FileUtilCtl:isFileExist(path) then
        return path
    end

    return string.format("%s%s_%s.jpg", global.MMO.PATH_RES_SKILL_ICON, config.icon, data.LevelUpIcon)
end

-- 最小攻击距离
function SkillProxy:GetMinDistance(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return 1
    end

    -- 寻路阻塞
    local inputProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerInputProxy)
    if inputProxy:IsMoveBlocked() then
        return config.minDis or 1
    end

    -- 刺杀剑术 文华 2020.07.20 PC端不要此功能
    -- 2023.08.28 wt/hd 商量PC端也要生效移动刺杀
    if skillID == global.MMO.SKILL_INDEX_CSJS then
        return CHECK_SETTING(global.MMO.SETTING_IDX_MOVE_GEWEI_CISHA) == 1 and 2 or 0
    end
    
    -- 自动走位
    local autoProxy  = global.Facade:retrieveProxy(global.ProxyTable.Auto)
    if (autoProxy:IsAFKState() and CHECK_SETTING(13) == 1) then
        return config.autoMinDis or 1
    end

    return config.minDis or 1
end

-- 最大攻击距离
function SkillProxy:GetMaxDistance(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return 1
    end

    -- 刺杀剑术
    if skillID == global.MMO.SKILL_INDEX_CSJS then
        return (CHECK_SETTING(global.MMO.SETTING_IDX_DAODAOCISHA) ~= 1 and CHECK_SETTING(global.MMO.SETTING_IDX_GEWEICISHA) ~= 1) and 1 or 2
    end

    -- 自动战斗使用手机端范围
    local autoProxy = global.Facade:retrieveProxy(global.ProxyTable.Auto)
    if autoProxy:IsAFKState() then
        return config.maxDis
    end

    local maxDis = global.isWinPlayMode and config.maxDis_pc or config.maxDis
    return maxDis
end

-- 是否需要进入公共CD
function SkillProxy:IsNeedEnterGlobalCD(skillID)
    -- 2021.12.21 孙同让写死
    if skillID == global.MMO.SKILL_INDEX_YMCZ then
        return false
    end
    return true
end

-- 是否必须寻找目标
function SkillProxy:IsNeedTarget(skillID)
    local launchmode = self:GetLaunchMode(skillID)
    return launchmode == 3 or launchmode == 5
end

-- 需输入坐标技能
function SkillProxy:IsInputDestSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    -- 特殊处理
    -- 道士治愈
    if skillID == 2 and CHECK_SETTING(33) == 1 then
        return false
    end

    return config.launchmode == 4
end

-- 持续攻击技能
function SkillProxy:IsLockTargetSkill(skillID,force)
    if global.isWinPlayMode and not force then
        return false
    end
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    return config.locktarget == 1
end

-- 增益buff技能
function SkillProxy:IsAdditionSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    return config.addition == 1
end

-- 开关技能
function SkillProxy:IsOnoffSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    return config.isonoff == 1
end

-- 直线攻击技能
function SkillProxy:IsLineSlopeSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    return config.isline == 1
end

-- 主动技能
function SkillProxy:IsActiveSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end
    return config.type == 1
end

-- 魔法锁定
function SkillProxy:IsMagicLockSkill(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end
    return config.magiclock == 1
end

-- 检测配置内挂(烈火不是开关型的情况)
function SkillProxy:GetMagicSettingID(skillID)
    if not skillID then
        return nil
    end
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return nil
    end
    return config.checkSetting
end

-- 技能数据
function SkillProxy:GetSkills(noBasicSkill, activeOnly, noAutoLaunch)
    -- 已有技能数据 param1:是否排除普攻  param2:是否只获取主动技能   param3:是否排除不主动释放
    local skills = {}
    for _, v in pairs(self._data.skills) do
        local config = self:FindConfigBySkillID(v.MagicID)
        if (noBasicSkill and v.MagicID == global.MMO.SKILL_INDEX_BASIC) then
        elseif activeOnly and false == self:IsActiveSkill(v.MagicID) then
        elseif noAutoLaunch and 0 == self:GetPriorityBySkillID(v.MagicID) then
        else
            skills[v.MagicID] = v
        end
    end
    return skills
end

function SkillProxy:GetSkillByID(skillID)
    -- 获取技能数据
    return self._data.skills[skillID]
end

function SkillProxy:GetSkillByKey(key)
    -- 获取技能数据
    for _, skill in pairs(self._data.skills) do
        if skill.Key == key then
            return skill
        end 
    end
    return nil
end

function SkillProxy:GetLevel(skillID)
    -- 技能等级
    local data = self:GetSkillByID(skillID)
    if data then
        return data.Level
    end
    return -1
end

-- 获取起手式动作
function SkillProxy:GetActionID(skillID)
    local data = self:GetSkillByID(skillID)
    if data then
        return data.ActionId
    else
        data = self:GetComboSkillByID(skillID)
        if data then
            return data.ActionId
        end
    end
    return nil
end

function SkillProxy:AddSkill(data)
    --增加技能
    -- dump(data)
    if not data then
        return false
    end
    if self._data.skills[data.MagicID] then
        return false
    end

    local config = self:FindConfigBySkillID(data.MagicID)
    if not config then
        print("add skill error, skill config is nil " .. tostring(data.MagicID))
        return false
    end

    -- 增加技能  
    self._data.skills[data.MagicID] = data

    -- 广播新增技能
    global.Facade:sendNotification(global.NoticeTable.SkillAdd, data)

    if self:IsCustomSkill(data.MagicID) and config then
        self._skill_custom_skill[data.MagicID] = data.MagicID
        if config.action == 0 and config.job == global.MMO.ACTOR_PLAYER_JOB_FIGHTER then
            self._skill_custon_skill_fighter[data.MagicID]=data.MagicID
        end
    end
end

function SkillProxy:DelSkill(skillID)
    --删除技能
    if not skillID then
        return false
    end
    if not self._data.skills[skillID] then
        return false
    end

    -- 删除技能
    local data = self._data.skills[skillID]
    self._data.skills[skillID] = nil

    self._skill_custom_skill[skillID] = nil
    self._skill_custon_skill_fighter[skillID] = nil

    -- 广播
    global.Facade:sendNotification(global.NoticeTable.SkillDel, data)
    ssr.ssrBridge:OnSkillDel(data)
    SLBridge:onLUAEvent(LUA_EVENT_SKILL_DEL, data)
end

function SkillProxy:UpdateSkillData(data)
    -- 更新技能数据
    if not data then
        return
    end
    if not data.skillID then
        return nil
    end
    local skill = self:GetSkillByID(data.skillID)
    if not skill then
        return nil
    end

    -- 更新技能属性
    for k, v in pairs(data) do
        skill[k] = v
    end
    global.Facade:sendNotification(global.NoticeTable.SkillUpdate, skill)
    ssr.ssrBridge:OnSkillUpdate(skill)
    SLBridge:onLUAEvent(LUA_EVENT_SKILL_UPDATE, skill)
end

function SkillProxy:GetSkillTrainData(skillID)
    -- 技能等级>3的全部特殊处理下
    local maxStr = "-"
    if not skillID or not self._data.skills[skillID] then
        return maxStr
    end
    if skillID == global.MMO.SKILL_INDEX_BASIC then
        return maxStr
    end
    local skillData     = self._data.skills[skillID]
    local isBaseSkill   = skillData.Level <= 3
    local skillLevel    = skillData.Level
    local maxSkillLevel = skillData.TrainLv
    if skillLevel >= maxSkillLevel then
        return maxStr
    end
    local skillMaxTrain = {
        [0] = skillData.MaxTrain1,
        [1] = skillData.MaxTrain2,
        [2] = skillData.MaxTrain3,
        [3] = skillData.MaxTrain4
    }
    local curTrain = skillData.CurTrain or 0
    local maxTrain = (isBaseSkill and skillMaxTrain[skillLevel] or skillData.MaxTrain1) or 0
    return curTrain >= maxTrain and maxStr or string.format(GET_STRING(1053), curTrain, maxTrain)
end
-- 

--是否使用技能书 通过书名
function SkillProxy:CheckAbleToUseBookByName(bookname)
    local allSkills = self:FindAllSkillsByJob()
    local tskillID  = nil
    for _, v in pairs(allSkills) do
        if v.magicName == bookname then
            tskillID = v.MagicID
            break
        end
    end
    if not tskillID then
        return false
    end

    -- 已学习
    if self:IsLearned(tskillID) then
        return false
    end

    return true
end

-- 是否已经学习
function SkillProxy:IsLearned(skillID)
    local skillData = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    return skillData and true or false
end

-- 特殊怪物忽略技能攻击
function SkillProxy:CheckAbleToAttack(skillID, monsterID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return true
    end
    if not config.IgnoreMaster then
        return true
    end

    for _,v in pairs(string.split(config.IgnoreMaster, "#")) do
        if tonumber(v) and monsterID == tonumber(v) then
            return false
        end
    end
    return true
end

function SkillProxy:CheckIgnoreMon(skillID, monsterID)
    if skillID ~= 25 then
        return true
    end

    -- 配置半月忽略怪
    if not self._skillIgnoreMon[skillID] then
        self._skillIgnoreMon[skillID] = {}
        local ignoreStr = string.split( SL:GetMetaValue("GAME_DATA", "IgnoreMon"), "#" )
        for _,v in pairs(ignoreStr) do
            if tonumber( v ) then
                self._skillIgnoreMon[skillID][tonumber(v)] = true
            end
        end
    end

    if self._skillIgnoreMon[skillID][monsterID] then
        return false
    end

    return true
end

-- 检测是否开启了连续多技能开关
function SkillProxy:CheckDoubleCDSwith( skillid )
    if not skillid or not self._double_skill_cd[skillid] then
        return false
    end

    if skillid == 26 and CHECK_SETTING(16) == 1 then  --开启了自动烈火，不走双烈火
        return false
    end

    local swithData = self._double_skill_cd[skillid].swith_data or {}
    local id = swithData.id
    local value = swithData.value
    local value1 = swithData.value1
    if id then --不禁止双烈火
        if ( value and CHECK_SERVER_OPTION(id) ~= value ) or ( value1 and CHECK_SERVER_OPTION(id) == value1 ) then
            return true
        end
    end
    return false
end

function SkillProxy:UpdateDoubleCD( skillid )
    if not self:CheckDoubleCDSwith( skillid ) then
        return
    end

    local isCheck = true
    if self:IsOnoffSkill( skillid ) then
        if not self:IsOnSkill(skillid) then
            isCheck = false
        end
    end

    if not self._double_skill_cd[skillid] then
        self._double_skill_cd[skillid] = {}
    end

    self._double_skill_cd[skillid].cd_timer_stamp = isCheck and GetServerTime() or nil
end

-- 检测是否有双烈火
function SkillProxy:GetDoubleSkillCDTime( skillid,maxCDTime )
    if not self:CheckDoubleCDSwith( skillid ) then
        return maxCDTime
    end

    local doubledata = self._double_skill_cd[skillid] or {}
    local cd_timer_stamp = doubledata.cd_timer_stamp
    if cd_timer_stamp and cd_timer_stamp > 0 then
        local currTime = GetServerTime()
        local remainCD = currTime - doubledata.cd_timer_stamp
        local cd = math.max(0,maxCDTime-remainCD)
        print("cd: ",cd)
        return maxCDTime-remainCD,true
    end

    return maxCDTime
end
-- 是否在CD
function SkillProxy:IsInCD(skillID)
    local skillData = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    if skillData then
        return skillData.isCD, skillData.curTime
    end
    return false
end

-- 是否发送提示
function SkillProxy:IsCDHint( skillID )
    if global.isWinPlayMode then
        local AutoProxy  = global.Facade:retrieveProxy(global.ProxyTable.Auto)
        if AutoProxy:IsAFKState() then
            return false
        end

        local cfg = self:FindConfigBySkillID(skillID)
        local showCDHint = cfg and tonumber(cfg.showCDHint) or nil
        if showCDHint then
            return showCDHint == 1
        end

        local skillData = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
        if skillData and skillData.HideCDHint then
            return skillData.HideCDHint == 0
        end
    end
    return false
end

-- MP 是否满足
function SkillProxy:IsEnoughMana(skillID)
    local skill = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    if not skill then
        return false
    end
    if skill.SpellType and skill.SpellType ~= 0 then    -- 非耗蓝
        return true
    end
    if not skill.Spell or not skill.DefSpell then
        -- 没有告诉我是否耗蓝
        return true
    end

    local propertyProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerProperty)
    local currMP = propertyProxy:GetRoleCurrMP()
    return currMP and currMP >= (skill.Spell + skill.DefSpell)
end

-- 内力值 是否满足
function SkillProxy:IsEnoughIValue(skillID)
    local skill = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    if not skill then
        return false
    end
    if not skill.SpellType or skill.SpellType ~= 1 then    -- 非耗内力
        return true
    end
    if not skill.Spell or not skill.DefSpell then
        return true
    end

    local propertyProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerProperty)
    local curForce = propertyProxy:GetInternalData().force
    return curForce and curForce >= (skill.Spell + skill.DefSpell)
end

-- 内力值/蓝值不满足 耗血 [仅血魄一击技能]
function SkillProxy:IsEnoughHPSpecialCost(skillID)
    if not (skillID == global.MMO.SKILL_INDEX_XP_Z or skillID == global.MMO.SKILL_INDEX_XP_F or skillID == global.MMO.SKILL_INDEX_XP_D) then
        return false
    end

    local skill = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    if not skill then
        return false
    end

    if not self._specialXPSpellParam.spellType then
        return false
    end

    local spellValue = self._specialXPSpellParam.spellValue
    local spellHPWay = self._specialXPSpellParam.spellHPWay

    local propertyProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerProperty)
    local curHP         = propertyProxy:GetRoleCurrHP()
    local curHPPercent  = propertyProxy:GetRoleHPPercent()

    if spellHPWay == 0 then
        return curHP and curHP >= spellValue, true
    elseif spellHPWay == 1 then
        return curHPPercent and curHPPercent >= spellValue, true
    end
    return false
end

-- 是否是自定义技能
function SkillProxy:IsCustomSkill(skillID)
    if skillID and skillID > 1000 then
        return true
    end
    return false
end

function SkillProxy:GetCustomSkill()
    return self._skill_custon_skill_fighter or {}
end

function SkillProxy:GetAllCustomSkill()
    return self._skill_custom_skill or {}
end

function SkillProxy:IsFightCustomSkill( skillID )
    return skillID and self._skill_custon_skill_fighter[skillID]
end

-- 能不能释放
function SkillProxy:CheckAbleToLaunch(skillID, isUserInput)
    --[[
    1: able
    -1: not learned
    -2: is cd
    -3: not enough mana
    -4: buff not allowed
    -5: not enough mount mana
    -6: map limit
    -8: stiffness
    -9: isOff
    -10: horse
    -11: 延迟释放
    -12: 内力值不够
    -13: 目标buff有禁止技能 launch
    -14: 目标buff有禁止技能 User Input
    -15: 血量不足
    ]]

    -- 挖矿使用普普攻CD
    if skillID == global.MMO.SKILL_INDEX_DIG and not self:IsInCD(global.MMO.SKILL_INDEX_BASIC) then
        return 1
    end

    if not self:IsLearned(skillID) then
        return -1
    end

    local skillData = self:GetSkillByID(skillID) or self:GetComboSkillByID(skillID)
    local isCD, currCDTime = self:IsInCD(skillID)
    if isCD then
        if self:IsCDHint(skillID) then 
            currCDTime = currCDTime or 0
            local lastHintTime = skillData.lastHintTime or 0
            if lastHintTime - currCDTime >= 1 or (lastHintTime == 0 and skillData.DelayTime > 1000) then
                local proxy = global.Facade:retrieveProxy(global.ProxyTable.Chat)
                local CHANNEL = proxy.CHANNEL
                local data = {}
                data.ChannelId = CHANNEL.System
                data.BColor = 249
                data.FColor = 255
                data.Msg = string.format(GET_STRING(310000101), math.ceil(currCDTime))
                global.Facade:sendNotification(global.NoticeTable.AddChatItem, data)
                skillData.lastHintTime = currCDTime
            end
        end
        return -2
    end

    if not self:IsEnoughMana(skillID) then
        local isEnoughHp, canCostHp = self:IsEnoughHPSpecialCost(skillID)
        if not canCostHp then
            return -3
        elseif not isEnoughHp then
            return -15
        end
    end

    if not self:IsEnoughIValue(skillID) then
        local isEnoughHp, canCostHp = self:IsEnoughHPSpecialCost(skillID)
        if not canCostHp then
            return -12
        elseif not isEnoughHp then
            return -15
        end
    end

    -- 智能野蛮特殊处理
    if self:IsOnoffSkill(skillID) and not self:IsOnSkill(skillID) then
        return -9
    end

    local HorseProxy = global.Facade:retrieveProxy( global.ProxyTable.HorseProxy )
    if not HorseProxy:IsLaunch(skillID) then
        return -10
    end

    local proxy = global.Facade:retrieveProxy(global.ProxyTable.Buff)
    if not proxy:CheckSkillEnable(skillID) then
        return -4
    end
    
    local MapProxy = global.Facade:retrieveProxy(global.ProxyTable.Map)
    if MapProxy:IsForbidLaunchSkill(skillID) then
        return -6
    end

    if self:IsDelayLaunch( skillID ) then
        return -11
    end

    local inputProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerInputProxy)
    local targetID   = inputProxy:GetAttackTargetID() or inputProxy:GetTargetID()
    if targetID then
        if isUserInput then
            local buffID = global.BuffManager:CheckLaunchBuffBySkillID(targetID, skillID)
            if buffID then
                return -13, buffID
            end
        elseif global.BuffManager:CheckAutoBuffBySkillID(targetID, skillID) then
            return -14
        end
    end
    
    if skillData then 
        skillData.lastHintTime = 0
    end
    return 1
end

-- skill key
function SkillProxy:GetSkillKey(skillID)
    if not skillID then
        return nil
    end
    local skill = self:GetSkillByID(skillID)
    if not skill then
        return nil
    end
    return skill.Key
end

function SkillProxy:DelSkillKey(skillID, isChange)
    local skill = self:GetSkillByID(skillID)
    if not skill then
        return nil
    end
    local nData  = {}
    nData.skill  = clone(skill)
    nData.delKey = skill.Key
    skill.Key = 0
    nData.change = isChange
    global.Facade:sendNotification(global.NoticeTable.SkillDeleteKey, nData)

    self:ResuestChangeKey(skillID, 0)
end

function SkillProxy:SetSkillKey(skillID, key)
    if not skillID then
        return nil
    end
    local skill = self:GetSkillByID(skillID)
    if not skill then
        return nil
    end

    -- del key
    local keySkill = self:GetSkillByKey(key)
    if keySkill then
        if keySkill.MagicID and keySkill.MagicID == skillID then
            self:DelSkillKey(keySkill.MagicID, true)
        else
            self:DelSkillKey(keySkill.MagicID)
        end  
    end
    
    -- new key
    local last = clone(skill)
    skill.Key  = key
    global.Facade:sendNotification(global.NoticeTable.SkillChangeKey, {last = last, skill = skill})

    self:ResuestChangeKey(skillID, key)
end

-- 优先级替换技能（只符合第一次学习）
function SkillProxy:ReplaceSkillKeyByID( skillID )
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return true
    end

    local success = false
    local replaceArray = string.split( config.drivingreplace or "", "#" )
    local key = tonumber(replaceArray[1])
    local priority = tonumber(replaceArray[2])
    if key and priority then
        local keySkill = self:GetSkillByKey(key)
        local keySkillPriority = keySkill and keySkill.Key or 0
        if keySkill then
            local keySkillConfig = self:FindConfigBySkillID(keySkill.MagicID)
            local keySkillReplaceArray = keySkillConfig and string.split( keySkillConfig.drivingreplace or "","#" )
            keySkillPriority = tonumber(keySkillReplaceArray[2]) or keySkillPriority
        end

        if not keySkill or (keySkillPriority and priority > keySkillPriority) then
            success = true
            self:SetSkillKey(skillID, key)
        end
    end
    return success
end

function SkillProxy:GetEmptySlot()
    if global.isWinPlayMode then
        for i = 1, 16 do
            if not self:GetSkillByKey(i) then
                return i
            end
        end
    else
        for i = 2, 9 do
            if not self:GetSkillByKey(i) then
                return i
            end
        end
    end
    return 0
end


-- 正在释放范围技能
function SkillProxy:GetSelectSkill()
    return self._data.select
end

function SkillProxy:SelectSkill(skillID)
    self._data.select = skillID
end

function SkillProxy:ClearSelectSkill()
    local skillID = self._data.select
    self._data.select = nil
    global.Facade:sendNotification(global.NoticeTable.ClearSelectSkill, skillID)
end

-- 技能释放逻辑特征 数据
function SkillProxy:GetSkillCustomData(skillID)
    if not skillID then
        return nil
    end
    return self._data.custom[skillID]
end

function SkillProxy:SetSkillCustomData(skillID, value)
    if not skillID then
        return nil
    end
    self._data.custom[skillID] = value
end

-- 开启/关闭
function SkillProxy:SkillOn(skillID)
    self._data.onskills[skillID] = true

    global.Facade:sendNotification(global.NoticeTable.SkillOn, {skillID = skillID})
    SLBridge:onLUAEvent(LUA_EVENT_SKILL_ONOFF, {skillID = skillID, isOn = true})

    local autoProxy  = global.Facade:retrieveProxy(global.ProxyTable.Auto)
    local optionID   = self._skill_on_launch[skillID]
    if optionID and autoProxy:GetAutoLockSkillID() and (CHECK_SETTING(optionID) ~= 1 or optionID == -1) then
        autoProxy:SetLaunchFirstSkill( skillID )
    end
    if self:IsComboSkill(skillID) and CHECK_SETTING(global.MMO.SETTING_IDX_AUTO_COMBO) ~= 1 then
        self:SetComboLanunchID(skillID)
    end
end

function SkillProxy:SkillOff(skillID)
    self._data.onskills[skillID] = nil

    global.Facade:sendNotification(global.NoticeTable.SkillOff, {skillID = skillID})
    SLBridge:onLUAEvent(LUA_EVENT_SKILL_ONOFF, {skillID = skillID, isOn = false})
end

function SkillProxy:IsOnSkill(skillID)
    return (self._data.onskills[skillID] == true)
end

-- 技能开关更改
function SkillProxy:SkillSettingChange(settingID)
    if not settingID then
        return
    end

    if settingID == global.MMO.SETTING_IDX_DAODAOCISHA and self:IsLearned(global.MMO.SKILL_INDEX_CSJS) and self:IsOnoffSkill(global.MMO.SKILL_INDEX_CSJS) then
        if CHECK_SETTING(settingID) == 1 and not self:IsOnSkill(global.MMO.SKILL_INDEX_CSJS) then
            self:RequestSkillOnoff(global.MMO.SKILL_INDEX_CSJS)
        elseif CHECK_SETTING(settingID) ~= 1 and self:IsOnSkill(global.MMO.SKILL_INDEX_CSJS) then
            self:RequestSkillOnoff(global.MMO.SKILL_INDEX_CSJS)
        end
    end
end

-- 施法是否要检测是否距离
function SkillProxy:IsForceDis(skillID)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return false
    end

    return tonumber(config.forceDis) == 1
end

-- 设置解析替代表现的字符串
function SkillProxy:SetSkillPresentReplaceID( idStr )
    self._skill_present_replace_id = {}
    local parseStrArray = string.split(idStr or "",",")
    for i,v in ipairs(parseStrArray) do
        if v and v ~= "" then
            local vArray    = string.split(v,"=")
            local id        = tonumber(vArray[1])
            local newid     = tonumber(vArray[2])
            if id and newid then
                self._skill_present_replace_id[id] = newid
            end
        end
    end
end

-- 获取替代表现
function SkillProxy:GetSkillPresentReplaceID( skillID )
    local replaceID = self._skill_present_replace_id[skillID]
    if replaceID and replaceID > 0 then
        return replaceID
    end
    return skillID
end

-- 是否延迟释放
function SkillProxy:IsDelayLaunch( skillID )
    if not skillID or skillID == global.MMO.SKILL_INDEX_BASIC or skillID == global.MMO.SKILL_INDEX_DIG then
        return false
    end

    if not self._isDelayLaunch then
        return false
    end

    local tTime = socket.gettime() * 1000
    if tTime >= self._delayLauchEndTime then
        self._isDelayLaunch = false
    end
    return self._isDelayLaunch
end

-- 重置技能延迟释放
function SkillProxy:ResetDelaySkillLaunch( skillID )
    if not skillID or skillID == global.MMO.SKILL_INDEX_BASIC or skillID == global.MMO.SKILL_INDEX_DIG then
        return
    end

    self._isDelayLaunch = false
    local skillData = self:GetSkillByID( skillID )
    local delayTimeEX = skillData and skillData.DelayTimeEX or 0
    if delayTimeEX > 0 then
        self._isDelayLaunch = true
        self._delayLauchEndTime = socket.gettime() * 1000 + delayTimeEX
    end
end

function SkillProxy:RespPlayerSkillData(msg)
    local localKey = self:ReadLocalKey()
    local jsonData = ParseRawMsgToJson(msg)
    -- dump(jsonData)
    if jsonData then
        for _, v in ipairs(jsonData) do
            local skill = parseOneSkillData(v)
            if skill.SkillType == 6 then    --  人物连击技能
                -- LJBJRate 连击暴击几率
                self._data.comboSkills[skill.MagicID] = skill
                SLBridge:onLUAEvent(LUA_EVENT_PLAYER_COMBO_SKILL_ADD, skill)
            else
                skill.Key   = localKey[tostring(skill.MagicID)] or 0
                self:AddSkill(skill)
                SLBridge:onLUAEvent(LUA_EVENT_SKILL_INIT, skill)
            end
        end
    end

    -- 默认加个普攻
    local keySkill = self:GetSkillByKey(1)
    local basicKey = (keySkill and 0 or 1)
    local skill = {
        MagicID     = global.MMO.SKILL_INDEX_BASIC,
        Level       = 0,
        TrainLv     = 1,
        Key         = global.isWinPlayMode and 0 or (localKey[tostring(global.MMO.SKILL_INDEX_BASIC)] or basicKey),
        Name        = "",
        EffectType  = 0,
        LevelUp     = 0,
        LevelUpIcon = 0,
    }
    skill = parseOneSkillData(skill)
    self:AddSkill(skill)
    SLBridge:onLUAEvent(LUA_EVENT_SKILL_INIT, skill)

    self:SkillSettingChange(global.MMO.SETTING_IDX_DAODAOCISHA)
end

function SkillProxy:RespPlayerAddSkill(msg)
    local jsonData = ParseRawMsgToJson(msg)
    -- dump(jsonData)
    local skill = parseOneSkillData(jsonData)
    if skill.SkillType == 6 then -- 人物连击技能
        self._data.comboSkills[skill.MagicID] = skill
        SLBridge:onLUAEvent(LUA_EVENT_PLAYER_COMBO_SKILL_ADD, skill)
    else
        self:AddSkill(skill)

        -- 技能自动设置键位
        local config = self:FindConfigBySkillID(skill.MagicID)
        local success = self:ReplaceSkillKeyByID( skill.MagicID )
        if not success and config and config.replace == 1 then
            -- xxx技能强行替换普攻
            self:SetSkillKey(skill.MagicID, 1)

        elseif not success and self:IsActiveSkill(skill.MagicID) and skill.Key == 0 then
            local slot = self:GetEmptySlot()
            if slot > 0 then
                self:SetSkillKey(skill.MagicID, slot)
            end
        end

        ssr.ssrBridge:OnSkillAdd(skill)
        SLBridge:onLUAEvent(LUA_EVENT_SKILL_ADD, skill)
    end
end

--删除技能
function SkillProxy:RespPlayerDelSkill(msg)
    local header  = msg:GetHeader()
    local skillID = header.recog
    local skillType = header.param1
    if skillType == 6 then -- 人物连击技能
        local data = self._data.comboSkills[skillID]
        if data then
            self._data.comboSkills[skillID] = nil
            SLBridge:onLUAEvent(LUA_EVENT_PLAYER_COMBO_SKILL_DEL, data)
        end
    else
        -- 查找删除的老技能
        self:DelSkill(skillID)

        local skills = self:GetSkills(true, true)  --没有技能时，强制设置普攻
        local skill = self:GetSkillByKey(1)
        if not skills or not next(skills) or not skill then
            if not global.isWinPlayMode then
                self:SetSkillKey(global.MMO.SKILL_INDEX_BASIC, 1)
            end
        end
    end
end

function SkillProxy:RespPlayerUpdateSkill(msg)
    local dataLen = msg:GetDataLength()
    if dataLen <= 0 then
        return
    end
    local msgHdr = msg:GetHeader()
    local dataString = msg:GetData():ReadString(dataLen)

    local iconID = tonumber(dataString)
    local skillType = nil
    local LJBJRate = nil
    if not iconID then
        local data = string.split(dataString, "#")
        iconID = tonumber(data[1]) or 0
        skillType = data[2] and tonumber(data[2])
        LJBJRate = data[3] and tonumber(data[3])
    end

    local data      = {
        skillID     = msgHdr.recog,
        Level       = msgHdr.param1,
        LevelUp     = msgHdr.param2,
        CurTrain    = msgHdr.param3,
        LevelUpIcon = iconID,
    }
    if skillType == 6 then              -- 人物连击
        data.LJBJRate = LJBJRate     
        self:UpdateComboSkillData(data)
    elseif skillType == 2 or skillType == 4 then    -- 人物内功
        self:UpdateNGSkillData(data, skillType)
    else
        self:UpdateSkillData(data)
    end
end

-- 更改技能cd时间
function SkillProxy:RespSkillUpdateSkillCD(msg)
    local msgHdr = msg:GetHeader()

    local skillID = msgHdr.recog
    local skill   = self:GetSkillByID(skillID)
    local config  = self:FindConfigBySkillID(skillID)
    if not skill or not config then
        return
    end

    skill.DelayTime = msgHdr.param1
    if self:IsInCD(skillID) and skill.curTime > 0 then
        local player = global.gamePlayerController:GetMainPlayer()
        if not player then
            return nil
        end

        -- globalCD
        local attackglobalCD    = SL:GetMetaValue("GAME_DATA","attackglobalCD") or 900
        local magicglobalCD     = SL:GetMetaValue("GAME_DATA","magicglobalCD") or 1000
        local globalCD          = (config.action == 1 and magicglobalCD or attackglobalCD) * 0.001

        -- skillCD
        local attackCD          = (player:GetAttackStepTime() / player:GetAttackSpeed())
        local magicCD           = (player:GetMagicStepTime() / player:GetMagicSpeed())
        local launchCD          = (config.action == 1 and magicCD or attackCD)
        launchCD                = math.max(globalCD, launchCD)
        local maxTime           = math.max(launchCD, skill.DelayTime*0.001)

        local excessTime        = maxTime - skill.maxTime
        skill.maxTime           = maxTime
        skill.curTime           = math.max(skill.curTime + excessTime, 0)
    end
end

function SkillProxy:ResuestChangeKey(skillID, key)
    self:WriteLocalKey()
end

function SkillProxy:RequestSkillOnoff(skillID, isCombo)
    if not self:IsLearned(skillID) then
        return nil
    end

    if self:IsCustomSkill(skillID) then  --自定义技能   开关型技能单控
        local isOn = self:IsOnSkill(skillID) and 0 or 1    --0关闭； 1打开
        LuaSendMsg(global.MsgType.MSG_CS_MagicOnOff, skillID, isOn, 0, 0)
        return
    end

    local sendData = {
        skillID  = skillID,
    }
    local sendJson = cjson.encode(sendData)
    LuaSendMsg(global.MsgType.MSG_CS_PLAYER_SKILL_LAUNCH, skillID, 0, 0, 0, sendJson, string.len(sendJson))
end

function SkillProxy:RespSkillOnoff(msg)
    local msgLen = msg:GetDataLength()
    if msgLen <= 0 then
        return 1
    end
    local msgData = msg:GetData()
    local dataStr = msgData:ReadString(msgLen)
    local jsonData = cjson.decode(dataStr)
    -- dump(jsonData)
    
    if jsonData.Flag == 1 then
        self:SkillOn(jsonData.Id)
    elseif jsonData.Flag == 0 then
        self:SkillOff(jsonData.Id)
    end
    self:UpdateDoubleCD( jsonData.Id )
end

function SkillProxy:actorEnterAction(jsonData, isMagic)
    local skillID = jsonData.MagicID
    local actorID = jsonData.UserID
    local dX = jsonData.X
    local dY = jsonData.Y
    local dir = jsonData.Dir
    local launcher = global.actorManager:GetActor(actorID)
    if nil == launcher then
        print("launcher is miss!")
        return nil
    end
    if launcher:IsDie() then
        print("launcher is death!")
        return nil
    end
    
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        print("warning, can not find skill info!")
    end
    
    local action =
        {
            actor = launcher,
            dir = dir,
            skillID = skillID,
            isMagic = isMagic,
            X = dX,
            Y = dY,
            NoHitAct = jsonData.NoHitAct,
            ActionId = jsonData.ActionId
        }
    if not config then
        global.Facade:sendNotification(global.NoticeTable.ActorEnterAttackAction, action)
    elseif config and config.action == 0 then
        global.Facade:sendNotification(global.NoticeTable.ActorEnterAttackAction, action)
    elseif config and config.action == 1 then
        global.Facade:sendNotification(global.NoticeTable.ActorEnterSkillAction, action)
    end
    
    if launcher:IsHero() or launcher:IsNetPlayer() or launcher:IsHumanoid() then
        launcher:SetConfirmed(true)
    end
end

function SkillProxy:requestSkillPresent(jsonData, skillStage)
    local skillID       = jsonData.MagicID
    local launcherID    = jsonData.UserID
    local dX            = jsonData.X
    local dY            = jsonData.Y
    local dir           = jsonData.Dir

    if skillStage == 2 and skillID == 75 then   --护体神盾
        skillStage = 3
    end
    
    local launcher = global.actorManager:GetActor(launcherID)
    if nil == launcher then
        print("launcher is miss!")
        return nil
    end
    if launcher:IsDie() then
        print("launcher is death!")
        return nil
    end

    local present_param = nil
    if jsonData.TargetUserID and string.len(jsonData.TargetUserID) > 0 then
        present_param = jsonData.TargetUserID
    end

    -- for monster baisc skill
    if launcher:IsMonster() and skillID == global.MMO.SKILL_INDEX_BASIC then
        local raceServer = launcher:GetRaceServer() or 0
        local raceImg = launcher:GetRaceImg() or 0
        local t = string.format("%s%s", raceServer, raceImg)
        t       = tonumber(t) or 0
        skillID = t + 100000
        -- print("raceImg+++++++++++++++++++++", raceServer, raceImg, t, skillID)
    end

    -- 替代skillID
    local replaceID = jsonData.ScriptEffect
    local newSkillID = (replaceID and replaceID > 0) and replaceID or skillID

    -- 主玩家技能表现
    if launcherID == global.gamePlayerController:GetMainPlayerID() then
        newSkillID = self:GetSkillPresentReplaceID(skillID)
    end

    -- skill present
    local present =
    {
        skillID     = newSkillID,
        launchX     = launcher:GetMapX(),
        launchY     = launcher:GetMapY(),
        hitX        = dX,
        hitY        = dY,
        dir         = dir,
        param       = present_param,
        skillStage  = skillStage,
        launcherID  = launcherID
    }
    global.Facade:sendNotification(global.NoticeTable.RequestSkillPresent, present)
end

-- 是否不需要结束状态后进入技能action(野蛮不需要结束就能进入)       skillID: 技能id
function SkillProxy:IsNotNeedEnterAction(skillID)
    if skillID == global.MMO.SKILL_INDEX_YMCZ then

        -- 禁止移动状态释放
        if self._mootebo_with_cd == 1 and SL:GetMetaValue("ACTOR_IS_MOVE", SL:GetMetaValue("MAIN_ACTOR_ID")) then
            return false
        end

        -- 禁止释放技能状态释放
        if self._mootebo_with_hit_cd == 1 and SL:GetMetaValue("ACTOR_IS_LAUNCH_ACTION", SL:GetMetaValue("MAIN_ACTOR_ID")) then
            return false
        end

        return true
    end
    return false
end

-- 立即施法         skillID: 技能id
function SkillProxy:RequestLaunchImmediate(skillID)
    local mainPlayer = global.gamePlayerController:GetMainPlayer()
    if not mainPlayer then
        return nil
    end
    global.Facade:sendNotification(global.NoticeTable.RequestLaunchSkill, {skillID = skillID})
end

-- 个人的技能表现修改列表
function SkillProxy:handle_MSG_SC_SENDMAGICSCRIPTEFFECT( msg )
    local msgLen = msg:GetDataLength()
    local dataString = ""
    if msgLen > 0 then
        dataString = msg:GetData():ReadString(msgLen)
    end
    self:SetSkillPresentReplaceID( dataString )
end

-- 所有CD归0
function SkillProxy:handle_MSG_SC_INITMAGICCD( msg )
    for _skillid, _skilldata in pairs(self._data.skills or {}) do
        if _skillid then
            global.Facade:sendNotification(global.NoticeTable.SkillEnterCD, _skillid)
        end
    end
end

--------------------------- 内功技能 ----------------------------------
function SkillProxy:GetNGSkills()
    return self._data.ngSkills
end

function SkillProxy:GetNGSkillsList()
    local list = {}
    for _, data in pairs(self._data.ngSkills) do
        for i, skill in pairs(data) do
            table.insert(list, skill)
        end
    end
    table.sort(list, function(a, b)
        if a.MagicID ~= b.MagicID then
            return a.MagicID < b.MagicID
        end
        return a.SkillType < b.SkillType
    end)
    return list
end

function SkillProxy:GetNGSkillData(skillID, skillType)
    return self._data.ngSkills[skillType] and self._data.ngSkills[skillType][skillID]
end

-- skill 开关
function SkillProxy:GetNGSkillOnOff(skillID, skillType)
    if not skillID then
        return nil
    end
    local skill = self:GetNGSkillData(skillID, skillType)
    if not skill then
        return nil
    end
    return skill.Key
end

function SkillProxy:SetNGSkillOnOff(skillID, skillType, key)
    if not skillID then
        return nil
    end
    local skill = self:GetNGSkillData(skillID, skillType)
    if not skill then
        return nil
    end
    skill.Key  = key
    self:RequestNGSkillOnOff(skillID, skillType, key)
end

function SkillProxy:GetNGSkillName(skillID, skillType)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return "ERROR SKILL NAME"
    end
    if skillType == 2 then
        return config.nMagicName
    elseif skillType == 4 then
        return config.jMagicName
    end
end

function SkillProxy:GetNGSkillDesc(skillID, skillType)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        return "ERROR SKILL DESC"
    end
    if skillType == 2 then
        return config.nDesc
    elseif skillType == 4 then
        return config.jDesc
    end
end

-- 获取内功技能Icon 矩形
function SkillProxy:GetNGIconRectPath(skillID, skillType)
    local config = self:FindConfigBySkillID(skillID)
    if not config then
        local path = string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON, "default")
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON, "default")
    end

    local data = self:GetNGSkillData(skillID, skillType)
    local icon = nil 
    if skillType == 2 then  -- 怒
        icon = config.nIcon
    elseif skillType == 4 then  -- 静
        icon = config.jIcon
    end
    icon = icon or config.icon
    if not data or not data.LevelUpIcon or data.LevelUpIcon <= 0 then
        
        local path = string.format("%s%s.png", global.MMO.PATH_RES_SKILL_ICON, icon)
        if global.FileUtilCtl:isFileExist(path) then
            return path
        end
        return string.format("%s%s.jpg", global.MMO.PATH_RES_SKILL_ICON, icon)
    end

    local path = string.format("%s%s_%s.png", global.MMO.PATH_RES_SKILL_ICON, icon, data.LevelUpIcon)
    if global.FileUtilCtl:isFileExist(path) then
        return path
    end

    return string.format("%s%s_%s.jpg", global.MMO.PATH_RES_SKILL_ICON, icon, data.LevelUpIcon)
end

--key 0 开启 1关闭  
--type 0人物 1内功 2连击
--skillType 0=人物技能, 1=英雄技能 2=人物怒内功技能  3=英雄怒内功技能  4=人物静内功技能  5=英雄静内功技能   6=人物连击技能 7=英雄连击技能
function SkillProxy:RequestNGSkillOnOff(skillID, skillType, key)
    LuaSendMsg(global.MsgType.MSG_CS_PLAYER_ONOFF_INTERNAL_SKILL, skillID, key, skillType or 0, 0)
end

-- 0: 人物 1:英雄
function SkillProxy:RequestNGSkillData(isHero)
    local type = isHero and 1 or 0
    LuaSendMsg(global.MsgType.MSG_CS_GET_NG_SKILL_DATA, type, 0, 0, 0) 
end

function SkillProxy:GetNGSkillTrainData(skillID, skillType)
    -- 技能等级>3的全部特殊处理下
    local maxStr = "-"
    if not skillID or not self._data.ngSkills[skillType] or not self._data.ngSkills[skillType][skillID] then
        return maxStr
    end
    if skillID == global.MMO.SKILL_INDEX_BASIC then
        return maxStr
    end
    local skillData     = self._data.ngSkills[skillType][skillID]
    local isBaseSkill   = skillData.Level <= 3
    local skillLevel    = skillData.Level
    local maxSkillLevel = skillData.TrainLv
    if skillLevel >= maxSkillLevel then
        return maxStr
    end
    local skillMaxTrain = {
        [0] = skillData.MaxTrain1,
        [1] = skillData.MaxTrain2,
        [2] = skillData.MaxTrain3,
        [3] = skillData.MaxTrain4
    }
    local curTrain = skillData.CurTrain or 0
    local maxTrain = (isBaseSkill and skillMaxTrain[skillLevel] or skillData.MaxTrain1) or 0
    return curTrain >= maxTrain and maxStr or string.format(GET_STRING(1053), curTrain, maxTrain)
end

function SkillProxy:UpdateNGSkillData(data, skillType)
    -- 更新技能数据
    if not data then
        return
    end
    if not data.skillID then
        return nil
    end
    local skill = self:GetNGSkillData(data.skillID, skillType)
    if not skill then
        return nil
    end

    -- 更新技能属性
    for k, v in pairs(data) do
        skill[k] = v
    end
    SLBridge:onLUAEvent(LUA_EVENT_INTERNAL_SKILL_UPDATE, skill)
end

function SkillProxy:RespPlayerNGSkillData(msg)
    local jsonData = ParseRawMsgToJson(msg)
    if jsonData then
        for _, v in ipairs(jsonData) do
            local skill = parseOneSkillData(v)
            if not self._data.ngSkills[skill.SkillType] then
                self._data.ngSkills[skill.SkillType] = {}
            end
            self._data.ngSkills[skill.SkillType][skill.MagicID] = skill
        end
        -- SLBridge:onLUAEvent(LUA_EVENT_INTERNAL_SKILL_INIT)
    end
end

function SkillProxy:RespPlayerAddNGSkill(msg)
    local jsonData = ParseRawMsgToJson(msg)
    local skill = parseOneSkillData(jsonData)
    if not self._data.ngSkills[skill.SkillType] then
        self._data.ngSkills[skill.SkillType] = {}
    end
    self._data.ngSkills[skill.SkillType][skill.MagicID] = skill
    SLBridge:onLUAEvent(LUA_EVENT_INTERNAL_SKILL_ADD, skill)
end

--删除技能
function SkillProxy:RespPlayerDelNGSkill(msg)
    local header  = msg:GetHeader()
    local skillID = header.recog
    local skillType = header.param1
    local data = self._data.ngSkills[skillType] and self._data.ngSkills[skillType][skillID]
    if data then
        self._data.ngSkills[skillType][skillID] = nil
        SLBridge:onLUAEvent(LUA_EVENT_INTERNAL_SKILL_DEL, data)
    end
end

--------------------------- 连击技能 ----------------------------------
function SkillProxy:haveSetComboSkill()
    return self._data.setComboSkill
end

function SkillProxy:SetComboSkill(idx, skillID)
    self._data.setComboSkill[idx] = skillID
end

function SkillProxy:GetComboSkills()
    return self._data.comboSkills
end

function SkillProxy:GetComboSkillByID(skillID)
    -- 获取技能数据
    return self._data.comboSkills[skillID]
end

function SkillProxy:IsComboSkill(skillID)
    if self._data.comboSkills[skillID] then
        return true
    else
        return false
    end
end

function SkillProxy:SetComboLanunchID(skillID)
    self._comboSkillLaunchID = skillID
end

function SkillProxy:GetComboLanunchID()
    return self._comboSkillLaunchID
end

function SkillProxy:ClearComboLanunchID()
    self._comboSkillLaunchID = nil
end

function SkillProxy:SetlaunchComboStatus(state)
    self._canLaunchComboStatus = state
end

function SkillProxy:GetlaunchComboStatus()
    return self._canLaunchComboStatus
end

function SkillProxy:GetComboSkillTrainData(skillID)
    -- 技能等级>3的全部特殊处理下
    local maxStr = "-"
    if not skillID or not self._data.comboSkills[skillID] then
        return maxStr
    end
    local skillData     = self._data.comboSkills[skillID]
    local isBaseSkill   = skillData.Level <= 3
    local skillLevel    = skillData.Level
    local maxSkillLevel = skillData.TrainLv
    if skillLevel >= maxSkillLevel then
        return maxStr
    end
    local skillMaxTrain = {
        [0] = skillData.MaxTrain1,
        [1] = skillData.MaxTrain2,
        [2] = skillData.MaxTrain3,
        [3] = skillData.MaxTrain4
    }
    local curTrain = skillData.CurTrain or 0
    local maxTrain = (isBaseSkill and skillMaxTrain[skillLevel] or skillData.MaxTrain1) or 0
    return curTrain >= maxTrain and maxStr or string.format(GET_STRING(1053), curTrain, maxTrain)
end

function SkillProxy:UpdateComboSkillData(data)
    -- 更新技能数据
    if not data then
        return
    end
    if not data.skillID then
        return nil
    end
    local skill = self:GetComboSkillByID(data.skillID)
    if not skill then
        return nil
    end

    -- 更新技能属性
    for k, v in pairs(data) do
        skill[k] = v
    end
    SLBridge:onLUAEvent(LUA_EVENT_PLAYER_COMBO_SKILL_UPDATE, skill)
end

function SkillProxy:RequestSetComboSkill(key, skillID, isHero)
    if not key then
        return
    end
    skillID = skillID or 0
    local type = isHero and 1 or 0
    LuaSendMsg(global.MsgType.MSG_CS_SET_COMBO_SKILL, type, key, skillID, 0) 
end

function SkillProxy:RespSetComboSkill(msg)
    local header  = msg:GetHeader()
    local type = header.recog
    local key = header.param1
    local skillID = header.param2
    
    if key ~= 0 then
        if type == 0 then -- 人物
            if skillID == 0 then
                self:SetComboSkill(key, nil)
            else
                self:SetComboSkill(key, skillID)
            end
            SL:onLUAEvent(LUA_EVENT_PLAYER_SET_COMBO_REFRESH, key)
        elseif type == 1 then -- 英雄
            local HeroSkillProxy = global.Facade:retrieveProxy(global.ProxyTable.HeroSkillProxy)
            if skillID == 0 then
                HeroSkillProxy:SetComboSkill(key, nil)
            else
                HeroSkillProxy:SetComboSkill(key, skillID)
            end
            SL:onLUAEvent(LUA_EVENT_HERO_SET_COMBO_REFRESH, key)
        end
    end
end

function SkillProxy:GetComboOpenNum()
    return self._data.openComboNum
end

function SkillProxy:RespSetComboSkillOpenNum(msg)
    local header  = msg:GetHeader()
    local type = header.recog
    local openNum = header.param1
    if openNum and openNum > 0 then
        if type == 0 then -- 人物
            self._data.openComboNum = openNum
            SLBridge:onLUAEvent(LUA_EVENT_PLAYER_OPEN_COMBO_NUM, openNum)
        elseif type == 1 then -- 英雄
            local HeroSkillProxy = global.Facade:retrieveProxy(global.ProxyTable.HeroSkillProxy)
            HeroSkillProxy:SetComboOpenNum(openNum)
            SLBridge:onLUAEvent(LUA_EVENT_HERO_OPEN_COMBO_NUM, openNum)
        end
    end
end

-- 重置技能cd
function SkillProxy:handle_MSG_SC_REST_SKILL_CD(msg)
    local header    = msg:GetHeader()
    local skillID   = header.recog
    local remainCD  = header.param1
    local skillData = self:GetSkillByID(skillID)
    if skillData then
        remainCD = skillData.curTime - remainCD / 1000
        skillData.curTime = math.max(remainCD, 0)
    end
end

--------------------------------------------------------------------------

--------------------------------------- 技能动作 begin---------------------
function SkillProxy:GetSkillActionTime(action, clothID, sex)
    if not action then
        return nil
    end
    
    action = action - global.MMO.ACTION_YTPD + 1
    local configs = self._configs_skill_action[action]
    if not configs then
        return nil
    end
    

    if not configs.pcs then
        return nil
    end

    if clothID == 0 then
        clothID = 9999
    end

    local clothTime = 0.1
    if clothID then
        local ModelConfigProxy = global.Facade:retrieveProxy( global.ProxyTable.ModelConfigProxy )
        local anmindID    = GetFrameAnimConfigID( clothID, sex or 0, global.MMO.SFANIM_TYPE_PLAYER )
        local modelConfig = ModelConfigProxy:GetConfig( anmindID )
        if configs and configs.actionspeed == 0 then
            clothTime = modelConfig.attack_interval
        elseif configs and configs.actionspeed == 1 then
            clothTime = modelConfig.magic_interval
        end
    end

    return configs.pcs * clothTime
end

function SkillProxy:GetSkillActionSpeed(action)
    if not action then
        return nil
    end

    if action > global.MMO.ANIM_WJGZ then
        action = action + 2
    end
    action = action - global.MMO.ANIM_YTPD + 1

    local configs = self._configs_skill_action[action]
    if not configs then
        return nil
    end

    return configs.actionspeed
end
--------------------------------------- 技能动作   end---------------------

function SkillProxy:RegisterMsgHandler()
    SkillProxy.super.RegisterMsgHandler(self)
    local msgType = global.MsgType
    
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_SKILL_DATA,         handler(self, self.RespPlayerSkillData))        -- 主角 已学技能 信息
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_ADD_SKILL,          handler(self, self.RespPlayerAddSkill))         -- 新增技能
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_DEL_SKILL,          handler(self, self.RespPlayerDelSkill))         -- 删除技能
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_UP_SKILL,           handler(self, self.RespPlayerUpdateSkill))      -- 技能数据更新
    LuaRegisterMsgHandler(msgType.MSG_SC_SKILL_ONOFF,               handler(self, self.RespSkillOnoff))             -- 技能开关
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_UP_SKILL_CD,        handler(self, self.RespSkillUpdateSkillCD))             -- 技能CD改变
    LuaRegisterMsgHandler(msgType.MSG_SC_SENDMAGICSCRIPTEFFECT,     handler(self, self.handle_MSG_SC_SENDMAGICSCRIPTEFFECT))  --个人的技能表现修改列表
    LuaRegisterMsgHandler(msgType.MSG_SC_INITMAGICCD,               handler(self, self.handle_MSG_SC_INITMAGICCD))  --所有CD归0
    LuaRegisterMsgHandler(msgType.MSG_SC_REST_SKILL_CD,             handler(self, self.handle_MSG_SC_REST_SKILL_CD)) --重置技能cd

    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_NG_SKILL_DATA,      handler(self, self.RespPlayerNGSkillData))       -- 内功技能
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_ADD_NG_SKILL,       handler(self, self.RespPlayerAddNGSkill))
    LuaRegisterMsgHandler(msgType.MSG_SC_PLAYER_DEL_NG_SKILL,       handler(self, self.RespPlayerDelNGSkill))
    LuaRegisterMsgHandler(msgType.MSG_SC_SET_COMBO_SKILL,           handler(self, self.RespSetComboSkill))
    LuaRegisterMsgHandler(msgType.MSG_SC_SET_COMBO_SKILL_OPEN_NUM,  handler(self, self.RespSetComboSkillOpenNum))   -- 连击技能开启个数
end

return SkillProxy
