local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 62.00, 31.00, "res/custom/HuoDongDaTing/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 941.00, 454.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 698.00, 31.00, "res/custom/HuoDongDaTing/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 730.00, 213.00, 179, 43, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 688.00, 281.00, "res/custom/HuoDongDaTing/txzrjs.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 80.00, 37.00, 572, 436, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:ListView_setItemsMargin(ListView_1, 2)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Text_desc
	local Text_desc = GUI:Text_Create(ImageBG, "Text_desc", 680.00, 96.00, 16, "#e4daa5", [[]])
	GUI:setAnchorPoint(Text_desc, 0.00, 0.00)
	GUI:setTouchEnabled(Text_desc, false)
	GUI:setTag(Text_desc, 0)
	GUI:Text_enableOutline(Text_desc, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
