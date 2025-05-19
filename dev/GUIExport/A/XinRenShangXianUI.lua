local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 53.00, 36.00, "res/custom/XinRenShangXian/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Button
	local Button = GUI:Button_Create(ImageBG, "Button", 512.00, 39.00, "res/custom/XinRenShangXian/btn.png")
	GUI:Button_setTitleText(Button, [[]])
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setAnchorPoint(Button, 0.00, 0.00)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 619.00, 168.00, 248, 60, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
