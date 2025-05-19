local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/XueSeKuangNu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 757.00, 438.00, 86, 86, false)
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

	-- Create ItemLooks1
	local ItemLooks1 = GUI:Layout_Create(ImageBG, "ItemLooks1", 459.00, 285.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks1, true)
	GUI:setTag(ItemLooks1, 0)

	-- Create ItemLooks2
	local ItemLooks2 = GUI:Layout_Create(ImageBG, "ItemLooks2", 651.00, 285.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks2, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks2, true)
	GUI:setTag(ItemLooks2, 0)

	-- Create ItemLooks3
	local ItemLooks3 = GUI:Layout_Create(ImageBG, "ItemLooks3", 572.00, 104.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks3, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks3, true)
	GUI:setTag(ItemLooks3, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 435.00, 183.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setScale(Button_1, 0.90)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 430.00, 183.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setScale(Image_1, 0.40)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 626.00, 183.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setScale(Button_2, 0.90)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 622.00, 183.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setScale(Image_2, 0.40)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
