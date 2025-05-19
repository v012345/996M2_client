local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Layout
	local Layout = GUI:Layout_Create(parent, "Layout", 0.00, 0.00, 648, 436, false)
	GUI:setAnchorPoint(Layout, 0.00, 0.00)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create ImageBG
	local ImageBG = GUI:Image_Create(Layout, "ImageBG", 0.00, 0.00, "res/custom/kf_GongShaChuanSong/bg_page_2.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextLingFu
	local TextLingFu = GUI:Text_Create(ImageBG, "TextLingFu", 129.00, 101.00, 18, "#4ae74a", [[文本]])
	GUI:setAnchorPoint(TextLingFu, 0.00, 0.00)
	GUI:setTouchEnabled(TextLingFu, false)
	GUI:setTag(TextLingFu, -1)
	GUI:Text_enableOutline(TextLingFu, "#000000", 1)

	-- Create TextHuoYue
	local TextHuoYue = GUI:Text_Create(ImageBG, "TextHuoYue", 358.00, 101.00, 18, "#4ae74a", [[文本]])
	GUI:setAnchorPoint(TextHuoYue, 0.00, 0.00)
	GUI:setTouchEnabled(TextHuoYue, false)
	GUI:setTag(TextHuoYue, -1)
	GUI:Text_enableOutline(TextHuoYue, "#000000", 1)

	-- Create ButtonLingQu
	local ButtonLingQu = GUI:Button_Create(ImageBG, "ButtonLingQu", 492.00, 95.00, "res/custom/kf_GongShaChuanSong/lqbtn.png")
	GUI:Button_setTitleText(ButtonLingQu, [[]])
	GUI:Button_setTitleColor(ButtonLingQu, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonLingQu, 14)
	GUI:Button_titleEnableOutline(ButtonLingQu, "#000000", 1)
	GUI:setAnchorPoint(ButtonLingQu, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonLingQu, true)
	GUI:setTag(ButtonLingQu, -1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 441.00, 3.00, "res/custom/gongshachuansong/help.png")
	GUI:Button_setTitleText(ButtonHelp, [[]])
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 14)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setAnchorPoint(ButtonHelp, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, -1)
	GUI:setVisible(ButtonHelp, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 342.00, 391.00, "res/custom/kf_GongShaChuanSong/f1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, true)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 331.00, 364.00, "res/custom/kf_GongShaChuanSong/f2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, true)
	GUI:setTag(Image_2, 0)

	ui.update(__data__)
	return Layout
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
