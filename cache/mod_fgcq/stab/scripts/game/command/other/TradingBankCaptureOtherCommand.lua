local TradingBankCaptureOtherCommand = class('TradingBankCaptureOtherCommand', framework.SimpleCommand)

function TradingBankCaptureOtherCommand:ctor()
end

function TradingBankCaptureOtherCommand:execute(notification)
    local typenum = nil
    local action = nil
    local typeAction = nil
    self.publishImage = {}
    self.tableDataUrl = {}
    local databody = notification:getBody()
    if databody then
        typenum = databody.type
        if typenum == 1 then
            local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
            self.tableDataUrl = otherTradingBankProxy:getPublishTableData()
        else
            action = typenum.action or nil
            typeAction = typenum.type or nil
        end
    end

    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCaptureMaskLayer_Open)
    local NPCStorageProxy = global.Facade:retrieveProxy(global.ProxyTable.NPCStorageProxy)
    NPCStorageProxy:RequestStorageData()--请求仓库数据
    local NT = global.NoticeTable

    local message = {
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EQUIP }, mediator = "PlayerFrameMediator", position = "equip" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EQUIP,bigImage = true }, mediator = "PlayerFrameMediator", position = "equip" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_BASE_ATTRI }, mediator = "PlayerFrameMediator", position = "status" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EXTRA_ATTRO,typeCapture = 1 }, mediator = "PlayerFrameMediator", position = "attribute" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SKILL,typeCapture = 1 }, mediator = "PlayerFrameMediator", position = "skill" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_TITLE ,typeCapture = 1 }, mediator = "PlayerFrameMediator", position = "title" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SUPER_EQUIP }, mediator = "PlayerFrameMediator", position = "clothes" },
        { open = NT.Layer_Player_Open, close = NT.Layer_Player_Close, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SUPER_EQUIP,bigImage = true  }, mediator = "PlayerFrameMediator", position = "clothes" },
        -- {open = NT.Layer_Bag_Open, close = NT.Layer_Bag_Close,  extent = {pos = {x = 0, y = 0}},mediator = "BagLayerMediator",node = "panel",position = "bag"},
        --{ open = NT.Layer_NPC_Storage_Open, close = NT.Layer_NPC_Storage_Close, extent = { noShowBag = true }, mediator = "NPCStorageMediator", position = "warehouse" },

    }
    if action == "screenshots" and typeAction == "prop" then
        message = {}
    end
    -----------------------------------------------------
    local ItemMoveProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemMoveProxy)
    local EquipProxy = global.Facade:retrieveProxy(global.ProxyTable.Equip)
    local data = {}
    --玩家身上的装备
    data = EquipProxy:GetEquipData()

    for k, v in pairs(data) do
        local val = {}
        val.itemData = v
        val.pos = cc.p(0, 0)--equipPanel:getWorldPosition()
        val.from = ItemMoveProxy.ItemFrom.PALYER_EQUIP
        val.typeCapture = 1
        local t = { open = NT.Layer_ItemTips_Open, close = NT.Layer_ItemTips_Close, extent = val, mediator = "ItemTipsMediator", node = "_CaptureNode", position = "equip" }
        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, t)
            end
        else
            table.insert(message, t)
        end
    end


    self.m_files = {}
    self.m_filesPublish = {}
    -------------------------------------------------------背包多页
    local BagProxy = global.Facade:retrieveProxy(global.ProxyTable.Bag)
    local bagmax = BagProxy:GetMaxBag()
    local pagenum = math.ceil(bagmax / global.MMO.MAX_ITEM_NUMBER)
    for i = 1, pagenum do
        local ebs = { open = NT.Layer_Bag_Open, close = NT.Layer_Bag_Close, extent = {pos = { x = 0, y = 0 }, bag_page = i }, mediator = "BagLayerMediator", node = "panel", position = "bag" }
        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, ebs)
            end
        else
            table.insert(message, ebs)
        end
    end
    -------------------------------------------------------仓库
    local NPCStorageProxy = global.Facade:retrieveProxy(global.ProxyTable.NPCStorageProxy)
    local storemax = NPCStorageProxy:GetMaxPage()
    for i = 1,storemax do
        local ebs = { open = NT.Layer_NPC_Storage_Open, close = NT.Layer_NPC_Storage_Close, extent = { noShowBag = true, initPage = i }, mediator = "NPCStorageMediator", position = "warehouse" }
        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, ebs)
            end
        else
            table.insert(message, ebs)
        end
    end
    
    -----------------------------------------------生肖
    local activeState = EquipProxy:GetBestRingsOpenState()
    if activeState then
        -- global.Facade:sendNotification(global.NoticeTable.Layer_PlayerBestRing_Open,{param={lookPlayer = self._playerLook}})
        local ebs = { open = NT.Layer_PlayerBestRing_Open, close = NT.Layer_PlayerBestRing_Close, extent = {
            id = global.LayerTable.PlayerBestRingLayer,
            param = {
                lookPlayer = false
            }
        }, mediator = "PlayerBestRingLayerMediator", position = "equip" }

        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, ebs)
            end
        else
            table.insert(message, ebs)
        end
    end


    -----------------------------------------------------itemTips
    local screenshots = false
    if action == "screenshots" and typeAction == "prop" then
        screenshots = true
    elseif typenum ~= 1 then
        screenshots = true
    end
    if screenshots then
        --筛选背包寄售装备
        local dataBag = {}
        local bagProxy      = global.Facade:retrieveProxy(global.ProxyTable.Bag)
        local quickUseProxy = global.Facade:retrieveProxy(global.ProxyTable.QuickUseProxy)
        local quickData     = quickUseProxy:GetQuickUseData()
        local bagData       = bagProxy:GetBagData()
        local itemConfigProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemConfigProxy)

        local articleType       = itemConfigProxy:GetArticleType()
        local checkArticleType  = {[articleType.TYPE_TRADE_AUCTIONA] = true}
        for _, vItem in pairs(quickData) do
            if not itemConfigProxy:GetItemArticle(vItem.Index, checkArticleType)
            and self:CheckConditions(vItem) then
                table.insert(dataBag, vItem)
            end
        end
        for _, vItem in pairs(bagData) do
            if not itemConfigProxy:GetItemArticle(vItem.Index, checkArticleType)
            and self:CheckConditions(vItem) then
                table.insert(dataBag, vItem)
            end
        end
        for k, v in pairs(dataBag) do
            local val = {}
            val.itemData = v
            val.pos = cc.p(0, 0)--equipPanel:getWorldPosition()
            val.from = ItemMoveProxy.ItemFrom.PALYER_EQUIP
            val.bag  = true
            val.typeCapture = 1
            local t = { open = NT.Layer_ItemTips_Open, close = NT.Layer_ItemTips_Close, extent = val, mediator = "ItemTipsMediator", node = "_CaptureNode", position = "equip" }
            table.insert(message, t)
        end
        --可寄售物品装备icon图
        for k, v in pairs(dataBag) do
            local val = {}
            val.itemData = v
            val.pos = cc.p(0, 0)
            local t = { open = NT.Layer_ItemIcon_Open, close = NT.Layer_ItemIcon_Close, extent = val, mediator = "ItemIconMediator", node = "_CaptureNode", position = "equip" }
            table.insert(message, t)
        end
    end
    -----------------------------------------------------hero
    local HeroPropertyProxy = global.Facade:retrieveProxy(global.ProxyTable.HeroPropertyProxy)
    if HeroPropertyProxy:IsHeroOpen() then
        local PlayerPropertyProxy = global.Facade:retrieveProxy(global.ProxyTable.PlayerProperty)
        if PlayerPropertyProxy:getIsMakeHero() then
            if not HeroPropertyProxy:HeroIsLogin() then
                HeroPropertyProxy:RequestHeroInOrOut()
            end
            local heromessage = {
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EQUIP }, mediator = "HeroFrameMediator", position = "hero_equip" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EQUIP,bigImage = true }, mediator = "HeroFrameMediator", position = "hero_equip" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_BASE_ATTRI }, mediator = "HeroFrameMediator", position = "hero_status" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_EXTRA_ATTRO,typeCapture = 1 }, mediator = "HeroFrameMediator", position = "hero_attribute" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SKILL,typeCapture = 1 }, mediator = "HeroFrameMediator", position = "hero_skill" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_TITLE,typeCapture = 1 }, mediator = "HeroFrameMediator", position = "hero_title" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SUPER_EQUIP }, mediator = "HeroFrameMediator", position = "hero_clothes" },
                { open = NT.Layer_Player_Open_Hero, close = NT.Layer_Player_Close_Hero, extent = { extent = SLDefine.PlayerPage.MAIN_PLAYER_LAYER_SUPER_EQUIP,bigImage = true }, mediator = "HeroFrameMediator", position = "hero_clothes" },
                { open = NT.Layer_HeroBag_Open, close = NT.Layer_HeroBag_Close, extent = {pos = { x = 0, y = 0 }}, mediator = "HeroBagLayerMediator", node = "panel", position = "hero_bag" },
            }

            if action == "screenshots" then
                if typeAction == "role" then
                    for i, v in ipairs(heromessage) do
                        table.insert(message, v)
                    end
                end  
            else
                for i, v in ipairs(heromessage) do
                    table.insert(message, v)
                end
            end

            
        end
    end
    -----------------------------------------------hero生肖
    local HeroEquipProxy = global.Facade:retrieveProxy(global.ProxyTable.HeroEquipProxy)
    local herodata = HeroEquipProxy:GetEquipData()
    local activeState = HeroEquipProxy:GetBestRingsOpenState()
    if activeState then
        -- global.Facade:sendNotification(global.NoticeTable.Layer_PlayerBestRing_Open,{param={lookPlayer = self._playerLook}})
        local ebs = { open = NT.Layer_PlayerBestRing_Open_Hero, close = NT.Layer_PlayerBestRing_Close_Hero, extent = {
            id = global.LayerTable.PlayerBestRingLayer,
            param = {
                lookPlayer = false
            }
        }, mediator = "HeroBestRingLayerMediator", position = "hero_equip" }
        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, ebs)
            end
        else
            table.insert(message, ebs)
        end
    end


    -----------------------------------------------------hero   itemTips
    local ItemMoveProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemMoveProxy)
    for k, v in pairs(herodata) do
        local val = {}
        val.itemData = v
        val.pos = cc.p(0, 0)--equipPanel:getWorldPosition()
        val.from = ItemMoveProxy.ItemFrom.HERO_EQUIP
        val.typeCapture = 1
        local t = { open = NT.Layer_ItemTips_Open, close = NT.Layer_ItemTips_Close, extent = val, mediator = "ItemTipsMediator", node = "_CaptureNode", position = "hero_equip" }

        if action == "screenshots" then
            if typeAction == "role" then
                table.insert(message, t)
            end
        else
            table.insert(message, t)
        end
    end
    --------------------------------------------------单面板特殊处理
    if HeroPropertyProxy:getIsMergePanelMode() then
        for i, v in ipairs(message) do
            if v.mediator == "BagLayerMediator" or v.mediator == "HeroBagLayerMediator" then
                v.mediator = "MergeBagLayerMediator"
            elseif v.mediator == "PlayerFrameMediator" or v.mediator == "HeroFrameMediator" then
                v.mediator = "MergePlayerLayerMediator"
                v.node = "_CaptureNode"
            end
        end
    end
    -------------------------------------------------------
    local index = 1
    local FileUtils = cc.FileUtils:getInstance()
    local WritablePath = FileUtils:getWritablePath()
    local textureCache  = global.Director:getTextureCache()
    local repIndex = 0
    local repFunc

    local validTipsMessage = {}
    local validTipsNum = 0
    local validIconNum = 0
    repFunc = function()
        repIndex = repIndex + 1
        if repIndex > #message then --end
            dump(self.m_files,"m_files")
            if action == "screenshots" then
                --预留接口暂时废弃
                local OtherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
                OtherTradingBankProxy:sendDataToH5(self.m_files,action)
            else
                if typenum ~= 1 then--h5 上传图片流程
                    local OtherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
                    OtherTradingBankProxy:captureResult(self.m_files)
                else
                    self:uploadImg() -- app上传图片流程
                    --LockPublishRole()
                end
            end
            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCaptureMaskLayer_Close)
            return 
        end
        local val = message[repIndex]
        local position = val.position or "equip"
        local path = WritablePath..position..repIndex..".png"
        local pathPublish = position..repIndex..".png"

        if val.position == "clothes" or val.position == "hero_clothes" then
            if val.extent.bigImage then
                path = WritablePath..position..repIndex.."_big"..".png"
                pathPublish = position..repIndex.."_big"..".png"
            else
                path = WritablePath..position..repIndex.."_small"..".png"
                pathPublish = position..repIndex.."_small"..".png"
            end
            
        elseif val.position == "equip"and (val.mediator == "PlayerFrameMediator" or val.mediator == "MergePlayerLayerMediator") then 
            if val.extent.bigImage then
                path = WritablePath..position..repIndex.."_big"..".png"
                pathPublish = position..repIndex.."_big"..".png"
            else
                path = WritablePath..position..repIndex.."_small"..".png"
                pathPublish = position..repIndex.."_small"..".png"
            end
        elseif val.position == "hero_equip"and (val.mediator == "HeroFrameMediator" or val.mediator == "MergePlayerLayerMediator") then
            if val.extent.bigImage then
                path = WritablePath..position..repIndex.."_big"..".png"
                pathPublish = position..repIndex.."_big"..".png"
            else
                path = WritablePath..position..repIndex.."_small"..".png"
                pathPublish = position..repIndex.."_small"..".png"
            end
        end

        local newbag = ""
        if val.mediator == "ItemTipsMediator" and val.extent.from == ItemMoveProxy.ItemFrom.PALYER_EQUIP and val.extent.bag == true then
            validTipsNum = validTipsNum + 1
            validTipsMessage[validTipsNum] = ""
            newbag = "bag"
            path = WritablePath..newbag..position..repIndex..".png"
            pathPublish = newbag..position..repIndex..".png"
        end
        local iconPath  = ""
        if val.mediator == "ItemIconMediator"then
            validIconNum = validIconNum + 1
            iconPath = validTipsMessage[validIconNum] or ""
            path = WritablePath..position..repIndex..iconPath..".png"
            pathPublish = position..repIndex..iconPath..".png"
        end
	
	    --截长图
        if val.position == "attribute" or val.position == "hero_attribute" then--属性
            path = WritablePath..position..repIndex.."_long"..".png"
            pathPublish = position..repIndex.."_long"..".png"
        elseif val.position == "skill" or val.position == "hero_skill" then--技能
            path = WritablePath..position..repIndex.."_long"..".png"
            pathPublish = position..repIndex.."_long"..".png"
        elseif val.position == "title" or val.position == "hero_title" then--称号
            path = WritablePath..position..repIndex.."_long"..".png"
            pathPublish = position..repIndex.."_long"..".png"
        end

        if FileUtils:isFileExist(path) then
            FileUtils:removeFile(path)
        end
        
        global.Facade:sendNotification(val.open, val.extent)
        local mediator = global.Facade:retrieveMediator(val.mediator)
        if mediator._layer then
            local node = val.node and mediator._layer[val.node] or  mediator._layer._root
            local time = 0.5
            local CloseFunc = function()
                global.Facade:sendNotification(val.close)
                repFunc()
            end
            PerformWithDelayGlobal (function ()
                if val.mediator == "BagLayerMediator" then--背包
                    if node then
                        local size2 = node:getContentSize()
                        node:setContentSize(size2.width+20,size2.height+60)
                        for i,v in ipairs(node:getChildren()) do
                            v:setPositionY(v:getPositionY()+60)
                        end
                    end 
                end
                --截图
                local str = ""
                if val.position == "clothes" or val.position == "hero_clothes" then
                    if val.extent.bigImage then
                        str = "_big"
                    else
                        str = "_small"
                    end
                    
                elseif val.position == "equip"and (val.mediator == "PlayerFrameMediator" or val.mediator == "MergePlayerLayerMediator") then
                    if val.extent.bigImage then
                        str = "_big"
                    else
                        str = "_small"
                    end
                elseif val.position == "hero_equip"and (val.mediator == "HeroFrameMediator" or val.mediator == "MergePlayerLayerMediator") then
                    if val.extent.bigImage then
                        str = "_big"
                    else
                        str = "_small"
                    end
                end
		
                if val.position == "attribute" or val.position == "hero_attribute" then--属性
                    str = "_long"
                elseif val.position == "skill" or val.position == "hero_skill" then--技能
                    str = "_long"
                elseif val.position == "title" or val.position == "hero_title" then--称号
                    str = "_long"
                elseif (val.position == "equip" or val.position == "hero_equip") and val.mediator == "ItemTipsMediator" then--装备tips
                    if ItemTips and ItemTips.manyHeight ~= nil and type(ItemTips.manyHeight) == "number" and ItemTips.manyHeight > 0 then
                        if node then
                            local size = node:getContentSize()
                            local disY = ItemTips.manyHeight-size.height
                            if disY > 0 then
                                str = "_long"
                                path = WritablePath..newbag..position..repIndex.."_long"..".png"
                                pathPublish = newbag..position..repIndex.."_long"..".png"
                            end
                        end
                    end
                end
		
		
                if node and self:CaptureNode(val,newbag..position..repIndex..iconPath..str..".png",node) then
                    if val.mediator == "ItemTipsMediator" and val.extent.from == ItemMoveProxy.ItemFrom.PALYER_EQUIP and val.extent.bag == true then
                        local makeindex  = val.extent.itemData.MakeIndex or "nil"
                        local maketype   = val.extent.itemData.StdMode or "nil"
                        local makenum    = val.extent.itemData.OverLap or "nil"
                        local makename   = val.extent.itemData.Name or "nil"
                        makename = string.gsub(makename, "_", "")
                        validTipsMessage[validTipsNum] = "_"..newbag..position..repIndex.."_"..makeindex.."_"..maketype.."_"..makenum.."_"..makename
                    end
                    if not self.m_files[position] then
                        self.m_files[position] = {}
                    end
                    if not self.m_filesPublish[position] then
                        self.m_filesPublish[position] = {}
                    end
                    table.insert(self.m_files[position],path)
                    table.insert(self.m_filesPublish[position],pathPublish)
                    PerformWithDelayGlobal(function ()
                        index = index+1
                        CloseFunc()
                    end,0.1)
                else
                    CloseFunc()
                end
            end,time)

        else
            --异常 比如英雄未召唤
            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCaptureMaskLayer_Close)     
        end
    end
    repFunc()
end

function TradingBankCaptureOtherCommand:CaptureNode(val,filename, node, pos)
    local res = true
    if tolua.isnull(node) then
        return
    end
    local size = node:getContentSize()
    --截大图
    if (val.position == "clothes" or val.position == "hero_clothes") and val.extent.bigImage then
        size.width = SL:GetMetaValue("SCREEN_WIDTH")
        size.height = SL:GetMetaValue("SCREEN_HEIGHT")
    elseif val.position == "equip" and (val.mediator == "PlayerFrameMediator" or val.mediator == "MergePlayerLayerMediator") and val.extent.bigImage then
        size.width = SL:GetMetaValue("SCREEN_WIDTH")
        size.height = SL:GetMetaValue("SCREEN_HEIGHT")
    elseif val.position == "hero_equip" and (val.mediator == "HeroFrameMediator" or val.mediator == "MergePlayerLayerMediator") and val.extent.bigImage then
        size.width = SL:GetMetaValue("SCREEN_WIDTH")
        size.height = SL:GetMetaValue("SCREEN_HEIGHT")
    else
        node:setPosition(cc.p(0, 0))
        node:setAnchorPoint(cc.p(0, 0))
    end

    --截长图
    local disY = 0
    if val.position == "attribute" then--属性
        if PlayerExtraAtt and PlayerExtraAtt.manyHeight ~= nil and type(PlayerExtraAtt.manyHeight) == "number" and PlayerExtraAtt.manyHeight > 0 then
            disY = PlayerExtraAtt.manyHeight
            dump(disY,"attribute_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "skill" then--技能
        if PlayerSkill and PlayerSkill.manyHeight ~= nil and type(PlayerSkill.manyHeight) == "number" and PlayerSkill.manyHeight > 0 then
            disY = PlayerSkill.manyHeight
            dump(disY,"skill_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "title" then--称号
        if PlayerTitle and PlayerTitle.manyHeight ~= nil and type(PlayerTitle.manyHeight) == "number" and PlayerTitle.manyHeight > 0 then
            disY = PlayerTitle.manyHeight
            dump(disY,"title_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "equip" and val.mediator == "ItemTipsMediator" then--装备tips
        if ItemTips and ItemTips.manyHeight ~= nil and type(ItemTips.manyHeight) == "number" and ItemTips.manyHeight > 0 then
            disY = ItemTips.manyHeight-size.height
            dump(disY,"ItemTips_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    end

    --英雄截图
    if val.position == "hero_attribute" then--属性
        if HeroExtraAtt and HeroExtraAtt.manyHeight ~= nil and type(HeroExtraAtt.manyHeight) == "number" and HeroExtraAtt.manyHeight > 0 then
            disY = HeroExtraAtt.manyHeight
            dump(disY,"hero_attribute_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "hero_skill" then--技能
        if HeroSkill and HeroSkill.manyHeight ~= nil and type(HeroSkill.manyHeight) == "number" and HeroSkill.manyHeight > 0 then
            disY = HeroSkill.manyHeight
            dump(disY,"hero_skill_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "hero_title" then--称号
        if HeroTitle and HeroTitle.manyHeight ~= nil and type(HeroTitle.manyHeight) == "number" and HeroTitle.manyHeight > 0 then
            disY = HeroTitle.manyHeight
            dump(disY,"hero_title_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    elseif val.position == "hero_equip" and val.mediator == "ItemTipsMediator" then--装备tips
        if ItemTips and ItemTips.manyHeight ~= nil and type(ItemTips.manyHeight) == "number" and ItemTips.manyHeight > 0 then
            disY = ItemTips.manyHeight-size.height
            dump(disY,"hero_ItemTips_disY")
            if disY > 0 then
                node:setPosition(cc.p(0, size.height+disY))
                node:setAnchorPoint(cc.p(0, 1))
            else
                disY = 0
            end
        end
    end

    -- performWithDelay(node,function ()
    local rt = cc.RenderTexture:create(size.width, size.height+disY, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888, gl.DEPTH24_STENCIL8_OES)
    rt:begin()
    node:visit()
    rt:endToLua()
    -- dump(filename,"filename")
    local FileUtils = cc.FileUtils:getInstance()
    local WritablePath = FileUtils:getWritablePath()
    local path = WritablePath .. filename
    if FileUtils:isFileExist(path) then
        FileUtils:removeFile(path)
    end
    res = rt:saveToFile(filename, cc.IMAGE_FORMAT_PNG, true)
    -- end,0.02)
    return res            
end

function TradingBankCaptureOtherCommand:CheckConditions(itemData)
    local res = true
    --30天内寄售过的不能寄售
    if itemData.AddValues then
        for k, v in pairs(itemData.AddValues) do
            if v.Id == 15 then
                if GetServerTime() < v.Value then
                    res = false
                end
                break
            end
        end
    end
    local itemConfigProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemConfigProxy)
    local bindArticleType       = itemConfigProxy:GetBindArticleType()
    local isBind, isSelf, isMeetType = CheckItemisBind(itemData, bindArticleType.TYPE_NOSTALL)
    
    if  isMeetType then 
        res = false
    end
    return res
end

-------------------
function TradingBankCaptureOtherCommand:uploadImg()
    SL:onLUAEvent(LUA_EVENT_OPEN_SETTING_FRAME_UP_LOAD_TIPS)
    local FileUtils = cc.FileUtils:getInstance()
    self.m_uploadImgIndex = 1
    self.m_serverPath = {}
    self.m_uploadImageList = {}
    self.m_publishImageList = {}
    for position, vec in pairs(self.m_files) do
        for i, path in ipairs(vec) do
            local val = {
                position = position,
                path = path
            }
            table.insert(self.m_uploadImageList, val)
        end
    end
    for position, vec in pairs(self.m_filesPublish) do
        for i, path in ipairs(vec) do
            local val = {
                position = position,
                path = path
            }
            table.insert(self.m_publishImageList, val)
        end
    end
    dump(self.m_files,"m_files2")
    --服务器和客户端的标识字段
    self.tableType = {["attribute"]=0,["bag"]=0,["clothes"]=0,["equip"]=0,["hero_attribute"]=0,["hero_bag"]=0,["hero_clothes"]=0,
    ["hero_equip"]=0,["hero_skill"]=0,["hero_status"]=0,["hero_title"]=0,["skill"]=0,["status"]=0,["title"]=0,["warehouse"]=0}

    --寄售key功能：h5交易行服务器需要
    -- self.publishImage = {["attribute"]={},["bag"]={},["clothes"]={},["equip"]={},["hero_attribute"]={},["hero_bag"]={},["hero_clothes"]={},
    -- ["hero_equip"]={},["hero_skill"]={},["hero_status"]={},["hero_title"]={},["skill"]={},["status"]={},["title"]={},["warehouse"]={}}

    local posname = self.m_uploadImageList[self.m_uploadImgIndex].position --找到列表中的图片类型
    local path    = self.m_uploadImageList[self.m_uploadImgIndex].path     --找到列表中的图片路径
    self.tableType[posname] = self.tableType[posname] + 1
    local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
    if self.tableDataUrl.imagePrefix and self.tableDataUrl[posname][self.tableType[posname]] then
        local serverurl = self.tableDataUrl.imagePrefix .. self.tableDataUrl[posname][self.tableType[posname]]--确定列表中有 根据posname类型 再去找index
        local dataUrl = {}
        dataUrl.path = self.m_publishImageList[self.m_uploadImgIndex].path
        dataUrl.url  = self.tableDataUrl[posname][self.tableType[posname]]
        if not self.publishImage[posname] then
            self.publishImage[posname] = {}
        end
        table.insert(self.publishImage[posname], dataUrl)
        otherTradingBankProxy:uploadImg3(self, serverurl, path, handler(self, self.ResUploadImg))
    else
        ShowSystemTips(GET_STRING(700000143))--服务器图片地址错误
        global.Facade:sendNotification(global.NoticeTable.Layer_LoadingBar_Close)
        SL:onLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS)
        self.timerOne = SL:Schedule(function()
            SL:UnSchedule(self.timerOne)
            self.timerOne = nil
            global.gameWorldController:OnGameLeaveWorld()
        end, 0.5)
    end
end

function TradingBankCaptureOtherCommand:ResUploadImg(code, data, msg)
    local curPositionData = self.m_uploadImageList[self.m_uploadImgIndex] or {}
    local position = curPositionData.position
    if code == 200 then
        if data then
            local path = data
            if not self.m_serverPath[position] then
                self.m_serverPath[position] = {}
            end
            table.insert(self.m_serverPath[position], path)
            --下一张
            local maxLen = #self.m_uploadImageList
            local max = maxLen == 0 and 1 or maxLen
            if self.m_uploadImgIndex == maxLen then
                dump(self.tableType,"tableType")
                self:onSellRole()
            else
                self.m_uploadImgIndex = self.m_uploadImgIndex + 1
                local posname = self.m_uploadImageList[self.m_uploadImgIndex].position --找到列表中的图片类型
                local path    = self.m_uploadImageList[self.m_uploadImgIndex].path     --找到列表中的图片路径
                self.tableType[posname] = self.tableType[posname] + 1

                local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
                if self.tableDataUrl.imagePrefix and self.tableDataUrl[posname][self.tableType[posname]] then
                    local serverurl = self.tableDataUrl.imagePrefix .. self.tableDataUrl[posname][self.tableType[posname]]--确定列表中有 根据posname类型 再去找index
                    local dataUrl = {}
                    dataUrl.path = self.m_publishImageList[self.m_uploadImgIndex].path
                    dataUrl.url  = self.tableDataUrl[posname][self.tableType[posname]]
                    if not self.publishImage[posname] then
                        self.publishImage[posname] = {}
                    end
                    table.insert(self.publishImage[posname], dataUrl)
                    otherTradingBankProxy:uploadImg3(self, serverurl, path, handler(self, self.ResUploadImg))
                else
                    ShowSystemTips(GET_STRING(700000143))--服务器图片地址错误
                    global.Facade:sendNotification(global.NoticeTable.Layer_LoadingBar_Close)
                    SL:onLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS)
                    self.timerOne = SL:Schedule(function()
                        SL:UnSchedule(self.timerOne)
                        self.timerOne = nil
                        global.gameWorldController:OnGameLeaveWorld()
                    end, 0.5)
                end
            end
            
        else
            global.Facade:sendNotification(global.NoticeTable.SystemTips, msg or "")
            global.Facade:sendNotification(global.NoticeTable.Layer_LoadingBar_Close)
            SL:onLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS)
            self.timerOne = SL:Schedule(function()
                SL:UnSchedule(self.timerOne)
                self.timerOne = nil
                global.gameWorldController:OnGameLeaveWorld()
            end, 0.5)
        end

    else
        global.Facade:sendNotification(global.NoticeTable.SystemTips, msg or "")
        global.Facade:sendNotification(global.NoticeTable.Layer_LoadingBar_Close)
        SL:onLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS)
        self.timerOne = SL:Schedule(function()
            SL:UnSchedule(self.timerOne)
            self.timerOne = nil
            global.gameWorldController:OnGameLeaveWorld()
        end, 0.5)
    end
end

function TradingBankCaptureOtherCommand:onSellRole()
    SL:onLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS)
    global.Facade:sendNotification(global.NoticeTable.Layer_LoadingBar_Close)
    local uploadSuccess = true
    for k, v in pairs(self.m_files) do
        if not self.m_serverPath[k] then--图片上传失败
            uploadSuccess = false
            ShowSystemTips(GET_STRING(600000130))
            break
        end
    end


    --冻结角色
    local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
    local params = {
        prePublishLockId = otherTradingBankProxy:getPublishLockID()
    }
    otherTradingBankProxy:lockPublishRole(self, params, function(code, data, msg)
        if code == 200 then
            if data then
                --self:uploadImg() -- app上传图片流程
                if uploadSuccess then
                    ShowSystemTips(GET_STRING(600000419))--复制成功
                    local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
                    self.publishImage.key = otherTradingBankProxy:getPublishKey()
                    dump(self.publishImage,"self.publishImage")
                    otherTradingBankProxy:UpPublishKeyUrl(self, self.publishImage,  function(code, data, msg) end)
                    SL:SetMetaValue("CLIPBOARD_TEXT", otherTradingBankProxy:getPublishKey())
                end
            
                self.timerOne = SL:Schedule(function()
                    SL:UnSchedule(self.timerOne)
                    self.timerOne = nil
                    global.gameWorldController:OnGameLeaveWorld()
                end, 0.5)
            else
                --如果冻结失败让玩家重新获取一下寄售码 保证流程畅通
                otherTradingBankProxy:setPublishKeyValidTime(0)
                otherTradingBankProxy:setPublishKey("")
                ShowSystemTips(GET_STRING(700000136))--冻结失败 请稍后再试    备注：服务器处理异常情况
            end
        else
            ShowSystemTips(msg)
        end
    end)
end

return TradingBankCaptureOtherCommand