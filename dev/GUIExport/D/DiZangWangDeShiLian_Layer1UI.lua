local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -28.00, 259.00, "res/custom/DiZangWangDeShiLian/layer1/tips.png")
	GUI:setAnchorPoint(ImageBG, 0.50, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextAtlas
	local TextAtlas = GUI:TextAtlas_Create(ImageBG, "TextAtlas", 180.00, 8.00, "0", "res/custom/DiZangWangDeShiLian/layer1/text.png", 40, 50, ".")
	GUI:setTouchEnabled(TextAtlas, false)
	GUI:setTag(TextAtlas, -1)

	-- Create TextAtlas_1
	local TextAtlas_1 = GUI:TextAtlas_Create(ImageBG, "TextAtlas_1", 468.00, 83.00, "15", "res/custom/DiZangWangDeShiLian/layer1/text.png", 40, 50, ".")
	GUI:setAnchorPoint(TextAtlas_1, 0.50, 0.00)
	GUI:setTouchEnabled(TextAtlas_1, false)
	GUI:setTag(TextAtlas_1, -1)
end
return ui