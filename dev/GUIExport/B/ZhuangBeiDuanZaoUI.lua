local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/jianjiaqianghua/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 1000.00, 499.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create EquipShow1
	local EquipShow1 = GUI:EquipShow_Create(ImageBG, "EquipShow1", 252.00, 367.00, 1, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow1)
	GUI:setAnchorPoint(EquipShow1, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow1, false)
	GUI:setTag(EquipShow1, -1)

	-- Create EquipShow2
	local EquipShow2 = GUI:EquipShow_Create(ImageBG, "EquipShow2", 252.00, 167.00, 0, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow2)
	GUI:setAnchorPoint(EquipShow2, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow2, false)
	GUI:setTag(EquipShow2, -1)

	-- Create Button_wuqi
	local Button_wuqi = GUI:Button_Create(ImageBG, "Button_wuqi", 229.00, 288.00, "res/custom/jianjiaqianghua/an_3.png")
	GUI:Button_setTitleText(Button_wuqi, [[]])
	GUI:Button_setTitleColor(Button_wuqi, "#ffffff")
	GUI:Button_setTitleFontSize(Button_wuqi, 14)
	GUI:Button_titleEnableOutline(Button_wuqi, "#000000", 1)
	GUI:setAnchorPoint(Button_wuqi, 0.00, 0.00)
	GUI:setTouchEnabled(Button_wuqi, true)
	GUI:setTag(Button_wuqi, -1)

	-- Create Button_yifu
	local Button_yifu = GUI:Button_Create(ImageBG, "Button_yifu", 229.00, 90.00, "res/custom/jianjiaqianghua/an_2.png")
	GUI:Button_setTitleText(Button_yifu, [[]])
	GUI:Button_setTitleColor(Button_yifu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_yifu, 14)
	GUI:Button_titleEnableOutline(Button_yifu, "#000000", 1)
	GUI:setAnchorPoint(Button_yifu, 0.00, 0.00)
	GUI:setTouchEnabled(Button_yifu, true)
	GUI:setTag(Button_yifu, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 664.00, 391.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 62, 62)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Node_level
	local Node_level = GUI:Node_Create(ImageBG, "Node_level", 490.00, 340.00)
	GUI:setTag(Node_level, -1)

	-- Create levellooks
	local levellooks = GUI:Text_Create(ImageBG, "levellooks", 677.00, 303.00, 16, "#4ae74a", [[请穿戴装备]])
	GUI:setAnchorPoint(levellooks, 0.00, 0.00)
	GUI:setTouchEnabled(levellooks, false)
	GUI:setTag(levellooks, -1)
	GUI:Text_enableOutline(levellooks, "#000000", 1)

	-- Create attlooks
	local attlooks = GUI:Text_Create(ImageBG, "attlooks", 677.00, 270.00, 16, "#4ae74a", [[请穿戴装备]])
	GUI:setAnchorPoint(attlooks, 0.00, 0.00)
	GUI:setTouchEnabled(attlooks, false)
	GUI:setTag(attlooks, -1)
	GUI:Text_enableOutline(attlooks, "#000000", 1)

	-- Create ranlooks
	local ranlooks = GUI:Text_Create(ImageBG, "ranlooks", 677.00, 238.00, 16, "#f7e700", [[请穿戴装备]])
	GUI:setAnchorPoint(ranlooks, 0.00, 0.00)
	GUI:setTouchEnabled(ranlooks, false)
	GUI:setTag(ranlooks, -1)
	GUI:Text_enableOutline(ranlooks, "#000000", 1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 920.00, 436.00, "res/custom/jianjiaqianghua/tips.png")
	GUI:Button_setTitleText(ButtonHelp, [[]])
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 14)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setAnchorPoint(ButtonHelp, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, -1)

	-- Create NodeShowCost
	local NodeShowCost = GUI:Node_Create(ImageBG, "NodeShowCost", 0.00, 0.00)
	GUI:setTag(NodeShowCost, -1)

	-- Create LayoutLeft
	local LayoutLeft = GUI:Layout_Create(NodeShowCost, "LayoutLeft", 404.00, 84.00, 300, 150, false)
	GUI:setAnchorPoint(LayoutLeft, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutLeft, false)
	GUI:setTag(LayoutLeft, -1)

	-- Create ImageView
	ImageView = GUI:Image_Create(LayoutLeft, "ImageView", -7.00, 112.00, "res/custom/jianjiaqianghua/itemk.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create LayoutCost1
	local LayoutCost1 = GUI:Layout_Create(LayoutLeft, "LayoutCost1", 20.00, 62.00, 150, 60, false)
	GUI:setAnchorPoint(LayoutCost1, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutCost1, false)
	GUI:setTag(LayoutCost1, -1)

	-- Create ButtonCost1
	local ButtonCost1 = GUI:Button_Create(LayoutLeft, "ButtonCost1", 63.00, -4.00, "res/custom/jianjiaqianghua/an_qr.png")
	GUI:Button_setTitleText(ButtonCost1, [[]])
	GUI:Button_setTitleColor(ButtonCost1, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonCost1, 14)
	GUI:Button_titleEnableOutline(ButtonCost1, "#000000", 1)
	GUI:setAnchorPoint(ButtonCost1, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonCost1, true)
	GUI:setTag(ButtonCost1, -1)

	-- Create LayoutRight
	local LayoutRight = GUI:Layout_Create(NodeShowCost, "LayoutRight", 688.00, 79.00, 300, 150, false)
	GUI:setAnchorPoint(LayoutRight, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutRight, false)
	GUI:setTag(LayoutRight, -1)
	GUI:setVisible(LayoutRight, false)

	-- Create ImageView
	ImageView = GUI:Image_Create(LayoutRight, "ImageView", 4.00, 117.00, "res/custom/jianjiaqianghua/itemk.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create LayoutCost2
	local LayoutCost2 = GUI:Layout_Create(LayoutRight, "LayoutCost2", 34.00, 67.00, 150, 60, false)
	GUI:setAnchorPoint(LayoutCost2, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutCost2, false)
	GUI:setTag(LayoutCost2, -1)

	-- Create ButtonCost2
	local ButtonCost2 = GUI:Button_Create(LayoutRight, "ButtonCost2", 76.00, 1.00, "res/custom/jianjiaqianghua/an_yb.png")
	GUI:Button_setTitleText(ButtonCost2, [[]])
	GUI:Button_setTitleColor(ButtonCost2, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonCost2, 14)
	GUI:Button_titleEnableOutline(ButtonCost2, "#000000", 1)
	GUI:setAnchorPoint(ButtonCost2, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonCost2, true)
	GUI:setTag(ButtonCost2, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(ImageBG, "NodeSelect", 0.00, 0.00)
	GUI:setTag(NodeSelect, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 282.00, 523.00, "res/custom/jianjiaqianghua/title.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
