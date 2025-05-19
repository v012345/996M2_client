local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create txdy_left_bg
	local txdy_left_bg = GUI:Image_Create(parent, "txdy_left_bg", 0.00, 0.00, "res/custom/ZhanJiangDuoQi/rank/bg.png")
	GUI:setAnchorPoint(txdy_left_bg, 0.00, 0.00)
	GUI:setTouchEnabled(txdy_left_bg, false)
	GUI:setTag(txdy_left_bg, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(txdy_left_bg, "ListView_1", 4.00, 34.00, 195, 126, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Text_MyRank
	local Text_MyRank = GUI:Text_Create(txdy_left_bg, "Text_MyRank", 10.00, 8.00, 14, "#eedd23", [[我的排名：]])
	GUI:setAnchorPoint(Text_MyRank, 0.00, 0.00)
	GUI:setTouchEnabled(Text_MyRank, false)
	GUI:setTag(Text_MyRank, 0)
	GUI:Text_enableOutline(Text_MyRank, "#000000", 1)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(Text_MyRank, "Text_4", 65.00, -1.00, 14, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, 0)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Text_MyPoint
	local Text_MyPoint = GUI:Text_Create(txdy_left_bg, "Text_MyPoint", 93.00, 8.00, 14, "#eedd23", [[我的积分：]])
	GUI:setAnchorPoint(Text_MyPoint, 0.00, 0.00)
	GUI:setTouchEnabled(Text_MyPoint, false)
	GUI:setTag(Text_MyPoint, 0)
	GUI:Text_enableOutline(Text_MyPoint, "#000000", 1)

	-- Create Text_5
	local Text_5 = GUI:Text_Create(Text_MyPoint, "Text_5", 65.00, -1.00, 14, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_5, false)
	GUI:setTag(Text_5, 0)
	GUI:Text_enableOutline(Text_5, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(txdy_left_bg, "Text_1", 9.00, 164.00, 14, "#ffffff", [[排名]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(txdy_left_bg, "Text_2", 85.00, 164.00, 14, "#ffffff", [[玩家]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(txdy_left_bg, "Text_3", 159.00, 164.00, 14, "#ffffff", [[积分]])
	GUI:setAnchorPoint(Text_3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	ui.update(__data__)
	return txdy_left_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
