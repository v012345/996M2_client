local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 198.00, -6.00, "res/custom/QiHunGuiPo/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 943.00, 476.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 345.00, 433.00)
	GUI:setTag(Node_1, 0)

	-- Create ItemShow_1
	local ItemShow_1 = GUI:Layout_Create(Node_1, "ItemShow_1", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_1, true)
	GUI:setTag(ItemShow_1, 0)

	-- Create NumShow_1
	local NumShow_1 = GUI:Text_Create(Node_1, "NumShow_1", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_1, "#000000", 1)
	GUI:setAnchorPoint(NumShow_1, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_1, false)
	GUI:setTag(NumShow_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(ImageBG, "Node_2", 509.00, 433.00)
	GUI:setTag(Node_2, 0)

	-- Create ItemShow_2
	local ItemShow_2 = GUI:Layout_Create(Node_2, "ItemShow_2", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_2, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_2, true)
	GUI:setTag(ItemShow_2, 0)

	-- Create NumShow_2
	local NumShow_2 = GUI:Text_Create(Node_2, "NumShow_2", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_2, "#000000", 1)
	GUI:setAnchorPoint(NumShow_2, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_2, false)
	GUI:setTag(NumShow_2, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_2, "Button_2", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(ImageBG, "Node_3", 673.00, 433.00)
	GUI:setTag(Node_3, 0)

	-- Create ItemShow_3
	local ItemShow_3 = GUI:Layout_Create(Node_3, "ItemShow_3", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_3, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_3, true)
	GUI:setTag(ItemShow_3, 0)

	-- Create NumShow_3
	local NumShow_3 = GUI:Text_Create(Node_3, "NumShow_3", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_3, "#000000", 1)
	GUI:setAnchorPoint(NumShow_3, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_3, false)
	GUI:setTag(NumShow_3, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_3, "Button_3", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(ImageBG, "Node_4", 837.00, 433.00)
	GUI:setTag(Node_4, 0)

	-- Create ItemShow_4
	local ItemShow_4 = GUI:Layout_Create(Node_4, "ItemShow_4", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_4, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_4, true)
	GUI:setTag(ItemShow_4, 0)

	-- Create NumShow_4
	local NumShow_4 = GUI:Text_Create(Node_4, "NumShow_4", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_4, "#000000", 1)
	GUI:setAnchorPoint(NumShow_4, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_4, false)
	GUI:setTag(NumShow_4, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_4, "Button_4", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Node_5
	local Node_5 = GUI:Node_Create(ImageBG, "Node_5", 426.00, 229.00)
	GUI:setTag(Node_5, 0)

	-- Create ItemShow_5
	local ItemShow_5 = GUI:Layout_Create(Node_5, "ItemShow_5", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_5, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_5, true)
	GUI:setTag(ItemShow_5, 0)

	-- Create NumShow_5
	local NumShow_5 = GUI:Text_Create(Node_5, "NumShow_5", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_5, "#000000", 1)
	GUI:setAnchorPoint(NumShow_5, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_5, false)
	GUI:setTag(NumShow_5, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_5, "Button_5", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Node_6
	local Node_6 = GUI:Node_Create(ImageBG, "Node_6", 590.00, 229.00)
	GUI:setTag(Node_6, 0)

	-- Create ItemShow_6
	local ItemShow_6 = GUI:Layout_Create(Node_6, "ItemShow_6", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_6, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_6, true)
	GUI:setTag(ItemShow_6, 0)

	-- Create NumShow_6
	local NumShow_6 = GUI:Text_Create(Node_6, "NumShow_6", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_6, "#000000", 1)
	GUI:setAnchorPoint(NumShow_6, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_6, false)
	GUI:setTag(NumShow_6, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Node_6, "Button_6", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Node_7
	local Node_7 = GUI:Node_Create(ImageBG, "Node_7", 754.00, 229.00)
	GUI:setTag(Node_7, 0)

	-- Create ItemShow_7
	local ItemShow_7 = GUI:Layout_Create(Node_7, "ItemShow_7", -7.00, -49.00, 50, 50, false)
	GUI:setAnchorPoint(ItemShow_7, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_7, true)
	GUI:setTag(ItemShow_7, 0)

	-- Create NumShow_7
	local NumShow_7 = GUI:Text_Create(Node_7, "NumShow_7", 7.00, -97.00, 16, "#00ff00", [[10/10]])
	GUI:Text_enableOutline(NumShow_7, "#000000", 1)
	GUI:setAnchorPoint(NumShow_7, 0.00, 0.00)
	GUI:setTouchEnabled(NumShow_7, false)
	GUI:setTag(NumShow_7, 0)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Node_7, "Button_7", -12.00, -144.00, "res/custom/JuQing/btn45.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
