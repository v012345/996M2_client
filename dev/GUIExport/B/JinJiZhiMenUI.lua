local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 110.00, 79.00, "res/custom/JinJiZhiMen/bg1.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 811.00, 422.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -5.00, -5.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(ImageBG, "EquipShow", 617.00, 258.00, 43, false, {look = true, bgVisible = false})
	GUI:setTag(EquipShow, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow)

	-- Create Button_enterMap
	local Button_enterMap = GUI:Button_Create(ImageBG, "Button_enterMap", 195.00, 58.00, "res/custom/JinJiZhiMen/btn.png")
	GUI:Button_setTitleText(Button_enterMap, "")
	GUI:Button_setTitleColor(Button_enterMap, "#ffffff")
	GUI:Button_setTitleFontSize(Button_enterMap, 16)
	GUI:Button_titleEnableOutline(Button_enterMap, "#000000", 1)
	GUI:setTouchEnabled(Button_enterMap, true)
	GUI:setTag(Button_enterMap, 0)
end
return ui