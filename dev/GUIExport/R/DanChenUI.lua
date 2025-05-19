local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 148.00, 33.00, "res/custom/JuQing/DanChen/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 684.00, 215.00, "res/custom/task/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Node_main
	local Node_main = GUI:Node_Create(ImageBG, "Node_main", 0.00, 0.00)
	GUI:setTag(Node_main, 0)

	-- Create Node_1
	local Node_1 = GUI:Node_Create(Node_main, "Node_1", 0.00, 0.00)
	GUI:setChineseName(Node_1, "没领取任务")
	GUI:setTag(Node_1, 0)
	GUI:setVisible(Node_1, false)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1, "Image_1", 288.00, 93.00, "res/custom/JuQing/DanChen/tips1.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(Node_1, "Button_1", 294.00, 28.00, "res/custom/JuQing/btn36.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(Node_1, "Button_2", 494.00, 28.00, "res/custom/JuQing/btn37.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Node_2
	local Node_2 = GUI:Node_Create(Node_main, "Node_2", 0.00, 0.00)
	GUI:setChineseName(Node_2, "领取界面和任务中")
	GUI:setTag(Node_2, 0)
	GUI:setVisible(Node_2, false)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_2, "Image_2", 288.00, 66.00, "res/custom/JuQing/DanChen/tips2.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node_2, "Panel_1", 357.00, 49.00, 66, 60, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(Node_2, "Button_3", 424.00, 48.00, "res/custom/JuQing/btn38.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	-- Create Button_4
	local Button_4 = GUI:Button_Create(Node_2, "Button_4", 566.00, 48.00, "res/custom/JuQing/btn39.png")
	GUI:Button_setTitleText(Button_4, [[]])
	GUI:Button_setTitleColor(Button_4, "#ffffff")
	GUI:Button_setTitleFontSize(Button_4, 16)
	GUI:Button_titleEnableOutline(Button_4, "#000000", 1)
	GUI:setAnchorPoint(Button_4, 0.00, 0.00)
	GUI:setTouchEnabled(Button_4, true)
	GUI:setTag(Button_4, 0)

	-- Create Node_3
	local Node_3 = GUI:Node_Create(Node_main, "Node_3", 0.00, 0.00)
	GUI:setChineseName(Node_3, "任务失败")
	GUI:setTag(Node_3, 0)
	GUI:setVisible(Node_3, false)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_3, "Image_3", 297.00, 125.00, "res/custom/JuQing/DanChen/tips3.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Button_5
	local Button_5 = GUI:Button_Create(Node_3, "Button_5", 331.00, 44.00, "res/custom/JuQing/btn50.png")
	GUI:Button_setTitleText(Button_5, [[]])
	GUI:Button_setTitleColor(Button_5, "#ffffff")
	GUI:Button_setTitleFontSize(Button_5, 16)
	GUI:Button_titleEnableOutline(Button_5, "#000000", 1)
	GUI:setAnchorPoint(Button_5, 0.00, 0.00)
	GUI:setTouchEnabled(Button_5, true)
	GUI:setTag(Button_5, 0)

	-- Create Button_6
	local Button_6 = GUI:Button_Create(Node_3, "Button_6", 513.00, 44.00, "res/custom/JuQing/btn51.png")
	GUI:Button_setTitleText(Button_6, [[]])
	GUI:Button_setTitleColor(Button_6, "#ffffff")
	GUI:Button_setTitleFontSize(Button_6, 16)
	GUI:Button_titleEnableOutline(Button_6, "#000000", 1)
	GUI:setAnchorPoint(Button_6, 0.00, 0.00)
	GUI:setTouchEnabled(Button_6, true)
	GUI:setTag(Button_6, 0)

	-- Create Node_4
	local Node_4 = GUI:Node_Create(Node_main, "Node_4", 0.00, 0.00)
	GUI:setChineseName(Node_4, "任务完成")
	GUI:setTag(Node_4, 0)
	GUI:setVisible(Node_4, false)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(Node_4, "Image_4", 294.00, 87.00, "res/custom/JuQing/DanChen/tips4.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Button_7
	local Button_7 = GUI:Button_Create(Node_4, "Button_7", 427.00, 29.00, "res/custom/JuQing/btn52.png")
	GUI:Button_setTitleText(Button_7, [[]])
	GUI:Button_setTitleColor(Button_7, "#ffffff")
	GUI:Button_setTitleFontSize(Button_7, 16)
	GUI:Button_titleEnableOutline(Button_7, "#000000", 1)
	GUI:setAnchorPoint(Button_7, 0.00, 0.00)
	GUI:setTouchEnabled(Button_7, true)
	GUI:setTag(Button_7, 0)

	-- Create Node_5
	local Node_5 = GUI:Node_Create(Node_main, "Node_5", 0.00, 0.00)
	GUI:setTag(Node_5, 0)
	GUI:setVisible(Node_5, false)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(Node_5, "Image_5", -135.00, -108.00, "res/custom/JuQing/DanChen/tips5.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Button_8
	local Button_8 = GUI:Button_Create(Image_5, "Button_8", 902.00, 484.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(Button_8, [[]])
	GUI:Button_setTitleColor(Button_8, "#ffffff")
	GUI:Button_setTitleFontSize(Button_8, 16)
	GUI:Button_titleEnableOutline(Button_8, "#000000", 1)
	GUI:setAnchorPoint(Button_8, 0.00, 0.00)
	GUI:setTouchEnabled(Button_8, true)
	GUI:setTag(Button_8, 0)

	-- Create Button_9
	local Button_9 = GUI:Button_Create(Image_5, "Button_9", 170.00, 46.00, "res/custom/JuQing/btn52.png")
	GUI:Button_setTitleText(Button_9, [[]])
	GUI:Button_setTitleColor(Button_9, "#ffffff")
	GUI:Button_setTitleFontSize(Button_9, 16)
	GUI:Button_titleEnableOutline(Button_9, "#000000", 1)
	GUI:setAnchorPoint(Button_9, 0.00, 0.00)
	GUI:setTouchEnabled(Button_9, true)
	GUI:setTag(Button_9, 0)

	-- Create Button_10
	local Button_10 = GUI:Button_Create(Image_5, "Button_10", 435.00, 46.00, "res/custom/JuQing/btn52.png")
	GUI:Button_setTitleText(Button_10, [[]])
	GUI:Button_setTitleColor(Button_10, "#ffffff")
	GUI:Button_setTitleFontSize(Button_10, 16)
	GUI:Button_titleEnableOutline(Button_10, "#000000", 1)
	GUI:setAnchorPoint(Button_10, 0.00, 0.00)
	GUI:setTouchEnabled(Button_10, true)
	GUI:setTag(Button_10, 0)

	-- Create Button_11
	local Button_11 = GUI:Button_Create(Image_5, "Button_11", 695.00, 46.00, "res/custom/JuQing/btn52.png")
	GUI:Button_setTitleText(Button_11, [[]])
	GUI:Button_setTitleColor(Button_11, "#ffffff")
	GUI:Button_setTitleFontSize(Button_11, 16)
	GUI:Button_titleEnableOutline(Button_11, "#000000", 1)
	GUI:setAnchorPoint(Button_11, 0.00, 0.00)
	GUI:setTouchEnabled(Button_11, true)
	GUI:setTag(Button_11, 0)

	-- Create Panel_2
	local Panel_2 = GUI:Layout_Create(Image_5, "Panel_2", 138.00, 261.00, 208, 60, false)
	GUI:setAnchorPoint(Panel_2, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_2, true)
	GUI:setTag(Panel_2, 0)

	-- Create Panel_3
	local Panel_3 = GUI:Layout_Create(Image_5, "Panel_3", 398.00, 293.00, 235, 52, false)
	GUI:setAnchorPoint(Panel_3, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_3, true)
	GUI:setTag(Panel_3, 0)

	-- Create Panel_4
	local Panel_4 = GUI:Layout_Create(Image_5, "Panel_4", 438.00, 226.00, 130, 50, false)
	GUI:setAnchorPoint(Panel_4, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_4, true)
	GUI:setTag(Panel_4, 0)

	-- Create Panel_5
	local Panel_5 = GUI:Layout_Create(Image_5, "Panel_5", 660.00, 293.00, 230, 52, false)
	GUI:setAnchorPoint(Panel_5, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_5, true)
	GUI:setTag(Panel_5, 0)

	-- Create Panel_6
	local Panel_6 = GUI:Layout_Create(Image_5, "Panel_6", 699.00, 224.00, 120, 52, false)
	GUI:setAnchorPoint(Panel_6, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_6, true)
	GUI:setTag(Panel_6, 0)

	-- Create Panel_7
	local Panel_7 = GUI:Layout_Create(Image_5, "Panel_7", 136.00, 144.00, 220, 54, false)
	GUI:setAnchorPoint(Panel_7, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_7, true)
	GUI:setTag(Panel_7, 0)

	-- Create Panel_8
	local Panel_8 = GUI:Layout_Create(Image_5, "Panel_8", 399.00, 144.00, 216, 54, false)
	GUI:setAnchorPoint(Panel_8, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_8, true)
	GUI:setTag(Panel_8, 0)

	-- Create Panel_9
	local Panel_9 = GUI:Layout_Create(Image_5, "Panel_9", 659.00, 143.00, 224, 52, false)
	GUI:setAnchorPoint(Panel_9, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_9, true)
	GUI:setTag(Panel_9, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(Image_5, "Image_6", 511.00, 276.00, "res/custom/JuQing/DanChen/success.png")
	GUI:setAnchorPoint(Image_6, 0.50, 0.50)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)
	GUI:setVisible(Image_6, false)

	-- Create Button_12
	local Button_12 = GUI:Button_Create(Image_6, "Button_12", 353.00, 87.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(Button_12, [[]])
	GUI:Button_setTitleColor(Button_12, "#ffffff")
	GUI:Button_setTitleFontSize(Button_12, 16)
	GUI:Button_titleEnableOutline(Button_12, "#000000", 1)
	GUI:setAnchorPoint(Button_12, 0.00, 0.00)
	GUI:setTouchEnabled(Button_12, true)
	GUI:setTag(Button_12, 0)

	-- Create Panel_10
	local Panel_10 = GUI:Layout_Create(Image_6, "Panel_10", 180.00, 53.00, 60, 60, false)
	GUI:setAnchorPoint(Panel_10, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_10, true)
	GUI:setTag(Panel_10, 0)

	-- Create Text_title
	local Text_title = GUI:Text_Create(Image_6, "Text_title", 209.00, 23.00, 20, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_title, 0.50, 0.00)
	GUI:setTouchEnabled(Text_title, false)
	GUI:setTag(Text_title, 0)
	GUI:Text_enableOutline(Text_title, "#000000", 1)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
