local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -2.00, -6.00, "res/custom/ChongZhiZhongXin/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 943.00, 447.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create TopUp_Button_1
	local TopUp_Button_1 = GUI:Button_Create(Node_1, "TopUp_Button_1", 268.00, 433.00, "res/custom/public/type2.png")
	GUI:Button_setTitleText(TopUp_Button_1, [[]])
	GUI:Button_setTitleColor(TopUp_Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(TopUp_Button_1, 16)
	GUI:Button_titleEnableOutline(TopUp_Button_1, "#000000", 1)
	GUI:setAnchorPoint(TopUp_Button_1, 0.00, 0.00)
	GUI:setScaleX(TopUp_Button_1, 0.62)
	GUI:setScaleY(TopUp_Button_1, 0.62)
	GUI:setTouchEnabled(TopUp_Button_1, true)
	GUI:setTag(TopUp_Button_1, 0)

	-- Create ZhiFuFangShi1
	local ZhiFuFangShi1 = GUI:Image_Create(TopUp_Button_1, "ZhiFuFangShi1", 77.00, 10.00, "res/custom/public/xz02.png")
	GUI:setAnchorPoint(ZhiFuFangShi1, 0.00, 0.00)
	GUI:setScaleX(ZhiFuFangShi1, 1.50)
	GUI:setScaleY(ZhiFuFangShi1, 1.50)
	GUI:setTouchEnabled(ZhiFuFangShi1, false)
	GUI:setTag(ZhiFuFangShi1, 0)

	-- Create TopUp_Button_2
	local TopUp_Button_2 = GUI:Button_Create(Node_1, "TopUp_Button_2", 338.00, 433.00, "res/custom/public/type3.png")
	GUI:Button_setTitleText(TopUp_Button_2, [[]])
	GUI:Button_setTitleColor(TopUp_Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(TopUp_Button_2, 16)
	GUI:Button_titleEnableOutline(TopUp_Button_2, "#000000", 1)
	GUI:setAnchorPoint(TopUp_Button_2, 0.00, 0.00)
	GUI:setScaleX(TopUp_Button_2, 0.62)
	GUI:setScaleY(TopUp_Button_2, 0.62)
	GUI:setTouchEnabled(TopUp_Button_2, true)
	GUI:setTag(TopUp_Button_2, 0)

	-- Create ZhiFuFangShi2
	local ZhiFuFangShi2 = GUI:Image_Create(TopUp_Button_2, "ZhiFuFangShi2", 77.00, 10.00, "res/custom/public/xz02.png")
	GUI:setAnchorPoint(ZhiFuFangShi2, 0.00, 0.00)
	GUI:setScaleX(ZhiFuFangShi2, 1.50)
	GUI:setScaleY(ZhiFuFangShi2, 1.50)
	GUI:setTouchEnabled(ZhiFuFangShi2, false)
	GUI:setTag(ZhiFuFangShi2, 0)

	-- Create TopUp_Button_3
	local TopUp_Button_3 = GUI:Button_Create(Node_1, "TopUp_Button_3", 408.00, 433.00, "res/custom/public/type1.png")
	GUI:Button_setTitleText(TopUp_Button_3, [[]])
	GUI:Button_setTitleColor(TopUp_Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(TopUp_Button_3, 16)
	GUI:Button_titleEnableOutline(TopUp_Button_3, "#000000", 1)
	GUI:setAnchorPoint(TopUp_Button_3, 0.00, 0.00)
	GUI:setScaleX(TopUp_Button_3, 0.62)
	GUI:setScaleY(TopUp_Button_3, 0.62)
	GUI:setTouchEnabled(TopUp_Button_3, true)
	GUI:setTag(TopUp_Button_3, 0)

	-- Create ZhiFuFangShi3
	local ZhiFuFangShi3 = GUI:Image_Create(TopUp_Button_3, "ZhiFuFangShi3", 75.00, 9.00, "res/custom/public/xz01.png")
	GUI:setAnchorPoint(ZhiFuFangShi3, 0.00, 0.00)
	GUI:setScaleX(ZhiFuFangShi3, 1.50)
	GUI:setScaleY(ZhiFuFangShi3, 1.50)
	GUI:setTouchEnabled(ZhiFuFangShi3, false)
	GUI:setTag(ZhiFuFangShi3, 0)

	-- Create Request_Button
	local Request_Button = GUI:Button_Create(ImageBG, "Request_Button", 812.00, 429.00, "res/custom/ChongZhiZhongXin/an.png")
	GUI:Button_setTitleText(Request_Button, [[]])
	GUI:Button_setTitleColor(Request_Button, "#ffffff")
	GUI:Button_setTitleFontSize(Request_Button, 16)
	GUI:Button_titleEnableOutline(Request_Button, "#000000", 1)
	GUI:setAnchorPoint(Request_Button, 0.00, 0.00)
	GUI:setTouchEnabled(Request_Button, true)
	GUI:setTag(Request_Button, 0)

	-- Create Money_22_Num
	local Money_22_Num = GUI:Text_Create(ImageBG, "Money_22_Num", 730.00, 459.00, 14, "#80ff80", [[0]])
	GUI:setAnchorPoint(Money_22_Num, 0.00, 0.50)
	GUI:setTouchEnabled(Money_22_Num, false)
	GUI:setTag(Money_22_Num, 0)
	GUI:Text_enableOutline(Money_22_Num, "#000000", 1)

	-- Create Money_24_Img
	local Money_24_Img = GUI:Image_Create(ImageBG, "Money_24_Img", 756.00, 25.00, "res/custom/ChongZhiZhongXin/looks.png")
	GUI:setAnchorPoint(Money_24_Img, 0.00, 0.00)
	GUI:setTouchEnabled(Money_24_Img, false)
	GUI:setTag(Money_24_Img, 0)

	-- Create Money_24_Num
	local Money_24_Num = GUI:Text_Create(Money_24_Img, "Money_24_Num", 136.00, 13.00, 15, "#80ff80", [[999999
]])
	GUI:setAnchorPoint(Money_24_Num, 0.50, 0.50)
	GUI:setTouchEnabled(Money_24_Num, false)
	GUI:setTag(Money_24_Num, 0)
	GUI:Text_enableOutline(Money_24_Num, "#000000", 1)

	-- Create ListView_Box
	local ListView_Box = GUI:ListView_Create(ImageBG, "ListView_Box", 135.00, 62.00, 812, 357, 1)
	GUI:ListView_setBounceEnabled(ListView_Box, true)
	GUI:ListView_setGravity(ListView_Box, 2)
	GUI:setAnchorPoint(ListView_Box, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_Box, true)
	GUI:setTag(ListView_Box, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ListView_Box, "Panel_1", -1.50, 181.00, 815, 176, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ListView_Box, "Image_1", -2.00, -75.00, "res/custom/ChongZhiZhongXin/title.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Effect_1
	local Effect_1 = GUI:Effect_Create(Image_1, "Effect_1", 220.00, 50.00, 0, 62205)
	GUI:setTag(Effect_1, 0)

	-- Create Input
	local Input = GUI:TextInput_Create(ImageBG, "Input", 725.00, 428.00, 53, 19, 14)
	GUI:TextInput_setString(Input, "")
	GUI:TextInput_setPlaceHolder(Input, "请输入")
	GUI:TextInput_setFontColor(Input, "#4ae74a")
	GUI:TextInput_setPlaceholderFontColor(Input, "#a6a6a6")
	GUI:TextInput_setInputMode(Input, 2)
	GUI:setAnchorPoint(Input, 0.00, 0.00)
	GUI:setTouchEnabled(Input, true)
	GUI:setTag(Input, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
