local ui = {}
function ui.init(parent)
	-- Create Layout
	local Layout = GUI:Layout_Create(parent, "Layout", 0.00, 0.00, 252.00, 54.00, false)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create img_bg
	local img_bg = GUI:Image_Create(Layout, "img_bg", 0.00, 0.00, "res/custom/huishou/item_bg.png")
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, -1)

	-- Create Layout_show_item_list
	local Layout_show_item_list = GUI:Layout_Create(img_bg, "Layout_show_item_list", 8.00, 10.00, 160.00, 35.00, false)
	GUI:setChineseName(Layout_show_item_list, "点击容器")
	GUI:setTouchEnabled(Layout_show_item_list, true)
	GUI:setTag(Layout_show_item_list, -1)

	-- Create CheckBox_select
	local CheckBox_select = GUI:CheckBox_Create(img_bg, "CheckBox_select", 206.00, 11.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_select, false)
	GUI:setChineseName(CheckBox_select, "选择回收")
	GUI:setTouchEnabled(CheckBox_select, true)
	GUI:setTag(CheckBox_select, -1)
end
return ui