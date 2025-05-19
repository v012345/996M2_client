local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 54.00, 8.00, "res/custom/task/CunZhangDeZhuTuo/backgrond.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 757.00, 469.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 156.00, -28.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 10)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ButtonSubmit
	local ButtonSubmit = GUI:Button_Create(ImageBG, "ButtonSubmit", 627.00, 88.00, "res/custom/public/btn_claimReward.png")
	GUI:Button_setTitleText(ButtonSubmit, "")
	GUI:Button_setTitleColor(ButtonSubmit, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonSubmit, 10)
	GUI:Button_titleEnableOutline(ButtonSubmit, "#000000", 1)
	GUI:setTouchEnabled(ButtonSubmit, true)
	GUI:setTag(ButtonSubmit, -1)

	-- Create Layout
	local Layout = GUI:Layout_Create(ImageBG, "Layout", 576.00, 289.00, 200.00, 60.00, false)
	GUI:setTouchEnabled(Layout, false)
	GUI:setTag(Layout, -1)

	-- Create Layout_1
	local Layout_1 = GUI:Layout_Create(ImageBG, "Layout_1", 669.00, 197.00, 200.00, 60.00, false)
	GUI:setTouchEnabled(Layout_1, false)
	GUI:setTag(Layout_1, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 636.00, 161.00, "res/custom/task/CunZhangDeZhuTuo/itemName.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)
end
return ui