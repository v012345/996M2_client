local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 22.00, 27.00, "res/custom/gongshachuansong/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 955.00, 449.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Left_btn_list
	local Left_btn_list = GUI:Layout_Create(ImageBG, "Left_btn_list", 148.00, 26.00, 192.00, 440.00, false)
	GUI:setTouchEnabled(Left_btn_list, false)
	GUI:setTag(Left_btn_list, -1)

	-- Create ButtonLeft_1
	local ButtonLeft_1 = GUI:Button_Create(Left_btn_list, "ButtonLeft_1", 1.00, 398.00, "res/custom/gongshachuansong/btn_1_2.png")
	GUI:Button_loadTexturePressed(ButtonLeft_1, "res/custom/gongshachuansong/btn_1_1.png")
	GUI:Button_loadTextureDisabled(ButtonLeft_1, "res/custom/gongshachuansong/btn_1_1.png")
	GUI:Button_setTitleText(ButtonLeft_1, "")
	GUI:Button_setTitleColor(ButtonLeft_1, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonLeft_1, 14)
	GUI:Button_titleEnableOutline(ButtonLeft_1, "#000000", 1)
	GUI:setTouchEnabled(ButtonLeft_1, true)
	GUI:setTag(ButtonLeft_1, -1)

	-- Create ButtonLeft_2
	local ButtonLeft_2 = GUI:Button_Create(Left_btn_list, "ButtonLeft_2", 1.00, 355.00, "res/custom/gongshachuansong/btn_2_2.png")
	GUI:Button_loadTexturePressed(ButtonLeft_2, "res/custom/gongshachuansong/btn_2_1.png")
	GUI:Button_loadTextureDisabled(ButtonLeft_2, "res/custom/gongshachuansong/btn_2_1.png")
	GUI:Button_setTitleText(ButtonLeft_2, "")
	GUI:Button_setTitleColor(ButtonLeft_2, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonLeft_2, 14)
	GUI:Button_titleEnableOutline(ButtonLeft_2, "#000000", 1)
	GUI:setTouchEnabled(ButtonLeft_2, true)
	GUI:setTag(ButtonLeft_2, -1)

	-- Create LayoutPage
	local LayoutPage = GUI:Layout_Create(ImageBG, "LayoutPage", 346.00, 21.00, 616.00, 452.00, false)
	GUI:setTouchEnabled(LayoutPage, false)
	GUI:setTag(LayoutPage, -1)
end
return ui