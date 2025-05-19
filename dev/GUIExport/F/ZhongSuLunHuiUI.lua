local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/ZhongSuLunHui/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 744.00, 436.00, 86, 86, false)
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

	-- Create ItemLooks1
	local ItemLooks1 = GUI:Layout_Create(ImageBG, "ItemLooks1", 435.00, 357.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks1, true)
	GUI:setTag(ItemLooks1, 0)

	-- Create ItemLooks2
	local ItemLooks2 = GUI:Layout_Create(ImageBG, "ItemLooks2", 219.00, 192.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks2, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks2, true)
	GUI:setTag(ItemLooks2, 0)

	-- Create ItemLooks3
	local ItemLooks3 = GUI:Layout_Create(ImageBG, "ItemLooks3", 407.00, 191.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks3, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks3, true)
	GUI:setTag(ItemLooks3, 0)

	-- Create ItemLooks4
	local ItemLooks4 = GUI:Layout_Create(ImageBG, "ItemLooks4", 594.00, 193.00, 60, 60, false)
	GUI:setAnchorPoint(ItemLooks4, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks4, true)
	GUI:setTag(ItemLooks4, 0)

	-- Create ButtonNode
	local ButtonNode = GUI:Node_Create(ImageBG, "ButtonNode", 0.00, 0.00)
	GUI:setTag(ButtonNode, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ButtonNode, "Button_1", 197.00, 74.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setScale(Button_1, 0.80)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create JiHuo_1
	local JiHuo_1 = GUI:Image_Create(ButtonNode, "JiHuo_1", 193.00, 73.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(JiHuo_1, 0.00, 0.00)
	GUI:setScale(JiHuo_1, 0.35)
	GUI:setTouchEnabled(JiHuo_1, false)
	GUI:setTag(JiHuo_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ButtonNode, "Button_2", 387.00, 74.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setScale(Button_2, 0.80)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create JiHuo_2
	local JiHuo_2 = GUI:Image_Create(ButtonNode, "JiHuo_2", 383.00, 73.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(JiHuo_2, 0.00, 0.00)
	GUI:setScale(JiHuo_2, 0.35)
	GUI:setTouchEnabled(JiHuo_2, false)
	GUI:setTag(JiHuo_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ButtonNode, "Button_3", 574.00, 74.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setScale(Button_3, 0.80)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create JiHuo_3
	local JiHuo_3 = GUI:Image_Create(ButtonNode, "JiHuo_3", 570.00, 73.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(JiHuo_3, 0.00, 0.00)
	GUI:setScale(JiHuo_3, 0.35)
	GUI:setTouchEnabled(JiHuo_3, false)
	GUI:setTag(JiHuo_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
