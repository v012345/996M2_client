local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -1.00, 0.00, "res/custom/ShuangJieHuoDongMain/MiLuBaoZang/bg1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 873.00, 412.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NumShow
	local NumShow = GUI:Text_Create(ImageBG, "NumShow", 680.00, 204.00, 22, "#00ff00", [[3/8]])
	GUI:Text_enableOutline(NumShow, "#000000", 1)
	GUI:setAnchorPoint(NumShow, 0.50, 0.50)
	GUI:setTouchEnabled(NumShow, false)
	GUI:setTag(NumShow, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 575.00, 85.00, "res/custom/ShuangJieHuoDongMain/MiLuBaoZang/button_jr.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_OpenIncUI
	local Button_OpenIncUI = GUI:Button_Create(ImageBG, "Button_OpenIncUI", 740.00, 187.00, "res/custom/ShuangJieHuoDongMain/MiLuBaoZang/button_inc1.png")
	GUI:Button_setTitleText(Button_OpenIncUI, [[]])
	GUI:Button_setTitleColor(Button_OpenIncUI, "#ffffff")
	GUI:Button_setTitleFontSize(Button_OpenIncUI, 16)
	GUI:Button_titleEnableOutline(Button_OpenIncUI, "#000000", 1)
	GUI:setAnchorPoint(Button_OpenIncUI, 0.00, 0.00)
	GUI:setTouchEnabled(Button_OpenIncUI, true)
	GUI:setTag(Button_OpenIncUI, 0)

	-- Create IncUI
	local IncUI = GUI:Image_Create(ImageBG, "IncUI", 232.00, 105.00, "res/custom/ShuangJieHuoDongMain/MiLuBaoZang/bg2.png")
	GUI:setAnchorPoint(IncUI, 0.00, 0.00)
	GUI:setTouchEnabled(IncUI, false)
	GUI:setTag(IncUI, 0)
	GUI:setVisible(IncUI, false)

	-- Create Button_Close
	local Button_Close = GUI:Button_Create(IncUI, "Button_Close", 588.00, 193.00, "res/custom/ceshijilu/close.png")
	GUI:Button_setTitleText(Button_Close, [[]])
	GUI:Button_setTitleColor(Button_Close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Close, 16)
	GUI:Button_titleEnableOutline(Button_Close, "#000000", 1)
	GUI:setAnchorPoint(Button_Close, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Close, true)
	GUI:setTag(Button_Close, 0)

	-- Create NumLooks
	local NumLooks = GUI:Text_Create(IncUI, "NumLooks", 534.00, 76.00, 19, "#00ff00", [[5]])
	GUI:Text_enableOutline(NumLooks, "#000000", 1)
	GUI:setAnchorPoint(NumLooks, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks, false)
	GUI:setTag(NumLooks, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(IncUI, "Button_2", 203.00, 37.00, "res/custom/ShuangJieHuoDongMain/MiLuBaoZang/button_inc2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
