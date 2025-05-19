local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/YanJiShiHeDaEr/jm.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 797.00, 440.00, 86, 86, false)
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

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(ImageBG, "LoadingBar_1", 529.00, 313.00, "res/custom/JuQing/YanJiShiHeDaEr/exp.png", 0)

	GUI:LoadingBar_setColor(LoadingBar_1, "#ffffff")
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create ExpLooks
	local ExpLooks = GUI:Text_Create(ImageBG, "ExpLooks", 688.00, 323.00, 16, "#00ffff", [[0/10]])
	GUI:setAnchorPoint(ExpLooks, 0.50, 0.50)
	GUI:setTouchEnabled(ExpLooks, false)
	GUI:setTag(ExpLooks, 0)
	GUI:Text_enableOutline(ExpLooks, "#000000", 1)

	-- Create itemlooks_1
	local itemlooks_1 = GUI:Layout_Create(ImageBG, "itemlooks_1", 669.00, 159.00, 60, 60, false)
	GUI:setAnchorPoint(itemlooks_1, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_1, true)
	GUI:setTag(itemlooks_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 633.00, 88.00, "res/custom/JuQing/btn22.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create itemlooks_2
	local itemlooks_2 = GUI:Layout_Create(ImageBG, "itemlooks_2", 397.00, 137.00, 60, 60, false)
	GUI:setAnchorPoint(itemlooks_2, 0.00, 0.00)
	GUI:setTouchEnabled(itemlooks_2, true)
	GUI:setTag(itemlooks_2, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 344.00, 54.00, "res/custom/JuQing/btn17.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
