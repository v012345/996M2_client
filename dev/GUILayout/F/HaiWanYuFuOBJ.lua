HaiWanYuFuOBJ = {}
HaiWanYuFuOBJ.__cname = "HaiWanYuFuOBJ"
HaiWanYuFuOBJ.cost1 = {{"潮影钩矛", 1}}
HaiWanYuFuOBJ.cost2 = {{"海纹石片", 188}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HaiWanYuFuOBJ:main(objcfg)
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

    ssrAddItemListX(self.ui.itemlooks_1, self.cost1,"潮影钩矛",{imgRes = ""})

    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HaiWanYuFu_Request)
    end)

end

function HaiWanYuFuOBJ:UpdateUI()
    showCost(self.ui.itemlooks_2,self.cost2,0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost2,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HaiWanYuFuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HaiWanYuFuOBJ