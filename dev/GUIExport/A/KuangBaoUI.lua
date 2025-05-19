local ui = {}

function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/KuangBaoZhiLi/kuangbaokuang.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 880.00, 396.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 141.00, 47.00, "res/custom/KuangBaoZhiLi/tips.png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create OpenButton
	local OpenButton = GUI:Button_Create(ImageBG, "OpenButton", 735.00, 84.00, "res/custom/KuangBaoZhiLi/kaiqi_btn.png")
	GUI:Button_setTitleText(OpenButton, "")
	GUI:Button_setTitleColor(OpenButton, "#ffffff")
	GUI:Button_setTitleFontSize(OpenButton, 10)
	GUI:Button_titleEnableOutline(OpenButton, "#000000", 1)
	GUI:Win_SetParam(OpenButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(OpenButton, true)
	GUI:setTag(OpenButton, -1)
end

return ui