local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 830.00, 504.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create OpenButton
	local OpenButton = GUI:Button_Create(ImageBG, "OpenButton", 774.00, 119.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/button_3.png")
	GUI:Button_setTitleText(OpenButton, [[]])
	GUI:Button_setTitleColor(OpenButton, "#ffffff")
	GUI:Button_setTitleFontSize(OpenButton, 14)
	GUI:Button_titleEnableOutline(OpenButton, "#000000", 1)
	GUI:setAnchorPoint(OpenButton, 0.00, 0.00)
	GUI:setTouchEnabled(OpenButton, true)
	GUI:setTag(OpenButton, -1)

	-- Create ItemShow_All
	local ItemShow_All = GUI:Node_Create(ImageBG, "ItemShow_All", 0.00, 0.00)
	GUI:setTag(ItemShow_All, 0)

	-- Create ItemShow_5
	local ItemShow_5 = GUI:Layout_Create(ItemShow_All, "ItemShow_5", 508.00, 531.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_5, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_5, true)
	GUI:setTag(ItemShow_5, 0)

	-- Create ItemShow_10
	local ItemShow_10 = GUI:Layout_Create(ItemShow_All, "ItemShow_10", 788.00, 488.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_10, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_10, true)
	GUI:setTag(ItemShow_10, 0)

	-- Create ItemShow_15
	local ItemShow_15 = GUI:Layout_Create(ItemShow_All, "ItemShow_15", 507.00, 444.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_15, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_15, true)
	GUI:setTag(ItemShow_15, 0)

	-- Create ItemShow_20
	local ItemShow_20 = GUI:Layout_Create(ItemShow_All, "ItemShow_20", 227.00, 401.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_20, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_20, true)
	GUI:setTag(ItemShow_20, 0)

	-- Create ItemShow_25
	local ItemShow_25 = GUI:Layout_Create(ItemShow_All, "ItemShow_25", 507.00, 357.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_25, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_25, true)
	GUI:setTag(ItemShow_25, 0)

	-- Create ItemShow_30
	local ItemShow_30 = GUI:Layout_Create(ItemShow_All, "ItemShow_30", 786.00, 315.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_30, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_30, true)
	GUI:setTag(ItemShow_30, 0)

	-- Create ItemShow_35
	local ItemShow_35 = GUI:Layout_Create(ItemShow_All, "ItemShow_35", 509.00, 271.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_35, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_35, true)
	GUI:setTag(ItemShow_35, 0)

	-- Create ItemShow_40
	local ItemShow_40 = GUI:Layout_Create(ItemShow_All, "ItemShow_40", 160.00, 271.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_40, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_40, true)
	GUI:setTag(ItemShow_40, 0)

	-- Create ItemShow_45
	local ItemShow_45 = GUI:Layout_Create(ItemShow_All, "ItemShow_45", 368.00, 185.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_45, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_45, true)
	GUI:setTag(ItemShow_45, 0)

	-- Create ItemShow_50
	local ItemShow_50 = GUI:Layout_Create(ItemShow_All, "ItemShow_50", 721.00, 188.00, 40, 40, false)
	GUI:setAnchorPoint(ItemShow_50, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_50, true)
	GUI:setTag(ItemShow_50, 0)

	-- Create Button_All
	local Button_All = GUI:Image_Create(ImageBG, "Button_All", 15.00, -4.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/bg1.png")
	GUI:setAnchorPoint(Button_All, 0.00, 0.00)
	GUI:setTouchEnabled(Button_All, false)
	GUI:setTag(Button_All, 0)
	GUI:setVisible(Button_All, false)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Button_All, "Button_1", 290.00, 22.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/button_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create ShaiZiLooks_1
	local ShaiZiLooks_1 = GUI:Text_Create(Button_1, "ShaiZiLooks_1", 64.00, -4.00, 16, "#00ff00", [[免费:5/5]])
	GUI:Text_enableOutline(ShaiZiLooks_1, "#000000", 1)
	GUI:setAnchorPoint(ShaiZiLooks_1, 0.50, 0.50)
	GUI:setTouchEnabled(ShaiZiLooks_1, false)
	GUI:setTag(ShaiZiLooks_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Button_All, "Button_2", 510.00, 21.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/button_2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create ShaiZiLooks_2
	local ShaiZiLooks_2 = GUI:Text_Create(Button_2, "ShaiZiLooks_2", 56.00, -3.00, 16, "#00ff00", [[200灵符一次]])
	GUI:Text_enableOutline(ShaiZiLooks_2, "#000000", 1)
	GUI:setAnchorPoint(ShaiZiLooks_2, 0.50, 0.50)
	GUI:setTouchEnabled(ShaiZiLooks_2, false)
	GUI:setTag(ShaiZiLooks_2, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Button_2, "Image_1", 86.00, 80.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/tips.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Node_All
	local Node_All = GUI:Node_Create(ImageBG, "Node_All", 0.00, -1.00)
	GUI:setTag(Node_All, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_All, "Panel_1", 194.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Node_All, "Panel_2", 264.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Node_All, "Panel_3", 334.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(Node_All, "Panel_4", 404.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(Node_All, "Panel_5", 474.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create Panel_6
	local Panel_6 = GUI:Layout_Create(Node_All, "Panel_6", 544.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_6, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_6, true)
	GUI:setTag(Panel_6, 0)

	-- Create Panel_7
	local Panel_7 = GUI:Layout_Create(Node_All, "Panel_7", 614.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_7, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_7, true)
	GUI:setTag(Panel_7, 0)

	-- Create Panel_8
	local Panel_8 = GUI:Layout_Create(Node_All, "Panel_8", 684.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_8, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_8, true)
	GUI:setTag(Panel_8, 0)

	-- Create Panel_9
	local Panel_9 = GUI:Layout_Create(Node_All, "Panel_9", 754.00, 513.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_9, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_9, true)
	GUI:setTag(Panel_9, 0)

	-- Create Panel_10
	local Panel_10 = GUI:Layout_Create(Node_All, "Panel_10", 754.00, 470.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_10, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_10, true)
	GUI:setTag(Panel_10, 0)

	-- Create Panel_11
	local Panel_11 = GUI:Layout_Create(Node_All, "Panel_11", 753.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_11, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_11, true)
	GUI:setTag(Panel_11, 0)

	-- Create Panel_12
	local Panel_12 = GUI:Layout_Create(Node_All, "Panel_12", 684.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_12, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_12, true)
	GUI:setTag(Panel_12, 0)

	-- Create Panel_13
	local Panel_13 = GUI:Layout_Create(Node_All, "Panel_13", 614.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_13, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_13, true)
	GUI:setTag(Panel_13, 0)

	-- Create Panel_14
	local Panel_14 = GUI:Layout_Create(Node_All, "Panel_14", 544.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_14, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_14, true)
	GUI:setTag(Panel_14, 0)

	-- Create Panel_15
	local Panel_15 = GUI:Layout_Create(Node_All, "Panel_15", 474.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_15, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_15, true)
	GUI:setTag(Panel_15, 0)

	-- Create Panel_16
	local Panel_16 = GUI:Layout_Create(Node_All, "Panel_16", 404.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_16, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_16, true)
	GUI:setTag(Panel_16, 0)

	-- Create Panel_17
	local Panel_17 = GUI:Layout_Create(Node_All, "Panel_17", 334.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_17, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_17, true)
	GUI:setTag(Panel_17, 0)

	-- Create Panel_18
	local Panel_18 = GUI:Layout_Create(Node_All, "Panel_18", 264.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_18, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_18, true)
	GUI:setTag(Panel_18, 0)

	-- Create Panel_19
	local Panel_19 = GUI:Layout_Create(Node_All, "Panel_19", 194.00, 428.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_19, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_19, true)
	GUI:setTag(Panel_19, 0)

	-- Create Panel_20
	local Panel_20 = GUI:Layout_Create(Node_All, "Panel_20", 194.00, 385.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_20, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_20, true)
	GUI:setTag(Panel_20, 0)

	-- Create Panel_21
	local Panel_21 = GUI:Layout_Create(Node_All, "Panel_21", 194.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_21, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_21, true)
	GUI:setTag(Panel_21, 0)

	-- Create Panel_22
	local Panel_22 = GUI:Layout_Create(Node_All, "Panel_22", 264.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_22, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_22, true)
	GUI:setTag(Panel_22, 0)

	-- Create Panel_23
	local Panel_23 = GUI:Layout_Create(Node_All, "Panel_23", 334.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_23, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_23, true)
	GUI:setTag(Panel_23, 0)

	-- Create Panel_24
	local Panel_24 = GUI:Layout_Create(Node_All, "Panel_24", 404.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_24, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_24, true)
	GUI:setTag(Panel_24, 0)

	-- Create Panel_25
	local Panel_25 = GUI:Layout_Create(Node_All, "Panel_25", 474.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_25, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_25, true)
	GUI:setTag(Panel_25, 0)

	-- Create Panel_26
	local Panel_26 = GUI:Layout_Create(Node_All, "Panel_26", 544.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_26, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_26, true)
	GUI:setTag(Panel_26, 0)

	-- Create Panel_27
	local Panel_27 = GUI:Layout_Create(Node_All, "Panel_27", 614.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_27, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_27, true)
	GUI:setTag(Panel_27, 0)

	-- Create Panel_28
	local Panel_28 = GUI:Layout_Create(Node_All, "Panel_28", 684.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_28, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_28, true)
	GUI:setTag(Panel_28, 0)

	-- Create Panel_29
	local Panel_29 = GUI:Layout_Create(Node_All, "Panel_29", 754.00, 342.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_29, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_29, true)
	GUI:setTag(Panel_29, 0)

	-- Create Panel_30
	local Panel_30 = GUI:Layout_Create(Node_All, "Panel_30", 754.00, 299.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_30, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_30, true)
	GUI:setTag(Panel_30, 0)

	-- Create Panel_31
	local Panel_31 = GUI:Layout_Create(Node_All, "Panel_31", 754.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_31, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_31, true)
	GUI:setTag(Panel_31, 0)

	-- Create Panel_32
	local Panel_32 = GUI:Layout_Create(Node_All, "Panel_32", 684.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_32, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_32, true)
	GUI:setTag(Panel_32, 0)

	-- Create Panel_33
	local Panel_33 = GUI:Layout_Create(Node_All, "Panel_33", 614.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_33, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_33, true)
	GUI:setTag(Panel_33, 0)

	-- Create Panel_34
	local Panel_34 = GUI:Layout_Create(Node_All, "Panel_34", 544.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_34, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_34, true)
	GUI:setTag(Panel_34, 0)

	-- Create Panel_35
	local Panel_35 = GUI:Layout_Create(Node_All, "Panel_35", 474.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_35, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_35, true)
	GUI:setTag(Panel_35, 0)

	-- Create Panel_36
	local Panel_36 = GUI:Layout_Create(Node_All, "Panel_36", 404.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_36, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_36, true)
	GUI:setTag(Panel_36, 0)

	-- Create Panel_37
	local Panel_37 = GUI:Layout_Create(Node_All, "Panel_37", 334.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_37, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_37, true)
	GUI:setTag(Panel_37, 0)

	-- Create Panel_38
	local Panel_38 = GUI:Layout_Create(Node_All, "Panel_38", 264.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_38, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_38, true)
	GUI:setTag(Panel_38, 0)

	-- Create Panel_39
	local Panel_39 = GUI:Layout_Create(Node_All, "Panel_39", 194.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_39, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_39, true)
	GUI:setTag(Panel_39, 0)

	-- Create Panel_40
	local Panel_40 = GUI:Layout_Create(Node_All, "Panel_40", 123.00, 257.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_40, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_40, true)
	GUI:setTag(Panel_40, 0)

	-- Create Panel_41
	local Panel_41 = GUI:Layout_Create(Node_All, "Panel_41", 123.00, 213.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_41, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_41, true)
	GUI:setTag(Panel_41, 0)

	-- Create Panel_42
	local Panel_42 = GUI:Layout_Create(Node_All, "Panel_42", 123.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_42, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_42, true)
	GUI:setTag(Panel_42, 0)

	-- Create Panel_43
	local Panel_43 = GUI:Layout_Create(Node_All, "Panel_43", 194.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_43, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_43, true)
	GUI:setTag(Panel_43, 0)

	-- Create Panel_44
	local Panel_44 = GUI:Layout_Create(Node_All, "Panel_44", 264.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_44, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_44, true)
	GUI:setTag(Panel_44, 0)

	-- Create Panel_45
	local Panel_45 = GUI:Layout_Create(Node_All, "Panel_45", 334.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_45, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_45, true)
	GUI:setTag(Panel_45, 0)

	-- Create Panel_46
	local Panel_46 = GUI:Layout_Create(Node_All, "Panel_46", 404.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_46, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_46, true)
	GUI:setTag(Panel_46, 0)

	-- Create Panel_47
	local Panel_47 = GUI:Layout_Create(Node_All, "Panel_47", 474.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_47, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_47, true)
	GUI:setTag(Panel_47, 0)

	-- Create Panel_48
	local Panel_48 = GUI:Layout_Create(Node_All, "Panel_48", 544.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_48, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_48, true)
	GUI:setTag(Panel_48, 0)

	-- Create Panel_49
	local Panel_49 = GUI:Layout_Create(Node_All, "Panel_49", 615.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_49, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_49, true)
	GUI:setTag(Panel_49, 0)

	-- Create Panel_50
	local Panel_50 = GUI:Layout_Create(Node_All, "Panel_50", 684.00, 170.00, 70, 38, false)
	GUI:setAnchorPoint(Panel_50, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_50, true)
	GUI:setTag(Panel_50, 0)

	-- Create ShaiZiShow
	local ShaiZiShow = GUI:Layout_Create(ImageBG, "ShaiZiShow", 458.00, 298.00, 100, 100, false)
	GUI:setAnchorPoint(ShaiZiShow, 0.00, 0.00)
	GUI:setTouchEnabled(ShaiZiShow, true)
	GUI:setTag(ShaiZiShow, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
