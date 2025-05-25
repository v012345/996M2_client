local ui = {}
function ui.init(parent)
	-- Create Scene
	local Scene = GUI:Node_Create(parent, "Scene", 0.00, 0.00)
	GUI:setAnchorPoint(Scene, 0.50, 0.50)
	GUI:setTag(Scene, -1)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Scene, "Panel_2", 568.00, 320.00, 1136.00, 640.00, false)
	GUI:setAnchorPoint(Panel_2, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 311)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_2, "Image_bg", 568.00, 320.00, "res/private/trading_bank/bg_jiaoyh_012.png")
	GUI:setAnchorPoint(Image_bg, 0.50, 0.50)
	GUI:setTouchEnabled(Image_bg, true)
	GUI:setTag(Image_bg, 312)

	-- Create Button_cancel
	local Button_cancel = GUI:Button_Create(Image_bg, "Button_cancel", 110.00, 43.00, "res/private/trading_bank/1900000680.png")
	GUI:Button_loadTexturePressed(Button_cancel, "res/private/trading_bank/1900000680_1.png")
	GUI:Button_loadTextureDisabled(Button_cancel, "res/private/trading_bank/1900000680_1.png")
	GUI:Button_setScale9Slice(Button_cancel, 15, 15, 11, 11)
	GUI:setContentSize(Button_cancel, 100, 40)
	GUI:setIgnoreContentAdaptWithSize(Button_cancel, false)
	GUI:Button_setTitleText(Button_cancel, "取消上架")
	GUI:Button_setTitleColor(Button_cancel, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_cancel, 18)
	GUI:Button_titleEnableOutline(Button_cancel, "#000000", 1)
	GUI:setAnchorPoint(Button_cancel, 0.50, 0.50)
	GUI:setTouchEnabled(Button_cancel, true)
	GUI:setTag(Button_cancel, 313)

	-- Create Button_next
	local Button_next = GUI:Button_Create(Image_bg, "Button_next", 264.00, 43.00, "res/private/trading_bank/1900000680.png")
	GUI:Button_loadTexturePressed(Button_next, "res/private/trading_bank/1900000680_1.png")
	GUI:Button_loadTextureDisabled(Button_next, "res/private/trading_bank/1900000680_1.png")
	GUI:Button_setScale9Slice(Button_next, 15, 15, 11, 11)
	GUI:setContentSize(Button_next, 100, 40)
	GUI:setIgnoreContentAdaptWithSize(Button_next, false)
	GUI:Button_setTitleText(Button_next, "寄售上架")
	GUI:Button_setTitleColor(Button_next, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_next, 18)
	GUI:Button_titleEnableOutline(Button_next, "#000000", 1)
	GUI:setAnchorPoint(Button_next, 0.50, 0.50)
	GUI:setTouchEnabled(Button_next, true)
	GUI:setTag(Button_next, 314)

	-- Create Button_close
	local Button_close = GUI:Button_Create(Image_bg, "Button_close", 383.00, 471.00, "res/private/trading_bank/1900000510.png")
	GUI:Button_loadTexturePressed(Button_close, "res/private/trading_bank/1900000511.png")
	GUI:Button_loadTextureDisabled(Button_close, "res/private/trading_bank/1900000511.png")
	GUI:Button_setTitleText(Button_close, "")
	GUI:Button_setTitleColor(Button_close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_close, 14)
	GUI:Button_titleEnableOutline(Button_close, "#000000", 1)
	GUI:setTouchEnabled(Button_close, true)
	GUI:setTag(Button_close, -1)

	-- Create Image_titleBg
	local Image_titleBg = GUI:Image_Create(Image_bg, "Image_titleBg", 39.00, 450.00, "res/private/trading_bank/word_sxbt_05.png")
	GUI:setTouchEnabled(Image_titleBg, false)
	GUI:setTag(Image_titleBg, -1)

	-- Create Image_title
	local Image_title = GUI:Image_Create(Image_bg, "Image_title", 189.00, 444.00, "res/private/trading_bank/img_sell_equip_title.png")
	GUI:setAnchorPoint(Image_title, 0.50, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, -1)

	-- Create Image_equipBg
	local Image_equipBg = GUI:Image_Create(Image_bg, "Image_equipBg", 158.00, 369.00, "res/private/trading_bank/img_sell_equipBg.png")
	GUI:setTouchEnabled(Image_equipBg, false)
	GUI:setTag(Image_equipBg, -1)

	-- Create Text_equip_name
	local Text_equip_name = GUI:Text_Create(Image_equipBg, "Text_equip_name", 30.00, -22.00, 16, "#ffffff", [[大吐龙]])
	GUI:setAnchorPoint(Text_equip_name, 0.50, 0.00)
	GUI:setTouchEnabled(Text_equip_name, false)
	GUI:setTag(Text_equip_name, -1)
	GUI:Text_enableOutline(Text_equip_name, "#000000", 1)

	-- Create Text_desc1
	local Text_desc1 = GUI:Text_Create(Image_bg, "Text_desc1", 126.00, 318.00, 16, "#f8e6c6", [[售价:]])
	GUI:setAnchorPoint(Text_desc1, 1.00, 0.50)
	GUI:setTouchEnabled(Text_desc1, false)
	GUI:setTag(Text_desc1, 369)
	GUI:Text_enableOutline(Text_desc1, "#000000", 1)

	-- Create Image_price
	local Image_price = GUI:Image_Create(Image_bg, "Image_price", 134.00, 302.00, "res/private/trading_bank/word_jiaoyh_022.png")
	GUI:Image_setScale9Slice(Image_price, 8, 8, 10, 10)
	GUI:setContentSize(Image_price, 90, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_price, false)
	GUI:setTouchEnabled(Image_price, false)
	GUI:setTag(Image_price, 143)

	-- Create TextField_price
	local TextField_price = GUI:TextInput_Create(Image_price, "TextField_price", 44.00, 17.00, 86.00, 26.00, 20)
	GUI:TextInput_setString(TextField_price, "")
	GUI:TextInput_setFontColor(TextField_price, "#ffffff")
	GUI:TextInput_setMaxLength(TextField_price, 13)
	GUI:setAnchorPoint(TextField_price, 0.50, 0.50)
	GUI:setTouchEnabled(TextField_price, true)
	GUI:setTag(TextField_price, -1)

	-- Create Text_min_price
	local Text_min_price = GUI:Text_Create(Image_price, "Text_min_price", 124.00, 13.00, 14, "#ffffff", [[最低1元]])
	GUI:setAnchorPoint(Text_min_price, 0.00, 0.50)
	GUI:setTouchEnabled(Text_min_price, false)
	GUI:setTag(Text_min_price, 54)
	GUI:Text_enableOutline(Text_min_price, "#000000", 1)

	-- Create Text_y
	local Text_y = GUI:Text_Create(Image_price, "Text_y", 92.00, 14.00, 16, "#ffffff", [[元]])
	GUI:setAnchorPoint(Text_y, 0.00, 0.50)
	GUI:setTouchEnabled(Text_y, false)
	GUI:setTag(Text_y, 271)
	GUI:Text_enableOutline(Text_y, "#000000", 1)

	-- Create Text_sxf
	local Text_sxf = GUI:Text_Create(Image_price, "Text_sxf", 2.00, -13.00, 14, "#00ff00", [[手续费:10%]])
	GUI:setAnchorPoint(Text_sxf, 0.00, 0.50)
	GUI:setTouchEnabled(Text_sxf, false)
	GUI:setTag(Text_sxf, 271)
	GUI:Text_enableOutline(Text_sxf, "#000000", 1)

	-- Create Text_svip_desc
	local Text_svip_desc = GUI:Text_Create(Image_price, "Text_svip_desc", -110.00, -32.00, 14, "#00ff00", [[(盒子SVIP%s交易行手续费可减免，减免详情盒子查看)]])
	GUI:setAnchorPoint(Text_svip_desc, 0.00, 0.50)
	GUI:setTouchEnabled(Text_svip_desc, false)
	GUI:setTag(Text_svip_desc, 271)
	GUI:Text_enableOutline(Text_svip_desc, "#000000", 1)

	-- Create Text_desc2
	local Text_desc2 = GUI:Text_Create(Image_bg, "Text_desc2", 126.00, 245.00, 16, "#f8e6c6", [[是否可还价:]])
	GUI:setAnchorPoint(Text_desc2, 1.00, 0.50)
	GUI:setTouchEnabled(Text_desc2, false)
	GUI:setTag(Text_desc2, 369)
	GUI:Text_enableOutline(Text_desc2, "#000000", 1)

	-- Create Panel_bargain_equip
	local Panel_bargain_equip = GUI:Layout_Create(Image_bg, "Panel_bargain_equip", 130.00, 230.00, 150.00, 30.00, false)
	GUI:setTouchEnabled(Panel_bargain_equip, true)
	GUI:setTag(Panel_bargain_equip, -1)

	-- Create Text_no
	local Text_no = GUI:Text_Create(Panel_bargain_equip, "Text_no", 122.00, 3.00, 16, "#f8e6c6", [[否]])
	GUI:setTouchEnabled(Text_no, false)
	GUI:setTag(Text_no, -1)
	GUI:Text_enableOutline(Text_no, "#000000", 1)

	-- Create Text_yes
	local Text_yes = GUI:Text_Create(Panel_bargain_equip, "Text_yes", 51.00, 3.00, 16, "#f8e6c6", [[是]])
	GUI:setTouchEnabled(Text_yes, false)
	GUI:setTag(Text_yes, -1)
	GUI:Text_enableOutline(Text_yes, "#000000", 1)

	-- Create CheckBox_true
	local CheckBox_true = GUI:CheckBox_Create(Panel_bargain_equip, "CheckBox_true", 34.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_true, false)
	GUI:setAnchorPoint(CheckBox_true, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_true, true)
	GUI:setTag(CheckBox_true, 175)

	-- Create CheckBox_false
	local CheckBox_false = GUI:CheckBox_Create(Panel_bargain_equip, "CheckBox_false", 104.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_false, false)
	GUI:setAnchorPoint(CheckBox_false, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_false, true)
	GUI:setTag(CheckBox_false, 175)

	-- Create Text_desc22
	local Text_desc22 = GUI:Text_Create(Image_bg, "Text_desc22", 136.00, 215.00, 16, "#f8e6c6", [[是否指定购买人:]])
	GUI:setAnchorPoint(Text_desc22, 1.00, 0.50)
	GUI:setTouchEnabled(Text_desc22, false)
	GUI:setTag(Text_desc22, 369)
	GUI:Text_enableOutline(Text_desc22, "#000000", 1)

	-- Create Panel_bargain_equip2
	local Panel_bargain_equip2 = GUI:Layout_Create(Image_bg, "Panel_bargain_equip2", 140.00, 200.00, 150.00, 30.00, false)
	GUI:setTouchEnabled(Panel_bargain_equip2, true)
	GUI:setTag(Panel_bargain_equip2, -1)

	-- Create Text_no2
	local Text_no2 = GUI:Text_Create(Panel_bargain_equip2, "Text_no2", 112.00, 3.00, 16, "#f8e6c6", [[否]])
	GUI:setTouchEnabled(Text_no2, false)
	GUI:setTag(Text_no2, -1)
	GUI:Text_enableOutline(Text_no2, "#000000", 1)

	-- Create Text_yes2
	local Text_yes2 = GUI:Text_Create(Panel_bargain_equip2, "Text_yes2", 41.00, 3.00, 16, "#f8e6c6", [[是]])
	GUI:setTouchEnabled(Text_yes2, false)
	GUI:setTag(Text_yes2, -1)
	GUI:Text_enableOutline(Text_yes2, "#000000", 1)

	-- Create CheckBox_true2
	local CheckBox_true2 = GUI:CheckBox_Create(Panel_bargain_equip2, "CheckBox_true2", 24.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_true2, false)
	GUI:setAnchorPoint(CheckBox_true2, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_true2, true)
	GUI:setTag(CheckBox_true2, 175)

	-- Create CheckBox_false2
	local CheckBox_false2 = GUI:CheckBox_Create(Panel_bargain_equip2, "CheckBox_false2", 94.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_false2, true)
	GUI:setAnchorPoint(CheckBox_false2, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_false2, true)
	GUI:setTag(CheckBox_false2, 175)

	-- Create Text_desc3
	local Text_desc3 = GUI:Text_Create(Image_bg, "Text_desc3", 126.00, 129.00, 16, "#f8e6c6", [[指定购买人:]])
	GUI:setAnchorPoint(Text_desc3, 1.00, 0.50)
	GUI:setTouchEnabled(Text_desc3, false)
	GUI:setTag(Text_desc3, 369)
	GUI:Text_enableOutline(Text_desc3, "#000000", 1)

	-- Create Image_target
	local Image_target = GUI:Image_Create(Image_bg, "Image_target", 134.00, 128.00, "res/private/trading_bank/word_jiaoyh_022.png")
	GUI:Image_setScale9Slice(Image_target, 8, 8, 10, 10)
	GUI:setContentSize(Image_target, 190, 30)
	GUI:setIgnoreContentAdaptWithSize(Image_target, false)
	GUI:setAnchorPoint(Image_target, 0.00, 0.50)
	GUI:setTouchEnabled(Image_target, false)
	GUI:setTag(Image_target, 134)

	-- Create TextField_target_equip
	local TextField_target_equip = GUI:TextInput_Create(Image_target, "TextField_target_equip", 95.00, 14.00, 180.00, 28.00, 20)
	GUI:TextInput_setString(TextField_target_equip, "")
	GUI:TextInput_setFontColor(TextField_target_equip, "#ffffff")
	GUI:TextInput_setMaxLength(TextField_target_equip, 32)
	GUI:setAnchorPoint(TextField_target_equip, 0.50, 0.50)
	GUI:setTouchEnabled(TextField_target_equip, true)
	GUI:setTag(TextField_target_equip, -1)

	-- Create Text_min_price
	local Text_min_price = GUI:Text_Create(Image_target, "Text_min_price", 2.00, -3.00, 14, "#ffffff", [[如需指定售卖，需输入对方
的角色名称]])
	GUI:setAnchorPoint(Text_min_price, 0.00, 1.00)
	GUI:setTouchEnabled(Text_min_price, false)
	GUI:setTag(Text_min_price, 54)
	GUI:Text_enableOutline(Text_min_price, "#000000", 1)

	-- Create dickerButton
	local dickerButton = GUI:Button_Create(Image_bg, "dickerButton", 44.00, 164.00, "res/private/trading_bank/dicker/button.png")
	GUI:Button_loadTexturePressed(dickerButton, "res/private/trading_bank/dicker/button.png")
	GUI:Button_loadTextureDisabled(dickerButton, "res/private/trading_bank/dicker/button.png")
	GUI:setContentSize(dickerButton, 200, 30)
	GUI:setIgnoreContentAdaptWithSize(dickerButton, false)
	GUI:Button_setTitleText(dickerButton, "")
	GUI:Button_setTitleColor(dickerButton, "#ffffff")
	GUI:Button_setTitleFontSize(dickerButton, 0)
	GUI:Button_titleDisableOutLine(dickerButton)
	GUI:setTouchEnabled(dickerButton, true)
	GUI:setTag(dickerButton, -1)

	-- Create Text
	local Text = GUI:Text_Create(dickerButton, "Text", 0.00, 9.00, 16, "#00ff00", [[开启还价省心模式>>]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(dickerButton, "Text_1", 0.00, 9.00, 16, "#00ff00", [[开启还价省心模式>>    已开启]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:setVisible(Text_1, false)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(dickerButton, "Text_2", 0.00, 8.00, 16, "#f8e6c6", [[超过30元的还价，自动同意。]])
	GUI:setAnchorPoint(Text_2, 0.00, 1.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:setVisible(Text_2, false)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Panel_dicker
	local Panel_dicker = GUI:Layout_Create(Image_bg, "Panel_dicker", -172.00, 517.00, 732.00, 520.00, false)
	GUI:setAnchorPoint(Panel_dicker, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_dicker, true)
	GUI:setTag(Panel_dicker, 174)
	GUI:setVisible(Panel_dicker, false)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Panel_dicker, "ImageView", 151.00, 148.00, "res/private/trading_bank/dicker/frame.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(Panel_dicker, "ImageView_1", 161.00, 353.00, "res/private/trading_bank/dicker/tips.png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create Button
	local Button = GUI:Button_Create(Panel_dicker, "Button", 210.00, 172.00, "res/private/trading_bank/dicker/button3.png")
	GUI:Button_loadTexturePressed(Button, "res/private/trading_bank/dicker/button4.png")
	GUI:Button_loadTextureDisabled(Button, "res/private/trading_bank/dicker/button4.png")
	GUI:Button_setTitleText(Button, "")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_dicker, "Button_1", 380.00, 172.00, "res/private/trading_bank/dicker/button1.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/trading_bank/dicker/button2.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/trading_bank/dicker/button2.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Text
	local Text = GUI:Text_Create(Panel_dicker, "Text", 182.00, 309.00, 18, "#fefeff", [[本文本文本本文本文本文本文本文本文本文本]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_dicker, "Text_1", 177.00, 220.00, 18, "#f8e6c6", [[还价最低价格（元）]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create ImageView_2
	local ImageView_2 = GUI:Image_Create(Panel_dicker, "ImageView_2", 339.00, 217.00, "res/private/trading_bank/dicker/price_frame.png")
	GUI:setTouchEnabled(ImageView_2, false)
	GUI:setTag(ImageView_2, -1)

	-- Create Input
	local Input = GUI:TextInput_Create(ImageView_2, "Input", 0.00, 3.00, 200.00, 25.00, 18)
	GUI:TextInput_setString(Input, "")
	GUI:TextInput_setPlaceHolder(Input, "推荐元")
	GUI:TextInput_setFontColor(Input, "#ffffff")
	GUI:setTouchEnabled(Input, true)
	GUI:setTag(Input, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Panel_dicker, "Button_2", 571.00, 358.00, "res/private/trading_bank/1900000510.png")
	GUI:Button_loadTexturePressed(Button_2, "res/private/trading_bank/1900000511.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/trading_bank/1900000511.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 0)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)
end
return ui