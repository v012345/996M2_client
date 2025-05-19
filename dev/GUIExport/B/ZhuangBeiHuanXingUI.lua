local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 89.00, 72.00, "res/custom/jianjiakaiguang/jm_01.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 955.00, 448.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 14.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(ImageBG, "Layout_1", 589.00, 99.00, 100.00, 60.00, false)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 622.00, 335.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 62, 62)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ButtonWeapon
	local ButtonWeapon = GUI:Button_Create(ImageBG, "ButtonWeapon", 185.00, 246.00, "res/custom/jianjiakaiguang/an_wyqi.png")
	GUI:Button_setTitleText(ButtonWeapon, "")
	GUI:Button_setTitleColor(ButtonWeapon, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonWeapon, 14)
	GUI:Button_titleEnableOutline(ButtonWeapon, "#000000", 1)
	GUI:setTouchEnabled(ButtonWeapon, true)
	GUI:setTag(ButtonWeapon, -1)

	-- Create ButtonClothing
	local ButtonClothing = GUI:Button_Create(ImageBG, "ButtonClothing", 185.00, 47.00, "res/custom/jianjiakaiguang/an_yifu.png")
	GUI:Button_setTitleText(ButtonClothing, "")
	GUI:Button_setTitleColor(ButtonClothing, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonClothing, 14)
	GUI:Button_titleEnableOutline(ButtonClothing, "#000000", 1)
	GUI:setTouchEnabled(ButtonClothing, true)
	GUI:setTag(ButtonClothing, -1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(ImageBG, "Text_2", 589.00, 344.00, 16, "#ffffff", [[]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create TextName
	local TextName = GUI:Text_Create(Text_2, "TextName", 64.00, -41.00, 18, "#00ff00", [[未放入]])
	GUI:setAnchorPoint(TextName, 0.50, 0.50)
	GUI:setTouchEnabled(TextName, false)
	GUI:setTag(TextName, -1)
	GUI:Text_enableOutline(TextName, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(ImageBG, "Text_3", 548.00, 272.00, 16, "#ffffff", [[]])
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, -1)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create TextAttr1
	local TextAttr1 = GUI:Text_Create(Text_3, "TextAttr1", 38.00, -52.00, 16, "#ff0000", [[未放入]])
	GUI:setTouchEnabled(TextAttr1, false)
	GUI:setTag(TextAttr1, -1)
	GUI:Text_enableOutline(TextAttr1, "#000000", 1)

	-- Create Text
	local Text = GUI:Text_Create(Text_3, "Text", 152.00, -52.00, 16, "#00ff00", [==========[[最大10%]]==========])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(ImageBG, "Text_4", 548.00, 245.00, 16, "#ffffff", [[]])
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, -1)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create TextAttr2
	local TextAttr2 = GUI:Text_Create(Text_4, "TextAttr2", 38.00, -57.00, 16, "#e317b3", [[未放入]])
	GUI:setTouchEnabled(TextAttr2, false)
	GUI:setTag(TextAttr2, -1)
	GUI:Text_enableOutline(TextAttr2, "#000000", 1)

	-- Create Text
	local Text = GUI:Text_Create(Text_4, "Text", 152.00, -57.00, 16, "#00ff00", [==========[[最大10%]]==========])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(ImageBG, "ButtonStart", 573.00, 28.00, "res/custom/jianjiakaiguang/an_qd.png")
	GUI:Button_setTitleText(ButtonStart, "")
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(ImageBG, "EquipShow", 212.00, 317.00, 1, false, {look = true, bgVisible = true})
	GUI:setTag(EquipShow, -1)

	-- Create EquipShow_1
	local EquipShow_1 = GUI:EquipShow_Create(ImageBG, "EquipShow_1", 212.00, 115.00, 0, false, {look = true, bgVisible = true})
	GUI:setTag(EquipShow_1, -1)

	-- Create NodeSelect
	local NodeSelect = GUI:Node_Create(ImageBG, "NodeSelect", 0.00, 0.00)
	GUI:setTag(NodeSelect, -1)
end
return ui