local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 4.00, 0.00, "res/custom/TianMing/static/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 1088.00, 598.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create NodeMain
	local NodeMain = GUI:Node_Create(ImageBG, "NodeMain", 566.00, 340.00)
	GUI:setTag(NodeMain, -1)

	-- Create NodeLeft
	local NodeLeft = GUI:Node_Create(NodeMain, "NodeLeft", 0.00, 0.00)
	GUI:setTag(NodeLeft, -1)

	-- Create ImageViewtitle
	local ImageViewtitle = GUI:Image_Create(NodeLeft, "ImageViewtitle", -412.00, 218.00, "res/custom/TianMing/static/xiantian.png")
	GUI:setAnchorPoint(ImageViewtitle, 0.00, 0.00)
	GUI:setTouchEnabled(ImageViewtitle, false)
	GUI:setTag(ImageViewtitle, -1)

	-- Create NodeLeftList
	local NodeLeftList = GUI:Node_Create(NodeLeft, "NodeLeftList", 0.00, 0.00)
	GUI:setTag(NodeLeftList, -1)

	-- Create ScrollViewLeft
	local ScrollViewLeft = GUI:ScrollView_Create(NodeLeftList, "ScrollViewLeft", -361.00, -14.00, 410, 450, 1)
	GUI:ScrollView_setBounceEnabled(ScrollViewLeft, true)
	GUI:ScrollView_setInnerContainerSize(ScrollViewLeft, 410.00, 900.00)
	GUI:setAnchorPoint(ScrollViewLeft, 0.50, 0.50)
	GUI:setTouchEnabled(ScrollViewLeft, true)
	GUI:setTag(ScrollViewLeft, -1)

	-- Create BtnLeft_1
	local BtnLeft_1 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_1", 50.00, 863.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_1, [[]])
	GUI:Button_setTitleColor(BtnLeft_1, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_1, 20)
	GUI:Button_titleEnableOutline(BtnLeft_1, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_1, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_1, true)
	GUI:setTag(BtnLeft_1, 1)
	TAGOBJ["1"] = BtnLeft_1

	-- Create BtnLeft_2
	local BtnLeft_2 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_2", 50.00, 789.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_2, [[]])
	GUI:Button_setTitleColor(BtnLeft_2, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_2, 20)
	GUI:Button_titleEnableOutline(BtnLeft_2, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_2, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_2, true)
	GUI:setTag(BtnLeft_2, 2)
	TAGOBJ["2"] = BtnLeft_2

	-- Create BtnLeft_3
	local BtnLeft_3 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_3", 50.00, 715.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_3, [[]])
	GUI:Button_setTitleColor(BtnLeft_3, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_3, 20)
	GUI:Button_titleEnableOutline(BtnLeft_3, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_3, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_3, true)
	GUI:setTag(BtnLeft_3, 3)
	TAGOBJ["3"] = BtnLeft_3

	-- Create BtnLeft_4
	local BtnLeft_4 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_4", 50.00, 640.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_4, [[]])
	GUI:Button_setTitleColor(BtnLeft_4, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_4, 20)
	GUI:Button_titleEnableOutline(BtnLeft_4, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_4, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_4, true)
	GUI:setTag(BtnLeft_4, 4)
	TAGOBJ["4"] = BtnLeft_4

	-- Create BtnLeft_5
	local BtnLeft_5 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_5", 50.00, 566.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_5, [[]])
	GUI:Button_setTitleColor(BtnLeft_5, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_5, 20)
	GUI:Button_titleEnableOutline(BtnLeft_5, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_5, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_5, true)
	GUI:setTag(BtnLeft_5, 5)
	TAGOBJ["5"] = BtnLeft_5

	-- Create BtnLeft_6
	local BtnLeft_6 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_6", 50.00, 490.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_6, [[]])
	GUI:Button_setTitleColor(BtnLeft_6, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_6, 20)
	GUI:Button_titleEnableOutline(BtnLeft_6, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_6, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_6, true)
	GUI:setTag(BtnLeft_6, 6)
	TAGOBJ["6"] = BtnLeft_6

	-- Create BtnLeft_7
	local BtnLeft_7 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_7", 50.00, 416.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_7, [[]])
	GUI:Button_setTitleColor(BtnLeft_7, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_7, 20)
	GUI:Button_titleEnableOutline(BtnLeft_7, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_7, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_7, true)
	GUI:setTag(BtnLeft_7, 7)
	TAGOBJ["7"] = BtnLeft_7

	-- Create BtnLeft_8
	local BtnLeft_8 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_8", 50.00, 341.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_8, [[]])
	GUI:Button_setTitleColor(BtnLeft_8, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_8, 20)
	GUI:Button_titleEnableOutline(BtnLeft_8, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_8, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_8, true)
	GUI:setTag(BtnLeft_8, 8)
	TAGOBJ["8"] = BtnLeft_8

	-- Create BtnLeft_9
	local BtnLeft_9 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_9", 50.00, 266.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_9, [[]])
	GUI:Button_setTitleColor(BtnLeft_9, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_9, 20)
	GUI:Button_titleEnableOutline(BtnLeft_9, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_9, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_9, true)
	GUI:setTag(BtnLeft_9, 9)
	TAGOBJ["9"] = BtnLeft_9

	-- Create BtnLeft_10
	local BtnLeft_10 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_10", 50.00, 191.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_10, [[]])
	GUI:Button_setTitleColor(BtnLeft_10, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_10, 20)
	GUI:Button_titleEnableOutline(BtnLeft_10, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_10, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_10, true)
	GUI:setTag(BtnLeft_10, 10)
	TAGOBJ["10"] = BtnLeft_10

	-- Create BtnLeft_11
	local BtnLeft_11 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_11", 50.00, 116.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_11, [[]])
	GUI:Button_setTitleColor(BtnLeft_11, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_11, 20)
	GUI:Button_titleEnableOutline(BtnLeft_11, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_11, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_11, true)
	GUI:setTag(BtnLeft_11, 11)
	TAGOBJ["11"] = BtnLeft_11

	-- Create BtnLeft_12
	local BtnLeft_12 = GUI:Button_Create(ScrollViewLeft, "BtnLeft_12", 50.00, 42.00, "res/custom/TianMing/static/grey_left.png")
	GUI:Button_setTitleText(BtnLeft_12, [[]])
	GUI:Button_setTitleColor(BtnLeft_12, "#ffffff")
	GUI:Button_setTitleFontSize(BtnLeft_12, 20)
	GUI:Button_titleEnableOutline(BtnLeft_12, "#000000", 2)
	GUI:setAnchorPoint(BtnLeft_12, 0.00, 0.00)
	GUI:setTouchEnabled(BtnLeft_12, true)
	GUI:setTag(BtnLeft_12, 12)
	TAGOBJ["12"] = BtnLeft_12

	-- Create NodeRigth
	local NodeRigth = GUI:Node_Create(NodeMain, "NodeRigth", 0.00, 0.00)
	GUI:setTag(NodeRigth, -1)

	-- Create ImageViewtitle
	ImageViewtitle = GUI:Image_Create(NodeRigth, "ImageViewtitle", 141.00, 221.00, "res/custom/TianMing/static/houtian.png")
	GUI:setAnchorPoint(ImageViewtitle, 0.00, 0.00)
	GUI:setTouchEnabled(ImageViewtitle, false)
	GUI:setTag(ImageViewtitle, -1)

	-- Create ScrollViewRight
	local ScrollViewRight = GUI:ScrollView_Create(NodeRigth, "ScrollViewRight", 365.00, -12.00, 410, 450, 1)
	GUI:ScrollView_setBounceEnabled(ScrollViewRight, true)
	GUI:ScrollView_setInnerContainerSize(ScrollViewRight, 410.00, 900.00)
	GUI:setAnchorPoint(ScrollViewRight, 0.50, 0.50)
	GUI:setTouchEnabled(ScrollViewRight, true)
	GUI:setTag(ScrollViewRight, -1)

	-- Create BtnRight_1
	local BtnRight_1 = GUI:Button_Create(ScrollViewRight, "BtnRight_1", 50.00, 863.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_1, [[]])
	GUI:Button_setTitleColor(BtnRight_1, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_1, 20)
	GUI:Button_titleEnableOutline(BtnRight_1, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_1, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_1, true)
	GUI:setTag(BtnRight_1, 13)
	TAGOBJ["13"] = BtnRight_1

	-- Create BtnRight_2
	local BtnRight_2 = GUI:Button_Create(ScrollViewRight, "BtnRight_2", 50.00, 789.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_2, [[]])
	GUI:Button_setTitleColor(BtnRight_2, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_2, 20)
	GUI:Button_titleEnableOutline(BtnRight_2, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_2, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_2, true)
	GUI:setTag(BtnRight_2, 14)
	TAGOBJ["14"] = BtnRight_2

	-- Create BtnRight_3
	local BtnRight_3 = GUI:Button_Create(ScrollViewRight, "BtnRight_3", 50.00, 715.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_3, [[]])
	GUI:Button_setTitleColor(BtnRight_3, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_3, 20)
	GUI:Button_titleEnableOutline(BtnRight_3, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_3, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_3, true)
	GUI:setTag(BtnRight_3, 15)
	TAGOBJ["15"] = BtnRight_3

	-- Create BtnRight_4
	local BtnRight_4 = GUI:Button_Create(ScrollViewRight, "BtnRight_4", 50.00, 640.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_4, [[]])
	GUI:Button_setTitleColor(BtnRight_4, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_4, 20)
	GUI:Button_titleEnableOutline(BtnRight_4, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_4, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_4, true)
	GUI:setTag(BtnRight_4, 16)
	TAGOBJ["16"] = BtnRight_4

	-- Create BtnRight_5
	local BtnRight_5 = GUI:Button_Create(ScrollViewRight, "BtnRight_5", 50.00, 566.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_5, [[]])
	GUI:Button_setTitleColor(BtnRight_5, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_5, 19)
	GUI:Button_titleEnableOutline(BtnRight_5, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_5, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_5, true)
	GUI:setTag(BtnRight_5, 17)
	TAGOBJ["17"] = BtnRight_5

	-- Create BtnRight_6
	local BtnRight_6 = GUI:Button_Create(ScrollViewRight, "BtnRight_6", 50.00, 490.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_6, [[]])
	GUI:Button_setTitleColor(BtnRight_6, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_6, 19)
	GUI:Button_titleEnableOutline(BtnRight_6, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_6, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_6, true)
	GUI:setTag(BtnRight_6, 18)
	TAGOBJ["18"] = BtnRight_6

	-- Create BtnRight_7
	local BtnRight_7 = GUI:Button_Create(ScrollViewRight, "BtnRight_7", 50.00, 416.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_7, [[]])
	GUI:Button_setTitleColor(BtnRight_7, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_7, 19)
	GUI:Button_titleEnableOutline(BtnRight_7, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_7, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_7, true)
	GUI:setTag(BtnRight_7, 19)
	TAGOBJ["19"] = BtnRight_7

	-- Create BtnRight_8
	local BtnRight_8 = GUI:Button_Create(ScrollViewRight, "BtnRight_8", 50.00, 341.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_8, [[]])
	GUI:Button_setTitleColor(BtnRight_8, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_8, 19)
	GUI:Button_titleEnableOutline(BtnRight_8, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_8, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_8, true)
	GUI:setTag(BtnRight_8, 20)
	TAGOBJ["20"] = BtnRight_8

	-- Create BtnRight_9
	local BtnRight_9 = GUI:Button_Create(ScrollViewRight, "BtnRight_9", 50.00, 266.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_9, [[]])
	GUI:Button_setTitleColor(BtnRight_9, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_9, 19)
	GUI:Button_titleEnableOutline(BtnRight_9, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_9, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_9, true)
	GUI:setTag(BtnRight_9, 21)
	TAGOBJ["21"] = BtnRight_9

	-- Create BtnRight_10
	local BtnRight_10 = GUI:Button_Create(ScrollViewRight, "BtnRight_10", 50.00, 191.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_10, [[]])
	GUI:Button_setTitleColor(BtnRight_10, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_10, 19)
	GUI:Button_titleEnableOutline(BtnRight_10, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_10, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_10, true)
	GUI:setTag(BtnRight_10, 22)
	TAGOBJ["22"] = BtnRight_10

	-- Create BtnRight_11
	local BtnRight_11 = GUI:Button_Create(ScrollViewRight, "BtnRight_11", 50.00, 116.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_11, [[]])
	GUI:Button_setTitleColor(BtnRight_11, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_11, 19)
	GUI:Button_titleEnableOutline(BtnRight_11, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_11, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_11, true)
	GUI:setTag(BtnRight_11, 23)
	TAGOBJ["23"] = BtnRight_11

	-- Create BtnRight_12
	local BtnRight_12 = GUI:Button_Create(ScrollViewRight, "BtnRight_12", 50.00, 42.00, "res/custom/TianMing/static/grey_right.png")
	GUI:Button_setTitleText(BtnRight_12, [[]])
	GUI:Button_setTitleColor(BtnRight_12, "#ffffff")
	GUI:Button_setTitleFontSize(BtnRight_12, 19)
	GUI:Button_titleEnableOutline(BtnRight_12, "#000000", 2)
	GUI:setAnchorPoint(BtnRight_12, 0.00, 0.00)
	GUI:setTouchEnabled(BtnRight_12, true)
	GUI:setTag(BtnRight_12, 24)
	TAGOBJ["24"] = BtnRight_12

	-- Create Nodebottom
	local Nodebottom = GUI:Node_Create(NodeMain, "Nodebottom", 0.00, 0.00)
	GUI:setTag(Nodebottom, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(Nodebottom, "ImageView", -346.00, -316.00, "res/custom/TianMing/static/qiyun.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Text_desc
	local Text_desc = GUI:Text_Create(ImageView, "Text_desc", 54.00, 33.00, 18, "#bbc8da", [[]])
	GUI:setAnchorPoint(Text_desc, 0.00, 0.50)
	GUI:setTouchEnabled(Text_desc, false)
	GUI:setTag(Text_desc, 0)
	GUI:Text_enableOutline(Text_desc, "#000000", 1)

	-- Create NodeNext
	local NodeNext = GUI:Node_Create(ImageBG, "NodeNext", 0.00, 0.00)
	GUI:setTag(NodeNext, -1)

	-- Create NodeFont
	local NodeFont = GUI:Node_Create(ImageBG, "NodeFont", 0.00, 0.00)
	GUI:setTag(NodeFont, -1)

	-- Create NodeTuJian
	local NodeTuJian = GUI:Node_Create(ImageBG, "NodeTuJian", 0.00, 0.00)
	GUI:setTag(NodeTuJian, -1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageBG, "Text_1", 510.00, 570.00, 30, "#ffff00", [[123123123123123]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
