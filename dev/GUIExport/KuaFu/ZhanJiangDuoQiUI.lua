local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 147.00, 33.00, "res/custom/ZhanJiangDuoQi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 807.00, 421.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 554.00, 27.00, "res/custom/ZhanJiangDuoQi/enterbtn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 312.00, 116.00, 140, 204, 1)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(ImageBG, "ListView_2", 137.00, 116.00, 140, 204, 1)
	GUI:setAnchorPoint(ListView_2, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 0)

	-- Create Button_lingQu
	local Button_lingQu = GUI:Button_Create(ImageBG, "Button_lingQu", 204.00, 33.00, "res/custom/ZhanJiangDuoQi/lingqu.png")
	GUI:Button_setTitleText(Button_lingQu, [[]])
	GUI:Button_setTitleColor(Button_lingQu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_lingQu, 16)
	GUI:Button_titleEnableOutline(Button_lingQu, "#000000", 1)
	GUI:setAnchorPoint(Button_lingQu, 0.00, 0.00)
	GUI:setTouchEnabled(Button_lingQu, true)
	GUI:setTag(Button_lingQu, 0)

	-- Create Button_Tips
	local Button_Tips = GUI:Button_Create(ImageBG, "Button_Tips", 237.00, 415.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(Button_Tips, [[]])
	GUI:Button_setTitleColor(Button_Tips, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Tips, 16)
	GUI:Button_titleEnableOutline(Button_Tips, "#000000", 1)
	GUI:setAnchorPoint(Button_Tips, 0.00, 0.00)
	GUI:setScale(Button_Tips, 0.60)
	GUI:setTouchEnabled(Button_Tips, true)
	GUI:setTag(Button_Tips, 0)

	-- Create Image_Tips
	local Image_Tips = GUI:Image_Create(ImageBG, "Image_Tips", 89.00, 243.00, "res/custom/ZhanJiangDuoQi/tips.png")
	GUI:setAnchorPoint(Image_Tips, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Tips, false)
	GUI:setTag(Image_Tips, 0)
	GUI:setVisible(Image_Tips, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
