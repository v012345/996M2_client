YongHengZhongDianOBJ = {}
YongHengZhongDianOBJ.__cname = "YongHengZhongDianOBJ"
YongHengZhongDianOBJ.cost1 = {{"虚空之晶", 1},{"元宝", 300000}}
YongHengZhongDianOBJ.cost2 = {{"时光碎片", 1},{"元宝", 300000}}
YongHengZhongDianOBJ.cost3 = {{"永恒精魄", 1},{"元宝", 300000}}
YongHengZhongDianOBJ.look = {{"永恒没有终点[称号]", 1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YongHengZhongDianOBJ:main(objcfg)
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
    ssrAddItemListX(self.ui.itemlooks_4, self.look,"永恒没有终点",{imgRes = ""})
    self:UpdateUI()

    --按钮点击
    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengZhongDian_Request, 1)
    end)

    --按钮点击
    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengZhongDian_Request, 2)
    end)

    --按钮点击
    GUI:addOnClickEvent(self.ui.Button_3,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengZhongDian_Request, 3)
    end)

    --按钮点击
    GUI:addOnClickEvent(self.ui.Button_4,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengZhongDian_Request, 4)
    end)

end

function YongHengZhongDianOBJ:UpdateUI()
    showCost(self.ui.itemlooks_1,{self.cost1[1]},0,{itemBG = ""})
    showCost(self.ui.itemlooks_2,{self.cost2[1]},0,{itemBG = ""})
    showCost(self.ui.itemlooks_3,{self.cost3[1]},0,{itemBG = ""})

    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Button_2,false)
    GUI:setVisible(self.ui.Button_3,false)
    GUI:setVisible(self.ui.Image_1,false)
    GUI:setVisible(self.ui.Image_2,false)
    GUI:setVisible(self.ui.Image_3,false)
    GUI:setVisible(self.ui.Image_4,false)


    if self.data[1] == 0 then
        GUI:setVisible(self.ui.Button_1,true)
        Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    else
        GUI:setVisible(self.ui.Image_1,true)
    end

    if self.data[2] == 0 then
        GUI:setVisible(self.ui.Button_2,true)
        Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)
    else
        GUI:setVisible(self.ui.Image_2,true)
    end

    if self.data[3] == 0 then
        GUI:setVisible(self.ui.Button_3,true)
        Player:checkAddRedPoint(self.ui.Button_3,self.cost3,30,10)
    else
        GUI:setVisible(self.ui.Image_3,true)
    end

    if self.data[4] == 1 then
        GUI:setVisible(self.ui.Image_4,false)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YongHengZhongDianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YongHengZhongDianOBJ