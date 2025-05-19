local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/BaDaLu/ShengRenFaXiang/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 900.00, 496.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ItemShow
	local ItemShow = GUI:Layout_Create(ImageBG, "ItemShow", 479.00, 181.00, 171, 60, false)
	GUI:setAnchorPoint(ItemShow, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow, true)
	GUI:setTag(ItemShow, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 429.00, 25.00, "res/custom/BaDaLu/button2.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create ImageAll
	local ImageAll = GUI:Node_Create(ImageBG, "ImageAll", 0.00, -19.00)
	GUI:setTag(ImageAll, 0)

	-- Create state_1_1
	local state_1_1 = GUI:Image_Create(ImageAll, "state_1_1", 74.00, 322.00, "res/custom/BaDaLu/ShengRenFaXiang/state_1_1.png")
	GUI:setAnchorPoint(state_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(state_1_1, false)
	GUI:setTag(state_1_1, 0)
	GUI:setVisible(state_1_1, false)

	-- Create state_1_2
	local state_1_2 = GUI:Image_Create(ImageAll, "state_1_2", 74.00, 322.00, "res/custom/BaDaLu/ShengRenFaXiang/state_1_2.png")
	GUI:setAnchorPoint(state_1_2, 0.00, 0.00)
	GUI:setTouchEnabled(state_1_2, false)
	GUI:setTag(state_1_2, 0)
	GUI:setVisible(state_1_2, false)

	-- Create Effect_1
	local Effect_1 = GUI:Effect_Create(state_1_2, "Effect_1", 117.00, 148.00, 0, 41001, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(state_1_2, "Image_1", 71.00, 18.00, "res/custom/BaDaLu/ShengRenFaXiang/name_1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create state_2_1
	local state_2_1 = GUI:Image_Create(ImageAll, "state_2_1", 708.00, 323.00, "res/custom/BaDaLu/ShengRenFaXiang/state_2_1.png")
	GUI:setAnchorPoint(state_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(state_2_1, false)
	GUI:setTag(state_2_1, 0)
	GUI:setVisible(state_2_1, false)

	-- Create state_2_2
	local state_2_2 = GUI:Image_Create(ImageAll, "state_2_2", 708.00, 323.00, "res/custom/BaDaLu/ShengRenFaXiang/state_2_2.png")
	GUI:setAnchorPoint(state_2_2, 0.00, 0.00)
	GUI:setTouchEnabled(state_2_2, false)
	GUI:setTag(state_2_2, 0)
	GUI:setVisible(state_2_2, false)

	-- Create Effect_1
	Effect_1 = GUI:Effect_Create(state_2_2, "Effect_1", 117.00, 148.00, 0, 41001, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(state_2_2, "Image_1", 71.00, 18.00, "res/custom/BaDaLu/ShengRenFaXiang/name_2.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create state_3_1
	local state_3_1 = GUI:Image_Create(ImageAll, "state_3_1", 74.00, 37.00, "res/custom/BaDaLu/ShengRenFaXiang/state_3_1.png")
	GUI:setAnchorPoint(state_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(state_3_1, false)
	GUI:setTag(state_3_1, 0)
	GUI:setVisible(state_3_1, false)

	-- Create state_3_2
	local state_3_2 = GUI:Image_Create(ImageAll, "state_3_2", 74.00, 37.00, "res/custom/BaDaLu/ShengRenFaXiang/state_3_2.png")
	GUI:setAnchorPoint(state_3_2, 0.00, 0.00)
	GUI:setTouchEnabled(state_3_2, false)
	GUI:setTag(state_3_2, 0)
	GUI:setVisible(state_3_2, false)

	-- Create Effect_1
	Effect_1 = GUI:Effect_Create(state_3_2, "Effect_1", 117.00, 148.00, 0, 41001, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(state_3_2, "Image_1", 71.00, 18.00, "res/custom/BaDaLu/ShengRenFaXiang/name_3.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create state_4_1
	local state_4_1 = GUI:Image_Create(ImageAll, "state_4_1", 708.00, 26.00, "res/custom/BaDaLu/ShengRenFaXiang/state_4_1.png")
	GUI:setAnchorPoint(state_4_1, 0.00, 0.00)
	GUI:setTouchEnabled(state_4_1, false)
	GUI:setTag(state_4_1, 0)
	GUI:setVisible(state_4_1, false)

	-- Create state_4_2
	local state_4_2 = GUI:Image_Create(ImageAll, "state_4_2", 708.00, 26.00, "res/custom/BaDaLu/ShengRenFaXiang/state_4_2.png")
	GUI:setAnchorPoint(state_4_2, 0.00, 0.00)
	GUI:setTouchEnabled(state_4_2, false)
	GUI:setTag(state_4_2, 0)
	GUI:setVisible(state_4_2, false)

	-- Create Effect_1
	Effect_1 = GUI:Effect_Create(state_4_2, "Effect_1", 117.00, 148.00, 0, 41001, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(state_4_2, "Image_1", 71.00, 18.00, "res/custom/BaDaLu/ShengRenFaXiang/name_4.png")
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
