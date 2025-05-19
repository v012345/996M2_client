LianHunLuOBJ = {}
LianHunLuOBJ.__cname = "LianHunLuOBJ"
--LianHunLuOBJ.config = ssrRequireCsvCfg("cfg_LianHunLu")
--幽冥残魂*10+焚天石*888+元宝888888
LianHunLuOBJ.cost = { { "幽冥残魂", 10 }, { "焚天石", 888 }, { "元宝", 888888 } }
LianHunLuOBJ.give = { { "四象轮转魂", 1 } }
LianHunLuOBJ.eventName = "LianHunLu"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LianHunLuOBJ:main(objcfg)
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
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LianHunLu_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"itme_")
    self:RegisterEvent()
    self:UpdateUI()
end

function LianHunLuOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,70)
    Player:checkAddRedPoint(self.ui.Button_1,self.cost, 30, 5)
end


--刷新UI
function LianHunLuOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function LianHunLuOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function LianHunLuOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function LianHunLuOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LianHunLuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LianHunLuOBJ