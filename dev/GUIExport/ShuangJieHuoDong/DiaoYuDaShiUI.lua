local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -49.00, 2.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 997.00, 488.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 162.00, 49.00, 808, 459, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Panel_1, "Node_1", 0.00, 1.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Panel_1, "Image_1", 0.00, -1.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/0.png")
	GUI:setContentSize(Image_1, 804, 456)
	GUI:setIgnoreContentAdaptWithSize(Image_1, false)
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 861.00, 115.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 648.00, 56.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/cishu.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Image_2, "Text_1", 174.00, 12.00, 22, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 915.00, 62.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/addbtn.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Node_fishingRod
	local Node_fishingRod = GUI:Node_Create(ImageBG, "Node_fishingRod", 0.00, 0.00)
	GUI:setTag(Node_fishingRod, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 283.00, 186.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/add.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Panel_addFishingRod
	local Panel_addFishingRod = GUI:Layout_Create(ImageBG, "Panel_addFishingRod", 171.00, 52.00, 792, 449, false)
	GUI:Layout_setBackGroundColorType(Panel_addFishingRod, 1)
	GUI:Layout_setBackGroundColor(Panel_addFishingRod, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Panel_addFishingRod, 63)
	GUI:setAnchorPoint(Panel_addFishingRod, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_addFishingRod, true)
	GUI:setTag(Panel_addFishingRod, 0)
	GUI:setVisible(Panel_addFishingRod, false)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Panel_addFishingRod, "Image_4", 91.00, 102.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/adddiaoweibg.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, true)
	GUI:setTag(Image_4, 0)

	-- Create Button_addFishingRodClose
	local Button_addFishingRodClose = GUI:Button_Create(Image_4, "Button_addFishingRodClose", 590.00, 194.00, "res/custom/fulidating/close.png")
	GUI:Button_setTitleText(Button_addFishingRodClose, [[]])
	GUI:Button_setTitleColor(Button_addFishingRodClose, "#ffffff")
	GUI:Button_setTitleFontSize(Button_addFishingRodClose, 16)
	GUI:Button_titleEnableOutline(Button_addFishingRodClose, "#000000", 1)
	GUI:setAnchorPoint(Button_addFishingRodClose, 0.00, 0.00)
	GUI:setTouchEnabled(Button_addFishingRodClose, true)
	GUI:setTag(Button_addFishingRodClose, 0)

	-- Create Button_buyFishingRod
	local Button_buyFishingRod = GUI:Button_Create(Image_4, "Button_buyFishingRod", 200.00, 23.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/zengjiabtn.png")
	GUI:Button_setTitleText(Button_buyFishingRod, [[]])
	GUI:Button_setTitleColor(Button_buyFishingRod, "#ffffff")
	GUI:Button_setTitleFontSize(Button_buyFishingRod, 16)
	GUI:Button_titleEnableOutline(Button_buyFishingRod, "#000000", 1)
	GUI:setAnchorPoint(Button_buyFishingRod, 0.00, 0.00)
	GUI:setTouchEnabled(Button_buyFishingRod, true)
	GUI:setTag(Button_buyFishingRod, 0)

	-- Create Panel_jinDu
	local Panel_jinDu = GUI:Layout_Create(ImageBG, "Panel_jinDu", 171.00, 52.00, 792, 449, false)
	GUI:setAnchorPoint(Panel_jinDu, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_jinDu, true)
	GUI:setTag(Panel_jinDu, 0)
	GUI:setVisible(Panel_jinDu, false)

	-- Create Image_jinduBg
	local Image_jinduBg = GUI:Image_Create(Panel_jinDu, "Image_jinduBg", 213.00, 193.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/jindutiao_1.png")
	GUI:setAnchorPoint(Image_jinduBg, 0.00, 0.00)
	GUI:setTouchEnabled(Image_jinduBg, false)
	GUI:setTag(Image_jinduBg, 0)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(Image_jinduBg, "LoadingBar_1", 4.00, 6.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/jindutiao_2.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar_1, 0)
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create Text_jinDuFont
	local Text_jinDuFont = GUI:Text_Create(Image_jinduBg, "Text_jinDuFont", 198.00, 4.00, 16, "#ffffff", [[钓鱼中...]])
	GUI:setAnchorPoint(Text_jinDuFont, 0.50, 0.00)
	GUI:setTouchEnabled(Text_jinDuFont, false)
	GUI:setTag(Text_jinDuFont, 0)
	GUI:Text_enableOutline(Text_jinDuFont, "#000000", 1)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Panel_jinDu, "Image_3", 349.00, 364.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/ui_dy_zi_dyz.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Panel_shouHuo
	local Panel_shouHuo = GUI:Layout_Create(ImageBG, "Panel_shouHuo", 162.00, 52.00, 805, 449, false)
	GUI:Layout_setBackGroundColorType(Panel_shouHuo, 1)
	GUI:Layout_setBackGroundColor(Panel_shouHuo, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Panel_shouHuo, 63)
	GUI:setAnchorPoint(Panel_shouHuo, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_shouHuo, true)
	GUI:setTag(Panel_shouHuo, 0)
	GUI:setVisible(Panel_shouHuo, false)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Panel_shouHuo, "Image_5", 394.00, 236.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/shou.png")
	GUI:setAnchorPoint(Image_5, 0.50, 0.50)
	GUI:setTouchEnabled(Image_5, true)
	GUI:setTag(Image_5, 0)

	-- Create Button_ShouHuoClose
	local Button_ShouHuoClose = GUI:Button_Create(Image_5, "Button_ShouHuoClose", 474.00, 159.00, "res/custom/fulidating/close.png")
	GUI:Button_setTitleText(Button_ShouHuoClose, [[]])
	GUI:Button_setTitleColor(Button_ShouHuoClose, "#ffffff")
	GUI:Button_setTitleFontSize(Button_ShouHuoClose, 16)
	GUI:Button_titleEnableOutline(Button_ShouHuoClose, "#000000", 1)
	GUI:setAnchorPoint(Button_ShouHuoClose, 0.00, 0.00)
	GUI:setTouchEnabled(Button_ShouHuoClose, true)
	GUI:setTag(Button_ShouHuoClose, 0)

	-- Create Panel_shouHuoShou
	local Panel_shouHuoShou = GUI:Layout_Create(Image_5, "Panel_shouHuoShou", 66.00, 57.00, 360, 89, false)
	GUI:setAnchorPoint(Panel_shouHuoShou, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_shouHuoShou, true)
	GUI:setTag(Panel_shouHuoShou, 0)

	-- Create Panel_gouMaiCiShu
	local Panel_gouMaiCiShu = GUI:Layout_Create(ImageBG, "Panel_gouMaiCiShu", 162.00, 52.00, 805, 449, false)
	GUI:Layout_setBackGroundColorType(Panel_gouMaiCiShu, 1)
	GUI:Layout_setBackGroundColor(Panel_gouMaiCiShu, "#000000")
	GUI:Layout_setBackGroundColorOpacity(Panel_gouMaiCiShu, 63)
	GUI:setAnchorPoint(Panel_gouMaiCiShu, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_gouMaiCiShu, true)
	GUI:setTag(Panel_gouMaiCiShu, 0)
	GUI:setVisible(Panel_gouMaiCiShu, false)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Panel_gouMaiCiShu, "Image_6", 403.00, 236.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/goumaicishu.png")
	GUI:setAnchorPoint(Image_6, 0.50, 0.50)
	GUI:setTouchEnabled(Image_6, true)
	GUI:setTag(Image_6, 0)

	-- Create Button_gouMaiCiShuClose
	local Button_gouMaiCiShuClose = GUI:Button_Create(Image_6, "Button_gouMaiCiShuClose", 589.00, 196.00, "res/custom/fulidating/close.png")
	GUI:Button_setTitleText(Button_gouMaiCiShuClose, [[]])
	GUI:Button_setTitleColor(Button_gouMaiCiShuClose, "#ffffff")
	GUI:Button_setTitleFontSize(Button_gouMaiCiShuClose, 16)
	GUI:Button_titleEnableOutline(Button_gouMaiCiShuClose, "#000000", 1)
	GUI:setAnchorPoint(Button_gouMaiCiShuClose, 0.00, 0.00)
	GUI:setTouchEnabled(Button_gouMaiCiShuClose, true)
	GUI:setTag(Button_gouMaiCiShuClose, 0)

	-- Create Button_gouMaiCiShu
	local Button_gouMaiCiShu = GUI:Button_Create(Image_6, "Button_gouMaiCiShu", 198.00, 26.00, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/zengjiabtn.png")
	GUI:Button_setTitleText(Button_gouMaiCiShu, [[]])
	GUI:Button_setTitleColor(Button_gouMaiCiShu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_gouMaiCiShu, 16)
	GUI:Button_titleEnableOutline(Button_gouMaiCiShu, "#000000", 1)
	GUI:setAnchorPoint(Button_gouMaiCiShu, 0.00, 0.00)
	GUI:setTouchEnabled(Button_gouMaiCiShu, true)
	GUI:setTag(Button_gouMaiCiShu, 0)

	-- Create Text_sygmcs
	local Text_sygmcs = GUI:Text_Create(Image_6, "Text_sygmcs", 415.00, 57.00, 18, "#c7bf9f", [[今日还可购买0次]])
	GUI:setAnchorPoint(Text_sygmcs, 0.00, 0.00)
	GUI:setTouchEnabled(Text_sygmcs, false)
	GUI:setTag(Text_sygmcs, 0)
	GUI:Text_enableOutline(Text_sygmcs, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
