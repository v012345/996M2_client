FengDouGuiQiOBJ = {}
FengDouGuiQiOBJ.__cname = "FengDouGuiQiOBJ"
--FengDouGuiQiOBJ.config = ssrRequireCsvCfg("cfg_FengDouGuiQi")
FengDouGuiQiOBJ.cost = { { "锁魂咒", 1 }, { "降魔杵", 1 } }
FengDouGuiQiOBJ.give = {{"锁魂幡",1}}
FengDouGuiQiOBJ.eventName = "FengDouGuiQi"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FengDouGuiQiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.FengDouGuiQi_Request)
    end)
    self:RegisterEvent()
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
end

function FengDouGuiQiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,146)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end


--刷新UI
function FengDouGuiQiOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function FengDouGuiQiOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function FengDouGuiQiOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function FengDouGuiQiOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FengDouGuiQiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FengDouGuiQiOBJ