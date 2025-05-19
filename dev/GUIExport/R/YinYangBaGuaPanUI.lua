local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 12.00, 24.00, "res/custom/JuQing/YinYangBaGuaPan/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 831.00, 436.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 211.00, 97.00, "res/custom/JuQing/btn35.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 561.00, 97.00, "res/custom/JuQing/btn34.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 267.00, 175.00, 177, 60, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 617.00, 176.00, 154, 60, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(ImageBG, "Panel_3", 488.00, 37.00, 60, 60, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 183.00, 239.00, "res/custom/JuQing/YinYangBaGuaPan/jindubg.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(Image_1, "LoadingBar_1", 46.00, 12.00, "res/custom/JuQing/YinYangBaGuaPan/jindu1.png", 1)
	GUI:LoadingBar_setPercent(LoadingBar_1, 0)
	GUI:LoadingBar_setColor(LoadingBar_1, "#ffffff")
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create LoadingBar_2
	local LoadingBar_2 = GUI:LoadingBar_Create(Image_1, "LoadingBar_2", 375.00, 12.00, "res/custom/JuQing/YinYangBaGuaPan/jindu2.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar_2, 0)
	GUI:LoadingBar_setColor(LoadingBar_2, "#ffffff")
	GUI:setAnchorPoint(LoadingBar_2, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_2, false)
	GUI:setTag(LoadingBar_2, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Image_1, "Text_1", 321.00, 16.00, 18, "#3ef8fa", [[66]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Image_1, "Text_2", 355.00, 16.00, 18, "#f2d638", [[66]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
