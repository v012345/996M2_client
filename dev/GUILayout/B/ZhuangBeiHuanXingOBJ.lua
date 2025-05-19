
ZhuangBeiHuanXingOBJ = {}
ZhuangBeiHuanXingOBJ.__cname = "ZhuangBeiHuanXingOBJ"
--ZhuangBeiHuanXingOBJ.config = ssrRequireCsvCfg("cfg_ZhuangBeiHuanXing")
ZhuangBeiHuanXingOBJ.cost = { { "灵石",2}, { "金币",1000000} }
ZhuangBeiHuanXingOBJ.where = 1

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuangBeiHuanXingOBJ:main(objcfg)
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

    --放入武器
    GUI:addOnClickEvent(self.ui.ButtonWeapon, function()
        local weapon = SL:GetMetaValue("EQUIP_DATA",1)
        if not weapon then
            sendmsg9("你身上没有武器！#249")
            return
        end
        self.where = 1
        self:UpdateUI()
    end)

    --放入衣服
    GUI:addOnClickEvent(self.ui.ButtonClothing, function()
        local clothing = SL:GetMetaValue("EQUIP_DATA",0)
        if not clothing then
            sendmsg9("你身上没有衣服！#249")
            return
        end
        self.where = 0
        self:UpdateUI()
    end)

    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        if not self.where then
            sendmsg9("提示：#251|你没有放入武器或者衣服，无法觉醒！#249")
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiHuanXing_Request, self.where)
    end)
    self.abilTextList = {}
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

--添加选中光圈
function ZhuangBeiHuanXingOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x - 2, position.y - 1, "res/custom/zhuangbeixilian/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end

function ZhuangBeiHuanXingOBJ:UpdateUI()
    if self.where then
        self:LoadEquip(self.ui.ImageView, self.where)
        local equip = SL:GetMetaValue("EQUIP_DATA", self.where)
        local abil_1 = 0
        local abil_2 = 0
        if equip["ExAbil"]["abil"][2]["v"][1] then
            abil_1 = equip["ExAbil"]["abil"][2]["v"][1][3] or 0
        end
        if equip["ExAbil"]["abil"][2]["v"][2] then
            abil_2 = equip["ExAbil"]["abil"][2]["v"][2][3] or 0
        end

        GUI:Text_setString(self.ui.TextName, equip.Name)
        if self.where == 1 then
            GUI:Text_setString(self.ui.TextAttr1, string.format("攻击伤害+%s%%", abil_1))
            self:AddSelectLight(self.ui.EquipShow)
        elseif self.where == 0 then
            GUI:Text_setString(self.ui.TextAttr1, string.format("人物体力+%s%%", abil_1))
            self:AddSelectLight(self.ui.EquipShow_1)
        end
        if abil_2 ~= 0 then
            abil_2 = abil_2 / 100
        end
        GUI:Text_setString(self.ui.TextAttr2, string.format("对怪增伤+%s%%", abil_2))
    end
    Player:checkAddRedPoint(self.ui.ButtonStart, self.cost, 20, 0)
    showCost(self.ui.Layout_1, self.cost,30,{width=50,height=50})
end

--放入装备
---* parent父控件
function ZhuangBeiHuanXingOBJ:LoadEquip(parent, where)
    GUI:removeAllChildren(parent)
   local equipShow = GUI:EquipShow_Create(parent, "equipShow1", 0, 0, where, false, {bgVisible = false, movable = false, doubleTakeOff = false, look = true})
    -- 装戴后自动刷新
    GUI:EquipShow_setAutoUpdate(equipShow)
end

function ZhuangBeiHuanXingOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.yuanBaoconut = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return ZhuangBeiHuanXingOBJ
