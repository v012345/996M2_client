local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -1.00, 0.00, "res/custom/niumaqiyulu/nmjm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 926.00, 448.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ScrollView_1
	local ScrollView_1 = GUI:ListView_Create(ImageBG, "ScrollView_1", 80.00, 43.00, 616, 430, 1)
	GUI:ListView_setBounceEnabled(ScrollView_1, true)
	GUI:setAnchorPoint(ScrollView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_1, true)
	GUI:setTag(ScrollView_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ScrollView_1, "Panel_1", 0.00, 230.00, 500, 200, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 74.00, 38.00, "res/custom/niumaqiyulu/kk.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create TipsLayout
	local TipsLayout = GUI:ListView_Create(ImageBG, "TipsLayout", 702.00, 42.00, 233, 439, 1)
	GUI:setAnchorPoint(TipsLayout, 0.00, 0.00)
	GUI:setTouchEnabled(TipsLayout, true)
	GUI:setTag(TipsLayout, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
