local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 148.00, 33.00, "res/custom/ZhuXianAndJuQing/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 808.00, 409.00, "res/custom/task/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 727.00, 57.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 328.00, 46.00, 353, 51, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 81.00, 43.00, 178, 374, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:ListView_setGravity(ListView_1, 2)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Image_ttile
	local Image_ttile = GUI:Image_Create(ImageBG, "Image_ttile", 191.00, 422.00, "res/custom/ZhuXianAndJuQing/title1.png")
	GUI:setAnchorPoint(Image_ttile, 0.00, 0.00)
	GUI:setTouchEnabled(Image_ttile, false)
	GUI:setTag(Image_ttile, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 270.00, 128.00, "res/custom/ZhuXianAndJuQing/zhuxian_right.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Image_1, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, -1)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Image_1, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, -1)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(Image_1, "Node_3", 0.00, 0.00)
	GUI:setTag(Node_3, -1)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(Image_1, "Node_4", 0.00, 0.00)
	GUI:setTag(Node_4, -1)

	-- Create Node_5
	local Node_5 = GUI:Node_Create(Image_1, "Node_5", 0.00, 0.00)
	GUI:setChineseName(Node_5, "前往")
	GUI:setTag(Node_5, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 265.00, 49.00, "res/custom/ZhuXianAndJuQing/finish_reward.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
