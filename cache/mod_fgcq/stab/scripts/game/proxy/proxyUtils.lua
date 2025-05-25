local utils        = {}
local tSort        = table.sort
local mAbs         = math.abs

-- RS_ENEMY    = 1,              -- 敌人
-- RS_NO       = 2,              -- 非敌人,没有关系
-- RS_GROUP    = 3,              -- 同队伍
-- RS_GUILD    = 4,              -- 同行会
-- RS_CAMP     = 5,              -- 同阵营
-- RS_ALLIANCE = 6,              -- 同盟
-- RS_NATION   = 7,              -- 国家

local CHECK_ENEMY_VALUE = {
    -- 获取最终的actor的主人玩家actor player
    [0] = function( targetActor )
        local masterActor = nil
        if targetActor:IsHero() or targetActor:IsPet() or targetActor:IsHumanoid() then
            local tMasterID     = targetActor:GetMasterID()
            local tMasterActor  = global.actorManager:GetActor( tMasterID )
            if tMasterActor and targetActor:IsHumanoid() and tMasterActor:IsHero() then
                tMasterID     = targetActor:GetMasterID()
                tMasterActor  = global.actorManager:GetActor( tMasterID )
            end
            if tMasterActor and tMasterActor:IsPlayer() then
                masterActor = tMasterActor
            end
        end
        return masterActor or targetActor
    end,
}

local CHECK_ENEMY_FUNC  = {
    -- 全体
    [global.MMO.HAM_ALL] = function( mainPlayer, targetActor )
        return global.MMO.RS_ENEMY
    end,

    -- 行会
    [global.MMO.HAM_GUILD] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local mGuildID      = mainPlayer:GetGuildID()
        local tGuildID      = tMasterActor and tMasterActor:GetGuildID()
        local GuildProxy    = global.Facade:retrieveProxy( global.ProxyTable.GuildProxy )
        if tGuildID and tGuildID ~= "" and mGuildID and mGuildID ~= "" and (mGuildID == tGuildID or GuildProxy:isGuildAlly(tGuildID)) then
            return global.MMO.RS_GUILD
        end
        return global.MMO.RS_ENEMY
    end,

    -- 队伍
    [global.MMO.HAM_GROUP] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local teamProxy     = global.Facade:retrieveProxy( global.ProxyTable.TeamProxy )
        local actorID       = tMasterActor and tMasterActor:GetID()
        if actorID and teamProxy:IsTeamMember( actorID) then
            return global.MMO.RS_GROUP
        end
        return global.MMO.RS_ENEMY
    end,

    -- 阵营
    [global.MMO.HAM_CAMP] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local mFaction = mainPlayer:GetFaction()
        if mFaction and mFaction > 0 and mFaction == tMasterActor:GetFaction() then
            return global.MMO.RS_CAMP
        end
        return global.MMO.RS_ENEMY
    end,

    -- 善恶
    [global.MMO.HAM_SHANE] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local mPKLv = mainPlayer:GetPKLv()
        local tPKLv = tMasterActor:GetPKLv()
        if not mPKLv or not tPKLv then
            return global.MMO.RS_NO
        end

        -- 白: 0 1  红 2  灰 3
        -- 白可以攻击灰/红    灰可以攻击灰
        if ( mPKLv == 0 or mPKLv == 1 or mPKLv == 3 ) and ( tPKLv == 2 or tPKLv == 3 ) then
            return global.MMO.RS_ENEMY
        end

        -- 红可以攻击红
        if mPKLv == 2 and tPKLv == 2 then
            return global.MMO.RS_ENEMY
        end

        return global.MMO.RS_NO
    end,

    -- 区服
    [global.MMO.HAM_SERVER] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        if mainPlayer:GetServerID() == tMasterActor:GetServerID() then
            return global.MMO.RS_SERVER
        end
        return global.MMO.RS_ENEMY
    end,

    -- 国家
    [global.MMO.HAM_NATION] = function( mainPlayer, targetActor )
        local mNationID = mainPlayer:GetNationID()
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local tNationID = nil
        if tMasterActor:IsPlayer() then
            tNationID = tMasterActor:GetNationID()
        elseif tMasterActor:IsMonster() and tMasterActor:IsNationEnemyPK() then
            tNationID = tMasterActor:GetNationID()
        end

        if mNationID and mNationID > 0 and mNationID == tNationID then
            return global.MMO.RS_NATION
        end

        return global.MMO.RS_ENEMY
    end,

    -- 夫妻
    [global.MMO.HAM_DEAR] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local dearID        = tMasterActor and tMasterActor:GetID()
        if dearID and dearID ~= "" and mainPlayer:GetDearID() == dearID then
            return global.MMO.RS_DEAR
        end
        return global.MMO.RS_ENEMY
    end,

    -- 师徒
    [global.MMO.HAM_MASTER] = function( mainPlayer, targetActor )
        local tMasterActor  = CHECK_ENEMY_VALUE[0]( targetActor )
        local masterID      = tMasterActor and targetActor:GetID()
        if masterID and masterID ~= "" and mainPlayer:GetSiTuID() == masterID then
            return global.MMO.RS_MASTER
        end
        return global.MMO.RS_ENEMY
    end,

    -- 和平
    [global.MMO.HAM_PEACE] = function()
        return global.MMO.RS_ENEMY
    end,
}

utils.checkEnemyTag = function( actor )
    if not actor then
        return global.MMO.RS_NO
    end

     -- 1. oneself
    local mainPlayer = global.gamePlayerController:GetMainPlayer()
    if not mainPlayer or ( actor:IsPlayer() and actor:IsMainPlayer() ) then
        return global.MMO.RS_NO
    end

    -- 除全体模式 可以锁定自己人外 别的模式不能锁定 走game表配置 默认可锁定
    local pkModeLocl = global.ConstantConfig.pk_mode_lock or 0
    if pkModeLocl == 1 and (actor:IsPlayer() or actor:IsMonster()) then
        return global.MMO.RS_ENEMY
    end

    -- check pk mode
    local playerPropertyProxy = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local pkState             = playerPropertyProxy:GetPKMode()

    if actor:IsMonster() and global.MMO.HAM_NATION ~= pkState then
        return global.MMO.RS_ENEMY
    end

    if actor:IsHumanoid() and global.MMO.HAM_NATION ~= pkState then
        return global.MMO.RS_ENEMY
    end

    if CHECK_ENEMY_FUNC[pkState] then
        return CHECK_ENEMY_FUNC[pkState]( mainPlayer, actor )
    end

    return global.MMO.RS_NO
end

utils.checkMemberByID = function( targetID )
    local targetActor = global.actorManager:GetActor( targetID )
    if nil == targetActor then
        return false
    end
    local mainPlayer = global.gamePlayerController:GetMainPlayer()
    if not mainPlayer then
        return false
    end

    if targetActor:IsPlayer() then
        return true
        
    elseif targetActor:IsMonster() then
        return targetActor:IsHaveMaster() 
    end
    return false
end

utils.checkLaunchTarget = function( targetActor )
    -- player & monster, only!!!!
    if false == targetActor:IsPlayer() and false == targetActor:IsMonster() then
        return false
    end

    local mainPlayer = global.gamePlayerController:GetMainPlayer()
    if not mainPlayer then
        return false
    end
    
    local playerPropertyProxy = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    local pkState             = playerPropertyProxy:GetPKMode()

    local autoProxy           = global.Facade:retrieveProxy( global.ProxyTable.Auto )
    
    if autoProxy:IsAutoFightState() then       --所有模式  可以攻击自己的宝宝
        ---- hero player / matser is main hero
        local HeroPropertyProxy = global.Facade:retrieveProxy( global.ProxyTable.HeroPropertyProxy )
        local heroID = HeroPropertyProxy:GetRoleUID()
        if heroID and (targetActor:GetID() == heroID or targetActor:GetMasterID() == heroID) then
            return false
        end

        -- main player / matser is main player
        if ( targetActor:IsPlayer() and targetActor:IsMainPlayer() ) or targetActor:GetMasterID() == mainPlayer:GetID() then
            return false
        end
    end

    -- dead & born
    if targetActor:IsDie() or targetActor:IsDeath() or targetActor:IsBorn() or targetActor:IsCave() then
        return false
    end
    
    -- hp 0
    if targetActor:GetHP() <= 0 then
        return false
    end

    -- humanoid
    if targetActor:IsPlayer() and targetActor:IsHumanoid() then
        if targetActor:GetMasterID() and utils.checkEnemyTag(targetActor) ~= 1 then --人性怪如果有MasterID, 要判断Master是否是敌友
            return false
        end
        return true
    end

    -- player, check is enmey
    if targetActor:IsPlayer() and utils.checkEnemyTag(targetActor) ~= 1 then
        return false
    end

    if targetActor:IsHero() and utils.checkEnemyTag(targetActor) ~= 1 then
        return false
    end

    if targetActor:IsMonster() and pkState == global.MMO.HAM_NATION and utils.checkEnemyTag(targetActor) ~= 1 then
        return false
    end

    -- 采集物
    if targetActor:IsCollection() then
        return false
    end

    return true
end

utils.checkLaunchTargetByID = function( targetID )
    local targetActor = global.actorManager:GetActor( targetID )
    if nil == targetActor then
        return false
    end
    return utils.checkLaunchTarget( targetActor )
end

utils.checkAutoTargetEnableByID = function( targetID )
    local targetActor = global.actorManager:GetActor( targetID )
    if nil == targetActor then
        return false
    end

    -- 被忽略
    if targetActor:IsIngored() then
        return false
    end

    -- 1.可攻击
    if false == utils.checkLaunchTargetByID(targetID) then
        return false
    end

    -- 2.守卫/宝宝 -- 有主人的人型怪也不打,分身等
    if false == targetActor:IsHero() and (true == targetActor:IsDefender() or true == targetActor:IsHaveMaster()) then
        return false
    end

    -- 3.归属不是自己的 且不是队友的
    local OwnerID = targetActor:GetOwnerID()
    local function checkInMyTeam(actorID)
        local teamProxy = global.Facade:retrieveProxy(global.ProxyTable.TeamProxy)
        return teamProxy:IsTeamMember(actorID)
    end
    if CHECK_SETTING(global.MMO.SETTING_IDX_NO_ATTACK_HAVE_BELONG) == 1 and OwnerID ~= "" and OwnerID ~= -1 and OwnerID ~= global.gamePlayerController:GetMainPlayerID() and not checkInMyTeam(OwnerID) then 
        return false
    end

    --内挂忽略的怪
    local ignoreNames = CHECK_SETTING(global.MMO.SETTING_IDX_IGNORE_MONSTER)--
    local name = targetActor:GetName()
    if not ignoreNames or (type(ignoreNames) ~= "table") then 
        ignoreNames = {} 
    end
    if name and ignoreNames[name] then 
        return false
    end

    return true
end

-- 校验 player 公会名字
utils.checkPlayerGuildName = function( guildName, jobName, castlename )
    local ret = guildName
    if guildName and string.len( guildName ) > 0 then
        if jobName and jobName ~= "" then -- 行会职位 自定义职位名称
            local showJobName = string.format(GET_STRING(1086), jobName)
            ret = ret .. " " .. showJobName
        end
        if castlename and castlename ~= "" then  -- 沙城行会
            ret = GET_STRING(800702) .. ret
        end
    end

    return ret
end

local CHECK_ITEM_AUTOPICK_EXTRA = function(itemIndex, bySprite)
    if GUIFunction and GUIFunction.CheckAutoPickItemEnable_Extra then
        local value = GUIFunction:CheckAutoPickItemEnable_Extra(itemIndex, bySprite == true)
        if type(value) == "boolean" then
            return value
        end
    end
    return true
end

-- 道具是否能自动拾取 isSprite：是否小精灵自动拾取
function utils:AutoPickItemEnable(dropItem, mainPlayerID, isSprite)
    if not dropItem then
        return false
    end

    if not mainPlayerID then
        mainPlayerID = global.gamePlayerController:GetMainPlayerID()
    end
    if not mainPlayerID then
        return false
    end

    local actorID = dropItem:GetID()
    local bPick = GetActorAttr(dropItem, global.MMO.ACTOR_ATTR_PICK)
    if not bPick then
        return false
    end

    local typeIndex = (dropItem:GetTypeIndex() == 0 and 1 or dropItem:GetTypeIndex())
    local GameSettingProxy = global.Facade:retrieveProxy( global.ProxyTable.GameSettingProxy )
    local group = GameSettingProxy:GetGroupIdByIndex(typeIndex)--是否配了组别
    if group or typeIndex ~= 1  then--金币不判断 开关  配置了组别的需要检测
        if not CHECK_ITEM_AUTO_PICK(typeIndex) or not CHECK_ITEM_PICK(typeIndex) then
            return false
        end
    end

    if typeIndex ~= 1 then --不是金币 判断一下背包负重
        local itemData = SL:GetMetaValue("ITEM_DATA", typeIndex)
        if itemData.Weight then 
            local maxbw = SL:GetMetaValue("MAXBW")
            local bw = SL:GetMetaValue("BW")
            if bw + itemData.Weight >= maxbw then 
                return false
            end
        end
    end

    --自己丢弃的物品不要自动拾取了
    local BagProxy = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local drops = BagProxy:GetSelfDropItems()
    for i,v in ipairs(drops) do
        if v == dropItem:GetMakeIndex() then 
            return false
        end
    end
    local HeroBagProxy = global.Facade:retrieveProxy( global.ProxyTable.HeroBagProxy )
    local drops2 = HeroBagProxy:GetSelfDropItems()
    for i,v in ipairs(drops2) do
        if v == dropItem:GetMakeIndex() then 
            return false
        end
    end

    local ItemConfigProxy = global.Facade:retrieveProxy( global.ProxyTable.ItemConfigProxy )
    local itemData =  ItemConfigProxy:GetItemDataByIndex(typeIndex)
    local ConditionProxy =  global.Facade:retrieveProxy( global.ProxyTable.ConditionProxy )
    local conditionsList = string.split(itemData.pickCondition or "", "|")
    if not ConditionProxy:CheckCondition(conditionsList[1] or "") then 
        return false
    end

    -- 道具能否小精灵自动拾取
    if isSprite then
        if conditionsList[2] and tonumber(conditionsList[2]) == 1 then
            return false
        end
    end

    if dropItem:CheckOwnerID( mainPlayerID ) then
        if not CHECK_ITEM_AUTOPICK_EXTRA(typeIndex, isSprite) then
            return false
        end
        return true
    end

    local teamProxy = global.Facade:retrieveProxy( global.ProxyTable.TeamProxy )
    if teamProxy:IsTeamMember( dropItem:GetOwnerID() ) then   -- owner is not team member
        if not CHECK_ITEM_AUTOPICK_EXTRA(typeIndex, isSprite) then
            return false
        end
        return true
    end

    return false
end

-- 道具是否能拾取
function utils:DropItemPickEnable( dropItem )
    if not dropItem then
        return false
    end

    local typeIndex = (dropItem:GetTypeIndex() == 0 and 1 or dropItem:GetTypeIndex())
    if not CHECK_ITEM_PICK(typeIndex) then
        return false
    end
    
    return true
end

utils.isDrug = function(itemIndex)
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugSHY")) do
        if itemIndex == v then
            return true,1
        end
    end
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugHY")) do
        if itemIndex == v then
            return true,2
        end
    end
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugLY")) do
        if itemIndex == v then
            return true,3
        end
    end
    return false
end

utils.isStone = function(itemIndex)
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","cityStone")) do
        if itemIndex == v then
            return true
        end
    end
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","randStone")) do
        if itemIndex == v then
            return true
        end
    end

    return false
end

utils.findItemByIndex = function(index)
    local bagProxy      = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local QuickUseProxy = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )

    local itemData = QuickUseProxy:GetQucikUseDataByIndex(index)
    if itemData and itemData[1] then
        return itemData[1]
    end

    local itemData = bagProxy:GetItemDataByItemIndex(index)
    if itemData and itemData[1] then
        return itemData[1]
    end

    return nil
end
utils.findItemByIndex_Hero = function(index)
    local bagProxy = global.Facade:retrieveProxy( global.ProxyTable.HeroBagProxy )
    local itemData = bagProxy:GetItemDataByItemIndex(index)
    if itemData and itemData[1] then
        return itemData[1]
    end

    return nil
end

utils.findItemCountByIndex = function(index)
    local bagProxy      = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local QuickUseProxy = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )

    local count         = 0
    local itemData = QuickUseProxy:GetQucikUseDataByIndex(index)
    if itemData and itemData[1] then
        count           = count + #itemData
    end

    local itemData = bagProxy:GetItemDataByItemIndex(index)
    if itemData and itemData[1] then
        count           = count + #itemData
    end

    return count
end

utils.findItemCountByIndex_Hero = function(index)
    local bagProxy      = global.Facade:retrieveProxy( global.ProxyTable.HeroBagProxy )
    local count         = 0
    local itemData = bagProxy:GetItemDataByItemIndex(index)
    if itemData and itemData[1] then
        count           = count + #itemData
    end

    return count
end

utils.findBagCountByIndex = function(index)
    local bagProxy      = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local QuickUseProxy = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )

    local count         = 0
    local itemData = bagProxy:GetItemDataByItemIndex(index)
    if itemData and itemData[1] then
        count           = count + #itemData
    end

    return count
end

utils.unpackDrugByIndex = function(itemIndex, ignoreCount)
    local bagProxy          = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local ItemUseProxy      = global.Facade:retrieveProxy( global.ProxyTable.ItemUseProxy )
    local QuickUseProxy     = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )
    local ItemConfigProxy   = global.Facade:retrieveProxy( global.ProxyTable.ItemConfigProxy )

    -- 药品才有解包逻辑 + 回城/随机
    local drug,drugType = utils.isDrug(itemIndex)
    if not drug and not utils.isStone(itemIndex) then
        return false
    end

    -- 背包有，不需要解包
    local itemCount      = utils.findItemCountByIndex(itemIndex)
    if itemCount >= 1 and not ignoreCount then
        return false
    end

    -- 没有配置药品包
    if #SL:GetMetaValue("GAME_DATA","allDrugPack") == 0 then
        return false
    end

    local PlayerProperty = global.Facade:retrieveProxy( global.ProxyTable.PlayerProperty )
    if not PlayerProperty then
        return false
    end

    if drugType == 3 then
        local roleLevel = PlayerProperty:GetRoleLevel()
        local roleJob   = PlayerProperty:GetRoleJob()
        if roleLevel < 28 and roleJob == global.MMO.ACTOR_PLAYER_JOB_FIGHTER then
            return false
        end
    end

    -- 解包时格子数
    local limitCount        = bagProxy:GetMaxBag() + QuickUseProxy:GetQuickUseSize()--global.MMO.QUICK_USE_SIZE
    local totalCount        = bagProxy:GetTotalItemCount() + QuickUseProxy:GetQuickUseItemTotalCount()
    
    -- 找解包药
    local unpackItem = nil
    local unpackItemCount = nil
    local function findPackItem(item)
        if unpackItem then
            return
        end
        if item.AniCount == 0 then
            return
        end
        
        for k, v in pairs(SL:GetMetaValue("GAME_DATA","allDrugPack")) do
            if v.Shape == item.AniCount and v.Index ~= item.Index then
                local itemData = bagProxy:GetItemDataByItemIndex(v.Index)
                if itemData and itemData[1] then
                    -- 找到可以解包了
                    unpackItem = itemData[1]
                    unpackItemCount = unpackItem.nUnPackCount
                    if unpackItem.OverLap and unpackItem.OverLap > 0 then
                        unpackItemCount = 1
                    end
                else
                    -- 未找到，继续向上套
                    findPackItem(v)
                end
                break
            end
        end
    end

    -- 解包
    unpackItem = nil
    findPackItem(ItemConfigProxy:GetItemDataByIndex(itemIndex))

    if unpackItem then
        local calcCount = totalCount + (unpackItemCount or 1) -1
        if calcCount <= limitCount then
            ItemUseProxy:UseItem(unpackItem)
            print("UNPACK", unpackItem.Name)
            return true
        end
    end

    return false
end

utils.unpackDrugByIndex_Hero = function(itemIndex, ignoreCount,notuse)
    local bagProxy          = global.Facade:retrieveProxy( global.ProxyTable.HeroBagProxy )
    local ItemUseProxy      = global.Facade:retrieveProxy( global.ProxyTable.ItemUseProxy )
    -- local QuickUseProxy     = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )
    local ItemConfigProxy   = global.Facade:retrieveProxy( global.ProxyTable.ItemConfigProxy )

    -- 药品才有解包逻辑
    if not utils.isDrug(itemIndex) then
        return false
    end

    -- 背包有，不需要解包
    local itemCount      = utils.findItemCountByIndex_Hero(itemIndex)
    if itemCount >= 1 and not ignoreCount then
        return false
    end

    -- 没有配置药品包
    if #SL:GetMetaValue("GAME_DATA","allDrugPack") == 0 then
        return false
    end

    -- 解包时格子数
    local limitCount        = bagProxy:getBagMaxNum()--global.MMO.MAX_ITEM_NUMBER --+ global.MMO.QUICK_USE_SIZE
    local totalCount        = bagProxy:GetTotalItemCount() --+ QuickUseProxy:GetQuickUseItemTotalCount()
    
    -- 找解包药
    local unpackItem = nil
    local function findPackItem(item)
        if unpackItem then
            return
        end
        if item.AniCount == 0 then
            return
        end
        
        for k, v in pairs(SL:GetMetaValue("GAME_DATA","allDrugPack")) do
            if v.Shape == item.AniCount then
                local itemData = bagProxy:GetItemDataByItemIndex(v.Index)
                if itemData and itemData[1] then
                    -- 找到可以解包了
                    unpackItem = itemData[1]
                else
                    -- 未找到，继续向上套
                    findPackItem(v)
                end
                break
            end
        end
    end

    -- 解包
    unpackItem = nil
    findPackItem(ItemConfigProxy:GetItemDataByIndex(itemIndex))

    if unpackItem then
        local calcCount = totalCount + (unpackItem.nUnPackCount or 1) -1
        if calcCount <= limitCount and not  notuse then
            ItemUseProxy:HeroUseItem(unpackItem)
            print("UNPACK", unpackItem.Name)
            return true
        end
    end

    return false
end

utils.autoUnpackDrug = function()
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugSHY")) do
        if utils.unpackDrugByIndex(v) then
            return true
        end
    end
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugHY")) do
        if utils.unpackDrugByIndex(v) then
            return true
        end
    end
    for _, v in ipairs(SL:GetMetaValue("GAME_DATA","drugLY")) do
        if utils.unpackDrugByIndex(v) then
            return true
        end
    end
    return false
end

function utils:getFixItemDrug()
    local bagProxy      = global.Facade:retrieveProxy( global.ProxyTable.Bag )
    local QuickUseProxy = global.Facade:retrieveProxy( global.ProxyTable.QuickUseProxy )

    for _, v in ipairs( SL:GetMetaValue("GAME_DATA","fixItemDrug") ) do
        local itemData = QuickUseProxy:GetQucikUseDataByIndex(v)
        if itemData and itemData[1] then
            return itemData[1]
        end

        local itemData = bagProxy:GetItemDataByItemIndex(v)
        if itemData and itemData[1] then
            return itemData[1]
        end
    end
    return nil
end

-- 是否能采集
function utils:CheckCollectionEnable( collection, mainPlayer )
    -- 死亡
    if collection:IsDie() then
        return false
    end

    return true
end

-- 是否能挖肉
function utils:checkDigEnable(target, mainPlayer)
    return GUIFunction:CheckTargetDigAble(target:GetID())
end

--英雄选中的目标是否能锁定
function utils:checkHeroLockTargetEnable(target)
    return utils.checkLaunchTarget(target)
end

--内挂 范围内是否有足够怪物 不拾取 
function utils:checkIsEnoughMonster(target)
    local values
    local EnoughCount =  1
    local distance = 1
    values =  GET_SETTING(global.MMO.SETTING_IDX_N_RANGE_NO_PICK,true)
    distance = tonumber(values[2]) or 0
    local enable = values[1] and values[1] == 1 
    if not enable then 
        return false
    end

    local mainPlayerID = global.gamePlayerController:GetMainPlayerID()
    return utils.checkIsEnoughEnemy(mainPlayerID,EnoughCount,distance)
end

--四周是否有足够的敌人
utils.checkIsEnoughEnemy = function(targetID,count,distance)
    local targetActor = global.actorManager:GetActor( targetID )
    if not targetActor then
        return false
    end
    
    local enoughCount = tonumber(count) or 3
    local count = 0
    local actors, actorNums = global.actorManager:GetActors()
    local pMapX = targetActor:GetMapX()
    local pMapY = targetActor:GetMapY()
    distance    = distance or 2     -- 多少格之内

    for i = 1, actorNums do
        local actor = actors[i]
        if actor then
            if (actor:IsPlayer() or actor:IsMonster()) and mAbs(actor:GetMapX() - pMapX) <= distance and mAbs(actor:GetMapY() - pMapY) <= distance and utils.checkLaunchTargetByID(actor:GetID()) then
                count = count + 1
            end
            if count >= enoughCount then
                return true
            end
        end
    end
    
    return false
end
--四周是否有足够的敌人（人物）
utils.checkIsEnoughEnemyPlayer = function(targetID, count, distance)
    local targetActor = global.actorManager:GetActor( targetID )
    if not targetActor then
        return false
    end
    
    local enoughCount = tonumber(count) or 3
    local count = 0
    local actors, actorNums = global.playerManager:GetPlayersInCurrViewField()
    local pMapX = targetActor:GetMapX()
    local pMapY = targetActor:GetMapY()
    distance    = distance or 2 -- 多少格之内

    for i = 1, actorNums do
        local actor = actors[i]
        if actor and not actor:IsHumanoid() then
            if actor and mAbs(actor:GetMapX() - pMapX) <= distance and mAbs(actor:GetMapY() - pMapY) <= distance and utils.checkLaunchTargetByID(actor:GetID()) then
                count = count + 1
            end
            if count >= enoughCount then
                return true
            end
        end
    end
    
    return false
end
--四周是否有足够的红名
utils.checkIsEnoughRedNameEnemy = function(targetID,count,distance)
    local targetActor = global.actorManager:GetActor( targetID )
    if not targetActor then
        return false
    end
    
    local enoughCount = tonumber(count) or 3
    local count = 0
    local actors, actorNums = global.playerManager:GetPlayersInCurrViewField()
    local pMapX = targetActor:GetMapX()
    local pMapY = targetActor:GetMapY()
    distance    = distance or 2 -- 多少格之内

    for i = 1, actorNums do
        local actor = actors[i]
        if actor then
            if actor and mAbs(actor:GetMapX() - pMapX) <= distance and mAbs(actor:GetMapY() - pMapY) <= distance and utils.checkLaunchTargetByID(actor:GetID()) and actor:GetPKLv() == 2 then
                count = count + 1
            end
            if count >= enoughCount then
                return true
            end
        end
    end
    
    return false
end
--人物是否需要放弃自动拾取
utils.checkIsPlayerAbandonPickup = function()
    local PickupSpriteProxy         = global.Facade:retrieveProxy( global.ProxyTable.PickupSpriteProxy )
    if not PickupSpriteProxy or not PickupSpriteProxy:getPickupSpriteState() then
        return false
    end
    local mode = PickupSpriteProxy:getPickSpriteMode()
    if mode == 0 or mode == 1 then 
        return false
    end
    return true --模式 2 3 是一个个拾取 需要放弃
end
return utils
