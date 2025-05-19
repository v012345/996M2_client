local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/xingyunxianglian/jm_01.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 1000.00, 499.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/custom/xingyunxianglian/close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create xingyunlooks
	local xingyunlooks = GUI:Text_Create(ImageBG, "xingyunlooks", 460.00, 359.00, 18, "#ffff00", [[]])
	GUI:setTouchEnabled(xingyunlooks, false)
	GUI:setTag(xingyunlooks, -1)
	GUI:Text_enableOutline(xingyunlooks, "#000000", 1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(ImageBG, "EquipShow", 414.00, 276.00, 3, false, {look = true, bgVisible = false, starLv = false})
	GUI:setTag(EquipShow, -1)
	GUI:setSwallowTouches(EquipShow, true)
	GUI:EquipShow_setAutoUpdate(EquipShow)

	-- Create TextLeiJi
	local TextLeiJi = GUI:Text_Create(ImageBG, "TextLeiJi", 621.00, 106.00, 18, "#f7e700", [[1111]])
	GUI:setAnchorPoint(TextLeiJi, 0.50, 0.50)
	GUI:setTouchEnabled(TextLeiJi, false)
	GUI:setTag(TextLeiJi, -1)
	GUI:Text_enableOutline(TextLeiJi, "#000000", 1)

	-- Create itmename
	local itmename = GUI:Text_Create(ImageBG, "itmename", 445.00, 242.00, 16, "#10ff00", [[未佩戴项链]])
	GUI:setAnchorPoint(itmename, 0.50, 0.50)
	GUI:setTouchEnabled(itmename, false)
	GUI:setTag(itmename, -1)
	GUI:Text_enableOutline(itmename, "#000000", 1)

	-- Create ButtonXingYun12
	local ButtonXingYun12 = GUI:Button_Create(ImageBG, "ButtonXingYun12", 361.00, 153.00, "res/custom/xingyunxianglian/an_02.png")
	GUI:Button_setScale9Slice(ButtonXingYun12, 55, 55, 18, 18)
	GUI:setContentSize(ButtonXingYun12, 165, 54)
	GUI:setIgnoreContentAdaptWithSize(ButtonXingYun12, false)
	GUI:Button_setTitleText(ButtonXingYun12, "")
	GUI:Button_setTitleColor(ButtonXingYun12, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonXingYun12, 14)
	GUI:Button_titleEnableOutline(ButtonXingYun12, "#000000", 1)
	GUI:setTouchEnabled(ButtonXingYun12, true)
	GUI:setTag(ButtonXingYun12, -1)

	-- Create ButtonStart
	local ButtonStart = GUI:Button_Create(ImageBG, "ButtonStart", 786.00, 86.00, "res/custom/xingyunxianglian/an_01.png")
	GUI:Button_setTitleText(ButtonStart, "")
	GUI:Button_setTitleColor(ButtonStart, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonStart, 14)
	GUI:Button_titleEnableOutline(ButtonStart, "#000000", 1)
	GUI:setTouchEnabled(ButtonStart, true)
	GUI:setTag(ButtonStart, -1)

	-- Create expnum
	local expnum = GUI:Text_Create(ImageBG, "expnum", 826.00, 202.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(expnum, false)
	GUI:setTag(expnum, -1)
	GUI:Text_enableOutline(expnum, "#000000", 1)

	-- Create ranlooks
	local ranlooks = GUI:Text_Create(ImageBG, "ranlooks", 826.00, 172.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(ranlooks, false)
	GUI:setTag(ranlooks, -1)
	GUI:Text_enableOutline(ranlooks, "#000000", 1)
end
return ui