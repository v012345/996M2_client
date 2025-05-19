NiuMaNiXiOBJ = {}
NiuMaNiXiOBJ.__cname = "NiuMaNiXiOBJ"
NiuMaNiXiOBJ.config = ssrRequireCsvCfg("cfg_NiuMaNiXi_Data")
NiuMaNiXiOBJ.Switch = 1
NiuMaNiXiOBJ.HongDian = {}


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function NiuMaNiXiOBJ:main(objcfg)
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

-------------------------------↓↓↓ 切换第几天按钮 ↓↓↓---------------------------------------
    GUI:addOnClickEvent(self.ui.Button_1_Day, function()
        self.Switch = 1
        self:UpdateUI(self.Switch)
    end)

    GUI:addOnClickEvent(self.ui.Button_2_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 2 then
            self.Switch = 2
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|2#249|天再来...#250")
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_3_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 3 then
            self.Switch = 3
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|3#249|天再来...#250")
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_4_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 4 then
            self.Switch = 4
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|4#249|天再来...#250")
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_5_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 5 then
            self.Switch = 5
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|5#249|天再来...#250")
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_6_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 6 then
            self.Switch = 6
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|6#249|天再来...#250")
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_7_Day, function()
        local  DayNum =  tonumber(Player:getServerVar("G3"))
        if DayNum >= 7 then
            self.Switch = 7
            self:UpdateUI(self.Switch)
        else
            sendmsg9("[提示]:#251|请到第#250|7#249|天再来...#250")
        end
    end)

    --领取每日的总奖励
    GUI:addOnClickEvent(self.ui.AwardButton, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.NiuMaNiXi_Request2,self.Switch)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end




function NiuMaNiXiOBJ:UpdateUI()
    local num = self.Switch
    GUI:setVisible(self.ui.Select_1_Day, false)
    GUI:setVisible(self.ui.Select_2_Day, false)
    GUI:setVisible(self.ui.Select_3_Day, false)
    GUI:setVisible(self.ui.Select_4_Day, false)
    GUI:setVisible(self.ui.Select_5_Day, false)
    GUI:setVisible(self.ui.Select_6_Day, false)
    GUI:setVisible(self.ui.Select_7_Day, false)
    GUI:setVisible(self.ui["Select_".. num .."_Day"], true)
    GUI:removeAllChildren(self.ui.ListView_All)

    --一级按钮画按钮
    local dayNum = tonumber(Player:getServerVar("G3"))
    for k, v in ipairs(self.data) do
        delRedPoint(self.ui["Button_".. k .."_Day"])
        if k <= dayNum then
            for _, j in pairs(v) do
                if j == "可领取"   then
                    addRedPoint(self.ui["Button_".. k .."_Day"], 20, 0)
                end
            end
        end
    end

    local cfg = self.config[num]
    for i, v in ipairs(cfg.Show) do
        local Image_bg = GUI:Image_Create(self.ui.ListView_All, "Image_"..num..i, 0.00, 0.00, "res/custom/NiuMaNiXi/looksbg.png")
        local Text_Show = GUI:Text_Create(Image_bg, "Text_"..num..i, 18.00, 31.00, 17, "#f9ee3b", v)
        GUI:setAnchorPoint(Text_Show, 0.00, 0.50)
        GUI:Text_enableOutline(Text_Show, "#000000", 2)

        local Item_Show = GUI:Layout_Create(Image_bg, "Panel_"..num..i, 354.00, 9.00, 50, 50, false)
        ssrAddItemListX(Item_Show, {cfg.AwardMoney},"每日小节奖励",{imgRes = "res/custom/NiuMaNiXi/item.png"})

        local _i = tostring(i)
        if self.data[num][_i] ~= "已领取" then
            local Button_Request = GUI:Button_Create(Image_bg, "Button_"..num..i, 468.00, 7.00, "res/custom/JuQing/btn17.png")
            GUI:addOnClickEvent(Button_Request, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.NiuMaNiXi_Request1,num,i)
            end)
            --每日小节奖励添加红点
            if self.data[num][_i] == "可领取" then
                delRedPoint(Button_Request)
                addRedPoint(Button_Request, 20, 0)
                self.HongDian[_i] = 1
            end
        elseif self.data[num][_i] == "已领取" then
            local ImageLooks = GUI:Image_Create(Image_bg, "Image_"..num..i, 466.00, 5.00, "res/custom/NiuMaNiXi/ylq.png")
            GUI:setScaleX(ImageLooks, 0.33)
            GUI:setScaleY(ImageLooks, 0.33)
        end
    end
    ssrAddItemListX(self.ui.AwardShow, {cfg.AwardItem},"每日总奖励",{imgRes = ""})

    GUI:setVisible(self.ui.State_Image,false)
    if self.data[self.Switch]["总奖励"] == "已领取" then
        GUI:setVisible(self.ui.State_Image,true)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function NiuMaNiXiOBJ:SyncResponse(arg1, arg2, arg3, data)
    --TopIcon添加红点
    --local dayNum = tonumber(Player:getServerVar("G3"))
    --SL:release_print(arg1)
    local TopIconState = false
    for k, v in ipairs(data) do
        if arg1 >= k then
            for _, j in pairs(v) do
                if j == "可领取" then
                    TopIconState = true
                    break
                end
            end
        end
    end

    local TopIconNode_look = GUI:GetWindow(MainMiniMap._parent, "TopIconLayout")
    local TopIconNode = GUI:GetWindow(TopIconNode_look, "TopIconNode_1")
    local IconObj = GUI:GetWindow(TopIconNode, "110")
    if IconObj then
        delRedPoint(IconObj)
        if TopIconState then
            addRedPoint(IconObj, 20, 0)
        end
    end

    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return NiuMaNiXiOBJ