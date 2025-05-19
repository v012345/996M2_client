local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 148.00, 33.00, "res/custom/JuQing/GeBuLinDeRuoDian/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 792.00, 444.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_button
	local Node_button = GUI:Node_Create(ImageBG, "Node_button", 0.00, 0.00)
	GUI:setTag(Node_button, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_button, "Button_1", 607.00, 372.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_button, "Button_2", 752.00, 286.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_button, "Button_3", 718.00, 139.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_button, "Button_4", 496.00, 138.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_4, "")
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_button, "Button_5", 458.00, 286.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_5, "")
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Node_panel
	local Node_panel = GUI:Node_Create(ImageBG, "Node_panel", 0.00, 0.00)
	GUI:setTag(Node_panel, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_panel, "Panel_1", 619.00, 421.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Node_panel, "Panel_2", 765.00, 333.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Node_panel, "Panel_3", 732.00, 187.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(Node_panel, "Panel_4", 509.00, 187.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(Node_panel, "Panel_5", 470.00, 332.00, 50.00, 50.00, false)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create Panel_6
	local Panel_6 = GUI:Layout_Create(ImageBG, "Panel_6", 616.00, 275.00, 60.00, 60.00, false)
	GUI:setTouchEnabled(Panel_6, true)
	GUI:setTag(Panel_6, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(ImageBG, "Button_6", 595.00, 226.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(Button_6, "")
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Effect_1
	local Effect_1 = GUI:Effect_Create(ImageBG, "Effect_1", 225.00, 326.00, 0, 40092, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)
end
return ui