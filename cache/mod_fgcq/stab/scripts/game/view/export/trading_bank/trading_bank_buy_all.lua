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

	-- Create Image_32_0_0
	local Image_32_0_0 = GUI:Image_Create(Panel_2, "Image_32_0_0", 238.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0_0, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0_0, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0_0, false)
	GUI:setAnchorPoint(Image_32_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0_0, false)
	GUI:setTag(Image_32_0_0, 163)

	-- Create Image_32_0_0_0
	local Image_32_0_0_0 = GUI:Image_Create(Panel_2, "Image_32_0_0_0", 348.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0_0_0, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0_0_0, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0_0_0, false)
	GUI:setAnchorPoint(Image_32_0_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0_0_0, false)
	GUI:setTag(Image_32_0_0_0, 164)

	-- Create Image_32_0_0_1
	local Image_32_0_0_1 = GUI:Image_Create(Panel_2, "Image_32_0_0_1", 454.00, 15.00, "res/private/trading_bank/bg_yyxsz_02.png")
	GUI:Image_setScale9Slice(Image_32_0_0_1, 0, 0, 199, 199)
	GUI:setContentSize(Image_32_0_0_1, 2, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_32_0_0_1, false)
	GUI:setAnchorPoint(Image_32_0_0_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_32_0_0_1, false)
	GUI:setTag(Image_32_0_0_1, 165)

	-- Create Text_2_0
	local Text_2_0 = GUI:Text_Create(Panel_2, "Text_2_0", 134.00, 15.00, 18, "#ffffff", [[商品名称]])
	GUI:setAnchorPoint(Text_2_0, 1.00, 0.50)
	GUI:setTouchEnabled(Text_2_0, false)
	GUI:setTag(Text_2_0, 166)
	GUI:Text_enableOutline(Text_2_0, "#000000", 1)

	-- Create Text_3_1
	local Text_3_1 = GUI:Text_Create(Panel_2, "Text_3_1", 523.00, 14.00, 18, "#ffffff", [[操作]])
	GUI:setAnchorPoint(Text_3_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1, false)
	GUI:setTag(Text_3_1, 183)
	GUI:Text_enableOutline(Text_3_1, "#000000", 1)

	-- Create Text_3_1_1
	local Text_3_1_1 = GUI:Text_Create(Panel_2, "Text_3_1_1", 293.00, 16.00, 18, "#ffffff", [[类型]])
	GUI:setAnchorPoint(Text_3_1_1, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1_1, false)
	GUI:setTag(Text_3_1_1, 183)
	GUI:Text_enableOutline(Text_3_1_1, "#000000", 1)

	-- Create Text_3_1_2
	local Text_3_1_2 = GUI:Text_Create(Panel_2, "Text_3_1_2", 401.00, 14.00, 18, "#ffffff", [[价格]])
	GUI:setAnchorPoint(Text_3_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(Text_3_1_2, false)
	GUI:setTag(Text_3_1_2, 183)
	GUI:Text_enableOutline(Text_3_1_2, "#000000", 1)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(Panel_1, "ListView_2", 307.00, 337.00, 612.00, 337.93, 1)
	GUI:ListView_setGravity(ListView_2, 5)
	GUI:setAnchorPoint(ListView_2, 0.50, 1.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, 115)

	-- Create Panel_item_equip
	local Panel_item_equip = GUI:Layout_Create(Panel_1, "Panel_item_equip", 306.00, 313.00, 612.00, 85.00, false)
	GUI:setAnchorPoint(Panel_item_equip, 0.50, 1.00)
	GUI:setTouchEnabled(Panel_item_equip, true)
	GUI:setTag(Panel_item_equip, 116)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_item_equip, "Image_bg", 0.00, 1.00, "res/private/trading_bank/word_jiaoyh_019.png")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 117)

	-- Create Image_item
	local Image_item = GUI:Image_Create(Panel_item_equip, "Image_item", 11.00, 42.00, "res/private/trading_bank/1900000651.png")
	GUI:setAnchorPoint(Image_item, 0.00, 0.50)
	GUI:setTouchEnabled(Image_item, false)
	GUI:setTag(Image_item, 118)

	-- Create Text_name
	local Text_name = GUI:Text_Create(Panel_item_equip, "Text_name", 81.00, 58.00, 16, "#ffffff", [[名字七个字啊啊]])
	GUI:setAnchorPoint(Text_name, 0.00, 0.50)
	GUI:setTouchEnabled(Text_name, false)
	GUI:setTag(Text_name, 120)
	GUI:Text_enableOutline(Text_name, "#000000", 1)

	-- Create Text_price
	local Text_price = GUI:Text_Create(Panel_item_equip, "Text_price", 401.00, 53.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_price, 0.50, 0.50)
	GUI:setTouchEnabled(Text_price, false)
	GUI:setTag(Text_price, 122)
	GUI:Text_enableOutline(Text_price, "#000000", 1)

	-- Create Button_buy
	local Button_buy = GUI:Button_Create(Panel_item_equip, "Button_buy", 505.00, 41.00, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTexturePressed(Button_buy, "res/private/trading_bank/btn_jiaoyh_02.png")
	GUI:Button_loadTextureDisabled(Button_buy, "res/private/trading_bank/btn_jiaoyh_02.png")
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
	local Button_bargain = GUI:Button_Create(Panel_item_equip, "Button_bargain", 579.00, 41.00, "res/private/trading_bank/1900000611.png")
	GUI:Button_loadTexturePressed(Button_bargain, "res/private/trading_bank/btn_jiaoyh_02.png")
	GUI:Button_loadTextureDisabled(Button_bargain, "res/private/trading_bank/btn_jiaoyh_02.png")
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

	-- Create Text_num
	local Text_num = GUI:Text_Create(Panel_item_equip, "Text_num", 131.00, 25.00, 16, "#ffffff", [[1]])
	GUI:setAnchorPoint(Text_num, 0.00, 0.50)
	GUI:setTouchEnabled(Text_num, false)
	GUI:setTag(Text_num, 120)
	GUI:Text_enableOutline(Text_num, "#000000", 1)

	-- Create Text_num_1
	local Text_num_1 = GUI:Text_Create(Panel_item_equip, "Text_num_1", 81.00, 25.00, 16, "#ffffff", [[数量：]])
	GUI:setAnchorPoint(Text_num_1, 0.00, 0.50)
	GUI:setTouchEnabled(Text_num_1, false)
	GUI:setTag(Text_num_1, 120)
	GUI:Text_enableOutline(Text_num_1, "#000000", 1)

	-- Create Text_num_2
	local Text_num_2 = GUI:Text_Create(Panel_item_equip, "Text_num_2", 293.00, 41.00, 16, "#ffffff", [[衣服]])
	GUI:setAnchorPoint(Text_num_2, 0.50, 0.50)
	GUI:setTouchEnabled(Text_num_2, false)
	GUI:setTag(Text_num_2, 120)
	GUI:Text_enableOutline(Text_num_2, "#000000", 1)

	-- Create Text_single
	local Text_single = GUI:Text_Create(Panel_item_equip, "Text_single", 401.00, 27.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_single, 0.50, 0.50)
	GUI:setTouchEnabled(Text_single, false)
	GUI:setTag(Text_single, 122)
	GUI:Text_enableOutline(Text_single, "#000000", 1)

	-- Create Panel_item_money
	local Panel_item_money = GUI:Layout_Create(Panel_1, "Panel_item_money", 306.00, 215.00, 612.00, 85.00, false)
	GUI:setAnchorPoint(Panel_item_money, 0.50, 1.00)
	GUI:setTouchEnabled(Panel_item_money, true)
	GUI:setTag(Panel_item_money, 116)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_item_money, "Image_bg", 0.00, 1.00, "res/private/trading_bank/word_jiaoyh_019.png")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 117)

	-- Create Image_item
	local Image_item = GUI:Image_Create(Panel_item_money, "Image_item", 41.00, 42.00, "res/private/trading_bank/1900000651.png")
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
	local Text_goodname = GUI:Text_Create(Panel_item_money, "Text_goodname", 11.00, 57.00, 20, "#ffffff", [[元宝]])
	GUI:setAnchorPoint(Text_goodname, 0.00, 0.50)
	GUI:setTouchEnabled(Text_goodname, false)
	GUI:setTag(Text_goodname, 119)
	GUI:Text_enableOutline(Text_goodname, "#000000", 1)

	-- Create Text_num
	local Text_num = GUI:Text_Create(Panel_item_money, "Text_num", 61.00, 22.00, 16, "#ffffff", [[99]])
	GUI:setAnchorPoint(Text_num, 0.00, 0.50)
	GUI:setTouchEnabled(Text_num, false)
	GUI:setTag(Text_num, 121)
	GUI:Text_enableOutline(Text_num, "#000000", 1)

	-- Create Text_pirce
	local Text_pirce = GUI:Text_Create(Panel_item_money, "Text_pirce", 401.00, 53.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_pirce, 0.50, 0.50)
	GUI:setTouchEnabled(Text_pirce, false)
	GUI:setTag(Text_pirce, 122)
	GUI:Text_enableOutline(Text_pirce, "#000000", 1)

	-- Create Button_buy
	local Button_buy = GUI:Button_Create(Panel_item_money, "Button_buy", 505.00, 41.00, "res/private/trading_bank/1900000611.png")
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
	local Button_bargain = GUI:Button_Create(Panel_item_money, "Button_bargain", 581.00, 41.00, "res/private/trading_bank/1900000611.png")
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

	-- Create Text_num_1
	local Text_num_1 = GUI:Text_Create(Panel_item_money, "Text_num_1", 11.00, 22.00, 16, "#ffffff", [[数量：]])
	GUI:setAnchorPoint(Text_num_1, 0.00, 0.50)
	GUI:setTouchEnabled(Text_num_1, false)
	GUI:setTag(Text_num_1, 121)
	GUI:Text_enableOutline(Text_num_1, "#000000", 1)

	-- Create Text_num_2
	local Text_num_2 = GUI:Text_Create(Panel_item_money, "Text_num_2", 293.00, 41.00, 16, "#ffffff", [[货币]])
	GUI:setAnchorPoint(Text_num_2, 0.50, 0.50)
	GUI:setTouchEnabled(Text_num_2, false)
	GUI:setTag(Text_num_2, 121)
	GUI:Text_enableOutline(Text_num_2, "#000000", 1)

	-- Create Text_single
	local Text_single = GUI:Text_Create(Panel_item_money, "Text_single", 401.00, 27.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_single, 0.50, 0.50)
	GUI:setTouchEnabled(Text_single, false)
	GUI:setTag(Text_single, 122)
	GUI:Text_enableOutline(Text_single, "#000000", 1)

	-- Create Panel_item_role
	local Panel_item_role = GUI:Layout_Create(Panel_1, "Panel_item_role", 306.00, 117.00, 612.00, 85.00, false)
	GUI:setAnchorPoint(Panel_item_role, 0.50, 1.00)
	GUI:setTouchEnabled(Panel_item_role, true)
	GUI:setTag(Panel_item_role, 116)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_item_role, "Image_bg", 0.00, 1.00, "res/private/trading_bank/word_jiaoyh_019.png")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 117)

	-- Create Image_item
	local Image_item = GUI:Image_Create(Panel_item_role, "Image_item", 11.00, 42.00, "res/private/trading_bank/1900000651.png")
	GUI:setAnchorPoint(Image_item, 0.00, 0.50)
	GUI:setTouchEnabled(Image_item, false)
	GUI:setTag(Image_item, 118)

	-- Create Image_head
	local Image_head = GUI:Image_Create(Image_item, "Image_head", 30.00, 30.00, "res/private/trading_bank/img_011.png")
	GUI:setAnchorPoint(Image_head, 0.50, 0.50)
	GUI:setTouchEnabled(Image_head, false)
	GUI:setTag(Image_head, 201)

	-- Create Text_name
	local Text_name = GUI:Text_Create(Panel_item_role, "Text_name", 80.00, 57.00, 16, "#ffffff", [[名字七个字啊啊]])
	GUI:setAnchorPoint(Text_name, 0.00, 0.50)
	GUI:setTouchEnabled(Text_name, false)
	GUI:setTag(Text_name, 119)
	GUI:Text_enableOutline(Text_name, "#000000", 1)

	-- Create Text_job
	local Text_job = GUI:Text_Create(Panel_item_role, "Text_job", 293.00, 41.00, 16, "#ffffff", [[法师]])
	GUI:setAnchorPoint(Text_job, 0.50, 0.50)
	GUI:setTouchEnabled(Text_job, false)
	GUI:setTag(Text_job, 120)
	GUI:Text_enableOutline(Text_job, "#000000", 1)

	-- Create Text_level
	local Text_level = GUI:Text_Create(Panel_item_role, "Text_level", 129.00, 25.00, 16, "#ffffff", [[99]])
	GUI:setAnchorPoint(Text_level, 0.00, 0.50)
	GUI:setTouchEnabled(Text_level, false)
	GUI:setTag(Text_level, 121)
	GUI:Text_enableOutline(Text_level, "#000000", 1)

	-- Create Text_pirce
	local Text_pirce = GUI:Text_Create(Panel_item_role, "Text_pirce", 401.00, 41.00, 16, "#ffffff", [[9999]])
	GUI:setAnchorPoint(Text_pirce, 0.50, 0.50)
	GUI:setTouchEnabled(Text_pirce, false)
	GUI:setTag(Text_pirce, 122)
	GUI:Text_enableOutline(Text_pirce, "#000000", 1)

	-- Create Button_buy
	local Button_buy = GUI:Button_Create(Panel_item_role, "Button_buy", 505.00, 41.00, "res/private/trading_bank/1900000611.png")
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
	local Button_bargain = GUI:Button_Create(Panel_item_role, "Button_bargain", 579.00, 41.00, "res/private/trading_bank/1900000611.png")
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

	-- Create Text_level_1
	local Text_level_1 = GUI:Text_Create(Panel_item_role, "Text_level_1", 80.00, 25.00, 16, "#ffffff", [[等级：]])
	GUI:setAnchorPoint(Text_level_1, 0.00, 0.50)
	GUI:setTouchEnabled(Text_level_1, false)
	GUI:setTag(Text_level_1, 121)
	GUI:Text_enableOutline(Text_level_1, "#000000", 1)
end

return ui