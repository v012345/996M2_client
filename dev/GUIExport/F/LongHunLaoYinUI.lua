local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/LongHunLaoYin/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 804.00, 435.00, 86, 86, false)
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

	-- Create ItemLooks_1
	local ItemLooks_1 = GUI:Layout_Create(ImageBG, "ItemLooks_1", 149.00, 189.00, 140, 51, false)
	GUI:setAnchorPoint(ItemLooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_1, true)
	GUI:setTag(ItemLooks_1, 0)

	-- Create ItemLooks_2
	local ItemLooks_2 = GUI:Layout_Create(ImageBG, "ItemLooks_2", 381.00, 189.00, 140, 51, false)
	GUI:setAnchorPoint(ItemLooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_2, true)
	GUI:setTag(ItemLooks_2, 0)

	-- Create ItemLooks_3
	local ItemLooks_3 = GUI:Layout_Create(ImageBG, "ItemLooks_3", 613.00, 189.00, 140, 51, false)
	GUI:setAnchorPoint(ItemLooks_3, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_3, true)
	GUI:setTag(ItemLooks_3, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 141.00, 85.00, "res/custom/JuQing/LongHunLaoYin/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 373.00, 85.00, "res/custom/JuQing/LongHunLaoYin/button.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 605.00, 85.00, "res/custom/JuQing/LongHunLaoYin/button.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 135.00, 169.00, "res/custom/JuQing/LongHunLaoYin/laoyin.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 367.00, 169.00, "res/custom/JuQing/LongHunLaoYin/laoyin.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(ImageBG, "Image_3", 599.00, 169.00, "res/custom/JuQing/LongHunLaoYin/laoyin.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
