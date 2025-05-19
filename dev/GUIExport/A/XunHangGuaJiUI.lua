local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 39.00, 36.00, "res/custom/XunHangGuaJi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 961.00, 447.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_record_1
	local Button_record_1 = GUI:Button_Create(ImageBG, "Button_record_1", 228.00, 259.00, "res/custom/XunHangGuaJi/record_map.png")
	GUI:Button_setTitleText(Button_record_1, [[]])
	GUI:Button_setTitleColor(Button_record_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_record_1, 16)
	GUI:Button_titleEnableOutline(Button_record_1, "#000000", 1)
	GUI:setAnchorPoint(Button_record_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_record_1, true)
	GUI:setTag(Button_record_1, 0)

	-- Create Button_record_2
	local Button_record_2 = GUI:Button_Create(ImageBG, "Button_record_2", 457.00, 259.00, "res/custom/XunHangGuaJi/record_map.png")
	GUI:Button_setTitleText(Button_record_2, [[]])
	GUI:Button_setTitleColor(Button_record_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_record_2, 16)
	GUI:Button_titleEnableOutline(Button_record_2, "#000000", 1)
	GUI:setAnchorPoint(Button_record_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_record_2, true)
	GUI:setTag(Button_record_2, 0)

	-- Create Button_record_3
	local Button_record_3 = GUI:Button_Create(ImageBG, "Button_record_3", 682.00, 259.00, "res/custom/XunHangGuaJi/record_map.png")
	GUI:Button_setTitleText(Button_record_3, [[]])
	GUI:Button_setTitleColor(Button_record_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_record_3, 16)
	GUI:Button_titleEnableOutline(Button_record_3, "#000000", 1)
	GUI:setAnchorPoint(Button_record_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_record_3, true)
	GUI:setTag(Button_record_3, 0)

	-- Create Button_start
	local Button_start = GUI:Button_Create(ImageBG, "Button_start", 436.00, 21.00, "res/custom/XunHangGuaJi/startGuaJi.png")
	GUI:Button_setTitleText(Button_start, [[]])
	GUI:Button_setTitleColor(Button_start, "#ffffff")
	GUI:Button_setTitleFontSize(Button_start, 16)
	GUI:Button_titleEnableOutline(Button_start, "#000000", 1)
	GUI:setAnchorPoint(Button_start, 0.00, 0.00)
	GUI:setTouchEnabled(Button_start, true)
	GUI:setTag(Button_start, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 314.00, 323.00, 18, "#24c2cc", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(ImageBG, "Text_2", 545.00, 323.00, 18, "#24c2cc", [[文本]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(ImageBG, "Text_3", 773.00, 323.00, 18, "#24c2cc", [[文本]])
	GUI:setAnchorPoint(Text_3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Button_onOff1
	local Button_onOff1 = GUI:Button_Create(ImageBG, "Button_onOff1", 188.00, 215.00, "res/custom/XunHangGuaJi/off.png")
	GUI:Button_setTitleText(Button_onOff1, [[]])
	GUI:Button_setTitleColor(Button_onOff1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_onOff1, 16)
	GUI:Button_titleEnableOutline(Button_onOff1, "#000000", 1)
	GUI:setAnchorPoint(Button_onOff1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_onOff1, true)
	GUI:setTag(Button_onOff1, 0)

	-- Create Button_onOff2
	local Button_onOff2 = GUI:Button_Create(ImageBG, "Button_onOff2", 188.00, 163.00, "res/custom/XunHangGuaJi/off.png")
	GUI:Button_setTitleText(Button_onOff2, [[]])
	GUI:Button_setTitleColor(Button_onOff2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_onOff2, 16)
	GUI:Button_titleEnableOutline(Button_onOff2, "#000000", 1)
	GUI:setAnchorPoint(Button_onOff2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_onOff2, true)
	GUI:setTag(Button_onOff2, 0)

	-- Create Button_onOff3
	local Button_onOff3 = GUI:Button_Create(ImageBG, "Button_onOff3", 188.00, 111.00, "res/custom/XunHangGuaJi/off.png")
	GUI:Button_setTitleText(Button_onOff3, [[]])
	GUI:Button_setTitleColor(Button_onOff3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_onOff3, 16)
	GUI:Button_titleEnableOutline(Button_onOff3, "#000000", 1)
	GUI:setAnchorPoint(Button_onOff3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_onOff3, true)
	GUI:setTag(Button_onOff3, 0)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
