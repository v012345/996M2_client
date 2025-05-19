local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 1.00, 1.00, "res/custom/CaiLiaoHuoZhan/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 753.00, 310.00, 86, 86, false)
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

	-- Create BuyUllooks
	local BuyUllooks = GUI:Text_Create(ImageBG, "BuyUllooks", 595.00, 284.00, 18, "#00ff00", [[25]])
	GUI:setAnchorPoint(BuyUllooks, 0.00, 0.00)
	GUI:setTouchEnabled(BuyUllooks, false)
	GUI:setTag(BuyUllooks, 0)
	GUI:Text_enableOutline(BuyUllooks, "#000000", 1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 435.00, 65.00, 376, 216, 2)
	GUI:ListView_setBounceEnabled(ListView_1, true)
	GUI:ListView_setGravity(ListView_1, 3)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
