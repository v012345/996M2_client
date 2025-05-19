local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/AnXiaoZhiYan/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 843.00, 491.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 4.00, -30.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create itemlooks1
	local itemlooks1 = GUI:Layout_Create(CloseLayout, "itemlooks1", -397.00, -108.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks1, true)
	GUI:setTag(itemlooks1, 0)

	-- Create itemlooks2
	local itemlooks2 = GUI:Layout_Create(CloseLayout, "itemlooks2", -240.00, -108.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks2, true)
	GUI:setTag(itemlooks2, 0)

	-- Create itemlooks3
	local itemlooks3 = GUI:Layout_Create(CloseLayout, "itemlooks3", -84.00, -108.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks3, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks3, true)
	GUI:setTag(itemlooks3, 0)

	-- Create itemlooks4
	local itemlooks4 = GUI:Layout_Create(CloseLayout, "itemlooks4", -209.00, -233.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks4, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks4, true)
	GUI:setTag(itemlooks4, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(CloseLayout, "Button_1", -314.00, -387.00, "res/custom/JuQing/btn25.png")
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
