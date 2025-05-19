local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 121.00, 57.00, "res/custom/DianFengDengJi/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 969.00, 460.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 599.00, 27.00, "res/custom/DianFengDengJi/btn1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 772.00, 27.00, "res/custom/DianFengDengJi/btn2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 736.00, 136.00, 97, 46, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 192.00, 171.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)
	GUI:setVisible(Image_1, false)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_1, "Image_2", 179.00, 237.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)
	GUI:setVisible(Image_2, false)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_1, "Image_3", 194.00, 308.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)
	GUI:setVisible(Image_3, false)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_1, "Image_4", 243.00, 373.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)
	GUI:setVisible(Image_4, false)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_1, "Image_5", 314.00, 404.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)
	GUI:setVisible(Image_5, false)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Node_1, "Image_6", 387.00, 405.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)
	GUI:setVisible(Image_6, false)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(Node_1, "Image_7", 457.00, 373.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)
	GUI:setVisible(Image_7, false)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(Node_1, "Image_8", 505.00, 308.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)
	GUI:setVisible(Image_8, false)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(Node_1, "Image_9", 521.00, 237.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_9, 0.00, 0.00)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 0)
	GUI:setVisible(Image_9, false)

	-- Create Image_10
	local Image_10 = GUI:Image_Create(Node_1, "Image_10", 507.00, 172.00, "res/custom/DianFengDengJi/dl1.png")
	GUI:setAnchorPoint(Image_10, 0.00, 0.00)
	GUI:setTouchEnabled(Image_10, false)
	GUI:setTag(Image_10, 0)
	GUI:setVisible(Image_10, false)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 457.00, 31.00, 71, 66, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Text_curr
	local Text_curr = GUI:Text_Create(ImageBG, "Text_curr", 380.00, 145.00, 28, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_curr, 0.50, 0.50)
	GUI:setTouchEnabled(Text_curr, false)
	GUI:setTag(Text_curr, 0)
	GUI:Text_enableOutline(Text_curr, "#000000", 1)

	-- Create Image_11
	local Image_11 = GUI:Image_Create(ImageBG, "Image_11", 214.00, 474.00, "res/custom/DianFengDengJi/title1.png")
	GUI:setAnchorPoint(Image_11, 0.00, 0.00)
	GUI:setTouchEnabled(Image_11, false)
	GUI:setTag(Image_11, 0)

	-- Create Text_currLevelMax
	local Text_currLevelMax = GUI:Text_Create(ImageBG, "Text_currLevelMax", 785.00, 413.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_currLevelMax, 0.00, 0.00)
	GUI:setTouchEnabled(Text_currLevelMax, false)
	GUI:setTag(Text_currLevelMax, 0)
	GUI:Text_enableOutline(Text_currLevelMax, "#000000", 1)

	-- Create Text_nextLevelMax
	local Text_nextLevelMax = GUI:Text_Create(ImageBG, "Text_nextLevelMax", 785.00, 290.00, 16, "#00ff00", [[文本]])
	GUI:setAnchorPoint(Text_nextLevelMax, 0.00, 0.00)
	GUI:setTouchEnabled(Text_nextLevelMax, false)
	GUI:setTag(Text_nextLevelMax, 0)
	GUI:Text_enableOutline(Text_nextLevelMax, "#000000", 1)

	-- Create Panel_currAtt
	local Panel_currAtt = GUI:Layout_Create(ImageBG, "Panel_currAtt", 682.00, 352.00, 165, 25, false)
	GUI:setAnchorPoint(Panel_currAtt, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_currAtt, true)
	GUI:setTag(Panel_currAtt, 0)

	-- Create Panel_nextAtt
	local Panel_nextAtt = GUI:Layout_Create(ImageBG, "Panel_nextAtt", 778.00, 228.00, 166, 25, false)
	GUI:setAnchorPoint(Panel_nextAtt, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_nextAtt, true)
	GUI:setTag(Panel_nextAtt, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
