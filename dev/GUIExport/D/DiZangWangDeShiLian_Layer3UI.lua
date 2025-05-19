local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 10.00, 210.00, "res/custom/DiZangWangDeShiLian/layer3/tips.png")
	GUI:setAnchorPoint(ImageBG, 0.50, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextAtlas_1
	local TextAtlas_1 = GUI:TextAtlas_Create(ImageBG, "TextAtlas_1", 480.00, 10.00, "180", "res/custom/DiZangWangDeShiLian/layer1/text.png", 40, 50, ".")
	GUI:setAnchorPoint(TextAtlas_1, 0.50, 0.00)
	GUI:setTouchEnabled(TextAtlas_1, false)
	GUI:setTag(TextAtlas_1, -1)
end
return ui