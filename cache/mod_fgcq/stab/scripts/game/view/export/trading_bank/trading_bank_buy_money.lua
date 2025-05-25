local ui = {}

function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setAnchorPoint(Node, 0.50, 0.50)
	GUI:setTag(Node, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node, "Panel_1", 0.00, 0.00, 612.00, 368.00, false)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 89)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Panel_1, "Panel_2", 0.00, 339.00, 612.00, 33.00, false)
	GUI:setTouchEnabled(Panel_2, false)
	GUI:setTag(Panel_2, 159)

	-- Create Image_1_0
	local Image_1_0 = GUI:Image_Create(Panel_2, "Image_1_0", -0.00, -1.00, "res/private/trading_bank/bg_yyxsz_01.png")
	GUI:Image_setScale9Slice(Image_1_0, 75, 75, 0, 0)
	GUI:setContentSize(Image_1_0, 610, 2)
	GUI:setIgnoreContentAdaptWithSize(Image_1_0, false)
	GUI:setAnchorPoint(Image_1_0, 0.00, 0.50)
	GUI:setTouchEnabled(Image_1_0, false)
	GUI:setTag(Image_1_0, 160)

	-- Create Image_32
	local Image_32 = GUI:Image_Create(Panel_2, "Image_32", 138.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32, 0, 0, 199, 199)
	GUI:setContentSize(Image_32, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32, false)
	GUI:setAnchorPoint(Image_32, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32, false)
	GUI:setTag(Image_32, 161)

	-- Create Image_32_0
	local Image_32_0 = GUI:Image_Create(Panel_2, "Image_32_0", 228.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0, false)
	GUI:setAnchorPoint(Image_32_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0, false)
	GUI:setTag(Image_32_0, 162)

	-- Create Image_32_0_0
	local Image_32_0_0 = GUI:Image_Create(Panel_2, "Image_32_0_0", 332.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0_0, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0_0, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0_0, false)
	GUI:setAnchorPoint(Image_32_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0_0, false)
	GUI:setTag(Image_32_0_0, 163)

	-- Create Image_32_0_0_0
	local Image_32_0_0_0 = GUI:Image_Create(Panel_2, "Image_32_0_0_0", 445.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0_0_0, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0_0_0, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0_0_0, false)
	GUI:setAnchorPoint(Image_32_0_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0_0_0, false)
	GUI:setTag(Image_32_0_0_0, 164)

	-- Create Panel_type2
	local Panel_type2 = GUI:Layout_Create(Panel_2, "Panel_type2", 0.00, 30.00, 139.00, 30.00, false)
	GUI:setAnchorPoint(Panel_type2, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_type2, true)
	GUI:setTag(Panel_type2, 165)

	-- Create Text_type2
	local Text_type2 = GUI:Text_Create(Panel_type2, "Text_type2", 85.00, 14.00, 18, "#ffffff", [[全部]])
	GUI:setAnchorPoint(Text_type2, 1.00, 0.50)
	GUI:setTouchEnabled(Text_type2, false)
	GUI:setTag(Text_type2, 166)
	GUI:Text_enableOutline(Text_type2, "#000000", 1)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Panel_type2, "Image_8", 95.00, 13.00, "res/private/trading_bank/word_jiaoyh_017.png")
	GUI:setAnchorPoint(Image_8, 0.50, 0.50)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 167)

	-- Create Panel_single
	local Panel_single = GUI:Layout_Create(Panel_2, "Panel_single", 334.00, 1.00, 102.00, 30.00, false)
	GUI:setTouchEnabled(Panel_single, true)
	GUI:setTag(Panel_single, 180)

	-- Create Text_3_1
	local Text_3_1 = GUI:Text_Create(Panel_single, "Text_3_1", 47.00, 13.00, 18, "#ffffff", [[单价]])
	GUI:setAnchorPoint(Text_3_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1, false)
	GUI:setTag(Text_3_1, 181)
	GUI:Text_enableOutline(Text_3_1, "#000000", 1)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Panel_single, "Image_8", 76.00, 12.00, "res/private/trading_bank/word_jiaoyh_016.png")
	GUI:setAnchorPoint(Image_8, 0.50, 0.50)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 182)

	-- Create Text_3_0
	local Text_3_0 = GUI:Text_Create(Panel_2, "Text_3_0", 385.00, 15.00, 18, "#ffffff", [[]])
	GUI:setAnchorPoint(Text_3_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_0, false)
	GUI:setTag(Text_3_0, 176)
	GUI:Text_enableOutline(Text_3_0, "#000000", 1)

	-- Create Panel_num2
	local Panel_num2 = GUI:Layout_Create(Panel_2, "Panel_num2", 184.00, 1.00, 89.00, 30.00, false)
	GUI:setAnchorPoint(Panel_num2, 0.50, 0.00)
	GUI:setTouchEnabled(Panel_num2, true)
	GUI:setTag(Panel_num2, 177)

	-- Create Text_3_0
	local Text_3_0 = GUI:Text_Create(Panel_num2, "Text_3_0", 39.00, 14.00, 18, "#ffffff", [[数量]])
	GUI:setAnchorPoint(Text_3_0, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_0, false)
	GUI:setTag(Text_3_0, 178)
	GUI:Text_enableOutline(Text_3_0, "#000000", 1)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Panel_num2, "Image_8", 68.00, 13.00, "res/private/trading_bank/word_jiaoyh_016.png")
	GUI:setAnchorPoint(Image_8, 0.50, 0.50)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 179)

	-- Create Panel_price2
	local Panel_price2 = GUI:Layout_Create(Panel_2, "Panel_price2", 228.00, 1.00, 104.00, 30.00, false)
	GUI:setTouchEnabled(Panel_price2, true)
	GUI:setTag(Panel_price2, 180)

	-- Create Text_3_1
	local Text_3_1 = GUI:Text_Create(Panel_price2, "Text_3_1", 48.00, 13.00, 18, "#ffffff", [[价格]])
	GUI:setAnchorPoint(Text_3_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1, false)
	GUI:setTag(Text_3_1, 181)
	GUI:Text_enableOutline(Text_3_1, "#000000", 1)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Panel_price2, "Image_8", 77.00, 12.00, "res/private/trading_bank/word_jiaoyh_016.png")
	GUI:setAnchorPoint(Image_8, 0.50, 0.50)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 182)

	-- Create Text_3_1
	local Text_3_1 = GUI:Text_Create(Panel_2, "Text_3_1", 542.00, 14.00, 18, "#ffffff", [[操作]])
	GUI:setAnchorPoint(Text_3_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1, false)
	GUI:setTag(Text_3_1, 183)
	GUI:Text_enableOutline(Text_3_1, "#000000", 1)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(Panel_1, "ListView_2", 306.00, 337.00, 612.00, 337.93, 1)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setAnchorPoint(ListView_2, 0.50, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 115)

	-- Create Panel_item
	local Panel_item = GUI:Layout_Create(Panel_1, "Panel_item", 306.00, 313.00, 612.00, 85.00, false)
	GUI:setAnchorPoint(Panel_item, 0.50, 1.00)
	GUI:setTouchEnabled(Panel_item, true)
	GUI:setTag(Panel_item, 116)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_item, "Image_bg", 0.00, 1.00, "res/private/trading_bank/word_jiaoyh_019.png")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 117)

	-- Create Image_item
	local Image_item = GUI:Image_Create(Panel_item, "Image_item", 41.00, 42.00, "res/private/trading_bank/1900000651.png")
	GUI:setAnchorPoint(Image_item, 0.50, 0.50)
	GUI:setTouchEnabled(Image_item, false)
	GUI:setTag(Image_item, 118)
	GUI:setVisible(Image_item, false)

	-- Create Image_head
	local Image_head = GUI:Image_Create(Image_item, "Image_head", 30.00, 30.00, "res/private/trading_bank/img_cost.png")
	GUI:setContentSize(Image_head, 60, 60)
	GUI:setIgnoreContentAdaptWithSize(Image_head, false)
	GUI:setAnchorPoint(Image_head, 0.50, 0.50)
	GUI:setTouchEnabled(Image_head, false)
	GUI:setTag(Image_head, 137)

	-- Create Text_goodname
	local Text_goodname = GUI:Text_Create(Panel_item, "Text_goodname", 74.00, 46.00, 20, "#ffffff", [[元宝]])
	GUI:setAnchorPoint(Text_goodname, 0.50, 0.50)
	GUI:setTouchEnabled(Text_goodname, false)
	GUI:setTag(Text_goodname, 119)
	GUI:Text_enableOutline(Text_goodname, "#000000", 1)

	-- Create Text_single
	local Text_single = GUI:Text_Create(Panel_item, "Text_single", 389.00, 41.00, 16, "#ffffff", [[0.66/万个]])
	GUI:setAnchorPoint(Text_single, 0.50, 0.50)
	GUI:setTouchEnabled(Text_single, false)
	GUI:setTag(Text_single, 120)
	GUI:Text_enableOutline(Text_single, "#000000", 1)

	-- Create Text_num
	local Text_num = GUI:Text_Create(Panel_item, "Text_num", 178.00, 44.00, 16, "#ffffff", [[99]])
	GUI:setAnchorPoint(Text_num, 0.50, 0.50)
	GUI:setTouchEnabled(Text_num, false)
	GUI:setTag(Text_num, 121)
	GUI:Text_enableOutline(Text_num, "#000000", 1)

	-- Create Text_pirce
	local Text_pirce = GUI:Text_Create(Panel_item, "Text_pirce", 278.00, 41.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_pirce, 0.50, 0.50)
	GUI:setTouchEnabled(Text_pirce, false)
	GUI:setTag(Text_pirce, 122)
	GUI:Text_enableOutline(Text_pirce, "#000000", 1)

	-- Create Button_buy
	local Button_buy = GUI:Button_Create(Panel_item, "Button_buy", 510.00, 41.00, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTexturePressed(Button_buy, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTextureDisabled(Button_buy, "res/private/trading_bank/1900000611.png")
	GUI:Button_setScale9Slice(Button_buy, 25, 26, 11, 11)
	GUI:setContentSize(Button_buy, 76, 33)
	GUI:setIgnoreContentAdaptWithSize(Button_buy, false)
	GUI:Button_setTitleText(Button_buy, "购买")
	GUI:Button_setTitleColor(Button_buy, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_buy, 16)
	GUI:Button_titleEnableOutline(Button_buy, "#000000", 1)
	GUI:Win_SetParam(Button_buy, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_buy, 0.50, 0.50)
	GUI:setTouchEnabled(Button_buy, true)
	GUI:setTag(Button_buy, 123)

	-- Create Button_bargain
	local Button_bargain = GUI:Button_Create(Panel_item, "Button_bargain", 581.00, 41.00, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTexturePressed(Button_bargain, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTextureDisabled(Button_bargain, "res/private/trading_bank/1900000611.png")
	GUI:Button_setScale9Slice(Button_bargain, 25, 26, 11, 11)
	GUI:setContentSize(Button_bargain, 46, 33)
	GUI:setIgnoreContentAdaptWithSize(Button_bargain, false)
	GUI:Button_setTitleText(Button_bargain, "还价")
	GUI:Button_setTitleColor(Button_bargain, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_bargain, 16)
	GUI:Button_titleEnableOutline(Button_bargain, "#000000", 1)
	GUI:Win_SetParam(Button_bargain, {grey = 1}, "Button")
	GUI:setAnchorPoint(Button_bargain, 0.50, 0.50)
	GUI:setTouchEnabled(Button_bargain, true)
	GUI:setTag(Button_bargain, 123)
end

return ui