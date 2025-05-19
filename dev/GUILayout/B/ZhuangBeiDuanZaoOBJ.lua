
ZhuangBeiDuanZaoOBJ = {}
ZhuangBeiDuanZaoOBJ.__cname = "ZhuangBeiDuanZaoOBJ"
ZhuangBeiDuanZaoOBJ.config = ssrRequireCsvCfg("cfg_ZhuangBeiDuanZao")
ZhuangBeiDuanZaoOBJ.where = 1 --默认武器是1

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuangBeiDuanZaoOBJ:main(objcfg)
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
    ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiDuanZao_Open)
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

        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiDuanZao_Request, self.where,1)
    end)

    GUI:addOnClickEvent(self.ui.ButtonCost2, function () 

        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiDuanZao_Request, self.where,2)
    end)


    GUI:addOnClickEvent(self.ui.ButtonHelp, function(widget)
        local str = ""
        if self.where == 1 then
            str = [[
                <font size='16' color='#c0c0c0'>只允许增幅身上的剑甲装备.</font>
                <font size='16' color='#00ff00'>【武器增幅属性介绍】：</font>
                <font size='16' color='#f7e700'>增幅1级： 最大攻击力+2%</font>
                <font size='16' color='#f7e700'>增幅2级： 最大攻击力+4%</font>
                <font size='16' color='#f7e700'>增幅3级： 最大攻击力+6%</font>
                <font size='16' color='#f7e700'>增幅4级： 最大攻击力+8%</font>
                <font size='16' color='#f7e700'>增幅5级： 最大攻击力+10%</font>
                <font size='16' color='#f7e700'>增幅6级： 最大攻击力+13%</font>
                <font size='16' color='#f7e700'>增幅7级： 最大攻击力+16%</font>
                <font size='16' color='#f7e700'>增幅8级： 最大攻击力+19%</font>
                <font size='16' color='#f7e700'>增幅9级： 最大攻击力+21%</font>
                <font size='16' color='#f7e700'>增幅10级：最大攻击力+25%</font>
                <font size='16' color='#f7e700'>增幅11级：最大攻击力+29%</font>
                <font size='16' color='#f7e700'>增幅12级：最大攻击力+33%</font>
                <font size='16' color='#f7e700'>增幅13级： 最大攻击力+37%</font>
                <font size='16' color='#f7e700'>增幅14级： 最大攻击力+43%</font>
                <font size='16' color='#f7e700'>增幅15级： 最大攻击力+55%</font>
                <font size='16' color='#ff0000'>(7级开始增幅有概率失败,失败不掉级)</font>
                ]]
        else
            str = [[
                <font size='16' color='#c0c0c0'>只允许增幅身上的剑甲装备.</font>
                <font size='16' color='#00ff00'>【衣服增幅属性介绍】：</font>
                <font size='16' color='#f7e700'>增幅1级： 最大生命值+2%</font>
                <font size='16' color='#f7e700'>增幅2级： 最大生命值+4%</font>
                <font size='16' color='#f7e700'>增幅3级： 最大生命值+6%</font>
                <font size='16' color='#f7e700'>增幅4级： 最大生命值+8%</font>
                <font size='16' color='#f7e700'>增幅5级： 最大生命值+10%</font>
                <font size='16' color='#f7e700'>增幅6级： 最大生命值+13%</font>
                <font size='16' color='#f7e700'>增幅7级： 最大生命值+16%</font>
                <font size='16' color='#f7e700'>增幅8级： 最大生命值+19%</font>
                <font size='16' color='#f7e700'>增幅9级： 最大生命值+21%</font>
                <font size='16' color='#f7e700'>增幅10级：最大生命值+25%</font>
                <font size='16' color='#f7e700'>增幅11级：最大生命值+29%</font>
                <font size='16' color='#f7e700'>增幅12级：最大生命值+33%</font>
                <font size='16' color='#f7e700'>增幅13级： 最大生命值+37%</font>
                <font size='16' color='#f7e700'>增幅14级： 最大生命值+43%</font>
                <font size='16' color='#f7e700'>增幅15级： 最大生命值+55%</font>
                <font size='16' color='#ff0000'>(7级开始增幅有概率失败,失败不掉级)</font>

            ]]
        end
        local thisWorldPosition = GUI:getWorldPosition(widget)
        local data = {width = 800, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end )

    self:UpdateUI()
end

--添加选中光圈
function ZhuangBeiDuanZaoOBJ:AddSelectLight(widget)
    local position = GUI:getPosition(widget)
    GUI:removeAllChildren(self.ui.NodeSelect)
    local ImageView = GUI:Image_Create(self.ui.NodeSelect, "ImageView", position.x - 2, position.y - 1, "res/custom/zhuangbeixilian/selected.png")
	GUI:setTouchEnabled(ImageView, false)
end

function ZhuangBeiDuanZaoOBJ:UpdateUI()
    if where ~= 1 and  where ~= 2 then
        GUI:setPosition(self.ui.LayoutLeft,568,84)
    end

    if self.where == 1 then
        self.index = self.data[1]
        self.cfg = self.config[self.index]
        self:LoadEquip(self.ui.ImageView, self.where)
        GUI:Text_setString(self.ui.attlooks, "最大攻击力+"..self.cfg.attr.."%")
        GUI:setVisible(self.ui.LayoutRight,false)
        self:AddSelectLight(self.ui.EquipShow1)
    elseif self.where == 0 then
        self.index = self.data[2]
        self.cfg = self.config[self.index]
        self:LoadEquip(self.ui.ImageView, self.where)
        GUI:Text_setString(self.ui.attlooks, "最大生命值+"..self.cfg.attr.."%")
        GUI:setVisible(self.ui.LayoutRight,false)
        self:AddSelectLight(self.ui.EquipShow2)
    end

    GUI:removeAllChildren(self.ui.Node_level)   --删除节点

    GUI:Image_Create(self.ui.Node_level, "ImageView1", 0.00, 0.00, "res/custom/jianjiaqianghua/level"..self.index..".png")  --图片星级显示
    GUI:Text_setString(self.ui.levellooks, "当前"..self.index.."级")
    GUI:Text_setString(self.ui.ranlooks, self.cfg.percentage2.."%成功")

    if self.index <= 8 then
        showCost(self.ui.LayoutCost1, self.cfg.cost1,50,{width=50,height=50})
        GUI:setPosition(self.ui.LayoutLeft,568,84)
        delRedPoint(self.ui.ButtonCost1)
        Player:checkAddRedPoint(self.ui.ButtonCost1, self.cfg.cost1, 16, 0)
    else
        showCost(self.ui.LayoutCost1, self.cfg.cost1,50,{width=50,height=50})
        GUI:setPosition(self.ui.LayoutLeft,404,84)
        GUI:Button_loadTextureNormal(self.ui.ButtonCost1,"res/custom/jianjiaqianghua/an_jb.png")
        GUI:setVisible(self.ui.LayoutRight,true)
        showCost(self.ui.LayoutCost2, self.cfg.cost2,50,{width=50,height=50})
        delRedPoint(self.ui.ButtonCost1)
        delRedPoint(self.ui.ButtonCost2)
        if self.index < 15 then
            Player:checkAddRedPoint(self.ui.ButtonCost1, self.cfg.cost1, 16, 0)
            Player:checkAddRedPoint(self.ui.ButtonCost2, self.cfg.cost2, 16, 0)
        end
    end
end

--放入装备
---* parent父控件
function ZhuangBeiDuanZaoOBJ:LoadEquip(parent, where)
    GUI:removeAllChildren(parent)
   local equipShow = GUI:EquipShow_Create(parent, "equipShow1", 0, 0, where, false, {bgVisible = false, movable = false, doubleTakeOff = false, look = true})
    -- 装戴后自动刷新
    GUI:EquipShow_setAutoUpdate(equipShow)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function ZhuangBeiDuanZaoOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

return ZhuangBeiDuanZaoOBJ
