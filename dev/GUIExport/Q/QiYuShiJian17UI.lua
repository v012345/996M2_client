local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/qiyuxitong/jm/jm_17_1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 890.00, 344.00, 75, 75, false)
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

	-- Create Button
	local Button = GUI:Node_Create(ImageBG, "Button", 0.00, 0.00)
	GUI:setTag(Button, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Button, "Button_1", 812.00, 314.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_1, [[
]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Button, "Button_2", 812.00, 260.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_2, [[
]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Button, "Button_3", 812.00, 204.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_3, [[
]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Button, "Button_4", 812.00, 149.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_4, [[
]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Button, "Button_5", 812.00, 94.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_5, [[
]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Button, "Button_6", 812.00, 38.00, "res/custom/qiyuxitong/an/an33.png")
	GUI:Button_setTitleText(Button_6, [[
]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create numlook
	local numlook = GUI:Node_Create(ImageBG, "numlook", 0.00, -19.00)
	GUI:setTag(numlook, 0)

	-- Create numlook_1
	local numlook_1 = GUI:Text_Create(numlook, "numlook_1", 762.00, 352.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_1, "#000000", 1)
	GUI:setAnchorPoint(numlook_1, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_1, false)
	GUI:setTag(numlook_1, 0)

	-- Create numlook_2
	local numlook_2 = GUI:Text_Create(numlook, "numlook_2", 762.00, 298.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_2, "#000000", 1)
	GUI:setAnchorPoint(numlook_2, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_2, false)
	GUI:setTag(numlook_2, 0)

	-- Create numlook_3
	local numlook_3 = GUI:Text_Create(numlook, "numlook_3", 762.00, 242.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_3, "#000000", 1)
	GUI:setAnchorPoint(numlook_3, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_3, false)
	GUI:setTag(numlook_3, 0)

	-- Create numlook_4
	local numlook_4 = GUI:Text_Create(numlook, "numlook_4", 762.00, 188.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_4, "#000000", 1)
	GUI:setAnchorPoint(numlook_4, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_4, false)
	GUI:setTag(numlook_4, 0)

	-- Create numlook_5
	local numlook_5 = GUI:Text_Create(numlook, "numlook_5", 762.00, 133.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_5, "#000000", 1)
	GUI:setAnchorPoint(numlook_5, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_5, false)
	GUI:setTag(numlook_5, 0)

	-- Create numlook_6
	local numlook_6 = GUI:Text_Create(numlook, "numlook_6", 762.00, 78.00, 17, "#00ff40", [[0/3次]])
	GUI:Text_enableOutline(numlook_6, "#000000", 1)
	GUI:setAnchorPoint(numlook_6, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_6, false)
	GUI:setTag(numlook_6, 0)

	-- Create Ask_bg
	local Ask_bg = GUI:Image_Create(ImageBG, "Ask_bg", 352.00, 80.00, "res/custom/qiyuxitong/bg_ask.png")
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
