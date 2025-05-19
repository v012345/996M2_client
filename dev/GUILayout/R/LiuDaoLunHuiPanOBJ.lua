LiuDaoLunHuiPanOBJ = {}
LiuDaoLunHuiPanOBJ.__cname = "LiuDaoLunHuiPanOBJ"
--LiuDaoLunHuiPanOBJ.config = ssrRequireCsvCfg("cfg_LiuDaoLunHuiPan")
LiuDaoLunHuiPanOBJ.cost = {{"阴阳魂石",188},{"轮回经",1},{"灵石",288}}
LiuDaoLunHuiPanOBJ.give = {{"六道轮回盘",1}}
LiuDaoLunHuiPanOBJ.eventName = "LiuDaoLunHuiPan"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LiuDaoLunHuiPanOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.LiuDaoLunHuiPan_Request)
    end)
    self.panelList = GUI:getChildren(self.ui.Node_panel)
    ssrAddItemListX(self.ui.Panel_4,self.give,"item_")
    self:RegisterEvent()
    self:UpdateUI()
end

function LiuDaoLunHuiPanOBJ:UpdateUI()
    for i, v in ipairs(self.cost) do
        local cost = {v}
        if self.panelList[i] then
            showCost(self.panelList[i],cost,0)
        end
    end
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end


--刷新UI
function LiuDaoLunHuiPanOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function LiuDaoLunHuiPanOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function LiuDaoLunHuiPanOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function LiuDaoLunHuiPanOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LiuDaoLunHuiPanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LiuDaoLunHuiPanOBJ