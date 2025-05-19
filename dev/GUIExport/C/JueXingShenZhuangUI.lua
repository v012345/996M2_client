local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 118.00, 34.00, "res/custom/JueXingShenZhuang/bg.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 729.00, 428.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button1
	local Button1 = GUI:Button_Create(ImageBG, "Button1", 379.00, 45.00, "res/custom/JueXingShenZhuang/btn.png")
	GUI:Button_setScale9Slice(Button1, 5, 5, 5, 5)
	GUI:setContentSize(Button1, 212, 74)
	GUI:setIgnoreContentAdaptWithSize(Button1, false)
	GUI:Button_setTitleText(Button1, "")
	GUI:Button_setTitleColor(Button1, "#ffffff")
	GUI:Button_setTitleFontSize(Button1, 14)
	GUI:Button_titleEnableOutline(Button1, "#000000", 1)
	GUI:setTouchEnabled(Button1, true)
	GUI:setTag(Button1, -1)

	-- Create Button2
	local Button2 = GUI:Button_Create(ImageBG, "Button2", 666.00, 44.00, "res/custom/JueXingShenZhuang/zhuanhuanBtn.png")
	GUI:Button_setScale9Slice(Button2, 5, 5, 5, 5)
	GUI:setContentSize(Button2, 160, 114)
	GUI:setIgnoreContentAdaptWithSize(Button2, false)
	GUI:Button_setTitleText(Button2, "")
	GUI:Button_setTitleColor(Button2, "#ffffff")
	GUI:Button_setTitleFontSize(Button2, 14)
	GUI:Button_titleEnableOutline(Button2, "#000000", 1)
	GUI:setTouchEnabled(Button2, true)
	GUI:setTag(Button2, -1)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(ImageBG, "Node_1", 0.00, 0.00)
	GUI:setTag(Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 188.00, 283.00, "res/custom/JueXingShenZhuang/itembg.png")
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_1, "Image_2", 297.00, 347.00, "res/custom/JueXingShenZhuang/itembg.png")
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_1, "Image_3", 426.00, 375.00, "res/custom/JueXingShenZhuang/itembg.png")
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_1, "Image_4", 574.00, 347.00, "res/custom/JueXingShenZhuang/itembg.png")
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_1, "Image_5", 671.00, 283.00, "res/custom/JueXingShenZhuang/itembg.png")
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create bottom_bg
	local bottom_bg = GUI:Image_Create(ImageBG, "bottom_bg", 167.00, 183.00, "res/custom/JueXingShenZhuang/bottom_bg.png")
	GUI:Image_setScale9Slice(bottom_bg, 20, 20, 20, 20)
	GUI:setContentSize(bottom_bg, 632, 96)
	GUI:setIgnoreContentAdaptWithSize(bottom_bg, false)
	GUI:setOpacity(bottom_bg, 216)
	GUI:setTouchEnabled(bottom_bg, false)
	GUI:setTag(bottom_bg, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(bottom_bg, "Image_6", 2.00, 16.00, "res/custom/JueXingShenZhuang/1.png")
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create Image_6_1
	local Image_6_1 = GUI:Image_Create(bottom_bg, "Image_6_1", 160.00, 16.00, "res/custom/JueXingShenZhuang/2.png")
	GUI:setTouchEnabled(Image_6_1, false)
	GUI:setTag(Image_6_1, 0)

	-- Create Image_6_2
	local Image_6_2 = GUI:Image_Create(bottom_bg, "Image_6_2", 315.00, 16.00, "res/custom/JueXingShenZhuang/3.png")
	GUI:setTouchEnabled(Image_6_2, false)
	GUI:setTag(Image_6_2, 0)

	-- Create Image_6_3
	local Image_6_3 = GUI:Image_Create(bottom_bg, "Image_6_3", 474.00, 16.00, "res/custom/JueXingShenZhuang/4.png")
	GUI:setTouchEnabled(Image_6_3, false)
	GUI:setTag(Image_6_3, 0)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(bottom_bg, "Image_7", 111.00, 24.00, "res/custom/JueXingShenZhuang/add.png")
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create Image_7_1
	local Image_7_1 = GUI:Image_Create(bottom_bg, "Image_7_1", 272.00, 24.00, "res/custom/JueXingShenZhuang/add.png")
	GUI:setTouchEnabled(Image_7_1, false)
	GUI:setTag(Image_7_1, 0)

	-- Create Image_7_2
	local Image_7_2 = GUI:Image_Create(bottom_bg, "Image_7_2", 433.00, 24.00, "res/custom/JueXingShenZhuang/add.png")
	GUI:setTouchEnabled(Image_7_2, false)
	GUI:setTag(Image_7_2, 0)

	-- Create LayoutCost
	local LayoutCost = GUI:Layout_Create(ImageBG, "LayoutCost", 334.00, 123.00, 200.00, 80.00, false)
	GUI:setTouchEnabled(LayoutCost, false)
	GUI:setTag(LayoutCost, -1)
end
return ui