local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/BaDaLu/QianMenBaJiang/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 863.00, 438.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AllIoc
	local AllIoc = GUI:Node_Create(ImageBG, "AllIoc", 317.00, 452.00)
	GUI:setTag(AllIoc, 0)

	-- Create Image_1_1
	local Image_1_1 = GUI:Image_Create(AllIoc, "Image_1_1", 153.00, -59.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_1_1.png")
	GUI:setAnchorPoint(Image_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1_1, false)
	GUI:setTag(Image_1_1, 0)
	GUI:setVisible(Image_1_1, false)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Image_1_1, "Button_1", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1_2
	local Image_1_2 = GUI:Image_Create(AllIoc, "Image_1_2", 153.00, -59.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_1_2.png")
	GUI:setAnchorPoint(Image_1_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1_2, false)
	GUI:setTag(Image_1_2, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Image_1_2, "Image_1", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2_1
	local Image_2_1 = GUI:Image_Create(AllIoc, "Image_2_1", 256.00, -102.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_2_1.png")
	GUI:setAnchorPoint(Image_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2_1, false)
	GUI:setTag(Image_2_1, 0)
	GUI:setVisible(Image_2_1, false)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Image_2_1, "Button_2", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2_2
	local Image_2_2 = GUI:Image_Create(AllIoc, "Image_2_2", 256.00, -102.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_2_2.png")
	GUI:setAnchorPoint(Image_2_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2_2, false)
	GUI:setTag(Image_2_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Image_2_2, "Image_2", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3_1
	local Image_3_1 = GUI:Image_Create(AllIoc, "Image_3_1", 299.00, -204.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_3_1.png")
	GUI:setAnchorPoint(Image_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_1, false)
	GUI:setTag(Image_3_1, 0)
	GUI:setVisible(Image_3_1, false)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Image_3_1, "Button_3", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Image_3_2
	local Image_3_2 = GUI:Image_Create(AllIoc, "Image_3_2", 299.00, -204.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_3_2.png")
	GUI:setAnchorPoint(Image_3_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3_2, false)
	GUI:setTag(Image_3_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Image_3_2, "Image_3", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Image_4_1
	local Image_4_1 = GUI:Image_Create(AllIoc, "Image_4_1", 256.00, -306.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_4_1.png")
	GUI:setAnchorPoint(Image_4_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4_1, false)
	GUI:setTag(Image_4_1, 0)
	GUI:setVisible(Image_4_1, false)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Image_4_1, "Button_4", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Image_4_2
	local Image_4_2 = GUI:Image_Create(AllIoc, "Image_4_2", 256.00, -306.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_4_2.png")
	GUI:setAnchorPoint(Image_4_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4_2, false)
	GUI:setTag(Image_4_2, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Image_4_2, "Image_4", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Image_5_1
	local Image_5_1 = GUI:Image_Create(AllIoc, "Image_5_1", 154.00, -348.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_5_1.png")
	GUI:setAnchorPoint(Image_5_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5_1, false)
	GUI:setTag(Image_5_1, 0)
	GUI:setVisible(Image_5_1, false)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Image_5_1, "Button_5", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Image_5_2
	local Image_5_2 = GUI:Image_Create(AllIoc, "Image_5_2", 154.00, -348.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_5_2.png")
	GUI:setAnchorPoint(Image_5_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5_2, false)
	GUI:setTag(Image_5_2, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Image_5_2, "Image_5", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Image_6_1
	local Image_6_1 = GUI:Image_Create(AllIoc, "Image_6_1", 51.00, -307.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_6_1.png")
	GUI:setAnchorPoint(Image_6_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6_1, false)
	GUI:setTag(Image_6_1, 0)
	GUI:setVisible(Image_6_1, false)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Image_6_1, "Button_6", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Image_6_2
	local Image_6_2 = GUI:Image_Create(AllIoc, "Image_6_2", 51.00, -307.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_6_2.png")
	GUI:setAnchorPoint(Image_6_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6_2, false)
	GUI:setTag(Image_6_2, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Image_6_2, "Image_6", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create Image_7_1
	local Image_7_1 = GUI:Image_Create(AllIoc, "Image_7_1", 9.00, -204.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_7_1.png")
	GUI:setAnchorPoint(Image_7_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7_1, false)
	GUI:setTag(Image_7_1, 0)
	GUI:setVisible(Image_7_1, false)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Image_7_1, "Button_7", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	-- Create Image_7_2
	local Image_7_2 = GUI:Image_Create(AllIoc, "Image_7_2", 9.00, -204.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_7_2.png")
	GUI:setAnchorPoint(Image_7_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7_2, false)
	GUI:setTag(Image_7_2, 0)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Image_7_2, "Image_7", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create Image_8_1
	local Image_8_1 = GUI:Image_Create(AllIoc, "Image_8_1", 51.00, -101.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_8_1.png")
	GUI:setAnchorPoint(Image_8_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8_1, false)
	GUI:setTag(Image_8_1, 0)
	GUI:setVisible(Image_8_1, false)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(Image_8_1, "Button_8", 7.00, -30.00, "res/custom/BaDaLu/QianMenBaJiang/button1.png")
	GUI:Button_setTitleText(Button_8, [[]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)

	-- Create Image_8_2
	local Image_8_2 = GUI:Image_Create(AllIoc, "Image_8_2", 51.00, -101.00, "res/custom/BaDaLu/QianMenBaJiang/ioc_8_2.png")
	GUI:setAnchorPoint(Image_8_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8_2, false)
	GUI:setTag(Image_8_2, 0)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Image_8_2, "Image_8", 5.00, -28.00, "res/custom/BaDaLu/QianMenBaJiang/button2.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)

	-- Create ItemShow
	local ItemShow = GUI:Layout_Create(ImageBG, "ItemShow", 772.00, 188.00, 169, 57, false)
	GUI:setAnchorPoint(ItemShow, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow, true)
	GUI:setTag(ItemShow, 0)

	-- Create Button_9
	local Button_9 = GUI:Button_Create(ImageBG, "Button_9", 722.00, 72.00, "res/custom/JuQing/btn57.png")
	GUI:Button_setTitleText(Button_9, [[]])
	GUI:Button_setTitleColor(Button_9, "#ffffff")
	GUI:Button_setTitleFontSize(Button_9, 16)
	GUI:Button_titleEnableOutline(Button_9, "#000000", 1)
	GUI:setAnchorPoint(Button_9, 0.00, 0.00)
	GUI:setTouchEnabled(Button_9, true)
	GUI:setTag(Button_9, 0)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(ImageBG, "Image_9", 731.00, 64.00, "res/custom/JuQing/btn0.png")
	GUI:setAnchorPoint(Image_9, 0.00, 0.00)
	GUI:setScale(Image_9, 0.60)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 0)

	-- Create Tips_Button
	local Tips_Button = GUI:Button_Create(ImageBG, "Tips_Button", 846.00, 383.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(Tips_Button, [[]])
	GUI:Button_setTitleColor(Tips_Button, "#ffffff")
	GUI:Button_setTitleFontSize(Tips_Button, 16)
	GUI:Button_titleEnableOutline(Tips_Button, "#000000", 1)
	GUI:setAnchorPoint(Tips_Button, 0.00, 0.00)
	GUI:setScale(Tips_Button, 0.60)
	GUI:setTouchEnabled(Tips_Button, true)
	GUI:setTag(Tips_Button, 0)

	-- Create Tips_Show
	local Tips_Show = GUI:Image_Create(ImageBG, "Tips_Show", 324.00, 190.00, "res/custom/BaDaLu/QianMenBaJiang/tips.png")
	GUI:setAnchorPoint(Tips_Show, 0.00, 0.00)
	GUI:setTouchEnabled(Tips_Show, false)
	GUI:setTag(Tips_Show, 0)
	GUI:setVisible(Tips_Show, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
