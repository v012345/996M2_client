local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 18.00, 25.00, "res/custom/ShengRenGe/bg/bg5.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 875.00, 457.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 415.00, 33.00, "res/custom/ShengRenGe/btn1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 388.00, 132.00, 219, 54, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Node_1, "Text_1", 225.00, 341.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Node_1, "Text_2", 807.00, 345.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(Node_1, "Text_3", 225.00, 151.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(Node_1, "Text_4", 807.00, 153.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_4, 0.50, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, 0)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 479.00, 283.00, 54, 58, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
