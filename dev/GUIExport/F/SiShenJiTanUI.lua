local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/SiShenJiTan/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 834.00, 429.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create itemlooks_1
	local itemlooks_1 = GUI:Layout_Create(ImageBG, "itemlooks_1", 598.00, 335.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_1, true)
	GUI:setTag(itemlooks_1, 0)

	-- Create itemlooks_2
	local itemlooks_2 = GUI:Layout_Create(ImageBG, "itemlooks_2", 720.00, 335.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_2, true)
	GUI:setTag(itemlooks_2, 0)

	-- Create itemlooks_3
	local itemlooks_3 = GUI:Layout_Create(ImageBG, "itemlooks_3", 568.00, 184.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_3, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_3, true)
	GUI:setTag(itemlooks_3, 0)

	-- Create itemlooks_4
	local itemlooks_4 = GUI:Layout_Create(ImageBG, "itemlooks_4", 690.00, 184.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_4, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_4, true)
	GUI:setTag(itemlooks_4, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 560.00, 58.00, "res/custom/JuQing/btn56.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
