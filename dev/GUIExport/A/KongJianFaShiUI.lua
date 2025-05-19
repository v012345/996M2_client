local ui = {}

function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/kongjianfashiui/jm_01.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 954.00, 478.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -2.00, -2.00, "res/custom/kongjianfashiui/close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button1
	local Button1 = GUI:Button_Create(ImageBG, "Button1", 693.00, 105.00, "res/custom/kongjianfashiui/an_01.png")
	GUI:Button_setTitleText(Button1, "")
	GUI:Button_setTitleColor(Button1, "#ffffff")
	GUI:Button_setTitleFontSize(Button1, 14)
	GUI:Button_titleEnableOutline(Button1, "#000000", 1)
	GUI:Win_SetParam(Button1, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button1, true)
	GUI:setTag(Button1, -1)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(ImageBG, "Layout1", 648.00, 301.00, 250.00, 30.00, false)
	GUI:setTouchEnabled(Layout1, false)
	GUI:setTag(Layout1, -1)

	-- Create Layout2
	local Layout2 = GUI:Layout_Create(ImageBG, "Layout2", 768.00, 245.00, 60.00, 60.00, false)
	GUI:setTouchEnabled(Layout2, false)
	GUI:setTag(Layout2, -1)
end

return ui