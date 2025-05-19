local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(parent, "Panel_1", 0.00, 0.00, 200, 22, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Panel_1, "Image_1", 0.00, 0.00, "")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(Image_1, "Text_1", 12.00, 2.00, 14, "#d8d7cb", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(Image_1, "Text_2", 46.00, 2.00, 14, "#c7bb99", [[文本]])
	GUI:setAnchorPoint(Text_2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:setVisible(Text_2, false)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Text_3
	local Text_3 = GUI:Text_Create(Image_1, "Text_3", 150.00, 2.00, 14, "#ebad4c", [[文本]])
	GUI:setAnchorPoint(Text_3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_3, false)
	GUI:setTag(Text_3, 0)
	GUI:Text_enableOutline(Text_3, "#000000", 1)

	ui.update(__data__)
	return Panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
