JingYanLaoRenOBJ = {}
JingYanLaoRenOBJ.__cname = "JingYanLaoRenOBJ"
--JingYanLaoRenOBJ.config = ssrRequireCsvCfg("cfg_JingYanLaoRen")
JingYanLaoRenOBJ.cost = {{"灵石",1}}
JingYanLaoRenOBJ.eventName = "经验老人"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JingYanLaoRenOBJ:main(objcfg)
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
    GUI:Timeline_Window2(self._parent)

    GUI:addOnClickEvent(self.ui.Button,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JingYanLaoRen_Request)
    end)
    --消耗显示
    self:UpdateUI()
    self:RegisterEvent()
end

function JingYanLaoRenOBJ:UpdateUI()
    --SL:Print("刷新")
    showCost(self.ui.Layout, self.cost,0, {itemBG = ""})
    local level = SL:GetMetaValue("LEVEL")
    GUI:Text_setString(self.ui.Text_currLevel, level.."级")
    if level < 320 then
        Player:checkAddRedPoint(self.ui.Button, self.cost)
    end
end

--关闭窗口
function JingYanLaoRenOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

function JingYanLaoRenOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_LEVELCHANGE, self.eventName)
end

--------------------------- 注册事件 -----------------------------
function JingYanLaoRenOBJ:RegisterEvent()
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
            self:UpdateUI()
    end)
    --等级改变
    SL:RegisterLUAEvent(LUA_EVENT_LEVELCHANGE, self.eventName, function(t)
            self:UpdateUI()
    end)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JingYanLaoRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JingYanLaoRenOBJ