local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 14.00, 44.00, "res/custom/ZhuangBeiQiangHua/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 956.00, 450.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodePlayer
	local NodePlayer = GUI:Node_Create(ImageBG, "NodePlayer", 0.00, 0.00)
	GUI:setTag(NodePlayer, -1)

	-- Create playerMode
	local playerMode = GUI:Image_Create(NodePlayer, "playerMode", 147.00, 26.00, "res/custom/ZhuangBeiQiangHua/0_1.png")
	GUI:setTouchEnabled(playerMode, false)
	GUI:setTag(playerMode, -1)

	-- Create NodeLightEquip
	local NodeLightEquip = GUI:Node_Create(NodePlayer, "NodeLightEquip", 0.00, 0.00)
	GUI:setTag(NodeLightEquip, -1)

	-- Create ImageLigh_1
	local ImageLigh_1 = GUI:Image_Create(NodeLightEquip, "ImageLigh_1", 147.00, 86.00, "res/custom/ZhuangBeiQiangHua/1_1.png")
	GUI:setTouchEnabled(ImageLigh_1, false)
	GUI:setTag(ImageLigh_1, -1)
	GUI:setVisible(ImageLigh_1, false)

	-- Create ImageLigh_0
	local ImageLigh_0 = GUI:Image_Create(NodeLightEquip, "ImageLigh_0", 328.00, 291.00, "res/custom/ZhuangBeiQiangHua/1_2.png")
	GUI:setTouchEnabled(ImageLigh_0, false)
	GUI:setTag(ImageLigh_0, -1)
	GUI:setVisible(ImageLigh_0, false)

	-- Create ImageLigh_6
	local ImageLigh_6 = GUI:Image_Create(NodeLightEquip, "ImageLigh_6", 342.00, 261.00, "res/custom/ZhuangBeiQiangHua/1_3.png")
	GUI:setTouchEnabled(ImageLigh_6, false)
	GUI:setTag(ImageLigh_6, -1)
	GUI:setVisible(ImageLigh_6, false)

	-- Create ImageLigh_8
	local ImageLigh_8 = GUI:Image_Create(NodeLightEquip, "ImageLigh_8", 340.00, 239.00, "res/custom/ZhuangBeiQiangHua/1_4.png")
	GUI:setTouchEnabled(ImageLigh_8, false)
	GUI:setTag(ImageLigh_8, -1)
	GUI:setVisible(ImageLigh_8, false)

	-- Create ImageLigh_10
	local ImageLigh_10 = GUI:Image_Create(NodeLightEquip, "ImageLigh_10", 343.00, 148.00, "res/custom/ZhuangBeiQiangHua/1_5.png")
	GUI:setTouchEnabled(ImageLigh_10, false)
	GUI:setTag(ImageLigh_10, -1)
	GUI:setVisible(ImageLigh_10, false)

	-- Create ImageLigh_4
	local ImageLigh_4 = GUI:Image_Create(NodeLightEquip, "ImageLigh_4", 383.00, 362.00, "res/custom/ZhuangBeiQiangHua/1_6.png")
	GUI:setTouchEnabled(ImageLigh_4, false)
	GUI:setTag(ImageLigh_4, -1)
	GUI:setVisible(ImageLigh_4, false)

	-- Create ImageLigh_3
	local ImageLigh_3 = GUI:Image_Create(NodeLightEquip, "ImageLigh_3", 399.00, 352.00, "res/custom/ZhuangBeiQiangHua/1_7.png")
	GUI:setTouchEnabled(ImageLigh_3, false)
	GUI:setTag(ImageLigh_3, -1)
	GUI:setVisible(ImageLigh_3, false)

	-- Create ImageLigh_5
	local ImageLigh_5 = GUI:Image_Create(NodeLightEquip, "ImageLigh_5", 457.00, 273.00, "res/custom/ZhuangBeiQiangHua/1_8.png")
	GUI:setTouchEnabled(ImageLigh_5, false)
	GUI:setTag(ImageLigh_5, -1)
	GUI:setVisible(ImageLigh_5, false)

	-- Create ImageLigh_7
	local ImageLigh_7 = GUI:Image_Create(NodeLightEquip, "ImageLigh_7", 463.00, 237.00, "res/custom/ZhuangBeiQiangHua/1_9.png")
	GUI:setTouchEnabled(ImageLigh_7, false)
	GUI:setTag(ImageLigh_7, -1)
	GUI:setVisible(ImageLigh_7, false)

	-- Create ImageLigh_11
	local ImageLigh_11 = GUI:Image_Create(NodeLightEquip, "ImageLigh_11", 328.00, 56.00, "res/custom/ZhuangBeiQiangHua/1_10.png")
	GUI:setTouchEnabled(ImageLigh_11, false)
	GUI:setTag(ImageLigh_11, -1)
	GUI:setVisible(ImageLigh_11, false)

	-- Create playerBG
	local playerBG = GUI:Image_Create(NodePlayer, "playerBG", 149.00, 27.00, "res/custom/ZhuangBeiQiangHua/zhuangbeikuang.png")
	GUI:setTouchEnabled(playerBG, false)
	GUI:setTag(playerBG, -1)

	-- Create NodeEquip
	local NodeEquip = GUI:Node_Create(NodePlayer, "NodeEquip", 0.00, 0.00)
	GUI:setTag(NodeEquip, -1)

	-- Create ImageEquipCover_1
	local ImageEquipCover_1 = GUI:Image_Create(NodeEquip, "ImageEquipCover_1", 170.00, 383.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_1, false)
	GUI:setTag(ImageEquipCover_1, -1)

	-- Create EquipShow_1
	local EquipShow_1 = GUI:EquipShow_Create(ImageEquipCover_1, "EquipShow_1", 3.00, 3.00, 1, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_1, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_1)

	-- Create TextQH_1
	local TextQH_1 = GUI:Text_Create(ImageEquipCover_1, "TextQH_1", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_1, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_1, false)
	GUI:setTag(TextQH_1, -1)
	GUI:Text_enableOutline(TextQH_1, "#000000", 1)

	-- Create ImageEquipCover_0
	local ImageEquipCover_0 = GUI:Image_Create(NodeEquip, "ImageEquipCover_0", 170.00, 297.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_0, false)
	GUI:setTag(ImageEquipCover_0, -1)

	-- Create EquipShow_0
	local EquipShow_0 = GUI:EquipShow_Create(ImageEquipCover_0, "EquipShow_0", 3.00, 3.00, 0, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_0, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_0)

	-- Create TextQH_0
	local TextQH_0 = GUI:Text_Create(ImageEquipCover_0, "TextQH_0", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_0, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_0, false)
	GUI:setTag(TextQH_0, -1)
	GUI:Text_enableOutline(TextQH_0, "#000000", 1)

	-- Create ImageEquipCover_6
	local ImageEquipCover_6 = GUI:Image_Create(NodeEquip, "ImageEquipCover_6", 170.00, 211.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_6, false)
	GUI:setTag(ImageEquipCover_6, -1)

	-- Create EquipShow_6
	local EquipShow_6 = GUI:EquipShow_Create(ImageEquipCover_6, "EquipShow_6", 3.00, 3.00, 6, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_6, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_6)

	-- Create TextQH_6
	local TextQH_6 = GUI:Text_Create(ImageEquipCover_6, "TextQH_6", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_6, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_6, false)
	GUI:setTag(TextQH_6, -1)
	GUI:Text_enableOutline(TextQH_6, "#000000", 1)

	-- Create ImageEquipCover_8
	local ImageEquipCover_8 = GUI:Image_Create(NodeEquip, "ImageEquipCover_8", 170.00, 125.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_8, false)
	GUI:setTag(ImageEquipCover_8, -1)

	-- Create EquipShow_8
	local EquipShow_8 = GUI:EquipShow_Create(ImageEquipCover_8, "EquipShow_8", 3.00, 3.00, 8, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_8, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_8)

	-- Create TextQH_8
	local TextQH_8 = GUI:Text_Create(ImageEquipCover_8, "TextQH_8", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_8, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_8, false)
	GUI:setTag(TextQH_8, -1)
	GUI:Text_enableOutline(TextQH_8, "#000000", 1)

	-- Create ImageEquipCover_10
	local ImageEquipCover_10 = GUI:Image_Create(NodeEquip, "ImageEquipCover_10", 169.00, 39.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_10, false)
	GUI:setTag(ImageEquipCover_10, -1)

	-- Create EquipShow_10
	local EquipShow_10 = GUI:EquipShow_Create(ImageEquipCover_10, "EquipShow_10", 3.00, 3.00, 10, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_10, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_10)

	-- Create TextQH_10
	local TextQH_10 = GUI:Text_Create(ImageEquipCover_10, "TextQH_10", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_10, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_10, false)
	GUI:setTag(TextQH_10, -1)
	GUI:Text_enableOutline(TextQH_10, "#000000", 1)

	-- Create ImageEquipCover_4
	local ImageEquipCover_4 = GUI:Image_Create(NodeEquip, "ImageEquipCover_4", 570.00, 383.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_4, false)
	GUI:setTag(ImageEquipCover_4, -1)

	-- Create EquipShow_4
	local EquipShow_4 = GUI:EquipShow_Create(ImageEquipCover_4, "EquipShow_4", 3.00, 3.00, 4, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_4, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_4)

	-- Create TextQH_4
	local TextQH_4 = GUI:Text_Create(ImageEquipCover_4, "TextQH_4", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_4, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_4, false)
	GUI:setTag(TextQH_4, -1)
	GUI:Text_enableOutline(TextQH_4, "#000000", 1)

	-- Create ImageEquipCover_3
	local ImageEquipCover_3 = GUI:Image_Create(NodeEquip, "ImageEquipCover_3", 570.00, 297.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_3, false)
	GUI:setTag(ImageEquipCover_3, -1)

	-- Create EquipShow_3
	local EquipShow_3 = GUI:EquipShow_Create(ImageEquipCover_3, "EquipShow_3", 3.00, 3.00, 3, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_3, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_3)

	-- Create TextQH_3
	local TextQH_3 = GUI:Text_Create(ImageEquipCover_3, "TextQH_3", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_3, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_3, false)
	GUI:setTag(TextQH_3, -1)
	GUI:Text_enableOutline(TextQH_3, "#000000", 1)

	-- Create ImageEquipCover_5
	local ImageEquipCover_5 = GUI:Image_Create(NodeEquip, "ImageEquipCover_5", 571.00, 212.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_5, false)
	GUI:setTag(ImageEquipCover_5, -1)

	-- Create EquipShow_5
	local EquipShow_5 = GUI:EquipShow_Create(ImageEquipCover_5, "EquipShow_5", 3.00, 3.00, 5, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_5, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_5)

	-- Create TextQH_5
	local TextQH_5 = GUI:Text_Create(ImageEquipCover_5, "TextQH_5", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_5, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_5, false)
	GUI:setTag(TextQH_5, -1)
	GUI:Text_enableOutline(TextQH_5, "#000000", 1)

	-- Create ImageEquipCover_7
	local ImageEquipCover_7 = GUI:Image_Create(NodeEquip, "ImageEquipCover_7", 570.00, 125.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_7, false)
	GUI:setTag(ImageEquipCover_7, -1)

	-- Create EquipShow_7
	local EquipShow_7 = GUI:EquipShow_Create(ImageEquipCover_7, "EquipShow_7", 3.00, 3.00, 7, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_7, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_7)

	-- Create TextQH_7
	local TextQH_7 = GUI:Text_Create(ImageEquipCover_7, "TextQH_7", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_7, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_7, false)
	GUI:setTag(TextQH_7, -1)
	GUI:Text_enableOutline(TextQH_7, "#000000", 1)

	-- Create ImageEquipCover_11
	local ImageEquipCover_11 = GUI:Image_Create(NodeEquip, "ImageEquipCover_11", 570.00, 39.00, "res/custom/ZhuangBeiQiangHua/itemBg.png")
	GUI:setTouchEnabled(ImageEquipCover_11, false)
	GUI:setTag(ImageEquipCover_11, -1)

	-- Create EquipShow_11
	local EquipShow_11 = GUI:EquipShow_Create(ImageEquipCover_11, "EquipShow_11", 3.00, 3.00, 11, false, {starLv = false, look = true, movable = false, doubleTakeOff = false, bgVisible = false})
	GUI:setTag(EquipShow_11, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_11)

	-- Create TextQH_11
	local TextQH_11 = GUI:Text_Create(ImageEquipCover_11, "TextQH_11", 56.00, 10.00, 16, "#ffffff", [[+0]])
	GUI:setAnchorPoint(TextQH_11, 1.00, 0.00)
	GUI:setTouchEnabled(TextQH_11, false)
	GUI:setTag(TextQH_11, -1)
	GUI:Text_enableOutline(TextQH_11, "#000000", 1)

	-- Create NodeClick
	local NodeClick = GUI:Node_Create(NodeEquip, "NodeClick", 0.00, 0.00)
	GUI:setTag(NodeClick, -1)

	-- Create LayoutClick_1
	local LayoutClick_1 = GUI:Layout_Create(NodeClick, "LayoutClick_1", 170.00, 384.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_1, true)
	GUI:setTag(LayoutClick_1, -1)
	GUI:setSwallowTouches(LayoutClick_1, false)

	-- Create LayoutClick_0
	local LayoutClick_0 = GUI:Layout_Create(NodeClick, "LayoutClick_0", 170.00, 298.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_0, true)
	GUI:setTag(LayoutClick_0, -1)

	-- Create LayoutClick_6
	local LayoutClick_6 = GUI:Layout_Create(NodeClick, "LayoutClick_6", 170.00, 211.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_6, true)
	GUI:setTag(LayoutClick_6, -1)

	-- Create LayoutClick_8
	local LayoutClick_8 = GUI:Layout_Create(NodeClick, "LayoutClick_8", 170.00, 126.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_8, true)
	GUI:setTag(LayoutClick_8, -1)

	-- Create LayoutClick_10
	local LayoutClick_10 = GUI:Layout_Create(NodeClick, "LayoutClick_10", 170.00, 40.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_10, true)
	GUI:setTag(LayoutClick_10, -1)

	-- Create LayoutClick_3
	local LayoutClick_3 = GUI:Layout_Create(NodeClick, "LayoutClick_3", 570.00, 299.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_3, true)
	GUI:setTag(LayoutClick_3, -1)

	-- Create LayoutClick_4
	local LayoutClick_4 = GUI:Layout_Create(NodeClick, "LayoutClick_4", 570.00, 384.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_4, true)
	GUI:setTag(LayoutClick_4, -1)

	-- Create LayoutClick_5
	local LayoutClick_5 = GUI:Layout_Create(NodeClick, "LayoutClick_5", 570.00, 213.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_5, true)
	GUI:setTag(LayoutClick_5, -1)

	-- Create LayoutClick_7
	local LayoutClick_7 = GUI:Layout_Create(NodeClick, "LayoutClick_7", 570.00, 124.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_7, true)
	GUI:setTag(LayoutClick_7, -1)

	-- Create LayoutClick_11
	local LayoutClick_11 = GUI:Layout_Create(NodeClick, "LayoutClick_11", 570.00, 39.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(LayoutClick_11, true)
	GUI:setTag(LayoutClick_11, -1)

	-- Create NodeSelected
	local NodeSelected = GUI:Node_Create(NodePlayer, "NodeSelected", 0.00, 0.00)
	GUI:setTag(NodeSelected, -1)

	-- Create NodeRight
	local NodeRight = GUI:Node_Create(ImageBG, "NodeRight", 0.00, 0.00)
	GUI:setTag(NodeRight, -1)

	-- Create ShowLevel
	local ShowLevel = GUI:Button_Create(NodeRight, "ShowLevel", 805.00, 375.00, "res/custom/ZhuangBeiQiangHua/level_1.png")
	GUI:Button_setTitleText(ShowLevel, "")
	GUI:Button_setTitleColor(ShowLevel, "#ffffff")
	GUI:Button_setTitleFontSize(ShowLevel, 14)
	GUI:Button_titleEnableOutline(ShowLevel, "#000000", 1)
	GUI:setTouchEnabled(ShowLevel, false)
	GUI:setTag(ShowLevel, -1)

	-- Create TextAttr
	local TextAttr = GUI:Text_Create(NodeRight, "TextAttr", 757.00, 348.00, 18, "#00ff00", [[文本]])
	GUI:setAnchorPoint(TextAttr, 0.00, 1.00)
	GUI:setTouchEnabled(TextAttr, false)
	GUI:setTag(TextAttr, -1)
	GUI:Text_enableOutline(TextAttr, "#000000", 1)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(NodeRight, "LayoutCost", 678.00, 189.00, 100.00, 60.00, false)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)

	-- Create TextCGL
	local TextCGL = GUI:Text_Create(NodeRight, "TextCGL", 775.00, 129.00, 18, "#00ff00", [[文本]])
	GUI:setTouchEnabled(TextCGL, false)
	GUI:setTag(TextCGL, -1)
	GUI:Text_enableOutline(TextCGL, "#000000", 2)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(NodeRight, "ButtonStart", 736.00, 40.00, "res/custom/public/btn_qianghua.png")
	GUI:Button_setTitleText(ButtonStart, "")
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(NodeRight, "ButtonHelp", 881.00, 362.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(ButtonHelp, "")
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 14)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, -1)
end
return ui