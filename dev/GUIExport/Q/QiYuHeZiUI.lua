local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 6.00, 1.00, "res/custom/shiguanghuishuo/jm_01.png")
	GUI:setChineseName(ImageBG, "奇遇盒子")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 874.00, 366.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create SeitchLayout
	local SeitchLayout = GUI:Layout_Create(ImageBG, "SeitchLayout", 270.00, 61.00, 232, 54, false)
	GUI:setAnchorPoint(SeitchLayout, 0.00, 0.00)
	GUI:setTouchEnabled(SeitchLayout, true)
	GUI:setTag(SeitchLayout, 0)

	-- Create SeitchButton
	local SeitchButton = GUI:Button_Create(SeitchLayout, "SeitchButton", 0.00, 11.00, "res/custom/shiguanghuishuo/swicth02.png")
	GUI:Button_setTitleText(SeitchButton, [[]])
	GUI:Button_setTitleColor(SeitchButton, "#ffffff")
	GUI:Button_setTitleFontSize(SeitchButton, 16)
	GUI:Button_titleEnableOutline(SeitchButton, "#000000", 1)
	GUI:setAnchorPoint(SeitchButton, 0.00, 0.00)
	GUI:setTouchEnabled(SeitchButton, true)
	GUI:setTag(SeitchButton, 0)

	-- Create Event_Button_1
	local Event_Button_1 = GUI:Button_Create(ImageBG, "Event_Button_1", 539.00, 352.00, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
	GUI:Button_setTitleText(Event_Button_1, [[]])
	GUI:Button_setTitleColor(Event_Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Event_Button_1, 16)
	GUI:Button_titleEnableOutline(Event_Button_1, "#000000", 1)
	GUI:setAnchorPoint(Event_Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Event_Button_1, true)
	GUI:setTag(Event_Button_1, 0)

	-- Create Event_Button_2
	local Event_Button_2 = GUI:Button_Create(ImageBG, "Event_Button_2", 578.00, 282.00, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
	GUI:Button_setTitleText(Event_Button_2, [[]])
	GUI:Button_setTitleColor(Event_Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Event_Button_2, 16)
	GUI:Button_titleEnableOutline(Event_Button_2, "#000000", 1)
	GUI:setAnchorPoint(Event_Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Event_Button_2, true)
	GUI:setTag(Event_Button_2, 0)

	-- Create Event_Button_3
	local Event_Button_3 = GUI:Button_Create(ImageBG, "Event_Button_3", 618.00, 212.00, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
	GUI:Button_setTitleText(Event_Button_3, [[]])
	GUI:Button_setTitleColor(Event_Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Event_Button_3, 16)
	GUI:Button_titleEnableOutline(Event_Button_3, "#000000", 1)
	GUI:setAnchorPoint(Event_Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Event_Button_3, true)
	GUI:setTag(Event_Button_3, 0)

	-- Create Event_Button_4
	local Event_Button_4 = GUI:Button_Create(ImageBG, "Event_Button_4", 578.00, 142.00, "res/custom/shiguanghuishuo/eventimg/btn_lock.png")
	GUI:Button_setTitleText(Event_Button_4, [[]])
	GUI:Button_setTitleColor(Event_Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Event_Button_4, 16)
	GUI:Button_titleEnableOutline(Event_Button_4, "#000000", 1)
	GUI:setAnchorPoint(Event_Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Event_Button_4, true)
	GUI:setTag(Event_Button_4, 0)

	-- Create Event_Button_5
	local Event_Button_5 = GUI:Button_Create(ImageBG, "Event_Button_5", 539.00, 72.00, "res/custom/shiguanghuishuo/eventimg/btn_lock.png")
	GUI:Button_setTitleText(Event_Button_5, [[]])
	GUI:Button_setTitleColor(Event_Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Event_Button_5, 16)
	GUI:Button_titleEnableOutline(Event_Button_5, "#000000", 1)
	GUI:setAnchorPoint(Event_Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Event_Button_5, true)
	GUI:setTag(Event_Button_5, 0)

	-- Create DelAll
	local DelAll = GUI:Button_Create(ImageBG, "DelAll", 741.00, 42.00, "res/custom/shiguanghuishuo/qkan.png")
	GUI:Button_setTitleText(DelAll, [[]])
	GUI:Button_setTitleColor(DelAll, "#ffffff")
	GUI:Button_setTitleFontSize(DelAll, 16)
	GUI:Button_titleEnableOutline(DelAll, "#000000", 1)
	GUI:setAnchorPoint(DelAll, 0.00, 0.00)
	GUI:setTouchEnabled(DelAll, true)
	GUI:setTag(DelAll, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
