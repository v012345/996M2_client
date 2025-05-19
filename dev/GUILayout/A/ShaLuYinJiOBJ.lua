ShaLuYinJiOBJ = {}
ShaLuYinJiOBJ.__cname = "ShaLuYinJiOBJ"
ShaLuYinJiOBJ.config = ssrRequireCsvCfg("cfg_ShaLuYinJi")
-- ShaLuYinJiOBJ.config = {}
ShaLuYinJiOBJ.where = 12
ShaLuYinJiOBJ.eventName = "刻印合成"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShaLuYinJiOBJ:main(objcfg)
    --local currEquipLevel = tonumber(Player:getEquipFieldByPos(self.where)) or 0
    --if currEquipLevel > #self.config then
    --    sendmsg9("[提示]:#251|你的#250|[杀戮刻印]#249|已满级!#250")
    --    return
    --end
    --local myLeve = SL:GetMetaValue("LEVEL")
    ----小于80级，可以在这里
    --if myLeve < 80 and currEquipLevel > 9 then
    --    SL:ShowSystemTips("请到下一个大陆继续提升!")
    --    return
    --end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -43, -18)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    local pos = GUI:getPosition(self.ui.Effect)
    --SL:Print(pos.x , pos.y)
    --开始合成
    GUI:addOnClickEvent(self.ui.ButtonRequest, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShaLuYinJi_Request, self.currId)
    end)
    self.isExecuting = false
    self:UpdateUI()
    self:RegisterEvent()
end

--更新显示
function ShaLuYinJiOBJ:UpdateUI()
    local currEquipLevel = tonumber(Player:getEquipFieldByPos(self.where)) or 0
    if currEquipLevel == 0 then
        GUI:setVisible(self.ui.ImageViewLock, true)
    else
        GUI:setVisible(self.ui.ImageViewLock, false)
    end

    local cfg = self.config[currEquipLevel]
    if not cfg then
        cfg = self.config[currEquipLevel - 1]
    end
    local itemIdx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", cfg.give)
    GUI:ItemShow_updateItem(self.ui.Item, { index = itemIdx, count = 1, look = true, bgVisible = nil })
    local cost = SL:CopyData(cfg.cost)
    --把身上需要的装备插入到第一个元素
    if cfg.equip ~= "空" then
        local bodyEquip = {}
        bodyEquip = { cfg.equip, 1, self.where }
        table.insert(cost, 1, bodyEquip)
    end
    --属性显示当前
    attrListShow(self.ui.LayoutCurrAttr, cfg.currAttr)
    --属性显示下级
    attrListShow(self.ui.LayoutNextAttr, cfg.nextAttr)
    --显示消耗
    showCost(self.ui.LayoutCost, cost, 50)
    local currDaLu = tonumber(Player:getServerVar("U54"))
    --检测红点
    if currEquipLevel < 14 and currDaLu >= cfg.dalu then --满级 不满足大陆条件 干掉红点
        Player:checkAddRedPoint(self.ui.ButtonRequest, cost, 18, 16)
    else
        delRedPoint(self.ui.ButtonRequest)
    end
end

--刷新UI
function ShaLuYinJiOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.05)
    end
end

--关闭窗口
function ShaLuYinJiOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function ShaLuYinJiOBJ:RegisterEvent()
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --穿装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName, function(t)
        if t.pos == self.where then
            self:refreshUI()
        end
    end)
    --脱装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName, function(t)
        if t.pos == self.where then
            self:refreshUI()
        end
    end)
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
            self:refreshUI()
    end)
end

function ShaLuYinJiOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function ShaLuYinJiOBJ:SyncResponse()
end

return ShaLuYinJiOBJ
