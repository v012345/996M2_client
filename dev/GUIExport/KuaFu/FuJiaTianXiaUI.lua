local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 199.00, 19.00, "res/custom/FuJiaTianXia/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 923.00, 482.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 5.00, -2.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 94.00, 51.00, "res/custom/FuJiaTianXia/btn1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 374.00, 51.00, "res/custom/FuJiaTianXia/btn2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_1, "Button_3", 654.00, 51.00, "res/custom/FuJiaTianXia/btn3.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(ImageBG, "Node_2", 0.00, 0.00)
	GUI:setTag(Node_2, 0)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Node_2, "Text_2", 509.00, 384.00, 14, "#00ff00", [[神魂属性+10% 总爆率+10% 减免人物伤害+15%  攻击玩家几率
锁定玩家30秒，期间不能隐身。
]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_2_1
	local Text_2_1 = GUI:Text_Create(Node_2, "Text_2_1", 509.00, 372.00, 14, "#00ff00", [[神魂属性+8% 总爆率+8% 减免人物伤害+10%]])
	GUI:setAnchorPoint(Text_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2_1, false)
	GUI:setTag(Text_2_1, 0)
	GUI:Text_enableOutline(Text_2_1, "#000000", 1)

	-- Create Text_2_1_1
	local Text_2_1_1 = GUI:Text_Create(Node_2, "Text_2_1_1", 509.00, 334.00, 14, "#00ff00", [[神魂属性+6% 总爆率+6% 减免人物伤害+8%]])
	GUI:setAnchorPoint(Text_2_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2_1_1, false)
	GUI:setTag(Text_2_1_1, 0)
	GUI:Text_enableOutline(Text_2_1_1, "#000000", 1)

	-- Create Text_2_1_2
	local Text_2_1_2 = GUI:Text_Create(Node_2, "Text_2_1_2", 509.00, 296.00, 14, "#00ff00", [[神魂属性+4% 总爆率+4% 减免人物伤害+6%]])
	GUI:setAnchorPoint(Text_2_1_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2_1_2, false)
	GUI:setTag(Text_2_1_2, 0)
	GUI:Text_enableOutline(Text_2_1_2, "#000000", 1)

	-- Create Text_2_1_3
	local Text_2_1_3 = GUI:Text_Create(Node_2, "Text_2_1_3", 509.00, 258.00, 14, "#00ff00", [[神魂属性+2% 总爆率+2% 减免人物伤害+4%]])
	GUI:setAnchorPoint(Text_2_1_3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2_1_3, false)
	GUI:setTag(Text_2_1_3, 0)
	GUI:Text_enableOutline(Text_2_1_3, "#000000", 1)

	-- Create Text_2_1_4
	local Text_2_1_4 = GUI:Text_Create(Node_2, "Text_2_1_4", 509.00, 220.00, 14, "#00ff00", [[神魂属性+1% 总爆率+1% 减免人物伤害+2%]])
	GUI:setAnchorPoint(Text_2_1_4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2_1_4, false)
	GUI:setTag(Text_2_1_4, 0)
	GUI:Text_enableOutline(Text_2_1_4, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 511.00, 129.00, 18, "#00ff00", [[0]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 167.00, 211.00, 341, 227, 1)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
