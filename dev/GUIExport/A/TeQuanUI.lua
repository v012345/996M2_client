local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/TeQuan/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 870.00, 452.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 12.00, 10.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ButtonGet
	local ButtonGet = GUI:Button_Create(ImageBG, "ButtonGet", 621.00, 38.00, "res/custom/TeQuan/btn.png")
	GUI:Button_setTitleText(ButtonGet, [[]])
	GUI:Button_setTitleColor(ButtonGet, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGet, 14)
	GUI:Button_titleEnableOutline(ButtonGet, "#000000", 1)
	GUI:setAnchorPoint(ButtonGet, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonGet, true)
	GUI:setTag(ButtonGet, -1)

	-- Create Frames_1
	local Frames_1 = GUI:Frames_Create(ImageBG, "Frames_1", 394.00, 286.00, "res/custom/TeQuan/bf/bf", ".jpg", 1, 151, {count=151, speed=30, loop=-1, finishhide=0})
	GUI:setAnchorPoint(Frames_1, 0.50, 0.50)
	GUI:setTouchEnabled(Frames_1, false)
	GUI:setTag(Frames_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 216.00, 147.00, "res/custom/TeQuan/show.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create ChongZhiBeiJIng
	local ChongZhiBeiJIng = GUI:Layout_Create(ImageBG, "ChongZhiBeiJIng", 493.00, 292.00, 1920, 1080, false)
	GUI:Layout_setBackGroundColorType(ChongZhiBeiJIng, 1)
	GUI:Layout_setBackGroundColor(ChongZhiBeiJIng, "#000000")
	GUI:Layout_setBackGroundColorOpacity(ChongZhiBeiJIng, 76)
	GUI:setAnchorPoint(ChongZhiBeiJIng, 0.50, 0.50)
	GUI:setTouchEnabled(ChongZhiBeiJIng, false)
	GUI:setTag(ChongZhiBeiJIng, -1)
	GUI:setVisible(ChongZhiBeiJIng, false)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ChongZhiBeiJIng, "ImageView", 977.00, 516.00, "res/custom/public/picktypeui.png")
	GUI:setAnchorPoint(ImageView, 0.50, 0.50)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ChongZhi_text
	local ChongZhi_text = GUI:Text_Create(ImageView, "ChongZhi_text", 215.00, 148.00, 16, "#ffffff", [[充值金额：          元]])
	GUI:setAnchorPoint(ChongZhi_text, 0.50, 0.50)
	GUI:setTouchEnabled(ChongZhi_text, false)
	GUI:setTag(ChongZhi_text, -1)
	GUI:Text_enableOutline(ChongZhi_text, "#000000", 1)

	-- Create ChongZhi_Num
	local ChongZhi_Num = GUI:Text_Create(ImageView, "ChongZhi_Num", 243.00, 148.00, 16, "#10ff00", [[文本]])
	GUI:setAnchorPoint(ChongZhi_Num, 0.50, 0.50)
	GUI:setTouchEnabled(ChongZhi_Num, false)
	GUI:setTag(ChongZhi_Num, -1)
	GUI:Text_enableOutline(ChongZhi_Num, "#000000", 1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageView, "Button_1", 27.00, 52.00, "res/custom/public/type1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageView, "Button_2", 160.00, 52.00, "res/custom/public/type2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageView, "Button_3", 293.00, 52.00, "res/custom/public/type3.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
