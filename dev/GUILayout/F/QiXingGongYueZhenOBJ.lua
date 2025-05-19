QiXingGongYueZhenOBJ = {}
QiXingGongYueZhenOBJ.__cname = "QiXingGongYueZhenOBJ"
QiXingGongYueZhenOBJ.cost1 = {"异界神石",588}
QiXingGongYueZhenOBJ.cost2 = {"混沌本源",88}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiXingGongYueZhenOBJ:main(objcfg)
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


    GUI:addOnClickEvent(self.ui.Button_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiXingGongYueZhen_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiXingGongYueZhen_Request,2)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

function QiXingGongYueZhenOBJ:UpdateUI()
    showCostFont(self.ui.itemlook1, {self.cost1},{fontSize=19,fontColor="#44DDFF"})
    showCostFont(self.ui.itemlook2, {self.cost2},{fontSize=19,fontColor="#44DDFF"})


    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Button_2,false)

    if self.data[1] == 0  then
        GUI:setVisible(self.ui.Button_1,true)
        Player:checkAddRedPoint(self.ui.Button_1, {self.cost1,self.cost2}, 25, 3)
    elseif self.data[1] == 1  then
        GUI:setVisible(self.ui.Button_2,true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiXingGongYueZhenOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiXingGongYueZhenOBJ