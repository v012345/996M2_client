EquipMake4OBJ = {}

EquipMake4OBJ.__cname = "EquipMake4OBJ"

EquipMake4OBJ.tab = {}
EquipMake4OBJ.where = 9
EquipMake4OBJ.itemGap = {0,76,48,20}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function EquipMake4OBJ:main(objcfg,data,parent_ui)
    self.ui = parent_ui
    --将子页面加载进父页面nd_module容器中
    GUI:LoadExport(self.ui.nd_module, objcfg.UI_PATH)
    self.objcfg = objcfg
    --居中
    local position = GUI:getPosition(self.ui.nd_root)
    GUI:setPosition(self.ui.Layer,-position.x, -position.y)
    --手机电脑物品显示位置
    if ssrConstCfg.client_type == 1 then
        self.itemPosition = {x=15,y=15}
    else
        self.itemPosition = {x=0,y=0}
    end
    --更新界面
    self:UpdateUI()
    GUI:addOnClickEvent(self.ui.ButtonGo,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.EquipMake4_Request)
    end)
    --注册消息
    self:registerMsg()
end

function EquipMake4OBJ:UpdateUI()
    --获取配置
    local hufu_cfg = ssrRequireCsvCfg("cfg_hufu")
    local equipInfo = SL:GetMetaValue("EQUIP_DATA", self.where)
    local equipIndex = equipInfo == nil and "null" or equipInfo["Index"]
    local heChengInfo = hufu_cfg[equipIndex]
    local xiaoHaoNum = #heChengInfo["consume"]
    --如果不是空，就多给一个位置
    if equipIndex ~= "null" then
        xiaoHaoNum = xiaoHaoNum + 1
    end
    --清除子控件
    GUI:removeAllChildren(self.ui.LayoutList)
    GUI:setAnchorPoint(self.ui.LayoutList, 0.50, 0.50)
    --如果控件位置不等于空则显示当前位置装备
    if equipIndex ~= "null" then
        local ImageView_1 = GUI:Image_Create(self.ui.LayoutList, "ImageView1", 10.00, 9.00, "res/public/1900000651.png")
        local Item1 = GUI:ItemShow_Create(ImageView_1, "Item1", self.itemPosition.x, self.itemPosition.y, {index = tonumber(equipIndex), count = 1, look = true, bgVisible = nil})
        local Text_count = GUI:Text_Create(ImageView_1, "Text_count1", 34, 4, 15, "#00FF00", "1/1")
        GUI:setAnchorPoint(Text_count,0.5,0.5)
        GUI:ItemShow_setItemTouchSwallow(Item1, true)
        GUI:Win_SetParam(ImageView_1, 1)
    end
    if GUI:Win_IsNotNull(self.ImageViewLien) then
       GUI:removeFromParent(self.ImageViewLien)
    end
	self.ImageViewLien = GUI:Image_Create(self.ui.Node_main, "ImageViewLien", 450.00, 257.00, "res/custom/EquipMake/connect_line"..xiaoHaoNum..".png")
	GUI:setAnchorPoint(self.ImageViewLien, 0.50, 0.50)
    GUI:setLocalZOrder(self.ImageViewLien,1)
    GUI:setLocalZOrder(self.ui.LayoutList,5)
    GUI:setLocalZOrder(self.ui.ImageView_3,10)
    local consumeItem
    for i = 1, #heChengInfo["consume"] do
        consumeItem = heChengInfo["consume"][i]
        local itemIdx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", consumeItem[1])
        local ImageView = GUI:Image_Create(self.ui.LayoutList, "ImageView_"..i, 10.00, 9.00, "res/public/1900000651.png")
        local Item = GUI:ItemShow_Create(ImageView, "Item_"..i, self.itemPosition.x, self.itemPosition.y, {index = tonumber(itemIdx), count = 1, look = true, bgVisible = nil})
        self:ShowMoney(ImageView, i, consumeItem)
        GUI:ItemShow_setItemTouchSwallow(Item, true)
        GUI:Win_SetParam(ImageView, i+1)
    end
    GUI:ItemShow_updateItem(self.ui.Item3, {index = heChengInfo["upleve"], count = 1, look = true, bgVisible = nil})
    GUI:setPosition(self.ui.Item3,self.itemPosition.x, self.itemPosition.y)
    GUI:Text_setString(self.ui.TextDesc,heChengInfo["desc"])
    --GUI:Win_SetParam(self.ui.ImageView_2, 1)
    local itemGap = EquipMake4OBJ.itemGap[xiaoHaoNum] or 5
    --自适应布局
    GUI:UserUILayout(self.ui.LayoutList, {
        dir=2,
        autosize=1,
        gap = {x=itemGap},
        sortfunc = function (lists)
            table.sort(lists, function (a, b)
                return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
            end)
        end
    })
end

------注册事消息
function EquipMake4OBJ:registerMsg()
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, "特殊合成关闭界面", function(widgetName)
        if widgetName == "HeChengFrameObj" then
            SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, "特殊合成关闭界面")
            SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, "特殊合成穿装备")
            SL:UnRegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, "特殊合成脱装备")
            SL:UnRegisterLUAEvent(LUA_EVENT_MONEYCHANGE, "特殊合成货币改变")
        end
    end)

    --穿装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_ON_EQUIP, "特殊合成穿装备", function(t)
        if t.pos == self.where then
            self:Refresh()
        end
    end)
    --脱装备
    SL:RegisterLUAEvent(LUA_EVENT_TAKE_OFF_EQUIP, "特殊合成脱装备", function(t)
        if t.pos == self.where then
            self:Refresh()
        end
    end)
    --货币改变
    SL:RegisterLUAEvent(LUA_EVENT_MONEYCHANGE, "特殊合成货币改变", function(t)
            self:Refresh()
    end)
end

function EquipMake4OBJ:ShowMoney(parentWidget, idName, ItemTable)
    if type(ItemTable) ~= "table" then  return end
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", ItemTable[1])
    local myItemCount = SL:GetMetaValue("MONEY_ASSOCIATED", tonumber(idx))
    myItemCount = tonumber(myItemCount)
    local needItemCount = ItemTable[2]
    local textColor = myItemCount >= needItemCount and "#00FF00" or "#FF0000"
    local str = SL:GetSimpleNumber(myItemCount, 2) .. "/" .. SL:GetSimpleNumber(needItemCount, 2)
    local Text_count = GUI:Text_Create(parentWidget, "MONEY_COUNT"..idName, 34, 4, 15, textColor, str)
    GUI:setAnchorPoint(Text_count,0.5,0.5)
end


--刷新界面
function EquipMake4OBJ:Refresh()
    if GUI:Win_IsNull(self.ui.LayoutList) then
        return
    end
    self:UpdateUI()
end

return EquipMake4OBJ