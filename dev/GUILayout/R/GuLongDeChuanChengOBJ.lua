GuLongDeChuanChengOBJ = {}
GuLongDeChuanChengOBJ.__cname = "GuLongDeChuanChengOBJ"
--GuLongDeChuanChengOBJ.config = ssrRequireCsvCfg("cfg_GuLongDeChuanCheng")
GuLongDeChuanChengOBJ.cost = {{"古龙的传承",1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuLongDeChuanChengOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuLongDeChuanCheng_Request)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.GuLongDeChuanCheng_SyncResponse)
end

function GuLongDeChuanChengOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,0)
    GUI:Text_setString(self.ui.Text_1, string.format("%d/5",self.numCount))
    delRedPoint(self.ui.Button_1)
    if self.numCount < 5 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuLongDeChuanChengOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.numCount = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuLongDeChuanChengOBJ