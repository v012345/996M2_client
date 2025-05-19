local ui = {}

function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 245.00, 99.00, "res/custom/huishou/background.png")
	GUI:Image_setScale9Slice(ImageBG, 250, 250, 153, 154)
	GUI:setContentSize(ImageBG, 750, 460)
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 732.00, 403.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 15.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 0)
	GUI:Button_titleDisableOutLine(CloseButton)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodeBottom
	local NodeBottom = GUI:Node_Create(ImageBG, "NodeBottom", 0.00, 0.00)
	GUI:setTag(NodeBottom, -1)

	-- Create Layout_A1
	local Layout_A1 = GUI:Layout_Create(NodeBottom, "Layout_A1", 331.00, 82.00, 41.00, 41.00, false)
	GUI:setTouchEnabled(Layout_A1, true)
	GUI:setTag(Layout_A1, -1)
	GUI:setSwallowTouches(Layout_A1, false)

	-- Create CheckBox_A1
	local CheckBox_A1 = GUI:CheckBox_Create(Layout_A1, "CheckBox_A1", 4.00, 4.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_A1, false)
	GUI:setTouchEnabled(CheckBox_A1, false)
	GUI:setTag(CheckBox_A1, -1)

	-- Create Layout_A2
	local Layout_A2 = GUI:Layout_Create(NodeBottom, "Layout_A2", 504.00, 82.00, 41.00, 41.00, false)
	GUI:setTouchEnabled(Layout_A2, true)
	GUI:setTag(Layout_A2, -1)

	-- Create CheckBox_A2
	local CheckBox_A2 = GUI:CheckBox_Create(Layout_A2, "CheckBox_A2", 4.00, 4.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_A2, false)
	GUI:setTouchEnabled(CheckBox_A2, false)
	GUI:setTag(CheckBox_A2, -1)

	-- Create Layout_A3
	local Layout_A3 = GUI:Layout_Create(NodeBottom, "Layout_A3", 677.00, 82.00, 41.00, 41.00, false)
	GUI:setTouchEnabled(Layout_A3, true)
	GUI:setTag(Layout_A3, -1)

	-- Create CheckBox_A3
	local CheckBox_A3 = GUI:CheckBox_Create(Layout_A3, "CheckBox_A3", 4.00, 4.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_A3, false)
	GUI:setTouchEnabled(CheckBox_A3, false)
	GUI:setTag(CheckBox_A3, -1)

	-- Create Layout_A4
	local Layout_A4 = GUI:Layout_Create(NodeBottom, "Layout_A4", 163.00, 63.00, 41.00, 41.00, false)
	GUI:setTouchEnabled(Layout_A4, true)
	GUI:setTag(Layout_A4, -1)

	-- Create CheckBox_A4
	local CheckBox_A4 = GUI:CheckBox_Create(Layout_A4, "CheckBox_A4", 4.00, 4.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_A4, false)
	GUI:setTouchEnabled(CheckBox_A4, false)
	GUI:setTag(CheckBox_A4, -1)

	-- Create Layout_A5
	local Layout_A5 = GUI:Layout_Create(NodeBottom, "Layout_A5", 163.00, 101.00, 41.00, 41.00, false)
	GUI:setTouchEnabled(Layout_A5, true)
	GUI:setTag(Layout_A5, -1)

	-- Create CheckBox_A5
	local CheckBox_A5 = GUI:CheckBox_Create(Layout_A5, "CheckBox_A5", 4.00, 4.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBox_A5, false)
	GUI:setTouchEnabled(CheckBox_A5, false)
	GUI:setTag(CheckBox_A5, -1)

	-- Create ButtonQuanXuan
	local ButtonQuanXuan = GUI:Button_Create(NodeBottom, "ButtonQuanXuan", 220.00, 22.00, "res/custom/huishou/btn1.png")
	GUI:Button_setTitleText(ButtonQuanXuan, "")
	GUI:Button_setTitleColor(ButtonQuanXuan, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonQuanXuan, 0)
	GUI:Button_titleEnableOutline(ButtonQuanXuan, "#000000", 1)
	GUI:Win_SetParam(ButtonQuanXuan, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonQuanXuan, true)
	GUI:setTag(ButtonQuanXuan, -1)

	-- Create ButtonQuXiaoQuanXuan
	local ButtonQuXiaoQuanXuan = GUI:Button_Create(NodeBottom, "ButtonQuXiaoQuanXuan", 394.00, 22.00, "res/custom/huishou/btn2.png")
	GUI:Button_setTitleText(ButtonQuXiaoQuanXuan, "")
	GUI:Button_setTitleColor(ButtonQuXiaoQuanXuan, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonQuXiaoQuanXuan, 0)
	GUI:Button_titleEnableOutline(ButtonQuXiaoQuanXuan, "#000000", 1)
	GUI:Win_SetParam(ButtonQuXiaoQuanXuan, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonQuXiaoQuanXuan, true)
	GUI:setTag(ButtonQuXiaoQuanXuan, -1)

	-- Create ButtonGoHuiShou
	local ButtonGoHuiShou = GUI:Button_Create(NodeBottom, "ButtonGoHuiShou", 568.00, 22.00, "res/custom/huishou/btn3.png")
	GUI:Button_setTitleText(ButtonGoHuiShou, "")
	GUI:Button_setTitleColor(ButtonGoHuiShou, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGoHuiShou, 0)
	GUI:Button_titleEnableOutline(ButtonGoHuiShou, "#000000", 1)
	GUI:Win_SetParam(ButtonGoHuiShou, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonGoHuiShou, true)
	GUI:setTag(ButtonGoHuiShou, -1)

	-- Create NodeLeft
	local NodeLeft = GUI:Node_Create(ImageBG, "NodeLeft", 0.00, 0.00)
	GUI:setTag(NodeLeft, -1)

	-- Create Button_left_1
	local Button_left_1 = GUI:Button_Create(NodeLeft, "Button_left_1", 18.00, 366.00, "res/custom/huishou/left_btn/btn1_1.png")
	GUI:Button_loadTexturePressed(Button_left_1, "res/custom/huishou/left_btn/btn1_2.png")
	GUI:Button_loadTextureDisabled(Button_left_1, "res/custom/huishou/left_btn/btn1_2.png")
	GUI:Button_setTitleText(Button_left_1, "")
	GUI:Button_setTitleColor(Button_left_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_left_1, 0)
	GUI:Button_titleEnableOutline(Button_left_1, "#000000", 1)
	GUI:Win_SetParam(Button_left_1, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_left_1, true)
	GUI:setTag(Button_left_1, -1)

	-- Create Button_left_2
	local Button_left_2 = GUI:Button_Create(NodeLeft, "Button_left_2", 18.00, 312.00, "res/custom/huishou/left_btn/btn2_1.png")
	GUI:Button_loadTexturePressed(Button_left_2, "res/custom/huishou/left_btn/btn2_2.png")
	GUI:Button_loadTextureDisabled(Button_left_2, "res/custom/huishou/left_btn/btn2_2.png")
	GUI:Button_setTitleText(Button_left_2, "")
	GUI:Button_setTitleColor(Button_left_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_left_2, 0)
	GUI:Button_titleEnableOutline(Button_left_2, "#000000", 1)
	GUI:Win_SetParam(Button_left_2, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_left_2, true)
	GUI:setTag(Button_left_2, -1)

	-- Create Button_left_3
	local Button_left_3 = GUI:Button_Create(NodeLeft, "Button_left_3", 18.00, 259.00, "res/custom/huishou/left_btn/btn3_1.png")
	GUI:Button_loadTexturePressed(Button_left_3, "res/custom/huishou/left_btn/btn3_2.png")
	GUI:Button_loadTextureDisabled(Button_left_3, "res/custom/huishou/left_btn/btn3_2.png")
	GUI:Button_setTitleText(Button_left_3, "")
	GUI:Button_setTitleColor(Button_left_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_left_3, 0)
	GUI:Button_titleEnableOutline(Button_left_3, "#000000", 1)
	GUI:Win_SetParam(Button_left_3, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_left_3, true)
	GUI:setTag(Button_left_3, -1)

	-- Create Button_left_4
	local Button_left_4 = GUI:Button_Create(NodeLeft, "Button_left_4", 18.00, 206.00, "res/custom/huishou/left_btn/btn4_1.png")
	GUI:Button_loadTexturePressed(Button_left_4, "res/custom/huishou/left_btn/btn4_2.png")
	GUI:Button_loadTextureDisabled(Button_left_4, "res/custom/huishou/left_btn/btn4_2.png")
	GUI:Button_setTitleText(Button_left_4, "")
	GUI:Button_setTitleColor(Button_left_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_left_4, 0)
	GUI:Button_titleEnableOutline(Button_left_4, "#000000", 1)
	GUI:Win_SetParam(Button_left_4, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_left_4, true)
	GUI:setTag(Button_left_4, -1)

	-- Create Button_left_5
	local Button_left_5 = GUI:Button_Create(NodeLeft, "Button_left_5", 18.00, 153.00, "res/custom/huishou/left_btn/btn5_1.png")
	GUI:Button_loadTexturePressed(Button_left_5, "res/custom/huishou/left_btn/btn5_2.png")
	GUI:Button_loadTextureDisabled(Button_left_5, "res/custom/huishou/left_btn/btn5_2.png")
	GUI:Button_setTitleText(Button_left_5, "")
	GUI:Button_setTitleColor(Button_left_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_left_5, 0)
	GUI:Button_titleEnableOutline(Button_left_5, "#000000", 1)
	GUI:Win_SetParam(Button_left_5, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_left_5, true)
	GUI:setTag(Button_left_5, -1)

	-- Create TextMarkup
	local TextMarkup = GUI:Text_Create(ImageBG, "TextMarkup", 142.00, 37.00, 16, "#00ff00", [[]])
	GUI:setTouchEnabled(TextMarkup, false)
	GUI:setTag(TextMarkup, -1)
	GUI:Text_enableOutline(TextMarkup, "#000000", 1)

	-- Create ListViewCategories
	local ListViewCategories = GUI:ListView_Create(ImageBG, "ListViewCategories", 222.00, 143.00, 510.00, 278.00, 1)
	GUI:ListView_setGravity(ListViewCategories, 5)
	GUI:setTouchEnabled(ListViewCategories, true)
	GUI:setTag(ListViewCategories, -1)

	-- Create LayoutCategories
	local LayoutCategories = GUI:Layout_Create(ListViewCategories, "LayoutCategories", 0.00, 78.00, 500.00, 200.00, false)
	GUI:setTouchEnabled(LayoutCategories, false)
	GUI:setTag(LayoutCategories, -1)

	-- Create LayoutSubcategories
	local LayoutSubcategories = GUI:Layout_Create(ImageBG, "LayoutSubcategories", 0.00, 0.00, 750.00, 460.00, false)
	GUI:Layout_setBackGroundColorType(LayoutSubcategories, 1)
	GUI:Layout_setBackGroundColor(LayoutSubcategories, "#000000")
	GUI:Layout_setBackGroundColorOpacity(LayoutSubcategories, 91)
	GUI:setTouchEnabled(LayoutSubcategories, true)
	GUI:setTag(LayoutSubcategories, -1)
	GUI:setVisible(LayoutSubcategories, false)

	-- Create ImageViewSubcategoriesBg
	local ImageViewSubcategoriesBg = GUI:Image_Create(LayoutSubcategories, "ImageViewSubcategoriesBg", 265.00, 1.00, "res/custom/huishou/SubcategoriesBg.png")
	GUI:setTouchEnabled(ImageViewSubcategoriesBg, true)
	GUI:setTag(ImageViewSubcategoriesBg, -1)

	-- Create ButtonSearch
	local ButtonSearch = GUI:Button_Create(ImageViewSubcategoriesBg, "ButtonSearch", 189.00, 398.00, "res/custom/huishou/search_btn.png")
	GUI:Button_loadTexturePressed(ButtonSearch, "res/custom/huishou/search_btn.png")
	GUI:Button_setTitleText(ButtonSearch, "")
	GUI:Button_setTitleColor(ButtonSearch, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonSearch, 14)
	GUI:Button_titleEnableOutline(ButtonSearch, "#000000", 1)
	GUI:Win_SetParam(ButtonSearch, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonSearch, true)
	GUI:setTag(ButtonSearch, -1)

	-- Create InputSearch
	local InputSearch = GUI:TextInput_Create(ImageViewSubcategoriesBg, "InputSearch", 21.00, 402.00, 168.00, 28.00, 16)
	GUI:TextInput_setPlaceHolder(InputSearch, "输入关键字搜索...")
	GUI:TextInput_setPlaceholderFontColor(InputSearch, "#a6a6a6")
	GUI:TextInput_setFontColor(InputSearch, "#ffffff")
	GUI:Win_SetParam(InputSearch, {id = 0, type = 0, checkSensitive = false, cipher = false}, "Input")
	GUI:TextInput_setString(InputSearch, [[]])
	GUI:setTouchEnabled(InputSearch, true)
	GUI:setTag(InputSearch, -1)

	-- Create ListViewSubcategories
	local ListViewSubcategories = GUI:ListView_Create(ImageViewSubcategoriesBg, "ListViewSubcategories", 17.00, 121.00, 240.00, 268.00, 1)
	GUI:ListView_setGravity(ListViewSubcategories, 5)
	GUI:setTouchEnabled(ListViewSubcategories, true)
	GUI:setTag(ListViewSubcategories, -1)

	-- Create LayoutShowList
	local LayoutShowList = GUI:Layout_Create(ListViewSubcategories, "LayoutShowList", 0.00, 234.00, 240.00, 34.00, false)
	GUI:setTouchEnabled(LayoutShowList, false)
	GUI:setTag(LayoutShowList, -1)

	-- Create CheckBoxItem
	local CheckBoxItem = GUI:CheckBox_Create(LayoutShowList, "CheckBoxItem", 11.00, 0.00, "res/custom/huishou/checkBox3.png", "res/custom/huishou/checkBox4.png")
	GUI:CheckBox_setSelected(CheckBoxItem, true)
	GUI:setTouchEnabled(CheckBoxItem, true)
	GUI:setTag(CheckBoxItem, -1)

	-- Create ImageViewShowListBg
	local ImageViewShowListBg = GUI:Image_Create(LayoutShowList, "ImageViewShowListBg", 47.00, 1.00, "res/custom/huishou/item_list_bg.png")
	GUI:setTouchEnabled(ImageViewShowListBg, false)
	GUI:setTag(ImageViewShowListBg, -1)

	-- Create TextItemName
	local TextItemName = GUI:Text_Create(ImageViewShowListBg, "TextItemName", 78.00, 4.00, 18, "#ffffff", [[文本]])
	GUI:setAnchorPoint(TextItemName, 0.50, 0.00)
	GUI:setTouchEnabled(TextItemName, false)
	GUI:setTag(TextItemName, -1)
	GUI:Text_enableOutline(TextItemName, "#000000", 1)

	-- Create CheckBoxItemAllSelect
	local CheckBoxItemAllSelect = GUI:CheckBox_Create(ImageViewSubcategoriesBg, "CheckBoxItemAllSelect", 177.00, 79.00, "res/custom/huishou/checkBox1.png", "res/custom/huishou/checkBox2.png")
	GUI:CheckBox_setSelected(CheckBoxItemAllSelect, false)
	GUI:setTouchEnabled(CheckBoxItemAllSelect, true)
	GUI:setTag(CheckBoxItemAllSelect, -1)

	-- Create ButtonBack
	local ButtonBack = GUI:Button_Create(ImageViewSubcategoriesBg, "ButtonBack", 109.00, 14.00, "res/custom/huishou/back_btn.png")
	GUI:Button_setTitleText(ButtonBack, "")
	GUI:Button_setTitleColor(ButtonBack, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonBack, 14)
	GUI:Button_titleEnableOutline(ButtonBack, "#000000", 1)
	GUI:Win_SetParam(ButtonBack, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonBack, true)
	GUI:setTag(ButtonBack, -1)
end

return ui