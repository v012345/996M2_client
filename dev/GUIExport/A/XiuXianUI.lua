local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/XiuXian/bg/xx_1.jpg")
	GUI:setContentSize(ImageBG, 1136, 640)
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 1017.00, 535.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_Main
	local Node_Main = GUI:Node_Create(ImageBG, "Node_Main", 567.00, 321.00)
	GUI:setAnchorPoint(Node_Main, 0.00, 0.00)
	GUI:setTag(Node_Main, 0)

	-- Create ScrollView_1
	local ScrollView_1 = GUI:ScrollView_Create(Node_Main, "ScrollView_1", -509.00, -255.00, 286, 538, 1)
	GUI:ScrollView_setBounceEnabled(ScrollView_1, true)
	GUI:ScrollView_setInnerContainerSize(ScrollView_1, 320.00, 1800.00)
	GUI:setAnchorPoint(ScrollView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ScrollView_1, true)
	GUI:setTag(ScrollView_1, 0)

	-- Create Panel_btnList
	local Panel_btnList = GUI:Layout_Create(ScrollView_1, "Panel_btnList", 1.00, -1.00, 286, 538, false)
	GUI:setAnchorPoint(Panel_btnList, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_btnList, true)
	GUI:setTag(Panel_btnList, 0)

	-- Create Image_title
	local Image_title = GUI:Image_Create(Node_Main, "Image_title", -167.00, 257.00, "res/custom/XiuXian/titleLevel.png")
	GUI:setAnchorPoint(Image_title, 0.00, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, 0)

	-- Create Image_titleLevel
	local Image_titleLevel = GUI:Image_Create(Image_title, "Image_titleLevel", 188.00, -14.00, "res/custom/XiuXian/JingJie/JingJie_1.png")
	GUI:setAnchorPoint(Image_titleLevel, 0.00, 0.00)
	GUI:setTouchEnabled(Image_titleLevel, false)
	GUI:setTag(Image_titleLevel, 0)

	-- Create Image_center
	local Image_center = GUI:Image_Create(Node_Main, "Image_center", -242.00, -186.00, "res/custom/XiuXian/center_bg.png")
	GUI:setAnchorPoint(Image_center, 0.00, 0.00)
	GUI:setTouchEnabled(Image_center, false)
	GUI:setTag(Image_center, 0)

	-- Create Image_attBG
	local Image_attBG = GUI:Image_Create(Node_Main, "Image_attBG", 265.00, -191.00, "res/custom/XiuXian/attBg.png")
	GUI:setAnchorPoint(Image_attBG, 0.00, 0.00)
	GUI:setTouchEnabled(Image_attBG, false)
	GUI:setTag(Image_attBG, 0)

	-- Create Text_att1
	local Text_att1 = GUI:Text_Create(Image_attBG, "Text_att1", 89.00, 285.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att1, false)
	GUI:setTag(Text_att1, 0)
	GUI:Text_enableOutline(Text_att1, "#000000", 2)

	-- Create Text_att2
	local Text_att2 = GUI:Text_Create(Image_attBG, "Text_att2", 89.00, 240.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att2, false)
	GUI:setTag(Text_att2, 0)
	GUI:Text_enableOutline(Text_att2, "#000000", 2)

	-- Create Text_att3
	local Text_att3 = GUI:Text_Create(Image_attBG, "Text_att3", 89.00, 198.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att3, false)
	GUI:setTag(Text_att3, 0)
	GUI:Text_enableOutline(Text_att3, "#000000", 2)

	-- Create Text_att4
	local Text_att4 = GUI:Text_Create(Image_attBG, "Text_att4", 110.00, 156.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att4, false)
	GUI:setTag(Text_att4, 0)
	GUI:Text_enableOutline(Text_att4, "#000000", 2)

	-- Create Text_att5
	local Text_att5 = GUI:Text_Create(Image_attBG, "Text_att5", 131.00, 114.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att5, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att5, false)
	GUI:setTag(Text_att5, 0)
	GUI:Text_enableOutline(Text_att5, "#000000", 2)

	-- Create Text_att6
	local Text_att6 = GUI:Text_Create(Image_attBG, "Text_att6", 132.00, 71.00, 17, "#58f8e7", [[文本]])
	GUI:setAnchorPoint(Text_att6, 0.00, 0.00)
	GUI:setTouchEnabled(Text_att6, false)
	GUI:setTag(Text_att6, 0)
	GUI:Text_enableOutline(Text_att6, "#000000", 2)

	-- Create Image_name
	local Image_name = GUI:Image_Create(Node_Main, "Image_name", 179.00, -159.00, "res/custom/XiuXian/namaList/1.png")
	GUI:setAnchorPoint(Image_name, 0.00, 0.00)
	GUI:setTouchEnabled(Image_name, false)
	GUI:setTag(Image_name, 0)

	-- Create Image_LoadingBar
	local Image_LoadingBar = GUI:Image_Create(Node_Main, "Image_LoadingBar", -238.00, -186.00, "res/custom/XiuXian/jindu_bg.png")
	GUI:setAnchorPoint(Image_LoadingBar, 0.00, 0.00)
	GUI:setTouchEnabled(Image_LoadingBar, false)
	GUI:setTag(Image_LoadingBar, 0)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(Image_LoadingBar, "LoadingBar_1", 19.00, 0.00, "res/custom/XiuXian/jindu.png", 0)
	GUI:LoadingBar_setPercent(LoadingBar_1, 31)
	GUI:LoadingBar_setColor(LoadingBar_1, "#ffffff")
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create Text_LoadingBar
	local Text_LoadingBar = GUI:Text_Create(Image_LoadingBar, "Text_LoadingBar", 236.00, 14.00, 18, "#ffffff", [[1/1000]])
	GUI:setAnchorPoint(Text_LoadingBar, 0.50, 0.50)
	GUI:setTouchEnabled(Text_LoadingBar, false)
	GUI:setTag(Text_LoadingBar, 0)
	GUI:Text_enableOutline(Text_LoadingBar, "#000000", 1)

	-- Create Image_cost
	local Image_cost = GUI:Image_Create(Node_Main, "Image_cost", -176.00, -231.00, "res/custom/XiuXian/costBG.png")
	GUI:setAnchorPoint(Image_cost, 0.00, 0.00)
	GUI:setTouchEnabled(Image_cost, false)
	GUI:setTag(Image_cost, 0)

	-- Create Panel_cost
	local Panel_cost = GUI:Layout_Create(Image_cost, "Panel_cost", 148.00, 7.00, 183, 24, false)
	GUI:setAnchorPoint(Panel_cost, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost, true)
	GUI:setTag(Panel_cost, 0)

	-- Create Button_start
	local Button_start = GUI:Button_Create(Node_Main, "Button_start", -154.00, -315.00, "res/custom/XiuXian/strat_btn.png")
	GUI:Button_setTitleText(Button_start, [[]])
	GUI:Button_setTitleColor(Button_start, "#ffffff")
	GUI:Button_setTitleFontSize(Button_start, 16)
	GUI:Button_titleEnableOutline(Button_start, "#000000", 1)
	GUI:setAnchorPoint(Button_start, 0.00, 0.00)
	GUI:setTouchEnabled(Button_start, true)
	GUI:setTag(Button_start, 0)

	-- Create Image_activate
	local Image_activate = GUI:Image_Create(Node_Main, "Image_activate", -161.00, -281.00, "res/custom/XiuXian/activate.png")
	GUI:setAnchorPoint(Image_activate, 0.00, 0.00)
	GUI:setTouchEnabled(Image_activate, false)
	GUI:setTag(Image_activate, 0)
	GUI:setVisible(Image_activate, false)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
