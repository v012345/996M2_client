local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Imagelist
	local Imagelist = GUI:Image_Create(parent, "Imagelist", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/4/bglist.png")
	GUI:setAnchorPoint(Imagelist, 0.00, 0.00)
	GUI:setTouchEnabled(Imagelist, false)
	GUI:setTag(Imagelist, -1)

	-- Create Text_title
	local Text_title = GUI:Text_Create(Imagelist, "Text_title", 78.00, 163.00, 14, "#efdd61", [[]])
	GUI:setAnchorPoint(Text_title, 0.50, 0.00)
	GUI:setTouchEnabled(Text_title, false)
	GUI:setTag(Text_title, 0)
	GUI:Text_enableOutline(Text_title, "#000000", 1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Imagelist, "Panel_1", 43.00, 98.00, 60, 60, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Imagelist, "Panel_2", 107.00, 81.00, 60, 17, false)
	GUI:setAnchorPoint(Panel_2, 0.50, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Imagelist, "Button_1", 30.00, 13.00, "res/custom/ShuangJieHuoDongMain/4/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_setTitleFontName(Button_1, "fonts/stfont.fnt")
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return Imagelist
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
