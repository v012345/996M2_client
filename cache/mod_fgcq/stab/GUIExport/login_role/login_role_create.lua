local ui = {}
function ui.init(parent)
	-- Create Panel_role
	local Panel_role = GUI:Layout_Create(parent, "Panel_role", 568.00, 320.00, 1136.00, 640.00, false)
	GUI:setChineseName(Panel_role, "创建角色面板")
	GUI:setAnchorPoint(Panel_role, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_role, false)
	GUI:setTag(Panel_role, -1)

	-- Create Panel_anim
	local Panel_anim = GUI:Layout_Create(Panel_role, "Panel_anim", 568.00, 595.00, 350.00, 400.00, false)
	GUI:setChineseName(Panel_anim, "创建角色_模型展示")
	GUI:setAnchorPoint(Panel_anim, 1.00, 1.00)
	GUI:setTouchEnabled(Panel_anim, false)
	GUI:setTag(Panel_anim, -1)

	-- Create Node_anim
	local Node_anim = GUI:Node_Create(Panel_anim, "Node_anim", 175.00, 0.00)
	GUI:setChineseName(Node_anim, "创建角色_模型节点")
	GUI:setTag(Node_anim, -1)

	-- Create Panel_info
	local Panel_info = GUI:Layout_Create(Panel_role, "Panel_info", 568.00, 595.00, 350.00, 420.00, false)
	GUI:setChineseName(Panel_info, "创建角色_详情组合")
	GUI:setAnchorPoint(Panel_info, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_info, false)
	GUI:setTag(Panel_info, -1)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Panel_info, "Image_2", 175.00, 210.00, "res/private/login/bg_cjzy_06.png")
	GUI:setChineseName(Image_2, "创建角色_背景图")
	GUI:setAnchorPoint(Image_2, 0.50, 0.50)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, -1)

	-- Create Button_close
	local Button_close = GUI:Button_Create(Panel_info, "Button_close", 286.00, 387.00, "res/public/btn_normal_2.png")
	GUI:Button_loadTexturePressed(Button_close, "res/public/btn_pressed_2.png")
	GUI:Button_setTitleText(Button_close, "")
	GUI:Button_setTitleColor(Button_close, "#ffffff")
	GUI:Button_setTitleFontSize(Button_close, 10)
	GUI:Button_titleEnableOutline(Button_close, "#000000", 1)
	GUI:setChineseName(Button_close, "创建角色_关闭按钮")
	GUI:setAnchorPoint(Button_close, 0.50, 0.50)
	GUI:setTouchEnabled(Button_close, true)
	GUI:setTag(Button_close, -1)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Panel_info, "Image_7", 157.00, 350.00, "res/private/login/word_cjzy_01.png")
	GUI:setChineseName(Image_7, "创建角色_姓名文字_图片")
	GUI:setAnchorPoint(Image_7, 0.50, 0.50)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, -1)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Panel_info, "Image_8", 157.00, 310.00, "res/private/login/bg_cjzy_00.png")
	GUI:setChineseName(Image_8, "创建角色_取名_背景框")
	GUI:setAnchorPoint(Image_8, 0.50, 0.50)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, -1)

	-- Create TextInput_name
	local TextInput_name = GUI:TextInput_Create(Panel_info, "TextInput_name", 149.00, 310.00, 140.00, 28.00, 20)
	GUI:TextInput_setString(TextInput_name, "玩家名字")
	GUI:TextInput_setFontColor(TextInput_name, "#ffffff")
	GUI:TextInput_setMaxLength(TextInput_name, 7)
	GUI:setChineseName(TextInput_name, "创建角色_昵称输入")
	GUI:setAnchorPoint(TextInput_name, 0.50, 0.50)
	GUI:setTouchEnabled(TextInput_name, true)
	GUI:setTag(TextInput_name, -1)

	-- Create Button_rand
	local Button_rand = GUI:Button_Create(Panel_info, "Button_rand", 244.00, 311.00, "res/private/login/btn_cjzy_03.png")
	GUI:Button_loadTexturePressed(Button_rand, "res/private/login/btn_cjzy_03_1.png")
	GUI:Button_setTitleText(Button_rand, "")
	GUI:Button_setTitleColor(Button_rand, "#ffffff")
	GUI:Button_setTitleFontSize(Button_rand, 10)
	GUI:Button_titleEnableOutline(Button_rand, "#000000", 1)
	GUI:setChineseName(Button_rand, "创建角色_筛子_按钮")
	GUI:setAnchorPoint(Button_rand, 0.50, 0.50)
	GUI:setTouchEnabled(Button_rand, true)
	GUI:setTag(Button_rand, -1)

	-- Create Image_7_0
	local Image_7_0 = GUI:Image_Create(Panel_info, "Image_7_0", 157.00, 255.00, "res/private/login/word_cjzy_02.png")
	GUI:setChineseName(Image_7_0, "创建角色_职业文字_图片")
	GUI:setAnchorPoint(Image_7_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_7_0, false)
	GUI:setTag(Image_7_0, -1)

	-- Create Button_job_1
	local Button_job_1 = GUI:Button_Create(Panel_info, "Button_job_1", 90.00, 210.00, "res/private/login/icon_cjzy_01.png")
	GUI:Button_loadTextureDisabled(Button_job_1, "res/private/login/icon_cjzy_01_1.png")
	GUI:Button_setTitleText(Button_job_1, "")
	GUI:Button_setTitleColor(Button_job_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_1, 10)
	GUI:Button_titleEnableOutline(Button_job_1, "#000000", 1)
	GUI:setChineseName(Button_job_1, "创建角色_职业_战士_按钮")
	GUI:setAnchorPoint(Button_job_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_1, true)
	GUI:setTag(Button_job_1, -1)

	-- Create Button_job_2
	local Button_job_2 = GUI:Button_Create(Panel_info, "Button_job_2", 136.00, 210.00, "res/private/login/icon_cjzy_02.png")
	GUI:Button_loadTextureDisabled(Button_job_2, "res/private/login/icon_cjzy_02_1.png")
	GUI:Button_setTitleText(Button_job_2, "")
	GUI:Button_setTitleColor(Button_job_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_2, 10)
	GUI:Button_titleEnableOutline(Button_job_2, "#000000", 1)
	GUI:setChineseName(Button_job_2, "创建角色_职业_法师_按钮")
	GUI:setAnchorPoint(Button_job_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_2, true)
	GUI:setTag(Button_job_2, -1)

	-- Create Button_job_3
	local Button_job_3 = GUI:Button_Create(Panel_info, "Button_job_3", 182.00, 210.00, "res/private/login/icon_cjzy_03.png")
	GUI:Button_loadTextureDisabled(Button_job_3, "res/private/login/icon_cjzy_03_1.png")
	GUI:Button_setTitleText(Button_job_3, "")
	GUI:Button_setTitleColor(Button_job_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_3, 10)
	GUI:Button_titleEnableOutline(Button_job_3, "#000000", 1)
	GUI:setChineseName(Button_job_3, "创建角色_职业_道士_按钮")
	GUI:setAnchorPoint(Button_job_3, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_3, true)
	GUI:setTag(Button_job_3, -1)

	-- Create Button_job_r
	local Button_job_r = GUI:Button_Create(Panel_info, "Button_job_r", 229.00, 210.00, "res/private/login/icon_cjzy_04.png")
	GUI:Button_loadTexturePressed(Button_job_r, "res/private/login/icon_cjzy_04.png")
	GUI:Button_setTitleText(Button_job_r, "")
	GUI:Button_setTitleColor(Button_job_r, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_r, 10)
	GUI:Button_titleEnableOutline(Button_job_r, "#000000", 1)
	GUI:setChineseName(Button_job_r, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_r, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_r, true)
	GUI:setTag(Button_job_r, -1)

	-- Create Button_job_4
	local Button_job_4 = GUI:Button_Create(Panel_info, "Button_job_4", 229.00, 210.00, "res/private/login/icon_cjzy_07.png")
	GUI:Button_loadTextureDisabled(Button_job_4, "res/private/login/icon_cjzy_07_1.png")
	GUI:Button_setTitleText(Button_job_4, "")
	GUI:Button_setTitleColor(Button_job_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_4, 10)
	GUI:Button_titleEnableOutline(Button_job_4, "#000000", 1)
	GUI:setChineseName(Button_job_4, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_4, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_4, true)
	GUI:setTag(Button_job_4, -1)
	GUI:setVisible(Button_job_4, false)

	-- Create Button_job_5
	local Button_job_5 = GUI:Button_Create(Panel_info, "Button_job_5", 275.00, 210.00, "res/private/login/icon_zdyzy_05.png")
	GUI:Button_loadTextureDisabled(Button_job_5, "res/private/login/icon_cjzy_05_1.png")
	GUI:Button_setTitleText(Button_job_5, "")
	GUI:Button_setTitleColor(Button_job_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_5, 10)
	GUI:Button_titleEnableOutline(Button_job_5, "#000000", 1)
	GUI:setChineseName(Button_job_5, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_5, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_5, true)
	GUI:setTag(Button_job_5, -1)
	GUI:setVisible(Button_job_5, false)

	-- Create Button_job_6
	local Button_job_6 = GUI:Button_Create(Panel_info, "Button_job_6", 281.00, 210.00, "res/private/login/icon_zdyzy_06.png")
	GUI:Button_loadTextureDisabled(Button_job_6, "res/private/login/icon_zdyzy_06_1.png")
	GUI:Button_setTitleText(Button_job_6, "")
	GUI:Button_setTitleColor(Button_job_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_6, 10)
	GUI:Button_titleEnableOutline(Button_job_6, "#000000", 1)
	GUI:setChineseName(Button_job_6, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_6, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_6, true)
	GUI:setTag(Button_job_6, -1)
	GUI:setVisible(Button_job_6, false)

	-- Create Button_job_7
	local Button_job_7 = GUI:Button_Create(Panel_info, "Button_job_7", 288.00, 210.00, "res/private/login/icon_zdyzy_07.png")
	GUI:Button_loadTextureDisabled(Button_job_7, "res/private/login/icon_zdyzy_07_1.png")
	GUI:Button_setTitleText(Button_job_7, "")
	GUI:Button_setTitleColor(Button_job_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_7, 10)
	GUI:Button_titleEnableOutline(Button_job_7, "#000000", 1)
	GUI:setChineseName(Button_job_7, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_7, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_7, true)
	GUI:setTag(Button_job_7, -1)
	GUI:setVisible(Button_job_7, false)

	-- Create Button_job_8
	local Button_job_8 = GUI:Button_Create(Panel_info, "Button_job_8", 295.00, 210.00, "res/private/login/icon_zdyzy_08.png")
	GUI:Button_loadTextureDisabled(Button_job_8, "res/private/login/icon_zdyzy_08_1.png")
	GUI:Button_setTitleText(Button_job_8, "")
	GUI:Button_setTitleColor(Button_job_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_8, 10)
	GUI:Button_titleEnableOutline(Button_job_8, "#000000", 1)
	GUI:setChineseName(Button_job_8, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_8, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_8, true)
	GUI:setTag(Button_job_8, -1)
	GUI:setVisible(Button_job_8, false)

	-- Create Button_job_9
	local Button_job_9 = GUI:Button_Create(Panel_info, "Button_job_9", 301.00, 210.00, "res/private/login/icon_zdyzy_09.png")
	GUI:Button_loadTextureDisabled(Button_job_9, "res/private/login/icon_zdyzy_09_1.png")
	GUI:Button_setTitleText(Button_job_9, "")
	GUI:Button_setTitleColor(Button_job_9, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_9, 10)
	GUI:Button_titleEnableOutline(Button_job_9, "#000000", 1)
	GUI:setChineseName(Button_job_9, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_9, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_9, true)
	GUI:setTag(Button_job_9, -1)
	GUI:setVisible(Button_job_9, false)

	-- Create Button_job_10
	local Button_job_10 = GUI:Button_Create(Panel_info, "Button_job_10", 275.00, 170.00, "res/private/login/icon_zdyzy_10.png")
	GUI:Button_loadTextureDisabled(Button_job_10, "res/private/login/icon_zdyzy_10_1.png")
	GUI:Button_setTitleText(Button_job_10, "")
	GUI:Button_setTitleColor(Button_job_10, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_10, 10)
	GUI:Button_titleEnableOutline(Button_job_10, "#000000", 1)
	GUI:setChineseName(Button_job_10, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_10, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_10, true)
	GUI:setTag(Button_job_10, -1)
	GUI:setVisible(Button_job_10, false)

	-- Create Button_job_11
	local Button_job_11 = GUI:Button_Create(Panel_info, "Button_job_11", 281.00, 170.00, "res/private/login/icon_zdyzy_11.png")
	GUI:Button_loadTextureDisabled(Button_job_11, "res/private/login/icon_zdyzy_11_1.png")
	GUI:Button_setTitleText(Button_job_11, "")
	GUI:Button_setTitleColor(Button_job_11, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_11, 10)
	GUI:Button_titleEnableOutline(Button_job_11, "#000000", 1)
	GUI:setChineseName(Button_job_11, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_11, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_11, true)
	GUI:setTag(Button_job_11, -1)
	GUI:setVisible(Button_job_11, false)

	-- Create Button_job_12
	local Button_job_12 = GUI:Button_Create(Panel_info, "Button_job_12", 287.00, 170.00, "res/private/login/icon_zdyzy_12.png")
	GUI:Button_loadTextureDisabled(Button_job_12, "res/private/login/icon_zdyzy_12_1.png")
	GUI:Button_setTitleText(Button_job_12, "")
	GUI:Button_setTitleColor(Button_job_12, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_12, 10)
	GUI:Button_titleEnableOutline(Button_job_12, "#000000", 1)
	GUI:setChineseName(Button_job_12, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_12, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_12, true)
	GUI:setTag(Button_job_12, -1)
	GUI:setVisible(Button_job_12, false)

	-- Create Button_job_13
	local Button_job_13 = GUI:Button_Create(Panel_info, "Button_job_13", 294.00, 170.00, "res/private/login/icon_zdyzy_13.png")
	GUI:Button_loadTextureDisabled(Button_job_13, "res/private/login/icon_zdyzy_13_1.png")
	GUI:Button_setTitleText(Button_job_13, "")
	GUI:Button_setTitleColor(Button_job_13, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_13, 10)
	GUI:Button_titleEnableOutline(Button_job_13, "#000000", 1)
	GUI:setChineseName(Button_job_13, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_13, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_13, true)
	GUI:setTag(Button_job_13, -1)
	GUI:setVisible(Button_job_13, false)

	-- Create Button_job_14
	local Button_job_14 = GUI:Button_Create(Panel_info, "Button_job_14", 300.00, 170.00, "res/private/login/icon_zdyzy_14.png")
	GUI:Button_loadTextureDisabled(Button_job_14, "res/private/login/icon_zdyzy_14_1.png")
	GUI:Button_setTitleText(Button_job_14, "")
	GUI:Button_setTitleColor(Button_job_14, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_14, 10)
	GUI:Button_titleEnableOutline(Button_job_14, "#000000", 1)
	GUI:setChineseName(Button_job_14, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_14, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_14, true)
	GUI:setTag(Button_job_14, -1)
	GUI:setVisible(Button_job_14, false)

	-- Create Button_job_15
	local Button_job_15 = GUI:Button_Create(Panel_info, "Button_job_15", 306.00, 170.00, "res/private/login/icon_zdyzy_15.png")
	GUI:Button_loadTextureDisabled(Button_job_15, "res/private/login/icon_zdyzy_15_1.png")
	GUI:Button_setTitleText(Button_job_15, "")
	GUI:Button_setTitleColor(Button_job_15, "#ffffff")
	GUI:Button_setTitleFontSize(Button_job_15, 10)
	GUI:Button_titleEnableOutline(Button_job_15, "#000000", 1)
	GUI:setChineseName(Button_job_15, "创建角色_职业_待定_按钮")
	GUI:setAnchorPoint(Button_job_15, 0.50, 0.50)
	GUI:setTouchEnabled(Button_job_15, true)
	GUI:setTag(Button_job_15, -1)
	GUI:setVisible(Button_job_15, false)

	-- Create Image_7_0_0
	local Image_7_0_0 = GUI:Image_Create(Panel_info, "Image_7_0_0", 157.00, 150.00, "res/private/login/word_cjzy_03.png")
	GUI:setChineseName(Image_7_0_0, "创建角色_性别文字_图片")
	GUI:setAnchorPoint(Image_7_0_0, 0.50, 0.50)
	GUI:setTouchEnabled(Image_7_0_0, false)
	GUI:setTag(Image_7_0_0, -1)

	-- Create Button_sex_1
	local Button_sex_1 = GUI:Button_Create(Panel_info, "Button_sex_1", 136.00, 105.00, "res/private/login/icon_cjzy_06.png")
	GUI:Button_loadTextureDisabled(Button_sex_1, "res/private/login/icon_cjzy_06_1.png")
	GUI:Button_setTitleText(Button_sex_1, "")
	GUI:Button_setTitleColor(Button_sex_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_sex_1, 10)
	GUI:Button_titleEnableOutline(Button_sex_1, "#000000", 1)
	GUI:setChineseName(Button_sex_1, "创建角色_性别_男_按钮")
	GUI:setAnchorPoint(Button_sex_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_sex_1, true)
	GUI:setTag(Button_sex_1, -1)

	-- Create Button_sex_2
	local Button_sex_2 = GUI:Button_Create(Panel_info, "Button_sex_2", 182.00, 105.00, "res/private/login/icon_cjzy_05.png")
	GUI:Button_loadTextureDisabled(Button_sex_2, "res/private/login/icon_cjzy_05_1.png")
	GUI:Button_setTitleText(Button_sex_2, "")
	GUI:Button_setTitleColor(Button_sex_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_sex_2, 10)
	GUI:Button_titleEnableOutline(Button_sex_2, "#000000", 1)
	GUI:setChineseName(Button_sex_2, "创建角色_性别_女_按钮")
	GUI:setAnchorPoint(Button_sex_2, 0.50, 0.50)
	GUI:setTouchEnabled(Button_sex_2, true)
	GUI:setTag(Button_sex_2, -1)

	-- Create Button_submit
	local Button_submit = GUI:Button_Create(Panel_info, "Button_submit", 157.00, 45.00, "res/private/login/btn_fhyx_01.png")
	GUI:Button_loadTexturePressed(Button_submit, "res/private/login/btn_fhyx_01_1.png")
	GUI:Button_setTitleText(Button_submit, "提 交")
	GUI:Button_setTitleColor(Button_submit, "#ffffff")
	GUI:Button_setTitleFontSize(Button_submit, 14)
	GUI:Button_titleEnableOutline(Button_submit, "#000000", 1)
	GUI:setChineseName(Button_submit, "创建角色_提交_按钮")
	GUI:setAnchorPoint(Button_submit, 0.50, 0.50)
	GUI:setTouchEnabled(Button_submit, true)
	GUI:setTag(Button_submit, -1)
end
return ui