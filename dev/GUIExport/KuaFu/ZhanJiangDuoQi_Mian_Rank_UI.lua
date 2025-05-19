local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 147.00, 33.00, "res/custom/ZhanJiangDuoQi/rank_bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 922.00, 488.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 79.00, 40.00, 847, 395, 1)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ListView_1, "Image_1", 0.00, 309.00, "res/custom/ZhanJiangDuoQi/rank_1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Image_1, "Text_1", 337.00, 32.00, 22, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Panel_Cost
	local Panel_Cost = GUI:Layout_Create(Image_1, "Panel_Cost", 613.00, 19.00, 213, 51, false)
	GUI:setAnchorPoint(Panel_Cost, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_Cost, true)
	GUI:setTag(Panel_Cost, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Button_right_1
	local Button_right_1 = GUI:Button_Create(Node_1, "Button_right_1", 938.00, 354.00, "res/custom/ZhanJiangDuoQi/right_btn_1_2.png")
	GUI:Button_loadTextureDisabled(Button_right_1, "res/custom/ZhanJiangDuoQi/right_btn_1_1.png")
	GUI:Button_setTitleText(Button_right_1, [[]])
	GUI:Button_setTitleColor(Button_right_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_right_1, 16)
	GUI:Button_titleEnableOutline(Button_right_1, "#000000", 1)
	GUI:setAnchorPoint(Button_right_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_right_1, true)
	GUI:setTag(Button_right_1, 0)

	-- Create Button_right_2
	local Button_right_2 = GUI:Button_Create(Node_1, "Button_right_2", 938.00, 282.00, "res/custom/ZhanJiangDuoQi/right_btn_2_2.png")
	GUI:Button_loadTextureDisabled(Button_right_2, "res/custom/ZhanJiangDuoQi/right_btn_2_1.png")
	GUI:Button_setTitleText(Button_right_2, [[]])
	GUI:Button_setTitleColor(Button_right_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_right_2, 16)
	GUI:Button_titleEnableOutline(Button_right_2, "#000000", 1)
	GUI:setAnchorPoint(Button_right_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_right_2, true)
	GUI:setTag(Button_right_2, 0)

	-- Create Button_right_3
	local Button_right_3 = GUI:Button_Create(Node_1, "Button_right_3", 938.00, 209.00, "res/custom/ZhanJiangDuoQi/right_btn_3_2.png")
	GUI:Button_loadTextureDisabled(Button_right_3, "res/custom/ZhanJiangDuoQi/right_btn_3_1.png")
	GUI:Button_setTitleText(Button_right_3, [[]])
	GUI:Button_setTitleColor(Button_right_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_right_3, 16)
	GUI:Button_titleEnableOutline(Button_right_3, "#000000", 1)
	GUI:setAnchorPoint(Button_right_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_right_3, true)
	GUI:setTag(Button_right_3, 0)

	-- Create Image_title
	local Image_title = GUI:Image_Create(ImageBG, "Image_title", 381.00, 439.00, "res/custom/ZhanJiangDuoQi/titile1.png")
	GUI:setAnchorPoint(Image_title, 0.00, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, 0)

	-- Create Image_title_1
	local Image_title_1 = GUI:Image_Create(ImageBG, "Image_title_1", 752.00, 439.00, "res/custom/ZhanJiangDuoQi/reward.png")
	GUI:setAnchorPoint(Image_title_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_title_1, false)
	GUI:setTag(Image_title_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
