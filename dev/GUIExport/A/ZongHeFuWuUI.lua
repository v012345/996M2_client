local ui = {}

function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 245.00, 99.00, "res/public/bg_sifud_05.png")
	GUI:Image_setScale9Slice(ImageBG, 15, 15, 50, 20)
	GUI:setContentSize(ImageBG, 600, 300)
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create ImageView_line
	local ImageView_line = GUI:Image_Create(ImageBG, "ImageView_line", 15.00, 250.00, "res/public/1900000667.png")
	GUI:setContentSize(ImageView_line, 570, 2)
	GUI:setIgnoreContentAdaptWithSize(ImageView_line, false)
	GUI:setTouchEnabled(ImageView_line, false)
	GUI:setTag(ImageView_line, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 578.00, 244.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 22.00, 14.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 0)
	GUI:Button_titleDisableOutLine(CloseButton)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create TextTitle
	local TextTitle = GUI:Text_Create(ImageBG, "TextTitle", 277.00, 261.00, 16, "#ffffff", [[综合服务]])
	GUI:setTouchEnabled(TextTitle, false)
	GUI:setTag(TextTitle, -1)
	GUI:Text_enableOutline(TextTitle, "#000000", 1)

	-- Create TextTips
	local TextTips = GUI:Text_Create(ImageBG, "TextTips", 49.00, 215.00, 16, "#ffffff", [[我这里有各种类型的功能服务,整合了一些快捷方式,你可直接在这里使用！]])
	GUI:setTouchEnabled(TextTips, false)
	GUI:setTag(TextTips, -1)
	GUI:Text_enableOutline(TextTips, "#000000", 1)

	-- Create Node
	local Node = GUI:Node_Create(ImageBG, "Node", 0.00, -10.00)
	GUI:setTag(Node, -1)

	-- Create Text1_1
	local Text1_1 = GUI:Text_Create(Node, "Text1_1", 63.00, 171.00, 16, "#ffff00", [[点击切换信息开关]])
	GUI:setTouchEnabled(Text1_1, true)
	GUI:setTag(Text1_1, -1)
	GUI:Text_enableOutline(Text1_1, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text1_1, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text1_1, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text1_2
	local Text1_2 = GUI:Text_Create(Node, "Text1_2", 235.00, 171.00, 16, "#ffff00", [[花10大米千里传音]])
	GUI:setTouchEnabled(Text1_2, true)
	GUI:setTag(Text1_2, -1)
	GUI:Text_enableOutline(Text1_2, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text1_2, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text1_2, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text1_3
	local Text1_3 = GUI:Text_Create(Node, "Text1_3", 412.00, 170.00, 16, "#ffff00", [[点击打开游戏仓库]])
	GUI:setTouchEnabled(Text1_3, true)
	GUI:setTag(Text1_3, -1)
	GUI:Text_enableOutline(Text1_3, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text1_3, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text1_3, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, -45.00)
	GUI:setTag(Node_1, -1)

	-- Create Text2_1
	local Text2_1 = GUI:Text_Create(Node_1, "Text2_1", 63.00, 171.00, 16, "#ffff00", [[点击切换信息开关]])
	GUI:setTouchEnabled(Text2_1, true)
	GUI:setTag(Text2_1, -1)
	GUI:Text_enableOutline(Text2_1, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text2_1, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text2_1, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text2_2
	local Text2_2 = GUI:Text_Create(Node_1, "Text2_2", 235.00, 171.00, 16, "#ffff00", [[花10大米千里传音]])
	GUI:setTouchEnabled(Text2_2, true)
	GUI:setTag(Text2_2, -1)
	GUI:Text_enableOutline(Text2_2, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text2_2, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text2_2, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text2_3
	local Text2_3 = GUI:Text_Create(Node_1, "Text2_3", 412.00, 170.00, 16, "#ffff00", [[点击打开游戏仓库]])
	GUI:setTouchEnabled(Text2_3, true)
	GUI:setTag(Text2_3, -1)
	GUI:Text_enableOutline(Text2_3, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text2_3, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text2_3, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(ImageBG, "Node_2", 0.00, -79.00)
	GUI:setTag(Node_2, -1)

	-- Create Text3_1
	local Text3_1 = GUI:Text_Create(Node_2, "Text3_1", 63.00, 171.00, 16, "#ffff00", [[点击切换信息开关]])
	GUI:setTouchEnabled(Text3_1, true)
	GUI:setTag(Text3_1, -1)
	GUI:Text_enableOutline(Text3_1, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text3_1, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text3_1, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text3_2
	local Text3_2 = GUI:Text_Create(Node_2, "Text3_2", 235.00, 171.00, 16, "#ffff00", [[花10大米千里传音]])
	GUI:setTouchEnabled(Text3_2, true)
	GUI:setTag(Text3_2, -1)
	GUI:Text_enableOutline(Text3_2, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text3_2, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text3_2, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text3_3
	local Text3_3 = GUI:Text_Create(Node_2, "Text3_3", 412.00, 170.00, 16, "#ffff00", [[点击打开游戏仓库]])
	GUI:setTouchEnabled(Text3_3, true)
	GUI:setTag(Text3_3, -1)
	GUI:Text_enableOutline(Text3_3, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text3_3, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text3_3, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(ImageBG, "Node_3", 0.00, -114.00)
	GUI:setTag(Node_3, -1)

	-- Create Text4_1
	local Text4_1 = GUI:Text_Create(Node_3, "Text4_1", 63.00, 171.00, 16, "#ffff00", [[点击切换信息开关]])
	GUI:setTouchEnabled(Text4_1, true)
	GUI:setTag(Text4_1, -1)
	GUI:Text_enableOutline(Text4_1, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text4_1, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text4_1, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text4_2
	local Text4_2 = GUI:Text_Create(Node_3, "Text4_2", 235.00, 171.00, 16, "#ffff00", [[花10大米千里传音]])
	GUI:setTouchEnabled(Text4_2, true)
	GUI:setTag(Text4_2, -1)
	GUI:Text_enableOutline(Text4_2, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text4_2, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text4_2, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text4_3
	local Text4_3 = GUI:Text_Create(Node_3, "Text4_3", 412.00, 170.00, 16, "#ffff00", [[点击打开游戏仓库]])
	GUI:setTouchEnabled(Text4_3, true)
	GUI:setTag(Text4_3, -1)
	GUI:Text_enableOutline(Text4_3, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Text4_3, "Text_1", -17.00, -1.00, 16, "#ffffff", [[【]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text4_3, "Text_2", 130.00, -1.00, 16, "#ffffff", [[】]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 0.00, 0.00, 600.00, 300.00, false)
	GUI:Layout_setBackGroundColorType(Layout, 1)
	GUI:Layout_setBackGroundColor(Layout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Layout, 63)
	GUI:setTouchEnabled(Layout, true)
	GUI:setTag(Layout, -1)
	GUI:setVisible(Layout, false)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Layout, "ImageView", 49.00, 58.00, "res/public/bg_npc_04.jpg")
	GUI:Image_setScale9Slice(ImageView, 182, 182, 95, 96)
	GUI:setContentSize(ImageView, 500, 180)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, true)
	GUI:setTag(ImageView, -1)

	-- Create TextChuanYinTip
	local TextChuanYinTip = GUI:Text_Create(ImageView, "TextChuanYinTip", 34.00, 135.00, 16, "#ffffff", [[请输入需要千里传音的信息：]])
	GUI:setTouchEnabled(TextChuanYinTip, false)
	GUI:setTag(TextChuanYinTip, -1)
	GUI:Text_enableOutline(TextChuanYinTip, "#000000", 1)

	-- Create ImageViewInputBG
	local ImageViewInputBG = GUI:Image_Create(ImageView, "ImageViewInputBG", 39.00, 83.00, "res/public/1900000668.png")
	GUI:Image_setScale9Slice(ImageViewInputBG, 52, 52, 10, 11)
	GUI:setContentSize(ImageViewInputBG, 430, 31)
	GUI:setIgnoreContentAdaptWithSize(ImageViewInputBG, false)
	GUI:setTouchEnabled(ImageViewInputBG, true)
	GUI:setTag(ImageViewInputBG, -1)

	-- Create Input
	local Input = GUI:TextInput_Create(ImageViewInputBG, "Input", -3.00, 3.00, 430.00, 25.00, 16)
	GUI:TextInput_setPlaceHolder(Input, "请输入信息,最多60个字符.")
	GUI:TextInput_setPlaceholderFontColor(Input, "#808080")
	GUI:TextInput_setFontColor(Input, "#ffffff")
	GUI:Win_SetParam(Input, {id = 0, type = 0, checkSensitive = false, cipher = false}, "Input")
	GUI:TextInput_setString(Input, [[]])
	GUI:setTouchEnabled(Input, true)
	GUI:setTag(Input, -1)

	-- Create ButtonCYSend
	local ButtonCYSend = GUI:Button_Create(ImageView, "ButtonCYSend", 346.00, 20.00, "res/public/1900000660.png")
	GUI:Button_loadTexturePressed(ButtonCYSend, "res/public/1900000661.png")
	GUI:Button_loadTextureDisabled(ButtonCYSend, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(ButtonCYSend, "确定")
	GUI:Button_setTitleColor(ButtonCYSend, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonCYSend, 14)
	GUI:Button_titleEnableOutline(ButtonCYSend, "#000000", 1)
	GUI:Win_SetParam(ButtonCYSend, {grey = 1}, "Button")
	GUI:setTouchEnabled(ButtonCYSend, true)
	GUI:setTag(ButtonCYSend, -1)

	-- Create CloseCYButton
	local CloseCYButton = GUI:Button_Create(ImageView, "CloseCYButton", 500.00, 139.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseCYButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseCYButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseCYButton, "")
	GUI:Button_setTitleColor(CloseCYButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseCYButton, 0)
	GUI:Button_titleEnableOutline(CloseCYButton, "#000000", 1)
	GUI:Win_SetParam(CloseCYButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseCYButton, true)
	GUI:setTag(CloseCYButton, -1)
end

return ui