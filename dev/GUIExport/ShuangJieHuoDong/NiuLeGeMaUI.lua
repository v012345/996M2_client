local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create img_bg
	local img_bg = GUI:Image_Create(parent, "img_bg", 94.00, -14.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//img_bg.png")
	GUI:setAnchorPoint(img_bg, 0.00, 0.00)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(img_bg, "CloseButton", 867.00, 607.00, "res/custom/public/btn_close.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 10)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.50, 0.50)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(img_bg, "CloseLayout", 874.00, 620.00, 80, 80, false)
	GUI:setAnchorPoint(CloseLayout, 0.50, 0.50)
	GUI:setOpacity(CloseLayout, 0)
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(img_bg, "Layout", 200.00, 198.00, 550, 480, false)
	GUI:setAnchorPoint(Layout, 0.00, 0.00)
	GUI:setTouchEnabled(Layout, true)
	GUI:setTag(Layout, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(img_bg, "Layout_1", 263.00, 24.00, 400, 66, false)
	GUI:setAnchorPoint(Layout_1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create Node
	local Node = GUI:Node_Create(img_bg, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Button_exit
	local Button_exit = GUI:Button_Create(Node, "Button_exit", 759.00, 5.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//exit.png")
	GUI:Button_loadTexturePressed(Button_exit, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//exit.png")
	GUI:Button_loadTextureDisabled(Button_exit, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//exit.png")
	GUI:Button_setTitleText(Button_exit, [[]])
	GUI:Button_setTitleColor(Button_exit, "#ffffff")
	GUI:Button_setTitleFontSize(Button_exit, 15)
	GUI:Button_titleEnableOutline(Button_exit, "#000000", 1)
	GUI:setAnchorPoint(Button_exit, 0.00, 0.00)
	GUI:setTouchEnabled(Button_exit, true)
	GUI:setTag(Button_exit, -1)

	-- Create Button_remove
	local Button_remove = GUI:Button_Create(Node, "Button_remove", 85.00, 4.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//remove.png")
	GUI:Button_loadTexturePressed(Button_remove, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//remove.png")
	GUI:Button_loadTextureDisabled(Button_remove, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//remove_grey.png")
	GUI:Button_setTitleText(Button_remove, [[]])
	GUI:Button_setTitleColor(Button_remove, "#ffffff")
	GUI:Button_setTitleFontSize(Button_remove, 14)
	GUI:Button_titleEnableOutline(Button_remove, "#000000", 1)
	GUI:setAnchorPoint(Button_remove, 0.00, 0.00)
	GUI:setTouchEnabled(Button_remove, true)
	GUI:setTag(Button_remove, -1)

	-- Create Button_shuffle
	local Button_shuffle = GUI:Button_Create(Node, "Button_shuffle", 169.00, 4.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//daluan.png")
	GUI:Button_loadTexturePressed(Button_shuffle, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//daluan.png")
	GUI:Button_loadTextureDisabled(Button_shuffle, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//daluan_grey.png")
	GUI:Button_setTitleText(Button_shuffle, [[]])
	GUI:Button_setTitleColor(Button_shuffle, "#ffffff")
	GUI:Button_setTitleFontSize(Button_shuffle, 14)
	GUI:Button_titleEnableOutline(Button_shuffle, "#000000", 1)
	GUI:setAnchorPoint(Button_shuffle, 0.00, 0.00)
	GUI:setTouchEnabled(Button_shuffle, true)
	GUI:setTag(Button_shuffle, -1)

	-- Create Button_back
	local Button_back = GUI:Button_Create(Node, "Button_back", 672.00, 4.00, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//back.png")
	GUI:Button_loadTexturePressed(Button_back, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//back.png")
	GUI:Button_loadTextureDisabled(Button_back, "res/custom/ShuangJieHuoDongMain/NiuLeGeMa//back_grey.png")
	GUI:Button_setTitleText(Button_back, [[]])
	GUI:Button_setTitleColor(Button_back, "#ffffff")
	GUI:Button_setTitleFontSize(Button_back, 14)
	GUI:Button_titleEnableOutline(Button_back, "#000000", 1)
	GUI:setAnchorPoint(Button_back, 0.00, 0.00)
	GUI:setTouchEnabled(Button_back, true)
	GUI:setTag(Button_back, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(img_bg, "Text_1", 546.00, 107.00, 16, "#00f000", [[]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Text_1, "Text_2", 75.00, 0.00, 16, "#ff0000", [[]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	ui.update(__data__)
	return img_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
