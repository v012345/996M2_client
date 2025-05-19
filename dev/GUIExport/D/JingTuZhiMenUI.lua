local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, -2.00, "res/custom/shijianmigong/jm_2.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 851.00, 452.00, 86.00, 86.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 827.00, 204.00, 19, "#5ddd5a", [[0/0]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 644.00, 232.00, 65.00, 60.00, false)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 567.00, 84.00, "res/custom/public/btn_jinrufuben.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_Effect
	local Panel_Effect = GUI:Layout_Create(ImageBG, "Panel_Effect", 281.00, 169.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_Effect, true)
	GUI:setTag(Panel_Effect, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 157.00, 169.00)
	GUI:setTag(Node_1, 0)

	-- Create Panel_item_1
	local Panel_item_1 = GUI:Layout_Create(Node_1, "Panel_item_1", 22.00, -84.00, 59.00, 59.00, false)
	GUI:setTouchEnabled(Panel_item_1, true)
	GUI:setTag(Panel_item_1, 0)

	-- Create Panel_item_2
	local Panel_item_2 = GUI:Layout_Create(Node_1, "Panel_item_2", 109.00, -84.00, 59.00, 59.00, false)
	GUI:setTouchEnabled(Panel_item_2, true)
	GUI:setTag(Panel_item_2, 0)

	-- Create Panel_item_3
	local Panel_item_3 = GUI:Layout_Create(Node_1, "Panel_item_3", 196.00, -84.00, 59.00, 59.00, false)
	GUI:setTouchEnabled(Panel_item_3, true)
	GUI:setTag(Panel_item_3, 0)

	-- Create Panel_item_4
	local Panel_item_4 = GUI:Layout_Create(Node_1, "Panel_item_4", 283.00, -84.00, 59.00, 59.00, false)
	GUI:setTouchEnabled(Panel_item_4, true)
	GUI:setTag(Panel_item_4, 0)


end
return ui