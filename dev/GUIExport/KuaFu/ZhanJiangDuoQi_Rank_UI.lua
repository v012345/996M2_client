local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create zjdq_rank
	local zjdq_rank = GUI:Image_Create(parent, "zjdq_rank", 0.00, 0.00, "res/custom/ZhanJiangDuoQi/rank/bg.png")
	GUI:setAnchorPoint(zjdq_rank, 0.00, 0.00)
	GUI:setTouchEnabled(zjdq_rank, true)
	GUI:setTag(zjdq_rank, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(zjdq_rank, "Button_1", 9.00, 151.00, "res/custom/ZhanJiangDuoQi/rank/btn_1_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(zjdq_rank, "Button_2", 104.00, 151.00, "res/custom/ZhanJiangDuoQi/rank/btn_2_2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(zjdq_rank, "Button_3", 22.00, 7.00, "res/custom/ZhanJiangDuoQi/rank/exit.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(zjdq_rank, "Button_4", 111.00, 7.00, "res/custom/ZhanJiangDuoQi/rank/look.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Text_8
	local Text_8 = GUI:Text_Create(zjdq_rank, "Text_8", 42.00, 38.00, 14, "#00ff00", [[剩余时间：]])
	GUI:setAnchorPoint(Text_8, 0.00, 0.00)
	GUI:setTouchEnabled(Text_8, false)
	GUI:setTag(Text_8, 0)
	GUI:Text_enableOutline(Text_8, "#000000", 1)

	-- Create Text_9
	local Text_9 = GUI:Text_Create(Text_8, "Text_9", 66.00, 0.00, 14, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_9, 0.00, 0.00)
	GUI:setTouchEnabled(Text_9, false)
	GUI:setTag(Text_9, 0)
	GUI:Text_enableOutline(Text_9, "#000000", 1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(zjdq_rank, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(Node_1, "Node_3", 0.00, 0.00)
	GUI:setTag(Node_3, 0)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(Node_3, "Text_4", 8.00, 60.00, 14, "#ffff00", [[个人排名:]])
	GUI:setAnchorPoint(Text_4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, 0)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Text_5
	local Text_5 = GUI:Text_Create(Text_4, "Text_5", 63.00, 0.00, 15, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_5, false)
	GUI:setTag(Text_5, 0)
	GUI:Text_enableOutline(Text_5, "#000000", 1)

	-- Create Text_6
	local Text_6 = GUI:Text_Create(Node_3, "Text_6", 91.00, 60.00, 14, "#ffff00", [[个人积分:]])
	GUI:setAnchorPoint(Text_6, 0.00, 0.00)
	GUI:setTouchEnabled(Text_6, false)
	GUI:setTag(Text_6, 0)
	GUI:Text_enableOutline(Text_6, "#000000", 1)

	-- Create Text_7
	local Text_7 = GUI:Text_Create(Text_6, "Text_7", 63.00, 0.00, 15, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_7, 0.00, 0.00)
	GUI:setTouchEnabled(Text_7, false)
	GUI:setTag(Text_7, 0)
	GUI:Text_enableOutline(Text_7, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(Node_1, "ListView_1", 7.00, 79.00, 188, 70, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(zjdq_rank, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, 0)
	GUI:setVisible(Node_2, false)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(Node_2, "ListView_2", 7.00, 79.00, 188, 70, 1)
	GUI:ListView_setBounceEnabled(ListView_2, true)
	GUI:setAnchorPoint(ListView_2, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(Node_2, "Node_4", 0.00, 0.00)
	GUI:setTag(Node_4, 0)

	-- Create Text_10
	local Text_10 = GUI:Text_Create(Node_4, "Text_10", 7.00, 60.00, 14, "#ffff00", [[行会排名:]])
	GUI:setAnchorPoint(Text_10, 0.00, 0.00)
	GUI:setTouchEnabled(Text_10, false)
	GUI:setTag(Text_10, 0)
	GUI:Text_enableOutline(Text_10, "#000000", 1)

	-- Create Text_11
	local Text_11 = GUI:Text_Create(Text_10, "Text_11", 63.00, 0.00, 15, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_11, 0.00, 0.00)
	GUI:setTouchEnabled(Text_11, false)
	GUI:setTag(Text_11, 0)
	GUI:Text_enableOutline(Text_11, "#000000", 1)

	-- Create Text_12
	local Text_12 = GUI:Text_Create(Node_4, "Text_12", 91.00, 60.00, 14, "#ffff00", [[行会积分:]])
	GUI:setAnchorPoint(Text_12, 0.00, 0.00)
	GUI:setTouchEnabled(Text_12, false)
	GUI:setTag(Text_12, 0)
	GUI:Text_enableOutline(Text_12, "#000000", 1)

	-- Create Text_13
	local Text_13 = GUI:Text_Create(Text_12, "Text_13", 63.00, 0.00, 15, "#ffffff", [[0]])
	GUI:setAnchorPoint(Text_13, 0.00, 0.00)
	GUI:setTouchEnabled(Text_13, false)
	GUI:setTag(Text_13, 0)
	GUI:Text_enableOutline(Text_13, "#000000", 1)

	ui.update(__data__)
	return zjdq_rank
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
