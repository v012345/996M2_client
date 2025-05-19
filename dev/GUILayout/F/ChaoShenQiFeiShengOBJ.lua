ChaoShenQiFeiShengOBJ = {}
ChaoShenQiFeiShengOBJ.where = nil --初始化位置为空
ChaoShenQiFeiShengOBJ.__cname = "ChaoShenQiFeiShengOBJ"
ChaoShenQiFeiShengOBJ.config = ssrRequireCsvCfg("cfg_ChaoShenQiFeiSheng")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChaoShenQiFeiShengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-30,-40)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    self.where = nil
    GUI:setTouchEnabled(self.ui.CloseLayout,true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_Tips, function()
        local Bool = GUI:getVisible(self.ui.Image_Tips)
        if Bool then
            GUI:setVisible(self.ui.Image_Tips,false)
        else
            GUI:setVisible(self.ui.Image_Tips,true)
        end
    end)

    GUI:addOnClickEvent(self.ui.Layout_widget_1, function(widget)
        local pos = 71
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_2, function(widget)
        local pos = 72
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_3, function(widget)
        local pos = 73
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_4, function(widget)
        local pos = 74
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_5, function(widget)
        local pos = 75
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_6, function(widget)
        local pos = 76
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        if self.where == nil then
            sendmsg9(string.format("[提示]:#251|你没有放入装备#249"))
            return
        end
        if not self.equipData then
            sendmsg9("[提示]:#251|你没有选择装备#249")
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.ChaoShenQiFeiSheng_Request, self.where)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

local IsItemData = {["一缕神念"] = true, ["暮潮"] = true, ["金色黎明的圣物箱"] = true, ["永恒凛冬"] = true, ["降星者"] = true, ["孤影流觞"] = true}
function ChaoShenQiFeiShengOBJ:LoadEquip(parent, where, widget)
    where = where or self.where
    if widget then
        self.selectBtnWidget = widget
    end
    local equipData = SL:GetMetaValue("EQUIP_DATA", where)
    self.equipData = equipData

    if not equipData then
        sendmsg9("[提示]:#251|该位置未穿戴装备...#250")
        return
    end
    if not IsItemData[equipData.Name] then
           sendmsg9("提示#251|:#255|对不起#250||".. equipData.Name .."#249|不支持飞升#250|...")
        return
    end
    --if Num >= 5 then
    --       sendmsg9("提示#251|:#255|对不起#250|".. equipData.Name .."#249|已经飞升#250|5次#249|...")
    --    return
    --end
    --执行添加光圈
    self:AddSelectLight(self.selectBtnWidget)
    self:AddCostShow(where)
end
function ChaoShenQiFeiShengOBJ:AddCostShow(where)
    where = where or self.where
    local equipData = SL:GetMetaValue("EQUIP_DATA", where)
    local _Num = (equipData.Star == nil and 0) or equipData.Star
    local Num = (_Num >= 5 and 5) or (_Num + 1)
    local cfg = self.config[equipData.Name]
    showCost(self.ui.CostShow,cfg["cost"..Num],12,{itemBG = ""})
    local cfg1 = self.config[_Num]
    local cfg2 = self.config[Num]
    GUI:Text_setString(self.ui.AttrLook_L_1,"全 属 性+"..cfg1.Attr1.."%")
    GUI:Text_setString(self.ui.AttrLook_L_2,"攻 击 力+"..cfg1.Attr2.."%")
    GUI:Text_setString(self.ui.AttrLook_L_3,"血 量 值+"..cfg1.Attr2.."%")
    GUI:Text_setString(self.ui.AttrLook_R_1,"全 属 性+"..cfg2.Attr1.."%")
    GUI:Text_setString(self.ui.AttrLook_R_2,"攻 击 力+"..cfg2.Attr2.."%")
    GUI:Text_setString(self.ui.AttrLook_R_3,"血 量 值+"..cfg2.Attr2.."%")
end

--添加选中光圈
function ChaoShenQiFeiShengOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x - 5, position.y - 7, "res/custom/ChaoShenQiFeiSheng/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end

function ChaoShenQiFeiShengOBJ:UpdateUI()
    for i = 71, 76 do
        local ItemData = SL:GetMetaValue("EQUIP_DATA", i)
        local Num = (ItemData == nil and 0) or (ItemData.Star == nil and 0) or ItemData.Star
        GUI:TextAtlas_setString(self.ui["LevelNum_"..i - 70], Num)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChaoShenQiFeiShengOBJ:SyncResponse(arg1, arg2, arg3, data)

    if GUI:GetWindow(nil, self.__cname) then
        self:AddCostShow()
        self:UpdateUI()

    end
end
return ChaoShenQiFeiShengOBJ