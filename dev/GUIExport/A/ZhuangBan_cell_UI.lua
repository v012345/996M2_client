local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(parent, "Panel_1", 0.00, 0.00, 142, 224, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Panel_1, "Button_1", 0.00, 0.00, "res/custom/ZhuangBan/shizhuang_cell.png")
	GUI:Button_loadTexturePressed(Button_1, "res/custom/ZhuangBan/shizhuang_cell.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 12)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_1, "Text_1", 72.00, 198.00, 14, "#ffffff", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	ui.update(__data__)
	return Panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
