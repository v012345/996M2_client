
ZhuangBeiXiLianOBJ = {}
ZhuangBeiXiLianOBJ.__cname = "ZhuangBeiXiLianOBJ"
ZhuangBeiXiLianOBJ.where = nil --初始化位置为空
ZhuangBeiXiLianOBJ.cost = { { "焚天石", 66 }, { "天工之锤", 66 }, { "金币", 200000 } } --消耗1
ZhuangBeiXiLianOBJ.cost1 = { { "焚天石", 33 }, { "天工之锤", 33 }, { "灵符", 40 } } --消耗2
ZhuangBeiXiLianOBJ.attrGroup = 1 --属性分组
ZhuangBeiXiLianOBJ.config = ssrRequireCsvCfg("cfg_ZhuangBeiXiLian")

--枚举装备类别
ZhuangBeiXiLianOBJ.equipmentCategories = {
    [0] = { 2, "衣服" }, -- 衣服
    [1] = { 1, "武器" }, -- 武器
    [3] = { 3, "项链" }, -- 首饰项链
    [4] = { 3, "头盔" }, -- 首饰头盔
    [5] = { 3, "右手镯" }, -- 首饰右手镯
    [6] = { 3, "左手镯" }, -- 首饰左手镯
    [7] = { 3, "右戒指" }, -- 首饰右戒指
    [8] = { 3, "左戒指" }, -- 首饰左戒指
    [10] = { 3, "腰带" }, -- 首饰腰带
    [11] = { 3, "靴子" } -- 首饰靴子
}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuangBeiXiLianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -20)
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
    --GUI:Timeline_Window1(self._parent)

    --帮助信息Begin：
    local helpStr = {
        "只允许洗练身上的首饰装备和剑甲装备.\n\n#7",
        "【武器洗练介绍】：#250",
        "暴击威力#151|        (注：增加暴击威力)#161",
        "真实伤害#151|         (注：对怪固定伤害)#161",
        "最终伤害#151|         (注：对怪百分比真实伤害值)#161",
        "攻击深度#151|         (注：增加当前装备的攻击力)#161",
        "伤害加深#151|         (注：增加PK时的伤害)#161",
        "半月技能威力#151|     (注：增加半月技能威力)#161",
        "烈火技能威力#151|     (注：增加烈火技能威力)#161",
        "开天技能威力#151|     (注：增加开天技能威力)#161",
        "逐日技能威力#151|     (注：增加逐日技能威力)\n\n#161",
        "【衣服洗练介绍】：#250",
        "伤害吸收#151|         (注：能够吸收一定的伤害)#161",
        "生命强度#151|         (注：增加当前装备的生命值)#161",
        "抵消伤害#151|         (注：能够抵消一定的PK伤害)#161",
        "连爆概率#151|         (注：增加连爆触发的概率)#161",
        "铁甲指数#151|         (注：增加当前装备的防御力)#161",
        "半月技能抵抗#151|     (注：增加半月技能抵抗)#161",
        "烈火技能抵抗#151|     (注：增加烈火技能抵抗)#161",
        "开天技能抵抗#151|     (注：增加开天技能抵抗)#161",
        "逐日技能抵抗#151|     (注：增加逐日技能抵抗)\n\n#161",
        "【首饰洗练介绍】：#250",
        "连爆次数#151|         (注：增加连爆的次数。上限：3)#161",
        "连爆概率#151|         (注：加连爆触发的概率)#161",
        "暴击威力#151|         (注：增加暴击威力)#161",
        "攻击深度#151|         (注：增加当前装备的攻击力)#161",
        "伤害加深#151|         (注：增加PK时的伤害)#161",
        "伤害吸收#151|         (注：能够吸收一定的伤害)#161",
        "生命强度#151|         (注：增加当前装备的生命值)#161",
        "抵消伤害#151|         (注：能够抵消一定的PK伤害)#161",
        "真实伤害#151|         (注：对怪固定伤害)#161",
        "最终伤害#151|         (注：对怪百分比真实伤害值)#161",
    }
    createMultiLineRichText(self.ui.ListViewHelp, "helpStr",0,0,helpStr)
    -- GUI:addOnClickEvent(self.ui.ButtonHelp, function()
    --     GUI:setVisible(self.ui.LayoutHelp, true)
    -- end )
    -- GUI:addOnClickEvent(self.ui.LayoutHelp, function()
    --     GUI:setVisible(self.ui.LayoutHelp, false)
    -- end )
    -- GUI:addOnClickEvent(self.ui.CloseButtonHelp, function()
    --     GUI:setVisible(self.ui.LayoutHelp, false)
    -- end )
    --帮助信息End：

    --放入装备
    --武器
    GUI:addOnClickEvent(self.ui.Layout_wuqi, function(widget)
        local pos = 1
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos

    end )
    --衣服
    GUI:addOnClickEvent(self.ui.Layout_yifu, function(widget)
        local pos = 0
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --项链
    GUI:addOnClickEvent(self.ui.Layout_xianglian, function(widget)
        local pos = 3
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --头盔
    GUI:addOnClickEvent(self.ui.Layout_toukui, function(widget)
        local pos = 4
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --右手镯
    GUI:addOnClickEvent(self.ui.Layout_youshou, function(widget)
        local pos = 5
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --左手镯
    GUI:addOnClickEvent(self.ui.Layout_zuoshou, function(widget)
        local pos = 6
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --右戒指
    GUI:addOnClickEvent(self.ui.Layout_youjie, function(widget)
        local pos = 7
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --左戒指
    GUI:addOnClickEvent(self.ui.Layout_zuojie, function(widget)
        local pos = 8
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --靴子
    GUI:addOnClickEvent(self.ui.Layout_xuezi, function(widget)
        local pos = 11
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )
    --腰带
    GUI:addOnClickEvent(self.ui.Layout_yaodai, function(widget)
        local pos = 10
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
        
    end )

    --开始洗练
    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        self:StartXiLian(1)
    end)
    GUI:addOnClickEvent(self.ui.ButtonStart_1, function()
        self:StartXiLian(2)
    end)
    self.where = nil
    self:UpdateUI()
end

--开始洗练装备

function ZhuangBeiXiLianOBJ:StartXiLian(XiLianType)
    if self.where == nil then
        sendmsg9(string.format("[提示]:#251|你没有放入装备#249"))
        return
    end

    local equipData = SL:GetMetaValue("EQUIP_DATA", self.where)
    local attrGroupName = equipData["ExAbil"]["abil"][3]["t"]
    if string.find(attrGroupName,"史诗") then
        local data = {}
        data.str = "[系统提示]：\t\t\t\t当前洗练的品质为：[史诗]\n\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t请问是否继续洗练？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiXiLian_Request, self.where,XiLianType)
            end
        end
        SL:OpenCommonTipsPop(data)
    else
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiXiLian_Request, self.where, XiLianType)
    end
end
--更新UI
function ZhuangBeiXiLianOBJ:UpdateUI()
    showCost(self.ui.Layout3, self.cost)
    showCost(self.ui.Layout3_1, self.cost1)
    if self.where ~= nil then
        self:LoadEquip(self.ui.ImageView, self.where)
        Player:checkAddRedPoint(self.ui.ButtonStart, self.cost)
        Player:checkAddRedPoint(self.ui.ButtonStart_1, self.cost1)
    end
end

--添加选中光圈
function ZhuangBeiXiLianOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x - 2, position.y - 3, "res/custom/zhuangbeixilian/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end

--获取洗练的最大属性
function ZhuangBeiXiLianOBJ:GetMaxAttr(attid,where)
    local result = nil
    for i, v in ipairs(self.config) do
        if v.realAttrId == attid then
            if where == 0 or where == 1 then
                result = v.random1[2]
            else
                result = v.random2[2]
            end
        end
    end
    return result
end

--放入装备
---* parent父控件
---* where 位置
function ZhuangBeiXiLianOBJ:LoadEquip(parent, where, widget)
    where = where or self.where
    if widget then
        self.selectBtnWidget = widget
    end
    local equipType = self.equipmentCategories[where]
    local equipData = SL:GetMetaValue("EQUIP_DATA", where)
    if not equipData then
        sendmsg9(string.format("[提示]:#251|你身上没有穿戴#250|%s#249", equipType[2]))
        return
    end
    self:AddSelectLight(self.selectBtnWidget)
    GUI:removeAllChildren(parent)
    local equipShow = GUI:EquipShow_Create(parent, "equipShow1", 0, 0, where, false, {bgVisible = false, movable = false, doubleTakeOff = false, look = true})
    -- 装戴后自动刷新
    GUI:EquipShow_setAutoUpdate(equipShow)
    local equipColor = SL:GetMetaValue("ITEM_NAME_COLOR_VALUE", equipData.Index)
    GUI:Text_setString(self.ui.Text_name, equipData.Name)
    GUI:Text_setTextColor(self.ui.Text_name, equipColor)
    --更新属性显示
    self:UpdateAttrShow(equipData,where)
    --添加红点
    Player:checkAddRedPoint(self.ui.ButtonStart, self.cost)
    Player:checkAddRedPoint(self.ui.ButtonStart_1, self.cost1)
end

function ZhuangBeiXiLianOBJ:UpdateAttrShow(equipData,where)
    --获取分组1的自定义属性
    local attrGroupName = equipData["ExAbil"]["abil"][3]["v"]
    local WidgetRTexts = {"RText_attr1", "RText_attr2", "RText_attr3", "RText_attr4", "RText_attr5"} --映射控件名字
    local WidgetTexts = {"Text_attr1", "Text_attr2", "Text_attr3", "Text_attr4", "Text_attr5"} --映射控件名字
    --local WidgetParentTexts = {"Text_1", "Text_2", "Text_3", "Text_4", "Text_5"} --映射控件名字
    GUI:removeAllChildren(self.ui.Node_attrListShow)
    for i = 1, 5 do
        if attrGroupName[i] then
            local color = attrGroupName[i][1] --颜色
            local id = attrGroupName[i][2] --属性id
            local value = attrGroupName[i][3] --属性值
            local isPercent = attrGroupName[i][4] --是否百分比
            local typeOrId = attrGroupName[i][5] --0=系统的表格 非0等于属性ID
            local TextPosition = GUI:getPosition(self.ui[WidgetTexts[i]]) --获取原来控件的位置
            local hexColor = SL:GetHexColorByStyleId(color) or "#F0B42A"
            local str = getCfg_att_score(id)
            if not str then
                return
            end
            local maxValue = self:GetMaxAttr(id, where) or 0
            local maxStr = ""
            if typeOrId == 0 then
                --是否万分比显示
                if str.type == 2 then
                    if value ~= 0 then
                        value = value / 100
                    end

                    --if maxValue ~= 0 then
                    --    maxValue = maxValue / 100
                    --end
                end
                local tmpValue = value
                if isPercent == 1 then
                    value = string.format("+%s%%", value)
                    maxStr = string.format("(max:%s%%)", maxValue)
                else
                    value = string.format("+%s", value)
                    maxStr = string.format("(max:%s)", maxValue)
                end
                if tmpValue >= maxValue then
                    hexColor = 250
                end
                GUI:RichTextFCOLOR_Create(self.ui.Node_attrListShow, WidgetRTexts[i], TextPosition.x, TextPosition.y, str.name ..":".. value .. maxStr, 250, 16, hexColor, 5)
            else
                --是否万分比显示
                if str.type == 2 then
                    if value ~= 0 then
                        value = value / 100
                    end
                    --if maxValue ~= 0 then
                    --    maxValue = maxValue / 100
                    --end
                end
                local tmpValue = value
                if isPercent == 1 then
                    value = string.format("%s%%", value)
                    maxStr = string.format("(max:%s%%)", maxValue)
                else
                    value = string.format("%s", value)
                    maxStr = string.format("(max:%s)", maxValue)
                end
                hexColor = 253
                if tmpValue >= maxValue then
                    hexColor = 250
                end
                local str = getCfg_custpro_caption(typeOrId).value
                GUI:RichTextFCOLOR_Create(self.ui.Node_attrListShow, WidgetRTexts[i], TextPosition.x, TextPosition.y, string.format(str, value) .. maxStr, 250, 16, hexColor, 5)
            end
            GUI:setVisible(self.ui[WidgetTexts[i]], false)
        else
            GUI:setVisible(self.ui[WidgetTexts[i]], true)
            GUI:Text_setString(self.ui[WidgetTexts[i]], "暂未觉醒")
        end
    end

end



function ZhuangBeiXiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.yuanBaoconut = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return ZhuangBeiXiLianOBJ
