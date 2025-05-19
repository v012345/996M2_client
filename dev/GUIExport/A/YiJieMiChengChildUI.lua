local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create YiJieMiChengChild
	local YiJieMiChengChild = GUI:Image_Create(parent, "YiJieMiChengChild", 2.00, -1.00, "res/custom/YiJieMiCheng/bg.png")
	GUI:setAnchorPoint(YiJieMiChengChild, 0.00, 0.00)
	GUI:setTouchEnabled(YiJieMiChengChild, false)
	GUI:setTag(YiJieMiChengChild, -1)

	-- Create Image_tips
	local Image_tips = GUI:Image_Create(YiJieMiChengChild, "Image_tips", 95.00, 11.00, "res/custom/YiJieMiCheng/tips1.png")
	GUI:setAnchorPoint(Image_tips, 0.00, 0.00)
	GUI:setTouchEnabled(Image_tips, false)
	GUI:setTag(Image_tips, 0)

	-- Create YiJieMiChengChild_Node_1
	local YiJieMiChengChild_Node_1 = GUI:Node_Create(YiJieMiChengChild, "YiJieMiChengChild_Node_1", 0.00, 0.00)
	GUI:setTag(YiJieMiChengChild_Node_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_1", 11.00, 122.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_2", 55.00, 122.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_3", 100.00, 122.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Image_4
	local Image_4 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_4", 146.00, 122.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_4, false)
	GUI:setTag(Image_4, 0)

	-- Create Image_5
	local Image_5 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_5", 8.00, 65.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_5, false)
	GUI:setTag(Image_5, 0)

	-- Create Image_6
	local Image_6 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_6", 54.00, 65.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_6, 0.00, 0.00)
	GUI:setTouchEnabled(Image_6, false)
	GUI:setTag(Image_6, 0)

	-- Create Image_7
	local Image_7 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_7", 99.00, 65.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_7, 0.00, 0.00)
	GUI:setTouchEnabled(Image_7, false)
	GUI:setTag(Image_7, 0)

	-- Create Image_8
	local Image_8 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_8", 144.00, 65.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_8, 0.00, 0.00)
	GUI:setTouchEnabled(Image_8, false)
	GUI:setTag(Image_8, 0)

	-- Create Image_9
	local Image_9 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_9", 8.00, 7.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_9, 0.00, 0.00)
	GUI:setTouchEnabled(Image_9, false)
	GUI:setTag(Image_9, 0)

	-- Create Image_10
	local Image_10 = GUI:Image_Create(YiJieMiChengChild_Node_1, "Image_10", 53.00, 7.00, "res/custom/YiJieMiCheng/0.png")
	GUI:setAnchorPoint(Image_10, 0.00, 0.00)
	GUI:setTouchEnabled(Image_10, false)
	GUI:setTag(Image_10, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(YiJieMiChengChild, "Button_1", 162.00, 0.00, "res/custom/public/helpBtn.png")
	GUI:setContentSize(Button_1, 36, 36)
	GUI:setIgnoreContentAdaptWithSize(Button_1, false)
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)
	GUI:setVisible(Button_1, false)

	ui.update(__data__)
	return YiJieMiChengChild
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
