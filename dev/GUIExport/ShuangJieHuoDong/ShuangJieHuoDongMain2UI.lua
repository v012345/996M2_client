local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/2/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 3.00, 7.00, 652, 320, 2)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:ListView_setGravity(ListView_1, 3)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ListView_1, "Panel_1", 0.00, 0.00, 652, 320, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 3.00, 153.00, "res/custom/ShuangJieHuoDongMain/2/left1.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_2_1
	local Image_2_1 = GUI:Image_Create(ImageBG, "Image_2_1", 631.00, 153.00, "res/custom/ShuangJieHuoDongMain/2/right1.png")
	GUI:setAnchorPoint(Image_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2_1, false)
	GUI:setTag(Image_2_1, 0)

	-- Create Panel_give
	local Panel_give = GUI:Layout_Create(ImageBG, "Panel_give", 435.00, 340.00, 60, 60, false)
	GUI:setAnchorPoint(Panel_give, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_give, true)
	GUI:setTag(Panel_give, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 503.00, 350.00, "res/custom/ShuangJieHuoDongMain/2/btn_lingqu2.png")
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
