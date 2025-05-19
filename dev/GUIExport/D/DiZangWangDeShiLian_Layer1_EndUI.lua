local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 337.00, 245.00, "res/custom/DiZangWangDeShiLian/layer1/end_bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Image_title
	local Image_title = GUI:Image_Create(ImageBG, "Image_title", 226.00, 229.00, "res/custom/DiZangWangDeShiLian/layer1/fail_title.png")
	GUI:setAnchorPoint(Image_title, 0.50, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, -1)

	-- Create Image_font
	local Image_font = GUI:Image_Create(ImageBG, "Image_font", 224.00, 135.00, "res/custom/DiZangWangDeShiLian/layer1/fail_font.png")
	GUI:setAnchorPoint(Image_font, 0.50, 0.00)
	GUI:setTouchEnabled(Image_font, false)
	GUI:setTag(Image_font, -1)

	-- Create Button_close
	local Button_close = GUI:Button_Create(ImageBG, "Button_close", 113.00, 35.00, "res/custom/DiZangWangDeShiLian/layer1/end_btn.png")
	GUI:Button_setTitleText(Button_close, "")
	GUI:Button_setTitleColor(Button_close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_close, 14)
	GUI:Button_titleEnableOutline(Button_close, "#000000", 1)
	GUI:setTouchEnabled(Button_close, true)
	GUI:setTag(Button_close, -1)
end
return ui