TeShuHeChengOBJ = {}
TeShuHeChengOBJ.__cname = "TeShuHeChengOBJ"
--TeShuHeChengOBJ.config = ssrRequireCsvCfg("cfg_TeShuHeCheng")
TeShuHeChengOBJ.config = {
    {pos = 13, config = ssrRequireCsvCfg("cfg_TeShu_DouLi"), name="破魔斗笠"},
    {pos = 2, config = ssrRequireCsvCfg("cfg_TeShu_GuangHuan"), name="恢复光环"},
    {pos = 9, config = ssrRequireCsvCfg("cfg_TeShu_LongZhiXin"), name="龙·之心"},
    {pos = 15, config = ssrRequireCsvCfg("cfg_TeShu_ShenShouHu"), name="神·守护"},
    {pos = 16, config = ssrRequireCsvCfg("cfg_TeShu_DunPai"), name="圣灵壁垒"}
}
TeShuHeChengOBJ.QiPaoOpen = nil
TeShuHeChengOBJ.eventName = "特殊合成"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TeShuHeChengOBJ:main(objcfg, arg1)
    self.QiPaoOpen = tonumber(arg1)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-20,-20)
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

    --如果通过气泡打开
    if self.QiPaoOpen then
        self.pageID = self.QiPaoOpen
        self.QiPaoOpen = nil
    else
        self.pageID = 1
    end
    --请求合成
    self.clickLock = false
    GUI:addOnClickEvent(self.ui.ButtonGo, function()
        if self.clickLock then
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.TeShuHeCheng_Request,self.pageID,self.childPageID)
        --防止快速点击
        self.clickLock = true
        if self.clickLock then
            SL:scheduleOnce(self.ui.NodeRight, function()
                self.clickLock = false
            end, 0.3)
        end
    end )
    self.cfg = self.config[self.pageID]
    local defaultPos = self.cfg.pos
    self.childPageID = Player:getEquipFieldByPos(defaultPos, 1) or 0
    self.isExecuting = false
    self:RefreshBtnState()
    --初始化左侧按钮功能
    self:InitPageChangeBtn()
    --创建子菜单按钮
    self:CreateChildBtnState()
    --注册事件
    self:RegisterEvent()
end


--刷新按钮状态
function TeShuHeChengOBJ:RefreshBtnState()
    local btnList = self.ui.LeftBtnList
    local childs = GUI:getChildren(btnList)
    for _, child in ipairs(childs) do
        local isSelected = GUI:getName(child) == ("Left_btn_" .. self.pageID)
        GUI:Button_setBrightEx(child, not isSelected)
    end
    --红点
    self:AddRedPoint()
end

--初始化左侧按钮功能
function TeShuHeChengOBJ:InitPageChangeBtn()
    local btnList = self.ui.LeftBtnList
    for i = 1, 5 do
        local btnName = "Left_btn_" .. i
        local panelBtn = GUI:getChildByName(btnList, btnName)
        if panelBtn then
            GUI:addOnClickEvent(panelBtn, function()
                self.pageID = i
                self.cfg = self.config[self.pageID]
                local defaultPos = self.cfg.pos
                self.childPageID = Player:getEquipFieldByPos(defaultPos, 1) or 0
                self:RefreshBtnState()
                self:CreateChildBtnState()
            end)
        end
    end
end

--创建子菜单按钮
function TeShuHeChengOBJ:CreateChildBtnState()
    GUI:removeAllChildren(self.ui.Left_Btn_Child)
    for i = 1, 10 do
        local Left_btn_Child_1 = GUI:Button_Create(self.ui.Left_Btn_Child, "Left_btn_Child_"..i, 1.00, 399.00-((i - 1) * 45), "res/custom/teshuhecheng/"..self.pageID.."/btn"..i..".png")
        local showChildPageID = tonumber(self:GetSelectID())
        if showChildPageID == i then
            GUI:Image_Create(Left_btn_Child_1, "selected_img", 0, 0, "res/custom/teshuhecheng/selected.png")
        end
        GUI:setTouchEnabled(Left_btn_Child_1, true)
        GUI:setTag(Left_btn_Child_1, i)
        GUI:addOnClickEvent(Left_btn_Child_1, function(widget)
            self.childPageID = i
            local selected_img = GUI:getChildByName(widget, "selected_img")
            if not selected_img then
               self:RefreshChildBtnState()
                self:RefreshCost(self.pageID, self.childPageID)
            end
        end)
    end
    self:RefreshCost(self.pageID, self.childPageID)
end

function TeShuHeChengOBJ:RefreshChildBtnState()
    local btnList = self.ui.Left_Btn_Child
    local childs = GUI:getChildren(btnList)
    local showChildPageID = self:GetSelectID()
    for _, child in ipairs(childs) do
        local isSelected = GUI:getName(child) == ("Left_btn_Child_" .. showChildPageID)
        if isSelected then
            GUI:Image_Create(child, "selected_img", 0, 0, "res/custom/teshuhecheng/selected.png")
        else
            GUI:removeChildByName(child, "selected_img")
        end
    end
end

--刷新当前消耗
function TeShuHeChengOBJ:RefreshCost(pageID, childPageID)
    childPageID = tonumber(childPageID)
    local _cfg = self.config[pageID]
    local defaultPos = _cfg.pos
    if not Player:getEquipFieldByPos(defaultPos, 1) and childPageID == 1 then
        childPageID = 0
    end
    if childPageID > 10 then
        childPageID = 10
    end
    local config = _cfg.config[childPageID]
    local equipNum = 1
    if config.equip == "未穿戴" then
        equipNum = 0
    end
    local showCostList = {{config.equip,equipNum,defaultPos}}
    for i, v in ipairs(config.cost) do
        table.insert(showCostList,v)
    end
    showCost(self.ui.CostList, showCostList,90)
    delRedPoint(self.ui.ButtonGo)
    Player:checkAddRedPoint(self.ui.ButtonGo, showCostList)
    local btnId = childPageID
    if childPageID == 0 then
        btnId = 1
    end
    local childBtnWidget = GUI:getChildByName(self.ui.Left_Btn_Child, "Left_btn_Child_" .. btnId)
    if childBtnWidget then
        delRedPoint(childBtnWidget)
        Player:checkAddRedPoint(childBtnWidget, showCostList)
    end
    ssrAddItemListX(self.ui.GiveShow, {{config.give,1}},"giveItem")
end

--获取当前选中的ID
function TeShuHeChengOBJ:GetSelectID()
    local showChildPageID = 1
    if self.childPageID == 0 then
        showChildPageID = 1
    else
        showChildPageID = self.childPageID
    end
    return showChildPageID
end

--添加红点
function TeShuHeChengOBJ:AddRedPoint()
    --遍历条件
    for i, v in ipairs(self.config) do
        local leftWidgetBtn = GUI:getChildByName(self.ui.LeftBtnList, "Left_btn_" .. i)
        local pos = v.pos
        local field = Player:getEquipFieldByPos(pos, 1) or 0
        field = tonumber(field) or 0
        if field > 10 then
            field = 10
        end
        local config = v.config[field]
        if not config then
            break
        end
        local equipNum = 1
        if config.equip == "未穿戴" then
            equipNum = 0
        end
        local showCostList = {{config.equip,equipNum,pos}}
        for i, v in ipairs(config.cost) do
            table.insert(showCostList,v)
        end

        if leftWidgetBtn then
            delRedPoint(leftWidgetBtn)
            Player:checkAddRedPoint(leftWidgetBtn, showCostList)
        end
    end
end

function TeShuHeChengOBJ:UpdateUI()
    self.cfg = self.config[self.pageID]
    local defaultPos = self.cfg.pos
    self.childPageID = Player:getEquipFieldByPos(defaultPos, 1) or 0
    self:CreateChildBtnState()
    self:AddRedPoint()
end

--刷新UI
function TeShuHeChengOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.NodeRight, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.05)
    end
end

--关闭窗口
function TeShuHeChengOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end


--------------------------- 注册事件 -----------------------------
function TeShuHeChengOBJ:RegisterEvent()
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --穿装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName, function(t)
        if t.pos == self.config[self.pageID] then
            self:refreshUI()
        end
    end)
    --脱装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName, function(t)
        if t.pos == self.config[self.pageID] then
            self:refreshUI()
        end
    end)
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
            self:refreshUI()
    end)
end

function TeShuHeChengOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TeShuHeChengOBJ:SyncResponse(arg1, arg2, arg3, data)
    --if GUI:GetWindow(nil, self.__cname) then
    --    self:UpdateUI()
    --end
end
return TeShuHeChengOBJ