local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(parent, "Panel_1", 44.00, 1.00, 1062, 638, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Panel_1, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_selected
	local Image_selected = GUI:Image_Create(Node_1, "Image_selected", 266.00, 472.00, "res/custom/TianMing/TuJian/selected.png")
	GUI:setAnchorPoint(Image_selected, 0.00, 0.00)
	GUI:setTouchEnabled(Image_selected, false)
	GUI:setTag(Image_selected, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 276.00, 480.00, "res/custom/TianMing/TuJian/btn_1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 387.00, 480.00, "res/custom/TianMing/TuJian/btn_2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_1, "Button_3", 498.00, 480.00, "res/custom/TianMing/TuJian/btn_3.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleDisableOutLine(Button_3)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_1, "Button_4", 609.00, 479.00, "res/custom/TianMing/TuJian/btn_4.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleDisableOutLine(Button_4)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_1, "Button_5", 720.00, 479.00, "res/custom/TianMing/TuJian/btn_5.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleDisableOutLine(Button_5)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create ScrollView_1
	local ScrollView_1 = GUI:ScrollView_Create(Panel_1, "ScrollView_1", 48.00, 62.00, 964, 400, 1)
	GUI:ScrollView_setBounceEnabled(ScrollView_1, true)
	GUI:ScrollView_setInnerContainerSize(ScrollView_1, 964.00, 400.00)
	GUI:setAnchorPoint(ScrollView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_1, true)
	GUI:setTag(ScrollView_1, 0)

	-- Create Panel_count
	local Panel_count = GUI:Layout_Create(Panel_1, "Panel_count", 859.00, 18.00, 76, 38, false)
	GUI:setAnchorPoint(Panel_count, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_count, true)
	GUI:setTag(Panel_count, 0)

	-- Create Image_tipsBg
	local Image_tipsBg = GUI:Image_Create(Panel_1, "Image_tipsBg", 228.00, 13.00, "res/custom/TianMing/TuJian/tipsBg.png")
	GUI:setAnchorPoint(Image_tipsBg, 0.00, 0.00)
	GUI:setTouchEnabled(Image_tipsBg, false)
	GUI:setTag(Image_tipsBg, 0)

	-- Create Image_tips
	local Image_tips = GUI:Image_Create(Image_tipsBg, "Image_tips", 37.00, 6.00, "res/custom/TianMing/TuJian/tips_1.png")
	GUI:setAnchorPoint(Image_tips, 0.00, 0.00)
	GUI:setTouchEnabled(Image_tips, false)
	GUI:setTag(Image_tips, 0)

	-- Create Node_erticalBar
	local Node_erticalBar = GUI:Node_Create(Panel_1, "Node_erticalBar", 0.00, 0.00)
	GUI:setTag(Node_erticalBar, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Panel_1, "Image_1", 40.00, 456.00, "res/custom/TianMing/TuJian/line.png")
	GUI:setContentSize(Image_1, 980, 18)
	GUI:setIgnoreContentAdaptWithSize(Image_1, false)
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Panel_1, "Text_2", 245.00, -8.00, 16, "#00ff00", [[新增气运不会计入气运图鉴，即已经激活气运图鉴的玩家不会受此更新影响属性。]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	ui.update(__data__)
	return Panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
