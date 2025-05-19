local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -4.00, 12.00, "res/custom/ZhenBaoJianDing/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 947.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 15.00, 12.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AllEquipShow
	local AllEquipShow = GUI:Node_Create(ImageBG, "AllEquipShow", 0.00, -32.00)
	GUI:setTag(AllEquipShow, 0)

	-- Create EquipShow01
	local EquipShow01 = GUI:EquipShow_Create(AllEquipShow, "EquipShow01", 176.00, 412.00, 30, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow01)
	GUI:setAnchorPoint(EquipShow01, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow01, false)
	GUI:setTag(EquipShow01, -1)

	-- Create EquipShow02
	local EquipShow02 = GUI:EquipShow_Create(AllEquipShow, "EquipShow02", 250.00, 412.00, 31, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow02)
	GUI:setAnchorPoint(EquipShow02, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow02, false)
	GUI:setTag(EquipShow02, -1)

	-- Create EquipShow03
	local EquipShow03 = GUI:EquipShow_Create(AllEquipShow, "EquipShow03", 176.00, 335.00, 32, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow03)
	GUI:setAnchorPoint(EquipShow03, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow03, false)
	GUI:setTag(EquipShow03, -1)

	-- Create EquipShow04
	local EquipShow04 = GUI:EquipShow_Create(AllEquipShow, "EquipShow04", 250.00, 335.00, 33, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow04)
	GUI:setAnchorPoint(EquipShow04, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow04, false)
	GUI:setTag(EquipShow04, -1)

	-- Create EquipShow05
	local EquipShow05 = GUI:EquipShow_Create(AllEquipShow, "EquipShow05", 176.00, 257.00, 34, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow05)
	GUI:setAnchorPoint(EquipShow05, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow05, false)
	GUI:setTag(EquipShow05, -1)

	-- Create EquipShow06
	local EquipShow06 = GUI:EquipShow_Create(AllEquipShow, "EquipShow06", 250.00, 257.00, 35, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow06)
	GUI:setAnchorPoint(EquipShow06, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow06, false)
	GUI:setTag(EquipShow06, -1)

	-- Create EquipShow07
	local EquipShow07 = GUI:EquipShow_Create(AllEquipShow, "EquipShow07", 176.00, 180.00, 36, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow07)
	GUI:setAnchorPoint(EquipShow07, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow07, false)
	GUI:setTag(EquipShow07, -1)

	-- Create EquipShow08
	local EquipShow08 = GUI:EquipShow_Create(AllEquipShow, "EquipShow08", 250.00, 180.00, 37, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow08)
	GUI:setAnchorPoint(EquipShow08, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow08, false)
	GUI:setTag(EquipShow08, -1)

	-- Create EquipShow09
	local EquipShow09 = GUI:EquipShow_Create(AllEquipShow, "EquipShow09", 176.00, 102.00, 38, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow09)
	GUI:setAnchorPoint(EquipShow09, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow09, false)
	GUI:setTag(EquipShow09, -1)

	-- Create EquipShow10
	local EquipShow10 = GUI:EquipShow_Create(AllEquipShow, "EquipShow10", 251.00, 102.00, 39, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow10)
	GUI:setAnchorPoint(EquipShow10, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow10, false)
	GUI:setTag(EquipShow10, -1)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(ImageBG, "Layout1", 137.00, 27.00, 155, 391, false)
	GUI:setAnchorPoint(Layout1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout1, false)
	GUI:setTag(Layout1, -1)

	-- Create Layout_widget_1
	local Layout_widget_1 = GUI:Layout_Create(Layout1, "Layout_widget_1", 9.00, 322.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_1, true)
	GUI:setTag(Layout_widget_1, -1)

	-- Create Layout_widget_2
	local Layout_widget_2 = GUI:Layout_Create(Layout1, "Layout_widget_2", 82.00, 322.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_2, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_2, true)
	GUI:setTag(Layout_widget_2, -1)

	-- Create Layout_widget_3
	local Layout_widget_3 = GUI:Layout_Create(Layout1, "Layout_widget_3", 8.00, 244.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_3, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_3, true)
	GUI:setTag(Layout_widget_3, -1)

	-- Create Layout_widget_4
	local Layout_widget_4 = GUI:Layout_Create(Layout1, "Layout_widget_4", 82.00, 244.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_4, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_4, true)
	GUI:setTag(Layout_widget_4, -1)

	-- Create Layout_widget_5
	local Layout_widget_5 = GUI:Layout_Create(Layout1, "Layout_widget_5", 8.00, 166.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_5, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_5, true)
	GUI:setTag(Layout_widget_5, -1)

	-- Create Layout_widget_6
	local Layout_widget_6 = GUI:Layout_Create(Layout1, "Layout_widget_6", 82.00, 166.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_6, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_6, true)
	GUI:setTag(Layout_widget_6, -1)

	-- Create Layout_widget_7
	local Layout_widget_7 = GUI:Layout_Create(Layout1, "Layout_widget_7", 8.00, 89.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_7, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_7, true)
	GUI:setTag(Layout_widget_7, -1)

	-- Create Layout_widget_8
	local Layout_widget_8 = GUI:Layout_Create(Layout1, "Layout_widget_8", 83.00, 90.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_8, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_8, true)
	GUI:setTag(Layout_widget_8, -1)

	-- Create Layout_widget_9
	local Layout_widget_9 = GUI:Layout_Create(Layout1, "Layout_widget_9", 8.00, 11.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_9, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_9, true)
	GUI:setTag(Layout_widget_9, -1)

	-- Create Layout_widget_10
	local Layout_widget_10 = GUI:Layout_Create(Layout1, "Layout_widget_10", 82.00, 11.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_10, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_10, true)
	GUI:setTag(Layout_widget_10, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(Layout1, "NodeSelect", -30.00, 8.00)
	GUI:setTag(NodeSelect, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 592.00, 371.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 60, 60)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Node_attrList
	local Node_attrList = GUI:Node_Create(ImageBG, "Node_attrList", 0.00, -32.00)
	GUI:setTag(Node_attrList, -1)

	-- Create Text_attr1
	local Text_attr1 = GUI:Text_Create(Node_attrList, "Text_attr1", 568.00, 361.00, 16, "#ffffff", [[暂未鉴定]])
	GUI:Text_enableOutline(Text_attr1, "#000000", 1)
	GUI:setAnchorPoint(Text_attr1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr1, false)
	GUI:setTag(Text_attr1, -1)

	-- Create Text_attr2
	local Text_attr2 = GUI:Text_Create(Node_attrList, "Text_attr2", 568.00, 322.00, 16, "#ffffff", [[暂未鉴定]])
	GUI:Text_enableOutline(Text_attr2, "#000000", 1)
	GUI:setAnchorPoint(Text_attr2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr2, false)
	GUI:setTag(Text_attr2, -1)

	-- Create Text_attr3
	local Text_attr3 = GUI:Text_Create(Node_attrList, "Text_attr3", 568.00, 281.00, 16, "#ffffff", [[暂未鉴定]])
	GUI:Text_enableOutline(Text_attr3, "#000000", 1)
	GUI:setAnchorPoint(Text_attr3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr3, false)
	GUI:setTag(Text_attr3, -1)

	-- Create Text_attr4
	local Text_attr4 = GUI:Text_Create(Node_attrList, "Text_attr4", 568.00, 241.00, 16, "#ffffff", [[暂未鉴定]])
	GUI:Text_enableOutline(Text_attr4, "#000000", 1)
	GUI:setAnchorPoint(Text_attr4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr4, false)
	GUI:setTag(Text_attr4, -1)

	-- Create Text_attr5
	local Text_attr5 = GUI:Text_Create(Node_attrList, "Text_attr5", 568.00, 201.00, 16, "#ffffff", [[暂未鉴定]])
	GUI:Text_enableOutline(Text_attr5, "#000000", 1)
	GUI:setAnchorPoint(Text_attr5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr5, false)
	GUI:setTag(Text_attr5, -1)

	-- Create CostShow1
	local CostShow1 = GUI:Layout_Create(ImageBG, "CostShow1", 378.00, 113.00, 153, 35, false)
	GUI:setAnchorPoint(CostShow1, 0.00, 0.00)
	GUI:setTouchEnabled(CostShow1, false)
	GUI:setTag(CostShow1, -1)

	-- Create CostShow2
	local CostShow2 = GUI:Layout_Create(ImageBG, "CostShow2", 709.00, 113.00, 153, 35, false)
	GUI:setAnchorPoint(CostShow2, 0.00, 0.00)
	GUI:setTouchEnabled(CostShow2, false)
	GUI:setTag(CostShow2, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 346.00, 21.00, "res/custom/ZhenBaoJianDing/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 676.00, 21.00, "res/custom/ZhenBaoJianDing/button2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
