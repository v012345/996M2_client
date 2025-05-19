local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/3/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 150.00, 345.00, 18, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 1.00, 6.00, 658, 322, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:ListView_setItemsMargin(ListView_1, 4)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(ImageBG, "Text_2", 619.00, 346.00, 18, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
