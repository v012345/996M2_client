local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create listBG
	local listBG = GUI:Image_Create(parent, "listBG", 0.00, 0.00, "res/custom/ChaoShenGe/listbg.png")
	GUI:setAnchorPoint(listBG, 0.00, 0.00)
	GUI:setTouchEnabled(listBG, false)
	GUI:setTag(listBG, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(listBG, "Panel_1", 50.00, 117.00, 68, 68, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(listBG, "Text_1", 84.00, 201.00, 18, "#eacd5e", [[文本]])
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)
	GUI:Text_enableOutline(Text_1, "#000000", 1)

	-- Create Text_2
	local Text_2 = GUI:Text_Create(listBG, "Text_2", 81.00, 56.00, 18, "#1ae5e7", [[文本]])
	GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	GUI:setTouchEnabled(Text_2, false)
	GUI:setTag(Text_2, 0)
	GUI:Text_enableOutline(Text_2, "#000000", 1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(listBG, "Button_1", 18.00, 6.00, "res/custom/ChaoShenGe/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	ui.update(__data__)
	return listBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
