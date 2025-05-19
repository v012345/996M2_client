local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/jilushi/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 984.00, 450.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 18.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(ImageBG, "Panel_1", 256.00, 374.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create name_1
	local name_1 = GUI:Text_Create(Panel_1, "name_1", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_1, 0.50, 0.50)
	GUI:setTouchEnabled(name_1, false)
	GUI:setTag(name_1, 0)
	GUI:Text_enableOutline(name_1, "#000000", 1)

	-- Create xylooks_1
	local xylooks_1 = GUI:Text_Create(Panel_1, "xylooks_1", 345.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_1, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_1, false)
	GUI:setTag(xylooks_1, 0)
	GUI:Text_enableOutline(xylooks_1, "#000000", 1)

	-- Create Record_1
	local Record_1 = GUI:Button_Create(Panel_1, "Record_1", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_1, [[]])
	GUI:Button_setTitleColor(Record_1, "#ffffff")
	GUI:Button_setTitleFontSize(Record_1, 16)
	GUI:Button_titleEnableOutline(Record_1, "#000000", 1)
	GUI:setAnchorPoint(Record_1, 0.00, 0.00)
	GUI:setTouchEnabled(Record_1, true)
	GUI:setTag(Record_1, 0)

	-- Create Move_1
	local Move_1 = GUI:Button_Create(Panel_1, "Move_1", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_1, [[]])
	GUI:Button_setTitleColor(Move_1, "#ffffff")
	GUI:Button_setTitleFontSize(Move_1, 16)
	GUI:Button_titleEnableOutline(Move_1, "#000000", 1)
	GUI:setAnchorPoint(Move_1, 0.00, 0.00)
	GUI:setTouchEnabled(Move_1, true)
	GUI:setTag(Move_1, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(ImageBG, "Panel_2", 256.00, 313.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create name_2
	local name_2 = GUI:Text_Create(Panel_2, "name_2", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_2, 0.50, 0.50)
	GUI:setTouchEnabled(name_2, false)
	GUI:setTag(name_2, 0)
	GUI:Text_enableOutline(name_2, "#000000", 1)

	-- Create xylooks_2
	local xylooks_2 = GUI:Text_Create(Panel_2, "xylooks_2", 346.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_2, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_2, false)
	GUI:setTag(xylooks_2, 0)
	GUI:Text_enableOutline(xylooks_2, "#000000", 1)

	-- Create Record_2
	local Record_2 = GUI:Button_Create(Panel_2, "Record_2", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_2, [[]])
	GUI:Button_setTitleColor(Record_2, "#ffffff")
	GUI:Button_setTitleFontSize(Record_2, 16)
	GUI:Button_titleEnableOutline(Record_2, "#000000", 1)
	GUI:setAnchorPoint(Record_2, 0.00, 0.00)
	GUI:setTouchEnabled(Record_2, true)
	GUI:setTag(Record_2, 0)

	-- Create Move_2
	local Move_2 = GUI:Button_Create(Panel_2, "Move_2", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_2, [[]])
	GUI:Button_setTitleColor(Move_2, "#ffffff")
	GUI:Button_setTitleFontSize(Move_2, 16)
	GUI:Button_titleEnableOutline(Move_2, "#000000", 1)
	GUI:setAnchorPoint(Move_2, 0.00, 0.00)
	GUI:setTouchEnabled(Move_2, true)
	GUI:setTag(Move_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(ImageBG, "Panel_3", 256.00, 252.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create name_3
	local name_3 = GUI:Text_Create(Panel_3, "name_3", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_3, 0.50, 0.50)
	GUI:setTouchEnabled(name_3, false)
	GUI:setTag(name_3, 0)
	GUI:Text_enableOutline(name_3, "#000000", 1)

	-- Create xylooks_3
	local xylooks_3 = GUI:Text_Create(Panel_3, "xylooks_3", 346.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_3, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_3, false)
	GUI:setTag(xylooks_3, 0)
	GUI:Text_enableOutline(xylooks_3, "#000000", 1)

	-- Create Record_3
	local Record_3 = GUI:Button_Create(Panel_3, "Record_3", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_3, [[]])
	GUI:Button_setTitleColor(Record_3, "#ffffff")
	GUI:Button_setTitleFontSize(Record_3, 16)
	GUI:Button_titleEnableOutline(Record_3, "#000000", 1)
	GUI:setAnchorPoint(Record_3, 0.00, 0.00)
	GUI:setTouchEnabled(Record_3, true)
	GUI:setTag(Record_3, 0)

	-- Create Move_3
	local Move_3 = GUI:Button_Create(Panel_3, "Move_3", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_3, [[]])
	GUI:Button_setTitleColor(Move_3, "#ffffff")
	GUI:Button_setTitleFontSize(Move_3, 16)
	GUI:Button_titleEnableOutline(Move_3, "#000000", 1)
	GUI:setAnchorPoint(Move_3, 0.00, 0.00)
	GUI:setTouchEnabled(Move_3, true)
	GUI:setTag(Move_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(ImageBG, "Panel_4", 256.00, 191.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create name_4
	local name_4 = GUI:Text_Create(Panel_4, "name_4", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_4, 0.50, 0.50)
	GUI:setTouchEnabled(name_4, false)
	GUI:setTag(name_4, 0)
	GUI:Text_enableOutline(name_4, "#000000", 1)

	-- Create xylooks_4
	local xylooks_4 = GUI:Text_Create(Panel_4, "xylooks_4", 346.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_4, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_4, false)
	GUI:setTag(xylooks_4, 0)
	GUI:Text_enableOutline(xylooks_4, "#000000", 1)

	-- Create Record_4
	local Record_4 = GUI:Button_Create(Panel_4, "Record_4", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_4, [[]])
	GUI:Button_setTitleColor(Record_4, "#ffffff")
	GUI:Button_setTitleFontSize(Record_4, 16)
	GUI:Button_titleEnableOutline(Record_4, "#000000", 1)
	GUI:setAnchorPoint(Record_4, 0.00, 0.00)
	GUI:setTouchEnabled(Record_4, true)
	GUI:setTag(Record_4, 0)

	-- Create Move_4
	local Move_4 = GUI:Button_Create(Panel_4, "Move_4", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_4, [[]])
	GUI:Button_setTitleColor(Move_4, "#ffffff")
	GUI:Button_setTitleFontSize(Move_4, 16)
	GUI:Button_titleEnableOutline(Move_4, "#000000", 1)
	GUI:setAnchorPoint(Move_4, 0.00, 0.00)
	GUI:setTouchEnabled(Move_4, true)
	GUI:setTag(Move_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(ImageBG, "Panel_5", 256.00, 130.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create name_5
	local name_5 = GUI:Text_Create(Panel_5, "name_5", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_5, 0.50, 0.50)
	GUI:setTouchEnabled(name_5, false)
	GUI:setTag(name_5, 0)
	GUI:Text_enableOutline(name_5, "#000000", 1)

	-- Create xylooks_5
	local xylooks_5 = GUI:Text_Create(Panel_5, "xylooks_5", 346.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_5, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_5, false)
	GUI:setTag(xylooks_5, 0)
	GUI:Text_enableOutline(xylooks_5, "#000000", 1)

	-- Create Record_5
	local Record_5 = GUI:Button_Create(Panel_5, "Record_5", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_5, [[]])
	GUI:Button_setTitleColor(Record_5, "#ffffff")
	GUI:Button_setTitleFontSize(Record_5, 16)
	GUI:Button_titleEnableOutline(Record_5, "#000000", 1)
	GUI:setAnchorPoint(Record_5, 0.00, 0.00)
	GUI:setTouchEnabled(Record_5, true)
	GUI:setTag(Record_5, 0)

	-- Create Move_5
	local Move_5 = GUI:Button_Create(Panel_5, "Move_5", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_5, [[]])
	GUI:Button_setTitleColor(Move_5, "#ffffff")
	GUI:Button_setTitleFontSize(Move_5, 16)
	GUI:Button_titleEnableOutline(Move_5, "#000000", 1)
	GUI:setAnchorPoint(Move_5, 0.00, 0.00)
	GUI:setTouchEnabled(Move_5, true)
	GUI:setTag(Move_5, 0)

	-- Create Panel_6
	local Panel_6 = GUI:Layout_Create(ImageBG, "Panel_6", 256.00, 69.00, 724, 48, false)
	GUI:setAnchorPoint(Panel_6, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_6, true)
	GUI:setTag(Panel_6, 0)

	-- Create name_6
	local name_6 = GUI:Text_Create(Panel_6, "name_6", 104.00, 24.00, 17, "#ffff00", [[未记录]])
	GUI:setAnchorPoint(name_6, 0.50, 0.50)
	GUI:setTouchEnabled(name_6, false)
	GUI:setTag(name_6, 0)
	GUI:Text_enableOutline(name_6, "#000000", 1)

	-- Create xylooks_6
	local xylooks_6 = GUI:Text_Create(Panel_6, "xylooks_6", 346.00, 24.00, 17, "#00ff00", [==========[[0,0]]==========])
	GUI:setAnchorPoint(xylooks_6, 0.50, 0.50)
	GUI:setTouchEnabled(xylooks_6, false)
	GUI:setTag(xylooks_6, 0)
	GUI:Text_enableOutline(xylooks_6, "#000000", 1)

	-- Create Record_6
	local Record_6 = GUI:Button_Create(Panel_6, "Record_6", 438.00, 1.00, "res/custom/jilushi/an_02.png")
	GUI:Button_setTitleText(Record_6, [[]])
	GUI:Button_setTitleColor(Record_6, "#ffffff")
	GUI:Button_setTitleFontSize(Record_6, 16)
	GUI:Button_titleEnableOutline(Record_6, "#000000", 1)
	GUI:setAnchorPoint(Record_6, 0.00, 0.00)
	GUI:setTouchEnabled(Record_6, true)
	GUI:setTag(Record_6, 0)

	-- Create Move_6
	local Move_6 = GUI:Button_Create(Panel_6, "Move_6", 581.00, 1.00, "res/custom/jilushi/an_01.png")
	GUI:Button_setTitleText(Move_6, [[]])
	GUI:Button_setTitleColor(Move_6, "#ffffff")
	GUI:Button_setTitleFontSize(Move_6, 16)
	GUI:Button_titleEnableOutline(Move_6, "#000000", 1)
	GUI:setAnchorPoint(Move_6, 0.00, 0.00)
	GUI:setTouchEnabled(Move_6, true)
	GUI:setTag(Move_6, 0)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
