local ui = {}
function ui.init(parent)
	-- Create Scene
	local Scene = GUI:Node_Create(parent, "Scene", 0.00, 0.00)
	GUI:setAnchorPoint(Scene, 0.50, 0.50)
	GUI:setTag(Scene, -1)

	-- Create Panel_cancel
	local Panel_cancel = GUI:Layout_Create(Scene, "Panel_cancel", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:setTouchEnabled(Panel_cancel, true)
	GUI:setTag(Panel_cancel, 465)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Scene, "Image_1", 568.00, 320.00, "res/private/trading_bank/img_phonebg.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, true)
	GUI:setTag(Image_1, 466)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Image_1, "Panel_1", 274.00, 174.00, 522.00, 186.00, false)
	GUI:setAnchorPoint(Panel_1, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_1, false)
	GUI:setTag(Panel_1, 467)

	-- Create Text_title
	local Text_title = GUI:Text_Create(Panel_1, "Text_title", 261.00, 179.00, 22, "#ffffff", [[是否下架该商品]])
	GUI:setAnchorPoint(Text_title, 0.50, 1.00)
	GUI:setTouchEnabled(Text_title, false)
	GUI:setTag(Text_title, 468)
	GUI:Text_enableOutline(Text_title, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(Panel_1, "ListView_1", 18.00, 156.00, 484.00, 174.00, 1)
	GUI:ListView_setGravity(ListView_1, 5)
	GUI:setAnchorPoint(ListView_1, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 73)

	-- Create Text_txt
	local Text_txt = GUI:Text_Create(Panel_1, "Text_txt", 260.00, 161.00, 18, "#ffffff", [[是否下架该商品]])
	GUI:setAnchorPoint(Text_txt, 0.50, 1.00)
	GUI:setTouchEnabled(Text_txt, false)
	GUI:setTag(Text_txt, 469)
	GUI:Text_enableOutline(Text_txt, "#000000", 1)

	-- Create Text_time
	local Text_time = GUI:Text_Create(Panel_1, "Text_time", 249.00, 28.00, 28, "#ff0000", [[3S]])
	GUI:setAnchorPoint(Text_time, 0.50, 0.50)
	GUI:setTouchEnabled(Text_time, false)
	GUI:setTag(Text_time, 470)
	GUI:Text_enableOutline(Text_time, "#000000", 1)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Image_1, "Panel_2", 273.00, 173.00, 522.00, 186.00, false)
	GUI:setAnchorPoint(Panel_2, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_2, false)
	GUI:setTag(Panel_2, 471)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_2, "Text_1", 64.00, 157.00, 24, "#ffffff", [[新价格:]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 472)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Panel_2, "Text_2", 64.00, 29.00, 24, "#ffffff", [[当前价格：]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.50)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 473)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Panel_2, "Image_2", 282.00, 158.00, "res/private/trading_bank/word_jiaoyh_022.png")
	GUI:Image_setScale9Slice(Image_2, 8, 8, 10, 10)
	GUI:setContentSize(Image_2, 220, 32)
	GUI:setIgnoreContentAdaptWithSize(Image_2, false)
	GUI:setAnchorPoint(Image_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 474)

	-- Create TextField_4
	local TextField_4 = GUI:TextInput_Create(Image_2, "TextField_4", 110.00, 16.00, 220.00, 32.00, 20)
	GUI:TextInput_setString(TextField_4, "")
	GUI:TextInput_setFontColor(TextField_4, "#ffffff")
	GUI:TextInput_setMaxLength(TextField_4, 10)
	GUI:setAnchorPoint(TextField_4, 0.50, 0.50)
	GUI:setTouchEnabled(TextField_4, true)
	GUI:setTag(TextField_4, 475)

	-- Create Text_bargain_role
	local Text_bargain_role = GUI:Text_Create(Panel_2, "Text_bargain_role", 66.00, 100.00, 19, "#f8e6c6", [[买家是否可以还价:]])
	GUI:setTouchEnabled(Text_bargain_role, false)
	GUI:setTag(Text_bargain_role, -1)
	GUI:Text_enableOutline(Text_bargain_role, "#000000", 1)

	-- Create Panel_bargain_role
	local Panel_bargain_role = GUI:Layout_Create(Panel_2, "Panel_bargain_role", 233.00, 98.00, 150.00, 30.00, false)
	GUI:setTouchEnabled(Panel_bargain_role, true)
	GUI:setTag(Panel_bargain_role, -1)

	-- Create Text
	local Text = GUI:Text_Create(Panel_bargain_role, "Text", 114.00, 3.00, 20, "#f8e6c6", [[否]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_bargain_role, "Text_1", 42.00, 3.00, 20, "#f8e6c6", [[是]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create CheckBox_true
	local CheckBox_true = GUI:CheckBox_Create(Panel_bargain_role, "CheckBox_true", 24.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_true, false)
	GUI:setAnchorPoint(CheckBox_true, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_true, true)
	GUI:setTag(CheckBox_true, 175)

	-- Create CheckBox_false
	local CheckBox_false = GUI:CheckBox_Create(Panel_bargain_role, "CheckBox_false", 94.00, 14.00, "res/private/trading_bank/word_jiaoyh_022.png", "res/private/trading_bank/word_jiaoyh_021.png")
	GUI:CheckBox_setSelected(CheckBox_false, false)
	GUI:setAnchorPoint(CheckBox_false, 0.50, 0.50)
	GUI:setTouchEnabled(CheckBox_false, true)
	GUI:setTag(CheckBox_false, 175)

	-- Create dickerButton
	local dickerButton = GUI:Button_Create(Panel_2, "dickerButton", 65.00, 64.00, "res/private/trading_bank/dicker/button.png")
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
	local Text = GUI:Text_Create(dickerButton, "Text", 0.00, 16.00, 19, "#00ff00", [[开启还价省心模式>>]])
	GUI:setAnchorPoint(Text, 0.00, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(dickerButton, "Text_1", 0.00, 16.00, 19, "#00ff00", [[开启还价省心模式>>    已开启]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.50)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:setVisible(Text_1, false)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(dickerButton, "Text_2", 0.00, -9.00, 19, "#f8e6c6", [[超过30元的还价，自动同意。]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.50)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, -1)
	GUI:setVisible(Text_2, false)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Image_1, "Button_2", 378.00, 43.00, "res/private/trading_bank/btn_jiaoyh_01.png")
	GUI:Button_loadTexturePressed(Button_2, "res/private/trading_bank/btn_jiaoyh_02.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/trading_bank/btn_jiaoyh_01.png")
	GUI:Button_setScale9Slice(Button_2, 15, 15, 12, 10)
	GUI:setContentSize(Button_2, 91, 33)
	GUI:setIgnoreContentAdaptWithSize(Button_2, false)
	GUI:Button_setTitleText(Button_2, "确定")
	GUI:Button_setTitleColor(Button_2, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_2, 20)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 476)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Image_1, "Button_1", 160.00, 43.00, "res/private/trading_bank/btn_jiaoyh_01.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/trading_bank/btn_jiaoyh_02.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/trading_bank/btn_jiaoyh_01.png")
	GUI:Button_setScale9Slice(Button_1, 15, 15, 12, 10)
	GUI:setContentSize(Button_1, 91, 33)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, "取消")
	GUI:Button_setTitleColor(Button_1, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_1, 20)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 477)

	-- Create Panel_dicker
	local Panel_dicker = GUI:Layout_Create(Scene, "Panel_dicker", 565.00, 342.00, 732.00, 445.00, false)
	GUI:setAnchorPoint(Panel_dicker, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_dicker, false)
	GUI:setTag(Panel_dicker, 174)
	GUI:setVisible(Panel_dicker, false)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Panel_dicker, "ImageView", 151.00, 73.00, "res/private/trading_bank/dicker/frame.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(Panel_dicker, "ImageView_1", 161.00, 278.00, "res/private/trading_bank/dicker/tips.png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create Button
	local Button = GUI:Button_Create(Panel_dicker, "Button", 210.00, 97.00, "res/private/trading_bank/dicker/button3.png")
	GUI:Button_loadTexturePressed(Button, "res/private/trading_bank/dicker/button4.png")
	GUI:Button_loadTextureDisabled(Button, "res/private/trading_bank/dicker/button4.png")
	GUI:Button_setTitleText(Button, "")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_dicker, "Button_1", 380.00, 97.00, "res/private/trading_bank/dicker/button1.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/trading_bank/dicker/button2.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/trading_bank/dicker/button2.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Text
	local Text = GUI:Text_Create(Panel_dicker, "Text", 182.00, 234.00, 18, "#fefeff", [[本文本文本本文本文本文本文本文本文本文本]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_dicker, "Text_1", 177.00, 145.00, 18, "#f8e6c6", [[还价最低价格（元）]])
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create ImageView_2
	local ImageView_2 = GUI:Image_Create(Panel_dicker, "ImageView_2", 339.00, 142.00, "res/private/trading_bank/dicker/price_frame.png")
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
	local Button_2 = GUI:Button_Create(Panel_dicker, "Button_2", 571.00, 283.00, "res/private/trading_bank/1900000510.png")
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