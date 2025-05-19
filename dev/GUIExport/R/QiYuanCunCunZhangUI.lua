local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 115.00, 208.00, "res/custom/task/QiYuanCunCunZhang/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)
	TAGOBJ["-1"] = ImageBG

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 669.00, 213.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)
	TAGOBJ["-1"] = CloseLayout

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 10.00, 8.00, "res/custom/task/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)
	TAGOBJ["-1"] = CloseButton

	-- Create Node_main
	local Node_main = GUI:Node_Create(ImageBG, "Node_main", 0.00, 0.00)
	GUI:setAnchorPoint(Node_main, 0.00, 0.00)
	GUI:setTag(Node_main, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node_main, "Node_1", 0.00, 0.00)
	GUI:setAnchorPoint(Node_1, 0.00, 0.00)
	GUI:setTag(Node_1, 0)
	GUI:setVisible(Node_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 279.00, 101.00, "res/custom/task/QiYuanCunCunZhang/tips1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 432.00, 30.00, "res/custom/task/an_03.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Node_main, "Node_2", 0.00, 0.00)
	GUI:setAnchorPoint(Node_2, 0.00, 0.00)
	GUI:setTag(Node_2, 0)
	GUI:setVisible(Node_2, false)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_2, "Image_2", 265.00, 97.00, "res/custom/task/QiYuanCunCunZhang/tips2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_2, "Button_2", 426.00, 34.00, "res/custom/task/an_04.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(Node_main, "Node_3", 0.00, 0.00)
	GUI:setAnchorPoint(Node_3, 0.00, 0.00)
	GUI:setTag(Node_3, 0)
	GUI:setVisible(Node_3, false)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_3, "Image_3", 259.00, 49.00, "res/custom/task/QiYuanCunCunZhang/tips3.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_3, "Panel_1", 419.00, 37.00, 108, 52, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_3, "Button_3", 521.00, 36.00, "res/custom/task/an_12.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(Node_main, "Node_4", 0.00, 0.00)
	GUI:setAnchorPoint(Node_4, 0.00, 0.00)
	GUI:setTag(Node_4, 0)
	GUI:setVisible(Node_4, false)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_4, "Image_4", 277.00, 163.00, "res/custom/task/QiYuanCunCunZhang/tips4.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
