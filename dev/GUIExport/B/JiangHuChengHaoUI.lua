local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 14.00, 11.00, "res/custom/JiangHuChengHao/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 955.00, 450.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 19.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodeCurrentEffect
	local NodeCurrentEffect = GUI:Node_Create(ImageBG, "NodeCurrentEffect", 0.00, 0.00)
	GUI:setTag(NodeCurrentEffect, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(NodeCurrentEffect, "Effect", 348.00, 373.00, 3, 15185)
	GUI:setTag(Effect, -1)

	-- Create NodeNextEffect
	local NodeNextEffect = GUI:Node_Create(ImageBG, "NodeNextEffect", 0.00, 0.00)
	GUI:setTag(NodeNextEffect, -1)

	-- Create Effect
	Effect = GUI:Effect_Create(NodeNextEffect, "Effect", 764.00, 373.00, 3, 15185)
	GUI:setTag(Effect, -1)

	-- Create NodeCurrentAtt
	local NodeCurrentAtt = GUI:Node_Create(ImageBG, "NodeCurrentAtt", 40.00, 38.00)
	GUI:setTag(NodeCurrentAtt, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(NodeCurrentAtt, "Text_1", 247.00, 284.00, 16, "#ffffff", [[攻魔道：]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_attr10
	local Text_attr10 = GUI:Text_Create(Text_1, "Text_attr10", 104.00, -1.00, 16, "#ffffff", [[文本]])
	GUI:setAnchorPoint(Text_attr10, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr10, false)
	GUI:setTag(Text_attr10, -1)
	GUI:Text_enableOutline(Text_attr10, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(NodeCurrentAtt, "Text_2", 247.00, 245.00, 16, "#ffffff", [[生命值：]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_attr20
	local Text_attr20 = GUI:Text_Create(Text_2, "Text_attr20", 104.00, -1.00, 16, "#efad21", [[文本]])
	GUI:setAnchorPoint(Text_attr20, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr20, false)
	GUI:setTag(Text_attr20, -1)
	GUI:Text_enableOutline(Text_attr20, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(NodeCurrentAtt, "Text_3", 247.00, 204.00, 16, "#ffffff", [[魔法值：]])
	GUI:setAnchorPoint(Text_3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, -1)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Text_attr30
	local Text_attr30 = GUI:Text_Create(Text_3, "Text_attr30", 104.00, -1.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_attr30, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr30, false)
	GUI:setTag(Text_attr30, -1)
	GUI:Text_enableOutline(Text_attr30, "#000000", 1)

	-- Create Text_4
	local Text_4 = GUI:Text_Create(NodeCurrentAtt, "Text_4", 247.00, 165.00, 16, "#ffffff", [[最大攻击：]])
	GUI:setAnchorPoint(Text_4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, -1)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Text_attr40
	local Text_attr40 = GUI:Text_Create(Text_4, "Text_attr40", 104.00, -1.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_attr40, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr40, false)
	GUI:setTag(Text_attr40, -1)
	GUI:Text_enableOutline(Text_attr40, "#000000", 1)

	-- Create Text_5
	local Text_5 = GUI:Text_Create(NodeCurrentAtt, "Text_5", 247.00, 125.00, 16, "#ffffff", [[最大体力：]])
	GUI:setAnchorPoint(Text_5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_5, false)
	GUI:setTag(Text_5, -1)
	GUI:Text_enableOutline(Text_5, "#000000", 1)

	-- Create Text_attr50
	local Text_attr50 = GUI:Text_Create(Text_5, "Text_attr50", 104.00, 0.00, 16, "#00ffff", [[文本]])
	GUI:setAnchorPoint(Text_attr50, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr50, false)
	GUI:setTag(Text_attr50, -1)
	GUI:Text_enableOutline(Text_attr50, "#000000", 1)

	-- Create Text_6
	local Text_6 = GUI:Text_Create(NodeCurrentAtt, "Text_6", 247.00, 85.00, 16, "#ffffff", [[打怪爆率：]])
	GUI:setAnchorPoint(Text_6, 0.00, 0.00)
	GUI:setTouchEnabled(Text_6, false)
	GUI:setTag(Text_6, -1)
	GUI:Text_enableOutline(Text_6, "#000000", 1)

	-- Create Text_attr60
	local Text_attr60 = GUI:Text_Create(Text_6, "Text_attr60", 104.00, 0.00, 16, "#00ffff", [[文本]])
	GUI:setAnchorPoint(Text_attr60, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr60, false)
	GUI:setTag(Text_attr60, -1)
	GUI:Text_enableOutline(Text_attr60, "#000000", 1)

	-- Create NodeNextAtt
	local NodeNextAtt = GUI:Node_Create(ImageBG, "NodeNextAtt", 40.00, 38.00)
	GUI:setTag(NodeNextAtt, -1)

	-- Create Text_1
	Text_1 = GUI:Text_Create(NodeNextAtt, "Text_1", 662.00, 284.00, 16, "#ffffff", [[攻魔道：]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_attr1
	local Text_attr1 = GUI:Text_Create(Text_1, "Text_attr1", 104.00, -1.00, 16, "#ffffff", [[文本]])
	GUI:setAnchorPoint(Text_attr1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr1, false)
	GUI:setTag(Text_attr1, -1)
	GUI:Text_enableOutline(Text_attr1, "#000000", 1)

	-- Create Text_2
	Text_2 = GUI:Text_Create(NodeNextAtt, "Text_2", 662.00, 245.00, 16, "#ffffff", [[生命值：]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_attr2
	local Text_attr2 = GUI:Text_Create(Text_2, "Text_attr2", 104.00, -1.00, 16, "#efad21", [[文本]])
	GUI:setAnchorPoint(Text_attr2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr2, false)
	GUI:setTag(Text_attr2, -1)
	GUI:Text_enableOutline(Text_attr2, "#000000", 1)

	-- Create Text_3
	Text_3 = GUI:Text_Create(NodeNextAtt, "Text_3", 662.00, 204.00, 16, "#ffffff", [[魔法值：]])
	GUI:setAnchorPoint(Text_3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, -1)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	-- Create Text_attr3
	local Text_attr3 = GUI:Text_Create(Text_3, "Text_attr3", 104.00, -1.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_attr3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr3, false)
	GUI:setTag(Text_attr3, -1)
	GUI:Text_enableOutline(Text_attr3, "#000000", 1)

	-- Create Text_4
	Text_4 = GUI:Text_Create(NodeNextAtt, "Text_4", 662.00, 165.00, 16, "#ffffff", [[最大攻击：]])
	GUI:setAnchorPoint(Text_4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_4, false)
	GUI:setTag(Text_4, -1)
	GUI:Text_enableOutline(Text_4, "#000000", 1)

	-- Create Text_attr4
	local Text_attr4 = GUI:Text_Create(Text_4, "Text_attr4", 104.00, -1.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_attr4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr4, false)
	GUI:setTag(Text_attr4, -1)
	GUI:Text_enableOutline(Text_attr4, "#000000", 1)

	-- Create Text_5
	Text_5 = GUI:Text_Create(NodeNextAtt, "Text_5", 662.00, 125.00, 16, "#ffffff", [[最大体力：]])
	GUI:setAnchorPoint(Text_5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_5, false)
	GUI:setTag(Text_5, -1)
	GUI:Text_enableOutline(Text_5, "#000000", 1)

	-- Create Text_attr5
	local Text_attr5 = GUI:Text_Create(Text_5, "Text_attr5", 104.00, 0.00, 16, "#00ffff", [[文本]])
	GUI:setAnchorPoint(Text_attr5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr5, false)
	GUI:setTag(Text_attr5, -1)
	GUI:Text_enableOutline(Text_attr5, "#000000", 1)

	-- Create Text_6
	Text_6 = GUI:Text_Create(NodeNextAtt, "Text_6", 662.00, 85.00, 16, "#ffffff", [[打怪爆率：]])
	GUI:setAnchorPoint(Text_6, 0.00, 0.00)
	GUI:setTouchEnabled(Text_6, false)
	GUI:setTag(Text_6, -1)
	GUI:Text_enableOutline(Text_6, "#000000", 1)

	-- Create Text_attr6
	local Text_attr6 = GUI:Text_Create(Text_6, "Text_attr6", 104.00, 0.00, 16, "#00ffff", [[文本]])
	GUI:setAnchorPoint(Text_attr6, 0.00, 0.00)
	GUI:setTouchEnabled(Text_attr6, false)
	GUI:setTag(Text_attr6, -1)
	GUI:Text_enableOutline(Text_attr6, "#000000", 1)

	-- Create TextCurrent
	local TextCurrent = GUI:Text_Create(ImageBG, "TextCurrent", 349.00, 430.00, 18, "#00ff00", [[]])
	GUI:setAnchorPoint(TextCurrent, 0.50, 0.00)
	GUI:setTouchEnabled(TextCurrent, false)
	GUI:setTag(TextCurrent, -1)
	GUI:Text_enableOutline(TextCurrent, "#000000", 1)

	-- Create TextNext
	local TextNext = GUI:Text_Create(ImageBG, "TextNext", 766.00, 428.00, 18, "#00ff00", [[]])
	GUI:setAnchorPoint(TextNext, 0.50, 0.00)
	GUI:setTouchEnabled(TextNext, false)
	GUI:setTag(TextNext, -1)
	GUI:Text_enableOutline(TextNext, "#000000", 1)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(ImageBG, "LayoutCost", 484.00, 39.00, 100, 50, false)
	GUI:setAnchorPoint(LayoutCost, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(ImageBG, "ButtonStart", 717.00, 45.00, "res/custom/JiangHuChengHao/btn_go.png")
	GUI:Button_setTitleText(ButtonStart, [[]])
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setAnchorPoint(ButtonStart, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
