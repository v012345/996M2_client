local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 200.00, 19.00, "res/custom/DiZangWangDeShiLian/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 782.00, 426.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 560.00, 63.00, "res/custom/DiZangWangDeShiLian/btn.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Panel_cost
	local Panel_cost = GUI:Layout_Create(ImageBG, "Panel_cost", 545.00, 144.00, 269, 57, false)
	GUI:setAnchorPoint(Panel_cost, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_cost, true)
	GUI:setTag(Panel_cost, 0)

	-- Create Node_layer_NotActivate
	local Node_layer_NotActivate = GUI:Node_Create(ImageBG, "Node_layer_NotActivate", 0.00, 0.00)
	GUI:setAnchorPoint(Node_layer_NotActivate, 0.00, 0.00)
	GUI:setTag(Node_layer_NotActivate, 0)

	-- Create Image_notActivate_1
	local Image_notActivate_1 = GUI:Image_Create(Node_layer_NotActivate, "Image_notActivate_1", 320.00, 205.00, "res/custom/DiZangWangDeShiLian/layer/hui_1.png")
	GUI:setAnchorPoint(Image_notActivate_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_notActivate_1, false)
	GUI:setTag(Image_notActivate_1, 0)

	-- Create Image_notActivate_2
	local Image_notActivate_2 = GUI:Image_Create(Node_layer_NotActivate, "Image_notActivate_2", 152.00, 265.00, "res/custom/DiZangWangDeShiLian/layer/hui_2.png")
	GUI:setAnchorPoint(Image_notActivate_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_notActivate_2, false)
	GUI:setTag(Image_notActivate_2, 0)

	-- Create Image_notActivate_3
	local Image_notActivate_3 = GUI:Image_Create(Node_layer_NotActivate, "Image_notActivate_3", 319.00, 313.00, "res/custom/DiZangWangDeShiLian/layer/hui_3.png")
	GUI:setAnchorPoint(Image_notActivate_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_notActivate_3, false)
	GUI:setTag(Image_notActivate_3, 0)

	-- Create Image_notActivate_4
	local Image_notActivate_4 = GUI:Image_Create(Node_layer_NotActivate, "Image_notActivate_4", 169.00, 353.00, "res/custom/DiZangWangDeShiLian/layer/hui_4.png")
	GUI:setAnchorPoint(Image_notActivate_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_notActivate_4, false)
	GUI:setTag(Image_notActivate_4, 0)

	-- Create Image_notActivate_5
	local Image_notActivate_5 = GUI:Image_Create(Node_layer_NotActivate, "Image_notActivate_5", 299.00, 396.00, "res/custom/DiZangWangDeShiLian/layer/hui_5.png")
	GUI:setAnchorPoint(Image_notActivate_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_notActivate_5, false)
	GUI:setTag(Image_notActivate_5, 0)

	-- Create Node_layer_Activate
	local Node_layer_Activate = GUI:Node_Create(ImageBG, "Node_layer_Activate", 0.00, 0.00)
	GUI:setAnchorPoint(Node_layer_Activate, 0.00, 0.00)
	GUI:setTag(Node_layer_Activate, 0)

	-- Create Image_Activate_1
	local Image_Activate_1 = GUI:Image_Create(Node_layer_Activate, "Image_Activate_1", 320.00, 205.00, "res/custom/DiZangWangDeShiLian/layer/cai_1.png")
	GUI:setAnchorPoint(Image_Activate_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Activate_1, false)
	GUI:setTag(Image_Activate_1, 0)
	GUI:setVisible(Image_Activate_1, false)

	-- Create Image_Activate_2
	local Image_Activate_2 = GUI:Image_Create(Node_layer_Activate, "Image_Activate_2", 152.00, 265.00, "res/custom/DiZangWangDeShiLian/layer/cai_2.png")
	GUI:setAnchorPoint(Image_Activate_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Activate_2, false)
	GUI:setTag(Image_Activate_2, 0)
	GUI:setVisible(Image_Activate_2, false)

	-- Create Image_Activate_3
	local Image_Activate_3 = GUI:Image_Create(Node_layer_Activate, "Image_Activate_3", 319.00, 313.00, "res/custom/DiZangWangDeShiLian/layer/cai_3.png")
	GUI:setAnchorPoint(Image_Activate_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Activate_3, false)
	GUI:setTag(Image_Activate_3, 0)
	GUI:setVisible(Image_Activate_3, false)

	-- Create Image_Activate_4
	local Image_Activate_4 = GUI:Image_Create(Node_layer_Activate, "Image_Activate_4", 168.00, 353.00, "res/custom/DiZangWangDeShiLian/layer/cai_4.png")
	GUI:setAnchorPoint(Image_Activate_4, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Activate_4, false)
	GUI:setTag(Image_Activate_4, 0)
	GUI:setVisible(Image_Activate_4, false)

	-- Create Image_Activate_5
	local Image_Activate_5 = GUI:Image_Create(Node_layer_Activate, "Image_Activate_5", 299.00, 396.00, "res/custom/DiZangWangDeShiLian/layer/cai_5.png")
	GUI:setAnchorPoint(Image_Activate_5, 0.00, 0.00)
	GUI:setTouchEnabled(Image_Activate_5, false)
	GUI:setTag(Image_Activate_5, 0)
	GUI:setVisible(Image_Activate_5, false)

	-- Create Image_cost
	local Image_cost = GUI:Image_Create(ImageBG, "Image_cost", 538.00, 160.00, "res/custom/DiZangWangDeShiLian/cost/1.png")
	GUI:setAnchorPoint(Image_cost, 0.00, 0.00)
	GUI:setTouchEnabled(Image_cost, false)
	GUI:setTag(Image_cost, 0)

	-- Create Image_title
	local Image_title = GUI:Image_Create(ImageBG, "Image_title", 672.00, 426.00, "res/custom/DiZangWangDeShiLian/title/1.png")
	GUI:setAnchorPoint(Image_title, 0.50, 0.00)
	GUI:setTouchEnabled(Image_title, false)
	GUI:setTag(Image_title, 0)

	-- Create Image_desc1
	local Image_desc1 = GUI:Image_Create(ImageBG, "Image_desc1", 554.00, 322.00, "res/custom/DiZangWangDeShiLian/tips/tips1_1.png")
	GUI:setAnchorPoint(Image_desc1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_desc1, false)
	GUI:setTag(Image_desc1, 0)

	-- Create Image_desc2
	local Image_desc2 = GUI:Image_Create(ImageBG, "Image_desc2", 517.00, 222.00, "res/custom/DiZangWangDeShiLian/tips/tips1_2.png")
	GUI:setAnchorPoint(Image_desc2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_desc2, false)
	GUI:setTag(Image_desc2, 0)

	if __data__ then ui.update(__data__) end
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
