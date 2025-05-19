local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 70.00, 28.00, "res/custom/LiuGuangShenQi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 819.00, 427.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Item1
	local Item1 = GUI:ItemShow_Create(ImageBG, "Item1", 294.00, 269.00, {index = 1, count = 1, look = false, bgVisible = false})
	GUI:setAnchorPoint(Item1, 0.50, 0.50)
	GUI:setTag(Item1, -1)

	-- Create Item2
	local Item2 = GUI:ItemShow_Create(ImageBG, "Item2", 740.00, 268.00, {index = 1, count = 1, look = false, bgVisible = false})
	GUI:setAnchorPoint(Item2, 0.50, 0.50)
	GUI:setTag(Item2, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 202.00, 357.00, 100, 50, false)
	GUI:setAnchorPoint(Layout, 0.50, 0.50)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(ImageBG, "Layout_1", 588.00, 357.00, 100, 50, false)
	GUI:setAnchorPoint(Layout_1, 0.50, 0.50)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create Button_Go1
	local Button_Go1 = GUI:Button_Create(ImageBG, "Button_Go1", 210.00, 59.00, "res/custom/LiuGuangShenQi/btn1.png")
	GUI:Button_setTitleText(Button_Go1, [[]])
	GUI:Button_setTitleColor(Button_Go1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Go1, 14)
	GUI:Button_titleEnableOutline(Button_Go1, "#000000", 1)
	GUI:setAnchorPoint(Button_Go1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Go1, true)
	GUI:setTag(Button_Go1, -1)

	-- Create Button_Go2
	local Button_Go2 = GUI:Button_Create(ImageBG, "Button_Go2", 653.00, 59.00, "res/custom/LiuGuangShenQi/btn2.png")
	GUI:Button_setTitleText(Button_Go2, [[]])
	GUI:Button_setTitleColor(Button_Go2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Go2, 14)
	GUI:Button_titleEnableOutline(Button_Go2, "#000000", 1)
	GUI:setAnchorPoint(Button_Go2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Go2, true)
	GUI:setTag(Button_Go2, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_1, "Panel_1", 261.00, 363.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Node_1, "Panel_2", 140.00, 167.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Node_1, "Panel_3", 377.00, 167.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(ImageBG, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, 0)

	-- Create Panel_1
	Panel_1 = GUI:Layout_Create(Node_2, "Panel_1", 707.00, 363.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	Panel_2 = GUI:Layout_Create(Node_2, "Panel_2", 587.00, 168.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	Panel_3 = GUI:Layout_Create(Node_2, "Panel_3", 823.00, 166.00, 67, 65, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
