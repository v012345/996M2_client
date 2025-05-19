XingChenBianOBJ = {}
XingChenBianOBJ.__cname = "XingChenBianOBJ"
XingChenBianOBJ.cost = {{"星辉碎片",1}, {"混沌本源",2}}
XingChenBianOBJ.reward = {{"七星生灵草",1}, {"〈〈太阴星君〉〉[时装]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XingChenBianOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.XingChenBian_Request1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.XingChenBian_Request2)
    end)
    self:UpdateUI()

    ssrAddItemListX(self.ui.AwardLayout, self.reward,"奖励显示",{spacing=50})

end

function XingChenBianOBJ:UpdateUI()
    local TypeData = {"贪狼","巨门","禄存","武曲","破军","文曲","廉贞"}
    local IsDouble = true
    local multiple = 1
    for _, v in ipairs(TypeData) do
        if self.data[v] < 50 then
            IsDouble = false
        end
    end
    if IsDouble then
        multiple = 2
    end


    --进度显示
    GUI:Text_setString(self.ui.LevelLooks_1,self.data["贪狼"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_2,self.data["巨门"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_3,self.data["禄存"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_4,self.data["武曲"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_5,self.data["破军"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_6,self.data["文曲"].."/50")
    GUI:Text_setString(self.ui.LevelLooks_7,self.data["廉贞"].."/50")
    --属性显示
    GUI:Text_setString(self.ui.AttrLooks_1,"上限增加".. self.data["贪狼"]*10*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_2,"上限增加".. self.data["巨门"]*10*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_3,"上限增加".. self.data["禄存"]*10*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_4,"上限增加".. self.data["武曲"]*10*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_5,"上限增加".. self.data["破军"]*10*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_6,"上限增加".. self.data["文曲"]*200*multiple .."点")
    GUI:Text_setString(self.ui.AttrLooks_7,"上限增加".. self.data["廉贞"]*200*multiple .."点")

    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.LingQu_Image,false)

    if self.arg1 == 1 then
        GUI:setVisible(self.ui.LingQu_Image,true)
    else
        GUI:setVisible(self.ui.Button_1,true)
    end

    --消耗显示
    showCost(self.ui.CostLayout,self.cost,50)
    Player:checkAddRedPoint(self.ui.Button_2,self.cost,30,5)
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XingChenBianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg1 = arg1
    self.data = data
    --SL:dump(data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XingChenBianOBJ