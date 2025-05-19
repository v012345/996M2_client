RiYaoJieJieOBJ = {}
RiYaoJieJieOBJ.__cname = "RiYaoJieJieOBJ"
RiYaoJieJieOBJ.cost1 = {{"日耀精华", 1}}
RiYaoJieJieOBJ.cost2 = {{"风之圣纹", 1}}
RiYaoJieJieOBJ.cost3 = {{"海灵之泪", 1}}
RiYaoJieJieOBJ.cost4 = {{"冰魂结晶", 1}}
RiYaoJieJieOBJ.cost5 = {{"圣火遗灰", 1}}
RiYaoJieJieOBJ.title = {{"日耀终结者[称号]", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function RiYaoJieJieOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.RiYaoJieJie_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RiYaoJieJie_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RiYaoJieJie_Request, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RiYaoJieJie_Request, 4)
    end)
    GUI:addOnClickEvent(self.ui.Button_5,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RiYaoJieJie_Request, 5)
    end)

    ssrAddItemListX(self.ui.itemlook_6, self.title,"称号展示",{imgRes = ""})

    self:UpdateUI()
end

function RiYaoJieJieOBJ:UpdateUI()
    local NumberShow = 100
    local StateBool = true
    showCost(self.ui.itemlook_1,{self.cost1[1]},0,{itemBG = ""})
    showCost(self.ui.itemlook_2,{self.cost2[1]},0,{itemBG = ""})
    showCost(self.ui.itemlook_3,{self.cost3[1]},0,{itemBG = ""})
    showCost(self.ui.itemlook_4,{self.cost4[1]},0,{itemBG = ""})
    showCost(self.ui.itemlook_5,{self.cost5[1]},0,{itemBG = ""})

    GUI:setVisible(self.ui.Button_1, false)
    GUI:setVisible(self.ui.Button_2, false)
    GUI:setVisible(self.ui.Button_3, false)
    GUI:setVisible(self.ui.Button_4, false)
    GUI:setVisible(self.ui.Button_5, false)

    GUI:setVisible(self.ui.Image_1, false)
    GUI:setVisible(self.ui.Image_2, false)
    GUI:setVisible(self.ui.Image_3, false)
    GUI:setVisible(self.ui.Image_4, false)
    GUI:setVisible(self.ui.Image_5, false)


    if self.data[1] == 1 then
        NumberShow = NumberShow - 20
        GUI:setVisible(self.ui.Image_1, true)
    else
        StateBool = false
        GUI:setVisible(self.ui.Button_1, true)
        Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    end

    if self.data[2] == 1 then
           NumberShow = NumberShow - 20
        GUI:setVisible(self.ui.Image_2, true)
    else
        StateBool = false
        GUI:setVisible(self.ui.Button_2, true)
        Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)
    end

    if self.data[3] == 1 then
           NumberShow = NumberShow - 20
        GUI:setVisible(self.ui.Image_3, true)
    else
        StateBool = false
        GUI:setVisible(self.ui.Button_3, true)
        Player:checkAddRedPoint(self.ui.Button_3,self.cost3,30,10)
    end

    if self.data[4] == 1 then
           NumberShow = NumberShow - 20
        GUI:setVisible(self.ui.Image_4, true)
    else
        StateBool = false
        GUI:setVisible(self.ui.Button_4, true)
        Player:checkAddRedPoint(self.ui.Button_4,self.cost4,30,10)
    end

    if self.data[5] == 1 then
           NumberShow = NumberShow - 20
        GUI:setVisible(self.ui.Image_5, true)
    else
        StateBool = false
        GUI:setVisible(self.ui.Button_5, true)
        Player:checkAddRedPoint(self.ui.Button_5,self.cost5,30,10)
    end
    GUI:TextAtlas_setString(self.ui.TextAtlas_1, NumberShow)
    if StateBool then
        GUI:setVisible(self.ui.StateShow, true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function RiYaoJieJieOBJ:SyncResponse(arg1, arg2, arg3, data)
        self.data = data

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return RiYaoJieJieOBJ