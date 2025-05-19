local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create panel_1
	local panel_1 = GUI:Layout_Create(parent, "panel_1", 0.00, 0.00, 616, 452, false)
	GUI:setAnchorPoint(panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(panel_1, false)
	GUI:setTag(panel_1, -1)

	-- Create ImageBG
	local ImageBG = GUI:Image_Create(panel_1, "ImageBG", 0.00, 0.00, "res/custom/kf_GongShaChuanSong/bg_page_1.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create NodeCsBtn
	local NodeCsBtn = GUI:Node_Create(ImageBG, "NodeCsBtn", 0.00, 0.00)
	GUI:setTag(NodeCsBtn, -1)

	-- Create LayoutBox1
	local LayoutBox1 = GUI:Layout_Create(NodeCsBtn, "LayoutBox1", 317.00, 247.00, 50, 166, false)
	GUI:setAnchorPoint(LayoutBox1, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox1, false)
	GUI:setTag(LayoutBox1, -1)

	-- Create Effect
	local Effect = GUI:Effect_Create(LayoutBox1, "Effect", 18.00, 22.00, 0, 17009)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button1
	local Button1 = GUI:Button_Create(LayoutBox1, "Button1", 25.00, 90.00, "res/custom/gongshachuansong/fuhuodian.png")
	GUI:Button_setTitleText(Button1, [[]])
	GUI:Button_setTitleColor(Button1, "#ffffff")
	GUI:Button_setTitleFontSize(Button1, 14)
	GUI:Button_titleEnableOutline(Button1, "#000000", 1)
	GUI:setAnchorPoint(Button1, 0.50, 0.50)
	GUI:setTouchEnabled(Button1, true)
	GUI:setTag(Button1, -1)

	-- Create LayoutBox2
	local LayoutBox2 = GUI:Layout_Create(NodeCsBtn, "LayoutBox2", 275.00, 174.00, 50, 166, false)
	GUI:setAnchorPoint(LayoutBox2, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox2, false)
	GUI:setTag(LayoutBox2, -1)

	-- Create Effect
	Effect = GUI:Effect_Create(LayoutBox2, "Effect", 7.00, 9.00, 0, 17009)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button2
	local Button2 = GUI:Button_Create(LayoutBox2, "Button2", 14.00, 77.00, "res/custom/gongshachuansong/wuqidian.png")
	GUI:Button_setTitleText(Button2, [[]])
	GUI:Button_setTitleColor(Button2, "#ffffff")
	GUI:Button_setTitleFontSize(Button2, 14)
	GUI:Button_titleEnableOutline(Button2, "#000000", 1)
	GUI:setAnchorPoint(Button2, 0.50, 0.50)
	GUI:setTouchEnabled(Button2, true)
	GUI:setTag(Button2, -1)

	-- Create LayoutBox3
	local LayoutBox3 = GUI:Layout_Create(NodeCsBtn, "LayoutBox3", 430.00, 241.00, 50, 166, false)
	GUI:setAnchorPoint(LayoutBox3, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox3, false)
	GUI:setTag(LayoutBox3, -1)

	-- Create Effect
	Effect = GUI:Effect_Create(LayoutBox3, "Effect", 29.00, 32.00, 0, 17009)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button3
	local Button3 = GUI:Button_Create(LayoutBox3, "Button3", 37.00, 101.00, "res/custom/gongshachuansong/yifudian.png")
	GUI:Button_setTitleText(Button3, [[]])
	GUI:Button_setTitleColor(Button3, "#ffffff")
	GUI:Button_setTitleFontSize(Button3, 14)
	GUI:Button_titleEnableOutline(Button3, "#000000", 1)
	GUI:setAnchorPoint(Button3, 0.50, 0.50)
	GUI:setTouchEnabled(Button3, true)
	GUI:setTag(Button3, -1)

	-- Create LayoutBox4
	local LayoutBox4 = GUI:Layout_Create(NodeCsBtn, "LayoutBox4", 488.00, 136.00, 50, 166, false)
	GUI:setAnchorPoint(LayoutBox4, 0.50, 0.50)
	GUI:setTouchEnabled(LayoutBox4, false)
	GUI:setTag(LayoutBox4, -1)

	-- Create Effect
	Effect = GUI:Effect_Create(LayoutBox4, "Effect", 25.00, 25.00, 0, 17009)
	GUI:setScaleX(Effect, 0.30)
	GUI:setScaleY(Effect, 0.30)
	GUI:setTag(Effect, -1)

	-- Create Button4
	local Button4 = GUI:Button_Create(LayoutBox4, "Button4", 32.00, 92.00, "res/custom/gongshachuansong/shadamen.png")
	GUI:Button_setTitleText(Button4, [[]])
	GUI:Button_setTitleColor(Button4, "#ffffff")
	GUI:Button_setTitleFontSize(Button4, 14)
	GUI:Button_titleEnableOutline(Button4, "#000000", 1)
	GUI:setAnchorPoint(Button4, 0.50, 0.50)
	GUI:setTouchEnabled(Button4, true)
	GUI:setTag(Button4, -1)

	ui.update(__data__)
	return panel_1
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
