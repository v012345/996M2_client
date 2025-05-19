local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 175.00, 140.00, "res/custom/ZhenBaoHe/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 352.00, 179.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 19.00, 13.00, "res/public/1900000511.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000510.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 55.00, 28.00, 278.00, 160.00, false)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(Layout, "EquipShow", 7.00, 88.00, 71, false, {doubleTakeOff = true, look = true, bgVisible = false, noMouseTips = false, movable = true})
	GUI:setTag(EquipShow, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow)

	-- Create EquipShow_1
	local EquipShow_1 = GUI:EquipShow_Create(Layout, "EquipShow_1", 107.00, 88.00, 72, false, {doubleTakeOff = true, look = true, movable = true, noMouseTips = false, bgVisible = false})
	GUI:setTag(EquipShow_1, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_1)

	-- Create EquipShow_2
	local EquipShow_2 = GUI:EquipShow_Create(Layout, "EquipShow_2", 205.00, 89.00, 73, false, {doubleTakeOff = true, look = true, bgVisible = false, noMouseTips = false, movable = true})
	GUI:setTag(EquipShow_2, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_2)

	-- Create EquipShow_3
	local EquipShow_3 = GUI:EquipShow_Create(Layout, "EquipShow_3", 8.00, 7.00, 74, false, {doubleTakeOff = true, look = true, movable = true, noMouseTips = false, bgVisible = false})
	GUI:setTag(EquipShow_3, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_3)

	-- Create EquipShow_4
	local EquipShow_4 = GUI:EquipShow_Create(Layout, "EquipShow_4", 106.00, 7.00, 75, false, {doubleTakeOff = true, look = true, bgVisible = false, noMouseTips = false, movable = true})
	GUI:setTag(EquipShow_4, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_4)

	-- Create EquipShow_5
	local EquipShow_5 = GUI:EquipShow_Create(Layout, "EquipShow_5", 205.00, 8.00, 76, false, {doubleTakeOff = true, look = true, movable = true, noMouseTips = false, bgVisible = false})
	GUI:setTag(EquipShow_5, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_5)
end
return ui