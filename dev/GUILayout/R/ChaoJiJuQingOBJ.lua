ChaoJiJuQing = {}
ChaoJiJuQing.__cname = "ChaoJiJuQing"
ChaoJiJuQing.cfg_JuQingCategories = ssrRequireCsvCfg("cfg_JuQingCategories")
ChaoJiJuQing.cfg_JuQing = ssrRequireCsvCfg("cfg_JuQing")
ChaoJiJuQing.cost = { {} }
ChaoJiJuQing.give = { {} }
ChaoJiJuQing.jqImgPath = "res/custom/ZhuXianAndJuQing/ju_qing_btn/"
ChaoJiJuQing.MenuConfig = {}
ChaoJiJuQing.currParentId = 1
for _, item in ipairs(ChaoJiJuQing.cfg_JuQing) do
    local category = item.CategoryID
    if not ChaoJiJuQing.cfg_JuQingCategories[category].child then
        ChaoJiJuQing.cfg_JuQingCategories[category].child = {}
    end
    table.insert(ChaoJiJuQing.cfg_JuQingCategories[category].child, item)
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChaoJiJuQing:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    self.lastSelectParentBtn = nil
    self.lastSelectChildBtn = nil
    self.parentMenuBtn = {}
    self.lastClickBtn = nil --记录上次点击的按钮位置
    self.currDaLu = tonumber(Player:getServerVar("U54"))

    GUI:addOnClickEvent(self.ui.Button_3, function()
        if self.currSelect then
            ssrMessage:sendmsg(ssrNetMsgCfg.ChaoJiJuQing_Request1,self.ParentIndex,0)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.ChaoJiJuQing_Request2, 0, self.ChildIndex)
        end
    end)

    self:UpdateUI()
    --默认显示第一个
    self:JQMainClick(self.currParentId, self.cfg_JuQingCategories[self.currParentId])
end
--点击主菜单
function ChaoJiJuQing:JQMainClick(index, cfg)
    self.currSelect = true
    if self.currDaLu < index then
        local numberFount = SL:NumberToChinese(index)
        sendmsg9(string.format("你还没有解锁%s大陆，无法查看！#249", numberFount))
        return
    end
    self.ParentCfg = cfg
    self.ParentIndex = index
    GUI:removeAllChildren(self.ui.Node_bj1)
    GUI:removeAllChildren(self.ui.Panel_3)
    GUI:Button_setBright(self.parentMenuBtn[index], false)
    local RichText = GUI:RichText_Create(self.ui.Node_bj1, "RichText_" .. index, 30, 10, cfg.desc, 450, 16, "#EFC68C", 5, nil, "fonts/font2.ttf")
    local tips = StringFormat(cfg.tips, "")
    local RichText2 = GUI:RichText_Create(self.ui.Panel_3, "RichText1_" .. index, 30, 270, tips, 464, 16, "#39B5EF", 5, nil, "fonts/font2.ttf")
    GUI:setAnchorPoint(RichText, 0, 1)
    GUI:setAnchorPoint(RichText2, 0, 1)
    local RichText2Size = GUI:getContentSize(RichText2)
    GUI:setContentSize(self.ui.Panel_3, 480, RichText2Size.height)
    GUI:ScrollView_setInnerContainerSize(self.ui.ScrollView_1, 480, RichText2Size.height)
    GUI:setPositionY(RichText2, RichText2Size.height)
    GUI:ScrollView_scrollToPercentVertical(self.ui.ScrollView_1, 0, 0, true)
    --展示奖励
    ssrAddItemListXEX(self.ui.Panel_cost1, cfg.rewardShow, "item_", {})
    ssrAddItemListXEX(self.ui.Panel_cost2, cfg.reward, "item_", {})
    ssrMessage:sendmsg(ssrNetMsgCfg.ChaoJiJuQing_Sync1, index)
end

function ChaoJiJuQing:JQChildClick(index, cfg, widget)
    self.currSelect = false
    self.ChildCfg = cfg
    self.ChildIndex = cfg.idx
    GUI:removeAllChildren(self.ui.Node_bj1)
    GUI:removeAllChildren(self.ui.Panel_3)
    if GUI:Win_IsNotNull(self.lastSelectChildBtn) then
        GUI:Button_setBrightEx(self.lastSelectChildBtn, true)
    end
    GUI:Button_setBrightEx(widget, false)
    self.lastSelectChildBtn = widget
    local RichText = GUI:RichText_Create(self.ui.Node_bj1, "RichText_" .. index, 30, 10, cfg.desc, 450, 16, "#EFC68C", 5, nil, "fonts/font2.ttf")
    local tips = StringFormat(cfg.tips, "")
    local RichText2 = GUI:RichText_Create(self.ui.Panel_3, "RichText1_" .. index, 30, 270, tips, 464, 16, "#39B5EF", 5, nil, "fonts/font2.ttf")
    GUI:setAnchorPoint(RichText, 0, 1)
    GUI:setAnchorPoint(RichText2, 0, 1)
    local RichText2Size = GUI:getContentSize(RichText2)
    GUI:setContentSize(self.ui.Panel_3, 480, RichText2Size.height)
    --设置滚动高度
    GUI:ScrollView_setInnerContainerSize(self.ui.ScrollView_1, 480, RichText2Size.height)
    if RichText2Size.height > 117 then
        GUI:setPositionY(RichText2, RichText2Size.height)
    else
        GUI:setPositionY(RichText2, RichText2Size.height + (117 - RichText2Size.height))
    end

    --展示奖励
    if type(cfg.rewardShow) == "table" then
        ssrAddItemListXEX(self.ui.Panel_cost1, cfg.rewardShow, "item_", {})
    elseif type(cfg.rewardShow) == "string" then
        GUI:removeAllChildren(self.ui.Panel_cost1)
        local Text_2 = GUI:Text_Create(self.ui.Panel_cost1, "Text_2", 0, 30, 16, "#ffffff", cfg.rewardShow)
        GUI:setAnchorPoint(Text_2, 0, 0.5)
        GUI:setTouchEnabled(Text_2, false)
        GUI:setTag(Text_2, 0)
        GUI:Text_enableOutline(Text_2, "#000000", 1)
    end

    ssrAddItemListXEX(self.ui.Panel_cost2, cfg.reward, "item_", {})
    --请求同步消息
    ssrMessage:sendmsg(ssrNetMsgCfg.ChaoJiJuQing_Sync2, cfg.idx)
    GUI:ScrollView_scrollToPercentVertical(self.ui.ScrollView_1, 0, 0, true)
end

function ChaoJiJuQing:RefreshRichText(TType, data)
    local cfg = {}
    local index = 1
    if TType == 1 then
        cfg = self.ChildCfg
    else
        cfg = self.ParentCfg
    end
    if GUI:Win_IsNull(self.ui.Panel_3) then
        return
    end
    GUI:removeAllChildren(self.ui.Panel_3)
    local jinduTs = {}
    for i, v in ipairs(data) do
        local tmp
        if type(v) == "boolean" then
            tmp = SetCompletionStatus(v)
        elseif type(v) == "table" then
            tmp = SetCompletionProgress(v[1], v[2])
        end
        table.insert(jinduTs,tmp)
    end
    --加载文本
    if TType == 0 then
        local tips = StringFormat(cfg.tips, unpack(jinduTs))
        local RichText2 = GUI:RichText_Create(self.ui.Panel_3, "RichText1_" .. index, 30, 270, tips, 464, 16, "#39B5EF", 5, nil, "fonts/font2.ttf")
        GUI:setAnchorPoint(RichText2, 0, 1)
        local RichText2Size = GUI:getContentSize(RichText2)
        GUI:setContentSize(self.ui.Panel_3, 480, RichText2Size.height)
        GUI:ScrollView_setInnerContainerSize(self.ui.ScrollView_1, 480, RichText2Size.height)
        GUI:setPositionY(RichText2, RichText2Size.height)
    else
        local tips = StringFormat(cfg.tips, unpack(jinduTs))
        local RichText2 = GUI:RichText_Create(self.ui.Panel_3, "RichText1_" .. index, 30, 270, tips, 464, 16, "#39B5EF", 5, nil, "fonts/font2.ttf")
        GUI:setAnchorPoint(RichText2, 0, 1)
        local RichText2Size = GUI:getContentSize(RichText2)
        GUI:setContentSize(self.ui.Panel_3, 480, RichText2Size.height)
        GUI:ScrollView_setInnerContainerSize(self.ui.ScrollView_1, 480, RichText2Size.height)
        if RichText2Size.height > 117 then
            GUI:setPositionY(RichText2, RichText2Size.height)
        else
            GUI:setPositionY(RichText2, RichText2Size.height + (117 - RichText2Size.height))
        end
    end
end
--同步网络消息
function ChaoJiJuQing:Sync1(arg1,arg2,arg2,data)
    self:RefreshRichText(0,data)
    --处理红点
    delRedPoint(self.ui.Button_3)
    GUI:Button_setBrightEx(self.ui.Button_3,true)
    if arg1 == 0 and CheckTaskIsFinish(data) then
        addRedPoint(self.ui.Button_3, 25, 3)
    elseif arg1 == 1 then
        GUI:Button_setBrightEx(self.ui.Button_3,false)
    end
end
function ChaoJiJuQing:Sync2(arg1,arg2,arg2,data)
    self:RefreshRichText(1,data)
    --处理红点
    delRedPoint(self.ui.Button_3)
    GUI:Button_setBrightEx(self.ui.Button_3,true)
    if arg1 == 0 and CheckTaskIsFinish(data) then
        addRedPoint(self.ui.Button_3, 25, 3)
    elseif arg1 == 1 then
        GUI:Button_setBrightEx(self.ui.Button_3,false)
    end
end

--领取后返回 -主任务
function ChaoJiJuQing:SyncLingQu1(arg1,arg2,arg2,data)
    if arg1 == 1 then
        delRedPoint(self.ui.Button_3)
        GUI:Button_setBrightEx(self.ui.Button_3,false)
    end
end

function ChaoJiJuQing:SyncLingQu2(arg1,arg2,arg2,data)
    if arg1 == 1 then
        delRedPoint(self.ui.Button_3)
        GUI:Button_setBrightEx(self.ui.Button_3,false)
    end
end

function ChaoJiJuQing:drawMenu(clickId)
    if clickId then
        self.currParentId = clickId
    end
    local currParentId = self.currParentId
    self.parentMenuBtn = {}
    local cfg = self.cfg_JuQingCategories
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    local ChildMenuTotalHeight = 0   --子菜单总高度
    for i, v in ipairs(cfg) do
        --绘制主菜单按钮
        local Normalfilepath = string.format("%s%s", self.jqImgPath, v.btnImg1)
        local Disabledfilepath = string.format("%s%s", self.jqImgPath, v.btnImg2)
        local Button = GUI:Button_Create(self.ui.ListView_1, "Button_" .. i, 0.00, 0.00, Normalfilepath)
        GUI:Button_loadTextures(Button, Normalfilepath, Normalfilepath, Disabledfilepath, 0)
        GUI:addOnClickEvent(Button, function()
            if self.currDaLu < i then
                local numberFount = SL:NumberToChinese(i)
                sendmsg9(string.format("你还没有解锁%s大陆，无法查看！#249", numberFount))
                return
            end
            self:drawMenu(i)
            self:JQMainClick(i, v)
        end)
        table.insert(self.parentMenuBtn, Button)
        if currParentId == i then
            local childCfg = v.child
            local ChildMenuNum = #childCfg --数量
            ChildMenuTotalHeight = ChildMenuNum * 38 --总高度
            if childCfg then
                --绘制子菜单按钮
                local Panel_ChildMenu = GUI:Layout_Create(self.ui.ListView_1, "Panel_ChildMenu", 0.00, 0, 168, ChildMenuTotalHeight, false)
                for j, ChildCfg in ipairs(childCfg) do
                    local Normalfilepath = string.format("%s%s", self.jqImgPath, ChildCfg.btnImg1)
                    local Disabledfilepath = string.format("%s%s", self.jqImgPath, ChildCfg.btnImg2)
                    local ChildMenuButton = GUI:Button_Create(Panel_ChildMenu, "ButtonChild_" .. j, 1.00, ChildMenuTotalHeight - (j * 38), Normalfilepath)
                    GUI:Button_loadTextures(ChildMenuButton, Normalfilepath, Normalfilepath, Disabledfilepath, 0)
                    GUI:addOnClickEvent(ChildMenuButton, function(widget)
                        self:JQChildClick(j, ChildCfg, widget)
                    end)
                end
            end
        end
    end
end

function ChaoJiJuQing:UpdateUI()
    self:drawMenu()
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChaoJiJuQing:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ChaoJiJuQing