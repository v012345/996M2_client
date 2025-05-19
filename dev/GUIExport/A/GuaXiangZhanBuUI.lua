local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 82.00, 62.00, "res/custom/GuaXiangZhanBu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 790.00, 426.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 85.00, 158.00, "res/custom/GuaXiangZhanBu/gua1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_1, "Image_2", 250.00, 158.00, "res/custom/GuaXiangZhanBu/gua2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_1, "Image_3", 415.00, 158.00, "res/custom/GuaXiangZhanBu/gua3.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_1, "Image_4", 580.00, 158.00, "res/custom/GuaXiangZhanBu/gua4.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_1, "Image_5", 745.00, 158.00, "res/custom/GuaXiangZhanBu/gua5.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 385.00, 43.00, "res/custom/GuaXiangZhanBu/start.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Text_count
	local Text_count = GUI:Text_Create(ImageBG, "Text_count", 772.00, 67.00, 20, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_count, 0.00, 0.00)
	GUI:setTouchEnabled(Text_count, false)
	GUI:setTag(Text_count, 0)
	GUI:Text_enableOutline(Text_count, "#000000", 1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 631.00, 108.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(ButtonHelp, [[]])
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 16)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setAnchorPoint(ButtonHelp, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
