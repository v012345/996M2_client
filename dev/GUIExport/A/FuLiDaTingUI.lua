local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 2.00, 1.00, "res/custom/fulidating/7/bgk1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create close
	local close = GUI:Button_Create(ImageBG, "close", 963.00, 458.00, "res/custom/fulidating/close.png")
	GUI:Button_setTitleText(close, [[]])
	GUI:Button_setTitleColor(close, "#ffffff")
	GUI:Button_setTitleFontSize(close, 14)
	GUI:Button_titleEnableOutline(close, "#000000", 1)
	GUI:setAnchorPoint(close, 0.00, 0.00)
	GUI:setTouchEnabled(close, true)
	GUI:setTag(close, -1)

	-- Create leftLayout
	local leftLayout = GUI:Layout_Create(ImageBG, "leftLayout", 135.00, 20.00, 201, 446, false)
	GUI:setAnchorPoint(leftLayout, 0.00, 0.00)
	GUI:setTouchEnabled(leftLayout, true)
	GUI:setTag(leftLayout, 0)

	-- Create btn1
	local btn1 = GUI:Button_Create(leftLayout, "btn1", 0.00, 383.00, "res/custom/fulidating/tab_1_1.png")
	GUI:Button_setTitleText(btn1, [[]])
	GUI:Button_setTitleColor(btn1, "#ffffff")
	GUI:Button_setTitleFontSize(btn1, 16)
	GUI:Button_titleEnableOutline(btn1, "#000000", 1)
	GUI:setAnchorPoint(btn1, 0.00, 0.00)
	GUI:setTouchEnabled(btn1, true)
	GUI:setTag(btn1, 0)

	-- Create btn2
	local btn2 = GUI:Button_Create(leftLayout, "btn2", 0.00, 321.00, "res/custom/fulidating/tab_2_1.png")
	GUI:Button_setTitleText(btn2, [[]])
	GUI:Button_setTitleColor(btn2, "#ffffff")
	GUI:Button_setTitleFontSize(btn2, 16)
	GUI:Button_titleEnableOutline(btn2, "#000000", 1)
	GUI:setAnchorPoint(btn2, 0.00, 0.00)
	GUI:setTouchEnabled(btn2, true)
	GUI:setTag(btn2, 0)

	-- Create btn3
	local btn3 = GUI:Button_Create(leftLayout, "btn3", 0.00, 259.00, "res/custom/fulidating/tab_3_1.png")
	GUI:Button_setTitleText(btn3, [[]])
	GUI:Button_setTitleColor(btn3, "#ffffff")
	GUI:Button_setTitleFontSize(btn3, 16)
	GUI:Button_titleEnableOutline(btn3, "#000000", 1)
	GUI:setAnchorPoint(btn3, 0.00, 0.00)
	GUI:setTouchEnabled(btn3, true)
	GUI:setTag(btn3, 0)

	-- Create btn4
	local btn4 = GUI:Button_Create(leftLayout, "btn4", 0.00, 197.00, "res/custom/fulidating/tab_4_1.png")
	GUI:Button_setTitleText(btn4, [[]])
	GUI:Button_setTitleColor(btn4, "#ffffff")
	GUI:Button_setTitleFontSize(btn4, 16)
	GUI:Button_titleEnableOutline(btn4, "#000000", 1)
	GUI:setAnchorPoint(btn4, 0.00, 0.00)
	GUI:setTouchEnabled(btn4, true)
	GUI:setTag(btn4, 0)

	-- Create btn5
	local btn5 = GUI:Button_Create(leftLayout, "btn5", 0.00, 135.00, "res/custom/fulidating/tab_5_1.png")
	GUI:Button_setTitleText(btn5, [[]])
	GUI:Button_setTitleColor(btn5, "#ffffff")
	GUI:Button_setTitleFontSize(btn5, 16)
	GUI:Button_titleEnableOutline(btn5, "#000000", 1)
	GUI:setAnchorPoint(btn5, 0.00, 0.00)
	GUI:setTouchEnabled(btn5, true)
	GUI:setTag(btn5, 0)

	-- Create btn6
	local btn6 = GUI:Button_Create(leftLayout, "btn6", 0.00, 73.00, "res/custom/fulidating/tab_6_1.png")
	GUI:Button_setTitleText(btn6, [[]])
	GUI:Button_setTitleColor(btn6, "#ffffff")
	GUI:Button_setTitleFontSize(btn6, 16)
	GUI:Button_titleEnableOutline(btn6, "#000000", 1)
	GUI:setAnchorPoint(btn6, 0.00, 0.00)
	GUI:setTouchEnabled(btn6, true)
	GUI:setTag(btn6, 0)

	-- Create btn7
	local btn7 = GUI:Button_Create(leftLayout, "btn7", 0.00, 11.00, "res/custom/fulidating/tab_7_1.png")
	GUI:Button_setTitleText(btn7, [[]])
	GUI:Button_setTitleColor(btn7, "#ffffff")
	GUI:Button_setTitleFontSize(btn7, 16)
	GUI:Button_titleEnableOutline(btn7, "#000000", 1)
	GUI:setAnchorPoint(btn7, 0.00, 0.00)
	GUI:setTouchEnabled(btn7, true)
	GUI:setTag(btn7, 0)

	-- Create rightLayout1
	local rightLayout1 = GUI:Layout_Create(ImageBG, "rightLayout1", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout1, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout1, true)
	GUI:setTag(rightLayout1, 0)
	GUI:setVisible(rightLayout1, false)

	-- Create Text_1
	local Text_1 = GUI:Text_Create(rightLayout1, "Text_1", 525.00, 384.00, 16, "#4ce218", [[1]])
	GUI:Text_enableOutline(Text_1, "#000000", 1)
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)

	-- Create List
	local List = GUI:Layout_Create(rightLayout1, "List", 3.00, 1.00, 601, 365, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create list1
	local list1 = GUI:Image_Create(List, "list1", 0.00, 293.00, "res/custom/fulidating/1/list.png")
	GUI:setAnchorPoint(list1, 0.00, 0.00)
	GUI:setTouchEnabled(list1, false)
	GUI:setTag(list1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(list1, "Image_1", 131.00, 35.00, "res/custom/fulidating/1/1.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(list1, "Button_1", 515.00, 37.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create over
	local over = GUI:Text_Create(list1, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create ItemShow
	local ItemShow = GUI:ItemShow_Create(list1, "ItemShow", 376.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow, 0.50, 0.50)
	GUI:setTag(ItemShow, 0)

	-- Create list2
	local list2 = GUI:Image_Create(List, "list2", 0.00, 221.00, "res/custom/fulidating/1/list.png")
	GUI:setAnchorPoint(list2, 0.00, 0.00)
	GUI:setTouchEnabled(list2, false)
	GUI:setTag(list2, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(list2, "Image_1", 131.00, 35.00, "res/custom/fulidating/1/2.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list2, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create over
	over = GUI:Text_Create(list2, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create ItemShow
	ItemShow = GUI:ItemShow_Create(list2, "ItemShow", 376.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow, 0.50, 0.50)
	GUI:setTag(ItemShow, 0)

	-- Create list3
	local list3 = GUI:Image_Create(List, "list3", 0.00, 149.00, "res/custom/fulidating/1/list.png")
	GUI:setAnchorPoint(list3, 0.00, 0.00)
	GUI:setTouchEnabled(list3, false)
	GUI:setTag(list3, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(list3, "Image_1", 131.00, 35.00, "res/custom/fulidating/1/3.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list3, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create over
	over = GUI:Text_Create(list3, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create ItemShow
	ItemShow = GUI:ItemShow_Create(list3, "ItemShow", 376.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow, 0.50, 0.50)
	GUI:setTag(ItemShow, 0)

	-- Create list4
	local list4 = GUI:Image_Create(List, "list4", 0.00, 77.00, "res/custom/fulidating/1/list.png")
	GUI:setAnchorPoint(list4, 0.00, 0.00)
	GUI:setTouchEnabled(list4, false)
	GUI:setTag(list4, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(list4, "Image_1", 131.00, 35.00, "res/custom/fulidating/1/4.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list4, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create over
	over = GUI:Text_Create(list4, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create ItemShow
	ItemShow = GUI:ItemShow_Create(list4, "ItemShow", 376.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow, 0.50, 0.50)
	GUI:setTag(ItemShow, 0)

	-- Create list5
	local list5 = GUI:Image_Create(List, "list5", 0.00, 5.00, "res/custom/fulidating/1/list.png")
	GUI:setAnchorPoint(list5, 0.00, 0.00)
	GUI:setTouchEnabled(list5, false)
	GUI:setTag(list5, 0)

	-- Create Image_1
	Image_1 = GUI:Image_Create(list5, "Image_1", 131.00, 35.00, "res/custom/fulidating/1/5.png")
	GUI:setAnchorPoint(Image_1, 0.50, 0.50)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list5, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create over
	over = GUI:Text_Create(list5, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create ItemShow
	ItemShow = GUI:ItemShow_Create(list5, "ItemShow", 376.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow, 0.50, 0.50)
	GUI:setTag(ItemShow, 0)

	-- Create rightLayout2
	local rightLayout2 = GUI:Layout_Create(ImageBG, "rightLayout2", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout2, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout2, true)
	GUI:setTag(rightLayout2, 0)
	GUI:setVisible(rightLayout2, false)

	-- Create Text_1
	Text_1 = GUI:Text_Create(rightLayout2, "Text_1", 525.00, 384.00, 16, "#4ce218", [[1]])
	GUI:Text_enableOutline(Text_1, "#000000", 1)
	GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	GUI:setTouchEnabled(Text_1, false)
	GUI:setTag(Text_1, 0)

	-- Create List
	List = GUI:Layout_Create(rightLayout2, "List", 3.00, 2.00, 601, 365, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create list1
	list1 = GUI:Image_Create(List, "list1", 0.00, 293.00, "res/custom/fulidating/2/1.png")
	GUI:setAnchorPoint(list1, 0.00, 0.00)
	GUI:setTouchEnabled(list1, false)
	GUI:setTag(list1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list1, "Button_1", 515.00, 35.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	local item = GUI:ItemShow_Create(list1, "item", 375.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create over
	over = GUI:Text_Create(list1, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list2
	list2 = GUI:Image_Create(List, "list2", 0.00, 221.00, "res/custom/fulidating/2/2.png")
	GUI:setAnchorPoint(list2, 0.00, 0.00)
	GUI:setTouchEnabled(list2, false)
	GUI:setTag(list2, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list2, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list2, "item", 375.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create over
	over = GUI:Text_Create(list2, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list3
	list3 = GUI:Image_Create(List, "list3", 0.00, 149.00, "res/custom/fulidating/2/3.png")
	GUI:setAnchorPoint(list3, 0.00, 0.00)
	GUI:setTouchEnabled(list3, false)
	GUI:setTag(list3, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list3, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list3, "item", 375.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create over
	over = GUI:Text_Create(list3, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list4
	list4 = GUI:Image_Create(List, "list4", 0.00, 77.00, "res/custom/fulidating/2/4.png")
	GUI:setAnchorPoint(list4, 0.00, 0.00)
	GUI:setTouchEnabled(list4, false)
	GUI:setTag(list4, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list4, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list4, "item", 375.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create over
	over = GUI:Text_Create(list4, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list5
	list5 = GUI:Image_Create(List, "list5", 0.00, 5.00, "res/custom/fulidating/2/5.png")
	GUI:setAnchorPoint(list5, 0.00, 0.00)
	GUI:setTouchEnabled(list5, false)
	GUI:setTag(list5, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list5, "Button_1", 515.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list5, "item", 375.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create over
	over = GUI:Text_Create(list5, "over", 477.00, 23.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create rightLayout3
	local rightLayout3 = GUI:Layout_Create(ImageBG, "rightLayout3", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout3, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout3, true)
	GUI:setTag(rightLayout3, 0)
	GUI:setVisible(rightLayout3, false)

	-- Create List
	List = GUI:Layout_Create(rightLayout3, "List", 0.00, 0.00, 607, 368, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create list1
	list1 = GUI:Image_Create(List, "list1", 0.00, 293.00, "res/custom/fulidating/3/1.png")
	GUI:setAnchorPoint(list1, 0.00, 0.00)
	GUI:setTouchEnabled(list1, false)
	GUI:setTag(list1, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list1, "Button_1", 530.00, 35.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list1, "item", 289.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create num
	local num = GUI:Text_Create(list1, "num", 435.00, 28.00, 18, "#4ce218", [[文本]])
	GUI:Text_enableOutline(num, "#000000", 1)
	GUI:setAnchorPoint(num, 0.50, 0.00)
	GUI:setTouchEnabled(num, false)
	GUI:setTag(num, 0)

	-- Create over
	over = GUI:Text_Create(list1, "over", 488.00, 21.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list2
	list2 = GUI:Image_Create(List, "list2", 0.00, 221.00, "res/custom/fulidating/3/2.png")
	GUI:setAnchorPoint(list2, 0.00, 0.00)
	GUI:setTouchEnabled(list2, false)
	GUI:setTag(list2, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list2, "Button_1", 530.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list2, "item", 290.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create num
	num = GUI:Text_Create(list2, "num", 435.00, 28.00, 18, "#4ce218", [[文本]])
	GUI:Text_enableOutline(num, "#000000", 1)
	GUI:setAnchorPoint(num, 0.50, 0.00)
	GUI:setTouchEnabled(num, false)
	GUI:setTag(num, 0)

	-- Create over
	over = GUI:Text_Create(list2, "over", 488.00, 21.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list3
	list3 = GUI:Image_Create(List, "list3", 0.00, 149.00, "res/custom/fulidating/3/3.png")
	GUI:setAnchorPoint(list3, 0.00, 0.00)
	GUI:setTouchEnabled(list3, false)
	GUI:setTag(list3, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list3, "Button_1", 530.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list3, "item", 290.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create num
	num = GUI:Text_Create(list3, "num", 435.00, 28.00, 18, "#4ce218", [[文本]])
	GUI:Text_enableOutline(num, "#000000", 1)
	GUI:setAnchorPoint(num, 0.50, 0.00)
	GUI:setTouchEnabled(num, false)
	GUI:setTag(num, 0)

	-- Create over
	over = GUI:Text_Create(list3, "over", 488.00, 21.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list4
	list4 = GUI:Image_Create(List, "list4", 0.00, 77.00, "res/custom/fulidating/3/4.png")
	GUI:setAnchorPoint(list4, 0.00, 0.00)
	GUI:setTouchEnabled(list4, false)
	GUI:setTag(list4, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list4, "Button_1", 530.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list4, "item", 290.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create num
	num = GUI:Text_Create(list4, "num", 435.00, 28.00, 18, "#4ce218", [[文本]])
	GUI:Text_enableOutline(num, "#000000", 1)
	GUI:setAnchorPoint(num, 0.50, 0.00)
	GUI:setTouchEnabled(num, false)
	GUI:setTag(num, 0)

	-- Create over
	over = GUI:Text_Create(list4, "over", 488.00, 21.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create list5
	list5 = GUI:Image_Create(List, "list5", 0.00, 5.00, "res/custom/fulidating/3/5.png")
	GUI:setAnchorPoint(list5, 0.00, 0.00)
	GUI:setTouchEnabled(list5, false)
	GUI:setTag(list5, 0)

	-- Create Button_1
	Button_1 = GUI:Button_Create(list5, "Button_1", 530.00, 36.00, "res/custom/fulidating/1/button.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.50, 0.50)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create item
	item = GUI:ItemShow_Create(list5, "item", 289.00, 35.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create num
	num = GUI:Text_Create(list5, "num", 435.00, 28.00, 18, "#4ce218", [[文本]])
	GUI:Text_enableOutline(num, "#000000", 1)
	GUI:setAnchorPoint(num, 0.50, 0.00)
	GUI:setTouchEnabled(num, false)
	GUI:setTag(num, 0)

	-- Create over
	over = GUI:Text_Create(list5, "over", 488.00, 21.00, 25, "#00ff80", [[已领取]])
	GUI:Text_enableOutline(over, "#000000", 1)
	GUI:setAnchorPoint(over, 0.00, 0.00)
	GUI:setTouchEnabled(over, false)
	GUI:setTag(over, 0)

	-- Create rightLayout4
	local rightLayout4 = GUI:Layout_Create(ImageBG, "rightLayout4", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout4, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout4, true)
	GUI:setTag(rightLayout4, 0)
	GUI:setVisible(rightLayout4, false)

	-- Create left
	local left = GUI:Button_Create(rightLayout4, "left", 189.00, 16.00, "res/custom/fulidating/4/left.png")
	GUI:Button_setTitleText(left, [[]])
	GUI:Button_setTitleColor(left, "#ffffff")
	GUI:Button_setTitleFontSize(left, 16)
	GUI:Button_titleEnableOutline(left, "#000000", 1)
	GUI:setAnchorPoint(left, 0.50, 0.50)
	GUI:setTouchEnabled(left, true)
	GUI:setTag(left, 0)

	-- Create right
	local right = GUI:Button_Create(rightLayout4, "right", 412.00, 17.00, "res/custom/fulidating/4/right.png")
	GUI:Button_setTitleText(right, [[]])
	GUI:Button_setTitleColor(right, "#ffffff")
	GUI:Button_setTitleFontSize(right, 16)
	GUI:Button_titleEnableOutline(right, "#000000", 1)
	GUI:setAnchorPoint(right, 0.50, 0.50)
	GUI:setTouchEnabled(right, true)
	GUI:setTag(right, 0)

	-- Create page
	local page = GUI:Text_Create(rightLayout4, "page", 303.00, 5.00, 22, "#eee7da", [[100/100]])
	GUI:Text_enableOutline(page, "#000000", 1)
	GUI:setAnchorPoint(page, 0.50, 0.00)
	GUI:setTouchEnabled(page, false)
	GUI:setTag(page, 0)

	-- Create List
	List = GUI:Layout_Create(rightLayout4, "List", 3.00, 39.00, 602, 297, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create rightLayout5
	local rightLayout5 = GUI:Layout_Create(ImageBG, "rightLayout5", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout5, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout5, true)
	GUI:setTag(rightLayout5, 0)
	GUI:setVisible(rightLayout5, false)

	-- Create left
	left = GUI:Button_Create(rightLayout5, "left", 189.00, 16.00, "res/custom/fulidating/4/left.png")
	GUI:Button_setTitleText(left, [[]])
	GUI:Button_setTitleColor(left, "#ffffff")
	GUI:Button_setTitleFontSize(left, 16)
	GUI:Button_titleEnableOutline(left, "#000000", 1)
	GUI:setAnchorPoint(left, 0.50, 0.50)
	GUI:setTouchEnabled(left, true)
	GUI:setTag(left, 0)

	-- Create right
	right = GUI:Button_Create(rightLayout5, "right", 412.00, 17.00, "res/custom/fulidating/4/right.png")
	GUI:Button_setTitleText(right, [[]])
	GUI:Button_setTitleColor(right, "#ffffff")
	GUI:Button_setTitleFontSize(right, 16)
	GUI:Button_titleEnableOutline(right, "#000000", 1)
	GUI:setAnchorPoint(right, 0.50, 0.50)
	GUI:setTouchEnabled(right, true)
	GUI:setTag(right, 0)

	-- Create page
	page = GUI:Text_Create(rightLayout5, "page", 303.00, 5.00, 22, "#eee7da", [[100/100]])
	GUI:Text_enableOutline(page, "#000000", 1)
	GUI:setAnchorPoint(page, 0.50, 0.00)
	GUI:setTouchEnabled(page, false)
	GUI:setTag(page, 0)

	-- Create List
	List = GUI:Layout_Create(rightLayout5, "List", 3.00, 39.00, 602, 297, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create rightLayout6
	local rightLayout6 = GUI:Layout_Create(ImageBG, "rightLayout6", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout6, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout6, true)
	GUI:setTag(rightLayout6, 0)
	GUI:setVisible(rightLayout6, false)

	-- Create List
	List = GUI:Layout_Create(rightLayout6, "List", 4.00, 37.00, 601, 295, false)
	GUI:setAnchorPoint(List, 0.00, 0.00)
	GUI:setTouchEnabled(List, true)
	GUI:setTag(List, 0)

	-- Create left
	left = GUI:Button_Create(rightLayout6, "left", 189.00, 16.00, "res/custom/fulidating/4/left.png")
	GUI:Button_setTitleText(left, [[]])
	GUI:Button_setTitleColor(left, "#ffffff")
	GUI:Button_setTitleFontSize(left, 16)
	GUI:Button_titleEnableOutline(left, "#000000", 1)
	GUI:setAnchorPoint(left, 0.50, 0.50)
	GUI:setTouchEnabled(left, true)
	GUI:setTag(left, 0)

	-- Create right
	right = GUI:Button_Create(rightLayout6, "right", 412.00, 17.00, "res/custom/fulidating/4/right.png")
	GUI:Button_setTitleText(right, [[]])
	GUI:Button_setTitleColor(right, "#ffffff")
	GUI:Button_setTitleFontSize(right, 16)
	GUI:Button_titleEnableOutline(right, "#000000", 1)
	GUI:setAnchorPoint(right, 0.50, 0.50)
	GUI:setTouchEnabled(right, true)
	GUI:setTag(right, 0)

	-- Create page
	page = GUI:Text_Create(rightLayout6, "page", 303.00, 5.00, 22, "#eee7da", [[100/100]])
	GUI:Text_enableOutline(page, "#000000", 1)
	GUI:setAnchorPoint(page, 0.50, 0.00)
	GUI:setTouchEnabled(page, false)
	GUI:setTag(page, 0)

	-- Create rightLayout7
	local rightLayout7 = GUI:Layout_Create(ImageBG, "rightLayout7", 339.00, 24.00, 610, 445, false)
	GUI:setAnchorPoint(rightLayout7, 0.00, 0.00)
	GUI:setTouchEnabled(rightLayout7, true)
	GUI:setTag(rightLayout7, 0)

	-- Create points
	local points = GUI:Text_Create(rightLayout7, "points", 235.00, 105.00, 22, "#eee7da", [[100/100]])
	GUI:Text_enableOutline(points, "#000000", 1)
	GUI:setAnchorPoint(points, 0.50, 0.00)
	GUI:setTouchEnabled(points, false)
	GUI:setTag(points, 0)

	-- Create item
	item = GUI:ItemShow_Create(rightLayout7, "item", 187.00, 179.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(item, 0.50, 0.50)
	GUI:setTag(item, 0)

	-- Create ItemShow_1
	local ItemShow_1 = GUI:ItemShow_Create(rightLayout7, "ItemShow_1", 387.00, 208.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_1, 0.50, 0.50)
	GUI:setScale(ItemShow_1, 0.70)
	GUI:setTag(ItemShow_1, 0)

	-- Create ItemShow_2
	local ItemShow_2 = GUI:ItemShow_Create(rightLayout7, "ItemShow_2", 439.00, 208.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_2, 0.50, 0.50)
	GUI:setScale(ItemShow_2, 0.70)
	GUI:setTag(ItemShow_2, 0)

	-- Create ItemShow_3
	local ItemShow_3 = GUI:ItemShow_Create(rightLayout7, "ItemShow_3", 491.00, 208.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_3, 0.50, 0.50)
	GUI:setScale(ItemShow_3, 0.70)
	GUI:setTag(ItemShow_3, 0)

	-- Create ItemShow_4
	local ItemShow_4 = GUI:ItemShow_Create(rightLayout7, "ItemShow_4", 387.00, 156.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_4, 0.50, 0.50)
	GUI:setScale(ItemShow_4, 0.70)
	GUI:setTag(ItemShow_4, 0)

	-- Create ItemShow_5
	local ItemShow_5 = GUI:ItemShow_Create(rightLayout7, "ItemShow_5", 439.00, 156.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_5, 0.50, 0.50)
	GUI:setScale(ItemShow_5, 0.70)
	GUI:setTag(ItemShow_5, 0)

	-- Create ItemShow_6
	local ItemShow_6 = GUI:ItemShow_Create(rightLayout7, "ItemShow_6", 491.00, 156.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_6, 0.50, 0.50)
	GUI:setScale(ItemShow_6, 0.70)
	GUI:setTag(ItemShow_6, 0)

	-- Create ItemShow_7
	local ItemShow_7 = GUI:ItemShow_Create(rightLayout7, "ItemShow_7", 387.00, 104.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_7, 0.50, 0.50)
	GUI:setScale(ItemShow_7, 0.70)
	GUI:setTag(ItemShow_7, 0)

	-- Create ItemShow_8
	local ItemShow_8 = GUI:ItemShow_Create(rightLayout7, "ItemShow_8", 439.00, 104.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_8, 0.50, 0.50)
	GUI:setScale(ItemShow_8, 0.70)
	GUI:setTag(ItemShow_8, 0)

	-- Create ItemShow_9
	local ItemShow_9 = GUI:ItemShow_Create(rightLayout7, "ItemShow_9", 491.00, 104.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_9, 0.50, 0.50)
	GUI:setScale(ItemShow_9, 0.70)
	GUI:setTag(ItemShow_9, 0)

	-- Create ItemShow_10
	local ItemShow_10 = GUI:ItemShow_Create(rightLayout7, "ItemShow_10", 387.00, 52.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_10, 0.50, 0.50)
	GUI:setScale(ItemShow_10, 0.70)
	GUI:setTag(ItemShow_10, 0)

	-- Create ItemShow_11
	local ItemShow_11 = GUI:ItemShow_Create(rightLayout7, "ItemShow_11", 439.00, 51.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_11, 0.50, 0.50)
	GUI:setScale(ItemShow_11, 0.70)
	GUI:setTag(ItemShow_11, 0)

	-- Create ItemShow_12
	local ItemShow_12 = GUI:ItemShow_Create(rightLayout7, "ItemShow_12", 491.00, 52.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(ItemShow_12, 0.50, 0.50)
	GUI:setScale(ItemShow_12, 0.70)
	GUI:setTag(ItemShow_12, 0)

	-- Create button
	local button = GUI:Button_Create(rightLayout7, "button", 191.00, 52.00, "res/custom/fulidating/7/button.png")
	GUI:Button_setTitleText(button, [[]])
	GUI:Button_setTitleColor(button, "#ffffff")
	GUI:Button_setTitleFontSize(button, 16)
	GUI:Button_titleEnableOutline(button, "#000000", 1)
	GUI:setAnchorPoint(button, 0.50, 0.50)
	GUI:setTouchEnabled(button, true)
	GUI:setTag(button, 0)

	-- Create FanYe_L
	local FanYe_L = GUI:Button_Create(rightLayout7, "FanYe_L", 9.00, 139.00, "res/custom/fulidating/7/bnt_l.png")
	GUI:Button_setTitleText(FanYe_L, [[]])
	GUI:Button_setTitleColor(FanYe_L, "#ffffff")
	GUI:Button_setTitleFontSize(FanYe_L, 16)
	GUI:Button_titleEnableOutline(FanYe_L, "#000000", 1)
	GUI:setAnchorPoint(FanYe_L, 0.00, 0.00)
	GUI:setOpacity(FanYe_L, 0)
	GUI:setTouchEnabled(FanYe_L, true)
	GUI:setTag(FanYe_L, 0)
	GUI:setVisible(FanYe_L, false)

	-- Create FanYe_R
	local FanYe_R = GUI:Button_Create(rightLayout7, "FanYe_R", 566.00, 139.00, "res/custom/fulidating/7/bnt_r.png")
	GUI:Button_setTitleText(FanYe_R, [[]])
	GUI:Button_setTitleColor(FanYe_R, "#ffffff")
	GUI:Button_setTitleFontSize(FanYe_R, 16)
	GUI:Button_titleEnableOutline(FanYe_R, "#000000", 1)
	GUI:setAnchorPoint(FanYe_R, 0.00, 0.00)
	GUI:setOpacity(FanYe_R, 0)
	GUI:setTouchEnabled(FanYe_R, true)
	GUI:setTag(FanYe_R, 0)
	GUI:setVisible(FanYe_R, false)

	-- Create Effect_FanYe_L
	local Effect_FanYe_L = GUI:Effect_Create(rightLayout7, "Effect_FanYe_L", 10.00, 198.00, 0, 63145, 0, 0, 0, 1)
	GUI:setTag(Effect_FanYe_L, 0)
	GUI:setVisible(Effect_FanYe_L, false)

	-- Create Effect_FanYe_R
	local Effect_FanYe_R = GUI:Effect_Create(rightLayout7, "Effect_FanYe_R", 566.00, 198.00, 0, 63146, 0, 0, 0, 1)
	GUI:setTag(Effect_FanYe_R, 0)
	GUI:setVisible(Effect_FanYe_R, false)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
