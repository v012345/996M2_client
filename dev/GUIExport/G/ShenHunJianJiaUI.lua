local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ShenHunJianJia/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 948.00, 450.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create EquipShow1
	local EquipShow1 = GUI:EquipShow_Create(ImageBG, "EquipShow1", 199.00, 319.00, 1, false, {bgVisible = false, lookPlayer = false, starLv = false, doubleTakeOff = false, look = true, movable = false})
	GUI:setTag(EquipShow1, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow1)

	-- Create EquipShow2
	local EquipShow2 = GUI:EquipShow_Create(ImageBG, "EquipShow2", 199.00, 118.00, 0, false, {bgVisible = false, lookPlayer = false, starLv = false, doubleTakeOff = false, look = true, movable = false})
	GUI:setTag(EquipShow2, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow2)

	-- Create Button_wuqi
	local Button_wuqi = GUI:Button_Create(ImageBG, "Button_wuqi", 165.00, 246.00, "res/custom/ShenHunJianJia/sel_btn1.png")
	GUI:Button_setTitleText(Button_wuqi, "")
	GUI:Button_setTitleColor(Button_wuqi, "#ffffff")
	GUI:Button_setTitleFontSize(Button_wuqi, 14)
	GUI:Button_titleEnableOutline(Button_wuqi, "#000000", 1)
	GUI:setTouchEnabled(Button_wuqi, true)
	GUI:setTag(Button_wuqi, -1)

	-- Create Button_yifu
	local Button_yifu = GUI:Button_Create(ImageBG, "Button_yifu", 165.00, 44.00, "res/custom/ShenHunJianJia/sel_btn2.png")
	GUI:Button_setTitleText(Button_yifu, "")
	GUI:Button_setTitleColor(Button_yifu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_yifu, 14)
	GUI:Button_titleEnableOutline(Button_yifu, "#000000", 1)
	GUI:setTouchEnabled(Button_yifu, true)
	GUI:setTag(Button_yifu, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 611.00, 322.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 62, 62)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Node_level
	local Node_level = GUI:Node_Create(ImageBG, "Node_level", 439.00, 222.00)
	GUI:setTag(Node_level, -1)

	-- Create levellooks
	local levellooks = GUI:Text_Create(ImageBG, "levellooks", 681.00, 406.00, 20, "#4ae74a", [[0]])
	GUI:setAnchorPoint(levellooks, 0.50, 0.00)
	GUI:setTouchEnabled(levellooks, false)
	GUI:setTag(levellooks, -1)
	GUI:Text_enableOutline(levellooks, "#000000", 1)

	-- Create attlooks
	local attlooks = GUI:Text_Create(ImageBG, "attlooks", 629.00, 270.00, 20, "#4ae74a", [[请穿戴装备]])
	GUI:setTouchEnabled(attlooks, false)
	GUI:setTag(attlooks, -1)
	GUI:Text_enableOutline(attlooks, "#000000", 1)

	-- Create ranlooks
	local ranlooks = GUI:Text_Create(ImageBG, "ranlooks", 507.00, 100.00, 18, "#00ff00", [[请穿戴装备]])
	GUI:setTouchEnabled(ranlooks, false)
	GUI:setTag(ranlooks, -1)
	GUI:Text_enableOutline(ranlooks, "#000000", 1)

	-- Create ranlooks_1
	local ranlooks_1 = GUI:Text_Create(ImageBG, "ranlooks_1", 808.00, 100.00, 18, "#00ff00", [[请穿戴装备]])
	GUI:setTouchEnabled(ranlooks_1, false)
	GUI:setTag(ranlooks_1, -1)
	GUI:Text_enableOutline(ranlooks_1, "#000000", 1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 885.00, 380.00, "res/custom/jianjiaqianghua/tips.png")
	GUI:Button_setTitleText(ButtonHelp, "")
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 14)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, -1)

	-- Create NodeShowCost
	local NodeShowCost = GUI:Node_Create(ImageBG, "NodeShowCost", 0.00, 0.00)
	GUI:setTag(NodeShowCost, -1)

	-- Create LayoutLeft
	local LayoutLeft = GUI:Layout_Create(NodeShowCost, "LayoutLeft", 404.00, 84.00, 300.00, 150.00, false)
	GUI:setTouchEnabled(LayoutLeft, false)
	GUI:setTag(LayoutLeft, -1)

	-- Create LayoutCost1
	local LayoutCost1 = GUI:Layout_Create(LayoutLeft, "LayoutCost1", -21.00, 56.00, 150.00, 60.00, false)
	GUI:setTouchEnabled(LayoutCost1, false)
	GUI:setTag(LayoutCost1, -1)

	-- Create ButtonCost1
	local ButtonCost1 = GUI:Button_Create(LayoutLeft, "ButtonCost1", -15.00, -57.00, "res/custom/ShenHunJianJia/btn1.png")
	GUI:Button_setTitleText(ButtonCost1, "")
	GUI:Button_setTitleColor(ButtonCost1, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonCost1, 14)
	GUI:Button_titleEnableOutline(ButtonCost1, "#000000", 1)
	GUI:setTouchEnabled(ButtonCost1, true)
	GUI:setTag(ButtonCost1, -1)

	-- Create LayoutRight
	local LayoutRight = GUI:Layout_Create(NodeShowCost, "LayoutRight", 688.00, 79.00, 300.00, 150.00, false)
	GUI:setTouchEnabled(LayoutRight, false)
	GUI:setTag(LayoutRight, -1)

	-- Create LayoutCost2
	local LayoutCost2 = GUI:Layout_Create(LayoutRight, "LayoutCost2", 3.00, 62.00, 150.00, 60.00, false)
	GUI:setTouchEnabled(LayoutCost2, false)
	GUI:setTag(LayoutCost2, -1)

	-- Create ButtonCost2
	local ButtonCost2 = GUI:Button_Create(LayoutRight, "ButtonCost2", 12.00, -52.00, "res/custom/ShenHunJianJia/btn2.png")
	GUI:Button_setTitleText(ButtonCost2, "")
	GUI:Button_setTitleColor(ButtonCost2, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonCost2, 14)
	GUI:Button_titleEnableOutline(ButtonCost2, "#000000", 1)
	GUI:setTouchEnabled(ButtonCost2, true)
	GUI:setTag(ButtonCost2, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(ImageBG, "NodeSelect", 0.00, 0.00)
	GUI:setTag(NodeSelect, -1)
end
return ui