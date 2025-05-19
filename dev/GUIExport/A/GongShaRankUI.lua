local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create left_bg
	local left_bg = GUI:Image_Create(parent, "left_bg", 0.00, 0.00, "res/custom/ShaChengZhanShenBang/left_top_bg.png")
	GUI:setAnchorPoint(left_bg, 0.00, 0.00)
	GUI:setTouchEnabled(left_bg, false)
	GUI:setTag(left_bg, 0)

	-- Create Text_MyRank
	local Text_MyRank = GUI:Text_Create(left_bg, "Text_MyRank", 60.00, 1.00, 14, "#eedd23", [[]])
	GUI:setAnchorPoint(Text_MyRank, 0.00, 0.00)
	GUI:setTouchEnabled(Text_MyRank, false)
	GUI:setTag(Text_MyRank, 0)
	GUI:Text_enableOutline(Text_MyRank, "#000000", 1)

	-- Create Text_MyPoint
	local Text_MyPoint = GUI:Text_Create(left_bg, "Text_MyPoint", 147.00, 1.00, 14, "#eedd23", [[]])
	GUI:setAnchorPoint(Text_MyPoint, 0.00, 0.00)
	GUI:setTouchEnabled(Text_MyPoint, false)
	GUI:setTag(Text_MyPoint, 0)
	GUI:Text_enableOutline(Text_MyPoint, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(left_bg, "ListView_1", 0.00, 20.00, 200, 143, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	ui.update(__data__)
	return left_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
