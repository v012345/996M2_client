local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/jiuxianlibai/jm_01.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)
	TAGOBJ["-1"] = ImageBG

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 973.00, 486.00, 90, 90, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)
	TAGOBJ["-1"] = CloseLayout

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -107.00, -90.00, "res/custom/jiuxianlibai/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)
	TAGOBJ["-1"] = CloseButton

	-- Create ListView
	local ListView = GUI:ListView_Create(ImageBG, "ListView", 359.00, 93.00, 575, 300, 2)
	GUI:ListView_setBounceEnabled(ListView, true)
	GUI:ListView_setGravity(ListView, 3)
	GUI:ListView_setItemsMargin(ListView, 6)
	GUI:setAnchorPoint(ListView, 0.00, 0.00)
	GUI:setTouchEnabled(ListView, true)
	GUI:setTag(ListView, -1)
	TAGOBJ["-1"] = ListView

	-- Create ImageView
	local ImageView = GUI:Image_Create(ListView, "ImageView", 0.00, 0.00, "res/public/1900000610_1.png")
	GUI:setContentSize(ImageView, 940, 300)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)
	TAGOBJ["-1"] = ImageView

	-- Create ImageView1
	local ImageView1 = GUI:Image_Create(ImageView, "ImageView1", 0.00, 302.00, "res/custom/jiuxianlibai/jmk01.png")
	GUI:setAnchorPoint(ImageView1, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView1, false)
	GUI:setTag(ImageView1, -1)
	TAGOBJ["-1"] = ImageView1

	-- Create Node1
	local Node1 = GUI:Node_Create(ImageView1, "Node1", 126.00, 78.00)
	GUI:setAnchorPoint(Node1, 0.00, 0.00)
	GUI:setTag(Node1, -1)
	TAGOBJ["-1"] = Node1

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(ImageView1, "Layout1", 115.00, 206.00, 60, 60, false)
	GUI:setAnchorPoint(Layout1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout1, false)
	GUI:setTag(Layout1, -1)
	TAGOBJ["-1"] = Layout1

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageView1, "Button_1", 52.00, 13.00, "res/custom/jiuxianlibai/yyan.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)
	TAGOBJ["-1"] = Button_1

	-- Create ImageView2
	local ImageView2 = GUI:Image_Create(ImageView, "ImageView2", 182.00, 302.00, "res/custom/jiuxianlibai/jmk02.png")
	GUI:setAnchorPoint(ImageView2, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView2, false)
	GUI:setTag(ImageView2, -1)
	TAGOBJ["-1"] = ImageView2

	-- Create Node2
	local Node2 = GUI:Node_Create(ImageView2, "Node2", 126.00, 78.00)
	GUI:setAnchorPoint(Node2, 0.00, 0.00)
	GUI:setTag(Node2, -1)
	TAGOBJ["-1"] = Node2

	-- Create Layout2
	local Layout2 = GUI:Layout_Create(ImageView2, "Layout2", 115.00, 206.00, 60, 60, false)
	GUI:setAnchorPoint(Layout2, 0.00, 0.00)
	GUI:setTouchEnabled(Layout2, false)
	GUI:setTag(Layout2, -1)
	TAGOBJ["-1"] = Layout2

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageView2, "Button_2", 52.00, 13.00, "res/custom/jiuxianlibai/yyan.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)
	TAGOBJ["-1"] = Button_2

	-- Create ImageView3
	local ImageView3 = GUI:Image_Create(ImageView, "ImageView3", 364.00, 302.00, "res/custom/jiuxianlibai/jmk03.png")
	GUI:setAnchorPoint(ImageView3, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView3, false)
	GUI:setTag(ImageView3, -1)
	TAGOBJ["-1"] = ImageView3

	-- Create Node3
	local Node3 = GUI:Node_Create(ImageView3, "Node3", 126.00, 78.00)
	GUI:setAnchorPoint(Node3, 0.00, 0.00)
	GUI:setTag(Node3, -1)
	TAGOBJ["-1"] = Node3

	-- Create Layout3
	local Layout3 = GUI:Layout_Create(ImageView3, "Layout3", 115.00, 206.00, 60, 60, false)
	GUI:setAnchorPoint(Layout3, 0.00, 0.00)
	GUI:setTouchEnabled(Layout3, false)
	GUI:setTag(Layout3, -1)
	TAGOBJ["-1"] = Layout3

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageView3, "Button_3", 52.00, 13.00, "res/custom/jiuxianlibai/yyan.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)
	TAGOBJ["-1"] = Button_3

	-- Create ImageView4
	local ImageView4 = GUI:Image_Create(ImageView, "ImageView4", 546.00, 302.00, "res/custom/jiuxianlibai/jmk04.png")
	GUI:setAnchorPoint(ImageView4, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView4, false)
	GUI:setTag(ImageView4, -1)
	TAGOBJ["-1"] = ImageView4

	-- Create Node4
	local Node4 = GUI:Node_Create(ImageView4, "Node4", 126.00, 78.00)
	GUI:setAnchorPoint(Node4, 0.00, 0.00)
	GUI:setTag(Node4, -1)
	TAGOBJ["-1"] = Node4

	-- Create Layout4
	local Layout4 = GUI:Layout_Create(ImageView4, "Layout4", 115.00, 206.00, 60, 60, false)
	GUI:setAnchorPoint(Layout4, 0.00, 0.00)
	GUI:setTouchEnabled(Layout4, false)
	GUI:setTag(Layout4, -1)
	TAGOBJ["-1"] = Layout4

	-- Create Button_4
	local Button_4 = GUI:Button_Create(ImageView4, "Button_4", 52.00, 13.00, "res/custom/jiuxianlibai/yyan.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, -1)
	TAGOBJ["-1"] = Button_4

	-- Create ImageView5
	local ImageView5 = GUI:Image_Create(ImageView, "ImageView5", 728.00, 302.00, "res/custom/jiuxianlibai/jmk05.png")
	GUI:setAnchorPoint(ImageView5, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView5, false)
	GUI:setTag(ImageView5, -1)
	TAGOBJ["-1"] = ImageView5

	-- Create Node5
	local Node5 = GUI:Node_Create(ImageView5, "Node5", 126.00, 78.00)
	GUI:setAnchorPoint(Node5, 0.00, 0.00)
	GUI:setTag(Node5, -1)
	TAGOBJ["-1"] = Node5

	-- Create Layout5
	local Layout5 = GUI:Layout_Create(ImageView5, "Layout5", 115.00, 206.00, 60, 60, false)
	GUI:setAnchorPoint(Layout5, 0.00, 0.00)
	GUI:setTouchEnabled(Layout5, false)
	GUI:setTag(Layout5, -1)
	TAGOBJ["-1"] = Layout5

	-- Create Button_5
	local Button_5 = GUI:Button_Create(ImageView5, "Button_5", 52.00, 13.00, "res/custom/jiuxianlibai/yyan.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, -1)
	TAGOBJ["-1"] = Button_5

	-- Create titlelooks
	local titlelooks = GUI:Layout_Create(ImageBG, "titlelooks", 688.00, 50.00, 110, 30, false)
	GUI:setAnchorPoint(titlelooks, 0.00, 0.00)
	GUI:setTouchEnabled(titlelooks, false)
	GUI:setTag(titlelooks, -1)
	TAGOBJ["-1"] = titlelooks

	-- Create Button_lingqu
	local Button_lingqu = GUI:Button_Create(ImageBG, "Button_lingqu", 819.00, 46.00, "res/custom/jiuxianlibai/an_lq.png")
	GUI:Button_setTitleText(Button_lingqu, [[]])
	GUI:Button_setTitleColor(Button_lingqu, "#ffffff")
	GUI:Button_setTitleFontSize(Button_lingqu, 14)
	GUI:Button_titleEnableOutline(Button_lingqu, "#000000", 1)
	GUI:setAnchorPoint(Button_lingqu, 0.00, 0.00)
	GUI:setTouchEnabled(Button_lingqu, true)
	GUI:setTag(Button_lingqu, -1)
	TAGOBJ["-1"] = Button_lingqu

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
