local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 1.00, "res/custom/mohuatianshi/jm_1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 839.00, 494.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/mohuatianshi/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create item_1
	local item_1 = GUI:Layout_Create(ImageBG, "item_1", 400.00, 363.00, 52, 52, false)
	GUI:setAnchorPoint(item_1, 0.00, 0.00)
	GUI:setTouchEnabled(item_1, true)
	GUI:setTag(item_1, 0)

	-- Create item_2
	local item_2 = GUI:Layout_Create(ImageBG, "item_2", 784.00, 363.00, 52, 52, false)
	GUI:setAnchorPoint(item_2, 0.00, 0.00)
	GUI:setTouchEnabled(item_2, true)
	GUI:setTag(item_2, 0)

	-- Create item_3
	local item_3 = GUI:Layout_Create(ImageBG, "item_3", 400.00, 251.00, 52, 52, false)
	GUI:setAnchorPoint(item_3, 0.00, 0.00)
	GUI:setTouchEnabled(item_3, true)
	GUI:setTag(item_3, 0)

	-- Create item_4
	local item_4 = GUI:Layout_Create(ImageBG, "item_4", 784.00, 251.00, 52, 52, false)
	GUI:setAnchorPoint(item_4, 0.00, 0.00)
	GUI:setTouchEnabled(item_4, true)
	GUI:setTag(item_4, 0)

	-- Create item_5
	local item_5 = GUI:Layout_Create(ImageBG, "item_5", 628.00, 327.00, 52, 52, false)
	GUI:setAnchorPoint(item_5, 0.00, 0.00)
	GUI:setTouchEnabled(item_5, true)
	GUI:setTag(item_5, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 522.00, 115.00, "res/custom/mohuatianshi/an_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Effect_1
	local Effect_1 = GUI:Layout_Create(ImageBG, "Effect_1", 220.00, 220.00, 41, 41, false)
	GUI:setAnchorPoint(Effect_1, 0.00, 0.00)
	GUI:setTouchEnabled(Effect_1, true)
	GUI:setTag(Effect_1, 0)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
