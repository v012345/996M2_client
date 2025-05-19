LongQiMieShiHaiGuOBJ = {}
LongQiMieShiHaiGuOBJ.__cname = "LongQiMieShiHaiGuOBJ"
--LongQiMieShiHaiGuOBJ.config = ssrRequireCsvCfg("cfg_LongQiMieShiHaiGu")
LongQiMieShiHaiGuOBJ.cost = {{"[龍器]祖龍號角",1},{"造化结晶",188},{"灭世魔龙结晶",1},{"元宝",5550000}}
LongQiMieShiHaiGuOBJ.showCost = {{"[龍器]祖龍號角",1},{"造化结晶",188},{"灭世魔龙结晶",1}}
LongQiMieShiHaiGuOBJ.give = {{"[龍器]灭世骸骨",1}}
LongQiMieShiHaiGuOBJ.eventName = "LongQiMieShiHaiGu"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LongQiMieShiHaiGuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.LongQiMieShiHaiGu_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
    self:RegisterEvent()
    self:UpdateUI()
end

function LongQiMieShiHaiGuOBJ:UpdateUI()
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    showCost(self.ui.Panel_1,self.showCost,90)
end


--刷新UI
function LongQiMieShiHaiGuOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function LongQiMieShiHaiGuOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function LongQiMieShiHaiGuOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function LongQiMieShiHaiGuOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LongQiMieShiHaiGuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LongQiMieShiHaiGuOBJ