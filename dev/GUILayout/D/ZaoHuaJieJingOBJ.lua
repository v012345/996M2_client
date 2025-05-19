ZaoHuaJieJingOBJ = {}
ZaoHuaJieJingOBJ.__cname = "ZaoHuaJieJingOBJ"
--ZaoHuaJieJingOBJ.config = ssrRequireCsvCfg("cfg_ZaoHuaJieJing")
ZaoHuaJieJingOBJ.cost = {{"灵石",5},{"焚天石",300},{"天工之锤",300},{"金币",1000000}}
ZaoHuaJieJingOBJ.costShow = {{"灵石",5},{"焚天石",300},{"天工之锤",300}}
ZaoHuaJieJingOBJ.give = {{"造化结晶",1}}
ZaoHuaJieJingOBJ.eventName = "造化结晶"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZaoHuaJieJingOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZaoHuaJieJing_Request)
    end)
    self:UpdateUI()
    self:RegisterEvent()
    ssrAddItemListX(self.ui.Panel_2,self.give, "item_")

end

function ZaoHuaJieJingOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.costShow,88)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 25, 5)
end



--刷新UI
function ZaoHuaJieJingOBJ:refreshUI()
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

--关闭窗口
function ZaoHuaJieJingOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function ZaoHuaJieJingOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
            self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function ZaoHuaJieJingOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZaoHuaJieJingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZaoHuaJieJingOBJ