local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/qiyuxitong/jm/jm_15_1.png")
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

	-- Create price
	local price = GUI:Node_Create(ImageBG, "price", 0.00, 0.00)
	GUI:setTag(price, 0)

	-- Create price_1
	local price_1 = GUI:Text_Create(price, "price_1", 523.00, 277.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_1, "#000000", 1)
	GUI:setAnchorPoint(price_1, 0.50, 0.50)
	GUI:setTouchEnabled(price_1, false)
	GUI:setTag(price_1, 0)

	-- Create price_2
	local price_2 = GUI:Text_Create(price, "price_2", 629.00, 277.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_2, "#000000", 1)
	GUI:setAnchorPoint(price_2, 0.50, 0.50)
	GUI:setTouchEnabled(price_2, false)
	GUI:setTag(price_2, 0)

	-- Create price_3
	local price_3 = GUI:Text_Create(price, "price_3", 737.00, 277.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_3, "#000000", 1)
	GUI:setAnchorPoint(price_3, 0.50, 0.50)
	GUI:setTouchEnabled(price_3, false)
	GUI:setTag(price_3, 0)

	-- Create price_4
	local price_4 = GUI:Text_Create(price, "price_4", 843.00, 277.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_4, "#000000", 1)
	GUI:setAnchorPoint(price_4, 0.50, 0.50)
	GUI:setTouchEnabled(price_4, false)
	GUI:setTag(price_4, 0)

	-- Create price_5
	local price_5 = GUI:Text_Create(price, "price_5", 523.00, 113.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_5, "#000000", 1)
	GUI:setAnchorPoint(price_5, 0.50, 0.50)
	GUI:setTouchEnabled(price_5, false)
	GUI:setTag(price_5, 0)

	-- Create price_6
	local price_6 = GUI:Text_Create(price, "price_6", 629.00, 113.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_6, "#000000", 1)
	GUI:setAnchorPoint(price_6, 0.50, 0.50)
	GUI:setTouchEnabled(price_6, false)
	GUI:setTag(price_6, 0)

	-- Create price_7
	local price_7 = GUI:Text_Create(price, "price_7", 735.00, 113.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_7, "#000000", 1)
	GUI:setAnchorPoint(price_7, 0.50, 0.50)
	GUI:setTouchEnabled(price_7, false)
	GUI:setTag(price_7, 0)

	-- Create price_8
	local price_8 = GUI:Text_Create(price, "price_8", 841.00, 113.00, 15, "#ffff00", [[限购:0/3次]])
	GUI:Text_enableOutline(price_8, "#000000", 1)
	GUI:setAnchorPoint(price_8, 0.50, 0.50)
	GUI:setTouchEnabled(price_8, false)
	GUI:setTag(price_8, 0)

	-- Create Button
	local Button = GUI:Node_Create(ImageBG, "Button", 0.00, 0.00)
	GUI:setTag(Button, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Button, "Button_1", 478.00, 207.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_1, [[
]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Button, "Button_2", 584.00, 207.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_2, [[
]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Button, "Button_3", 691.00, 207.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_3, [[
]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Button, "Button_4", 797.00, 207.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_4, [[
]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Button, "Button_5", 478.00, 42.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_5, [[
]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Button, "Button_6", 584.00, 42.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_6, [[
]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Button, "Button_7", 691.00, 42.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_7, [[
]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(Button, "Button_8", 797.00, 42.00, "res/custom/qiyuxitong/an/an26.png")
	GUI:Button_setTitleText(Button_8, [[
]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)

	-- Create items
	local items = GUI:Node_Create(ImageBG, "items", 0.00, 0.00)
	GUI:setTag(items, 0)

	-- Create items_1
	local items_1 = GUI:Layout_Create(items, "items_1", 525.00, 320.00, 62, 62, false)
	GUI:setAnchorPoint(items_1, 0.00, 0.00)
	GUI:setTouchEnabled(items_1, true)
	GUI:setTag(items_1, 0)

	-- Create items_2
	local items_2 = GUI:Layout_Create(items, "items_2", 630.00, 320.00, 62, 62, false)
	GUI:setAnchorPoint(items_2, 0.00, 0.00)
	GUI:setTouchEnabled(items_2, true)
	GUI:setTag(items_2, 0)

	-- Create items_3
	local items_3 = GUI:Layout_Create(items, "items_3", 738.00, 320.00, 62, 62, false)
	GUI:setAnchorPoint(items_3, 0.00, 0.00)
	GUI:setTouchEnabled(items_3, true)
	GUI:setTag(items_3, 0)

	-- Create items_4
	local items_4 = GUI:Layout_Create(items, "items_4", 843.00, 320.00, 62, 62, false)
	GUI:setAnchorPoint(items_4, 0.00, 0.00)
	GUI:setTouchEnabled(items_4, true)
	GUI:setTag(items_4, 0)

	-- Create items_5
	local items_5 = GUI:Layout_Create(items, "items_5", 525.00, 156.00, 62, 62, false)
	GUI:setAnchorPoint(items_5, 0.00, 0.00)
	GUI:setTouchEnabled(items_5, true)
	GUI:setTag(items_5, 0)

	-- Create items_6
	local items_6 = GUI:Layout_Create(items, "items_6", 630.00, 156.00, 62, 62, false)
	GUI:setAnchorPoint(items_6, 0.00, 0.00)
	GUI:setTouchEnabled(items_6, true)
	GUI:setTag(items_6, 0)

	-- Create items_7
	local items_7 = GUI:Layout_Create(items, "items_7", 737.00, 156.00, 62, 62, false)
	GUI:setAnchorPoint(items_7, 0.00, 0.00)
	GUI:setTouchEnabled(items_7, true)
	GUI:setTag(items_7, 0)

	-- Create items_8
	local items_8 = GUI:Layout_Create(items, "items_8", 843.00, 156.00, 62, 62, false)
	GUI:setAnchorPoint(items_8, 0.00, 0.00)
	GUI:setTouchEnabled(items_8, true)
	GUI:setTag(items_8, 0)

	-- Create numlook
	local numlook = GUI:Node_Create(ImageBG, "numlook", 0.00, -19.00)
	GUI:setTag(numlook, 0)

	-- Create numlook_1
	local numlook_1 = GUI:Text_Create(numlook, "numlook_1", 523.00, 277.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_1, "#000000", 1)
	GUI:setAnchorPoint(numlook_1, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_1, false)
	GUI:setTag(numlook_1, 0)

	-- Create numlook_2
	local numlook_2 = GUI:Text_Create(numlook, "numlook_2", 630.00, 277.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_2, "#000000", 1)
	GUI:setAnchorPoint(numlook_2, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_2, false)
	GUI:setTag(numlook_2, 0)

	-- Create numlook_3
	local numlook_3 = GUI:Text_Create(numlook, "numlook_3", 737.00, 277.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_3, "#000000", 1)
	GUI:setAnchorPoint(numlook_3, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_3, false)
	GUI:setTag(numlook_3, 0)

	-- Create numlook_4
	local numlook_4 = GUI:Text_Create(numlook, "numlook_4", 843.00, 277.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_4, "#000000", 1)
	GUI:setAnchorPoint(numlook_4, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_4, false)
	GUI:setTag(numlook_4, 0)

	-- Create numlook_5
	local numlook_5 = GUI:Text_Create(numlook, "numlook_5", 523.00, 113.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_5, "#000000", 1)
	GUI:setAnchorPoint(numlook_5, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_5, false)
	GUI:setTag(numlook_5, 0)

	-- Create numlook_6
	local numlook_6 = GUI:Text_Create(numlook, "numlook_6", 629.00, 113.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_6, "#000000", 1)
	GUI:setAnchorPoint(numlook_6, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_6, false)
	GUI:setTag(numlook_6, 0)

	-- Create numlook_7
	local numlook_7 = GUI:Text_Create(numlook, "numlook_7", 735.00, 113.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_7, "#000000", 1)
	GUI:setAnchorPoint(numlook_7, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_7, false)
	GUI:setTag(numlook_7, 0)

	-- Create numlook_8
	local numlook_8 = GUI:Text_Create(numlook, "numlook_8", 841.00, 113.00, 16, "#00ff40", [[限购:0/3次]])
	GUI:Text_enableOutline(numlook_8, "#000000", 1)
	GUI:setAnchorPoint(numlook_8, 0.50, 0.50)
	GUI:setTouchEnabled(numlook_8, false)
	GUI:setTag(numlook_8, 0)

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
