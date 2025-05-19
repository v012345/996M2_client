local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create img_bg
	local img_bg = GUI:Image_Create(parent, "img_bg", 23.00, -22.00, "res/public/1900000610.png")
	GUI:setAnchorPoint(img_bg, 0.00, 0.00)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, -1)

	-- Create TitleText
	local TitleText = GUI:Text_Create(img_bg, "TitleText", 150.00, 485.00, 18, "#d8c8ae", [[测试NPC面板]])
	GUI:setAnchorPoint(TitleText, 0.50, 0.50)
	GUI:setTouchEnabled(TitleText, false)
	GUI:setTag(TitleText, -1)
	GUI:Text_enableOutline(TitleText, "#000000", 1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(img_bg, "CloseButton", 815.00, 499.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 10)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.50, 0.50)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(img_bg, "CloseLayout", 815.00, 502.00, 80, 80, false)
	GUI:Layout_setBackGroundColorType(CloseLayout, 1)
	GUI:Layout_setBackGroundColor(CloseLayout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(CloseLayout, 76)
	GUI:setAnchorPoint(CloseLayout, 0.50, 0.50)
	GUI:setOpacity(CloseLayout, 0)
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(img_bg, "Button_2", 569.00, 252.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button_2, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/gui_edit/Button_Disable.png")
	GUI:setContentSize(Button_2, 136, 49)
	GUI:setIgnoreContentAdaptWithSize(Button_2, false)
	GUI:Button_setTitleText(Button_2, [[测试本地功能]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(img_bg, "Button_1", 558.00, 350.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/gui_edit/Button_Disable.png")
	GUI:setContentSize(Button_1, 154, 41)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, [[测试网络消息]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(img_bg, "Image_1", 197.00, 140.00, "res/private/gui_edit/ImageFile.png")
	GUI:setContentSize(Image_1, 10, 10)
	GUI:setIgnoreContentAdaptWithSize(Image_1, false)
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create ScrollView_1
	local ScrollView_1 = GUI:ScrollView_Create(img_bg, "ScrollView_1", 56.00, 53.00, 433, 386, 1)
	GUI:ScrollView_setBounceEnabled(ScrollView_1, true)
	GUI:ScrollView_setInnerContainerSize(ScrollView_1, 433.00, 600.00)
	GUI:setAnchorPoint(ScrollView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_1, true)
	GUI:setTag(ScrollView_1, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ScrollView_1, "Panel_1", 0.00, 183.00, 315, 200, false)
	GUI:Layout_setBackGroundColorType(Panel_1, 1)
	GUI:Layout_setBackGroundColor(Panel_1, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Panel_1, 255)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_1_1
	local Panel_1_1 = GUI:Layout_Create(ScrollView_1, "Panel_1_1", -2.00, -8.00, 315, 200, false)
	GUI:Layout_setBackGroundColorType(Panel_1_1, 1)
	GUI:Layout_setBackGroundColor(Panel_1_1, "#c0c0c0")
	GUI:Layout_setBackGroundColorOpacity(Panel_1_1, 255)
	GUI:setAnchorPoint(Panel_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1_1, true)
	GUI:setTag(Panel_1_1, 0)

	-- Create CloseLayout
	CloseLayout = GUI:Layout_Create(ScrollView_1, "CloseLayout", 815.00, 502.00, 80, 80, false)
	GUI:Layout_setBackGroundColorType(CloseLayout, 1)
	GUI:Layout_setBackGroundColor(CloseLayout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(CloseLayout, 76)
	GUI:setAnchorPoint(CloseLayout, 0.50, 0.50)
	GUI:setOpacity(CloseLayout, 0)
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(img_bg, "Button_3", 569.00, 73.00, "res/private/gui_edit/Button_Normal.png")
	GUI:Button_loadTexturePressed(Button_3, "res/private/gui_edit/Button_Press.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/private/gui_edit/Button_Disable.png")
	GUI:setContentSize(Button_3, 100, 36)
	GUI:setIgnoreContentAdaptWithSize(Button_3, false)
	GUI:Button_setTitleText(Button_3, [[网络消息2]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)



	ui.update(__data__)
	return img_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
