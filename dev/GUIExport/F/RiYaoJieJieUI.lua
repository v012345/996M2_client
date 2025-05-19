local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 1.00, 1.00, "res/custom/JuQing/RiYaoJieJie/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 772.00, 445.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 1.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create itemlook_1
	local itemlook_1 = GUI:Layout_Create(ImageBG, "itemlook_1", 122.00, 229.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_1, true)
	GUI:setTag(itemlook_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 84.00, 133.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 84.00, 133.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setScaleX(Image_1, 0.40)
	GUI:setScaleY(Image_1, 0.40)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create itemlook_2
	local itemlook_2 = GUI:Layout_Create(ImageBG, "itemlook_2", 281.00, 228.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_2, true)
	GUI:setTag(itemlook_2, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 243.00, 133.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 243.00, 133.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setScaleX(Image_2, 0.40)
	GUI:setScaleY(Image_2, 0.40)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create itemlook_3
	local itemlook_3 = GUI:Layout_Create(ImageBG, "itemlook_3", 439.00, 228.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_3, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_3, true)
	GUI:setTag(itemlook_3, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 402.00, 133.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(ImageBG, "Image_3", 402.00, 133.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setScaleX(Image_3, 0.40)
	GUI:setScaleY(Image_3, 0.40)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create itemlook_4
	local itemlook_4 = GUI:Layout_Create(ImageBG, "itemlook_4", 598.00, 229.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_4, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_4, true)
	GUI:setTag(itemlook_4, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(ImageBG, "Button_4", 561.00, 133.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(ImageBG, "Image_4", 561.00, 133.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setScaleX(Image_4, 0.40)
	GUI:setScaleY(Image_4, 0.40)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create itemlook_5
	local itemlook_5 = GUI:Layout_Create(ImageBG, "itemlook_5", 756.00, 229.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_5, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_5, true)
	GUI:setTag(itemlook_5, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(ImageBG, "Button_5", 720.00, 133.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(ImageBG, "Image_5", 720.00, 133.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setScaleX(Image_5, 0.40)
	GUI:setScaleY(Image_5, 0.40)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create itemlook_6
	local itemlook_6 = GUI:Layout_Create(ImageBG, "itemlook_6", 470.00, 96.00, 62, 62, false)
	GUI:setAnchorPoint(itemlook_6, 0.00, 0.00)
	GUI:setTouchEnabled(itemlook_6, true)
	GUI:setTag(itemlook_6, 0)

	-- Create TextAtlas_1
	local TextAtlas_1 = GUI:TextAtlas_Create(ImageBG, "TextAtlas_1", 561.00, 367.00, "100", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(TextAtlas_1, 0.50, 0.50)
	GUI:setTouchEnabled(TextAtlas_1, false)
	GUI:setTag(TextAtlas_1, 0)

	-- Create StateShow
	local StateShow = GUI:Image_Create(ImageBG, "StateShow", 475.00, 92.00, "res/custom/JuQing/state.png")
	GUI:setAnchorPoint(StateShow, 0.50, 0.50)
	GUI:setTouchEnabled(StateShow, false)
	GUI:setTag(StateShow, 0)
	GUI:setVisible(StateShow, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
