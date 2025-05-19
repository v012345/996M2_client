ShiKongLunPanOBJ = {}
ShiKongLunPanOBJ.__cname = "ShiKongLunPanOBJ"
ShiKongLunPanOBJ.cost = {{"时间锁",1},{"轮回沙漏",1},{"失落空间",1},{"混沌本源",10},{"灵符",333},{"造化结晶",10}}
ShiKongLunPanOBJ.AttrNum = {["攻击加成"] = 8, ["道术加成"] = 7, ["魔法加成"] = 6, ["体力增加"] = 5, ["防御加成"] = 4, ["攻击伤害"] = 3, ["打怪爆率"] = 2, ["伤害吸收"] = 1, }


--ShiKongLunPanOBJ.config = ssrRequireCsvCfg("cfg_ShiKongLunPan")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShiKongLunPanOBJ:main(objcfg)
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

    --解锁按钮1
    GUI:addOnClickEvent(self.ui.Button_1_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request1,1)
    end)
    --解锁按钮2
    GUI:addOnClickEvent(self.ui.Button_2_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request1,2)
    end)
    --解锁按钮3
    GUI:addOnClickEvent(self.ui.Button_3_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request1,3)
    end)

    --转动轮盘1
    GUI:addOnClickEvent(self.ui.Button_1_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request2,1)
    end)
    --转动轮盘2
    GUI:addOnClickEvent(self.ui.Button_2_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request2,2)
    end)
    --转动轮盘3
    GUI:addOnClickEvent(self.ui.Button_3_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_Request2,3)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongLunPan_LiaoJie)

    self:UpdateUI()
end

--检测是否双倍
function ShiKongLunPanOBJ:CheckIsDouble(num)
    local AttrTbl = self.DataTbl[2]
    local multiple = 0
    if AttrTbl[num] == "暂无属性" then
         return multiple
    end
    for _, v in ipairs(AttrTbl) do
        if AttrTbl[num] == v then
            multiple = multiple + 1
        end
    end
    return multiple
end


function ShiKongLunPanOBJ:UpdateUI()
    --隐藏所有灵符
    local UiTbl = GUI:getChildren(self.ui.AllNode)

    for _, v in ipairs(UiTbl) do
        GUI:setVisible(v,false)
    end
    --获取开启状态
    local FlagTbl = self.DataTbl[1]
    --获取属性状态
    local AttrTbl = self.DataTbl[2]


    --未解锁状态1配置
    if FlagTbl[1] == 0 then
        GUI:setVisible(UiTbl[1],true)
        showCost(self.ui.ItemLooks_1_1,{self.cost[1],self.cost[4]},30)
        Player:checkAddRedPoint(self.ui.Button_1_1,{self.cost[1],self.cost[4]},30,5)
    else
        GUI:setVisible(UiTbl[4],true)
        Player:checkAddRedPoint(self.ui.Button_1_2,{self.cost[5],self.cost[6]},30,5)
        local  JiaoDu = (AttrTbl[1] == "暂无属性" and 0) or self.AttrNum[AttrTbl[1]]
        GUI:runAction(self.ui.LuoPan_1_2,GUI:ActionRotateTo(0.01,45*JiaoDu))
        local imgnum = ShiKongLunPanOBJ:CheckIsDouble(1)

        GUI:Image_loadTexture(self.ui.Image_1, "res/custom/JuQing/ShiKongLunPan/x".. imgnum ..".png")

        if imgnum == 0 then
            GUI:Text_setString(self.ui.Atrrlooks_1, AttrTbl[1])
        else
            GUI:Text_setString(self.ui.Atrrlooks_1, AttrTbl[1].."+6%")
        end
    end

    --未解锁状态2配置
    if FlagTbl[2] == 0 then
        GUI:setVisible(UiTbl[2],true)
        showCost(self.ui.ItemLooks_2_1,{self.cost[2],self.cost[4]},30)
        Player:checkAddRedPoint(self.ui.Button_2_1,{self.cost[2],self.cost[4]},30,5)
    else
        GUI:setVisible(UiTbl[5],true)
        Player:checkAddRedPoint(self.ui.Button_2_2,{self.cost[5],self.cost[6]},30,5)
        local  JiaoDu = (AttrTbl[2] == "暂无属性" and 0) or self.AttrNum[AttrTbl[2]]
        GUI:runAction(self.ui.LuoPan_2_2,GUI:ActionRotateTo(0.01,45*JiaoDu))
        local imgnum = ShiKongLunPanOBJ:CheckIsDouble(2)
        GUI:Image_loadTexture(self.ui.Image_2, "res/custom/JuQing/ShiKongLunPan/x".. imgnum ..".png")
        if imgnum == 0 then
            GUI:Text_setString(self.ui.Atrrlooks_2, AttrTbl[2])
        else
            GUI:Text_setString(self.ui.Atrrlooks_2, AttrTbl[2].."+6%")
        end
    end
    --未解锁状态3配置
    if FlagTbl[3] == 0 then
        GUI:setVisible(UiTbl[3],true)
        showCost(self.ui.ItemLooks_3_1,{self.cost[3],self.cost[4]},30)
        Player:checkAddRedPoint(self.ui.Button_3_1,{self.cost[3],self.cost[4]},30,5)
    else
        GUI:setVisible(UiTbl[6],true)
        Player:checkAddRedPoint(self.ui.Button_3_2,{self.cost[5],self.cost[6]},30,5)
        local  JiaoDu = (AttrTbl[3] == "暂无属性" and 0) or self.AttrNum[AttrTbl[3]]
        GUI:runAction(self.ui.LuoPan_3_2,GUI:ActionRotateTo(0.01,45*JiaoDu))
        local imgnum = ShiKongLunPanOBJ:CheckIsDouble(3)
        GUI:Image_loadTexture(self.ui.Image_3, "res/custom/JuQing/ShiKongLunPan/x".. imgnum ..".png")

        if imgnum == 0 then
            GUI:Text_setString(self.ui.Atrrlooks_3, AttrTbl[3])
        else
            GUI:Text_setString(self.ui.Atrrlooks_3, AttrTbl[3].."+6%")
        end
    end
end

--转盘播放动画
function ShiKongLunPanOBJ:lotteryAnim(Num,EffectsData)
    local EndSite =   self.AttrNum[EffectsData[2]] *45    --结束位置
    local _Handle = GUI:getChildByName(self.ui["Node_"..Num.."_2"],"LuoPan_"..Num.."_2")
    if _Handle then
        GUI:runAction(_Handle,GUI:ActionRotateTo(0.01,0)) --初始化转盘位置
        GUI:runAction(_Handle,GUI:ActionSequence(GUI:ActionEaseExponentialOut(GUI:ActionRotateTo(2, (math.random(8, 10) * 360 + EndSite)))))
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--消息同步
function ShiKongLunPanOBJ:SyncResponse(arg1, arg2, arg3, DataTbl)
    self.DataTbl = DataTbl
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

--转盘播放
function ShiKongLunPanOBJ:PlayEffects(EffectsArg1, EffectsArg2, EffectsArg3, EffectsData)
    if GUI:GetWindow(nil, self.__cname) then
        self:lotteryAnim(EffectsArg3,EffectsData)
    end
end

--刷新属性
function ShiKongLunPanOBJ:UpdateAttr(arg1, arg2, arg3, AttrData)
    self.AttrData = AttrData
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShiKongLunPanOBJ