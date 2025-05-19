local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create zjdq_Progressbar
	local zjdq_Progressbar = GUI:Image_Create(parent, "zjdq_Progressbar", 0.00, 0.00, "res/custom/ZhanJiangDuoQi/pgbg.png")
	GUI:setAnchorPoint(zjdq_Progressbar, 0.00, 0.00)
	GUI:setTouchEnabled(zjdq_Progressbar, false)
	GUI:setTag(zjdq_Progressbar, -1)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(zjdq_Progressbar, "LoadingBar_1", 18.00, 3.00, "res/custom/ZhanJiangDuoQi/pg1.png", 0)
	GUI:setAnchorPoint(LoadingBar_1, 0.00, 0.00)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create zjdq_Node_1
	local zjdq_Node_1 = GUI:Node_Create(zjdq_Progressbar, "zjdq_Node_1", 14.00, 3.00)
	GUI:setTag(zjdq_Node_1, 0)

	ui.update(__data__)
	return zjdq_Progressbar
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
