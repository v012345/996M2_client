local ui = {}
function ui.init(parent)
	-- Create Scene
	local Scene = GUI:Node_Create(parent, "Scene", -651.00, -3.00)
	GUI:setChineseName(Scene, "玩家面板场景")
	GUI:setAnchorPoint(Scene, 0.50, 0.50)
	GUI:setTag(Scene, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Scene, "Panel_1", 654.00, 380.00, 912.00, 542.00, false)
	GUI:setChineseName(Panel_1, "玩家面板_组合")
	GUI:setAnchorPoint(Panel_1, 0.00, 0.50)
	GUI:setTouchEnabled(Panel_1, false)
	GUI:setTag(Panel_1, 125)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 464.00, 269.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015000.png")
	GUI:setChineseName(Image_bg, "玩家面板_背景图")
	GUI:setAnchorPoint(Image_bg, 0.50, 0.50)
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 131)

	-- Create Text_Name
	local Text_Name = GUI:Text_Create(Panel_1, "Text_Name", 432.00, 444.00, 18, "#ffe400", [[]])
	GUI:setChineseName(Text_Name, "玩家面板_玩家昵称_文本")
	GUI:setAnchorPoint(Text_Name, 0.50, 0.50)
	GUI:setTouchEnabled(Text_Name, false)
	GUI:setTag(Text_Name, 132)
	GUI:Text_enableOutline(Text_Name, "#0e0e0e", 1)

	-- Create ButtonClose
	local ButtonClose = GUI:Button_Create(Panel_1, "ButtonClose", 928.00, 476.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(ButtonClose, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(ButtonClose, "Default/Button_Disable.png")
	GUI:Button_setTitleText(ButtonClose, "")
	GUI:Button_setTitleColor(ButtonClose, "#414146")
	GUI:Button_setTitleFontSize(ButtonClose, 14)
	GUI:Button_titleDisableOutLine(ButtonClose)
	GUI:setChineseName(ButtonClose, "玩家面板_关闭按钮")
	GUI:setAnchorPoint(ButtonClose, 0.50, 0.50)
	GUI:setTouchEnabled(ButtonClose, true)
	GUI:setTag(ButtonClose, 133)

	-- Create Node_panel
	local Node_panel = GUI:Node_Create(Panel_1, "Node_panel", 300.00, 4.00)
	GUI:setChineseName(Node_panel, "玩家面板_节点")
	GUI:setAnchorPoint(Node_panel, 0.50, 0.50)
	GUI:setTag(Node_panel, 134)

	-- Create Panel_btnList
	local Panel_btnList = GUI:Layout_Create(Panel_1, "Panel_btnList", 128.00, 459.00, 112.00, 340.00, false)
	GUI:setChineseName(Panel_btnList, "玩家面板_侧边条组合")
	GUI:setAnchorPoint(Panel_btnList, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_btnList, false)
	GUI:setTag(Panel_btnList, 130)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_btnList, "Button_1", 0.00, 340.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setChineseName(Button_1, "玩家面板_装备_按钮")
	GUI:setAnchorPoint(Button_1, 0.00, 1.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_1, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name1.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Panel_btnList, "Button_2", 0.00, 254.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_2, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setChineseName(Button_2, "玩家面板_状态_按钮")
	GUI:setAnchorPoint(Button_2, 0.00, 1.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_2, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name3.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Panel_btnList, "Button_3", 0.00, 210.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_3, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_3, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleDisableOutLine(Button_3)
	GUI:setChineseName(Button_3, "玩家面板_属性_按钮")
	GUI:setAnchorPoint(Button_3, 0.00, 1.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)
	GUI:setVisible(Button_3, false)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_3, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name1.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Panel_btnList, "Button_4", 0.00, 210.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_4, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_4, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_4, "")
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 14)
	GUI:Button_titleDisableOutLine(Button_4)
	GUI:setChineseName(Button_4, "玩家面板_技能_按钮")
	GUI:setAnchorPoint(Button_4, 0.00, 1.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, -1)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_4, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name4.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Panel_btnList, "Button_6", 0.00, 166.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_6, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_6, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_6, "")
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 14)
	GUI:Button_titleDisableOutLine(Button_6)
	GUI:setChineseName(Button_6, "玩家面板_称号_按钮")
	GUI:setAnchorPoint(Button_6, 0.00, 1.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, -1)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_6, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name5.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Button_11
	local Button_11 = GUI:Button_Create(Panel_btnList, "Button_11", 0.00, 297.00, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015011.png")
	GUI:Button_loadTexturePressed(Button_11, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_loadTextureDisabled(Button_11, "res/private/player_main_layer_ui/player_main_layer_ui_win32/1900015010.png")
	GUI:Button_setTitleText(Button_11, "")
	GUI:Button_setTitleColor(Button_11, "#ffffff")
	GUI:Button_setTitleFontSize(Button_11, 14)
	GUI:Button_titleDisableOutLine(Button_11)
	GUI:setChineseName(Button_11, "玩家面板_时装_按钮")
	GUI:setAnchorPoint(Button_11, 0.00, 1.00)
	GUI:setTouchEnabled(Button_11, true)
	GUI:setTag(Button_11, -1)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_11, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name2.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Panel_btnList_left
	local Panel_btnList_left = GUI:Layout_Create(Panel_1, "Panel_btnList_left", 128.00, 459.00, 112.00, 340.00, false)
	GUI:setChineseName(Panel_btnList_left, "玩家面板_左侧侧边条组合")
	GUI:setAnchorPoint(Panel_btnList_left, 0.00, 1.00)
	GUI:setTouchEnabled(Panel_btnList_left, false)
	GUI:setTag(Panel_btnList_left, 130)

	-- Create Button_20
	local Button_20 = GUI:Button_Create(Panel_btnList_left, "Button_20", 0.00, 340.00, "res/public_win32/1900000683_1_f.png")
	GUI:Button_loadTexturePressed(Button_20, "res/public_win32/1900000683_f.png")
	GUI:Button_loadTextureDisabled(Button_20, "res/public_win32/1900000683_f.png")
	GUI:Button_setTitleText(Button_20, "")
	GUI:Button_setTitleColor(Button_20, "#ffffff")
	GUI:Button_setTitleFontSize(Button_20, 14)
	GUI:Button_titleEnableOutline(Button_20, "#000000", 1)
	GUI:setChineseName(Button_20, "玩家面板_buff_按钮")
	GUI:setAnchorPoint(Button_20, 0.00, 1.00)
	GUI:setTouchEnabled(Button_20, true)
	GUI:setTag(Button_20, -1)
	GUI:setVisible(Button_20, false)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Button_20, "Image_name", 28.00, 4.00, "res/private/player_main_layer_ui/name1.png")
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, -1)

	-- Create Node_attr
	local Node_attr = GUI:Node_Create(Panel_1, "Node_attr", 626.00, 28.00)
	GUI:setAnchorPoint(Node_attr, 0.50, 0.50)
	GUI:setTag(Node_attr, 134)

	-- Create Image_Title
	local Image_Title = GUI:Image_Create(Panel_1, "Image_Title", 242.00, 470.00, "res/private/player_main_layer_ui/title1.png")
	GUI:setTouchEnabled(Image_Title, false)
	GUI:setTag(Image_Title, -1)

	-- Create Button_qiYun
	local Button_qiYun = GUI:Button_Create(Panel_1, "Button_qiYun", 662.00, 397.00, "res/private/player_main_layer_ui/icon1.png")
	GUI:Button_setTitleText(Button_qiYun, "")
	GUI:Button_setTitleColor(Button_qiYun, "#ffffff")
	GUI:Button_setTitleFontSize(Button_qiYun, 0)
	GUI:Button_titleEnableOutline(Button_qiYun, "#000000", 1)
	GUI:setChineseName(Button_qiYun, "按钮_气运")
	GUI:setTouchEnabled(Button_qiYun, true)
	GUI:setTag(Button_qiYun, -1)

	-- Create Button_xiuXian
	local Button_xiuXian = GUI:Button_Create(Panel_1, "Button_xiuXian", 734.00, 397.00, "res/private/player_main_layer_ui/icon2.png")
	GUI:Button_setTitleText(Button_xiuXian, "")
	GUI:Button_setTitleColor(Button_xiuXian, "#ffffff")
	GUI:Button_setTitleFontSize(Button_xiuXian, 0)
	GUI:Button_titleEnableOutline(Button_xiuXian, "#000000", 1)
	GUI:setChineseName(Button_xiuXian, "按钮_修仙")
	GUI:setTouchEnabled(Button_xiuXian, true)
	GUI:setTag(Button_xiuXian, -1)

	-- Create Button_zhuangBan
	local Button_zhuangBan = GUI:Button_Create(Panel_1, "Button_zhuangBan", 807.00, 397.00, "res/private/player_main_layer_ui/icon3.png")
	GUI:Button_setTitleText(Button_zhuangBan, "")
	GUI:Button_setTitleColor(Button_zhuangBan, "#ffffff")
	GUI:Button_setTitleFontSize(Button_zhuangBan, 0)
	GUI:Button_titleEnableOutline(Button_zhuangBan, "#000000", 1)
	GUI:setChineseName(Button_zhuangBan, "按钮_装扮")
	GUI:setTouchEnabled(Button_zhuangBan, true)
	GUI:setTag(Button_zhuangBan, -1)

	-- Create Button_HunZhuang
	local Button_HunZhuang = GUI:Button_Create(Panel_1, "Button_HunZhuang", 840.00, 398.00, "res/private/player_main_layer_ui/icon4.png")
	GUI:Button_setTitleText(Button_HunZhuang, "")
	GUI:Button_setTitleColor(Button_HunZhuang, "#ffffff")
	GUI:Button_setTitleFontSize(Button_HunZhuang, 14)
	GUI:Button_titleEnableOutline(Button_HunZhuang, "#000000", 1)
	GUI:setTouchEnabled(Button_HunZhuang, true)
	GUI:setTag(Button_HunZhuang, -1)
	GUI:setVisible(Button_HunZhuang, false)
end
return ui