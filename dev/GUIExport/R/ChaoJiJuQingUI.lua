local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 75.00, 44.00, "res/custom/ZhuXianAndJuQing/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 808.00, 408.00, "res/custom/task/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 84.00, 43.00, 178, 374, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create ScrollView_left
	local ScrollView_left = GUI:ScrollView_Create(ImageBG, "ScrollView_left", 81.00, 43.00, 178, 378, 1)
	GUI:ScrollView_setBounceEnabled(ScrollView_left, true)
	GUI:ScrollView_setInnerContainerSize(ScrollView_left, 178.00, 378.00)
	GUI:setAnchorPoint(ScrollView_left, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_left, true)
	GUI:setTag(ScrollView_left, 0)
	GUI:setVisible(ScrollView_left, false)

	-- Create Image_title
	local Image_title = GUI:Image_Create(ImageBG, "Image_title", 188.00, 422.00, "res/custom/ZhuXianAndJuQing/title.png")
	GUI:setAnchorPoint(Image_title, 0.00, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 264.00, 123.00, 570, 298, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Image_bj1
	local Image_bj1 = GUI:Image_Create(Panel_2, "Image_bj1", 29.00, 175.00, "res/custom/ZhuXianAndJuQing/juqing_bj.png")
	GUI:setAnchorPoint(Image_bj1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_bj1, false)
	GUI:setTag(Image_bj1, 0)

	-- Create Node_bj1
	local Node_bj1 = GUI:Node_Create(Image_bj1, "Node_bj1", 0.00, 72.00)
	GUI:setTag(Node_bj1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Panel_2, "Image_1", 29.00, 12.00, "res/custom/ZhuXianAndJuQing/juqing_ts.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create ScrollView_1
	local ScrollView_1 = GUI:ScrollView_Create(Image_1, "ScrollView_1", 3.00, 4.00, 494, 117, 1)
	GUI:ScrollView_setBounceEnabled(ScrollView_1, true)
	GUI:ScrollView_setInnerContainerSize(ScrollView_1, 494.00, 200.00)
	GUI:setAnchorPoint(ScrollView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_1, true)
	GUI:setTag(ScrollView_1, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(ScrollView_1, "Panel_3", -1.00, 0.00, 480, 116, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 281.00, 46.00, "res/custom/ZhuXianAndJuQing/11.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(ImageBG, "Image_3", 571.00, 46.00, "res/custom/ZhuXianAndJuQing/22.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Node_bottom
	local Node_bottom = GUI:Node_Create(ImageBG, "Node_bottom", 0.00, 0.00)
	GUI:setTag(Node_bottom, 0)

	-- Create Panel_cost1
	local Panel_cost1 = GUI:Layout_Create(Node_bottom, "Panel_cost1", 347.00, 47.00, 196, 46, false)
	GUI:setAnchorPoint(Panel_cost1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost1, true)
	GUI:setTag(Panel_cost1, 0)

	-- Create Panel_cost2
	local Panel_cost2 = GUI:Layout_Create(Node_bottom, "Panel_cost2", 638.00, 46.00, 54, 46, false)
	GUI:setAnchorPoint(Panel_cost2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost2, true)
	GUI:setTag(Panel_cost2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_bottom, "Button_3", 711.00, 57.00, "res/custom/JuQing/btn17.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/custom/JuQing/yilingqu17.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
