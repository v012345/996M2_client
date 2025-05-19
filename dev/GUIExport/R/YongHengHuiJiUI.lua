local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 19.00, "res/custom/JuQing/YongHengHuiJi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)
	TAGOBJ["-1"] = ImageBG

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 834.00, 458.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)
	TAGOBJ["-1"] = CloseLayout

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -4.00, -15.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)
	TAGOBJ["-1"] = CloseButton

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 142.00, 296.00, 710, 59, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 556.00, 76.00, 80, 68, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Node_Button
	local Node_Button = GUI:Node_Create(ImageBG, "Node_Button", 0.00, 0.00)
	GUI:setTag(Node_Button, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_Button, "Button_1", 107.00, 170.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_Button, "Button_2", 329.00, 170.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_Button, "Button_3", 544.00, 170.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_Button, "Button_4", 765.00, 170.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Node_Text
	local Node_Text = GUI:Node_Create(ImageBG, "Node_Text", 0.00, 0.00)
	GUI:setTag(Node_Text, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Node_Text, "Text_1", 177.00, 229.00, 20, "#00ff00", [[0/3]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Node_Text, "Text_2", 400.00, 229.00, 20, "#00ff00", [[0/3]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(Node_Text, "Text_3", 612.00, 229.00, 20, "#00ff00", [[0/3]])
	GUI:setAnchorPoint(Text_3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(Node_Text, "Text_4", 833.00, 229.00, 20, "#00ff00", [[0/3]])
	GUI:setAnchorPoint(Text_4, 0.50, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, 0)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(ImageBG, "Button_5", 646.00, 85.00, "res/custom/JuQing/btn17.png")
	GUI:Button_loadTextureDisabled(Button_5, "res/public/yilingqu.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
