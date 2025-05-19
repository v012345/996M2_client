local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/LuoPanZhanBu/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 729.00, 464.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 366.00, 219.00, "res/custom/JuQing/LuoPanZhanBu/zb.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create AllNode
	local AllNode = GUI:Node_Create(ImageBG, "AllNode", 0.00, 0.00)
	GUI:setTag(AllNode, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(AllNode, "Node_1", 430.00, 413.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Att_Text_1_1
	local Att_Text_1_1 = GUI:Text_Create(Node_1, "Att_Text_1_1", 5.00, 42.00, 18, "#c0c0c0", [[打怪爆率+100%]])
	GUI:setAnchorPoint(Att_Text_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_1_1, false)
	GUI:setTag(Att_Text_1_1, 0)
	GUI:Text_enableOutline(Att_Text_1_1, "#000000", 1)

	-- Create Att_Text_1_2
	local Att_Text_1_2 = GUI:Text_Create(Node_1, "Att_Text_1_2", -27.00, 42.00, 18, "#00ff00", [[打怪爆率+100%]])
	GUI:setAnchorPoint(Att_Text_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_1_2, false)
	GUI:setTag(Att_Text_1_2, 0)
	GUI:Text_enableOutline(Att_Text_1_2, "#000000", 1)

	-- Create Att_Text_1_3
	local Att_Text_1_3 = GUI:Text_Create(Node_1, "Att_Text_1_3", 66.00, 42.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_1_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_1_3, false)
	GUI:setTag(Att_Text_1_3, 0)
	GUI:Text_enableOutline(Att_Text_1_3, "#000000", 1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(AllNode, "Node_2", 507.00, 391.00)
	GUI:setTag(Node_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_2, "Image_2", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Att_Text_2_1
	local Att_Text_2_1 = GUI:Text_Create(Node_2, "Att_Text_2_1", 152.00, -1.00, 18, "#c0c0c0", [[攻击速度+50%]])
	GUI:setAnchorPoint(Att_Text_2_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_2_1, false)
	GUI:setTag(Att_Text_2_1, 0)
	GUI:Text_enableOutline(Att_Text_2_1, "#000000", 1)

	-- Create Att_Text_2_2
	local Att_Text_2_2 = GUI:Text_Create(Node_2, "Att_Text_2_2", 125.00, -1.00, 18, "#00ff00", [[攻击速度+50%]])
	GUI:setAnchorPoint(Att_Text_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_2_2, false)
	GUI:setTag(Att_Text_2_2, 0)
	GUI:Text_enableOutline(Att_Text_2_2, "#000000", 1)

	-- Create Att_Text_2_3
	local Att_Text_2_3 = GUI:Text_Create(Node_2, "Att_Text_2_3", 213.00, -1.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_2_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_2_3, false)
	GUI:setTag(Att_Text_2_3, 0)
	GUI:Text_enableOutline(Att_Text_2_3, "#000000", 1)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(AllNode, "Node_3", 548.00, 331.00)
	GUI:setTag(Node_3, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_3, "Image_3", -39.00, -44.00, "res/custom/JuQing/LuoPanZhanBu/state3.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Att_Text_3_1
	local Att_Text_3_1 = GUI:Text_Create(Node_3, "Att_Text_3_1", 131.00, -3.00, 18, "#c0c0c0", [[最大攻击+10%]])
	GUI:setAnchorPoint(Att_Text_3_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_3_1, true)
	GUI:setTag(Att_Text_3_1, 0)
	GUI:Text_enableOutline(Att_Text_3_1, "#000000", 1)

	-- Create Att_Text_3_2
	local Att_Text_3_2 = GUI:Text_Create(Node_3, "Att_Text_3_2", 103.00, -3.00, 18, "#00ff00", [[最大攻击+10%]])
	GUI:setAnchorPoint(Att_Text_3_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_3_2, true)
	GUI:setTag(Att_Text_3_2, 0)
	GUI:Text_enableOutline(Att_Text_3_2, "#000000", 1)

	-- Create Att_Text_3_3
	local Att_Text_3_3 = GUI:Text_Create(Node_3, "Att_Text_3_3", 191.00, -3.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_3_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_3_3, true)
	GUI:setTag(Att_Text_3_3, 0)
	GUI:Text_enableOutline(Att_Text_3_3, "#000000", 1)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(AllNode, "Node_4", 548.00, 250.00)
	GUI:setTag(Node_4, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_4, "Image_4", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state4.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Att_Text_4_1
	local Att_Text_4_1 = GUI:Text_Create(Node_4, "Att_Text_4_1", 131.00, -1.00, 18, "#c0c0c0", [[最大血量+10%]])
	GUI:setAnchorPoint(Att_Text_4_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_4_1, false)
	GUI:setTag(Att_Text_4_1, 0)
	GUI:Text_enableOutline(Att_Text_4_1, "#000000", 1)

	-- Create Att_Text_4_2
	local Att_Text_4_2 = GUI:Text_Create(Node_4, "Att_Text_4_2", 102.00, -1.00, 18, "#00ff00", [[最大血量+10%]])
	GUI:setAnchorPoint(Att_Text_4_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_4_2, false)
	GUI:setTag(Att_Text_4_2, 0)
	GUI:Text_enableOutline(Att_Text_4_2, "#000000", 1)

	-- Create Att_Text_4_3
	local Att_Text_4_3 = GUI:Text_Create(Node_4, "Att_Text_4_3", 190.00, -1.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_4_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_4_3, false)
	GUI:setTag(Att_Text_4_3, 0)
	GUI:Text_enableOutline(Att_Text_4_3, "#000000", 1)

	-- Create Node_5
	local Node_5 = GUI:Node_Create(AllNode, "Node_5", 504.00, 190.00)
	GUI:setTag(Node_5, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_5, "Image_5", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state5.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Att_Text_5_1
	local Att_Text_5_1 = GUI:Text_Create(Node_5, "Att_Text_5_1", 156.00, 0.00, 18, "#c0c0c0", [[暴击几率+10%]])
	GUI:setAnchorPoint(Att_Text_5_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_5_1, false)
	GUI:setTag(Att_Text_5_1, 0)
	GUI:Text_enableOutline(Att_Text_5_1, "#000000", 1)

	-- Create Att_Text_5_2
	local Att_Text_5_2 = GUI:Text_Create(Node_5, "Att_Text_5_2", 126.00, 0.00, 18, "#00ff00", [[暴击几率+10%]])
	GUI:setAnchorPoint(Att_Text_5_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_5_2, false)
	GUI:setTag(Att_Text_5_2, 0)
	GUI:Text_enableOutline(Att_Text_5_2, "#000000", 1)

	-- Create Att_Text_5_3
	local Att_Text_5_3 = GUI:Text_Create(Node_5, "Att_Text_5_3", 214.00, 0.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_5_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_5_3, false)
	GUI:setTag(Att_Text_5_3, 0)
	GUI:Text_enableOutline(Att_Text_5_3, "#000000", 1)

	-- Create Node_6
	local Node_6 = GUI:Node_Create(AllNode, "Node_6", 429.00, 166.00)
	GUI:setTag(Node_6, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Node_6, "Image_6", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state6.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create Att_Text_6_1
	local Att_Text_6_1 = GUI:Text_Create(Node_6, "Att_Text_6_1", 2.00, -50.00, 18, "#c0c0c0", [[暴击伤害+10%]])
	GUI:setAnchorPoint(Att_Text_6_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_6_1, false)
	GUI:setTag(Att_Text_6_1, 0)
	GUI:Text_enableOutline(Att_Text_6_1, "#000000", 1)

	-- Create Att_Text_6_2
	local Att_Text_6_2 = GUI:Text_Create(Node_6, "Att_Text_6_2", -27.00, -50.00, 18, "#00ff00", [[暴击伤害+10%]])
	GUI:setAnchorPoint(Att_Text_6_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_6_2, false)
	GUI:setTag(Att_Text_6_2, 0)
	GUI:Text_enableOutline(Att_Text_6_2, "#000000", 1)

	-- Create Att_Text_6_3
	local Att_Text_6_3 = GUI:Text_Create(Node_6, "Att_Text_6_3", 61.00, -50.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_6_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_6_3, false)
	GUI:setTag(Att_Text_6_3, 0)
	GUI:Text_enableOutline(Att_Text_6_3, "#000000", 1)

	-- Create Node_7
	local Node_7 = GUI:Node_Create(AllNode, "Node_7", 353.00, 193.00)
	GUI:setTag(Node_7, 0)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Node_7, "Image_7", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state7.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create Att_Text_7_1
	local Att_Text_7_1 = GUI:Text_Create(Node_7, "Att_Text_7_1", -150.00, -3.00, 18, "#c0c0c0", [[攻击伤害+10%]])
	GUI:setAnchorPoint(Att_Text_7_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_7_1, false)
	GUI:setTag(Att_Text_7_1, 0)
	GUI:Text_enableOutline(Att_Text_7_1, "#000000", 1)

	-- Create Att_Text_7_2
	local Att_Text_7_2 = GUI:Text_Create(Node_7, "Att_Text_7_2", -187.00, -3.00, 18, "#00ff00", [[攻击伤害+10%]])
	GUI:setAnchorPoint(Att_Text_7_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_7_2, false)
	GUI:setTag(Att_Text_7_2, 0)
	GUI:Text_enableOutline(Att_Text_7_2, "#000000", 1)

	-- Create Att_Text_7_3
	local Att_Text_7_3 = GUI:Text_Create(Node_7, "Att_Text_7_3", -99.00, -3.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_7_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_7_3, false)
	GUI:setTag(Att_Text_7_3, 0)
	GUI:Text_enableOutline(Att_Text_7_3, "#000000", 1)

	-- Create Node_8
	local Node_8 = GUI:Node_Create(AllNode, "Node_8", 309.00, 251.00)
	GUI:setTag(Node_8, 0)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Node_8, "Image_8", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state8.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)

	-- Create Att_Text_8_1
	local Att_Text_8_1 = GUI:Text_Create(Node_8, "Att_Text_8_1", -125.00, -3.00, 18, "#c0c0c0", [[致命几率+10%]])
	GUI:setAnchorPoint(Att_Text_8_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_8_1, false)
	GUI:setTag(Att_Text_8_1, 0)
	GUI:Text_enableOutline(Att_Text_8_1, "#000000", 1)

	-- Create Att_Text_8_2
	local Att_Text_8_2 = GUI:Text_Create(Node_8, "Att_Text_8_2", -163.00, -3.00, 18, "#00ff00", [[致命几率+10%]])
	GUI:setAnchorPoint(Att_Text_8_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_8_2, false)
	GUI:setTag(Att_Text_8_2, 0)
	GUI:Text_enableOutline(Att_Text_8_2, "#000000", 1)

	-- Create Att_Text_8_3
	local Att_Text_8_3 = GUI:Text_Create(Node_8, "Att_Text_8_3", -75.00, -3.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_8_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_8_3, false)
	GUI:setTag(Att_Text_8_3, 0)
	GUI:Text_enableOutline(Att_Text_8_3, "#000000", 1)

	-- Create Node_9
	local Node_9 = GUI:Node_Create(AllNode, "Node_9", 309.00, 328.00)
	GUI:setTag(Node_9, 0)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(Node_9, "Image_9", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state9.png")
	GUI:setAnchorPoint(Image_9, 0.00, 0.00)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 0)

	-- Create Att_Text_9_1
	local Att_Text_9_1 = GUI:Text_Create(Node_9, "Att_Text_9_1", -126.00, 0.00, 18, "#c0c0c0", [[忽视防御+20%]])
	GUI:setAnchorPoint(Att_Text_9_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_9_1, false)
	GUI:setTag(Att_Text_9_1, 0)
	GUI:Text_enableOutline(Att_Text_9_1, "#000000", 1)

	-- Create Att_Text_9_2
	local Att_Text_9_2 = GUI:Text_Create(Node_9, "Att_Text_9_2", -163.00, 0.00, 18, "#00ff00", [[忽视防御+20%]])
	GUI:setAnchorPoint(Att_Text_9_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_9_2, false)
	GUI:setTag(Att_Text_9_2, 0)
	GUI:Text_enableOutline(Att_Text_9_2, "#000000", 1)

	-- Create Att_Text_9_3
	local Att_Text_9_3 = GUI:Text_Create(Node_9, "Att_Text_9_3", -75.00, 0.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_9_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_9_3, false)
	GUI:setTag(Att_Text_9_3, 0)
	GUI:Text_enableOutline(Att_Text_9_3, "#000000", 1)

	-- Create Node_10
	local Node_10 = GUI:Node_Create(AllNode, "Node_10", 353.00, 391.00)
	GUI:setTag(Node_10, 0)

	-- Create Image_10
	local Image_10 = GUI:Image_Create(Node_10, "Image_10", -40.00, -40.00, "res/custom/JuQing/LuoPanZhanBu/state10.png")
	GUI:setAnchorPoint(Image_10, 0.00, 0.00)
	GUI:setTouchEnabled(Image_10, false)
	GUI:setTag(Image_10, 0)

	-- Create Att_Text_10_1
	local Att_Text_10_1 = GUI:Text_Create(Node_10, "Att_Text_10_1", -153.00, -2.00, 18, "#c0c0c0", [[对怪切割+50000]])
	GUI:setAnchorPoint(Att_Text_10_1, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_10_1, false)
	GUI:setTag(Att_Text_10_1, 0)
	GUI:Text_enableOutline(Att_Text_10_1, "#000000", 1)

	-- Create Att_Text_10_2
	local Att_Text_10_2 = GUI:Text_Create(Node_10, "Att_Text_10_2", -196.00, -2.00, 18, "#00ff00", [[对怪切割+50000]])
	GUI:setAnchorPoint(Att_Text_10_2, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_10_2, false)
	GUI:setTag(Att_Text_10_2, 0)
	GUI:Text_enableOutline(Att_Text_10_2, "#000000", 1)

	-- Create Att_Text_10_3
	local Att_Text_10_3 = GUI:Text_Create(Node_10, "Att_Text_10_3", -99.00, -2.00, 18, "#ffff00", [[(66/66)]])
	GUI:setAnchorPoint(Att_Text_10_3, 0.50, 0.50)
	GUI:setTouchEnabled(Att_Text_10_3, false)
	GUI:setTag(Att_Text_10_3, 0)
	GUI:Text_enableOutline(Att_Text_10_3, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
