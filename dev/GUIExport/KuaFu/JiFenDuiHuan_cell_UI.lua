local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create item_list_bg
	local item_list_bg = GUI:Image_Create(parent, "item_list_bg", 0.00, 0.00, "res/custom/JiFenDuiHuan/item_bg.png")
	GUI:setAnchorPoint(item_list_bg, 0.00, 0.00)
	GUI:setTouchEnabled(item_list_bg, false)
	GUI:setTag(item_list_bg, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(item_list_bg, "Button_1", 21.00, 15.00, "res/custom/JiFenDuiHuan/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Text_title
	local Text_title = GUI:Text_Create(item_list_bg, "Text_title", 67.00, 161.00, 15, "#efdd61", [[-]])
	GUI:setAnchorPoint(Text_title, 0.50, 0.00)
	GUI:setTouchEnabled(Text_title, false)
	GUI:setTag(Text_title, 0)
	GUI:Text_enableOutline(Text_title, "#000000", 1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(item_list_bg, "Panel_1", 35.00, 94.00, 56, 56, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(item_list_bg, "Text_1", 67.00, 77.00, 14, "#80ff00", [[-]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(item_list_bg, "Text_2", 67.00, 55.00, 16, "#ffffff", [[-]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	ui.update(__data__)
	return item_list_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
