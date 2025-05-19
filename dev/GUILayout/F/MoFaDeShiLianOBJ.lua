MoFaDeShiLianOBJ = {}
MoFaDeShiLianOBJ.__cname = "MoFaDeShiLianOBJ"
MoFaDeShiLianOBJ.cost1 = {{"无尽愤怒", 1}}
MoFaDeShiLianOBJ.cost2 = {{"血魔护臂MAX", 1}}
--MoFaDeShiLianOBJ.config = ssrRequireCsvCfg("cfg_MoFaDeShiLian")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MoFaDeShiLianOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoFaDeShiLian_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoFaDeShiLian_Request, 2)
    end)

    self:UpdateUI()
end

function MoFaDeShiLianOBJ:UpdateUI()

    showCost(self.ui.itemlooks_1,self.cost1,0,{itemBG = ""})
    showCost(self.ui.itemlooks_2,self.cost2,0,{itemBG = ""})

    GUI:setVisible(self.ui.Button_1, false)
    GUI:setVisible(self.ui.Button_2, false)
    GUI:setVisible(self.ui.Image_1, false)
    GUI:setVisible(self.ui.Image_2, false)

    if self.data[1] == 1 then
        GUI:setVisible(self.ui.Image_1, true)
    else
        GUI:setVisible(self.ui.Button_1, true)
        Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    end

    if self.data[2] == 1 then
        GUI:setVisible(self.ui.Image_2, true)
    else
        GUI:setVisible(self.ui.Button_2, true)
        Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)
    end




end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MoFaDeShiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MoFaDeShiLianOBJ