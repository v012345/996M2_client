local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 20.00, "res/custom/JuQing/ShenLongShiWei/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 675.00, 208.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 5.00, 7.00, "res/custom/task/close.png")
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
	GUI:setVisible(Node_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 258.00, 109.00, "res/custom/JuQing/ShenLongShiWei/tips1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 251.00, 47.00, "res/custom/JuQing/btn15.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 481.00, 47.00, "res/custom/JuQing/btn16.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_1, "Image_2", 561.00, 29.00, "res/custom/JuQing/endSay.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(ImageBG, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, 0)
	GUI:setVisible(Node_2, false)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_2, "Image_3", 257.00, 106.00, "res/custom/JuQing/ShenLongShiWei/tips2.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_2, "Button_3", 267.00, 47.00, "res/custom/JuQing/btn19.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_2, "Button_4", 481.00, 47.00, "res/custom/JuQing/btn20.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_2, "Image_4", 561.00, 29.00, "res/custom/JuQing/endSay.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(ImageBG, "Node_3", 0.00, 0.00)
	GUI:setTag(Node_3, 0)
	GUI:setVisible(Node_3, false)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_3, "Image_5", 259.00, 108.00, "res/custom/JuQing/ShenLongShiWei/tips3.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_3, "Button_5", 275.00, 47.00, "res/custom/JuQing/btn20.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Node_3, "Button_6", 484.00, 47.00, "res/custom/JuQing/btn19.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Node_3, "Image_6", 561.00, 29.00, "res/custom/JuQing/endSay.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(ImageBG, "Node_4", 0.00, 0.00)
	GUI:setTag(Node_4, 0)
	GUI:setVisible(Node_4, false)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Node_4, "Image_7", -108.00, -76.00, "res/custom/JuQing/ShenLongShiWei/tips4.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Node_4, "Image_8", 321.00, 252.00, "res/custom/JuQing/ShenLongShiWei/jindubg.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(Image_8, "LoadingBar_1", 15.00, 8.00, "res/custom/JuQing/ShenLongShiWei/jindu.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar_1, 0)
	GUI:LoadingBar_setColor(LoadingBar_1, "#ffffff")
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Image_8, "Text_1", 172.00, 7.00, 18, "#00ff00", [[0/100]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_4, "Panel_1", 734.00, 268.00, 63, 59, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Node_4, "Button_7", 739.00, 336.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(Node_4, "Button_8", 425.00, -33.00, "res/custom/JuQing/btn18.png")
	GUI:Button_setTitleText(Button_8, [[]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)

	-- Create Button_9
	local Button_9 = GUI:Button_Create(Node_4, "Button_9", 686.00, 172.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(Button_9, [[]])
	GUI:Button_setTitleColor(Button_9, "#ffffff")
	GUI:Button_setTitleFontSize(Button_9, 16)
	GUI:Button_titleEnableOutline(Button_9, "#000000", 1)
	GUI:setAnchorPoint(Button_9, 0.00, 0.00)
	GUI:setTouchEnabled(Button_9, true)
	GUI:setTag(Button_9, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
