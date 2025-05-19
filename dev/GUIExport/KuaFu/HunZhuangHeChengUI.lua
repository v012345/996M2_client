local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 30.00, 30.00, "res/custom/HunZhuangHeCheng/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 932.00, 477.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 575.00, 54.00, "res/custom/HunZhuangHeCheng/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 535.00, 138.00, "res/custom/HunZhuangHeCheng/costBg1.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 682.00, 354.00, 307, 82, false)
	GUI:setAnchorPoint(Panel_1, 0.50, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 74.00, 32.00, 193, 442, 1)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, false)
	GUI:setTag(ListView_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ListView_1, "Button_2", 0.00, 368.00, "res/custom/HunZhuangHeCheng/left_btn/btn_1_1.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/custom/HunZhuangHeCheng/left_btn/btn_1.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(ImageBG, "ListView_2", 273.00, 31.00, 157, 446, 1)
	GUI:setAnchorPoint(ListView_2, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_2, false)
	GUI:setTag(ListView_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ListView_2, "Button_3", 0.00, 404.00, "res/custom/HunZhuangHeCheng/1/btn_1.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Button_3, "Image_1", 0.00, 0.00, "res/custom/HunZhuangHeCheng/select.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 652.00, 181.00, 67, 68, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
