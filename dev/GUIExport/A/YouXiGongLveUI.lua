local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -5.00, 1.00, "res/custom/YouXiGongLve/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 939.00, 455.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 24.00, 2.00, "res/custom/jilushi/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create All_ListView
	local All_ListView = GUI:ListView_Create(ImageBG, "All_ListView", 138.00, 25.00, 199, 441, 1)
	GUI:ListView_setBounceEnabled(All_ListView, true)
	GUI:setAnchorPoint(All_ListView, 0.00, 0.00)
	GUI:setTouchEnabled(All_ListView, true)
	GUI:setTag(All_ListView, 0)

	-- Create ALLNode
	local ALLNode = GUI:Node_Create(ImageBG, "ALLNode", 343.00, 389.00)
	GUI:setTag(ALLNode, 0)

	-- Create Tips_1_1
	local Tips_1_1 = GUI:ListView_Create(ALLNode, "Tips_1_1", -1.00, -345.00, 602, 355, 1)
	GUI:ListView_setBounceEnabled(Tips_1_1, true)
	GUI:setAnchorPoint(Tips_1_1, 0.00, 0.00)
	GUI:setScale(Tips_1_1, 0.98)
	GUI:setTouchEnabled(Tips_1_1, true)
	GUI:setTag(Tips_1_1, 0)
	GUI:setVisible(Tips_1_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Tips_1_1, "Image_1", 0.00, -1868.00, "res/custom/YouXiGongLve/tips/1/tips1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Tips_1_2
	local Tips_1_2 = GUI:ListView_Create(ALLNode, "Tips_1_2", -1.00, -345.00, 602, 355, 1)
	GUI:ListView_setBounceEnabled(Tips_1_2, true)
	GUI:setAnchorPoint(Tips_1_2, 0.00, 0.00)
	GUI:setScale(Tips_1_2, 0.98)
	GUI:setTouchEnabled(Tips_1_2, true)
	GUI:setTag(Tips_1_2, 0)
	GUI:setVisible(Tips_1_2, false)

	-- Create Image_1
	Image_1 = GUI:Image_Create(Tips_1_2, "Image_1", 0.00, -1555.00, "res/custom/YouXiGongLve/tips/1/tips2.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Tips_1_3
	local Tips_1_3 = GUI:Image_Create(ALLNode, "Tips_1_3", 13.00, -81.00, "res/custom/YouXiGongLve/tips/1/tips3.png")
	GUI:setAnchorPoint(Tips_1_3, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_1_3, false)
	GUI:setTag(Tips_1_3, 0)
	GUI:setVisible(Tips_1_3, false)

	-- Create Tips_1_4
	local Tips_1_4 = GUI:Image_Create(ALLNode, "Tips_1_4", 13.00, -125.00, "res/custom/YouXiGongLve/tips/1/tips4.png")
	GUI:setAnchorPoint(Tips_1_4, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_1_4, false)
	GUI:setTag(Tips_1_4, 0)
	GUI:setVisible(Tips_1_4, false)

	-- Create Tips_1_5
	local Tips_1_5 = GUI:ListView_Create(ALLNode, "Tips_1_5", -1.00, -345.00, 602, 355, 1)
	GUI:ListView_setBounceEnabled(Tips_1_5, true)
	GUI:setAnchorPoint(Tips_1_5, 0.00, 0.00)
	GUI:setScale(Tips_1_5, 0.98)
	GUI:setTouchEnabled(Tips_1_5, true)
	GUI:setTag(Tips_1_5, 0)
	GUI:setVisible(Tips_1_5, false)

	-- Create Image_1
	Image_1 = GUI:Image_Create(Tips_1_5, "Image_1", 0.00, -945.00, "res/custom/YouXiGongLve/tips/1/tips5.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Tips_2_1
	local Tips_2_1 = GUI:ListView_Create(ALLNode, "Tips_2_1", 2.00, -359.00, 600, 358, 1)
	GUI:setAnchorPoint(Tips_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_2_1, true)
	GUI:setTag(Tips_2_1, 0)
	GUI:setVisible(Tips_2_1, false)

	-- Create Image_2_1
	local Image_2_1 = GUI:Image_Create(Tips_2_1, "Image_2_1", 0.00, -902.00, "res/custom/YouXiGongLve/tips/2/tips1.png")
	GUI:setAnchorPoint(Image_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2_1, false)
	GUI:setTag(Image_2_1, 0)

	-- Create ItemShow_2_1
	local ItemShow_2_1 = GUI:Node_Create(Image_2_1, "ItemShow_2_1", 22.00, 1479.00)
	GUI:setTag(ItemShow_2_1, 0)

	-- Create Tips_2_2
	local Tips_2_2 = GUI:ListView_Create(ALLNode, "Tips_2_2", 2.00, -359.00, 600, 358, 1)
	GUI:setAnchorPoint(Tips_2_2, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_2_2, true)
	GUI:setTag(Tips_2_2, 0)
	GUI:setVisible(Tips_2_2, false)

	-- Create Image_2_2
	local Image_2_2 = GUI:Image_Create(Tips_2_2, "Image_2_2", 0.00, -3202.00, "res/custom/YouXiGongLve/tips/2/tips2.png")
	GUI:setAnchorPoint(Image_2_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2_2, false)
	GUI:setTag(Image_2_2, 0)

	-- Create ItemShow_2_2
	local ItemShow_2_2 = GUI:Node_Create(Image_2_2, "ItemShow_2_2", 22.00, 1479.00)
	GUI:setTag(ItemShow_2_2, 0)

	-- Create Tips_3_1
	local Tips_3_1 = GUI:Node_Create(ALLNode, "Tips_3_1", 0.00, 450.00)
	GUI:setTag(Tips_3_1, 0)
	GUI:setVisible(Tips_3_1, false)

	-- Create ListView_3_1
	local ListView_3_1 = GUI:ListView_Create(Tips_3_1, "ListView_3_1", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_1, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_1, true)
	GUI:ListView_setGravity(ListView_3_1, 3)
	GUI:setAnchorPoint(ListView_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_1, true)
	GUI:setTag(ListView_3_1, 0)

	-- Create Image_3_1
	local Image_3_1 = GUI:Image_Create(ListView_3_1, "Image_3_1", 0.00, 2.00, "res/custom/YouXiGongLve/tips/3/tips1.png")
	GUI:setAnchorPoint(Image_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_1, false)
	GUI:setTag(Image_3_1, 0)

	-- Create Image_kk
	local Image_kk = GUI:Image_Create(Tips_3_1, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	local Effect_hd = GUI:Effect_Create(Tips_3_1, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_2
	local Tips_3_2 = GUI:Node_Create(ALLNode, "Tips_3_2", 0.00, 450.00)
	GUI:setTag(Tips_3_2, 0)
	GUI:setVisible(Tips_3_2, false)

	-- Create ListView_3_2
	local ListView_3_2 = GUI:ListView_Create(Tips_3_2, "ListView_3_2", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_2, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_2, true)
	GUI:ListView_setGravity(ListView_3_2, 3)
	GUI:setAnchorPoint(ListView_3_2, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_2, true)
	GUI:setTag(ListView_3_2, 0)

	-- Create Image_3_2
	local Image_3_2 = GUI:Image_Create(ListView_3_2, "Image_3_2", 0.00, 8.00, "res/custom/YouXiGongLve/tips/3/tips2.png")
	GUI:setAnchorPoint(Image_3_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_2, false)
	GUI:setTag(Image_3_2, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_2, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_2, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_3
	local Tips_3_3 = GUI:Node_Create(ALLNode, "Tips_3_3", 0.00, 450.00)
	GUI:setTag(Tips_3_3, 0)
	GUI:setVisible(Tips_3_3, false)

	-- Create ListView_3_3
	local ListView_3_3 = GUI:ListView_Create(Tips_3_3, "ListView_3_3", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_3, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_3, true)
	GUI:ListView_setGravity(ListView_3_3, 3)
	GUI:setAnchorPoint(ListView_3_3, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_3, true)
	GUI:setTag(ListView_3_3, 0)

	-- Create Image_3_3
	local Image_3_3 = GUI:Image_Create(ListView_3_3, "Image_3_3", 0.00, 4.00, "res/custom/YouXiGongLve/tips/3/tips3.png")
	GUI:setAnchorPoint(Image_3_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_3, false)
	GUI:setTag(Image_3_3, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_3, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_3, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_4
	local Tips_3_4 = GUI:Node_Create(ALLNode, "Tips_3_4", 0.00, 450.00)
	GUI:setTag(Tips_3_4, 0)
	GUI:setVisible(Tips_3_4, false)

	-- Create ListView_3_4
	local ListView_3_4 = GUI:ListView_Create(Tips_3_4, "ListView_3_4", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_4, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_4, true)
	GUI:ListView_setGravity(ListView_3_4, 3)
	GUI:setAnchorPoint(ListView_3_4, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_4, true)
	GUI:setTag(ListView_3_4, 0)

	-- Create Image_3_4
	local Image_3_4 = GUI:Image_Create(ListView_3_4, "Image_3_4", 0.00, 32.00, "res/custom/YouXiGongLve/tips/3/tips4.png")
	GUI:setAnchorPoint(Image_3_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_4, false)
	GUI:setTag(Image_3_4, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_4, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_4, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_5
	local Tips_3_5 = GUI:Node_Create(ALLNode, "Tips_3_5", 0.00, 450.00)
	GUI:setTag(Tips_3_5, 0)
	GUI:setVisible(Tips_3_5, false)

	-- Create ListView_3_5
	local ListView_3_5 = GUI:ListView_Create(Tips_3_5, "ListView_3_5", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_5, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_5, true)
	GUI:ListView_setGravity(ListView_3_5, 3)
	GUI:setAnchorPoint(ListView_3_5, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_5, true)
	GUI:setTag(ListView_3_5, 0)

	-- Create Image_3_5
	local Image_3_5 = GUI:Image_Create(ListView_3_5, "Image_3_5", 0.00, 0.00, "res/custom/YouXiGongLve/tips/3/tips5.png")
	GUI:setAnchorPoint(Image_3_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_5, false)
	GUI:setTag(Image_3_5, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_5, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_5, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_6
	local Tips_3_6 = GUI:Node_Create(ALLNode, "Tips_3_6", 0.00, 450.00)
	GUI:setTag(Tips_3_6, 0)
	GUI:setVisible(Tips_3_6, false)

	-- Create ListView_3_6
	local ListView_3_6 = GUI:ListView_Create(Tips_3_6, "ListView_3_6", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_6, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_6, true)
	GUI:ListView_setGravity(ListView_3_6, 3)
	GUI:setAnchorPoint(ListView_3_6, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_6, true)
	GUI:setTag(ListView_3_6, 0)

	-- Create Image_3_6
	local Image_3_6 = GUI:Image_Create(ListView_3_6, "Image_3_6", 0.00, 0.00, "res/custom/YouXiGongLve/tips/3/tips6.png")
	GUI:setAnchorPoint(Image_3_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_6, false)
	GUI:setTag(Image_3_6, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_6, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_6, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_7
	local Tips_3_7 = GUI:Node_Create(ALLNode, "Tips_3_7", 0.00, 450.00)
	GUI:setTag(Tips_3_7, 0)
	GUI:setVisible(Tips_3_7, false)

	-- Create ListView_3_7
	local ListView_3_7 = GUI:ListView_Create(Tips_3_7, "ListView_3_7", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_7, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_7, true)
	GUI:ListView_setGravity(ListView_3_7, 3)
	GUI:setAnchorPoint(ListView_3_7, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_7, true)
	GUI:setTag(ListView_3_7, 0)

	-- Create Image_3_7
	local Image_3_7 = GUI:Image_Create(ListView_3_7, "Image_3_7", 0.00, 0.00, "res/custom/YouXiGongLve/tips/3/tips7.png")
	GUI:setAnchorPoint(Image_3_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_7, false)
	GUI:setTag(Image_3_7, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_7, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_7, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_3_8
	local Tips_3_8 = GUI:Node_Create(ALLNode, "Tips_3_8", 0.00, 450.00)
	GUI:setTag(Tips_3_8, 0)
	GUI:setVisible(Tips_3_8, false)

	-- Create ListView_3_8
	local ListView_3_8 = GUI:ListView_Create(Tips_3_8, "ListView_3_8", -7.00, -817.00, 611, 450, 2)
	GUI:ListView_setBackGroundImage(ListView_3_8, "res/custom/YouXiGongLve/tips/3/bg.png")
	GUI:ListView_setBounceEnabled(ListView_3_8, true)
	GUI:ListView_setGravity(ListView_3_8, 3)
	GUI:setAnchorPoint(ListView_3_8, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3_8, true)
	GUI:setTag(ListView_3_8, 0)

	-- Create Image_3_8
	local Image_3_8 = GUI:Image_Create(ListView_3_8, "Image_3_8", 0.00, 0.00, "res/custom/YouXiGongLve/tips/3/tips8.png")
	GUI:setAnchorPoint(Image_3_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_8, false)
	GUI:setTag(Image_3_8, 0)

	-- Create Image_kk
	Image_kk = GUI:Image_Create(Tips_3_8, "Image_kk", -23.00, -821.00, "res/custom/YouXiGongLve/tips/3/kk.png")
	GUI:setAnchorPoint(Image_kk, 0.00, 0.00)
	GUI:setTouchEnabled(Image_kk, false)
	GUI:setTag(Image_kk, 0)

	-- Create Effect_hd
	Effect_hd = GUI:Effect_Create(Tips_3_8, "Effect_hd", 226.00, -760.00, 0, 200033, 0, 0, 0, 0)
	GUI:setTag(Effect_hd, 0)

	-- Create Tips_4_1
	local Tips_4_1 = GUI:ListView_Create(ALLNode, "Tips_4_1", -1.00, -364.00, 604, 365, 1)
	GUI:setAnchorPoint(Tips_4_1, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_4_1, true)
	GUI:setTag(Tips_4_1, 0)
	GUI:setVisible(Tips_4_1, false)

	-- Create Image_4_1
	local Image_4_1 = GUI:Image_Create(Tips_4_1, "Image_4_1", 0.00, -1095.00, "res/custom/YouXiGongLve/tips/4/tips1.png")
	GUI:setAnchorPoint(Image_4_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4_1, false)
	GUI:setTag(Image_4_1, 0)

	-- Create MonEffect_1
	local MonEffect_1 = GUI:Effect_Create(Image_4_1, "MonEffect_1", 141.00, 1226.00, 2, 12604, 0, 0, 0, 0)
	GUI:setScale(MonEffect_1, 0.40)
	GUI:setTag(MonEffect_1, 0)

	-- Create MonEffect_2
	local MonEffect_2 = GUI:Effect_Create(Image_4_1, "MonEffect_2", 456.00, 1231.00, 2, 12601, 0, 0, 0, 0)
	GUI:setScale(MonEffect_2, 0.50)
	GUI:setTag(MonEffect_2, 0)

	-- Create MonEffect_3
	local MonEffect_3 = GUI:Effect_Create(Image_4_1, "MonEffect_3", 137.00, 893.00, 2, 12606, 0, 0, 4, 0)
	GUI:setScale(MonEffect_3, 0.60)
	GUI:setTag(MonEffect_3, 0)

	-- Create MonEffect_4
	local MonEffect_4 = GUI:Effect_Create(Image_4_1, "MonEffect_4", 450.00, 910.00, 2, 12605, 0, 0, 4, 0)
	GUI:setScale(MonEffect_4, 0.60)
	GUI:setTag(MonEffect_4, 0)

	-- Create MonEffect_5
	local MonEffect_5 = GUI:Effect_Create(Image_4_1, "MonEffect_5", 146.00, 533.00, 2, 12603, 0, 0, 0, 0)
	GUI:setScale(MonEffect_5, 0.70)
	GUI:setTag(MonEffect_5, 0)

	-- Create MonEffect_6
	local MonEffect_6 = GUI:Effect_Create(Image_4_1, "MonEffect_6", 430.00, 562.00, 2, 12600, 0, 0, 5, 0)
	GUI:setScale(MonEffect_6, 0.50)
	GUI:setTag(MonEffect_6, 0)

	-- Create MonEffect_7
	local MonEffect_7 = GUI:Effect_Create(Image_4_1, "MonEffect_7", 146.00, 171.00, 2, 12602, 0, 0, 5, 0)
	GUI:setScale(MonEffect_7, 0.85)
	GUI:setTag(MonEffect_7, 0)

	-- Create Tips_4_2
	local Tips_4_2 = GUI:ListView_Create(ALLNode, "Tips_4_2", -1.00, -364.00, 604, 365, 1)
	GUI:setAnchorPoint(Tips_4_2, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_4_2, true)
	GUI:setTag(Tips_4_2, 0)
	GUI:setVisible(Tips_4_2, false)

	-- Create Image_4_2
	local Image_4_2 = GUI:Image_Create(Tips_4_2, "Image_4_2", 0.00, -590.00, "res/custom/YouXiGongLve/tips/4/tips2.png")
	GUI:setAnchorPoint(Image_4_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4_2, false)
	GUI:setTag(Image_4_2, 0)

	-- Create Tips_4_3
	local Tips_4_3 = GUI:ListView_Create(ALLNode, "Tips_4_3", -1.00, -364.00, 604, 365, 1)
	GUI:setAnchorPoint(Tips_4_3, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_4_3, true)
	GUI:setTag(Tips_4_3, 0)
	GUI:setVisible(Tips_4_3, false)

	-- Create Image_4_3
	local Image_4_3 = GUI:Image_Create(Tips_4_3, "Image_4_3", 0.00, -629.00, "res/custom/YouXiGongLve/tips/4/tips3.png")
	GUI:setAnchorPoint(Image_4_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4_3, false)
	GUI:setTag(Image_4_3, 0)

	-- Create Tips_5_1
	local Tips_5_1 = GUI:Image_Create(ALLNode, "Tips_5_1", 12.00, -210.00, "res/custom/YouXiGongLve/tips/5/tips1.png")
	GUI:setAnchorPoint(Tips_5_1, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_5_1, false)
	GUI:setTag(Tips_5_1, 0)
	GUI:setVisible(Tips_5_1, false)

	-- Create Tips_5_2
	local Tips_5_2 = GUI:Image_Create(ALLNode, "Tips_5_2", 12.00, -269.00, "res/custom/YouXiGongLve/tips/5/tips2.png")
	GUI:setAnchorPoint(Tips_5_2, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_5_2, false)
	GUI:setTag(Tips_5_2, 0)
	GUI:setVisible(Tips_5_2, false)

	-- Create Tips_5_3
	local Tips_5_3 = GUI:Image_Create(ALLNode, "Tips_5_3", 12.00, -206.00, "res/custom/YouXiGongLve/tips/5/tips3.png")
	GUI:setAnchorPoint(Tips_5_3, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_5_3, false)
	GUI:setTag(Tips_5_3, 0)
	GUI:setVisible(Tips_5_3, false)

	-- Create Tips_6_1
	local Tips_6_1 = GUI:ListView_Create(ALLNode, "Tips_6_1", 23.00, -359.00, 560, 357, 1)
	GUI:ListView_setBounceEnabled(Tips_6_1, true)
	GUI:ListView_setItemsMargin(Tips_6_1, 4)
	GUI:setAnchorPoint(Tips_6_1, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_6_1, true)
	GUI:setTag(Tips_6_1, 0)
	GUI:setVisible(Tips_6_1, false)

	-- Create Panel_UpLog
	local Panel_UpLog = GUI:Layout_Create(Tips_6_1, "Panel_UpLog", 0.00, -4.00, 560, 361, false)
	GUI:setAnchorPoint(Panel_UpLog, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_UpLog, true)
	GUI:setTag(Panel_UpLog, 0)
	GUI:setVisible(Panel_UpLog, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
