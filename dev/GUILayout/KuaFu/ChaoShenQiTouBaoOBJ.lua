ChaoShenQiTouBaoOBJ = {}
ChaoShenQiTouBaoOBJ.__cname = "ChaoShenQiTouBaoOBJ"
ChaoShenQiTouBaoOBJ.config = ssrRequireCsvCfg("cfg_ChaoShenQiTouBao")
ChaoShenQiTouBaoOBJ.cost = { {} }
ChaoShenQiTouBaoOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChaoShenQiTouBaoOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    self.requestData = nil
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        if self.requestData then
            ssrMessage:sendmsg(ssrNetMsgCfg.ChaoShenQiTouBao_Request, 0, 0, 0, self.requestData or {})
        else
            sendmsg9("你没有选择装备！#249")
        end
    end)
    GUI:Button_setBrightEx(self.ui.Button_2, false)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        self.class = 1
        self:UpdateUI()
        GUI:Button_setBrightEx(self.ui.Button_2, false)
        GUI:Button_setBrightEx(self.ui.Button_3, true)
        self.requestData = nil
        GUI:removeAllChildren(self.ui.Image_2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        self.class = 2
        self:UpdateUI()
        GUI:Button_setBrightEx(self.ui.Button_2, true)
        GUI:Button_setBrightEx(self.ui.Button_3, false)
        self.requestData = nil
        GUI:removeAllChildren(self.ui.Image_2)
    end)
    GUI:addOnClickEvent(self.ui.ButtonHelp, function(widget)
        local str = [[
                <font size='16' color='#c0c0c0'>可以投保的超神器:</font>
                <font size='16' color='#f7e700'>一缕神念</font>
                <font size='16' color='#f7e700'>暮潮</font>
                <font size='16' color='#f7e700'>金色黎明的圣物箱</font>
                <font size='16' color='#f7e700'>永恒凛冬</font>
                <font size='16' color='#f7e700'>降星者</font>
                <font size='16' color='#f7e700'>孤影流觞</font>
                <font size='16' color='#f7e700'>卐卐正道鏡卐卐</font>
                <font size='16' color='#f7e700'>卐卐提魂锁卐卐</font>
                <font size='16' color='#f7e700'>△△雷道天卷△△</font>
                <font size='16' color='#f7e700'>△△玄天令△△</font>
                <font size='16' color='#f7e700'>▲▲火雲真經▲▲</font>
                <font size='16' color='#f7e700'>▲▲水鏡太極▲▲</font>
                <font size='16' color='#f7e700'>‖「谣影神靴」‖</font>
                <font size='16' color='#f7e700'>‖「太清流珠」‖</font>
                <font size='16' color='#ff0000'>投保之后只有穿戴在身上才可以防止掉落，切勿放背包。</font>
                ]]
        local thisWorldPosition = GUI:getWorldPosition(widget)
        local data = {width = 800, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
    self.class = 1
    self:UpdateUI()
end
--获取超神器数据 参数1 是身上
--参数2是背包
function ChaoShenQiTouBaoOBJ:GetItems(class)
    local result = {}
    local data = {}
    if class == 1 then
        data = SL:GetMetaValue("ALL_EQUIP_DATAS")
    else
        data = SL:GetMetaValue("BAG_DATA")
    end
    for i, v in pairs(data) do
        if self.config[v.Index] then
            local tmp = {
                index = v.Index,
                makeid = v.MakeIndex,
                where = v.Where or -1
            }
            table.insert(result, tmp)
        end
    end
    table.sort(result, function(a, b)
        return a.index < b.index
    end)
    return result
end

function ChaoShenQiTouBaoOBJ:ShowItems(parent, itemData)
    GUI:ListView_removeAllItems(parent)
    local rows = math.ceil(#itemData / 5)
    local panelHeight = rows * (68 + 6)
    self.Panel_1 = GUI:Layout_Create(parent, "Panel_1", 0.00, 0.00, 364, panelHeight, false)
    local Panel_1 = self.Panel_1
    for i, v in ipairs(itemData) do
        local widget = GUI:Image_Create(Panel_1, "Image" .. i, 0, 0, "res/custom/ChaoShenQiTouBao/itembg.png")
        GUI:setTouchEnabled(widget, true)
        local equipData = {}
        if v.where == -1 then
            equipData = SL:GetMetaValue("ITEM_DATA_BY_MAKEINDEX", v.makeid, false)
        else
            equipData = SL:GetMetaValue("EQUIP_DATA_BY_MAKEINDEX", v.makeid, false)
        end
        GUI:setTag(widget, i)
        GUI:Win_SetParam(widget, v)
        local ImageSize = GUI:getContentSize(widget)
        local setData = {}
        setData.index = v.index
        setData.count = 1
        setData.look = true
        setData.bgVisible = nil
        setData.itemData = equipData
        local item = GUI:ItemShow_Create(widget, "Item" .. i, ImageSize.width / 2, ImageSize.height / 2, setData)
        GUI:setAnchorPoint(item, 0.50, 0.50)
        GUI:ItemShow_setItemTouchSwallow(item, true)
        --设置点击事件
        GUI:addOnClickEvent(widget, function()
            GUI:removeAllChildren(self.ui.Image_2)
            local item1 = GUI:ItemShow_Create(self.ui.Image_2, "ItemShow", ImageSize.width / 2, ImageSize.height / 2, setData)
            GUI:setAnchorPoint(item1, 0.50, 0.50)
            self.requestData = GUI:Win_GetParam(widget)
            self.currSelectIndex = i
            self:SetSelectedState(Panel_1, widget)
            self:setTouBaoShow(equipData)
        end)
        GUI:ItemShow_addReplaceClickEvent(item, function()
            GUI:removeAllChildren(self.ui.Image_2)
            local item1 = GUI:ItemShow_Create(self.ui.Image_2, "ItemShow", ImageSize.width / 2, ImageSize.height / 2, setData)
            GUI:setAnchorPoint(item1, 0.50, 0.50)
            self.requestData = GUI:Win_GetParam(widget)
            self.currSelectIndex = i
            self:SetSelectedState(Panel_1, widget)
            self:setTouBaoShow(equipData)
        end)
    end
    GUI:UserUILayout(Panel_1, {
        dir = 3,
        interval = 0,
        gap = { x = 6, y = 6 },
        rownums = { 5 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end
    })
end

function ChaoShenQiTouBaoOBJ:setTouBaoShow(equipData)
    local num = equipData.touBaoTimes or 0
    GUI:Text_setString(self.ui.Text_1,string.format("%s/3",num))
end

--页面被刷新以后设置选中和新装备数据
function ChaoShenQiTouBaoOBJ:RefreshSetSelectedState()
    local panels = GUI:getChildren(self.Panel_1)
    local itemObj = panels[self.currSelectIndex]
    if itemObj then
        self:SetSelectedState(self.Panel_1, itemObj)
    end
    local v = GUI:Win_GetParam(itemObj)
    local equipData
    if v.where == -1 then
        equipData = SL:GetMetaValue("ITEM_DATA_BY_MAKEINDEX", v.makeid, false)
    else
        equipData = SL:GetMetaValue("EQUIP_DATA_BY_MAKEINDEX", v.makeid, false)
    end
    GUI:removeAllChildren(self.ui.Image_2)
    local setData = {}
    setData.index = v.index
    setData.count = 1
    setData.look = true
    setData.bgVisible = nil
    setData.itemData = equipData
    local ImageSize = GUI:getContentSize(self.ui.Image_2)
    local item1 = GUI:ItemShow_Create(self.ui.Image_2, "ItemShow" , ImageSize.width / 2, ImageSize.height / 2, setData)
    GUI:setAnchorPoint(item1, 0.50, 0.50)
    self:setTouBaoShow(equipData)
end

--设置按钮的选中状态
function ChaoShenQiTouBaoOBJ:SetSelectedState(parent, currWidget)
    local widgets = GUI:getChildren(parent)
    for i, v in ipairs(widgets) do
        if GUI:getChildByName(v, "selected") then
            GUI:removeChildByName(v, "selected")
        end
    end
    GUI:Image_Create(currWidget, "selected", 0.00, 0.00, "res/custom/ChaoShenQiTouBao/selected.png")
end

function ChaoShenQiTouBaoOBJ:UpdateUI(agr)
    self:ShowItems(self.ui.ListView_1, self:GetItems(self.class))
    if agr then
        self:RefreshSetSelectedState()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChaoShenQiTouBaoOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI(true)
    end
end
return ChaoShenQiTouBaoOBJ