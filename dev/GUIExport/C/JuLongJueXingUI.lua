local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/julongjuexing/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 799.00, 416.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/julongjuexing/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create expimg
	local expimg = GUI:LoadingBar_Create(ImageBG, "expimg", 213.00, 129.00, "res/custom/julongjuexing/exp.png", 0)
	GUI:setAnchorPoint(expimg, 0.00, 0.00)
	GUI:setTouchEnabled(expimg, false)
	GUI:setTag(expimg, 0)

	-- Create levelexp
	local levelexp = GUI:Text_Create(ImageBG, "levelexp", 627.00, 140.00, 16, "#ffffff", [[1/10000
]])
	GUI:setAnchorPoint(levelexp, 0.50, 0.50)
	GUI:setTouchEnabled(levelexp, false)
	GUI:setTag(levelexp, 0)
	GUI:Text_enableOutline(levelexp, "#000000", 1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 213.00, 26.00, "res/custom/julongjuexing/an_01.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_Ima_1
	local Button_Ima_1 = GUI:Image_Create(Button_1, "Button_Ima_1", 51.00, 70.00, "res/custom/julongjuexing/xh_1_1.png")
	GUI:setAnchorPoint(Button_Ima_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Ima_1, false)
	GUI:setTag(Button_Ima_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 478.00, 26.00, "res/custom/julongjuexing/an_02.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Button_Ima_2
	local Button_Ima_2 = GUI:Image_Create(Button_2, "Button_Ima_2", 47.00, 70.00, "res/custom/julongjuexing/xh_1_2.png")
	GUI:setAnchorPoint(Button_Ima_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Ima_2, false)
	GUI:setTag(Button_Ima_2, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 348.00, 26.00, "res/custom/julongjuexing/an_03.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_Ima_3
	local Button_Ima_3 = GUI:Image_Create(Button_3, "Button_Ima_3", 105.00, 70.00, "res/custom/julongjuexing/xh_2_1.png")
	GUI:setContentSize(Button_Ima_3, 84, 31)
	GUI:setIgnoreContentAdaptWithSize(Button_Ima_3, false)
	GUI:setAnchorPoint(Button_Ima_3, 0.50, 0.00)
	GUI:setTouchEnabled(Button_Ima_3, false)
	GUI:setTag(Button_Ima_3, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 100.00, 178.00, "res/custom/julongjuexing/js2.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create levellooks_1
	local levellooks_1 = GUI:Image_Create(Image_1, "levellooks_1", 51.00, 200.00, "res/custom/julongjuexing/look_2_2.png")
	GUI:setAnchorPoint(levellooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(levellooks_1, false)
	GUI:setTag(levellooks_1, 0)

	-- Create shuxing_1
	local shuxing_1 = GUI:Text_Create(Image_1, "shuxing_1", 114.00, 182.00, 16, "#fef103", [[等级]])
	GUI:setAnchorPoint(shuxing_1, 0.00, 0.00)
	GUI:setTouchEnabled(shuxing_1, false)
	GUI:setTag(shuxing_1, 0)
	GUI:Text_enableOutline(shuxing_1, "#000000", 1)

	-- Create gongji_1
	local gongji_1 = GUI:Text_Create(Image_1, "gongji_1", 114.00, 136.00, 15, "#02ce02", [[吸血]])
	GUI:setAnchorPoint(gongji_1, 0.00, 0.00)
	GUI:setTouchEnabled(gongji_1, false)
	GUI:setTag(gongji_1, 0)
	GUI:Text_enableOutline(gongji_1, "#000000", 1)

	-- Create jianmian_1
	local jianmian_1 = GUI:Text_Create(Image_1, "jianmian_1", 114.00, 114.00, 15, "#02ce02", [[减免]])
	GUI:setAnchorPoint(jianmian_1, 0.00, 0.00)
	GUI:setTouchEnabled(jianmian_1, false)
	GUI:setTag(jianmian_1, 0)
	GUI:Text_enableOutline(jianmian_1, "#000000", 1)

	-- Create daren_1
	local daren_1 = GUI:Text_Create(Image_1, "daren_1", 114.00, 92.00, 15, "#02ce02", [[打人]])
	GUI:setAnchorPoint(daren_1, 0.00, 0.00)
	GUI:setTouchEnabled(daren_1, false)
	GUI:setTag(daren_1, 0)
	GUI:Text_enableOutline(daren_1, "#000000", 1)

	-- Create qiege_1
	local qiege_1 = GUI:Text_Create(Image_1, "qiege_1", 114.00, 70.00, 15, "#02ce02", [[切割]])
	GUI:setAnchorPoint(qiege_1, 0.00, 0.00)
	GUI:setTouchEnabled(qiege_1, false)
	GUI:setTag(qiege_1, 0)
	GUI:Text_enableOutline(qiege_1, "#000000", 1)

	-- Create shengming_1
	local shengming_1 = GUI:Text_Create(Image_1, "shengming_1", 114.00, 49.00, 15, "#02ce02", [[生命]])
	GUI:setAnchorPoint(shengming_1, 0.00, 0.00)
	GUI:setTouchEnabled(shengming_1, false)
	GUI:setTag(shengming_1, 0)
	GUI:Text_enableOutline(shengming_1, "#000000", 1)

	-- Create Image_costYB_1
	local Image_costYB_1 = GUI:Image_Create(Image_1, "Image_costYB_1", 105.00, 26.00, "res/custom/julongjuexing/1.png")
	GUI:setAnchorPoint(Image_costYB_1, 0.50, 0.00)
	GUI:setTouchEnabled(Image_costYB_1, false)
	GUI:setTag(Image_costYB_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 614.00, 178.00, "res/custom/julongjuexing/js2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create levellooks_2
	local levellooks_2 = GUI:Image_Create(Image_2, "levellooks_2", 51.00, 198.00, "res/custom/julongjuexing/look_2_3.png")
	GUI:setAnchorPoint(levellooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(levellooks_2, false)
	GUI:setTag(levellooks_2, 0)

	-- Create shuxing_2
	local shuxing_2 = GUI:Text_Create(Image_2, "shuxing_2", 114.00, 182.00, 16, "#fef103", [[等级]])
	GUI:setAnchorPoint(shuxing_2, 0.00, 0.00)
	GUI:setTouchEnabled(shuxing_2, false)
	GUI:setTag(shuxing_2, 0)
	GUI:Text_enableOutline(shuxing_2, "#000000", 1)

	-- Create gongji_2
	local gongji_2 = GUI:Text_Create(Image_2, "gongji_2", 114.00, 136.00, 15, "#02ce02", [[吸血]])
	GUI:setAnchorPoint(gongji_2, 0.00, 0.00)
	GUI:setTouchEnabled(gongji_2, false)
	GUI:setTag(gongji_2, 0)
	GUI:Text_enableOutline(gongji_2, "#000000", 1)

	-- Create jianmian_2
	local jianmian_2 = GUI:Text_Create(Image_2, "jianmian_2", 114.00, 114.00, 15, "#02ce02", [[减免]])
	GUI:setAnchorPoint(jianmian_2, 0.00, 0.00)
	GUI:setTouchEnabled(jianmian_2, false)
	GUI:setTag(jianmian_2, 0)
	GUI:Text_enableOutline(jianmian_2, "#000000", 1)

	-- Create daren_2
	local daren_2 = GUI:Text_Create(Image_2, "daren_2", 114.00, 92.00, 15, "#02ce02", [[打人]])
	GUI:setAnchorPoint(daren_2, 0.00, 0.00)
	GUI:setTouchEnabled(daren_2, false)
	GUI:setTag(daren_2, 0)
	GUI:Text_enableOutline(daren_2, "#000000", 1)

	-- Create qiege_2
	local qiege_2 = GUI:Text_Create(Image_2, "qiege_2", 114.00, 70.00, 15, "#02ce02", [[切割]])
	GUI:setAnchorPoint(qiege_2, 0.00, 0.00)
	GUI:setTouchEnabled(qiege_2, false)
	GUI:setTag(qiege_2, 0)
	GUI:Text_enableOutline(qiege_2, "#000000", 1)

	-- Create shengming_2
	local shengming_2 = GUI:Text_Create(Image_2, "shengming_2", 114.00, 49.00, 15, "#02ce02", [[生命]])
	GUI:setAnchorPoint(shengming_2, 0.00, 0.00)
	GUI:setTouchEnabled(shengming_2, false)
	GUI:setTag(shengming_2, 0)
	GUI:Text_enableOutline(shengming_2, "#000000", 1)

	-- Create Image_costYB_2
	local Image_costYB_2 = GUI:Image_Create(Image_2, "Image_costYB_2", 104.00, 26.00, "res/custom/julongjuexing/1.png")
	GUI:setAnchorPoint(Image_costYB_2, 0.50, 0.00)
	GUI:setTouchEnabled(Image_costYB_2, false)
	GUI:setTag(Image_costYB_2, 0)

	-- Create Effect
	local Effect = GUI:Effect_Create(ImageBG, "Effect", 708.00, 154.00, 3, 17521)
	GUI:setTag(Effect, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
