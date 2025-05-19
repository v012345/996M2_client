JueXingShenZhuangOBJ = {}
JueXingShenZhuangOBJ.__cname = "JueXingShenZhuangOBJ"
--JueXingShenZhuangOBJ.config = ssrRequireCsvCfg("cfg_JueXingShenZhuang")

JueXingShenZhuangOBJ.cost = { { "金币", 500000000 }, { "元宝", 14880000 }, { "灵石", 888 } }
JueXingShenZhuangOBJ.ShenZhuang = {
    { "鬼画符", { "鬼画符(SSSR)", "鬼画符(SSR)", "鬼画符(SR)", "鬼画符(S)", "鬼画符(A)" } },
    { "帝国神龙", { "帝国の神龙(究极体)", "帝国の神龙(完全体)", "帝国の神龙(成熟期)", "帝国の神龙(成长期)", "帝国の神龙(幼年期)" } },
    { "魔刃噬魂", { "魔刃·噬魂(SSSR)", "魔刃·噬魂(SSR)", "魔刃·噬魂(SR)", "魔刃·噬魂(S)", "魔刃·噬魂(A)" } },
    { "魔戒骷髅王", { "魔戒·骷髅王(SSSR)", "魔戒·骷髅王(SSR)", "魔戒·骷髅王(SR)", "魔戒·骷髅王(S)", "魔戒·骷髅王(A)" } }
}
JueXingShenZhuangOBJ.gives = { "【EX级】哀霜之触", "【EX级】超能战盔", "【EX级】圣之语", "【EX级】冰火之羽", "【EX级】埃兰宝典" }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JueXingShenZhuangOBJ:main(objcfg)
    local myLevel = SL:GetMetaValue("LEVEL")
    if myLevel < 320 then
        sendmsg9("你的等级不足320级不可以觉醒神装!#249")
        return
    end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -30)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JueXingShenZhuang_Request)
    end)
    --置换
    GUI:addOnClickEvent(self.ui.Button2, function()
        local data = {}
        data.str = "随机使用背包内的EX级神装进行随机置换，需要花费1888灵符，请确认是否置换？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.JueXingShenZhuang_RequestReplace)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:ShowEquipList()
    self:UpdateUI()
end
--显示装备列表
function JueXingShenZhuangOBJ:ShowEquipList()
    local list = GUI:getChildren(self.ui.Node_1)
    for i, v in ipairs(list) do
        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", self.gives[i])
        local Item = GUI:ItemShow_Create(v, "Item", 40.00, 40.00, { look = true, count = 1, bgVisible = false, index = idx })
        GUI:setAnchorPoint(Item, 0.50, 0.50)
    end
    local delayTime = GUI:DelayTime(0.3)
    local action1 = GUI:ActionMoveTo(1.5, 0, 10)
    local action2 = GUI:ActionMoveTo(1.5, 0, 0)
    local orderAction = GUI:ActionSequence(action1, action2)
    local loopAction = GUI:ActionRepeatForever(orderAction, 0.5)
    GUI:runAction(self.ui.Node_1, loopAction)
end
--判断是否拥有可以置换的装备
function JueXingShenZhuangOBJ:CheckReplace()
    local has = false
    local count = 0
    for i, value in ipairs(self.ShenZhuang) do
        for _, v in ipairs(value[2]) do
            local num = SL:GetMetaValue("ITEM_COUNT", v)
            if num > 0 then
                count = count + 1
            end
        end
    end
    if count >= 4 then
        has = true
    else
        has = false
    end
    return has
end

function JueXingShenZhuangOBJ:UpdateUI()
    local isHas = self:CheckReplace()
    delRedPoint(self.ui.Button1)
    if isHas then
        Player:checkAddRedPoint(self.ui.Button1, self.cost, 36, 10)
    end
    showCost(self.ui.LayoutCost, self.cost, 50)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JueXingShenZhuangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JueXingShenZhuangOBJ