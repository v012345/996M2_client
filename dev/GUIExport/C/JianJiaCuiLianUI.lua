local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 19.00, "res/public/1900000610.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 753.00, 469.00, 75.00, 75.00, false)
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

	-- Create TextTitle
	local TextTitle = GUI:Text_Create(ImageBG, "TextTitle", 390.00, 503.00, 16, "#ffffff", [[剑甲淬炼]])
	GUI:setAnchorPoint(TextTitle, 0.50, 0.50)
	GUI:setTouchEnabled(TextTitle, false)
	GUI:setTag(TextTitle, -1)
	GUI:Text_enableOutline(TextTitle, "#000000", 1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 165.00, 208.00, "res/custom/public/itemBG.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Item1
	local Item1 = GUI:ItemShow_Create(ImageView, "Item1", 34.00, 34.00, {bgVisible = false, look = true, count = 1, index = 1})
	GUI:setAnchorPoint(Item1, 0.50, 0.50)
	GUI:setTag(Item1, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(ImageBG, "ImageView_1", 555.00, 208.00, "res/custom/public/itemBG.png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create Item2
	local Item2 = GUI:ItemShow_Create(ImageView_1, "Item2", 34.00, 34.00, {bgVisible = false, look = true, count = 1, index = 1})
	GUI:setAnchorPoint(Item2, 0.50, 0.50)
	GUI:setTag(Item2, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 202.00, 357.00, 100.00, 50.00, false)
	GUI:setAnchorPoint(Layout, 0.50, 0.50)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(ImageBG, "Layout_1", 588.00, 357.00, 100.00, 50.00, false)
	GUI:setAnchorPoint(Layout_1, 0.50, 0.50)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create Button_Go1
	local Button_Go1 = GUI:Button_Create(ImageBG, "Button_Go1", 144.00, 107.00, "res/public/1900000660.png")
	GUI:Button_loadTexturePressed(Button_Go1, "res/public/1900000661.png")
	GUI:Button_loadTextureDisabled(Button_Go1, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_Go1, "开始锻造")
	GUI:Button_setTitleColor(Button_Go1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Go1, 14)
	GUI:Button_titleEnableOutline(Button_Go1, "#000000", 1)
	GUI:setTouchEnabled(Button_Go1, true)
	GUI:setTag(Button_Go1, -1)

	-- Create Button_Go2
	local Button_Go2 = GUI:Button_Create(ImageBG, "Button_Go2", 537.00, 107.00, "res/public/1900000660.png")
	GUI:Button_loadTexturePressed(Button_Go2, "res/public/1900000661.png")
	GUI:Button_loadTextureDisabled(Button_Go2, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_Go2, "开始锻造")
	GUI:Button_setTitleColor(Button_Go2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Go2, 14)
	GUI:Button_titleEnableOutline(Button_Go2, "#000000", 1)
	GUI:setTouchEnabled(Button_Go2, true)
	GUI:setTag(Button_Go2, -1)

	-- Create Text
	local Text = GUI:Text_Create(ImageBG, "Text", 199.00, 180.00, 16, "#ff00ff", [==========[流光剣[综合之力]]==========])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 593.00, 180.00, 16, "#ff00ff", [==========[流光·庇护[男]]==========])
	GUI:setAnchorPoint(Text_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create ImageView_2
	local ImageView_2 = GUI:Image_Create(ImageBG, "ImageView_2", 191.00, 290.00, "res/public/btn_szjm_01_4.png")
	GUI:setTouchEnabled(ImageView_2, false)
	GUI:setTag(ImageView_2, -1)

	-- Create ImageView_2_1
	local ImageView_2_1 = GUI:Image_Create(ImageBG, "ImageView_2_1", 580.00, 290.00, "res/public/btn_szjm_01_4.png")
	GUI:setTouchEnabled(ImageView_2_1, false)
	GUI:setTag(ImageView_2_1, -1)
end
return ui