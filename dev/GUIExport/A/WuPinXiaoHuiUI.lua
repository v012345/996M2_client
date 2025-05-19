local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 19.00, "res/public/1900000610.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 753.00, 469.00, 75.00, 75.00, false)
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

	-- Create TextTitle
	local TextTitle = GUI:Text_Create(ImageBG, "TextTitle", 390.00, 503.00, 16, "#ffffff", [[物品销毁]])
	GUI:setAnchorPoint(TextTitle, 0.50, 0.50)
	GUI:setTouchEnabled(TextTitle, false)
	GUI:setTag(TextTitle, -1)
	GUI:Text_enableOutline(TextTitle, "#000000", 1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 60.00, 273.00, 500.00, 200.00, false)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Button
	local Button = GUI:Button_Create(ImageBG, "Button", 431.00, 71.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button, "销毁")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)
end
return ui