local ui = {}
function ui.init(parent)
	-- Create Node
	local Node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
	GUI:setChineseName(Node, "玩家技能节点")
	GUI:setAnchorPoint(Node, 0.50, 0.50)
	GUI:setTag(Node, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(Node, "Panel_1", 0.00, 0.00, 272.00, 349.00, false)
	GUI:setChineseName(Panel_1, "玩家技能组合")
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 41)

	-- Create Image_bg
	local Image_bg = GUI:Image_Create(Panel_1, "Image_bg", 0.00, 0.00, "res/private/player_skill-win32/1900015001.png")
	GUI:setContentSize(Image_bg, 272, 349)
	GUI:setIgnoreContentAdaptWithSize(Image_bg, false)
	GUI:setChineseName(Image_bg, "玩家技能_背景图")
	GUI:setTouchEnabled(Image_bg, false)
	GUI:setTag(Image_bg, 42)

	-- Create ListView_cells
	local ListView_cells = GUI:ListView_Create(Panel_1, "ListView_cells", 0.00, 348.00, 272.00, 349.00, 1)
	GUI:ListView_setGravity(ListView_cells, 5)
	GUI:setChineseName(ListView_cells, "玩家技能_技能列表")
	GUI:setAnchorPoint(ListView_cells, 0.00, 1.00)
	GUI:setTouchEnabled(ListView_cells, true)
	GUI:setTag(ListView_cells, 13)
end
return ui