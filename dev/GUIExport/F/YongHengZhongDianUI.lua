local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -2.00, 0.00, "res/custom/JuQing/YongHengDeZhongDian/jm2.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 796.00, 443.00, 86, 86, false)
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
	local itemlooks_1 = GUI:Layout_Create(ImageBG, "itemlooks_1", 95.00, 239.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_1, true)
	GUI:setTag(itemlooks_1, 0)

	-- Create itemlooks_2
	local itemlooks_2 = GUI:Layout_Create(ImageBG, "itemlooks_2", 236.00, 239.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_2, true)
	GUI:setTag(itemlooks_2, 0)

	-- Create itemlooks_3
	local itemlooks_3 = GUI:Layout_Create(ImageBG, "itemlooks_3", 376.00, 239.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_3, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_3, true)
	GUI:setTag(itemlooks_3, 0)

	-- Create itemlooks_4
	local itemlooks_4 = GUI:Layout_Create(ImageBG, "itemlooks_4", 769.00, 127.00, 62, 62, false)
	GUI:setAnchorPoint(itemlooks_4, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_4, true)
	GUI:setTag(itemlooks_4, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 57.00, 138.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 57.00, 138.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setScaleX(Image_1, 0.40)
	GUI:setScaleY(Image_1, 0.40)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 198.00, 138.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 198.00, 138.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setScaleX(Image_2, 0.40)
	GUI:setScaleY(Image_2, 0.40)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 339.00, 138.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(ImageBG, "Image_3", 339.00, 138.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setScaleX(Image_3, 0.40)
	GUI:setScaleY(Image_3, 0.40)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(ImageBG, "Button_4", 567.00, 61.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(ImageBG, "Image_4", 747.00, 96.00, "res/custom/JuQing/state.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
