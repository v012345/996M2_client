local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 3.00, 0.00, "res/custom/NiuMaNiXi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 942.00, 499.00, 70, 70, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 15.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 16)
	GUI:Button_titleDisableOutLine(CloseButton)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1_Day
	local Button_1_Day = GUI:Button_Create(ImageBG, "Button_1_Day", 138.00, 456.00, "res/custom/NiuMaNiXi/day_1.png")
	GUI:Button_setTitleText(Button_1_Day, [[]])
	GUI:Button_setTitleColor(Button_1_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1_Day, 16)
	GUI:Button_titleEnableOutline(Button_1_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_1_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1_Day, true)
	GUI:setTag(Button_1_Day, 0)

	-- Create Select_1_Day
	local Select_1_Day = GUI:Image_Create(Button_1_Day, "Select_1_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_1_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_1_Day, false)
	GUI:setTag(Select_1_Day, 0)
	GUI:setVisible(Select_1_Day, false)

	-- Create Button_2_Day
	local Button_2_Day = GUI:Button_Create(ImageBG, "Button_2_Day", 138.00, 394.00, "res/custom/NiuMaNiXi/day_2.png")
	GUI:Button_setTitleText(Button_2_Day, [[]])
	GUI:Button_setTitleColor(Button_2_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2_Day, 16)
	GUI:Button_titleEnableOutline(Button_2_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_2_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2_Day, true)
	GUI:setTag(Button_2_Day, 0)

	-- Create Select_2_Day
	local Select_2_Day = GUI:Image_Create(Button_2_Day, "Select_2_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_2_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_2_Day, false)
	GUI:setTag(Select_2_Day, 0)
	GUI:setVisible(Select_2_Day, false)

	-- Create Button_3_Day
	local Button_3_Day = GUI:Button_Create(ImageBG, "Button_3_Day", 138.00, 332.00, "res/custom/NiuMaNiXi/day_3.png")
	GUI:Button_setTitleText(Button_3_Day, [[]])
	GUI:Button_setTitleColor(Button_3_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3_Day, 16)
	GUI:Button_titleEnableOutline(Button_3_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_3_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3_Day, true)
	GUI:setTag(Button_3_Day, 0)

	-- Create Select_3_Day
	local Select_3_Day = GUI:Image_Create(Button_3_Day, "Select_3_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_3_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_3_Day, false)
	GUI:setTag(Select_3_Day, 0)
	GUI:setVisible(Select_3_Day, false)

	-- Create Button_4_Day
	local Button_4_Day = GUI:Button_Create(ImageBG, "Button_4_Day", 138.00, 270.00, "res/custom/NiuMaNiXi/day_4.png")
	GUI:Button_setTitleText(Button_4_Day, [[]])
	GUI:Button_setTitleColor(Button_4_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4_Day, 16)
	GUI:Button_titleEnableOutline(Button_4_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_4_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4_Day, true)
	GUI:setTag(Button_4_Day, 0)

	-- Create Select_4_Day
	local Select_4_Day = GUI:Image_Create(Button_4_Day, "Select_4_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_4_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_4_Day, false)
	GUI:setTag(Select_4_Day, 0)
	GUI:setVisible(Select_4_Day, false)

	-- Create Button_5_Day
	local Button_5_Day = GUI:Button_Create(ImageBG, "Button_5_Day", 138.00, 208.00, "res/custom/NiuMaNiXi/day_5.png")
	GUI:Button_setTitleText(Button_5_Day, [[]])
	GUI:Button_setTitleColor(Button_5_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5_Day, 16)
	GUI:Button_titleEnableOutline(Button_5_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_5_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5_Day, true)
	GUI:setTag(Button_5_Day, 0)

	-- Create Select_5_Day
	local Select_5_Day = GUI:Image_Create(Button_5_Day, "Select_5_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_5_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_5_Day, false)
	GUI:setTag(Select_5_Day, 0)
	GUI:setVisible(Select_5_Day, false)

	-- Create Button_6_Day
	local Button_6_Day = GUI:Button_Create(ImageBG, "Button_6_Day", 138.00, 146.00, "res/custom/NiuMaNiXi/day_6.png")
	GUI:Button_setTitleText(Button_6_Day, [[]])
	GUI:Button_setTitleColor(Button_6_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6_Day, 16)
	GUI:Button_titleEnableOutline(Button_6_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_6_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6_Day, true)
	GUI:setTag(Button_6_Day, 0)

	-- Create Select_6_Day
	local Select_6_Day = GUI:Image_Create(Button_6_Day, "Select_6_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_6_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_6_Day, false)
	GUI:setTag(Select_6_Day, 0)
	GUI:setVisible(Select_6_Day, false)

	-- Create Button_7_Day
	local Button_7_Day = GUI:Button_Create(ImageBG, "Button_7_Day", 138.00, 84.00, "res/custom/NiuMaNiXi/day_7.png")
	GUI:Button_setTitleText(Button_7_Day, [[]])
	GUI:Button_setTitleColor(Button_7_Day, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7_Day, 16)
	GUI:Button_titleEnableOutline(Button_7_Day, "#000000", 1)
	GUI:setAnchorPoint(Button_7_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7_Day, true)
	GUI:setTag(Button_7_Day, 0)

	-- Create Select_7_Day
	local Select_7_Day = GUI:Image_Create(Button_7_Day, "Select_7_Day", 0.00, 0.00, "res/custom/NiuMaNiXi/select.png")
	GUI:setAnchorPoint(Select_7_Day, 0.00, 0.00)
	GUI:setTouchEnabled(Select_7_Day, false)
	GUI:setTag(Select_7_Day, 0)
	GUI:setVisible(Select_7_Day, false)

	-- Create ListView_All
	local ListView_All = GUI:ListView_Create(ImageBG, "ListView_All", 346.00, 142.00, 604, 278, 1)
	GUI:ListView_setBounceEnabled(ListView_All, true)
	GUI:setAnchorPoint(ListView_All, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_All, true)
	GUI:setTag(ListView_All, 0)

	-- Create AwardShow
	local AwardShow = GUI:Layout_Create(ImageBG, "AwardShow", 678.00, 105.00, 55, 55, false)
	GUI:setAnchorPoint(AwardShow, 0.00, 0.00)
	GUI:setTouchEnabled(AwardShow, true)
	GUI:setTag(AwardShow, 0)

	-- Create AwardButton
	local AwardButton = GUI:Button_Create(ImageBG, "AwardButton", 764.00, 84.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(AwardButton, [[]])
	GUI:Button_setTitleColor(AwardButton, "#ffffff")
	GUI:Button_setTitleFontSize(AwardButton, 16)
	GUI:Button_titleEnableOutline(AwardButton, "#000000", 1)
	GUI:setAnchorPoint(AwardButton, 0.00, 0.00)
	GUI:setTouchEnabled(AwardButton, true)
	GUI:setTag(AwardButton, 0)

	-- Create State_Image
	local State_Image = GUI:Image_Create(ImageBG, "State_Image", 649.00, 81.00, "res/custom/JuQing/state.png")
	GUI:setAnchorPoint(State_Image, 0.00, 0.00)
	GUI:setTouchEnabled(State_Image, false)
	GUI:setTag(State_Image, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
