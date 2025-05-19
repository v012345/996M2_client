local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ChaoShenQiFeiSheng/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 947.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 15.00, 12.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AllEquipShow
	local AllEquipShow = GUI:Node_Create(ImageBG, "AllEquipShow", 0.00, 0.00)
	GUI:setTag(AllEquipShow, 0)

	-- Create EquipShow01
	local EquipShow01 = GUI:EquipShow_Create(AllEquipShow, "EquipShow01", 343.00, 414.00, 71, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow01)
	GUI:setAnchorPoint(EquipShow01, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow01, false)
	GUI:setTag(EquipShow01, -1)

	-- Create EquipShow02
	local EquipShow02 = GUI:EquipShow_Create(AllEquipShow, "EquipShow02", 462.00, 346.00, 72, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow02)
	GUI:setAnchorPoint(EquipShow02, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow02, false)
	GUI:setTag(EquipShow02, -1)

	-- Create EquipShow03
	local EquipShow03 = GUI:EquipShow_Create(AllEquipShow, "EquipShow03", 462.00, 210.00, 73, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow03)
	GUI:setAnchorPoint(EquipShow03, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow03, false)
	GUI:setTag(EquipShow03, -1)

	-- Create EquipShow04
	local EquipShow04 = GUI:EquipShow_Create(AllEquipShow, "EquipShow04", 343.00, 143.00, 74, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow04)
	GUI:setAnchorPoint(EquipShow04, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow04, false)
	GUI:setTag(EquipShow04, -1)

	-- Create EquipShow05
	local EquipShow05 = GUI:EquipShow_Create(AllEquipShow, "EquipShow05", 226.00, 211.00, 75, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow05)
	GUI:setAnchorPoint(EquipShow05, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow05, false)
	GUI:setTag(EquipShow05, -1)

	-- Create EquipShow06
	local EquipShow06 = GUI:EquipShow_Create(AllEquipShow, "EquipShow06", 226.00, 348.00, 76, false, {bgVisible = false, doubleTakeOff = false, look = false, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow06)
	GUI:setAnchorPoint(EquipShow06, 0.50, 0.50)
	GUI:setTouchEnabled(EquipShow06, false)
	GUI:setTag(EquipShow06, -1)

	-- Create AllLayout
	local AllLayout = GUI:Node_Create(ImageBG, "AllLayout", 0.00, 0.00)
	GUI:setTag(AllLayout, 0)

	-- Create Layout_widget_1
	local Layout_widget_1 = GUI:Layout_Create(AllLayout, "Layout_widget_1", 311.00, 383.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_1, true)
	GUI:setTag(Layout_widget_1, -1)

	-- Create Layout_widget_2
	local Layout_widget_2 = GUI:Layout_Create(AllLayout, "Layout_widget_2", 430.00, 315.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_2, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_2, true)
	GUI:setTag(Layout_widget_2, -1)

	-- Create Layout_widget_3
	local Layout_widget_3 = GUI:Layout_Create(AllLayout, "Layout_widget_3", 428.00, 179.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_3, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_3, true)
	GUI:setTag(Layout_widget_3, -1)

	-- Create Layout_widget_4
	local Layout_widget_4 = GUI:Layout_Create(AllLayout, "Layout_widget_4", 312.00, 110.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_4, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_4, true)
	GUI:setTag(Layout_widget_4, -1)

	-- Create Layout_widget_5
	local Layout_widget_5 = GUI:Layout_Create(AllLayout, "Layout_widget_5", 194.00, 178.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_5, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_5, true)
	GUI:setTag(Layout_widget_5, -1)

	-- Create Layout_widget_6
	local Layout_widget_6 = GUI:Layout_Create(AllLayout, "Layout_widget_6", 194.00, 315.00, 62, 62, false)
	GUI:setAnchorPoint(Layout_widget_6, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_widget_6, true)
	GUI:setTag(Layout_widget_6, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(AllLayout, "NodeSelect", 0.00, 0.00)
	GUI:setTag(NodeSelect, -1)

	-- Create AllLevelLooks
	local AllLevelLooks = GUI:Node_Create(ImageBG, "AllLevelLooks", 0.00, 0.00)
	GUI:setTag(AllLevelLooks, 0)

	-- Create LevelNum_1
	local LevelNum_1 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_1", 352.00, 355.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_1, 0.00, 0.00)
	GUI:setScale(LevelNum_1, 0.60)
	GUI:setTouchEnabled(LevelNum_1, false)
	GUI:setTag(LevelNum_1, 0)

	-- Create LevelNum_2
	local LevelNum_2 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_2", 470.00, 287.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_2, 0.00, 0.00)
	GUI:setScale(LevelNum_2, 0.60)
	GUI:setTouchEnabled(LevelNum_2, false)
	GUI:setTag(LevelNum_2, 0)

	-- Create LevelNum_3
	local LevelNum_3 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_3", 471.00, 151.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_3, 0.00, 0.00)
	GUI:setScale(LevelNum_3, 0.60)
	GUI:setTouchEnabled(LevelNum_3, false)
	GUI:setTag(LevelNum_3, 0)

	-- Create LevelNum_4
	local LevelNum_4 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_4", 354.00, 86.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_4, 0.00, 0.00)
	GUI:setScale(LevelNum_4, 0.60)
	GUI:setTouchEnabled(LevelNum_4, false)
	GUI:setTag(LevelNum_4, 0)

	-- Create LevelNum_5
	local LevelNum_5 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_5", 236.00, 152.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_5, 0.00, 0.00)
	GUI:setScale(LevelNum_5, 0.60)
	GUI:setTouchEnabled(LevelNum_5, false)
	GUI:setTag(LevelNum_5, 0)

	-- Create LevelNum_6
	local LevelNum_6 = GUI:TextAtlas_Create(AllLevelLooks, "LevelNum_6", 236.00, 287.00, "1", "res/custom/JuQing/numlook1.png", 24, 44, ".")
	GUI:setAnchorPoint(LevelNum_6, 0.00, 0.00)
	GUI:setScale(LevelNum_6, 0.60)
	GUI:setTouchEnabled(LevelNum_6, false)
	GUI:setTag(LevelNum_6, 0)

	-- Create AllAttrLooks_L
	local AllAttrLooks_L = GUI:Node_Create(ImageBG, "AllAttrLooks_L", 0.00, 0.00)
	GUI:setTag(AllAttrLooks_L, 0)

	-- Create AttrLook_L_1
	local AttrLook_L_1 = GUI:Text_Create(AllAttrLooks_L, "AttrLook_L_1", 653.00, 350.00, 16, "#00ff00", [[全 属 性+0%]])
	GUI:Text_enableOutline(AttrLook_L_1, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_L_1, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_L_1, false)
	GUI:setTag(AttrLook_L_1, 0)

	-- Create AttrLook_L_2
	local AttrLook_L_2 = GUI:Text_Create(AllAttrLooks_L, "AttrLook_L_2", 653.00, 325.00, 16, "#00ff00", [[攻 击 力+0%]])
	GUI:Text_enableOutline(AttrLook_L_2, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_L_2, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_L_2, false)
	GUI:setTag(AttrLook_L_2, 0)

	-- Create AttrLook_L_3
	local AttrLook_L_3 = GUI:Text_Create(AllAttrLooks_L, "AttrLook_L_3", 653.00, 301.00, 16, "#00ff00", [[血 量 值+0%]])
	GUI:Text_enableOutline(AttrLook_L_3, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_L_3, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_L_3, false)
	GUI:setTag(AttrLook_L_3, 0)

	-- Create AllAttrLooks_R
	local AllAttrLooks_R = GUI:Node_Create(ImageBG, "AllAttrLooks_R", 0.00, 0.00)
	GUI:setTag(AllAttrLooks_R, 0)

	-- Create AttrLook_R_1
	local AttrLook_R_1 = GUI:Text_Create(AllAttrLooks_R, "AttrLook_R_1", 856.00, 350.00, 16, "#00ff00", [[全 属 性+0%]])
	GUI:Text_enableOutline(AttrLook_R_1, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_R_1, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_R_1, false)
	GUI:setTag(AttrLook_R_1, 0)

	-- Create AttrLook_R_2
	local AttrLook_R_2 = GUI:Text_Create(AllAttrLooks_R, "AttrLook_R_2", 856.00, 325.00, 16, "#00ff00", [[攻 击 力+0%]])
	GUI:Text_enableOutline(AttrLook_R_2, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_R_2, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_R_2, false)
	GUI:setTag(AttrLook_R_2, 0)

	-- Create AttrLook_R_3
	local AttrLook_R_3 = GUI:Text_Create(AllAttrLooks_R, "AttrLook_R_3", 856.00, 300.00, 16, "#00ff00", [[血 量 值+0%]])
	GUI:Text_enableOutline(AttrLook_R_3, "#000000", 1)
	GUI:setAnchorPoint(AttrLook_R_3, 0.50, 0.00)
	GUI:setTouchEnabled(AttrLook_R_3, false)
	GUI:setTag(AttrLook_R_3, 0)

	-- Create CostShow
	local CostShow = GUI:Layout_Create(ImageBG, "CostShow", 601.00, 109.00, 298, 66, false)
	GUI:setAnchorPoint(CostShow, 0.00, 0.00)
	GUI:setTouchEnabled(CostShow, true)
	GUI:setTag(CostShow, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 645.00, 20.00, "res/custom/ChaoShenQiFeiSheng/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_Tips
	local Button_Tips = GUI:Button_Create(ImageBG, "Button_Tips", 501.00, 422.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(Button_Tips, [[]])
	GUI:Button_setTitleColor(Button_Tips, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Tips, 16)
	GUI:Button_titleEnableOutline(Button_Tips, "#000000", 1)
	GUI:setAnchorPoint(Button_Tips, 0.00, 0.00)
	GUI:setScale(Button_Tips, 0.60)
	GUI:setTouchEnabled(Button_Tips, true)
	GUI:setTag(Button_Tips, 0)

	-- Create Image_Tips
	local Image_Tips = GUI:Image_Create(ImageBG, "Image_Tips", 245.00, 285.00, "res/custom/ChaoShenQiFeiSheng/tips.png")
	GUI:setAnchorPoint(Image_Tips, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Tips, false)
	GUI:setTag(Image_Tips, 0)
	GUI:setVisible(Image_Tips, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
