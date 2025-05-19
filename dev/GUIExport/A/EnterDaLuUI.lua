local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 105.00, 40.00, "res/custom/enterDaLu/1DaLu/bg_1.jpg")
	GUI:setContentSize(ImageBG, _V("SCREEN_WIDTH"), _V("SCREEN_HEIGHT"))
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 1003.00, 517.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 608.00, 363.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_desc
	local Image_desc = GUI:Image_Create(Node_1, "Image_desc", -320.00, 97.00, "res/custom/enterDaLu/2.png")
	GUI:setAnchorPoint(Image_desc, 0.00, 0.00)
	GUI:setTouchEnabled(Image_desc, false)
	GUI:setTag(Image_desc, 0)

	-- Create Panel_Condition
	local Panel_Condition = GUI:Layout_Create(Node_1, "Panel_Condition", -313.00, -180.00, 311, 138, false)
	GUI:setAnchorPoint(Panel_Condition, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_Condition, true)
	GUI:setTag(Panel_Condition, 0)

	-- Create Panel_itemList
	local Panel_itemList = GUI:Layout_Create(Node_1, "Panel_itemList", -234.00, 4.00, 500, 61, false)
	GUI:setAnchorPoint(Panel_itemList, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_itemList, true)
	GUI:setTag(Panel_itemList, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", -89.00, -270.00, "res/custom/enterDaLu/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
