KongJianMoFaOBJ = {}
KongJianMoFaOBJ.__cname = "KongJianMoFaOBJ"
KongJianMoFaOBJ.config = ssrRequireCsvCfg("cfg_KongJianMoFa")
KongJianMoFaOBJ.where = 29
KongJianMoFaOBJ.eventName = "空间魔法"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KongJianMoFaOBJ:main(objcfg)
    local name = Player:getEquipNameByPos(self.where)
    if not name then
        sendmsg9("请穿戴好斗转星移在来找我吧！#249")
        return
    end
    if name == "斗转星移[精]+10" then
        sendmsg9("[提示]:#251|你当前已经是最高等级的#250|斗转星移#249|了！#250")
        return
    end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout,true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.ButtonGo,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.KongJianMoFa_Request)
    end)
    self.Node_Left = GUI:getChildren(self.ui.Node_Left)
    self.Node_Right = GUI:getChildren(self.ui.Node_Right)
    self:UpdateUI()
    self:RegisterEvent()

end

function KongJianMoFaOBJ:UpdateUI()
    local name = Player:getEquipNameByPos(self.where)
    local cfg = self.config[name]
    if not cfg then
        sendmsg9("你的装备已经满级或者已经有更高级的装备！#249")
        GUI:Win_Close(self._parent)
        return
    end
    GUI:Text_setString(self.ui.Text_currEquipShow,name)
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME",cfg.give)
    GUI:ItemShow_updateItem(self.ui.Item, { index = idx})
    showCost(self.ui.LayoutCost,cfg.cost,60)
    for i, v in ipairs(self.Node_Left) do
        GUI:Text_setString(v,cfg.attrCurr[i])
    end
    for i, v in ipairs(self.Node_Right) do
        GUI:Text_setString(v,cfg.attrNext[i])
    end
    delRedPoint(self.ui.ButtonGo)
    Player:checkAddRedPoint(self.ui.ButtonGo,cfg.cost)

end

--------------------------- 引擎事件 -----------------------------
--关闭窗口
function KongJianMoFaOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end
--注册事件
function KongJianMoFaOBJ:RegisterEvent()
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    ---装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName, function(t)
            self:UpdateUI()
    end)
    ----装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName, function(t)
            self:UpdateUI()
    end)
end
--卸载事件
function KongJianMoFaOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function KongJianMoFaOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return KongJianMoFaOBJ