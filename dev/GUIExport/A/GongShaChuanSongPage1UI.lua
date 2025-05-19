local ui = {}
function ui.init(parent)
	-- Create panel_1
	local panel_1 = GUI:Layout_Create(parent, "panel_1", 0.00, 0.00, 616.00, 452.00, false)
	GUI:setTouchEnabled(panel_1, false)
	GUI:setTag(panel_1, -1)

	-- Create ImageBG
	local ImageBG = GUI:Image_Create(panel_1, "ImageBG", 0.00, 0.00, "res/custom/gongshachuansong/bg_page1.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create NodeCsBtn
	local NodeCsBtn = GUI:Node_Create(ImageBG, "NodeCsBtn", 0.00, 0.00)
	GUI:setTag(NodeCsBtn, -1)

	-- Create LayoutBox1
	local LayoutBox1 = GUI:Layout_Create(NodeCsBtn, "LayoutBox1", 290.00, 262.00, 50.00, 166.00, false)
	GUI:setAnchorPoint(LayoutBox1, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox1, false)
	GUI:setTag(LayoutBox1, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(LayoutBox1, "Effect", 16.00, 29.00, 0, 17009, 0, 0, 0, 1)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button1
	local Button1 = GUI:Button_Create(LayoutBox1, "Button1", 25.00, 90.00, "res/custom/gongshachuansong/fuhuodian.png")
	GUI:Button_setTitleText(Button1, "")
	GUI:Button_setTitleColor(Button1, "#ffffff")
	GUI:Button_setTitleFontSize(Button1, 14)
	GUI:Button_titleEnableOutline(Button1, "#000000", 1)
	GUI:setAnchorPoint(Button1, 0.50, 0.50)
	GUI:setTouchEnabled(Button1, true)
	GUI:setTag(Button1, -1)

	-- Create LayoutBox2
	local LayoutBox2 = GUI:Layout_Create(NodeCsBtn, "LayoutBox2", 342.00, 173.00, 50.00, 166.00, false)
	GUI:setAnchorPoint(LayoutBox2, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox2, false)
	GUI:setTag(LayoutBox2, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(LayoutBox2, "Effect", 17.00, 29.00, 0, 17009, 0, 0, 0, 1)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button2
	local Button2 = GUI:Button_Create(LayoutBox2, "Button2", 25.00, 90.00, "res/custom/gongshachuansong/wuqidian.png")
	GUI:Button_setTitleText(Button2, "")
	GUI:Button_setTitleColor(Button2, "#ffffff")
	GUI:Button_setTitleFontSize(Button2, 14)
	GUI:Button_titleEnableOutline(Button2, "#000000", 1)
	GUI:setAnchorPoint(Button2, 0.50, 0.50)
	GUI:setTouchEnabled(Button2, true)
	GUI:setTag(Button2, -1)

	-- Create LayoutBox3
	local LayoutBox3 = GUI:Layout_Create(NodeCsBtn, "LayoutBox3", 428.00, 240.00, 50.00, 166.00, false)
	GUI:setAnchorPoint(LayoutBox3, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox3, false)
	GUI:setTag(LayoutBox3, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(LayoutBox3, "Effect", 17.00, 28.00, 0, 17009, 0, 0, 0, 1)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button3
	local Button3 = GUI:Button_Create(LayoutBox3, "Button3", 25.00, 90.00, "res/custom/gongshachuansong/yifudian.png")
	GUI:Button_setTitleText(Button3, "")
	GUI:Button_setTitleColor(Button3, "#ffffff")
	GUI:Button_setTitleFontSize(Button3, 14)
	GUI:Button_titleEnableOutline(Button3, "#000000", 1)
	GUI:setAnchorPoint(Button3, 0.50, 0.50)
	GUI:setTouchEnabled(Button3, true)
	GUI:setTag(Button3, -1)

	-- Create LayoutBox4
	local LayoutBox4 = GUI:Layout_Create(NodeCsBtn, "LayoutBox4", 488.00, 136.00, 50.00, 166.00, false)
	GUI:setAnchorPoint(LayoutBox4, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox4, false)
	GUI:setTag(LayoutBox4, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(LayoutBox4, "Effect", 16.00, 29.00, 0, 17009, 0, 0, 0, 1)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button4
	local Button4 = GUI:Button_Create(LayoutBox4, "Button4", 25.00, 90.00, "res/custom/gongshachuansong/shadamen.png")
	GUI:Button_setTitleText(Button4, "")
	GUI:Button_setTitleColor(Button4, "#ffffff")
	GUI:Button_setTitleFontSize(Button4, 14)
	GUI:Button_titleEnableOutline(Button4, "#000000", 1)
	GUI:setAnchorPoint(Button4, 0.50, 0.50)
	GUI:setTouchEnabled(Button4, true)
	GUI:setTag(Button4, -1)
end
return ui