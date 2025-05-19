local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create MoYuZhiWangChild
	local MoYuZhiWangChild = GUI:Image_Create(parent, "MoYuZhiWangChild", -1.00, -1.00, "res/custom/MoYuZhiWang/bg.png")
	GUI:setAnchorPoint(MoYuZhiWangChild, 0.00, 0.00)
	GUI:setTouchEnabled(MoYuZhiWangChild, false)
	GUI:setTag(MoYuZhiWangChild, -1)

	-- Create Panel_MoYuZhiWangChild1
	local Panel_MoYuZhiWangChild1 = GUI:Layout_Create(MoYuZhiWangChild, "Panel_MoYuZhiWangChild1", 43.00, 11.00, 129, 39, false)
	GUI:setAnchorPoint(Panel_MoYuZhiWangChild1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_MoYuZhiWangChild1, true)
	GUI:setTag(Panel_MoYuZhiWangChild1, 0)

	-- Create Image_MoYuZhiWangChild1
	local Image_MoYuZhiWangChild1 = GUI:Image_Create(MoYuZhiWangChild, "Image_MoYuZhiWangChild1", 126.00, 152.00, "res/custom/MoYuZhiWang/jieduan_1.png")
	GUI:setAnchorPoint(Image_MoYuZhiWangChild1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_MoYuZhiWangChild1, false)
	GUI:setTag(Image_MoYuZhiWangChild1, 0)

	-- Create Text_MoYuZhiWangChild1
	local Text_MoYuZhiWangChild1 = GUI:Text_Create(MoYuZhiWangChild, "Text_MoYuZhiWangChild1", 106.00, 95.00, 17, "#00ff00", [[]])
	GUI:setAnchorPoint(Text_MoYuZhiWangChild1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_MoYuZhiWangChild1, false)
	GUI:setTag(Text_MoYuZhiWangChild1, 0)
	GUI:Text_enableOutline(Text_MoYuZhiWangChild1, "#000000", 1)

	ui.update(__data__)
	return MoYuZhiWangChild
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
