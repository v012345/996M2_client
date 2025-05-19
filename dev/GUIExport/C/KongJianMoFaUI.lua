local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 19.00, "res/custom/KongJianMoFa/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 782.00, 425.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodeEquipShow
	local NodeEquipShow = GUI:Node_Create(ImageBG, "NodeEquipShow", 37.00, 23.00)
	GUI:setTag(NodeEquipShow, -1)

	-- Create Item
	local Item = GUI:ItemShow_Create(NodeEquipShow, "Item", 710.00, 379.00, {count = 1, index = 1, isShowEff = false, bgVisible = false, look = true, showModelEffect = false})
	GUI:setAnchorPoint(Item, 0.50, 0.50)
	GUI:setTag(Item, -1)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(NodeEquipShow, "LayoutCost", 511.00, 91.00, 180.00, 50.00, false)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(NodeEquipShow, "EquipShow", 461.00, 348.00, 29, false, {bgVisible = false, look = true})
	GUI:setTag(EquipShow, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow)

	-- Create ButtonGo
	local ButtonGo = GUI:Button_Create(ImageBG, "ButtonGo", 548.00, 42.00, "res/custom/KongJianMoFa/btn.png")
	GUI:Button_setTitleText(ButtonGo, "")
	GUI:Button_setTitleColor(ButtonGo, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGo, 14)
	GUI:Button_titleEnableOutline(ButtonGo, "#000000", 1)
	GUI:setTouchEnabled(ButtonGo, true)
	GUI:setTag(ButtonGo, -1)

	-- Create Node_Left
	local Node_Left = GUI:Node_Create(ImageBG, "Node_Left", 0.00, 0.00)
	GUI:setTag(Node_Left, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Node_Left, "Text_1", 550.00, 296.00, 18, "#ebe9c8", [[]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Node_Left, "Text_2", 550.00, 259.00, 18, "#ebe9c8", [[]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(Node_Left, "Text_3", 550.00, 222.00, 18, "#ebe9c8", [[]])
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Node_Right
	local Node_Right = GUI:Node_Create(ImageBG, "Node_Right", 0.00, 0.00)
	GUI:setTag(Node_Right, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Node_Right, "Text_1", 749.00, 296.00, 18, "#68e226", [[]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Node_Right, "Text_2", 749.00, 259.00, 18, "#68e226", [[]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(Node_Right, "Text_3", 749.00, 222.00, 18, "#68e226", [[]])
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)
end
return ui