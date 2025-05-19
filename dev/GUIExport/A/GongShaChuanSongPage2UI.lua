local ui = {}
function ui.init(parent)
	-- Create Layout
	local Layout = GUI:Layout_Create(parent, "Layout", 0.00, 0.00, 616.00, 452.00, false)
	GUI:Layout_setBackGroundColorType(Layout, 1)
	GUI:Layout_setBackGroundColor(Layout, "#96c8ff")
	GUI:Layout_setBackGroundColorOpacity(Layout, 140)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create ImageBG
	local ImageBG = GUI:Image_Create(Layout, "ImageBG", 0.00, 0.00, "res/custom/gongshachuansong/bg_page2.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextGuildBoss
	local TextGuildBoss = GUI:Text_Create(ImageBG, "TextGuildBoss", 241.00, 225.00, 18, "#ff0000", [[文本]])
	GUI:setAnchorPoint(TextGuildBoss, 0.50, 0.00)
	GUI:setTouchEnabled(TextGuildBoss, false)
	GUI:setTag(TextGuildBoss, -1)
	GUI:Text_enableOutline(TextGuildBoss, "#000000", 1)

	-- Create TextGuild
	local TextGuild = GUI:Text_Create(ImageBG, "TextGuild", 240.00, 167.00, 18, "#00ffff", [[文本]])
	GUI:setAnchorPoint(TextGuild, 0.50, 0.00)
	GUI:setTouchEnabled(TextGuild, false)
	GUI:setTag(TextGuild, -1)
	GUI:Text_enableOutline(TextGuild, "#000000", 1)

	-- Create TextLingFu
	local TextLingFu = GUI:Text_Create(ImageBG, "TextLingFu", 116.00, 101.00, 18, "#4ae74a", [[文本]])
	GUI:setTouchEnabled(TextLingFu, false)
	GUI:setTag(TextLingFu, -1)
	GUI:Text_enableOutline(TextLingFu, "#000000", 1)

	-- Create TextHuoYue
	local TextHuoYue = GUI:Text_Create(ImageBG, "TextHuoYue", 360.00, 101.00, 18, "#4ae74a", [[文本]])
	GUI:setTouchEnabled(TextHuoYue, false)
	GUI:setTag(TextHuoYue, -1)
	GUI:Text_enableOutline(TextHuoYue, "#000000", 1)

	-- Create ButtonHuiZhang
	local ButtonHuiZhang = GUI:Button_Create(ImageBG, "ButtonHuiZhang", 495.00, 215.00, "res/custom/gongshachuansong/lingqu.png")
	GUI:Button_setTitleText(ButtonHuiZhang, "")
	GUI:Button_setTitleColor(ButtonHuiZhang, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHuiZhang, 14)
	GUI:Button_titleEnableOutline(ButtonHuiZhang, "#000000", 1)
	GUI:setTouchEnabled(ButtonHuiZhang, true)
	GUI:setTag(ButtonHuiZhang, -1)

	-- Create ButtonChengYuan
	local ButtonChengYuan = GUI:Button_Create(ImageBG, "ButtonChengYuan", 495.00, 155.00, "res/custom/gongshachuansong/lingqu.png")
	GUI:Button_setTitleText(ButtonChengYuan, "")
	GUI:Button_setTitleColor(ButtonChengYuan, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonChengYuan, 14)
	GUI:Button_titleEnableOutline(ButtonChengYuan, "#000000", 1)
	GUI:setTouchEnabled(ButtonChengYuan, true)
	GUI:setTag(ButtonChengYuan, -1)

	-- Create ButtonLingQu
	local ButtonLingQu = GUI:Button_Create(ImageBG, "ButtonLingQu", 495.00, 88.00, "res/custom/gongshachuansong/lingqu.png")
	GUI:Button_setTitleText(ButtonLingQu, "")
	GUI:Button_setTitleColor(ButtonLingQu, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonLingQu, 14)
	GUI:Button_titleEnableOutline(ButtonLingQu, "#000000", 1)
	GUI:setTouchEnabled(ButtonLingQu, true)
	GUI:setTag(ButtonLingQu, -1)

	-- Create ButtonHelp
	local ButtonHelp = GUI:Button_Create(ImageBG, "ButtonHelp", 455.00, 94.00, "res/custom/gongshachuansong/help.png")
	GUI:Button_setTitleText(ButtonHelp, "")
	GUI:Button_setTitleColor(ButtonHelp, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonHelp, 14)
	GUI:Button_titleEnableOutline(ButtonHelp, "#000000", 1)
	GUI:setTouchEnabled(ButtonHelp, true)
	GUI:setTag(ButtonHelp, -1)
	GUI:setVisible(ButtonHelp, false)

	-- Create NodeEffect
	local NodeEffect = GUI:Node_Create(ImageBG, "NodeEffect", 0.00, 0.00)
	GUI:setTag(NodeEffect, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(NodeEffect, "Effect", 413.00, 214.00, 0, 17000, 0, 0, 0, 1)
	GUI:setScaleX(Effect, 0.60)
	GUI:setScaleY(Effect, 0.60)
	GUI:setTag(Effect, -1)

	-- Create Effect_1
	local Effect_1 = GUI:Effect_Create(NodeEffect, "Effect_1", 414.00, 163.00, 0, 17001, 0, 0, 0, 1)
	GUI:setScaleX(Effect_1, 0.80)
	GUI:setScaleY(Effect_1, 0.80)
	GUI:setTag(Effect_1, -1)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(NodeEffect, "Layout1", 349.00, 218.00, 130.00, 40.00, false)
	GUI:setTouchEnabled(Layout1, true)
	GUI:setTag(Layout1, -1)
	GUI:setSwallowTouches(Layout1, false)

	-- Create Layout2
	local Layout2 = GUI:Layout_Create(NodeEffect, "Layout2", 349.00, 155.00, 130.00, 40.00, false)
	GUI:setTouchEnabled(Layout2, true)
	GUI:setTag(Layout2, -1)
end
return ui