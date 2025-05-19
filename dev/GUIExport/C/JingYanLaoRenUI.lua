local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/jingyanlaoren/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 760.00, 419.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodeTip
	local NodeTip = GUI:Node_Create(ImageBG, "NodeTip", 0.00, 0.00)
	GUI:setAnchorPoint(NodeTip, 0.00, 0.00)
	GUI:setTag(NodeTip, -1)

	-- Create Text_currLevel
	local Text_currLevel = GUI:Text_Create(ImageBG, "Text_currLevel", 587.00, 262.00, 20, "#00ff40", [[]])
	GUI:setAnchorPoint(Text_currLevel, 0.00, 0.00)
	GUI:setTouchEnabled(Text_currLevel, false)
	GUI:setTag(Text_currLevel, -1)
	GUI:Text_enableOutline(Text_currLevel, "#000000", 1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 501.00, 159.00, 73, 70, false)
	GUI:setAnchorPoint(Layout, 0.00, 0.00)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Button
	local Button = GUI:Button_Create(ImageBG, "Button", 532.00, 39.00, "res/custom/jingyanlaoren/an_01.png")
	GUI:Button_setTitleText(Button, [[]])
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setAnchorPoint(Button, 0.00, 0.00)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
