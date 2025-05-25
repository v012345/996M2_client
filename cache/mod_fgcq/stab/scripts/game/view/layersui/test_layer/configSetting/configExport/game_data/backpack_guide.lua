local ui = {}
function ui.init(parent)
	-- Create panel_bg
	local panel_bg = GUI:Layout_Create(parent, "panel_bg", 0.00, 0.00, 300.00, 380.00, false)
	GUI:setTouchEnabled(panel_bg, true)
	GUI:setTag(panel_bg, -1)

	-- Create Button_sure
	local Button_sure = GUI:Button_Create(panel_bg, "Button_sure", 263.00, 24.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button_sure, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button_sure, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setScale9Slice(Button_sure, 16, 14, 13, 11)
	GUI:setContentSize(Button_sure, 60, 36)
	GUI:setIgnoreContentAdaptWithSize(Button_sure, false)
	GUI:Button_setTitleText(Button_sure, "保 存")
	GUI:Button_setTitleColor(Button_sure, "#00ff00")
	GUI:Button_setTitleFontSize(Button_sure, 16)
	GUI:Button_titleEnableOutline(Button_sure, "#000000", 1)
	GUI:setAnchorPoint(Button_sure, 0.50, 0.50)
	GUI:setTouchEnabled(Button_sure, true)
	GUI:setTag(Button_sure, -1)

	-- Create Button_set
	local Button_set = GUI:Button_Create(panel_bg, "Button_set", 190.00, 24.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_setScale9Slice(Button_set, 16, 28, 13, 10)
	GUI:setContentSize(Button_set, 60, 36)
	GUI:setIgnoreContentAdaptWithSize(Button_set, false)
	GUI:Button_setTitleText(Button_set, "配 置")
	GUI:Button_setTitleColor(Button_set, "#00ff00")
	GUI:Button_setTitleFontSize(Button_set, 16)
	GUI:Button_titleEnableOutline(Button_set, "#000000", 1)
	GUI:setAnchorPoint(Button_set, 0.50, 0.50)
	GUI:setTouchEnabled(Button_set, true)
	GUI:setTag(Button_set, -1)

	-- Create Layout_line
	local Layout_line = GUI:Layout_Create(panel_bg, "Layout_line", 0.00, 275.00, 300.00, 1.00, false)
	GUI:Layout_setBackGroundColorType(Layout_line, 1)
	GUI:Layout_setBackGroundColor(Layout_line, "#ffffff")
	GUI:Layout_setBackGroundColorOpacity(Layout_line, 255)
	GUI:setTouchEnabled(Layout_line, false)
	GUI:setTag(Layout_line, -1)

	-- Create Text
	local Text = GUI:Text_Create(panel_bg, "Text", 0.00, 250.00, 14, "#ffffff", [[勾选不显示使用按钮的道具类型]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create ScrollView_items
	local ScrollView_items = GUI:ScrollView_Create(panel_bg, "ScrollView_items", 0.00, 245.00, 300.00, 200.00, 1)
	GUI:ScrollView_setInnerContainerSize(ScrollView_items, 300.00, 200.00)
	GUI:setAnchorPoint(ScrollView_items, 0.00, 1.00)
	GUI:setTouchEnabled(ScrollView_items, true)
	GUI:setTag(ScrollView_items, -1)
end
return ui