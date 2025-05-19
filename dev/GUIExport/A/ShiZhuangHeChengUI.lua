local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 61.00, 43.00, "res/custom/shizhuang/backround.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 953.00, 450.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ImageViewBG
	local ImageViewBG = GUI:Image_Create(ImageBG, "ImageViewBG", -14.00, 12.00, "res/private/gui_edit/ImageFile.png")
	GUI:setContentSize(ImageViewBG, 0, 0)
	GUI:setIgnoreContentAdaptWithSize(ImageViewBG, false)
	GUI:setTouchEnabled(ImageViewBG, false)
	GUI:setTag(ImageViewBG, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageViewBG, "Layout", 497.00, 55.00, 300.00, 60.00, false)
	GUI:setAnchorPoint(Layout, 0.50, 0.50)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create NodeLeft
	local NodeLeft = GUI:Node_Create(ImageBG, "NodeLeft", 0.00, 0.00)
	GUI:setTag(NodeLeft, -1)

	-- Create TextAtt_1
	local TextAtt_1 = GUI:Text_Create(NodeLeft, "TextAtt_1", 231.00, 390.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_1, false)
	GUI:setTag(TextAtt_1, -1)
	GUI:Text_enableOutline(TextAtt_1, "#000000", 1)

	-- Create TextAtt_2
	local TextAtt_2 = GUI:Text_Create(NodeLeft, "TextAtt_2", 231.00, 358.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_2, false)
	GUI:setTag(TextAtt_2, -1)
	GUI:Text_enableOutline(TextAtt_2, "#000000", 1)

	-- Create TextAtt_3
	local TextAtt_3 = GUI:Text_Create(NodeLeft, "TextAtt_3", 231.00, 325.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_3, false)
	GUI:setTag(TextAtt_3, -1)
	GUI:Text_enableOutline(TextAtt_3, "#000000", 1)

	-- Create TextAtt_4
	local TextAtt_4 = GUI:Text_Create(NodeLeft, "TextAtt_4", 231.00, 292.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_4, false)
	GUI:setTag(TextAtt_4, -1)
	GUI:Text_enableOutline(TextAtt_4, "#000000", 1)

	-- Create TextAtt_5
	local TextAtt_5 = GUI:Text_Create(NodeLeft, "TextAtt_5", 231.00, 258.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_5, false)
	GUI:setTag(TextAtt_5, -1)
	GUI:Text_enableOutline(TextAtt_5, "#000000", 1)

	-- Create TextAtt_6
	local TextAtt_6 = GUI:Text_Create(NodeLeft, "TextAtt_6", 231.00, 225.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_6, false)
	GUI:setTag(TextAtt_6, -1)
	GUI:Text_enableOutline(TextAtt_6, "#000000", 1)

	-- Create TextAtt_7
	local TextAtt_7 = GUI:Text_Create(NodeLeft, "TextAtt_7", 231.00, 192.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_7, false)
	GUI:setTag(TextAtt_7, -1)
	GUI:Text_enableOutline(TextAtt_7, "#000000", 1)

	-- Create TextAtt_8
	local TextAtt_8 = GUI:Text_Create(NodeLeft, "TextAtt_8", 231.00, 159.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_8, false)
	GUI:setTag(TextAtt_8, -1)
	GUI:Text_enableOutline(TextAtt_8, "#000000", 1)

	-- Create TextAtt_9
	local TextAtt_9 = GUI:Text_Create(NodeLeft, "TextAtt_9", 231.00, 126.00, 16, "#ffffff", [[0]])
	GUI:setTouchEnabled(TextAtt_9, false)
	GUI:setTag(TextAtt_9, -1)
	GUI:Text_enableOutline(TextAtt_9, "#000000", 1)

	-- Create Node
	local Node = GUI:Node_Create(ImageBG, "Node", 205.00, 20.00)
	GUI:setTag(Node, -1)

	-- Create LayoutEffectNan
	local LayoutEffectNan = GUI:Layout_Create(Node, "LayoutEffectNan", 127.00, 108.00, 320.00, 330.00, false)
	GUI:setTouchEnabled(LayoutEffectNan, false)
	GUI:setTag(LayoutEffectNan, -1)

	-- Create LayoutEffectNv
	local LayoutEffectNv = GUI:Layout_Create(Node, "LayoutEffectNv", 434.00, 108.00, 320.00, 330.00, false)
	GUI:setTouchEnabled(LayoutEffectNv, false)
	GUI:setTag(LayoutEffectNv, -1)

	-- Create TextEquipTitle
	local TextEquipTitle = GUI:Text_Create(Node, "TextEquipTitle", 30.00, 422.00, 18, "#e2d07e", [[]])
	GUI:setAnchorPoint(TextEquipTitle, 0.50, 0.50)
	GUI:setTouchEnabled(TextEquipTitle, false)
	GUI:setTag(TextEquipTitle, -1)
	GUI:Text_enableOutline(TextEquipTitle, "#000000", 2)

	-- Create ButtonRequest
	local ButtonRequest = GUI:Button_Create(Node, "ButtonRequest", 553.00, 18.00, "res/custom/shizhuang/btn.png")
	GUI:Button_setTitleText(ButtonRequest, "")
	GUI:Button_setTitleColor(ButtonRequest, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonRequest, 14)
	GUI:Button_titleEnableOutline(ButtonRequest, "#000000", 1)
	GUI:setTouchEnabled(ButtonRequest, true)
	GUI:setTag(ButtonRequest, -1)
end
return ui