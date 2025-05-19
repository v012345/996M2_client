local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 2.00, 1.00, "res/custom/ShiJieDiTu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 1000.00, 504.00, 80, 80, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 17.00, 13.00, "res/custom/jilushi/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AllNode
	local AllNode = GUI:Node_Create(ImageBG, "AllNode", 0.00, 0.00)
	GUI:setTag(AllNode, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(AllNode, "Node_1", 38.00, 49.00)
	GUI:setTag(Node_1, 0)
	GUI:setVisible(Node_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 0.00, 0.00, "res/custom/ShiJieDiTu/img_1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create statelook_1
	local statelook_1 = GUI:Image_Create(Node_1, "statelook_1", 0.00, 0.00, "res/custom/ShiJieDiTu/o1.png")
	GUI:setAnchorPoint(statelook_1, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_1, false)
	GUI:setTag(statelook_1, 0)
	GUI:setVisible(statelook_1, false)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 55.00, 30.00, "res/custom/ShiJieDiTu/name_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(AllNode, "Node_2", 210.00, 81.00)
	GUI:setTag(Node_2, 0)
	GUI:setVisible(Node_2, false)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_2, "Image_2", 0.00, 0.00, "res/custom/ShiJieDiTu/img_2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create statelook_2
	local statelook_2 = GUI:Image_Create(Node_2, "statelook_2", 0.00, 0.00, "res/custom/ShiJieDiTu/o2.png")
	GUI:setAnchorPoint(statelook_2, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_2, false)
	GUI:setTag(statelook_2, 0)
	GUI:setVisible(statelook_2, false)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_2, "Button_2", 86.00, 120.00, "res/custom/ShiJieDiTu/name_2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(AllNode, "Node_3", 306.00, 49.00)
	GUI:setTag(Node_3, 0)
	GUI:setVisible(Node_3, false)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_3, "Image_3", 0.00, 0.00, "res/custom/ShiJieDiTu/img_3.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create statelook_3
	local statelook_3 = GUI:Image_Create(Node_3, "statelook_3", 0.00, 0.00, "res/custom/ShiJieDiTu/o3.png")
	GUI:setAnchorPoint(statelook_3, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_3, false)
	GUI:setTag(statelook_3, 0)
	GUI:setVisible(statelook_3, false)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_3, "Button_3", 166.00, 61.00, "res/custom/ShiJieDiTu/name_3.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(AllNode, "Node_4", 378.00, 225.00)
	GUI:setTag(Node_4, 0)
	GUI:setVisible(Node_4, false)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_4, "Image_4", 0.00, 0.00, "res/custom/ShiJieDiTu/img_4.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create statelook_4
	local statelook_4 = GUI:Image_Create(Node_4, "statelook_4", 0.00, 0.00, "res/custom/ShiJieDiTu/o4.png")
	GUI:setAnchorPoint(statelook_4, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_4, false)
	GUI:setTag(statelook_4, 0)
	GUI:setVisible(statelook_4, false)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_4, "Button_4", 132.00, 60.00, "res/custom/ShiJieDiTu/name_4.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Node_5
	local Node_5 = GUI:Node_Create(AllNode, "Node_5", 721.00, 269.00)
	GUI:setTag(Node_5, 0)
	GUI:setVisible(Node_5, false)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_5, "Image_5", 0.00, 0.00, "res/custom/ShiJieDiTu/img_5.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create statelook_5
	local statelook_5 = GUI:Image_Create(Node_5, "statelook_5", 0.00, 0.00, "res/custom/ShiJieDiTu/o5.png")
	GUI:setAnchorPoint(statelook_5, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_5, false)
	GUI:setTag(statelook_5, 0)
	GUI:setVisible(statelook_5, false)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_5, "Button_5", 88.00, 34.00, "res/custom/ShiJieDiTu/name_5.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Node_6
	local Node_6 = GUI:Node_Create(AllNode, "Node_6", 636.00, 49.00)
	GUI:setTag(Node_6, 0)
	GUI:setVisible(Node_6, false)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Node_6, "Image_6", 0.00, 0.00, "res/custom/ShiJieDiTu/img_6.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create statelook_6
	local statelook_6 = GUI:Image_Create(Node_6, "statelook_6", 0.00, 0.00, "res/custom/ShiJieDiTu/o6.png")
	GUI:setAnchorPoint(statelook_6, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_6, false)
	GUI:setTag(statelook_6, 0)
	GUI:setVisible(statelook_6, false)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Node_6, "Button_6", 110.00, 87.00, "res/custom/ShiJieDiTu/name_6.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Node_7
	local Node_7 = GUI:Node_Create(AllNode, "Node_7", 517.00, 364.00)
	GUI:setTag(Node_7, 0)
	GUI:setVisible(Node_7, false)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Node_7, "Image_7", 0.00, 0.00, "res/custom/ShiJieDiTu/img_7.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create statelook_7
	local statelook_7 = GUI:Image_Create(Node_7, "statelook_7", 0.00, -1.00, "res/custom/ShiJieDiTu/o7.png")
	GUI:setAnchorPoint(statelook_7, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_7, false)
	GUI:setTag(statelook_7, 0)
	GUI:setVisible(statelook_7, false)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Node_7, "Button_7", 168.00, 39.00, "res/custom/ShiJieDiTu/name_7.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	-- Create Node_8
	local Node_8 = GUI:Node_Create(AllNode, "Node_8", 38.00, 207.00)
	GUI:setTag(Node_8, 0)
	GUI:setVisible(Node_8, false)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Node_8, "Image_8", 0.00, 0.00, "res/custom/ShiJieDiTu/img_8.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)

	-- Create statelook_8
	local statelook_8 = GUI:Image_Create(Node_8, "statelook_8", 0.00, -1.00, "res/custom/ShiJieDiTu/o8.png")
	GUI:setAnchorPoint(statelook_8, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_8, false)
	GUI:setTag(statelook_8, 0)
	GUI:setVisible(statelook_8, false)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(Node_8, "Button_8", 110.00, 23.00, "res/custom/ShiJieDiTu/name_8.png")
	GUI:Button_setTitleText(Button_8, [[]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)

	-- Create Node_9
	local Node_9 = GUI:Node_Create(AllNode, "Node_9", 38.00, 303.00)
	GUI:setTag(Node_9, 0)
	GUI:setVisible(Node_9, false)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(Node_9, "Image_9", 0.00, 0.00, "res/custom/ShiJieDiTu/img_9.png")
	GUI:setAnchorPoint(Image_9, 0.00, 0.00)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 0)

	-- Create statelook_9
	local statelook_9 = GUI:Image_Create(Node_9, "statelook_9", 0.00, -1.00, "res/custom/ShiJieDiTu/o9.png")
	GUI:setAnchorPoint(statelook_9, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_9, false)
	GUI:setTag(statelook_9, 0)
	GUI:setVisible(statelook_9, false)

	-- Create Button_9
	local Button_9 = GUI:Button_Create(Node_9, "Button_9", 97.00, 79.00, "res/custom/ShiJieDiTu/name_9.png")
	GUI:Button_setTitleText(Button_9, [[]])
	GUI:Button_setTitleColor(Button_9, "#ffffff")
	GUI:Button_setTitleFontSize(Button_9, 16)
	GUI:Button_titleEnableOutline(Button_9, "#000000", 1)
	GUI:setAnchorPoint(Button_9, 0.00, 0.00)
	GUI:setTouchEnabled(Button_9, true)
	GUI:setTag(Button_9, 0)

	-- Create Node_10
	local Node_10 = GUI:Node_Create(AllNode, "Node_10", 200.00, 384.00)
	GUI:setTag(Node_10, 0)
	GUI:setVisible(Node_10, false)

	-- Create Image_10
	local Image_10 = GUI:Image_Create(Node_10, "Image_10", 0.00, 0.00, "res/custom/ShiJieDiTu/img_10.png")
	GUI:setAnchorPoint(Image_10, 0.00, 0.00)
	GUI:setTouchEnabled(Image_10, false)
	GUI:setTag(Image_10, 0)

	-- Create statelook_10
	local statelook_10 = GUI:Image_Create(Node_10, "statelook_10", 0.00, -1.00, "res/custom/ShiJieDiTu/o10.png")
	GUI:setAnchorPoint(statelook_10, 0.00, 0.00)
	GUI:setTouchEnabled(statelook_10, false)
	GUI:setTag(statelook_10, 0)
	GUI:setVisible(statelook_10, false)

	-- Create Button_10
	local Button_10 = GUI:Button_Create(Node_10, "Button_10", 135.00, 26.00, "res/custom/ShiJieDiTu/name_10.png")
	GUI:Button_setTitleText(Button_10, [[]])
	GUI:Button_setTitleColor(Button_10, "#ffffff")
	GUI:Button_setTitleFontSize(Button_10, 16)
	GUI:Button_titleEnableOutline(Button_10, "#000000", 1)
	GUI:setAnchorPoint(Button_10, 0.00, 0.00)
	GUI:setTouchEnabled(Button_10, true)
	GUI:setTag(Button_10, 0)

	-- Create Button_KuFu
	local Button_KuFu = GUI:Button_Create(AllNode, "Button_KuFu", 855.00, 43.00, "res/custom/ShiJieDiTu/kufubutton.png")
	GUI:Button_setTitleText(Button_KuFu, [[]])
	GUI:Button_setTitleColor(Button_KuFu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_KuFu, 16)
	GUI:Button_titleEnableOutline(Button_KuFu, "#000000", 1)
	GUI:setAnchorPoint(Button_KuFu, 0.00, 0.00)
	GUI:setTouchEnabled(Button_KuFu, true)
	GUI:setTag(Button_KuFu, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
