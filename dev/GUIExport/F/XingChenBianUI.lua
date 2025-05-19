local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/XingChenBian/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 851.00, 526.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 253.00, 96.00, "res/custom/JuQing/btn57.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setScale(Button_1, 0.80)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create LingQu_Image
	local LingQu_Image = GUI:Image_Create(ImageBG, "LingQu_Image", 258.00, 88.00, "res/custom/NiuMaNiXi/ylq.png")
	GUI:setAnchorPoint(LingQu_Image, 0.00, 0.00)
	GUI:setScale(LingQu_Image, 0.50)
	GUI:setTouchEnabled(LingQu_Image, false)
	GUI:setTag(LingQu_Image, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 530.00, 62.00, "res/custom/JuQing/btn58.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create LevelLooks
	local LevelLooks = GUI:Node_Create(ImageBG, "LevelLooks", 0.00, 0.00)
	GUI:setTag(LevelLooks, 0)

	-- Create LevelLooks_1
	local LevelLooks_1 = GUI:Text_Create(LevelLooks, "LevelLooks_1", 674.00, 472.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_1, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_1, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_1, false)
	GUI:setTag(LevelLooks_1, 0)

	-- Create LevelLooks_2
	local LevelLooks_2 = GUI:Text_Create(LevelLooks, "LevelLooks_2", 797.00, 436.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_2, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_2, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_2, false)
	GUI:setTag(LevelLooks_2, 0)

	-- Create LevelLooks_3
	local LevelLooks_3 = GUI:Text_Create(LevelLooks, "LevelLooks_3", 842.00, 333.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_3, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_3, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_3, false)
	GUI:setTag(LevelLooks_3, 0)

	-- Create LevelLooks_4
	local LevelLooks_4 = GUI:Text_Create(LevelLooks, "LevelLooks_4", 741.00, 265.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_4, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_4, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_4, false)
	GUI:setTag(LevelLooks_4, 0)

	-- Create LevelLooks_5
	local LevelLooks_5 = GUI:Text_Create(LevelLooks, "LevelLooks_5", 605.00, 265.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_5, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_5, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_5, false)
	GUI:setTag(LevelLooks_5, 0)

	-- Create LevelLooks_6
	local LevelLooks_6 = GUI:Text_Create(LevelLooks, "LevelLooks_6", 503.00, 332.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_6, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_6, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_6, false)
	GUI:setTag(LevelLooks_6, 0)

	-- Create LevelLooks_7
	local LevelLooks_7 = GUI:Text_Create(LevelLooks, "LevelLooks_7", 551.00, 436.00, 15, "#00ff00", [[50/50]])
	GUI:Text_enableOutline(LevelLooks_7, "#000000", 1)
	GUI:setAnchorPoint(LevelLooks_7, 0.50, 0.50)
	GUI:setTouchEnabled(LevelLooks_7, false)
	GUI:setTag(LevelLooks_7, 0)

	-- Create AttrLooks
	local AttrLooks = GUI:Node_Create(ImageBG, "AttrLooks", 0.00, 0.00)
	GUI:setTag(AttrLooks, 0)

	-- Create AttrLooks_1
	local AttrLooks_1 = GUI:Text_Create(AttrLooks, "AttrLooks_1", 296.00, 483.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_1, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_1, false)
	GUI:setTag(AttrLooks_1, 0)

	-- Create AttrLooks_2
	local AttrLooks_2 = GUI:Text_Create(AttrLooks, "AttrLooks_2", 296.00, 449.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_2, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_2, false)
	GUI:setTag(AttrLooks_2, 0)

	-- Create AttrLooks_3
	local AttrLooks_3 = GUI:Text_Create(AttrLooks, "AttrLooks_3", 296.00, 415.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_3, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_3, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_3, false)
	GUI:setTag(AttrLooks_3, 0)

	-- Create AttrLooks_4
	local AttrLooks_4 = GUI:Text_Create(AttrLooks, "AttrLooks_4", 296.00, 381.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_4, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_4, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_4, false)
	GUI:setTag(AttrLooks_4, 0)

	-- Create AttrLooks_5
	local AttrLooks_5 = GUI:Text_Create(AttrLooks, "AttrLooks_5", 296.00, 347.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_5, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_5, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_5, false)
	GUI:setTag(AttrLooks_5, 0)

	-- Create AttrLooks_6
	local AttrLooks_6 = GUI:Text_Create(AttrLooks, "AttrLooks_6", 296.00, 313.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_6, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_6, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_6, false)
	GUI:setTag(AttrLooks_6, 0)

	-- Create AttrLooks_7
	local AttrLooks_7 = GUI:Text_Create(AttrLooks, "AttrLooks_7", 296.00, 279.00, 17, "#00ff00", [[5000-5000]])
	GUI:Text_enableOutline(AttrLooks_7, "#000000", 1)
	GUI:setAnchorPoint(AttrLooks_7, 0.00, 0.00)
	GUI:setTouchEnabled(AttrLooks_7, false)
	GUI:setTag(AttrLooks_7, 0)

	-- Create CostLayout
	local CostLayout = GUI:Layout_Create(ImageBG, "CostLayout", 565.00, 149.00, 200, 60, false)
	GUI:setAnchorPoint(CostLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CostLayout, true)
	GUI:setTag(CostLayout, 0)

	-- Create AwardLayout
	local AwardLayout = GUI:Layout_Create(ImageBG, "AwardLayout", 245.00, 161.00, 186, 60, false)
	GUI:setAnchorPoint(AwardLayout, 0.00, 0.00)
	GUI:setTouchEnabled(AwardLayout, true)
	GUI:setTag(AwardLayout, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
