local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/tizhixiulian/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 967.00, 451.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 15.00, 12.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button1
	local Button1 = GUI:Button_Create(ImageBG, "Button1", 852.00, 375.00, "res/custom/tizhixiulian/an_02.png")
	GUI:Button_setTitleText(Button1, "")
	GUI:Button_setTitleColor(Button1, "#ffffff")
	GUI:Button_setTitleFontSize(Button1, 14)
	GUI:Button_titleEnableOutline(Button1, "#000000", 1)
	GUI:setTouchEnabled(Button1, true)
	GUI:setTag(Button1, -1)

	-- Create Node1
	local Node1 = GUI:Node_Create(Button1, "Node1", -128.00, 16.00)
	GUI:setTag(Node1, -1)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(Button1, "Layout1", -338.00, 5.00, 160.00, 45.00, false)
	GUI:setTouchEnabled(Layout1, false)
	GUI:setTag(Layout1, -1)

	-- Create Layout1_1
	local Layout1_1 = GUI:Layout_Create(Layout1, "Layout1_1", 22.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout1_1, false)
	GUI:setTag(Layout1_1, -1)

	-- Create Layout1_2
	local Layout1_2 = GUI:Layout_Create(Layout1, "Layout1_2", 79.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout1_2, false)
	GUI:setTag(Layout1_2, -1)

	-- Create Layout1_3
	local Layout1_3 = GUI:Layout_Create(Layout1, "Layout1_3", 136.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout1_3, false)
	GUI:setTag(Layout1_3, -1)

	-- Create Button2
	local Button2 = GUI:Button_Create(ImageBG, "Button2", 852.00, 313.00, "res/custom/tizhixiulian/an_02.png")
	GUI:Button_setTitleText(Button2, "")
	GUI:Button_setTitleColor(Button2, "#ffffff")
	GUI:Button_setTitleFontSize(Button2, 14)
	GUI:Button_titleEnableOutline(Button2, "#000000", 1)
	GUI:setTouchEnabled(Button2, true)
	GUI:setTag(Button2, -1)

	-- Create Node2
	local Node2 = GUI:Node_Create(Button2, "Node2", -128.00, 15.00)
	GUI:setTag(Node2, -1)

	-- Create Layout2
	local Layout2 = GUI:Layout_Create(Button2, "Layout2", -338.00, 5.00, 160.00, 45.00, false)
	GUI:setTouchEnabled(Layout2, false)
	GUI:setTag(Layout2, -1)

	-- Create Layout2_1
	local Layout2_1 = GUI:Layout_Create(Layout2, "Layout2_1", 22.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout2_1, false)
	GUI:setTag(Layout2_1, -1)

	-- Create Layout2_2
	local Layout2_2 = GUI:Layout_Create(Layout2, "Layout2_2", 79.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout2_2, false)
	GUI:setTag(Layout2_2, -1)

	-- Create Layout2_3
	local Layout2_3 = GUI:Layout_Create(Layout2, "Layout2_3", 136.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout2_3, false)
	GUI:setTag(Layout2_3, -1)

	-- Create Button3
	local Button3 = GUI:Button_Create(ImageBG, "Button3", 852.00, 251.00, "res/custom/tizhixiulian/an_02.png")
	GUI:Button_setTitleText(Button3, "")
	GUI:Button_setTitleColor(Button3, "#ffffff")
	GUI:Button_setTitleFontSize(Button3, 14)
	GUI:Button_titleEnableOutline(Button3, "#000000", 1)
	GUI:setTouchEnabled(Button3, true)
	GUI:setTag(Button3, -1)

	-- Create Node3
	local Node3 = GUI:Node_Create(Button3, "Node3", -128.00, 16.00)
	GUI:setTag(Node3, -1)

	-- Create Layout3
	local Layout3 = GUI:Layout_Create(Button3, "Layout3", -338.00, 5.00, 160.00, 45.00, false)
	GUI:setTouchEnabled(Layout3, false)
	GUI:setTag(Layout3, -1)

	-- Create Layout3_1
	local Layout3_1 = GUI:Layout_Create(Layout3, "Layout3_1", 22.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout3_1, false)
	GUI:setTag(Layout3_1, -1)

	-- Create Layout3_2
	local Layout3_2 = GUI:Layout_Create(Layout3, "Layout3_2", 79.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout3_2, false)
	GUI:setTag(Layout3_2, -1)

	-- Create Layout3_3
	local Layout3_3 = GUI:Layout_Create(Layout3, "Layout3_3", 136.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout3_3, false)
	GUI:setTag(Layout3_3, -1)

	-- Create Button4
	local Button4 = GUI:Button_Create(ImageBG, "Button4", 852.00, 190.00, "res/custom/tizhixiulian/an_02.png")
	GUI:Button_setTitleText(Button4, "")
	GUI:Button_setTitleColor(Button4, "#ffffff")
	GUI:Button_setTitleFontSize(Button4, 14)
	GUI:Button_titleEnableOutline(Button4, "#000000", 1)
	GUI:setTouchEnabled(Button4, true)
	GUI:setTag(Button4, -1)

	-- Create Node4
	local Node4 = GUI:Node_Create(Button4, "Node4", -128.00, 16.00)
	GUI:setTag(Node4, -1)

	-- Create Layout4
	local Layout4 = GUI:Layout_Create(Button4, "Layout4", -338.00, 5.00, 160.00, 45.00, false)
	GUI:setTouchEnabled(Layout4, false)
	GUI:setTag(Layout4, -1)

	-- Create Layout4_1
	local Layout4_1 = GUI:Layout_Create(Layout4, "Layout4_1", 22.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout4_1, false)
	GUI:setTag(Layout4_1, -1)

	-- Create Layout4_2
	local Layout4_2 = GUI:Layout_Create(Layout4, "Layout4_2", 79.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout4_2, false)
	GUI:setTag(Layout4_2, -1)

	-- Create Layout4_3
	local Layout4_3 = GUI:Layout_Create(Layout4, "Layout4_3", 136.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout4_3, false)
	GUI:setTag(Layout4_3, -1)

	-- Create Button5
	local Button5 = GUI:Button_Create(ImageBG, "Button5", 852.00, 128.00, "res/custom/tizhixiulian/an_02.png")
	GUI:Button_setTitleText(Button5, "")
	GUI:Button_setTitleColor(Button5, "#ffffff")
	GUI:Button_setTitleFontSize(Button5, 14)
	GUI:Button_titleEnableOutline(Button5, "#000000", 1)
	GUI:setTouchEnabled(Button5, true)
	GUI:setTag(Button5, -1)

	-- Create Node5
	local Node5 = GUI:Node_Create(Button5, "Node5", -128.00, 16.00)
	GUI:setTag(Node5, -1)

	-- Create Layout5
	local Layout5 = GUI:Layout_Create(Button5, "Layout5", -338.00, 5.00, 160.00, 45.00, false)
	GUI:setTouchEnabled(Layout5, false)
	GUI:setTag(Layout5, -1)

	-- Create Layout5_1
	local Layout5_1 = GUI:Layout_Create(Layout5, "Layout5_1", 22.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout5_1, false)
	GUI:setTag(Layout5_1, -1)

	-- Create Layout5_2
	local Layout5_2 = GUI:Layout_Create(Layout5, "Layout5_2", 79.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout5_2, false)
	GUI:setTag(Layout5_2, -1)

	-- Create Layout5_3
	local Layout5_3 = GUI:Layout_Create(Layout5, "Layout5_3", 136.00, 22.00, 45.00, 45.00, false)
	GUI:setTouchEnabled(Layout5_3, false)
	GUI:setTag(Layout5_3, -1)

	-- Create Button10
	local Button10 = GUI:Button_Create(ImageBG, "Button10", 779.00, 57.00, "res/custom/tizhixiulian/an_01.png")
	GUI:Button_setTitleText(Button10, "")
	GUI:Button_setTitleColor(Button10, "#ffffff")
	GUI:Button_setTitleFontSize(Button10, 14)
	GUI:Button_titleEnableOutline(Button10, "#000000", 1)
	GUI:setTouchEnabled(Button10, true)
	GUI:setTag(Button10, -1)
end
return ui