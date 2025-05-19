local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 51.00, 29.00, "res/custom/XinMoLaoRen/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 857.00, 454.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 636.00, 53.00, "res/custom/XinMoLaoRen/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 565.00, 132.00, "res/custom/XinMoLaoRen/layer/1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 859.00, 52.00, "res/custom/XinMoLaoRen/rankBtn.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 271.00, 130.00, "res/custom/XinMoLaoRen/rankBG.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)
	GUI:setVisible(Image_2, false)

	-- Create Button_rankClose
	local Button_rankClose = GUI:Button_Create(Image_2, "Button_rankClose", 428.00, 259.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(Button_rankClose, [[]])
	GUI:Button_setTitleColor(Button_rankClose, "#ffffff")
	GUI:Button_setTitleFontSize(Button_rankClose, 16)
	GUI:Button_titleEnableOutline(Button_rankClose, "#000000", 1)
	GUI:setAnchorPoint(Button_rankClose, 0.00, 0.00)
	GUI:setTouchEnabled(Button_rankClose, true)
	GUI:setTag(Button_rankClose, 0)

	-- Create Text_nickname_1
	local Text_nickname_1 = GUI:Text_Create(Image_2, "Text_nickname_1", 211.00, 214.00, 18, "#ffec19", [[无]])
	GUI:setAnchorPoint(Text_nickname_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_nickname_1, false)
	GUI:setTag(Text_nickname_1, 0)
	GUI:Text_enableOutline(Text_nickname_1, "#000000", 1)

	-- Create Text_nickname_2
	local Text_nickname_2 = GUI:Text_Create(Image_2, "Text_nickname_2", 211.00, 149.00, 18, "#3ebde6", [[无]])
	GUI:setAnchorPoint(Text_nickname_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_nickname_2, false)
	GUI:setTag(Text_nickname_2, 0)
	GUI:Text_enableOutline(Text_nickname_2, "#000000", 1)

	-- Create Text_nickname_3
	local Text_nickname_3 = GUI:Text_Create(Image_2, "Text_nickname_3", 211.00, 85.00, 18, "#cb7637", [[无]])
	GUI:setAnchorPoint(Text_nickname_3, 0.50, 0.00)
	GUI:setTouchEnabled(Text_nickname_3, false)
	GUI:setTag(Text_nickname_3, 0)
	GUI:Text_enableOutline(Text_nickname_3, "#000000", 1)

	-- Create Text_time_1
	local Text_time_1 = GUI:Text_Create(Image_2, "Text_time_1", 388.00, 226.00, 16, "#4dd41e", [[]])
	GUI:setAnchorPoint(Text_time_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_time_1, false)
	GUI:setTag(Text_time_1, 0)
	GUI:Text_enableOutline(Text_time_1, "#000000", 1)

	-- Create Text_time_2
	local Text_time_2 = GUI:Text_Create(Image_2, "Text_time_2", 389.00, 159.00, 16, "#4dd41e", [[]])
	GUI:setAnchorPoint(Text_time_2, 0.50, 0.50)
	GUI:setTouchEnabled(Text_time_2, false)
	GUI:setTag(Text_time_2, 0)
	GUI:Text_enableOutline(Text_time_2, "#000000", 1)

	-- Create Text_time_3
	local Text_time_3 = GUI:Text_Create(Image_2, "Text_time_3", 389.00, 96.00, 16, "#4dd41e", [[]])
	GUI:setAnchorPoint(Text_time_3, 0.50, 0.50)
	GUI:setTouchEnabled(Text_time_3, false)
	GUI:setTag(Text_time_3, 0)
	GUI:Text_enableOutline(Text_time_3, "#000000", 1)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
