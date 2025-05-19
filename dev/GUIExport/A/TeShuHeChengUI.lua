local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 32.00, 16.00, "res/custom/teshuhecheng/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 954.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
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
	local LeftBtnList = GUI:Layout_Create(ImageBG, "LeftBtnList", 145.00, 25.00, 192, 442, false)
	GUI:setAnchorPoint(LeftBtnList, 0.00, 0.00)
	GUI:setTouchEnabled(LeftBtnList, false)
	GUI:setTag(LeftBtnList, -1)

	-- Create Left_btn_1
	local Left_btn_1 = GUI:Button_Create(LeftBtnList, "Left_btn_1", 1.00, 399.00, "res/custom/teshuhecheng/left_btn_1_1.png")
	GUI:Button_loadTexturePressed(Left_btn_1, "res/custom/teshuhecheng/left_btn_1_2.png")
	GUI:Button_loadTextureDisabled(Left_btn_1, "res/custom/teshuhecheng/left_btn_1_2.png")
	GUI:Button_setTitleText(Left_btn_1, [[]])
	GUI:Button_setTitleColor(Left_btn_1, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_1, 16)
	GUI:Button_titleEnableOutline(Left_btn_1, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_1, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_1, true)
	GUI:setTag(Left_btn_1, -1)

	-- Create Left_btn_2
	local Left_btn_2 = GUI:Button_Create(LeftBtnList, "Left_btn_2", 1.00, 358.00, "res/custom/teshuhecheng/left_btn_2_1.png")
	GUI:Button_loadTexturePressed(Left_btn_2, "res/custom/teshuhecheng/left_btn_2_2.png")
	GUI:Button_loadTextureDisabled(Left_btn_2, "res/custom/teshuhecheng/left_btn_2_2.png")
	GUI:Button_setTitleText(Left_btn_2, [[]])
	GUI:Button_setTitleColor(Left_btn_2, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_2, 16)
	GUI:Button_titleEnableOutline(Left_btn_2, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_2, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_2, true)
	GUI:setTag(Left_btn_2, -1)

	-- Create Left_btn_3
	local Left_btn_3 = GUI:Button_Create(LeftBtnList, "Left_btn_3", 1.00, 317.00, "res/custom/teshuhecheng/left_btn_3_1.png")
	GUI:Button_loadTexturePressed(Left_btn_3, "res/custom/teshuhecheng/left_btn_3_2.png")
	GUI:Button_loadTextureDisabled(Left_btn_3, "res/custom/teshuhecheng/left_btn_3_2.png")
	GUI:Button_setTitleText(Left_btn_3, [[]])
	GUI:Button_setTitleColor(Left_btn_3, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_3, 16)
	GUI:Button_titleEnableOutline(Left_btn_3, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_3, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_3, true)
	GUI:setTag(Left_btn_3, -1)

	-- Create Left_btn_4
	local Left_btn_4 = GUI:Button_Create(LeftBtnList, "Left_btn_4", 1.00, 275.00, "res/custom/teshuhecheng/left_btn_4_1.png")
	GUI:Button_loadTexturePressed(Left_btn_4, "res/custom/teshuhecheng/left_btn_4_2.png")
	GUI:Button_loadTextureDisabled(Left_btn_4, "res/custom/teshuhecheng/left_btn_4_2.png")
	GUI:Button_setTitleText(Left_btn_4, [[]])
	GUI:Button_setTitleColor(Left_btn_4, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_4, 16)
	GUI:Button_titleEnableOutline(Left_btn_4, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_4, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_4, true)
	GUI:setTag(Left_btn_4, -1)

	-- Create Left_btn_5
	local Left_btn_5 = GUI:Button_Create(LeftBtnList, "Left_btn_5", 1.00, 233.00, "res/custom/teshuhecheng/left_btn_5_1.png")
	GUI:Button_loadTexturePressed(Left_btn_5, "res/custom/teshuhecheng/left_btn_5_2.png")
	GUI:Button_loadTextureDisabled(Left_btn_5, "res/custom/teshuhecheng/left_btn_5_2.png")
	GUI:Button_setTitleText(Left_btn_5, [[]])
	GUI:Button_setTitleColor(Left_btn_5, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_5, 16)
	GUI:Button_titleEnableOutline(Left_btn_5, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_5, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_5, true)
	GUI:setTag(Left_btn_5, -1)

	-- Create Left_Btn_Child
	local Left_Btn_Child = GUI:Layout_Create(ImageBG, "Left_Btn_Child", 344.00, 29.00, 158, 442, false)
	GUI:setAnchorPoint(Left_Btn_Child, 0.00, 0.00)
	GUI:setTouchEnabled(Left_Btn_Child, false)
	GUI:setTag(Left_Btn_Child, -1)

	-- Create Left_btn_Child_1
	local Left_btn_Child_1 = GUI:Button_Create(Left_Btn_Child, "Left_btn_Child_1", 1.00, 399.00, "res/custom/teshuhecheng/1/btn1.png")
	GUI:Button_setTitleText(Left_btn_Child_1, [[]])
	GUI:Button_setTitleColor(Left_btn_Child_1, "#ffffff")
	GUI:Button_setTitleFontSize(Left_btn_Child_1, 16)
	GUI:Button_titleEnableOutline(Left_btn_Child_1, "#000000", 1)
	GUI:setAnchorPoint(Left_btn_Child_1, 0.00, 0.00)
	GUI:setTouchEnabled(Left_btn_Child_1, true)
	GUI:setTag(Left_btn_Child_1, -1)

	-- Create NodeRight
	local NodeRight = GUI:Node_Create(ImageBG, "NodeRight", 0.00, 0.00)
	GUI:setAnchorPoint(NodeRight, 0.00, 0.00)
	GUI:setTag(NodeRight, -1)

	-- Create CostList
	local CostList = GUI:Layout_Create(NodeRight, "CostList", 541.00, 320.00, 360, 60, false)
	GUI:setAnchorPoint(CostList, 0.00, 0.00)
	GUI:setTouchEnabled(CostList, false)
	GUI:setTag(CostList, -1)

	-- Create GiveShow
	local GiveShow = GUI:Layout_Create(NodeRight, "GiveShow", 699.00, 164.00, 60, 60, false)
	GUI:setAnchorPoint(GiveShow, 0.00, 0.00)
	GUI:setTouchEnabled(GiveShow, false)
	GUI:setTag(GiveShow, -1)

	-- Create ButtonGo
	local ButtonGo = GUI:Button_Create(NodeRight, "ButtonGo", 647.00, 49.00, "res/custom/public/hebtn.png")
	GUI:Button_setTitleText(ButtonGo, [[]])
	GUI:Button_setTitleColor(ButtonGo, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGo, 14)
	GUI:Button_titleEnableOutline(ButtonGo, "#000000", 1)
	GUI:setAnchorPoint(ButtonGo, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonGo, true)
	GUI:setTag(ButtonGo, -1)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
