local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 59.00, 31.00, "res/custom/ZhuangBan/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create Node_left_btn
	local Node_left_btn = GUI:Node_Create(ImageBG, "Node_left_btn", 0.00, 0.00)
	GUI:setTag(Node_left_btn, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_left_btn, "Button_1", 146.00, 425.00, "res/custom/ZhuangBan/left_btn_1_2.png")
	GUI:Button_loadTexturePressed(Button_1, "res/custom/ZhuangBan/left_btn_1_1.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/custom/ZhuangBan/left_btn_1_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_left_btn, "Button_2", 146.00, 384.00, "res/custom/ZhuangBan/left_btn_2_2.png")
	GUI:Button_loadTexturePressed(Button_2, "res/custom/ZhuangBan/left_btn_2_1.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/custom/ZhuangBan/left_btn_2_1.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_left_btn, "Button_3", 146.00, 343.00, "res/custom/ZhuangBan/left_btn_3_2.png")
	GUI:Button_loadTexturePressed(Button_3, "res/custom/ZhuangBan/left_btn_3_1.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/custom/ZhuangBan/left_btn_3_1.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 971.00, 462.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ListView
	local ListView = GUI:ListView_Create(ImageBG, "ListView", 662.00, 24.00, 294, 444, 1)
	GUI:ListView_setBounceEnabled(ListView, true)
	GUI:ListView_setGravity(ListView, 2)
	GUI:setAnchorPoint(ListView, 0.00, 0.00)
	GUI:setTouchEnabled(ListView, true)
	GUI:setTag(ListView, -1)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ListView, "Panel_2", 0.00, 0.00, 294, 444, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 345.00, 22.00, "res/custom/ZhuangBan/box.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(ImageView, "Panel_3", 120.00, 49.00, 185, 58, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 403.00, 354.00, 230, 127, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button
	local Button = GUI:Button_Create(ImageBG, "Button", 433.00, 115.00, "res/custom/ZhuangBan/btn1.png")
	GUI:Button_setTitleText(Button, [[]])
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setAnchorPoint(Button, 0.00, 0.00)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create NodeModel
	local NodeModel = GUI:Node_Create(ImageBG, "NodeModel", 477.00, 213.00)
	GUI:setTag(NodeModel, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
