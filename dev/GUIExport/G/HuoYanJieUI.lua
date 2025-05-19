local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/BaDaLu/FuBen/bg2.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 855.00, 474.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ItemShow
	local ItemShow = GUI:Layout_Create(ImageBG, "ItemShow", 522.00, 193.00, 209, 47, false)
	GUI:setAnchorPoint(ItemShow, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow, true)
	GUI:setTag(ItemShow, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 528.00, 89.00, "res/custom/BaDaLu/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)
	GUI:setVisible(Button_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 535.00, 81.00, "res/custom/XiuXian/activate.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setScale(Image_1, 0.60)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)
	GUI:setVisible(Image_1, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
