local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/zhuangbeixilian/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 960.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/public/1900000511.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000510.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create EquipShow01
	local EquipShow01 = GUI:EquipShow_Create(ImageBG, "EquipShow01", 203.00, 372.00, 1, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow01)
	GUI:setAnchorPoint(EquipShow01, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow01, false)
	GUI:setTag(EquipShow01, -1)

	-- Create EquipShow02
	local EquipShow02 = GUI:EquipShow_Create(ImageBG, "EquipShow02", 285.00, 372.00, 0, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow02)
	GUI:setAnchorPoint(EquipShow02, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow02, false)
	GUI:setTag(EquipShow02, -1)

	-- Create EquipShow03
	local EquipShow03 = GUI:EquipShow_Create(ImageBG, "EquipShow03", 203.00, 299.00, 3, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow03)
	GUI:setAnchorPoint(EquipShow03, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow03, false)
	GUI:setTag(EquipShow03, -1)

	-- Create EquipShow04
	local EquipShow04 = GUI:EquipShow_Create(ImageBG, "EquipShow04", 285.00, 299.00, 4, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow04)
	GUI:setAnchorPoint(EquipShow04, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow04, false)
	GUI:setTag(EquipShow04, -1)

	-- Create EquipShow05
	local EquipShow05 = GUI:EquipShow_Create(ImageBG, "EquipShow05", 203.00, 226.00, 5, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow05)
	GUI:setAnchorPoint(EquipShow05, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow05, false)
	GUI:setTag(EquipShow05, -1)

	-- Create EquipShow06
	local EquipShow06 = GUI:EquipShow_Create(ImageBG, "EquipShow06", 285.00, 226.00, 6, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow06)
	GUI:setAnchorPoint(EquipShow06, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow06, false)
	GUI:setTag(EquipShow06, -1)

	-- Create EquipShow07
	local EquipShow07 = GUI:EquipShow_Create(ImageBG, "EquipShow07", 203.00, 153.00, 7, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow07)
	GUI:setAnchorPoint(EquipShow07, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow07, false)
	GUI:setTag(EquipShow07, -1)

	-- Create EquipShow08
	local EquipShow08 = GUI:EquipShow_Create(ImageBG, "EquipShow08", 285.00, 153.00, 8, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow08)
	GUI:setAnchorPoint(EquipShow08, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow08, false)
	GUI:setTag(EquipShow08, -1)

	-- Create EquipShow09
	local EquipShow09 = GUI:EquipShow_Create(ImageBG, "EquipShow09", 203.00, 80.00, 11, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow09)
	GUI:setAnchorPoint(EquipShow09, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow09, false)
	GUI:setTag(EquipShow09, -1)

	-- Create EquipShow10
	local EquipShow10 = GUI:EquipShow_Create(ImageBG, "EquipShow10", 285.00, 80.00, 10, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow10)
	GUI:setAnchorPoint(EquipShow10, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow10, false)
	GUI:setTag(EquipShow10, -1)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(ImageBG, "Layout1", 166.00, 44.00, 155, 365, false)
	GUI:setAnchorPoint(Layout1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout1, false)
	GUI:setTag(Layout1, -1)

	-- Create Layout_wuqi
	local Layout_wuqi = GUI:Layout_Create(Layout1, "Layout_wuqi", 6.00, 297.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_wuqi, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_wuqi, true)
	GUI:setMouseEnabled(Layout_wuqi, true)
	GUI:setTag(Layout_wuqi, -1)

	-- Create Layout_yifu
	local Layout_yifu = GUI:Layout_Create(Layout1, "Layout_yifu", 87.00, 297.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_yifu, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_yifu, true)
	GUI:setTag(Layout_yifu, -1)

	-- Create Layout_xianglian
	local Layout_xianglian = GUI:Layout_Create(Layout1, "Layout_xianglian", 6.00, 224.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_xianglian, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_xianglian, true)
	GUI:setTag(Layout_xianglian, -1)

	-- Create Layout_toukui
	local Layout_toukui = GUI:Layout_Create(Layout1, "Layout_toukui", 88.00, 224.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_toukui, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_toukui, true)
	GUI:setTag(Layout_toukui, -1)

	-- Create Layout_youshou
	local Layout_youshou = GUI:Layout_Create(Layout1, "Layout_youshou", 6.00, 151.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_youshou, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_youshou, true)
	GUI:setTag(Layout_youshou, -1)

	-- Create Layout_zuoshou
	local Layout_zuoshou = GUI:Layout_Create(Layout1, "Layout_zuoshou", 88.00, 151.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_zuoshou, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_zuoshou, true)
	GUI:setTag(Layout_zuoshou, -1)

	-- Create Layout_youjie
	local Layout_youjie = GUI:Layout_Create(Layout1, "Layout_youjie", 6.00, 78.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_youjie, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_youjie, true)
	GUI:setTag(Layout_youjie, -1)

	-- Create Layout_zuojie
	local Layout_zuojie = GUI:Layout_Create(Layout1, "Layout_zuojie", 88.00, 78.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_zuojie, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_zuojie, true)
	GUI:setTag(Layout_zuojie, -1)

	-- Create Layout_xuezi
	local Layout_xuezi = GUI:Layout_Create(Layout1, "Layout_xuezi", 6.00, 5.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_xuezi, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_xuezi, true)
	GUI:setTag(Layout_xuezi, -1)

	-- Create Layout_yaodai
	local Layout_yaodai = GUI:Layout_Create(Layout1, "Layout_yaodai", 88.00, 5.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_yaodai, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_yaodai, true)
	GUI:setTag(Layout_yaodai, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(Layout1, "NodeSelect", 0.00, 0.00)
	GUI:setTag(NodeSelect, -1)

	-- Create Text_name
	local Text_name = GUI:Text_Create(ImageBG, "Text_name", 656.00, 289.00, 18, "#ffffff", [[未放入]])
	GUI:Text_enableOutline(Text_name, "#000000", 1)
	GUI:setAnchorPoint(Text_name, 0.50, 0.00)
	GUI:setTouchEnabled(Text_name, false)
	GUI:setTag(Text_name, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 624.00, 329.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 60, 60)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Layout3
	local Layout3 = GUI:Layout_Create(ImageBG, "Layout3", 389.00, 90.00, 100, 60, false)
	GUI:setAnchorPoint(Layout3, 0.00, 0.00)
	GUI:setTouchEnabled(Layout3, false)
	GUI:setTag(Layout3, -1)

	-- Create Layout3_1
	local Layout3_1 = GUI:Layout_Create(ImageBG, "Layout3_1", 686.00, 90.00, 100, 60, false)
	GUI:setAnchorPoint(Layout3_1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout3_1, false)
	GUI:setTag(Layout3_1, -1)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(ImageBG, "ButtonStart", 425.00, 28.00, "res/custom/zhuangbeixilian/btn_1.png")
	GUI:Button_setTitleText(ButtonStart, [[]])
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setAnchorPoint(ButtonStart, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	-- Create ButtonStart_1
	local ButtonStart_1 = GUI:Button_Create(ImageBG, "ButtonStart_1", 715.00, 28.00, "res/custom/zhuangbeixilian/btn_2.png")
	GUI:Button_setTitleText(ButtonStart_1, [[]])
	GUI:Button_setTitleColor(ButtonStart_1, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart_1, 14)
	GUI:Button_titleEnableOutline(ButtonStart_1, "#000000", 1)
	GUI:setAnchorPoint(ButtonStart_1, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonStart_1, true)
	GUI:setTag(ButtonStart_1, -1)

	-- Create Node_attrList
	local Node_attrList = GUI:Node_Create(ImageBG, "Node_attrList", 0.00, 0.00)
	GUI:setTag(Node_attrList, -1)

	-- Create Text_attr1
	local Text_attr1 = GUI:Text_Create(Node_attrList, "Text_attr1", 444.00, 252.00, 16, "#ffffff", [[暂未觉醒]])
	GUI:Text_enableOutline(Text_attr1, "#000000", 1)
	GUI:setAnchorPoint(Text_attr1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr1, false)
	GUI:setTag(Text_attr1, -1)

	-- Create Text_attr2
	local Text_attr2 = GUI:Text_Create(Node_attrList, "Text_attr2", 711.00, 252.00, 16, "#ffffff", [[暂未觉醒]])
	GUI:Text_enableOutline(Text_attr2, "#000000", 1)
	GUI:setAnchorPoint(Text_attr2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr2, false)
	GUI:setTag(Text_attr2, -1)

	-- Create Text_attr3
	local Text_attr3 = GUI:Text_Create(Node_attrList, "Text_attr3", 444.00, 219.00, 16, "#ffffff", [[暂未觉醒]])
	GUI:Text_enableOutline(Text_attr3, "#000000", 1)
	GUI:setAnchorPoint(Text_attr3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr3, false)
	GUI:setTag(Text_attr3, -1)

	-- Create Text_attr4
	local Text_attr4 = GUI:Text_Create(Node_attrList, "Text_attr4", 712.00, 220.00, 16, "#ffffff", [[暂未觉醒]])
	GUI:Text_enableOutline(Text_attr4, "#000000", 1)
	GUI:setAnchorPoint(Text_attr4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr4, false)
	GUI:setTag(Text_attr4, -1)

	-- Create Text_attr5
	local Text_attr5 = GUI:Text_Create(Node_attrList, "Text_attr5", 445.00, 185.00, 16, "#ffffff", [[暂未觉醒]])
	GUI:Text_enableOutline(Text_attr5, "#000000", 1)
	GUI:setAnchorPoint(Text_attr5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr5, false)
	GUI:setTag(Text_attr5, -1)

	-- Create Node_attrListShow
	local Node_attrListShow = GUI:Node_Create(ImageBG, "Node_attrListShow", 0.00, 0.00)
	GUI:setTag(Node_attrListShow, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(ImageBG, "ImageView_1", 352.00, 146.00, "res/custom/zhuangbeixilian/001.png")
	GUI:setAnchorPoint(ImageView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create ImageView_1_1
	local ImageView_1_1 = GUI:Image_Create(ImageBG, "ImageView_1_1", 647.00, 146.00, "res/custom/zhuangbeixilian/001.png")
	GUI:setAnchorPoint(ImageView_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView_1_1, false)
	GUI:setTag(ImageView_1_1, -1)

	-- Create ImageView_1_2
	local ImageView_1_2 = GUI:Image_Create(ImageBG, "ImageView_1_2", 371.00, 388.00, "res/custom/zhuangbeixilian/tishi.png")
	GUI:setAnchorPoint(ImageView_1_2, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView_1_2, false)
	GUI:setTag(ImageView_1_2, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
