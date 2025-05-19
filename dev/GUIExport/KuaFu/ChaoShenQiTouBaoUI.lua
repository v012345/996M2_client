local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -6.00, 5.00, "res/custom/ChaoShenQiTouBao/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 962.00, 462.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 649.00, 26.00, "res/custom/ChaoShenQiTouBao/btn1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 154.00, 59.00, "res/custom/ChaoShenQiTouBao/itemlistbg.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)
	GUI:setVisible(Image_1, false)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 154.00, 60.00, 364, 360, 1)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 171.00, 424.00, 293, 30, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Panel_2, "Button_2", 19.00, 0.00, "res/custom/ChaoShenQiTouBao/tab_1_2.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/custom/ChaoShenQiTouBao/tab_1_1.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Panel_2, "Button_3", 163.00, 0.00, "res/custom/ChaoShenQiTouBao/tab_2_2.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/custom/ChaoShenQiTouBao/tab_2_1.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 787.00, 269.00, 18, "#00ff00", [[0]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(ImageBG, "Panel_3", 715.00, 166.00, 66, 66, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 713.00, 166.00, "res/custom/ChaoShenQiTouBao/itembg.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 885.00, 424.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(ButtonHelp, [[]])
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 16)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setAnchorPoint(ButtonHelp, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(ImageBG, "Image_3", 650.00, 99.00, "res/custom/ChaoShenQiTouBao/lingfu.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
