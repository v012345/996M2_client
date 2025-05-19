ShenLongShiWeiOBJ = {}
ShenLongShiWeiOBJ.__cname = "ShenLongShiWeiOBJ"
--ShenLongShiWeiOBJ.config = ssrRequireCsvCfg("cfg_ShenLongShiWei")
ShenLongShiWeiOBJ.cost = {{"异界神石",10}}
ShenLongShiWeiOBJ.give = {{"三生仙灵藤",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenLongShiWeiOBJ:main(objcfg)
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
        GUI:setVisible(self.ui.Node_1,false)
        GUI:setVisible(self.ui.Node_2,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        GUI:setVisible(self.ui.Node_2,false)
        GUI:setVisible(self.ui.Node_3,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenLongShiWei_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        GUI:Win_Close(self._parent)
    end)
    --加固封印
    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenLongShiWei_Request2)
    end)
    GUI:addOnClickEvent(self.ui.Button_9, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenLongShiWei_Request3)
    end)
    self:UpdateUI()
end

function ShenLongShiWeiOBJ:UpdateUI()
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{imgRes = ""})
    if self.flag == 1 then
        GUI:setVisible(self.ui.Node_4,true)
        GUI:Slider_setPercent(self.ui.LoadingBar_1, self.jindu)
        GUI:Text_setString(self.ui.Text_1,string.format("%d/100",self.jindu))
    else
        GUI:setVisible(self.ui.Node_1,true)
    end
    delRedPoint(self.ui.Button_8)
    delRedPoint(self.ui.Button_9)
    if self.jindu < 100 then
        Player:checkAddRedPoint(self.ui.Button_8, self.cost, 30, 5)
    end
    if self.flag1 == 0 and self.jindu >= 100 then
        Player:checkAddRedPoint(self.ui.Button_9, self.cost, 20, 1)
    end


end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShenLongShiWeiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    self.jindu = arg2
    self.flag1 = arg3
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenLongShiWeiOBJ