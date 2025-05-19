local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(parent, "Panel_1", 0.00, 0.00, 670, 46, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Panel_1, "Text_1", 53.00, 12.00, 18, "#ecda3e", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_1_1
	local Text_1_1 = GUI:Text_Create(Panel_1, "Text_1_1", 305.00, 12.00, 18, "#ecda3e", [[文本]])
	GUI:setAnchorPoint(Text_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1_1, false)
	GUI:setTag(Text_1_1, 0)
	GUI:Text_enableOutline(Text_1_1, "#000000", 1)

	-- Create Panel_give
	local Panel_give = GUI:Layout_Create(Panel_1, "Panel_give", 551.00, 5.00, 41, 38, false)
	GUI:setAnchorPoint(Panel_give, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_give, true)
	GUI:setTag(Panel_give, 0)

	ui.update(__data__)
	return Panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
