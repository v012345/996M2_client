local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/MeiRiHuanJing/mbgbg3.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 840.00, 470.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create StateLooks1
	local StateLooks1 = GUI:Image_Create(ImageBG, "StateLooks1", 805.00, 255.00, "res/custom/HunDunBenYuan/kx1.png")
	GUI:setAnchorPoint(StateLooks1, 0.00, 0.00)
	GUI:setTouchEnabled(StateLooks1, false)
	GUI:setTag(StateLooks1, 0)

	-- Create StateLooks2
	local StateLooks2 = GUI:Image_Create(ImageBG, "StateLooks2", 391.00, 295.00, "res/custom/HunDunBenYuan/kx1.png")
	GUI:setAnchorPoint(StateLooks2, 0.00, 0.00)
	GUI:setTouchEnabled(StateLooks2, false)
	GUI:setTag(StateLooks2, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 574.00, 135.00, "res/custom/JuQing/btn10.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 213.00, 163.00, "res/custom/MeiRiHuanJing/button4.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create ItemLooks
	local ItemLooks = GUI:Layout_Create(ImageBG, "ItemLooks", 113.00, 63.00, 791, 77, false)
	GUI:setAnchorPoint(ItemLooks, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks, true)
	GUI:setTag(ItemLooks, 0)

	-- Create ItemShow_1
	local ItemShow_1 = GUI:ItemShow_Create(ImageBG, "ItemShow_1", 304.00, 256.00, {index = 10632, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_1, 0.50, 0.50)
	GUI:setTag(ItemShow_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
