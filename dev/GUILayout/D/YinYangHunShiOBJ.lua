YinYangHunShiOBJ = {}
YinYangHunShiOBJ.__cname = "YinYangHunShiOBJ"
--YinYangHunShiOBJ.config = ssrRequireCsvCfg("cfg_YinYangHunShi")
YinYangHunShiOBJ.cost = { { "阴", 1 }, { "幽冥残魂", 10 }, { "阳", 1 }, { "灵符", 200 } }
YinYangHunShiOBJ.costShow = { { "阴", 1 }, { "幽冥残魂", 10 }, { "阳", 1 } }
YinYangHunShiOBJ.showItme = { { "阴阳魂石", 1 } }
YinYangHunShiOBJ.eventName = "阴阳魂石"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YinYangHunShiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YinYangHunShi_Request)
    end )
    self:RegisterEvent()
    self:UpdateUI()
end

function YinYangHunShiOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.costShow,90)
    delRedPoint(self.ui.Button_1)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 20, 0)
    ssrAddItemListX(self.ui.Panel_2, self.showItme,"item")
end


--刷新UI
function YinYangHunShiOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function YinYangHunShiOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function YinYangHunShiOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function YinYangHunShiOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YinYangHunShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YinYangHunShiOBJ