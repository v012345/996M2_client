local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 6.00, 25.00, "res/custom/LongShenZhiLi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 973.00, 440.00, 75, 75, false)
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

	-- Create Panel_cost1
	local Panel_cost1 = GUI:Layout_Create(ImageBG, "Panel_cost1", 206.00, 123.00, 164, 61, false)
	GUI:setAnchorPoint(Panel_cost1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost1, true)
	GUI:setTag(Panel_cost1, 0)

	-- Create Panel_cost2
	local Panel_cost2 = GUI:Layout_Create(ImageBG, "Panel_cost2", 515.00, 122.00, 164, 61, false)
	GUI:setAnchorPoint(Panel_cost2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost2, true)
	GUI:setTag(Panel_cost2, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 228.00, 27.00, "res/custom/LongShenZhiLi/yuanbao_btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 527.00, 27.00, "res/custom/LongShenZhiLi/lingfu_btn.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Panel_star
	local Panel_star = GUI:Layout_Create(ImageBG, "Panel_star", 212.00, 225.00, 535, 36, false)
	GUI:setAnchorPoint(Panel_star, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_star, true)
	GUI:setTag(Panel_star, 0)

	-- Create Text_BDshow
	local Text_BDshow = GUI:Text_Create(ImageBG, "Text_BDshow", 490.00, 269.00, 20, "#00ff00", [[0/10]])
	GUI:setAnchorPoint(Text_BDshow, 0.00, 0.00)
	GUI:setTouchEnabled(Text_BDshow, false)
	GUI:setTag(Text_BDshow, 0)
	GUI:Text_enableOutline(Text_BDshow, "#000000", 2)

	-- Create Image_currLevel
	local Image_currLevel = GUI:Image_Create(ImageBG, "Image_currLevel", 881.00, 383.00, "Default/Sprite.png")
	GUI:setContentSize(Image_currLevel, 163, 34)
	GUI:setIgnoreContentAdaptWithSize(Image_currLevel, false)
	GUI:setAnchorPoint(Image_currLevel, 0.50, 0.00)
	GUI:setTouchEnabled(Image_currLevel, false)
	GUI:setTag(Image_currLevel, 0)

	-- Create Image_nextLevel
	local Image_nextLevel = GUI:Image_Create(ImageBG, "Image_nextLevel", 884.00, 160.00, "Default/Sprite.png")
	GUI:setContentSize(Image_nextLevel, 163, 34)
	GUI:setIgnoreContentAdaptWithSize(Image_nextLevel, false)
	GUI:setAnchorPoint(Image_nextLevel, 0.50, 0.00)
	GUI:setTouchEnabled(Image_nextLevel, false)
	GUI:setTag(Image_nextLevel, 0)

	-- Create Text_successRate1
	local Text_successRate1 = GUI:Text_Create(ImageBG, "Text_successRate1", 343.00, 92.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_successRate1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_successRate1, false)
	GUI:setTag(Text_successRate1, 0)
	GUI:Text_enableOutline(Text_successRate1, "#000000", 2)

	-- Create Text_successRate2
	local Text_successRate2 = GUI:Text_Create(ImageBG, "Text_successRate2", 646.00, 92.00, 20, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_successRate2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_successRate2, false)
	GUI:setTag(Text_successRate2, 0)
	GUI:Text_enableOutline(Text_successRate2, "#000000", 2)

	-- Create Text_currAtt1
	local Text_currAtt1 = GUI:Text_Create(ImageBG, "Text_currAtt1", 893.00, 349.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_currAtt1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_currAtt1, false)
	GUI:setTag(Text_currAtt1, 0)
	GUI:Text_enableOutline(Text_currAtt1, "#000000", 1)

	-- Create Text_currAtt2
	local Text_currAtt2 = GUI:Text_Create(ImageBG, "Text_currAtt2", 887.00, 325.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_currAtt2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_currAtt2, false)
	GUI:setTag(Text_currAtt2, 0)
	GUI:Text_enableOutline(Text_currAtt2, "#000000", 1)

	-- Create Text_currAtt3
	local Text_currAtt3 = GUI:Text_Create(ImageBG, "Text_currAtt3", 909.00, 300.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_currAtt3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_currAtt3, false)
	GUI:setTag(Text_currAtt3, 0)
	GUI:Text_enableOutline(Text_currAtt3, "#000000", 1)

	-- Create Text_nextAtt1
	local Text_nextAtt1 = GUI:Text_Create(ImageBG, "Text_nextAtt1", 893.00, 124.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_nextAtt1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_nextAtt1, false)
	GUI:setTag(Text_nextAtt1, 0)
	GUI:Text_enableOutline(Text_nextAtt1, "#000000", 1)

	-- Create Text_nextAtt2
	local Text_nextAtt2 = GUI:Text_Create(ImageBG, "Text_nextAtt2", 887.00, 100.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_nextAtt2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_nextAtt2, false)
	GUI:setTag(Text_nextAtt2, 0)
	GUI:Text_enableOutline(Text_nextAtt2, "#000000", 1)

	-- Create Text_nextAtt3
	local Text_nextAtt3 = GUI:Text_Create(ImageBG, "Text_nextAtt3", 910.00, 74.00, 17, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_nextAtt3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_nextAtt3, false)
	GUI:setTag(Text_nextAtt3, 0)
	GUI:Text_enableOutline(Text_nextAtt3, "#000000", 1)

	-- Create Node_light
	local Node_light = GUI:Node_Create(ImageBG, "Node_light", 0.00, 0.00)
	GUI:setAnchorPoint(Node_light, 0.00, 0.00)
	GUI:setTag(Node_light, 0)

	-- Create Image_light_1
	local Image_light_1 = GUI:Image_Create(Node_light, "Image_light_1", 259.00, 398.00, "res/custom/LongShenZhiLi/light/1.png")
	GUI:setAnchorPoint(Image_light_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_1, false)
	GUI:setTag(Image_light_1, 0)

	-- Create Image_light_2
	local Image_light_2 = GUI:Image_Create(Node_light, "Image_light_2", 237.00, 307.00, "res/custom/LongShenZhiLi/light/2.png")
	GUI:setAnchorPoint(Image_light_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_2, false)
	GUI:setTag(Image_light_2, 0)

	-- Create Image_light_3
	local Image_light_3 = GUI:Image_Create(Node_light, "Image_light_3", 254.00, 267.00, "res/custom/LongShenZhiLi/light/3.png")
	GUI:setAnchorPoint(Image_light_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_3, false)
	GUI:setTag(Image_light_3, 0)

	-- Create Image_light_4
	local Image_light_4 = GUI:Image_Create(Node_light, "Image_light_4", 334.00, 275.00, "res/custom/LongShenZhiLi/light/4.png")
	GUI:setAnchorPoint(Image_light_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_4, false)
	GUI:setTag(Image_light_4, 0)

	-- Create Image_light_5
	local Image_light_5 = GUI:Image_Create(Node_light, "Image_light_5", 406.00, 341.00, "res/custom/LongShenZhiLi/light/5.png")
	GUI:setAnchorPoint(Image_light_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_5, false)
	GUI:setTag(Image_light_5, 0)

	-- Create Image_light_6
	local Image_light_6 = GUI:Image_Create(Node_light, "Image_light_6", 489.00, 320.00, "res/custom/LongShenZhiLi/light/6.png")
	GUI:setAnchorPoint(Image_light_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_6, false)
	GUI:setTag(Image_light_6, 0)

	-- Create Image_light_7
	local Image_light_7 = GUI:Image_Create(Node_light, "Image_light_7", 560.00, 262.00, "res/custom/LongShenZhiLi/light/7.png")
	GUI:setAnchorPoint(Image_light_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_7, false)
	GUI:setTag(Image_light_7, 0)

	-- Create Image_light_8
	local Image_light_8 = GUI:Image_Create(Node_light, "Image_light_8", 633.00, 279.00, "res/custom/LongShenZhiLi/light/8.png")
	GUI:setAnchorPoint(Image_light_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_8, false)
	GUI:setTag(Image_light_8, 0)

	-- Create Image_light_9
	local Image_light_9 = GUI:Image_Create(Node_light, "Image_light_9", 701.00, 341.00, "res/custom/LongShenZhiLi/light/9.png")
	GUI:setAnchorPoint(Image_light_9, 0.00, 0.00)
	GUI:setTouchEnabled(Image_light_9, false)
	GUI:setTag(Image_light_9, 0)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
