local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 1.00, 0.00, "res/custom/JuQing/LiuDaoXianRen/jm2.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 784.00, 466.00, 86, 86, false)
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

	-- Create itemshow_1
	local itemshow_1 = GUI:Layout_Create(ImageBG, "itemshow_1", 458.00, 366.00, 60, 60, false)
	GUI:setAnchorPoint(itemshow_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemshow_1, true)
	GUI:setTag(itemshow_1, 0)

	-- Create itemshow_2
	local itemshow_2 = GUI:Layout_Create(ImageBG, "itemshow_2", 574.00, 366.00, 60, 60, false)
	GUI:setAnchorPoint(itemshow_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemshow_2, true)
	GUI:setTag(itemshow_2, 0)

	-- Create itemshow_3
	local itemshow_3 = GUI:Layout_Create(ImageBG, "itemshow_3", 692.00, 366.00, 60, 60, false)
	GUI:setAnchorPoint(itemshow_3, 0.00, 0.00)
	GUI:setTouchEnabled(itemshow_3, true)
	GUI:setTag(itemshow_3, 0)

	-- Create itemlook_1
	local itemlook_1 = GUI:Layout_Create(ImageBG, "itemlook_1", 356.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_1, true)
	GUI:setTag(itemlook_1, 0)

	-- Create itemlook_2
	local itemlook_2 = GUI:Layout_Create(ImageBG, "itemlook_2", 437.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_2, true)
	GUI:setTag(itemlook_2, 0)

	-- Create itemlook_3
	local itemlook_3 = GUI:Layout_Create(ImageBG, "itemlook_3", 518.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_3, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_3, true)
	GUI:setTag(itemlook_3, 0)

	-- Create itemlook_4
	local itemlook_4 = GUI:Layout_Create(ImageBG, "itemlook_4", 599.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_4, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_4, true)
	GUI:setTag(itemlook_4, 0)

	-- Create itemlook_5
	local itemlook_5 = GUI:Layout_Create(ImageBG, "itemlook_5", 681.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_5, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_5, true)
	GUI:setTag(itemlook_5, 0)

	-- Create itemlook_6
	local itemlook_6 = GUI:Layout_Create(ImageBG, "itemlook_6", 761.00, 204.00, 60, 60, false)
	GUI:setAnchorPoint(itemlook_6, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_6, true)
	GUI:setTag(itemlook_6, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 477.00, 85.00, "res/custom/JuQing/btn32.png")
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
