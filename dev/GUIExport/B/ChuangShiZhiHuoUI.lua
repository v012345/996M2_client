local ui = {}



function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 148.00, 33.00, "res/public/1900000610.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 756.00, 469.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 14.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create EquipShow_01
	local EquipShow_01 = GUI:EquipShow_Create(ImageBG, "EquipShow_01", 54.00, 398.00, 1, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_01, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_01)

	-- Create EquipShow_02
	local EquipShow_02 = GUI:EquipShow_Create(ImageBG, "EquipShow_02", 54.00, 323.00, 0, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_02, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_02)

	-- Create EquipShow_03
	local EquipShow_03 = GUI:EquipShow_Create(ImageBG, "EquipShow_03", 54.00, 248.00, 6, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_03, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_03)

	-- Create EquipShow_04
	local EquipShow_04 = GUI:EquipShow_Create(ImageBG, "EquipShow_04", 54.00, 173.00, 8, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_04, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_04)

	-- Create EquipShow_05
	local EquipShow_05 = GUI:EquipShow_Create(ImageBG, "EquipShow_05", 54.00, 98.00, 10, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_05, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_05)

	-- Create EquipShow_06
	local EquipShow_06 = GUI:EquipShow_Create(ImageBG, "EquipShow_06", 329.00, 398.00, 4, false, {bgVisible = true, starLv = true, look = true})
	GUI:setTag(EquipShow_06, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_06)

	-- Create EquipShow_07
	local EquipShow_07 = GUI:EquipShow_Create(ImageBG, "EquipShow_07", 329.00, 323.00, 3, false, {bgVisible = false, starLv = true, look = true})
	GUI:setTag(EquipShow_07, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_07)

	-- Create EquipShow_08
	local EquipShow_08 = GUI:EquipShow_Create(ImageBG, "EquipShow_08", 329.00, 248.00, 5, false, {bgVisible = false, starLv = true, look = true})
	GUI:setTag(EquipShow_08, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_08)

	-- Create EquipShow_09
	local EquipShow_09 = GUI:EquipShow_Create(ImageBG, "EquipShow_09", 329.00, 173.00, 7, false, {bgVisible = false, starLv = true, look = true})
	GUI:setTag(EquipShow_09, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_09)

	-- Create EquipShow_10
	local EquipShow_10 = GUI:EquipShow_Create(ImageBG, "EquipShow_10", 329.00, 98.00, 11, false, {bgVisible = false, starLv = true, look = true})
	GUI:setTag(EquipShow_10, -1)
	GUI:EquipShow_setAutoUpdate(EquipShow_10)

	-- Create Layout_01
	local Layout_01 = GUI:Layout_Create(ImageBG, "Layout_01", 54.00, 399.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_01, false)
	GUI:setTag(Layout_01, -1)

	-- Create Layout_02
	local Layout_02 = GUI:Layout_Create(ImageBG, "Layout_02", 54.00, 323.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_02, false)
	GUI:setTag(Layout_02, -1)

	-- Create Layout_03
	local Layout_03 = GUI:Layout_Create(ImageBG, "Layout_03", 54.00, 248.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_03, false)
	GUI:setTag(Layout_03, -1)

	-- Create Layout_04
	local Layout_04 = GUI:Layout_Create(ImageBG, "Layout_04", 54.00, 173.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_04, false)
	GUI:setTag(Layout_04, -1)

	-- Create Layout_05
	local Layout_05 = GUI:Layout_Create(ImageBG, "Layout_05", 54.00, 98.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_05, false)
	GUI:setTag(Layout_05, -1)

	-- Create Layout_06
	local Layout_06 = GUI:Layout_Create(ImageBG, "Layout_06", 329.00, 399.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_06, false)
	GUI:setTag(Layout_06, -1)

	-- Create Layout_07
	local Layout_07 = GUI:Layout_Create(ImageBG, "Layout_07", 329.00, 323.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_07, false)
	GUI:setTag(Layout_07, -1)

	-- Create Layout_08
	local Layout_08 = GUI:Layout_Create(ImageBG, "Layout_08", 329.00, 248.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_08, false)
	GUI:setTag(Layout_08, -1)

	-- Create Layout_09
	local Layout_09 = GUI:Layout_Create(ImageBG, "Layout_09", 329.00, 173.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_09, false)
	GUI:setTag(Layout_09, -1)

	-- Create Layout_10
	local Layout_10 = GUI:Layout_Create(ImageBG, "Layout_10", 329.00, 98.00, 64.00, 64.00, false)
	GUI:setTouchEnabled(Layout_10, false)
	GUI:setTag(Layout_10, -1)

	-- Create Button
	local Button = GUI:Button_Create(ImageBG, "Button", 524.00, 68.00, "res/public/00000361.png")
	GUI:Button_setTitleText(Button, "")
	GUI:Button_setTitleColor(Button, "#ffffff")
	GUI:Button_setTitleFontSize(Button, 14)
	GUI:Button_titleEnableOutline(Button, "#000000", 1)
	GUI:Win_SetParam(Button, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button, true)
	GUI:setTag(Button, -1)

	-- Create itemname1
	local itemname1 = GUI:Text_Create(ImageBG, "itemname1", 482.00, 430.00, 16, "#ffffff", [[绿水晶]])
	GUI:setTouchEnabled(itemname1, false)
	GUI:setTag(itemname1, -1)
	GUI:Text_enableOutline(itemname1, "#000000", 1)

	-- Create itemlooks1
	local itemlooks1 = GUI:Text_Create(itemname1, "itemlooks1", 65.00, 0.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(itemlooks1, false)
	GUI:setTag(itemlooks1, -1)
	GUI:Text_enableOutline(itemlooks1, "#000000", 1)

	-- Create itemname2
	local itemname2 = GUI:Text_Create(ImageBG, "itemname2", 482.00, 378.00, 16, "#ffffff", [[晶    石]])
	GUI:setTouchEnabled(itemname2, false)
	GUI:setTag(itemname2, -1)
	GUI:Text_enableOutline(itemname2, "#000000", 1)

	-- Create itemlooks2
	local itemlooks2 = GUI:Text_Create(itemname2, "itemlooks2", 65.00, 0.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(itemlooks2, false)
	GUI:setTag(itemlooks2, -1)
	GUI:Text_enableOutline(itemlooks2, "#000000", 1)

	-- Create moneyname
	local moneyname = GUI:Text_Create(ImageBG, "moneyname", 482.00, 326.00, 16, "#ffffff", [[金    币]])
	GUI:setTouchEnabled(moneyname, false)
	GUI:setTag(moneyname, -1)
	GUI:Text_enableOutline(moneyname, "#000000", 1)

	-- Create moneylooks
	local moneylooks = GUI:Text_Create(moneyname, "moneylooks", 65.00, 0.00, 16, "#ffffff", [[文本]])
	GUI:setTouchEnabled(moneylooks, false)
	GUI:setTag(moneylooks, -1)
	GUI:Text_enableOutline(moneylooks, "#000000", 1)
end

return ui