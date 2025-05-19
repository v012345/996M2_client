local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 242.00, 120.00, "res/public/1900000610.png")
	GUI:Image_setScale9Slice(ImageBG, 289, 289, 190, 189)
	GUI:setContentSize(ImageBG, 700, 400)
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Node
	local Node = GUI:Node_Create(ImageBG, "Node", 54.00, -127.00)
	GUI:setTag(Node, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 659.00, 278.00, 80.00, 80.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 27.00, 17.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create TitleText
	local TitleText = GUI:Text_Create(ImageBG, "TitleText", 174.00, 317.00, 16, "#ffff00", [[骷髅洞]])
	GUI:setAnchorPoint(TitleText, 0.50, 0.50)
	GUI:setTouchEnabled(TitleText, false)
	GUI:setTag(TitleText, -1)
	GUI:Text_enableOutline(TitleText, "#000000", 1)

	-- Create ImageView_2
	local ImageView_2 = GUI:Image_Create(ImageBG, "ImageView_2", 86.00, 102.00, "res/public/1900000667.png")
	GUI:setContentSize(ImageView_2, 550, 2)
	GUI:setIgnoreContentAdaptWithSize(ImageView_2, false)
	GUI:setTouchEnabled(ImageView_2, false)
	GUI:setTag(ImageView_2, -1)

	-- Create ButtonLayout
	local ButtonLayout = GUI:Layout_Create(ImageBG, "ButtonLayout", 42.00, 41.00, 632.00, 50.00, false)
	GUI:setTouchEnabled(ButtonLayout, false)
	GUI:setTag(ButtonLayout, -1)
end
return ui