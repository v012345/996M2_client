local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 150.00, 34.00, "res/custom/ZhenBaoHe/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 369.00, 185.00, "res/public/1900000511.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000510.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 55.00, 28.00, 278, 160, false)
	GUI:setAnchorPoint(Layout, 0.00, 0.00)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(Layout, "EquipShow", 7.00, 88.00, 71, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow)
	GUI:setAnchorPoint(EquipShow, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow, false)
	GUI:setTag(EquipShow, -1)

	-- Create EquipShow_1
	local EquipShow_1 = GUI:EquipShow_Create(Layout, "EquipShow_1", 107.00, 88.00, 72, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow_1)
	GUI:setAnchorPoint(EquipShow_1, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow_1, false)
	GUI:setTag(EquipShow_1, -1)

	-- Create EquipShow_2
	local EquipShow_2 = GUI:EquipShow_Create(Layout, "EquipShow_2", 205.00, 89.00, 73, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow_2)
	GUI:setAnchorPoint(EquipShow_2, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow_2, false)
	GUI:setTag(EquipShow_2, -1)

	-- Create EquipShow_3
	local EquipShow_3 = GUI:EquipShow_Create(Layout, "EquipShow_3", 8.00, 7.00, 74, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow_3)
	GUI:setAnchorPoint(EquipShow_3, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow_3, false)
	GUI:setTag(EquipShow_3, -1)

	-- Create EquipShow_4
	local EquipShow_4 = GUI:EquipShow_Create(Layout, "EquipShow_4", 106.00, 7.00, 75, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow_4)
	GUI:setAnchorPoint(EquipShow_4, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow_4, false)
	GUI:setTag(EquipShow_4, -1)

	-- Create EquipShow_5
	local EquipShow_5 = GUI:EquipShow_Create(Layout, "EquipShow_5", 205.00, 8.00, 76, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = true})
	GUI:EquipShow_setAutoUpdate(EquipShow_5)
	GUI:setAnchorPoint(EquipShow_5, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow_5, false)
	GUI:setTag(EquipShow_5, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
