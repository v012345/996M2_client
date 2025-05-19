local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(parent, "Panel_1", 0.00, 0.00, 100, 110, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_titile
	local Image_titile = GUI:Image_Create(Panel_1, "Image_titile", 50.00, 99.00, "res/custom/JinJiZhiMen/itemName/4/title_6.png")
	GUI:setAnchorPoint(Image_titile, 0.50, 0.50)
	GUI:setTouchEnabled(Image_titile, false)
	GUI:setTag(Image_titile, 0)

	-- Create Panel_item
	local Panel_item = GUI:Layout_Create(Panel_1, "Panel_item", 17.00, 37.00, 63, 47, false)
	GUI:setAnchorPoint(Panel_item, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_item, true)
	GUI:setTag(Panel_item, 0)

	-- Create Button_jiHuo
	local Button_jiHuo = GUI:Button_Create(Panel_1, "Button_jiHuo", 10.00, -1.00, "res/custom/JinJiZhiMen/jihuo_btn.png")
	GUI:Button_setTitleText(Button_jiHuo, [[]])
	GUI:Button_setTitleColor(Button_jiHuo, "#ffffff")
	GUI:Button_setTitleFontSize(Button_jiHuo, 16)
	GUI:Button_titleEnableOutline(Button_jiHuo, "#000000", 1)
	GUI:setAnchorPoint(Button_jiHuo, 0.00, 0.00)
	GUI:setTouchEnabled(Button_jiHuo, true)
	GUI:setTag(Button_jiHuo, 0)

	if __data__ then ui.update(__data__) end
	return Panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
