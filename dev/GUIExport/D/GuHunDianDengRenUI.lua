local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/guhundiandengren/ghddr.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 859.00, 496.00, 86, 86, false)
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

	-- Create ItemShow_1
	local ItemShow_1 = GUI:ItemShow_Create(ImageBG, "ItemShow_1", 501.00, 143.00, {index = 10295, count = 1, look = false, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_1, 0.50, 0.50)
	GUI:setTag(ItemShow_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_1, "Panel_1", 322.00, 482.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Node_1, "Panel_2", 272.00, 409.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Node_1, "Panel_3", 242.00, 335.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(Node_1, "Panel_4", 242.00, 262.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(Node_1, "Panel_5", 272.00, 188.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create Panel_6
	local Panel_6 = GUI:Layout_Create(Node_1, "Panel_6", 322.00, 115.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_6, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_6, true)
	GUI:setTag(Panel_6, 0)

	-- Create Panel_7
	local Panel_7 = GUI:Layout_Create(Node_1, "Panel_7", 623.00, 482.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_7, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_7, true)
	GUI:setTag(Panel_7, 0)

	-- Create Panel_8
	local Panel_8 = GUI:Layout_Create(Node_1, "Panel_8", 673.00, 409.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_8, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_8, true)
	GUI:setTag(Panel_8, 0)

	-- Create Panel_9
	local Panel_9 = GUI:Layout_Create(Node_1, "Panel_9", 703.00, 335.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_9, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_9, true)
	GUI:setTag(Panel_9, 0)

	-- Create Panel_10
	local Panel_10 = GUI:Layout_Create(Node_1, "Panel_10", 703.00, 261.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_10, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_10, true)
	GUI:setTag(Panel_10, 0)

	-- Create Panel_11
	local Panel_11 = GUI:Layout_Create(Node_1, "Panel_11", 673.00, 187.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_11, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_11, true)
	GUI:setTag(Panel_11, 0)

	-- Create Panel_12
	local Panel_12 = GUI:Layout_Create(Node_1, "Panel_12", 623.00, 114.00, 56, 54, false)
	GUI:setAnchorPoint(Panel_12, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_12, true)
	GUI:setTag(Panel_12, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
