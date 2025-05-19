local ui = {}
function ui.init(parent)
	-- Create Scene
	local Scene = GUI:Node_Create(parent, "Scene", 0.00, 0.00)
	GUI:setChineseName(Scene, "排行榜场景")
	GUI:setAnchorPoint(Scene, 0.50, 0.50)
	GUI:setTag(Scene, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(Scene, "CloseLayout", 0.00, 0.00, 1136.00, 640.00, false)
	GUI:Layout_setBackGroundColorType(CloseLayout, 1)
	GUI:Layout_setBackGroundColor(CloseLayout, "#000000")
	GUI:Layout_setBackGroundColorOpacity(CloseLayout, 76)
	GUI:setChineseName(CloseLayout, "排行榜_范围点击关闭")
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Scene, "Panel_1", 568.00, 320.00, 900.00, 536.00, false)
	GUI:setChineseName(Panel_1, "排行榜组合")
	GUI:setAnchorPoint(Panel_1, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 3)

	-- Create Panel_bg
	local Panel_bg = GUI:Layout_Create(Panel_1, "Panel_bg", 34.00, 268.00, 830.00, 536.00, false)
	GUI:setChineseName(Panel_bg, "排行榜_背景组合")
	GUI:setAnchorPoint(Panel_bg, 0.00, 0.50)
	GUI:setTouchEnabled(Panel_bg, true)
	GUI:setTag(Panel_bg, 11)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_bg, "Image_bg", 415.00, 272.00, "res/custom/Rank/background.png")
	GUI:Image_setScale9Slice(Image_bg, 301, 302, 176, 176)
	GUI:setContentSize(Image_bg, 904, 528)
	GUI:setIgnoreContentAdaptWithSize(Image_bg, false)
	GUI:setChineseName(Image_bg, "排行榜_背景图")
	GUI:setAnchorPoint(Image_bg, 0.50, 0.50)
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 5)

	-- Create Panel_type
	local Panel_type = GUI:Layout_Create(Panel_1, "Panel_type", 142.00, 448.00, 185.00, 45.00, false)
	GUI:setChineseName(Panel_type, "排行榜_玩家和英雄组合")
	GUI:setTouchEnabled(Panel_type, true)
	GUI:setTag(Panel_type, 36)

	-- Create Panel_player
	local Panel_player = GUI:Layout_Create(Panel_type, "Panel_player", 48.00, 19.00, 88.00, 33.00, false)
	GUI:setChineseName(Panel_player, "排行榜_玩家组合")
	GUI:setAnchorPoint(Panel_player, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_player, false)
	GUI:setTag(Panel_player, 37)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_player, "Button_1", 44.00, 16.00, "res/private/rank_ui/rank_ui_mobile/1900012110.png")
	GUI:Button_loadTexturePressed(Button_1, "res/private/rank_ui/rank_ui_mobile/1900012111.png")
	GUI:Button_loadTextureDisabled(Button_1, "res/private/rank_ui/rank_ui_mobile/1900012111.png")
	GUI:Button_setScale9Slice(Button_1, 16, 14, 11, 11)
	GUI:setContentSize(Button_1, 33, 88)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#414146")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleDisableOutLine(Button_1)
	GUI:setChineseName(Button_1, "排行榜_玩家_按钮")
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setRotation(Button_1, 90.00)
	GUI:setRotationSkewX(Button_1, 90.00)
	GUI:setRotationSkewY(Button_1, 90.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 38)

	-- Create Text_title1
	local Text_title1 = GUI:Text_Create(Panel_player, "Text_title1", 42.00, 26.00, 18, "#f8e6c6", [[玩家]])
	GUI:setChineseName(Text_title1, "排行榜_玩家_文本")
	GUI:setAnchorPoint(Text_title1, 0.50, 1.00)
	GUI:setTouchEnabled(Text_title1, false)
	GUI:setTag(Text_title1, 39)
	GUI:Text_enableOutline(Text_title1, "#111111", 2)

	-- Create Panel_hero
	local Panel_hero = GUI:Layout_Create(Panel_type, "Panel_hero", 137.00, 19.00, 88.00, 33.00, false)
	GUI:setChineseName(Panel_hero, "排行榜_英雄组合")
	GUI:setAnchorPoint(Panel_hero, 0.50, 0.50)
	GUI:setTouchEnabled(Panel_hero, false)
	GUI:setTag(Panel_hero, 43)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Panel_hero, "Button_2", 44.00, 16.00, "res/private/rank_ui/rank_ui_mobile/1900012110.png")
	GUI:Button_loadTexturePressed(Button_2, "res/private/rank_ui/rank_ui_mobile/1900012111.png")
	GUI:Button_loadTextureDisabled(Button_2, "res/private/rank_ui/rank_ui_mobile/1900012111.png")
	GUI:Button_setScale9Slice(Button_2, 16, 14, 11, 11)
	GUI:setContentSize(Button_2, 33, 88)
	GUI:setIgnoreContentAdaptWithSize(Button_2, false)
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#414146")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleDisableOutLine(Button_2)
	GUI:setChineseName(Button_2, "排行榜_英雄_按钮")
	GUI:setAnchorPoint(Button_2, 0.50, 0.50)
	GUI:setRotation(Button_2, 90.00)
	GUI:setRotationSkewX(Button_2, 90.00)
	GUI:setRotationSkewY(Button_2, 90.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 44)

	-- Create Text_title2
	local Text_title2 = GUI:Text_Create(Panel_hero, "Text_title2", 42.00, 26.00, 18, "#f8e6c6", [[英雄]])
	GUI:setChineseName(Text_title2, "排行榜_英雄_文本")
	GUI:setAnchorPoint(Text_title2, 0.50, 1.00)
	GUI:setTouchEnabled(Text_title2, false)
	GUI:setTag(Text_title2, 45)
	GUI:Text_enableOutline(Text_title2, "#111111", 2)

	-- Create Panel_btnList
	local Panel_btnList = GUI:Layout_Create(Panel_1, "Panel_btnList", 44.00, 54.00, 60.00, 370.00, false)
	GUI:setChineseName(Panel_btnList, "排行榜_排行分类组合")
	GUI:setTouchEnabled(Panel_btnList, true)
	GUI:setTag(Panel_btnList, 24)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(Panel_btnList, "ListView_1", 33.00, 368.00, 37.00, 370.00, 1)
	GUI:ListView_setGravity(ListView_1, 2)
	GUI:ListView_setItemsMargin(ListView_1, 5)
	GUI:setChineseName(ListView_1, "排行榜_排行分类_列表")
	GUI:setAnchorPoint(ListView_1, 0.50, 1.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 17)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Panel_1, "ImageView", 589.00, 97.00, "res/custom/Rank/z.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Image_13
	local Image_13 = GUI:Image_Create(Panel_1, "Image_13", 445.00, 509.00, "res/custom/Rank/title.png")
	GUI:setChineseName(Image_13, "排行榜_标题_图片")
	GUI:setAnchorPoint(Image_13, 0.50, 0.50)
	GUI:setTouchEnabled(Image_13, false)
	GUI:setTag(Image_13, 53)

	-- Create ListView_list
	local ListView_list = GUI:ListView_Create(Panel_1, "ListView_list", 84.00, 105.00, 560.00, 320.00, 1)
	GUI:ListView_setGravity(ListView_list, 5)
	GUI:setChineseName(ListView_list, "排行榜_排行详细_列表")
	GUI:setTouchEnabled(ListView_list, true)
	GUI:setTag(ListView_list, 57)

	-- Create Node_model
	local Node_model = GUI:Node_Create(Panel_1, "Node_model", 687.00, 261.00)
	GUI:setChineseName(Node_model, "排行榜_模型_节点")
	GUI:setAnchorPoint(Node_model, 0.50, 0.50)
	GUI:setTag(Node_model, 58)

	-- Create Button_looks
	local Button_looks = GUI:Button_Create(Panel_1, "Button_looks", 691.00, 126.00, "res/custom/Rank/btn_lock.png")
	GUI:Button_setScale9Slice(Button_looks, 40, 40, 17, 16)
	GUI:setContentSize(Button_looks, 120, 50)
	GUI:setIgnoreContentAdaptWithSize(Button_looks, false)
	GUI:Button_setTitleText(Button_looks, "")
	GUI:Button_setTitleColor(Button_looks, "#f8e6c6")
	GUI:Button_setTitleFontSize(Button_looks, 18)
	GUI:Button_titleEnableOutline(Button_looks, "#111111", 2)
	GUI:setChineseName(Button_looks, "排行榜_查看_按钮")
	GUI:setAnchorPoint(Button_looks, 0.50, 0.50)
	GUI:setTouchEnabled(Button_looks, true)
	GUI:setTag(Button_looks, 59)

	-- Create Button_close
	local Button_close = GUI:Button_Create(Panel_1, "Button_close", 910.00, 471.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(Button_close, "res/public/1900000511.png")
	GUI:Button_setScale9Slice(Button_close, 8, 8, 12, 10)
	GUI:setContentSize(Button_close, 26, 42)
	GUI:setIgnoreContentAdaptWithSize(Button_close, false)
	GUI:Button_setTitleText(Button_close, "")
	GUI:Button_setTitleColor(Button_close, "#414146")
	GUI:Button_setTitleFontSize(Button_close, 14)
	GUI:Button_titleDisableOutLine(Button_close)
	GUI:setChineseName(Button_close, "排行榜_关闭_按钮")
	GUI:setAnchorPoint(Button_close, 0.50, 0.50)
	GUI:setTouchEnabled(Button_close, true)
	GUI:setTag(Button_close, 64)

	-- Create TouchSize
	local TouchSize = GUI:Layout_Create(Button_close, "TouchSize", -24.00, -17.00, 70.00, 70.00, false)
	GUI:setChineseName(TouchSize, "排行榜_关闭_触摸")
	GUI:setTouchEnabled(TouchSize, true)
	GUI:setTag(TouchSize, 104)
	GUI:setVisible(TouchSize, false)

	-- Create Panel_myInfo
	local Panel_myInfo = GUI:Layout_Create(Panel_1, "Panel_myInfo", 144.00, 60.00, 451.00, 30.00, false)
	GUI:setChineseName(Panel_myInfo, "排行榜_我的信息组合")
	GUI:setTouchEnabled(Panel_myInfo, true)
	GUI:setTag(Panel_myInfo, 62)

	-- Create Text_5
	local Text_5 = GUI:Text_Create(Panel_myInfo, "Text_5", 88.00, 15.00, 14, "#ffffff", [[我的排名：]])
	GUI:setChineseName(Text_5, "排行榜_我的排名_文本")
	GUI:setAnchorPoint(Text_5, 1.00, 0.50)
	GUI:setTouchEnabled(Text_5, false)
	GUI:setTag(Text_5, 63)
	GUI:setVisible(Text_5, false)
	GUI:Text_enableOutline(Text_5, "#000000", 1)

	-- Create Text_level
	local Text_level = GUI:Text_Create(Panel_myInfo, "Text_level", 111.00, 15.00, 18, "#ffffff", [[未上榜]])
	GUI:setChineseName(Text_level, "排行榜_名次_文本")
	GUI:setAnchorPoint(Text_level, 0.00, 0.50)
	GUI:setTouchEnabled(Text_level, false)
	GUI:setTag(Text_level, 64)
	GUI:Text_enableOutline(Text_level, "#000000", 1)

	-- Create Text_7
	local Text_7 = GUI:Text_Create(Panel_myInfo, "Text_7", 285.00, 15.00, 14, "#ffffff", [[所属行会：]])
	GUI:setChineseName(Text_7, "排行榜_所属行会_文本")
	GUI:setAnchorPoint(Text_7, 1.00, 0.50)
	GUI:setTouchEnabled(Text_7, false)
	GUI:setTag(Text_7, 65)
	GUI:setVisible(Text_7, false)
	GUI:Text_enableOutline(Text_7, "#000000", 1)

	-- Create Text_guildName
	local Text_guildName = GUI:Text_Create(Panel_myInfo, "Text_guildName", 316.00, 15.00, 18, "#ffffff", [[无]])
	GUI:setChineseName(Text_guildName, "排行榜_行会名称_文本")
	GUI:setAnchorPoint(Text_guildName, 0.00, 0.50)
	GUI:setTouchEnabled(Text_guildName, false)
	GUI:setTag(Text_guildName, 66)
	GUI:Text_enableOutline(Text_guildName, "#000000", 1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Panel_myInfo, "ImageView", 0.00, -4.00, "res/custom/Rank/img_my_rank.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(Panel_myInfo, "ImageView_1", 204.00, -4.00, "res/custom/Rank/img_belong_to_guild.png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create LayoutTItle
	local LayoutTItle = GUI:Layout_Create(Panel_1, "LayoutTItle", 55.00, 428.00, 650.00, 50.00, false)
	GUI:setTouchEnabled(LayoutTItle, false)
	GUI:setTag(LayoutTItle, -1)

	-- Create ImageView_rank
	local ImageView_rank = GUI:Image_Create(LayoutTItle, "ImageView_rank", 22.00, -1.00, "res/custom/Rank/img_rank.png")
	GUI:setTouchEnabled(ImageView_rank, false)
	GUI:setTag(ImageView_rank, -1)

	-- Create ImageView_name
	local ImageView_name = GUI:Image_Create(LayoutTItle, "ImageView_name", 112.00, -1.00, "res/custom/Rank/img_name.png")
	GUI:setTouchEnabled(ImageView_name, false)
	GUI:setTag(ImageView_name, -1)

	-- Create ImageView_level
	local ImageView_level = GUI:Image_Create(LayoutTItle, "ImageView_level", 244.00, -1.00, "res/custom/Rank/img_level.png")
	GUI:setTouchEnabled(ImageView_level, false)
	GUI:setTag(ImageView_level, -1)

	-- Create ImageView_guild
	local ImageView_guild = GUI:Image_Create(LayoutTItle, "ImageView_guild", 375.00, -1.00, "res/custom/Rank/img_guild.png")
	GUI:setTouchEnabled(ImageView_guild, false)
	GUI:setTag(ImageView_guild, -1)

	-- Create LayoutBtnList
	local LayoutBtnList = GUI:Layout_Create(Panel_1, "LayoutBtnList", -3.00, 110.00, 60.00, 320.00, false)
	GUI:setTouchEnabled(LayoutBtnList, false)
	GUI:setTag(LayoutBtnList, -1)

	-- Create Button_Left_1
	local Button_Left_1 = GUI:Button_Create(LayoutBtnList, "Button_Left_1", 10.00, 220.00, "res/custom/Rank/btn_1_1.png")
	GUI:Button_loadTexturePressed(Button_Left_1, "res/custom/Rank/btn_1_2.png")
	GUI:Button_loadTextureDisabled(Button_Left_1, "res/custom/Rank/btn_1_2.png")
	GUI:Button_setTitleText(Button_Left_1, "")
	GUI:Button_setTitleColor(Button_Left_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Left_1, 14)
	GUI:Button_titleEnableOutline(Button_Left_1, "#000000", 1)
	GUI:setTouchEnabled(Button_Left_1, true)
	GUI:setTag(Button_Left_1, -1)

	-- Create Button_Left_2
	local Button_Left_2 = GUI:Button_Create(LayoutBtnList, "Button_Left_2", 10.00, 111.00, "res/custom/Rank/btn_2_1.png")
	GUI:Button_loadTexturePressed(Button_Left_2, "res/custom/Rank/btn_2_2.png")
	GUI:Button_loadTextureDisabled(Button_Left_2, "res/custom/Rank/btn_2_2.png")
	GUI:Button_setTitleText(Button_Left_2, "")
	GUI:Button_setTitleColor(Button_Left_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Left_2, 14)
	GUI:Button_titleEnableOutline(Button_Left_2, "#000000", 1)
	GUI:setTouchEnabled(Button_Left_2, true)
	GUI:setTag(Button_Left_2, -1)

	-- Create Button_Left_100
	local Button_Left_100 = GUI:Button_Create(LayoutBtnList, "Button_Left_100", 10.00, 2.00, "res/custom/Rank/btn_3_1.png")
	GUI:Button_loadTexturePressed(Button_Left_100, "res/custom/Rank/btn_3_2.png")
	GUI:Button_loadTextureDisabled(Button_Left_100, "res/custom/Rank/btn_3_2.png")
	GUI:Button_setTitleText(Button_Left_100, "")
	GUI:Button_setTitleColor(Button_Left_100, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Left_100, 14)
	GUI:Button_titleEnableOutline(Button_Left_100, "#000000", 1)
	GUI:setTouchEnabled(Button_Left_100, true)
	GUI:setTag(Button_Left_100, -1)

	-- Create ImageView_Desc
	local ImageView_Desc = GUI:Image_Create(Panel_1, "ImageView_Desc", 628.00, 106.00, "res/custom/Rank/this_power_desc_100.png")
	GUI:setTouchEnabled(ImageView_Desc, false)
	GUI:setTag(ImageView_Desc, -1)
	GUI:setVisible(ImageView_Desc, false)

	-- Create Button_upZhanLi
	local Button_upZhanLi = GUI:Button_Create(ImageView_Desc, "Button_upZhanLi", 38.00, 17.00, "res/custom/Rank/upzhanli.png")
	GUI:Button_setTitleText(Button_upZhanLi, "")
	GUI:Button_setTitleColor(Button_upZhanLi, "#ffffff")
	GUI:Button_setTitleFontSize(Button_upZhanLi, 14)
	GUI:Button_titleEnableOutline(Button_upZhanLi, "#000000", 1)
	GUI:setTouchEnabled(Button_upZhanLi, true)
	GUI:setTag(Button_upZhanLi, -1)
end
return ui