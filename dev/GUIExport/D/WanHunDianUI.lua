local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/WanHunDian/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 861.00, 440.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 525.00, 65.00, "res/custom/JuQing/btn10.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create ItemShow_1
	local ItemShow_1 = GUI:Layout_Create(ImageBG, "ItemShow_1", 155.00, 165.00, 190, 49, false)
	GUI:setAnchorPoint(ItemShow_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_1, true)
	GUI:setTag(ItemShow_1, 0)

	-- Create ItemShow_2
	local ItemShow_2 = GUI:Layout_Create(ImageBG, "ItemShow_2", 120.00, 98.00, 262, 49, false)
	GUI:setAnchorPoint(ItemShow_2, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow_2, true)
	GUI:setTag(ItemShow_2, 0)

	-- Create NumShow_1
	local NumShow_1 = GUI:Text_Create(ImageBG, "NumShow_1", 461.00, 227.00, 18, "#00ff40", [[30/30]])
	GUI:Text_enableOutline(NumShow_1, "#000000", 1)
	GUI:setAnchorPoint(NumShow_1, 0.50, 0.00)
	GUI:setTouchEnabled(NumShow_1, false)
	GUI:setTag(NumShow_1, 0)

	-- Create NumShow_2
	local NumShow_2 = GUI:Text_Create(ImageBG, "NumShow_2", 629.00, 227.00, 18, "#00ff40", [[30/30]])
	GUI:Text_enableOutline(NumShow_2, "#000000", 1)
	GUI:setAnchorPoint(NumShow_2, 0.50, 0.00)
	GUI:setTouchEnabled(NumShow_2, false)
	GUI:setTag(NumShow_2, 0)

	-- Create NumShow_3
	local NumShow_3 = GUI:Text_Create(ImageBG, "NumShow_3", 798.00, 227.00, 18, "#00ff40", [[30/30]])
	GUI:Text_enableOutline(NumShow_3, "#000000", 1)
	GUI:setAnchorPoint(NumShow_3, 0.50, 0.00)
	GUI:setTouchEnabled(NumShow_3, false)
	GUI:setTag(NumShow_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
