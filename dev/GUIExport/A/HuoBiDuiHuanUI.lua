local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/bag/duihuanbg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 444.00, 230.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/custom/ceshijilu/close.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NumLooks
	local NumLooks = GUI:Text_Create(ImageBG, "NumLooks", 303.00, 233.00, 16, "#00ff00", [[次数显示]])
	GUI:Text_enableOutline(NumLooks, "#000000", 1)
	GUI:setAnchorPoint(NumLooks, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks, false)
	GUI:setTag(NumLooks, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 349.00, 178.00, "res/custom/bag/duihuan_btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 349.00, 122.00, "res/custom/bag/duihuan_btn.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 349.00, 75.00, "res/custom/bag/duihuan_btn.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(ImageBG, "Button_4", 349.00, 30.00, "res/custom/bag/duihuan_btn.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_help
	local Button_help = GUI:Button_Create(ImageBG, "Button_help", 354.00, 218.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(Button_help, [[]])
	GUI:Button_setTitleColor(Button_help, "#ffffff")
	GUI:Button_setTitleFontSize(Button_help, 16)
	GUI:Button_titleEnableOutline(Button_help, "#000000", 1)
	GUI:setAnchorPoint(Button_help, 0.00, 0.00)
	GUI:setScale(Button_help, 0.60)
	GUI:setTouchEnabled(Button_help, true)
	GUI:setTag(Button_help, 0)

	-- Create Help_layout
	local Help_layout = GUI:Layout_Create(ImageBG, "Help_layout", 125.00, 96.00, 211, 111, false)
	GUI:Layout_setBackGroundColorType(Help_layout, 1)
	GUI:Layout_setBackGroundColor(Help_layout, "#c0c0c0")
	GUI:Layout_setBackGroundColorOpacity(Help_layout, 229)
	GUI:setAnchorPoint(Help_layout, 0.00, 0.00)
	GUI:setTouchEnabled(Help_layout, true)
	GUI:setTag(Help_layout, 0)
	GUI:setVisible(Help_layout, false)

	-- Create Help_Text
	local Help_Text = GUI:Text_Create(Help_layout, "Help_Text", 9.00, 12.00, 16, "#00ffff", [[金币兑换元宝次数每日更新
初始为每天10次
首充玩家增加10次
特权玩家增加10次
打工皇帝增加20次]])
	GUI:Text_enableOutline(Help_Text, "#000000", 1)
	GUI:setAnchorPoint(Help_Text, 0.00, 0.00)
	GUI:setTouchEnabled(Help_Text, false)
	GUI:setTag(Help_Text, 0)

	-- Create Image_x2
	local Image_x2 = GUI:Image_Create(ImageBG, "Image_x2", 357.00, 242.00, "res/custom/bag/x2.png")
	GUI:setAnchorPoint(Image_x2, 0.00, 0.00)
	GUI:setScale(Image_x2, 0.80)
	GUI:setTouchEnabled(Image_x2, false)
	GUI:setTag(Image_x2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
