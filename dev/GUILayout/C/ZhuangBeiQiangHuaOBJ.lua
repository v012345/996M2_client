ZhuangBeiQiangHuaOBJ = {}
ZhuangBeiQiangHuaOBJ.__cname = "ZhuangBeiQiangHuaOBJ"
ZhuangBeiQiangHuaOBJ.config = ssrRequireCsvCfg("cfg_ZhuangBeiQiangHua")
ZhuangBeiQiangHuaOBJ.eventName = "装备强化"
ZhuangBeiQiangHuaOBJ.posNumbers = {1,0,6,8,10,4,3,5,7,11}
--装备映射编号
ZhuangBeiQiangHuaOBJ.posMap = {
    [1] = {1,169,211},        --武器
    [0] = {2,167,296},        --衣服
    [6] = {3,168,208},        --左手
    [8] = {4,168,123},        --右戒指
    [10] = {5,167,37},       --腰带
    [4] = {6,405,381},        --头盔
    [3] = {7,394,296},        --项链
    [5] = {8,478,211},        --右手
    [7] = {9,478,125},        --右戒
    [11] = {10,466,37},        --靴子
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuangBeiQiangHuaOBJ:main(objcfg)
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
    self.currPos = nil
    --注册事件
    self:RegisterEvent()
    self:InitEquipShow()
    self:InitClickEvent()
    self:UpdateUI()
    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBeiQiangHua_Request, self.currPos)
    end )
    GUI:addOnClickEvent(self.ui.ButtonHelp, function(widget)
        local allLevel = self.allLevel or 0
        local colors = {"#947B73","#947B73","#947B73","#947B73"}
        --
        if allLevel >= 5 then
            colors[1] = "#00ff00"
        end
        if allLevel >= 10 then
            colors[2] = "#00ff00"
        end
        if allLevel >= 13 then
            colors[3] = "#00ff00"
        end
        if allLevel >= 15 then
            colors[4] = "#00ff00"
        end
        local str = [[
                <font size='16' color='#f7e700'>装备强化绑定人物属性。</font>
                <font size='16' color=']]..colors[1]..[['>全身强化5：攻击力+100  生命值+20000 PK减伤+5%</font>
                <font size='16' color=']]..colors[2]..[['>全身强化10：攻击力+350 生命值+70000 怪物爆率+25% PK减伤+10%</font>
                <font size='16' color=']]..colors[3]..[['>全身强化13：攻击力+760 生命值+152000 怪物爆率+37% PK减伤+12%</font>
                <font size='16' color=']]..colors[4]..[['>全身强化15：攻击力+1280 生命值+256000 怪物爆率+55% PK减伤+20% 神力倍功+15%</font>
                ]]

        local thisWorldPosition = GUI:getWorldPosition(widget)
        local data = {width = 800, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
end

--初始化点击事件
function ZhuangBeiQiangHuaOBJ:InitClickEvent()
    --local btn = GUI:getChildren(self.ui.NodeClick)
    for i, v in pairs(self.posMap) do
        local layoutClick = GUI:getChildByName(self.ui.NodeClick,"LayoutClick_"..i)
        if layoutClick then
            GUI:addOnClickEvent(layoutClick,function()
                self:SelectEquip(i)
            end)
        end
    end
end

--选择强化装备
function ZhuangBeiQiangHuaOBJ:SelectEquip(pos)
    local equipData = SL:GetMetaValue("EQUIP_DATA", pos)
    if not equipData then
        sendmsg9("当前位置没有穿戴装备！#249")
        return
    end
    if pos then
        self.currPos = pos
    end
    self:UpdateUI()
end

--更新显示
function ZhuangBeiQiangHuaOBJ:UpdateUI()
    if not self.currPos then
        return
    end
    GUI:removeAllChildren(self.ui.NodeSelected)
    local img = self.posMap[self.currPos][1]
    local imgx = self.posMap[self.currPos][2]
    local imgy = self.posMap[self.currPos][3]

    local imgPath = "res/custom/ZhuangBeiQiangHua/2_"..img..".png"
    GUI:Image_Create(self.ui.NodeSelected, "Image_bg"..img, imgx, imgy, imgPath)
    local level
    level = self.data[self.currPos]
    if not level then
        level = self.data[tostring(self.currPos)]
    end
    local lastLevel = level - 1   --上一级
    --如果小于0，代表当前没强化
    local currCfg, lastCfg      --currCfg当前配置，lastCfg上一级配置（当前强化等级）
    currCfg = self.config[level]
    if not currCfg then
        currCfg = self.config[14]
    end
    --如果当前不是0级
    if lastLevel >= 0 then
        lastCfg = self.config[lastLevel]
    end
    --SL:dump(self:numberMapImg(level))
    GUI:Button_loadTextureNormal(self.ui.ShowLevel, self:numberMapImg(level)) --显示当前等级
    if lastCfg then
        local show = ""
        if self.currPos == 1 then
            show = lastCfg.attrShow[1]
        elseif self.currPos == 0 then
            show = lastCfg.attrShow[2]
        else
            show = lastCfg.attrShow[3]
        end
        GUI:Text_setString(self.ui.TextAttr, show)
    else
        GUI:Text_setString(self.ui.TextAttr, "未强化")
    end
    local qhdsShowStr = ""
    if self.qhdsFlag == 1 then
        qhdsShowStr = "(+5%)"
    end
    GUI:Text_setString(self.ui.TextCGL, currCfg.Success.."%"..qhdsShowStr)
    showCost(self.ui.LayoutCost, currCfg.cost,36)
    delRedPoint(self.ui.ButtonStart)
    if level < 15 then
        Player:checkAddRedPoint(self.ui.ButtonStart, currCfg.cost)
    end
    self:lightEquip()
    self:equipLevelShou()
end

--装备强化等级显示
function ZhuangBeiQiangHuaOBJ:equipLevelShou()
    for i, v in pairs(self.posNumbers) do
        local widget = self.ui["TextQH_"..v]
        if widget then
            local level = self.data[tostring(v)]
            if level then
                GUI:Text_setString(widget, "+"..level)
                GUI:setLocalZOrder(widget, 10)
            end
        end
    end
end

--点亮装备
function ZhuangBeiQiangHuaOBJ:lightEquip()
    for i, v in pairs(self.data) do
        if v > 9 then
            local imgLight = GUI:getChildByName(self.ui.NodeLightEquip,"ImageLigh_"..i)
            if imgLight then
                GUI:setVisible(imgLight,true)
            end
        end
    end
end

--数字映射图片
function ZhuangBeiQiangHuaOBJ:numberMapImg(num)
    if not num then
        return
    end
    local imgPath = "res/custom/ZhuangBeiQiangHua/level_"..num..".png"
    return imgPath
end

--初始化装备显示
function ZhuangBeiQiangHuaOBJ:InitEquipShow()
    for i, v in ipairs(self.posNumbers) do
        local widget = GUI:getChildByName(self.ui.NodeEquip, "ImageEquipCover_"..v)
        local equipData = SL:GetMetaValue("EQUIP_DATA", v)
        if equipData then
            if not self.currPos then
                self.currPos = v
            end
            if widget then
                GUI:setVisible(widget,true)
            end
        else
            if widget then
                GUI:setVisible(widget,false)
            end
        end

    end
end

--显示装备
function ZhuangBeiQiangHuaOBJ:ShowEquip(pos)
    local widget = GUI:getChildByName(self.ui.NodeEquip, "ImageEquipCover_"..pos)
    if widget then
        GUI:setVisible(widget,true)
    end
end

--隐藏装备
function ZhuangBeiQiangHuaOBJ:HideEquip(pos)
    local widget = GUI:getChildByName(self.ui.NodeEquip, "ImageEquipCover_"..pos)
    if widget then
        GUI:setVisible(widget,false)
    end
end

-------------------------------游戏事件---------------------------------------
--刷新UI
function ZhuangBeiQiangHuaOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function ZhuangBeiQiangHuaOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

function ZhuangBeiQiangHuaOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --穿装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName, function(t)
        self:ShowEquip(t.pos)
    end)
    --脱装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName, function(t)
        self:HideEquip(t.pos)
    end)
end

function ZhuangBeiQiangHuaOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhuangBeiQiangHuaOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    self.qhdsFlag = arg1
    self.allLevel = arg2
    if GUI:GetWindow(nil, self.__cname) then
        local parent = self.ui["ImageEquipCover_"..self.currPos]
        if parent then
            GUI:removeChildByName(parent, "EquipShow_"..self.currPos)
            local EquipShow = GUI:EquipShow_Create(parent, "EquipShow_"..self.currPos, 3.00, 3.00, self.currPos, false, {doubleTakeOff = false, look = true, movable = false, starLv = false, bgVisible = false})
            GUI:EquipShow_setAutoUpdate(EquipShow)
            GUI:setLocalZOrder(EquipShow, 0)
        end

        self:UpdateUI()
    end
end
return ZhuangBeiQiangHuaOBJ