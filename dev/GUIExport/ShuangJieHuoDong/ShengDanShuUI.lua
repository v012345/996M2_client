local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 16.00, -30.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 497.00, 506.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_showTips
	local Node_showTips = GUI:Node_Create(ImageBG, "Node_showTips", 0.00, 0.00)
	GUI:setTag(Node_showTips, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_showTips, "Panel_1", 313.00, 401.00, 75, 24, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Node_showTips, "Panel_2", 187.00, 306.00, 70, 22, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Node_showTips, "Panel_3", 446.00, 306.00, 70, 22, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(Node_showTips, "Panel_4", 232.00, 155.00, 70, 22, false)
	GUI:setAnchorPoint(Panel_4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(Node_showTips, "Panel_5", 396.00, 154.00, 70, 22, false)
	GUI:setAnchorPoint(Panel_5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create Node_btnList
	local Node_btnList = GUI:Node_Create(ImageBG, "Node_btnList", 1.00, -3.00)
	GUI:setTag(Node_btnList, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_btnList, "Button_1", 306.00, 362.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/lingqu.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_btnList, "Button_2", 170.00, 265.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/lingqu.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_btnList, "Button_3", 432.00, 265.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/lingqu.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_btnList, "Button_4", 220.00, 112.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/lingqu.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_btnList, "Button_5", 386.00, 112.00, "res/custom/ShuangJieHuoDongMain/ShengDanShu/lingqu.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Node_showItem
	local Node_showItem = GUI:Node_Create(ImageBG, "Node_showItem", 25.00, 25.00)
	GUI:setTag(Node_showItem, 0)

	-- Create Panel_show1
	local Panel_show1 = GUI:Layout_Create(Node_showItem, "Panel_show1", 327.00, 429.00, 50, 50, false)
	GUI:setAnchorPoint(Panel_show1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_show1, true)
	GUI:setTag(Panel_show1, 0)

	-- Create Panel_show2
	local Panel_show2 = GUI:Layout_Create(Node_showItem, "Panel_show2", 197.00, 333.00, 50, 50, false)
	GUI:setAnchorPoint(Panel_show2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_show2, true)
	GUI:setTag(Panel_show2, 0)

	-- Create Panel_show3
	local Panel_show3 = GUI:Layout_Create(Node_showItem, "Panel_show3", 457.00, 333.00, 50, 50, false)
	GUI:setAnchorPoint(Panel_show3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_show3, true)
	GUI:setTag(Panel_show3, 0)

	-- Create Panel_show4
	local Panel_show4 = GUI:Layout_Create(Node_showItem, "Panel_show4", 246.00, 181.00, 50, 50, false)
	GUI:setAnchorPoint(Panel_show4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_show4, true)
	GUI:setTag(Panel_show4, 0)

	-- Create Panel_show5
	local Panel_show5 = GUI:Layout_Create(Node_showItem, "Panel_show5", 408.00, 180.00, 50, 50, false)
	GUI:setAnchorPoint(Panel_show5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_show5, true)
	GUI:setTag(Panel_show5, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
