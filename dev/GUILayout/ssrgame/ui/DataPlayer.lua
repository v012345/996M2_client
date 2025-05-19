local DataPlayerObj = {}

DataPlayerObj.__cname = "DataPlayerObj"

DataPlayerObj.NAME = DataPlayerObj.__cname

function DataPlayerObj:ctor()
    --self.cfg_npclist = ssrRequireGameCfg("cfg_npclist")
    self.cfg_magicinfo = ssrRequireGameCfg("cfg_magicinfo")
    self.cfg_npc_open = ssrRequireCsvCfg("cfg_npc_open")

    self.talkNpcOpenModule = {}

    self.name = "nil"                       --名字
    self.curmapid = ""                      --当前所在地图id
    self.npc_valid_range = 10               --npc对话有效范围
    self.openday = 0                        --开服天数
    self.bagcellnum = 0                     --背包最大格子数量
    self.create_actor_time = 0              --创建角色时间
    self.create_actor_openday = 0           --创建角色时已开服天数
    self.real_recharge = 0                  --总实充rmb金额
    self.virtual_recharge = 0               --总虚充rmb金额
    self.today_real_recharge = 0            --今日实充rmb金额
    self.today_virtual_recharge = 0         --今日虚充rmb金额
    self.gmlevel = 0                        --GM权限

    ssrMessage:RegisterNetMsg(ssrNetMsgCfg.Global, self)
end

DataPlayerObj:ctor()
-------------------------------↓↓↓ 外部获取数据 ↓↓↓---------------------------------------
--获取GM权限等级
function DataPlayerObj:getGMLevel()
    return self.gmlevel
end

--名字
function DataPlayerObj:getName()
    return self.name
end

--获取当前地图id
function DataPlayerObj:getCurMapID()
    return self.curmapid
end

--开服天数
function DataPlayerObj:getOpenDay()
    return self.openday
end

--获取背包最大格子数量
function DataPlayerObj:getBagCallNum()
    return self.bagcellnum
end

--获取创建角色天数， 时间
function DataPlayerObj:getCreateActorInfo()
    return self.create_actor_day, self.create_actor_time
end

--获取总实冲
function DataPlayerObj:getTotalRealRecharge()
    return self.real_recharge
end

--获取今日实充
function DataPlayerObj:getTodayRealRecharge()
    return self.today_real_recharge
end

--获取总充值(虚冲 + 实充)
function DataPlayerObj:getTotalRecharge()
    return self.real_recharge + self.virtual_recharge
end

--获取今日总充值(虚冲 + 实充)
function DataPlayerObj:getTodayRecharge()
    return self.today_real_recharge + self.today_virtual_recharge
end


--获取物品数量通过idx,isGetPos是否检测装备位
function DataPlayerObj:getItemNumByIdx(idx,isGetPos)
    local count = 0
    if idx < ssrConstCfg.itemlimit then         --货币
        count = SL:GetMetaValue("ITEM_COUNT", idx)
        if idx == ssrConstCfg.MONEY_BDYB then
            count = count + SL:GetMetaValue("ITEM_COUNT", ssrConstCfg.MONEY_YB)
        end
        if idx == ssrConstCfg.MONEY_LF then
            count = count + SL:GetMetaValue("ITEM_COUNT", ssrConstCfg.MONEY_BDLF)
        end
    else
        count = SL:GetMetaValue("ITEM_COUNT", idx)
        if isGetPos then
            local wheres = self:getItemWheresByIdx(idx)
            if wheres then
                for _,where in ipairs(wheres) do
                    local equipinfo = SL:GetMetaValue("EQUIP_DATA", where)
                    if equipinfo and equipinfo.Index == idx then
                        count = count + 1
                    end
                end
            end
        end
    end
    return count
end

--检查货币数量
function DataPlayerObj:checkMoneyNum(idx, num)
    local moneynum = SL:GetMetaValue("ITEM_COUNT", idx)
    if idx == ssrConstCfg.MONEY_BDYB then
        moneynum = moneynum + SL:GetMetaValue("ITEM_COUNT", ssrConstCfg.MONEY_YB)
    end
    if idx == ssrConstCfg.MONEY_LF then
        moneynum = moneynum + SL:GetMetaValue("ITEM_COUNT", ssrConstCfg.MONEY_BDLF)
    end
    return moneynum >= num
end

--检查 物品 货币 装备是否满足数量
function DataPlayerObj:checkItemNumByTable(t)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        local name = self:getItemNameByIdx(idx)
        if idx < ssrConstCfg.itemlimit then        --货币
            if not self:checkMoneyNum(idx, num) then
                return false, name, idx
            end
        else                                    --物品 装备
            local count = self:getItemNumByIdx(idx)
            if count < num then
                return false, name, idx
            end
        end
    end

    return true
end
-------------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------

--登录后初始化玩家等级
function DataPlayerObj:onPlayerPropertyInited(data)

end

--更新名称
function DataPlayerObj:OnPlayerNameInited(data)
    self.name = data.roleName
end

--地图改变 不同地图 {mapID = mapID lastMapID = lastMapID}
function DataPlayerObj:onMapInfoChange(data)
    self.curmapid = data.mapID

    --切换地图关闭对话Npc打开的模块
    for npcid, objcfg in pairs(self.talkNpcOpenModule) do
        ssrUIManager:CLOSE(objcfg)
    end
    self.talkNpcOpenModule = {}
end

--角色属性发生改变
function DataPlayerObj:onPlayerPropertyChange(param1,param2,param3)
    ssrGameEvent:push(ssrEventCfg.onPlayerPropertyChange, "")
end

function DataPlayerObj:onEvent(event, data)
    if self[event] then
        self[event](self, data)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--点击了某npc
function DataPlayerObj:ClickNpcResponse(npcid)
    local open_cfg = self.cfg_npc_open[npcid]
    if open_cfg then
        local module_id = open_cfg.moduleid
        local module_obj = ssrUIManager:GETBYID(module_id)
        if module_obj and module_obj.OpenLayer then
            module_obj:OpenLayer(npcid)
            local objcfg = module_obj.ssrobjcfg
            self.talkNpcOpenModule[npcid] = objcfg.PAGING_OBJ or objcfg
        end
    end
    ssrGameEvent:push(ssrEventCfg.GoClickNpc, npcid)
end

--开启某模块
function DataPlayerObj:OpenModuleRun(objid)
    local moduleobj = ssrUIManager:GETBYID(objid)
    if moduleobj and moduleobj.OpenModule then
        moduleobj:OpenModule()
    end
end

--同步开服天数
function DataPlayerObj:SyncOpenDay(openday,bagcellnum)
    self.openday = openday
    self.bagcellnum = bagcellnum
    -- ssrUIManager:GET(ssrObjCfg.Main):updatBagNum()
end

--同步创建角色信息
function DataPlayerObj:SyncCreateActor(create_actor_time, create_actor_day)
    self.create_actor_time = create_actor_time
    self.create_actor_day = create_actor_day
end

--同步总实冲分
function DataPlayerObj:SyncTotalRealRecharge(real_recharge,virtual_recharge)
    self.real_recharge = real_recharge                          --总实充rmb金额
    self.virtual_recharge = virtual_recharge                    --总虚充rmb金额
end

--同步今日实冲分
function DataPlayerObj:SyncTodayRealRecharge(today_real_recharge,today_virtual_recharge)
    self.today_real_recharge = today_real_recharge              --今日实充rmb金额
    self.today_virtual_recharge = today_virtual_recharge        --今日虚充rmb金额
end

--获取装备位锻造宝石信息
function DataPlayerObj:getEquipPosGemData(equip_index)
    return ssrUIManager:GET(ssrObjCfg.GemInlay):getEquipPosGemData(equip_index)
end

--获取装备位锻造升星等级
function DataPlayerObj:getForgingStarLevels(Where)
    return ssrUIManager:GET(ssrObjCfg.Forgingstar):getForgingStarLevels(Where)
end

--充值变化
function DataPlayerObj:Recharge(gold, productid, moneyid)
    ssrGameEvent:push(ssrEventCfg.GoRecharge, gold, productid, moneyid)
end

--GM权限
function DataPlayerObj:SyncAdmini(gmlevel)
    self.gmlevel = gmlevel or 0
    ssrGameEvent:push(ssrEventCfg.GoGMLevel, self.gmlevel)
end

--检查idx是否是货币
function DataPlayerObj:isCurrency(idx)
    return idx < ssrConstCfg.itemlimit
end

--检查idx是否是物品
function DataPlayerObj:isItem(idx)
    return idx >= ssrConstCfg.itemlimit and idx < ssrConstCfg.equiplimit
end

--检查idx是否是装备
function DataPlayerObj:isEquip(idx)
    return idx >= ssrConstCfg.equiplimit
end

--材料判断
function DataPlayerObj:checkItemNumByTableEx(t, multiple)
    for _,item in ipairs(t) do
        local idx,num = item[1],item[2]
        if multiple then num=num*multiple end
        local name = self:getItemNameByIdx(idx)
        if self:isCurrency(idx) then
            if not self:checkMoneyNum(idx, num) then
                return false, name, idx
            end
        else
            local count = self:getItemNumByIdx(idx)
            if count < num then
                local wheres = self:getItemWheresByIdx(idx)
                if wheres then
                    for _,where in ipairs(wheres) do
                        local equipinfo = SL:GetMetaValue("EQUIP_DATA", where)
                        if equipinfo and equipinfo.Index == idx then
                            count = count + 1
                        end
                    end
                end
            end

            if count < num then
                return false, name, idx
            end
        end
    end
    return true
end

return DataPlayerObj