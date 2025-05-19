local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", -1.00, 0.00, "res/custom/JuQing/HaFaXiSiChengHao/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 945.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/custom/ceshijilu/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ListView_All
	local ListView_All = GUI:ListView_Create(ImageBG, "ListView_All", 137.00, 24.00, 294, 443, 1)
	GUI:setAnchorPoint(ListView_All, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_All, true)
	GUI:setTag(ListView_All, 0)

	-- Create AttLooks
	local AttLooks = GUI:Node_Create(ImageBG, "AttLooks", 613.00, 435.00)
	GUI:setTag(AttLooks, 0)

	-- Create Att_GongJi
	local Att_GongJi = GUI:Text_Create(AttLooks, "Att_GongJi", 74.00, -35.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_GongJi, "#000000", 1)
	GUI:setAnchorPoint(Att_GongJi, 0.50, 0.50)
	GUI:setTouchEnabled(Att_GongJi, false)
	GUI:setTag(Att_GongJi, 0)

	-- Create Att_MoFa
	local Att_MoFa = GUI:Text_Create(AttLooks, "Att_MoFa", 75.00, -62.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_MoFa, "#000000", 1)
	GUI:setAnchorPoint(Att_MoFa, 0.50, 0.50)
	GUI:setTouchEnabled(Att_MoFa, false)
	GUI:setTag(Att_MoFa, 0)

	-- Create Att_DaoShu
	local Att_DaoShu = GUI:Text_Create(AttLooks, "Att_DaoShu", 74.00, -90.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_DaoShu, "#000000", 1)
	GUI:setAnchorPoint(Att_DaoShu, 0.50, 0.50)
	GUI:setTouchEnabled(Att_DaoShu, false)
	GUI:setTag(Att_DaoShu, 0)

	-- Create Att_HPZhi
	local Att_HPZhi = GUI:Text_Create(AttLooks, "Att_HPZhi", 74.00, -116.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_HPZhi, "#000000", 1)
	GUI:setAnchorPoint(Att_HPZhi, 0.50, 0.50)
	GUI:setTouchEnabled(Att_HPZhi, false)
	GUI:setTag(Att_HPZhi, 0)

	-- Create Att_MPZhi
	local Att_MPZhi = GUI:Text_Create(AttLooks, "Att_MPZhi", 74.00, -144.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_MPZhi, "#000000", 1)
	GUI:setAnchorPoint(Att_MPZhi, 0.50, 0.50)
	GUI:setTouchEnabled(Att_MPZhi, false)
	GUI:setTag(Att_MPZhi, 0)

	-- Create Att_AllAttr
	local Att_AllAttr = GUI:Text_Create(AttLooks, "Att_AllAttr", 74.00, -170.00, 16, "#00ff00", [[攻击
]])
	GUI:Text_enableOutline(Att_AllAttr, "#000000", 1)
	GUI:setAnchorPoint(Att_AllAttr, 0.50, 0.50)
	GUI:setTouchEnabled(Att_AllAttr, false)
	GUI:setTag(Att_AllAttr, 0)

	-- Create ItemLooks
	local ItemLooks = GUI:Layout_Create(ImageBG, "ItemLooks", 514.00, 128.00, 297, 62, false)
	GUI:setAnchorPoint(ItemLooks, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks, true)
	GUI:setTag(ItemLooks, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 588.00, 37.00, "res/custom/JuQing/HaFaXiSiChengHao/button_ask.png")
	GUI:Button_setTitleText(Button_1, [[ ]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
