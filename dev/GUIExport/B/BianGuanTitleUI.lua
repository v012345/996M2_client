local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 6.00, -1.00, "res/custom/bianguanshouhu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 801.00, 422.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -4.00, -6.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ButtonSubmit
	local ButtonSubmit = GUI:Button_Create(ImageBG, "ButtonSubmit", 491.00, 88.00, "res/custom/public/btn_tijiao.png")
	GUI:Button_setTitleText(ButtonSubmit, [[]])
	GUI:Button_setTitleColor(ButtonSubmit, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonSubmit, 14)
	GUI:Button_titleEnableOutline(ButtonSubmit, "#000000", 1)
	GUI:setAnchorPoint(ButtonSubmit, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonSubmit, true)
	GUI:setTag(ButtonSubmit, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 554.00, 182.00, 100, 60, false)
	GUI:setAnchorPoint(Layout, 0.00, 0.00)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Node
	local Node = GUI:Node_Create(ImageBG, "Node", 0.00, 0.00)
	GUI:setTag(Node, -1)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(ImageBG, "Image_1", 392.00, 377.00, "res/custom/bianguanshouhu/title.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(ImageBG, "Image_2", 530.00, 141.00, "res/custom/bianguanshouhu/cgl.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
