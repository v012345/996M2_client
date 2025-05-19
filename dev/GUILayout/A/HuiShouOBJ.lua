HuiShouOBJ = {}
HuiShouOBJ.__cname = "HuiShouOBJ"
HuiShouOBJ.categories = ssrRequireCsvCfg("cfg_HuiShouCategories")           --一级分类
HuiShouOBJ.subcategories = ssrRequireCsvCfg("cfg_HuiShouSubcategories")     --二级分类
HuiShouOBJ.config = ssrRequireCsvCfg("cfg_HuiShou")                         --回收列表
HuiShouOBJ.AutoMoneyItems = {
                            "5元宝",
                            "10元宝",
                            "20元宝",
                            "50元宝",
                            "100元宝",
                            "200元宝",
                            "500元宝",
                            "1000元宝",
                            "2000元宝",
                            "5000元宝",
                            "10000元宝",
                            "20000元宝",
                            "50000元宝",
                            "100000元宝",
                            "金币红包(小)",
                            "金币红包(中)",
                            "金币红包(大)"
                            }  --自动吃的货币
HuiShouOBJ.AutoExpItems = {
                            "10W经验卷",
                            "20W经验卷",
                            "50W经验卷",
                            "100W经验卷",
                            "200W经验卷",
                            "500W经验卷",
                            "1000W经验卷",
                            "2000W经验卷",
                            "5000W经验卷"
                            }    --自动吃的经验
HuiShouOBJ.categoriesCheckList = {}  --二级分类勾选信息
HuiShouOBJ.subcategoriesCheckList = {} --装备物品勾选信息
HuiShouOBJ.pageID = 1
HuiShouOBJ.newConfig = {}
HuiShouOBJ.items = {}
--对装备列表分类
 for _, item in ipairs(HuiShouOBJ.config) do
     HuiShouOBJ.newConfig[item.idx] = item
    local subcategory_id = item.SubcategoryID
    if not HuiShouOBJ.items[subcategory_id] then
        HuiShouOBJ.items[subcategory_id] = {}
    end
    table.insert(HuiShouOBJ.items[subcategory_id], {
        equipName = item.equipName,
        give = item.give,
        idx = item.idx
    })
end



function HuiShouOBJ:main(objcfg)
    local parent = GUI:Win_Create(HuiShouOBJ.__cname, 0, 0, 0, false, false, false, true, true)
    self._parent = parent
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2)
    -- GUI:Timeline_Window1(self.ui.ImageBG)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    --全选
    GUI:addOnClickEvent(self.ui.ButtonQuanXuan, function()
        self:CategoriesAllCheck(true)
    end)

    --取消全选
    GUI:addOnClickEvent(self.ui.ButtonQuXiaoQuanXuan, function()
        self:CategoriesAllCheck(false)
    end)

    --一键回收
    GUI:addOnClickEvent(self.ui.ButtonGoHuiShou, function()
        self:goHuiShou(1)
    end)

    --隐藏详细物品列表
    GUI:addOnClickEvent(self.ui.LayoutSubcategories, function()
        self:hideSubcategories()
    end)
    --隐藏详细物品列表
    GUI:addOnClickEvent(self.ui.ButtonBack, function()
        self:hideSubcategories()
    end)
    --列表页全选
    GUI:addOnClickEvent(self.ui.CheckBoxItemAllSelect, function()
        self:toggleAllSubCategories()
    end)

    ----自动回收勾选点击
    --GUI:addOnClickEvent(self.ui.ButtonAutoHuiShou, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_AutoHuiShou)
    --end)
    --GUI:addOnClickEvent(self.ui.CheckBox_A2, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_AutoHuiShou)
    --end)
    --
    --显示勾选
    GUI:CheckBox_setSelected(self.ui.CheckBox_A1, self.isCheck1 or false)
    GUI:CheckBox_setSelected(self.ui.CheckBox_A2, self.isCheck2 or false)
    GUI:CheckBox_setSelected(self.ui.CheckBox_A3, self.isCheck3 or false)
    GUI:CheckBox_setSelected(self.ui.CheckBox_A4, self.isCheck4 or false)
    GUI:CheckBox_setSelected(self.ui.CheckBox_A5, self.isCheck5 or false)
    --显示加成
    local huiShouAddition = SL:GetMetaValue("ATT_BY_TYPE", 216)
    GUI:Text_setString(self.ui.TextMarkup, huiShouAddition.."%")
    --初始CheckBox点击
    self:InitCheckBoxClick()
    --初始化按钮状态
    self:InitPageChangeBtn()
    --刷新按钮显示状态
    self:RefreshBtnState()
    --刷新二级分类显示
    self:RefreshSubcategoriesCell()
end
--初始化checkbox点击
function HuiShouOBJ:InitCheckBoxClick()
    --吃货币
    GUI:addOnTouchEvent(self.ui.Layout_A1, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_AutoMoney)
        end
    end)
    --吃经验
    GUI:addOnTouchEvent(self.ui.Layout_A2, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_AutoExp)
        end
    end)
    --自动回收
    GUI:addOnTouchEvent(self.ui.Layout_A3, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_AutoHuiShou)
        end
    end)
    --是否回收洗练强化
    GUI:addOnTouchEvent(self.ui.Layout_A4, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_CheckCustomAttributes)
        end
    end)
    --是否回收可提升装备
    GUI:addOnTouchEvent(self.ui.Layout_A5, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_CheckKeTiSheng)
        end
    end)
end
--刷新二级分类显示
function HuiShouOBJ:RefreshSubcategoriesCell()
    self.cells = {}
    local Subcategories = {}
    for i, v in ipairs(self.subcategories or {}) do
        if v.CategoryID == self.pageID then
            table.insert(Subcategories,{
                SubcategoryID = v.SubcategoryID,
                imagePath = string.format("res/custom/huishou/%s/%s.png",v.CategoryID,v.imagePath)
            })
        end
    end
    --创建单元数据
    GUI:removeAllChildren(self.ui.LayoutCategories)
    for i, v in ipairs(Subcategories or {}) do
        local cell = self:CreateSubcategoriesCell(self.ui.LayoutCategories, v)
        table.insert(self.cells,cell)
    end
    --排列分类
    GUI:UserUILayout(self.ui.LayoutCategories, {
        dir = 3,
        addDir = 1,
        autosize = 1,
        gap = { x = 4, y = 0, l = 0 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end,
        rownums = {2}
    })
end
--创建二级分类cell
function HuiShouOBJ:CreateSubcategoriesCell(parent,config)
    local widget = GUI:Widget_Create(parent, "SubcategoriesCell_"..config.SubcategoryID, 0, 0, 252, 54)
    GUI:setTag(widget, config.SubcategoryID)
    GUI:LoadExport(widget, "A/HuiShou_subcategories_cell")
    local ui = GUI:ui_delegate(widget)
    GUI:setTag(ui.CheckBox_select, config.SubcategoryID)
    GUI:CheckBox_addOnEvent(ui.CheckBox_select, function(widget, checkState)
        local key = GUI:getTag(widget)
        if checkState == 0 then self.categoriesCheckList[key] = 1 else self.categoriesCheckList[key] = nil end
        self:sendCheckInfo()
    end)

    --点击显示详细列表
    GUI:addOnTouchEvent(ui.Layout_show_item_list, function(widget, clickType)
        if clickType == 0 then
            GUI:setScale(widget, 0.98)
        elseif clickType == 2 or clickType == 3 then
            GUI:setScale(widget, 1.0)
            --self:showEquipList(value.data.suitId)
            --显示物品面板
            self:ShowItemPanel(config.SubcategoryID)
        end
    end)

    --设置勾选信息
    if self.categoriesCheckList[config.SubcategoryID] then GUI:CheckBox_setSelected(ui.CheckBox_select, true) else  GUI:CheckBox_setSelected(ui.CheckBox_select, false) end
	GUI:Image_Create(ui.Layout_show_item_list, "ImageView_show_item_list_"..config.SubcategoryID, 5.00, 5.00, config.imagePath)
    return ui
end
--显示面板
function HuiShouOBJ:ShowItemPanel(index, searchStr)
    self.SubCategoriesCheckBoxWidgets = {}
    GUI:setVisible(self.ui.LayoutSubcategories,true)
    GUI:removeAllChildren(self.ui.ListViewSubcategories) --清空列表显示
    local items = self:findItemList(index,searchStr)
    if #items == 0 then
        SL:ShowSystemTips("没有找到")
        return
    end

    --搜索物品
    GUI:addOnClickEvent(self.ui.ButtonSearch, function()
        local searchText = GUI:TextInput_getString(self.ui.InputSearch)
        self:ShowItemPanel(index,searchText)
    end)

    for i, v in ipairs(items) do
        local LayoutShowList = GUI:Layout_Create(self.ui.ListViewSubcategories, "LayoutShowList"..i, 0.00, 234.00, 240.00, 34.00, false)
        GUI:setTouchEnabled(LayoutShowList, false)
        local CheckBoxItem = GUI:CheckBox_Create(LayoutShowList, "CheckBoxItem"..i, 11.00, 0.00, "res/custom/huishou/checkBox3.png", "res/custom/huishou/checkBox4.png")
        GUI:CheckBox_setSelected(CheckBoxItem, true)
        GUI:setTouchEnabled(CheckBoxItem, true)
        GUI:setTag(CheckBoxItem, v.idx)
        table.insert(self.SubCategoriesCheckBoxWidgets,CheckBoxItem)
        GUI:CheckBox_addOnEvent(CheckBoxItem, function(widget, state)
            if state == 0 then
                self.subcategoriesCheckList[v.idx] = nil
            else
                self.subcategoriesCheckList[v.idx] = 1
            end
            self:sendCheckInfo()
            self:setCategoriesAllSelected()
        end)

        if self.subcategoriesCheckList[v.idx] then
            GUI:CheckBox_setSelected(CheckBoxItem, false)
        end
        local ImageViewShowListBg = GUI:Image_Create(LayoutShowList, "ImageViewShowListBg"..i, 47.00, 1.00, "res/custom/huishou/item_list_bg.png")
        local TextItemName = GUI:Text_Create(ImageViewShowListBg, "TextItemName"..i, 78.00, 4.00, 17, "#ffffff", v.equipName)
        GUI:setAnchorPoint(TextItemName, 0.50, 0.00)
        GUI:setTouchEnabled(TextItemName, false)
        GUI:Text_enableOutline(TextItemName, "#000000", 1)
    end
    self:setCategoriesAllSelected()
end

--初始化按钮
function HuiShouOBJ:InitPageChangeBtn()
    local btnList = self.ui.NodeLeft
    for i, v in ipairs(self.categories) do
        local pageID = v.CategoryID
        local btnName = "Button_left_" .. pageID
        local panelBtn = GUI:getChildByName(btnList, btnName)
        if panelBtn then
            GUI:addOnClickEvent(panelBtn, function()
                self.pageID = pageID
                self:RefreshSubcategoriesCell()
                self:RefreshBtnState()
            end)
        end
    end
end

--刷新按钮显示状态
function HuiShouOBJ:RefreshBtnState()
    local btnList = self.ui.NodeLeft
    local childs = GUI:getChildren(btnList)
    for _, child in ipairs(childs) do
        local isSelected = GUI:getName(child) == ("Button_left_" .. self.pageID)
        GUI:Button_setBrightEx(child, not isSelected)
    end
end
--隐藏详细物品列表
function HuiShouOBJ:hideSubcategories()
    GUI:setVisible(self.ui.LayoutSubcategories,false)
end

--二级分类全选
---* isAllCheck true 全选 false 全不选
function HuiShouOBJ:CategoriesAllCheck(isAllCheck)
    for i, v in ipairs(self.cells) do
        GUI:CheckBox_setSelected(v.CheckBox_select, isAllCheck)
        local tag = GUI:getTag(v.CheckBox_select)
        if isAllCheck then
            self.categoriesCheckList[tag] = 1
        else
            self.categoriesCheckList[tag] = nil
        end
    end
    --发送勾选信息
    self:sendCheckInfo()
end

--判断是否全选
function HuiShouOBJ:isSelectAll()
    local allChecked = true
    for _, widget in ipairs(self.checkBoxList or {}) do
        if not GUI:CheckBox_isSelected(widget) then
            allChecked = false
            break
        end
    end
    return allChecked
end

--详细列表是否全选
function HuiShouOBJ:IsSubCategoriesAllSelected()
    local allChecked = true
    for _, widget in ipairs(self.SubCategoriesCheckBoxWidgets or {}) do
        if not GUI:CheckBox_isSelected(widget) then
            allChecked = false
            break
        end
    end
    return allChecked
end

--设置详细列表全选，全不选状态
function HuiShouOBJ:setCategoriesAllSelected()
    local isAll = self:IsSubCategoriesAllSelected()
    GUI:CheckBox_setSelected(self.ui.CheckBoxItemAllSelect, isAll)
end

--详细列表全选取消全选
function HuiShouOBJ:toggleAllSubCategories()
    local isAllCheck = self:IsSubCategoriesAllSelected()

    if isAllCheck then
        for _, widget in ipairs(self.SubCategoriesCheckBoxWidgets or {}) do
            local key = GUI:getTag(widget)
            self.subcategoriesCheckList[key] = 1
            GUI:CheckBox_setSelected(widget, false)
        end
    else
        for _, widget in ipairs(self.SubCategoriesCheckBoxWidgets or {}) do
            local key = GUI:getTag(widget)
            self.subcategoriesCheckList[key] = nil
            GUI:CheckBox_setSelected(widget, true)
        end
    end
    self:sendCheckInfo()
end

--执行回收MakeId方式 way = 1是手动回收的
function HuiShouOBJ:goHuiShou(way)
    local bagDatas = SL:GetMetaValue("BAG_DATA")
    local selectList = {}
    for _, value in pairs(bagDatas) do
        local index = value.Index
        local cfg = self.newConfig[index]
        if cfg then
            local isCustomAttr = self:isCustomAttr(value)
            local isKeHuiShou = self:isKeTiSheng(value)
            if self.categoriesCheckList[cfg.SubcategoryID] and not self.subcategoriesCheckList[cfg.idx] and not isCustomAttr and not isKeHuiShou then
                table.insert(selectList, value.MakeIndex)
            end
            --if way == 1 then
            --    if self.categoriesCheckList[cfg.SubcategoryID] and not self.subcategoriesCheckList[cfg.idx] and not isCustomAttr then
            --        table.insert(selectList, value.MakeIndex)
            --    end
            --else
            --    local isUp = GUIFunction:CompareEquipOnBody(value, 1)
            --    if self.categoriesCheckList[cfg.SubcategoryID] and not self.subcategoriesCheckList[cfg.idx] and not isCustomAttr then
            --        table.insert(selectList, value.MakeIndex)
            --    end
            --end
        end
    end
    if #selectList > 0 then
        ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_Request, nil, nil, nil, selectList)
    elseif way == 1 and #selectList == 0 then
        SL:ShowSystemTips("没有可以回收的装备!")
    end
end

--执行回收ID方式
--function HuiShouOBJ:goHuiShou(type)
--    local bagDatas = SL:GetMetaValue("BAG_DATA")
--    local selectList = {}
--    local hasIdx = {}
--    for _, value in pairs(bagDatas) do
--        local index = value.Index
--        local cfg = self.newConfig[index]
--        -- local isUp = GUIFunction:CompareEquipOnBody(value, 1)
--        if cfg then
--            local isCustomAttr = self:isCustomAttr(value)
--            if self.categoriesCheckList[cfg.SubcategoryID] and not self.subcategoriesCheckList[cfg.idx] and not hasIdx[index] and not isCustomAttr then
--                hasIdx[index] = true
--                table.insert(selectList, index)
--            end
--        end
--    end
--    if #selectList > 0 then
--        ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_Request, nil, nil, nil, selectList)
--    elseif type == 1 and #selectList == 0 then
--        SL:ShowSystemTips("没有可以回收的装备!")
--    end
--end

function HuiShouOBJ:autoUseItem()
    if self.isCheck1 == false and self.isCheck2 == false then
        return
    end
    local items = {}
    if self.isCheck1 then
        for i, v in ipairs(self.AutoMoneyItems) do
            table.insert(items, v)
        end
    end
    if self.isCheck2 then
        for i, v in ipairs(self.AutoExpItems) do
            table.insert(items, v)
        end
    end
    local itemList = {}
    for i, itemName in ipairs(items) do
            local itemNum = SL:GetMetaValue("ITEM_COUNT", itemName)
            if itemNum > 0 then
                local itemIdx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", itemName)
                table.insert(itemList,itemIdx)
            end
    end
    if #itemList > 0 then
        ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_UseItem, 0, 0, 0, itemList)
    end
end


--查找详细列表
function HuiShouOBJ:findItemList(index, searchStr)
    local results = self.items[index]
    if not results then
        return { }
    end
    if searchStr then
        results = {}
        for _, value in ipairs(self.items[index]) do
            if string.find(value.equipName, searchStr) then
                table.insert(results, value)
            end
        end
    end
    return results
end

--自动执行函数
function HuiShouOBJ:autoRun()
    --SL:ShowSystemTips("回收定时器执行！")
    self:autoUseItem()
    --if self.isCheck1 then
    --    self:autoUseItem(self.AutoMoneyItems)
    --end
    --
    --if self.isCheck2 then
    --    self:autoUseItem(self.AutoExpItems)
    --end
    if self.isCheck3 then
        --剩余背包格子30才回收
        local bagRemainCount = SL:GetMetaValue("BAG_REMAIN_COUNT")
        if bagRemainCount < 36 then
            --SL:Print(bagRemainCount)
            self:goHuiShou()
        end
    end
end

--判断是否有自定义属性
function HuiShouOBJ:isCustomAttr(itemData)
    if not self.isCheck4 then
        return false
    end
    if not itemData["ExAbil"] then
        return false
    end
    if not itemData["ExAbil"]["abil"] then
        return false
    end

    local customAttr = itemData["ExAbil"]["abil"]
    for i, v in ipairs(customAttr) do
        local  customAttrNum = #v["v"]
        if  customAttrNum > 0 then
            return true
        end
    end
    return false
end

--判断是否有自定义属性
function HuiShouOBJ:isKeTiSheng(itemData)
    if not self.isCheck5 then
        return false
    end
    local isUp = GUIFunction:CompareEquipOnBody(itemData, 1)
    return isUp
end

-------------------------------↓↓↓ 网络 消息 ↓↓↓---------------------------------------

--发送勾选网络信息
function HuiShouOBJ:sendCheckInfo()
    local categoriesCheckList = sparse_encode(self.categoriesCheckList)
    local subcategoriesCheckList = sparse_encode(self.subcategoriesCheckList)
    local request = {
        suit = categoriesCheckList,
        equip = subcategoriesCheckList
    }
    ssrMessage:sendmsg(ssrNetMsgCfg.HuiShou_RequestCheck, 0, 0, 0, request)
end

---同步网络消息
function HuiShouOBJ:SyncResponse(arg1, arg2, arg3, data)
    if data.suit then
        self.categoriesCheckList = sparse_decode(data.suit)
    else
        self.categoriesCheckList = {}
    end

    if data.equip then
        self.subcategoriesCheckList = sparse_decode(data.equip)
    else
        self.subcategoriesCheckList = {}
    end
    self.markup = data.markup
    self.isCheck1 = arg1 == 1 and true or false
    self.isCheck2 = arg2 == 1 and true or false
    self.isCheck3 = arg3 == 1 and true or false
    self.isCheck4 = data.flag4 == 1 and true or false
    self.isCheck5 = data.flag5 == 1 and true or false

    --初始化的时候开启一个定时器
    if global.HuiShouTimerHandle then
        SL:UnSchedule(global.HuiShouTimerHandle)
    end
    global.HuiShouTimerHandle = SL:Schedule(function()
        self:autoRun()
    end , 5)
end

--自动回收勾选
function HuiShouOBJ:AutoHuiShou(arg1)
    self.isCheck3 = arg1 == 1 and true or false
    GUI:CheckBox_setSelected(self.ui.CheckBox_A3, self.isCheck3)
end


--自动吃经验
function HuiShouOBJ:AutoExp(arg1)
    self.isCheck2 = arg1 == 1 and true or false
    GUI:CheckBox_setSelected(self.ui.CheckBox_A2, self.isCheck2)
end


--自动吃货币
function HuiShouOBJ:AutoMoney(arg1)
    self.isCheck1 = arg1 == 1 and true or false
    GUI:CheckBox_setSelected(self.ui.CheckBox_A1, self.isCheck1)
end

--回收鉴定强化
function HuiShouOBJ:CheckCustomAttributes(arg1)
    self.isCheck4 = arg1 == 1 and true or false
    GUI:CheckBox_setSelected(self.ui.CheckBox_A4, self.isCheck4)
end
--是否回收可提升装备
function HuiShouOBJ:CheckKeTiSheng(arg1)
    self.isCheck5 = arg1 == 1 and true or false
    GUI:CheckBox_setSelected(self.ui.CheckBox_A5, self.isCheck5)
end

--背包满了执行一次回收
function HuiShouOBJ:MaxBagGoHuiShou()
    self:autoRun()
end
--
--SL:RegisterLUAEvent(LUA_EVENT_BAG_ITEM_CHANGE, "HuiShou", function(t)
--    if t.opera == 1 then
--        if SL:GetMetaValue("BAG_REMAIN_COUNT") < 10 then
--            SL:dump("执行回收？？？？")
--            HuiShouOBJ:autoRun()
--        end
--    end
--end)

return HuiShouOBJ