local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 1.00, 1.00, "res/custom/zhuanshengxitong/jm_001.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 988.00, 448.00, 75, 75, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 15.00, 13.00, "res/custom/zhuanshengxitong/close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(ImageBG, "Effect", 554.00, 260.00, 3, 16000, 0, 0, 0, 1)
	GUI:setTag(Effect, -1)

	-- Create Button_Request
	local Button_Request = GUI:Button_Create(ImageBG, "Button_Request", 501.00, 34.00, "res/custom/zhuanshengxitong/qdan.png")
	GUI:Button_setTitleText(Button_Request, [[]])
	GUI:Button_setTitleColor(Button_Request, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Request, 14)
	GUI:Button_titleEnableOutline(Button_Request, "#000000", 1)
	GUI:setAnchorPoint(Button_Request, 0.00, 0.00)
	GUI:setTouchEnabled(Button_Request, true)
	GUI:setTag(Button_Request, -1)

	-- Create Item_Looks
	local Item_Looks = GUI:Layout_Create(ImageBG, "Item_Looks", 485.00, 111.00, 200, 60, false)
	GUI:setAnchorPoint(Item_Looks, 0.00, 0.00)
	GUI:setTouchEnabled(Item_Looks, false)
	GUI:setTag(Item_Looks, -1)

	-- Create AllNode_Cost
	local AllNode_Cost = GUI:Node_Create(ImageBG, "AllNode_Cost", 220.00, 435.00)
	GUI:setTag(AllNode_Cost, 0)

	-- Create Image_Cost
	local Image_Cost = GUI:Image_Create(AllNode_Cost, "Image_Cost", -80.00, -78.00, "res/custom/zhuanshengxitong/zsyq.png")
	GUI:setAnchorPoint(Image_Cost, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Cost, false)
	GUI:setTag(Image_Cost, 0)

	-- Create Layout_Cost
	local Layout_Cost = GUI:Layout_Create(AllNode_Cost, "Layout_Cost", -35.00, -294.00, 241, 230, false)
	GUI:setAnchorPoint(Layout_Cost, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_Cost, true)
	GUI:setTag(Layout_Cost, 0)

	-- Create AllNode_Award
	local AllNode_Award = GUI:Node_Create(ImageBG, "AllNode_Award", 795.00, 435.00)
	GUI:setTag(AllNode_Award, 0)

	-- Create Image_Award
	local Image_Award = GUI:Image_Create(AllNode_Award, "Image_Award", -80.00, -77.00, "res/custom/zhuanshengxitong/zsjl.png")
	GUI:setAnchorPoint(Image_Award, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Award, false)
	GUI:setTag(Image_Award, 0)

	-- Create Layout_Award
	local Layout_Award = GUI:Layout_Create(AllNode_Award, "Layout_Award", -35.00, -294.00, 241, 230, false)
	GUI:setAnchorPoint(Layout_Award, 0.00, 0.00)
	GUI:setTouchEnabled(Layout_Award, true)
	GUI:setTag(Layout_Award, 0)

	-- Create Info_Looks
	local Info_Looks = GUI:Image_Create(ImageBG, "Info_Looks", 413.00, 376.00, "res/custom/zhuanshengxitong/biaoti.png")
	GUI:setAnchorPoint(Info_Looks, 0.00, 0.00)
	GUI:setTouchEnabled(Info_Looks, false)
	GUI:setTag(Info_Looks, 0)

	-- Create Level_looks
	local Level_looks = GUI:Image_Create(Info_Looks, "Level_looks", 201.00, 26.00, "res/custom/zhuanshengxitong/num_0.png")
	GUI:setAnchorPoint(Level_looks, 0.00, 0.00)
	GUI:setTouchEnabled(Level_looks, false)
	GUI:setTag(Level_looks, 0)

	-- Create DecLevel_Looks
	local DecLevel_Looks = GUI:Text_Create(Info_Looks, "DecLevel_Looks", 284.00, 20.00, 20, "#ff8000", [[50
]])
	GUI:setAnchorPoint(DecLevel_Looks, 0.50, 0.50)
	GUI:setTouchEnabled(DecLevel_Looks, false)
	GUI:setTag(DecLevel_Looks, 0)
	GUI:Text_enableOutline(DecLevel_Looks, "#000000", 2)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
