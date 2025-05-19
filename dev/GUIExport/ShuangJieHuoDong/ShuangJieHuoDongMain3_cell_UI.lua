local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Imagelist
	local Imagelist = GUI:Image_Create(parent, "Imagelist", 6.00, 0.00, "res/custom/ShuangJieHuoDongMain/3/listbg.png")
	GUI:setAnchorPoint(Imagelist, 0.00, 0.00)
	GUI:setTouchEnabled(Imagelist, false)
	GUI:setTag(Imagelist, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Imagelist, "Image_1", 123.00, 29.00, "res/custom/ShuangJieHuoDongMain/3/money_1.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Imagelist, "Button_1", 522.00, 12.00, "res/custom/ShuangJieHuoDongMain/3/lingqu.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/custom/ShuangJieHuoDongMain/1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Imagelist, "Panel_1", 183.00, 7.00, 342, 42, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	ui.update(__data__)
	return Imagelist
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
