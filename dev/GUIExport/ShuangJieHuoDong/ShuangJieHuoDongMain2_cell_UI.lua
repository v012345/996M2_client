local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Image_list
	local Image_list = GUI:Image_Create(parent, "Image_list", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/2/list_bg.png")
	GUI:setAnchorPoint(Image_list, 0.00, 0.00)
	GUI:setTouchEnabled(Image_list, false)
	GUI:setTag(Image_list, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Image_list, "Panel_1", 65.00, 167.00, 67, 66, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Image_list, "Panel_2", 33.00, 92.00, 156, 58, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Image_list, "Image_1", 104.00, 250.00, "res/custom/ShuangJieHuoDongMain/2/day_1.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Image_list, "Button_1", 30.00, 14.00, "res/custom/ShuangJieHuoDongMain/2/btn_lingqu1.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/custom/ShuangJieHuoDongMain/1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return Image_list
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
