local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/BaoFengZhiLi/background.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 983.00, 449.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, true)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 19.00, 13.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node
	local Node = GUI:Node_Create(ImageBG, "Node", 48.00, 4.00)
	GUI:setTag(Node, -1)

	-- Create EquipShow
	local EquipShow = GUI:EquipShow_Create(Node, "EquipShow", 565.00, 349.00, 14, false, {bgVisible = false, doubleTakeOff = false, look = true, movable = false, starLv = false, lookPlayer = false})
	GUI:EquipShow_setAutoUpdate(EquipShow)
	GUI:setAnchorPoint(EquipShow, 0.00, 0.00)
	GUI:setTouchEnabled(EquipShow, false)
	GUI:setTag(EquipShow, -1)

	-- Create ImageViewLock
	local ImageViewLock = GUI:Image_Create(Node, "ImageViewLock", 553.00, 339.00, "res/custom/shenqi/lock.png")
	GUI:setAnchorPoint(ImageViewLock, 0.00, 0.00)
	GUI:setTouchEnabled(ImageViewLock, false)
	GUI:setTag(ImageViewLock, -1)
	GUI:setVisible(ImageViewLock, false)

	-- Create Item
	local Item = GUI:ItemShow_Create(Node, "Item", 799.00, 380.00, {index = 1, count = 1, look = true, bgVisible = false})
	GUI:setAnchorPoint(Item, 0.50, 0.50)
	GUI:setTag(Item, -1)

	-- Create LayoutCurrAttr
	local LayoutCurrAttr = GUI:Layout_Create(Node, "LayoutCurrAttr", 598.00, 199.00, 80, 115, false)
	GUI:setAnchorPoint(LayoutCurrAttr, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutCurrAttr, false)
	GUI:setTag(LayoutCurrAttr, -1)

	-- Create LayoutNextAttr
	local LayoutNextAttr = GUI:Layout_Create(Node, "LayoutNextAttr", 799.00, 198.00, 80, 115, false)
	GUI:setAnchorPoint(LayoutNextAttr, 0.00, 0.00)
	GUI:setTouchEnabled(LayoutNextAttr, false)
	GUI:setTag(LayoutNextAttr, -1)

	-- Create ButtonRequest
	local ButtonRequest = GUI:Button_Create(ImageBG, "ButtonRequest", 657.00, 32.00, "res/custom/public/btn_confirm.png")
	GUI:Button_setTitleText(ButtonRequest, [[]])
	GUI:Button_setTitleColor(ButtonRequest, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonRequest, 10)
	GUI:Button_titleDisableOutLine(ButtonRequest)
	GUI:setAnchorPoint(ButtonRequest, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonRequest, true)
	GUI:setTag(ButtonRequest, -1)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(ImageBG, "LayoutCost", 747.00, 143.00, 300, 60, false)
	GUI:setAnchorPoint(LayoutCost, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(ImageBG, "Effect", 349.00, 301.00, 3, 16014)
	GUI:setTag(Effect, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 188.00, 92.00, "res/custom/BaoFengZhiLi/tips.png")
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
