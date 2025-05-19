HeiShuiMiJiOBJ = {}
HeiShuiMiJiOBJ.__cname = "HeiShuiMiJiOBJ"
--HeiShuiMiJiOBJ.config = ssrRequireCsvCfg("cfg_HeiShuiMiJi")
HeiShuiMiJiOBJ.cost = {{"黑水残页",222},{"书页",2222}}
HeiShuiMiJiOBJ.give = {{}}
HeiShuiMiJiOBJ.eventName = "HeiShuiMiJi"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HeiShuiMiJiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HeiShuiMiJi_Request)
    end)
    self:RegisterEvent()
    self:UpdateUI()
end

function HeiShuiMiJiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,84)
    local skillInfo = SL:GetMetaValue("SKILL_DATA", 2018)
    delRedPoint(self.ui.Button_1)
    if not skillInfo then
        Player:checkAddRedPoint(self.ui.Button_1,self.cost, 30, 5)
    end
end


--刷新UI
function HeiShuiMiJiOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function HeiShuiMiJiOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function HeiShuiMiJiOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function HeiShuiMiJiOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HeiShuiMiJiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HeiShuiMiJiOBJ