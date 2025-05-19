ShiZhuangHeChengOBJ = {}

ShiZhuangHeChengOBJ.__cname = "ShiZhuangHeChengOBJ"
ShiZhuangHeChengOBJ.config = ssrRequireCsvCfg("cfg_ShiZhuangHeCheng")

ShiZhuangHeChengOBJ.newConfig = {}
for i, entry in ipairs(ShiZhuangHeChengOBJ.config) do
    ShiZhuangHeChengOBJ.newConfig[entry.equip] = entry
    ShiZhuangHeChengOBJ.newConfig[entry.equip]["id"] = i
end
ShiZhuangHeChengOBJ.where = 17
ShiZhuangHeChengOBJ.eventName = "时装合成"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShiZhuangHeChengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -25, -20)

    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self.ui.ImageBG)
    --GUI:setScale(self._parent,0.4)
    --GUI:setChildrenCascadeOpacityEnabled(self._parent,true)
    --GUI:setOpacity(self._parent,0)
    --GUI:Timeline_FadeIn(self._parent, 0.15)
    --GUI:Timeline_ScaleTo(self._parent, 1, 0.06)

    ----左翻页
    --GUI:addOnClickEvent(self.ui.ButtonLeft, function()
    --    self:LeftPage()
    --end)
    --
    ----左翻页
    --GUI:addOnClickEvent(self.ui.ButtonRight, function()
    --    self:RightPage()
    --end)

    --开始合成
    GUI:addOnClickEvent(self.ui.ButtonRequest, function()
        if self.clickLock then
            --SL:ShowSystemTips("点击太快!")
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiZhuangHeCheng_Request, self.currId)
        self.clickLock = true
        SL:ScheduleOnce(function()
            self.clickLock = false
        end, 0.5)
    end)
    self:ShowUI()
    self:RegisterEvent()
end

function ShiZhuangHeChengOBJ:ShowUI()
    local currEquip = SL:GetMetaValue("EQUIP_DATA", self.where)
    local equipName
    if currEquip then
        equipName = SL:GetMetaValue("ITEM_NAME", currEquip["Index"])
    else
        equipName = "空"
    end
    --当前ID编号
    if not self.newConfig[equipName] then
        equipName = "空"
    end
    self.currId = self.newConfig[equipName].id
    self:UpdateUI()
end

--更新显示
function ShiZhuangHeChengOBJ:UpdateUI()
    local currData = self.config[self.currId]
    --男
    local effectIdNan = currData.effNan[1]
    local XNan = currData.effNan[2]
    local YNan = currData.effNan[3]
    local scaleNan = currData.effNan[4]
    --女
    local effectIdNv = currData.effNv[1]
    local XNv = currData.effNv[2]
    local YNv = currData.effNv[3]
    local scaleNv = currData.effNv[4]
    GUI:Text_setString(self.ui.TextEquipTitle, currData.give)
    GUI:removeAllChildren(self.ui.LayoutEffectNan)
    GUI:removeAllChildren(self.ui.LayoutEffectNv)
    local sfx1 = GUI:Effect_Create(self.ui.LayoutEffectNan, "sfx1", XNan, YNan, 0, effectIdNan, 0, 0, 3, 1)
    local sfx2 = GUI:Effect_Create(self.ui.LayoutEffectNv, "sfx2", XNv, YNv, 0, effectIdNv, 0, 0, 3, 1)
    --
    --GUI:Timeline_Window2(sfx1)
    --GUI:Timeline_Window2(sfx2)
    GUI:setScale(sfx1, scaleNan)
    GUI:setScale(sfx2, scaleNv)
    showCost(self.ui.Layout, currData.consumption,50)
    delRedPoint(self.ui.ButtonRequest)
    local currDaLu = tonumber(Player:getServerVar("U54"))
    if self.currId < 16 and currDaLu >= currData.dalu then
        Player:checkAddRedPoint(self.ui.ButtonRequest, currData.consumption)
    end
    --self:UpDataBtn()
    local textList = GUI:getChildren(self.ui.NodeLeft)
    for i, child in ipairs(textList) do
        if currData.showAttrs[i] then
            GUI:Text_setString(child, currData.showAttrs[i])
        else
            GUI:Text_setString(child, 0)
        end
    end
end

----更新按钮显示状态
--function ShiZhuangHeChengOBJ:UpDataBtn()
--    if self.currId <= 1 then
--        GUI:setVisible(self.ui.ButtonLeft, false)
--    else
--        GUI:setVisible(self.ui.ButtonLeft, true)
--    end
--
--    if self.currId >= 15 then
--        GUI:setVisible(self.ui.ButtonRight, false)
--    else
--        GUI:setVisible(self.ui.ButtonRight, true)
--    end
--end

--左翻页
function ShiZhuangHeChengOBJ:LeftPage()
    if self.currId <= 1 then
        return
    end
    if self.currId == #self.config then
        self.currId = self.currId - 1
    end
    self.currId = self.currId - 1
    self:UpdateUI()
end

--右翻页
function ShiZhuangHeChengOBJ:RightPage()
    if self.currId >= 15 then
        return
    end

    self.currId = self.currId + 1
    self:UpdateUI()
end

function ShiZhuangHeChengOBJ:OnUpdateGold(widgetName)
    SL:dump(widgetName, "OnUpdateGold")
end

--刷新UI
function ShiZhuangHeChengOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:ShowUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function ShiZhuangHeChengOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function ShiZhuangHeChengOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
            self:refreshUI()
    end)
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
end

function ShiZhuangHeChengOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function ShiZhuangHeChengOBJ:SyncResponse()
    --self.clickLock = false
end

return ShiZhuangHeChengOBJ
