local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 10.00, 210.00, "res/custom/DiZangWangDeShiLian/layer2/tips.png")
	GUI:setAnchorPoint(ImageBG, 0.50, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextAtlas_1
	local TextAtlas_1 = GUI:TextAtlas_Create(ImageBG, "TextAtlas_1", 491.00, 10.00, "100", "res/custom/DiZangWangDeShiLian/layer1/text.png", 40, 50, ".")
	GUI:setAnchorPoint(TextAtlas_1, 0.50, 0.00)
	GUI:setTouchEnabled(TextAtlas_1, false)
	GUI:setTag(TextAtlas_1, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
