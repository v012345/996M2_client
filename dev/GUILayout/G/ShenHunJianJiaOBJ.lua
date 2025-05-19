
ShenHunJianJiaOBJ = {}
ShenHunJianJiaOBJ.__cname = "ShenHunJianJiaOBJ"
ShenHunJianJiaOBJ.config = ssrRequireCsvCfg("cfg_ShenHunJianJia")
ShenHunJianJiaOBJ.where = 1 --默认武器是1

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenHunJianJiaOBJ:main(objcfg)
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
    GUI:addOnClickEvent(self.ui.Button_wuqi, function()
        local weapon = SL:GetMetaValue("EQUIP_DATA",1)
        if not weapon then
            sendmsg9("你身上没有武器！#249")
            return
        end
        self.where = 1
        self:UpdateUI()
    end)

    --放入衣服
    GUI:addOnClickEvent(self.ui.Button_yifu, function()
        local clothing = SL:GetMetaValue("EQUIP_DATA",0)
        if not clothing then
            sendmsg9("你身上没有衣服！#249")
            return
        end
        self.where = 0
        self:UpdateUI()
    end)

    GUI:addOnClickEvent(self.ui.ButtonCost1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunJianJia_Request, self.where,1)
    end)

    GUI:addOnClickEvent(self.ui.ButtonCost2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunJianJia_Request, self.where,2)
    end)


    GUI:addOnClickEvent(self.ui.ButtonHelp, function(widget)
        local str = ""
        if self.where == 1 then
            str = [[
                <font size='16' color='#c0c0c0'>只允许强化身上的剑甲装备.</font>
                <font size='16' color='#00ff00'>【武器强化属性介绍】：</font>
                <font size='16' color='#f7e700'>强化1级： 神魂攻击+1%</font>
                <font size='16' color='#f7e700'>强化2级： 神魂攻击+2%</font>
                <font size='16' color='#f7e700'>强化3级： 神魂攻击+4%</font>
                <font size='16' color='#f7e700'>强化4级： 神魂攻击+6%</font>
                <font size='16' color='#f7e700'>强化5级： 神魂攻击+8%</font>
                <font size='16' color='#f7e700'>强化6级： 神魂攻击+10%</font>
                <font size='16' color='#f7e700'>强化7级： 神魂攻击+13%</font>
                <font size='16' color='#f7e700'>强化8级： 神魂攻击+16%</font>
                <font size='16' color='#f7e700'>强化9级： 神魂攻击+20%</font>
                <font size='16' color='#f7e700'>强化10级：神魂攻击+24%</font>
                <font size='16' color='#ff0000'>(保底10次必成)</font>
                ]]
        else
            str = [[
                <font size='16' color='#c0c0c0'>只允许强化身上的剑甲装备.</font>
                <font size='16' color='#00ff00'>【衣服强化属性介绍】：</font>
                <font size='16' color='#f7e700'>强化1级： 神魂生命+1%</font>
                <font size='16' color='#f7e700'>强化2级： 神魂生命+2%</font>
                <font size='16' color='#f7e700'>强化3级： 神魂生命+4%</font>
                <font size='16' color='#f7e700'>强化4级： 神魂生命+6%</font>
                <font size='16' color='#f7e700'>强化5级： 神魂生命+8%</font>
                <font size='16' color='#f7e700'>强化6级： 神魂生命+10%</font>
                <font size='16' color='#f7e700'>强化7级： 神魂生命+13%</font>
                <font size='16' color='#f7e700'>强化8级： 神魂生命+16%</font>
                <font size='16' color='#f7e700'>强化9级： 神魂生命+20%</font>
                <font size='16' color='#f7e700'>强化10级：神魂生命+24%</font>
                <font size='16' color='#ff0000'>(保底10次必成)</font>

            ]]
        end
        local thisWorldPosition = GUI:getWorldPosition(widget)
        local data = {width = 800, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end )

    self:UpdateUI()
end

--添加选中光圈
function ShenHunJianJiaOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x - 2, position.y - 1, "res/custom/zhuangbeixilian/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end

function ShenHunJianJiaOBJ:UpdateUI()
    if self.where == 1 then
        self.index = self.data[1]
        self.cfg = self.config[self.index]
        self:LoadEquip(self.ui.ImageView, self.where)
        GUI:Text_setString(self.ui.attlooks, "神魂击力+"..self.cfg.attr.."%")
        GUI:setVisible(self.ui.LayoutRight,false)
        self:AddSelectLight(self.ui.EquipShow1)
    elseif self.where == 0 then
        self.index = self.data[2]
        self.cfg = self.config[self.index]
        self:LoadEquip(self.ui.ImageView, self.where)
        GUI:Text_setString(self.ui.attlooks, "神魂生命+"..self.cfg.attr.."%")
        GUI:setVisible(self.ui.LayoutRight,false)
        self:AddSelectLight(self.ui.EquipShow2)
    end

    GUI:removeAllChildren(self.ui.Node_level)   --删除节点

    GUI:Image_Create(self.ui.Node_level, "ImageView1", 0.00, 0.00, "res/custom/jianjiaqianghua/level"..self.index..".png")  --图片星级显示
    GUI:Text_setString(self.ui.levellooks, self.index)
    GUI:Text_setString(self.ui.ranlooks, self.cfg.percentage2.."%成功")
    GUI:Text_setString(self.ui.ranlooks_1, self.cfg.percentage4.."%成功")
    showCost(self.ui.LayoutCost1, self.cfg.cost1,26,{width=50,height=50})
    GUI:setVisible(self.ui.LayoutRight,true)
    showCost(self.ui.LayoutCost2, self.cfg.cost2,26,{width=50,height=50})
    delRedPoint(self.ui.ButtonCost1)
    delRedPoint(self.ui.ButtonCost2)
    if self.index < 10 then
        Player:checkAddRedPoint(self.ui.ButtonCost1, self.cfg.cost1, 25, 0)
        Player:checkAddRedPoint(self.ui.ButtonCost2, self.cfg.cost2, 25, 0)
    end
end

--放入装备
---* parent父控件
function ShenHunJianJiaOBJ:LoadEquip(parent, where)
    GUI:removeAllChildren(parent)
   local equipShow = GUI:EquipShow_Create(parent, "equipShow1", 0, 0, where, false, {bgVisible = false, movable = false, doubleTakeOff = false, look = true})
    -- 装戴后自动刷新
    GUI:EquipShow_setAutoUpdate(equipShow)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function ShenHunJianJiaOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

return ShenHunJianJiaOBJ
