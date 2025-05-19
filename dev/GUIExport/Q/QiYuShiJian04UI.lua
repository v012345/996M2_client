local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/qiyuxitong/jm/jm_4_1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 679.00, 206.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 10.00, 8.00, "res/custom/qiyuxitong/an/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 317.00, 43.00, "res/custom/qiyuxitong/an/fx01.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 401.00, 43.00, "res/custom/qiyuxitong/an/fx02.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 485.00, 43.00, "res/custom/qiyuxitong/an/fx03.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(ImageBG, "Button_4", 569.00, 43.00, "res/custom/qiyuxitong/an/fx04.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(ImageBG, "Button_5", 397.00, 21.00, "res/custom/qiyuxitong/an/an01.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)
	GUI:setVisible(Button_5, false)

	-- Create items_1
	local items_1 = GUI:Layout_Create(Button_5, "items_1", 84.00, 101.00, 62, 62, false)
	GUI:setAnchorPoint(items_1, 0.00, 0.00)
	GUI:setTouchEnabled(items_1, true)
	GUI:setTag(items_1, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(ImageBG, "Button_6", 409.00, 32.00, "res/custom/qiyuxitong/an/an01.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)
	GUI:setVisible(Button_6, false)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(ImageBG, "Button_7", 397.00, 21.00, "res/custom/qiyuxitong/an/an01.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)
	GUI:setVisible(Button_7, false)

	-- Create items_2
	local items_2 = GUI:Layout_Create(Button_7, "items_2", 85.00, 104.00, 62, 62, false)
	GUI:setAnchorPoint(items_2, 0.00, 0.00)
	GUI:setTouchEnabled(items_2, true)
	GUI:setTag(items_2, 0)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(ImageBG, "Button_8", 409.00, 32.00, "res/custom/qiyuxitong/an/an01.png")
	GUI:Button_setTitleText(Button_8, [[]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)
	GUI:setVisible(Button_8, false)

	-- Create Ask_bg
	local Ask_bg = GUI:Image_Create(ImageBG, "Ask_bg", 204.00, 23.00, "res/custom/qiyuxitong/bg_ask.png")
	GUI:setAnchorPoint(Ask_bg, 0.00, 0.00)
	GUI:setTouchEnabled(Ask_bg, false)
	GUI:setTag(Ask_bg, 0)
	GUI:setVisible(Ask_bg, false)

	-- Create Button_Yes
	local Button_Yes = GUI:Button_Create(Ask_bg, "Button_Yes", 24.00, 36.00, "res/custom/qiyuxitong/an_yes.png")
	GUI:Button_setTitleText(Button_Yes, [[]])
	GUI:Button_setTitleColor(Button_Yes, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Yes, 16)
	GUI:Button_titleEnableOutline(Button_Yes, "#000000", 1)
	GUI:setAnchorPoint(Button_Yes, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Yes, true)
	GUI:setTag(Button_Yes, 0)

	-- Create Button_No
	local Button_No = GUI:Button_Create(Ask_bg, "Button_No", 231.00, 36.00, "res/custom/qiyuxitong/an_no.png")
	GUI:Button_setTitleText(Button_No, [[]])
	GUI:Button_setTitleColor(Button_No, "#ffffff")
	GUI:Button_setTitleFontSize(Button_No, 16)
	GUI:Button_titleEnableOutline(Button_No, "#000000", 1)
	GUI:setAnchorPoint(Button_No, 0.00, 0.00)
	GUI:setTouchEnabled(Button_No, true)
	GUI:setTag(Button_No, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
