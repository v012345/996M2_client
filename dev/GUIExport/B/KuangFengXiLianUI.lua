local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 39.00, 41.00, "res/custom/KuangFengXiLian/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(ImageBG, "Effect", 419.00, 335.00, 0, 16014, 0, 0, 0, 1)
	GUI:setTag(Effect, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 968.00, 447.00, 75.00, 75.00, false)
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

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 683.00, 181.00, 282.00, 232.00, false)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Layout, "Panel_1", 0.00, 195.00, 282.00, 36.00, false)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Panel_1, "ImageView", 0.00, 0.00, "res/custom/KuangFengXiLian/lookState.png")
	GUI:Image_setScale9Slice(ImageView, 30, 3, 3, 3)
	GUI:setContentSize(ImageView, 281, 36)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_1, "Text_1", 114.00, 7.00, 17, "#00fb00", [[+49%]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Panel_1, "Text_2", 170.00, 8.00, 17, "#ff0006", [[(MAX：188%)]])
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(ImageBG, "ButtonStart", 745.00, 25.00, "res/custom/KuangFengXiLian/btn.png")
	GUI:Button_setTitleText(ButtonStart, "")
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(ImageBG, "Layout_1", 784.00, 97.00, 111.00, 43.00, false)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 740.00, 94.00, "res/custom/KuangFengXiLian/yuanbao.png")
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 414.00, 124.00, 18, "#00ff00", [[文本]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)
end
return ui