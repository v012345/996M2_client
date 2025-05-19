local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_main
	local Panel_main = GUI:Layout_Create(parent, "Panel_main", 0.00, 0.00, 320, 34, false)
	GUI:setAnchorPoint(Panel_main, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_main, true)
	GUI:setTag(Panel_main, 0)

	-- Create Image_rankNumber
	local Image_rankNumber = GUI:Image_Create(Panel_main, "Image_rankNumber", 9.00, 0.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMaNpc/rankNumber/1.png")
	GUI:setAnchorPoint(Image_rankNumber, 0.00, 0.00)
	GUI:setTouchEnabled(Image_rankNumber, false)
	GUI:setTag(Image_rankNumber, 0)

	-- Create Text_name
	local Text_name = GUI:Text_Create(Panel_main, "Text_name", 148.00, 7.00, 16, "#fffc98", [[]])
	GUI:setAnchorPoint(Text_name, 0.50, 0.00)
	GUI:setTouchEnabled(Text_name, false)
	GUI:setTag(Text_name, 0)
	GUI:Text_enableOutline(Text_name, "#000000", 1)

	-- Create Text_time
	local Text_time = GUI:Text_Create(Panel_main, "Text_time", 243.00, 7.00, 16, "#4ae620", [[]])
	GUI:setAnchorPoint(Text_time, 0.00, 0.00)
	GUI:setTouchEnabled(Text_time, false)
	GUI:setTag(Text_time, 0)
	GUI:Text_enableOutline(Text_time, "#000000", 1)

	ui.update(__data__)
	return Panel_main
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
