ZhenBaoJianDingOBJ = {}
ZhenBaoJianDingOBJ.where = nil --初始化位置为空
ZhenBaoJianDingOBJ.__cname = "ZhenBaoJianDingOBJ"
ZhenBaoJianDingOBJ.cost1 = { { "灵石", 2 }, { "元宝", 60000 }}       --重置消耗
ZhenBaoJianDingOBJ.cost2 = { { "幻灵水晶", 50 }, { "金币", 660000 }}  --鉴定消耗

--ZhenBaoJianDingOBJ.config = ssrRequireCsvCfg("cfg_ZhenBaoJianDing")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhenBaoJianDingOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Layout_widget_1, function(widget)
        local pos = 30
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_2, function(widget)
        local pos = 31
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_3, function(widget)
        local pos = 32
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_4, function(widget)
        local pos = 33
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_5, function(widget)
        local pos = 34
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_6, function(widget)
        local pos = 35
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_7, function(widget)
        local pos = 36
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_8, function(widget)
        local pos = 37
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_9, function(widget)
        local pos = 38
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)
    GUI:addOnClickEvent(self.ui.Layout_widget_10, function(widget)
        local pos = 39
        self:LoadEquip(self.ui.ImageView, pos, widget)
        self.where = pos
    end)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        self:StartXiLian(1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        self:StartXiLian(2)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

local AttrShow = { [63] = "攻击上限", [64] = "魔法上限", [65] = "道术上限", [66] = "血量上限", [67] = "蓝量上限", [68] = "物防上限",
                   [69] = "魔防上限", [70] = "攻速增加", [71] = "鞭尸概率", [72] = "奇遇概率", [73] = "攻击加成", [74] = "魔法加成",
                   [75] = "道术加成", [76] = "血量加成", [77] = "蓝量加成"}

function ZhenBaoJianDingOBJ:UpdateAttrShow()
    local attrdata = self.equipData.ExAbil.abil[1].v
    if attrdata[1] then
        local LookNum = attrdata[1][5]
        local AttrNum = attrdata[1][3]
        local isAttrPercent = (attrdata[1][4] == 1 and "%") or ""
        GUI:Text_setString(self.ui.Text_attr1,AttrShow[LookNum].."+"..AttrNum..isAttrPercent)
        GUI:Text_setTextColor(self.ui.Text_attr1, "#00ff00")
    else
        GUI:Text_setString(self.ui.Text_attr1,"暂未鉴定")
        GUI:Text_setTextColor(self.ui.Text_attr1, "#ffffff")
    end
    if attrdata[2] then
        local LookNum = attrdata[2][5]
        local AttrNum = attrdata[2][3]
        local isAttrPercent = (attrdata[2][4] == 1 and "%") or ""
        GUI:Text_setString(self.ui.Text_attr2,AttrShow[LookNum].."+"..AttrNum..isAttrPercent)
        GUI:Text_setTextColor(self.ui.Text_attr2, "#00ff00")
    else
        GUI:Text_setString(self.ui.Text_attr2,"暂未鉴定")
        GUI:Text_setTextColor(self.ui.Text_attr2, "#ffffff")
    end
    if attrdata[3] then
        local LookNum = attrdata[3][5]
        local AttrNum = attrdata[3][3]
        local isAttrPercent = (attrdata[3][4] == 1 and "%") or ""
        GUI:Text_setString(self.ui.Text_attr3,AttrShow[LookNum].."+"..AttrNum..isAttrPercent)
        GUI:Text_setTextColor(self.ui.Text_attr3, "#00ff00")
    else
        GUI:Text_setString(self.ui.Text_attr3,"暂未鉴定")
        GUI:Text_setTextColor(self.ui.Text_attr3, "#ffffff")
    end
    if attrdata[4] then
        local LookNum = attrdata[4][5]
        local AttrNum = attrdata[4][3]
        local isAttrPercent = (attrdata[3][4] == 1 and "%") or ""
        GUI:Text_setString(self.ui.Text_attr4,AttrShow[LookNum].."+"..AttrNum..isAttrPercent)
        GUI:Text_setTextColor(self.ui.Text_attr4, "#00ff00")
    else
        GUI:Text_setString(self.ui.Text_attr4,"暂未鉴定")
        GUI:Text_setTextColor(self.ui.Text_attr4, "#ffffff")
    end
    if attrdata[5] then
        local LookNum = attrdata[5][5]
        local AttrNum = attrdata[5][3]
        local isAttrPercent = (attrdata[5][4] == 1 and "%") or ""
        GUI:Text_setString(self.ui.Text_attr5,AttrShow[LookNum].."+"..AttrNum..isAttrPercent)
        GUI:Text_setTextColor(self.ui.Text_attr5, "#00ff00")
    else
        GUI:Text_setString(self.ui.Text_attr5,"暂未鉴定")
        GUI:Text_setTextColor(self.ui.Text_attr5, "#ffffff")
    end
    
end

function ZhenBaoJianDingOBJ:LoadEquip(parent, where, widget)
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

    GUI:removeAllChildren(self.ui.ImageView)
    local equipShow = GUI:EquipShow_Create(self.ui.ImageView, "equipShow1", 0, 0, where, false, {bgVisible = false, movable = false, doubleTakeOff = false, look = true})
    GUI:EquipShow_setAutoUpdate(equipShow)     -- 装戴后自动刷新

    --执行添加光圈
    self:AddSelectLight(self.selectBtnWidget)

    --更新属性显示
    self:UpdateAttrShow(equipData)
end

--添加选中光圈
function ZhenBaoJianDingOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x + 26, position.y - 9, "res/custom/zhuangbeixilian/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end


--挂在消耗
function ZhenBaoJianDingOBJ:UpdateUI()
    showCost(self.ui.CostShow1,self.cost1,50,{width = 50, height = 50})
    showCost(self.ui.CostShow2,self.cost2,50,{width = 50, height = 50})
end


function ZhenBaoJianDingOBJ:StartXiLian(XiLianType)
    if self.where == nil then
        sendmsg9(string.format("[提示]:#251|你没有放入装备#249"))
        return
    end
    if not self.equipData then
        sendmsg9("[提示]:#251|你没有放入装备#249")
        return
    end

    if XiLianType == 1 then
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhenBaoJianDing_Request1, self.where)
    end

    if XiLianType == 2 then
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhenBaoJianDing_Request2, self.where)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhenBaoJianDingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
        self:LoadEquip()
    end
end
return ZhenBaoJianDingOBJ