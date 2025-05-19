local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 49.00, 19.00, "res/custom/jinengqianghua/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 953.00, 445.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 19.00, 17.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create LeftBtnList
	local LeftBtnList = GUI:Layout_Create(ImageBG, "LeftBtnList", 145.00, 25.00, 194, 442, false)
	GUI:setAnchorPoint(LeftBtnList, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtnList, false)
	GUI:setTag(LeftBtnList, -1)

	-- Create LeftBtn_1
	local LeftBtn_1 = GUI:Button_Create(LeftBtnList, "LeftBtn_1", -1.00, 376.00, "res/custom/jinengqianghua/2_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_1, "res/custom/jinengqianghua/2_1.png")
	GUI:Button_loadTextureDisabled(LeftBtn_1, "res/custom/jinengqianghua/2_2.png")
	GUI:Button_setTitleText(LeftBtn_1, [[]])
	GUI:Button_setTitleColor(LeftBtn_1, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_1, 16)
	GUI:Button_titleEnableOutline(LeftBtn_1, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_1, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_1, true)
	GUI:setTag(LeftBtn_1, -1)

	-- Create LeftBtn_2
	local LeftBtn_2 = GUI:Button_Create(LeftBtnList, "LeftBtn_2", -1.00, 309.00, "res/custom/jinengqianghua/3_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_2, "res/custom/jinengqianghua/3_2.png")
	GUI:Button_loadTextureDisabled(LeftBtn_2, "res/custom/jinengqianghua/3_2.png")
	GUI:Button_setTitleText(LeftBtn_2, [[]])
	GUI:Button_setTitleColor(LeftBtn_2, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_2, 16)
	GUI:Button_titleEnableOutline(LeftBtn_2, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_2, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_2, true)
	GUI:setTag(LeftBtn_2, -1)

	-- Create LeftBtn_3
	local LeftBtn_3 = GUI:Button_Create(LeftBtnList, "LeftBtn_3", -1.00, 242.00, "res/custom/jinengqianghua/9_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_3, "res/custom/jinengqianghua/9_2.png")
	GUI:Button_loadTextureDisabled(LeftBtn_3, "res/custom/jinengqianghua/9_2.png")
	GUI:Button_setTitleText(LeftBtn_3, [[]])
	GUI:Button_setTitleColor(LeftBtn_3, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_3, 16)
	GUI:Button_titleEnableOutline(LeftBtn_3, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_3, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_3, true)
	GUI:setTag(LeftBtn_3, -1)

	-- Create LeftBtn_4
	local LeftBtn_4 = GUI:Button_Create(LeftBtnList, "LeftBtn_4", -1.00, 175.00, "res/custom/jinengqianghua/4_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_4, "res/custom/jinengqianghua/4_2.png")
	GUI:Button_loadTextureDisabled(LeftBtn_4, "res/custom/jinengqianghua/4_2.png")
	GUI:Button_setTitleText(LeftBtn_4, [[]])
	GUI:Button_setTitleColor(LeftBtn_4, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_4, 16)
	GUI:Button_titleEnableOutline(LeftBtn_4, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_4, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_4, true)
	GUI:setTag(LeftBtn_4, -1)

	-- Create LeftBtn_5
	local LeftBtn_5 = GUI:Button_Create(LeftBtnList, "LeftBtn_5", -1.00, 108.00, "res/custom/jinengqianghua/7_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_5, "res/custom/jinengqianghua/7_2.png")
	GUI:Button_loadTextureDisabled(LeftBtn_5, "res/custom/jinengqianghua/7_2.png")
	GUI:Button_setTitleText(LeftBtn_5, [[]])
	GUI:Button_setTitleColor(LeftBtn_5, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_5, 16)
	GUI:Button_titleEnableOutline(LeftBtn_5, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_5, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_5, true)
	GUI:setTag(LeftBtn_5, -1)

	-- Create LeftBtn_6
	local LeftBtn_6 = GUI:Button_Create(LeftBtnList, "LeftBtn_6", 0.00, 41.00, "res/custom/jinengqianghua/6_1.png")
	GUI:Button_loadTexturePressed(LeftBtn_6, "res/custom/jinengqianghua/6_2.png")
	GUI:Button_loadTextureDisabled(LeftBtn_6, "res/custom/jinengqianghua/6_2.png")
	GUI:Button_setTitleText(LeftBtn_6, [[]])
	GUI:Button_setTitleColor(LeftBtn_6, "#ffffff")
	GUI:Button_setTitleFontSize(LeftBtn_6, 16)
	GUI:Button_titleEnableOutline(LeftBtn_6, "#000000", 1)
	GUI:setAnchorPoint(LeftBtn_6, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtn_6, true)
	GUI:setTag(LeftBtn_6, -1)

	-- Create NodeRight
	local NodeRight = GUI:Node_Create(ImageBG, "NodeRight", 0.00, 0.00)
	GUI:setTag(NodeRight, -1)

	-- Create ImageViewYanshi
	local ImageViewYanshi = GUI:Image_Create(NodeRight, "ImageViewYanshi", 559.00, 424.00, "res/custom/jinengqianghua/yanshi.png")
	GUI:setAnchorPoint(ImageViewYanshi, 0.00, 0.00)
	GUI:setTouchEnabled(ImageViewYanshi, false)
	GUI:setTag(ImageViewYanshi, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(NodeRight, "ImageView", 380.00, 207.00, "res/custom/jinengqianghua/top.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Text
	local Text = GUI:Text_Create(ImageView, "Text", 179.00, 30.00, 16, "#00ff00", [[威力：2%]])
	GUI:setAnchorPoint(Text, 0.00, 0.00)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(ImageView, "Text_1", 355.00, 31.00, 16, "#00ff00", [[点击查看隐藏属性]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, true)
	GUI:setTag(Text_1, -1)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create NodeModel
	local NodeModel = GUI:Node_Create(ImageView, "NodeModel", 0.00, 0.00)
	GUI:setTag(NodeModel, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(NodeRight, "ImageView_1", 444.00, 195.00, "res/custom/jinengqianghua/000002.png")
	GUI:setAnchorPoint(ImageView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(NodeRight, "LayoutCost", 551.00, 129.00, 176, 60, false)
	GUI:setAnchorPoint(LayoutCost, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)

	-- Create ButtonGo
	local ButtonGo = GUI:Button_Create(NodeRight, "ButtonGo", 562.00, 62.00, "res/custom/jinengqianghua/bnt1.png")
	GUI:Button_setTitleText(ButtonGo, [[]])
	GUI:Button_setTitleColor(ButtonGo, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGo, 16)
	GUI:Button_titleEnableOutline(ButtonGo, "#000000", 1)
	GUI:setAnchorPoint(ButtonGo, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonGo, true)
	GUI:setTag(ButtonGo, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 488.00, 27.00, "res/custom/jinengqianghua/tips.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
