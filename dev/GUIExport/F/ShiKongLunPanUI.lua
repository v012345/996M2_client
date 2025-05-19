local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/ShiKongLunPan/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 872.00, 508.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 0.00, 0.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create AllNode
	local AllNode = GUI:Node_Create(ImageBG, "AllNode", 0.00, 0.00)
	GUI:setTag(AllNode, 0)

	-- Create Node_1_1
	local Node_1_1 = GUI:Node_Create(AllNode, "Node_1_1", 0.00, 0.00)
	GUI:setTag(Node_1_1, 0)

	-- Create LuoPan_1_1
	local LuoPan_1_1 = GUI:Image_Create(Node_1_1, "LuoPan_1_1", 104.00, 256.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan1.png")
	GUI:setAnchorPoint(LuoPan_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(LuoPan_1_1, false)
	GUI:setTag(LuoPan_1_1, 0)

	-- Create ItemLooks_1_1
	local ItemLooks_1_1 = GUI:Layout_Create(Node_1_1, "ItemLooks_1_1", 162.00, 196.00, 205, 66, false)
	GUI:setAnchorPoint(ItemLooks_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_1_1, true)
	GUI:setTag(ItemLooks_1_1, 0)

	-- Create Button_1_1
	local Button_1_1 = GUI:Button_Create(Node_1_1, "Button_1_1", 147.00, 112.00, "res/custom/JuQing/ShiKongLunPan/button1.png")
	GUI:Button_setTitleText(Button_1_1, [[]])
	GUI:Button_setTitleColor(Button_1_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1_1, 16)
	GUI:Button_titleEnableOutline(Button_1_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1_1, true)
	GUI:setTag(Button_1_1, 0)

	-- Create Node_2_1
	local Node_2_1 = GUI:Node_Create(AllNode, "Node_2_1", 268.00, 0.00)
	GUI:setTag(Node_2_1, 0)
	GUI:setVisible(Node_2_1, false)

	-- Create LuoPan_2_1
	local LuoPan_2_1 = GUI:Image_Create(Node_2_1, "LuoPan_2_1", 104.00, 256.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan1.png")
	GUI:setAnchorPoint(LuoPan_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(LuoPan_2_1, false)
	GUI:setTag(LuoPan_2_1, 0)

	-- Create ItemLooks_2_1
	local ItemLooks_2_1 = GUI:Layout_Create(Node_2_1, "ItemLooks_2_1", 162.00, 196.00, 205, 66, false)
	GUI:setAnchorPoint(ItemLooks_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_2_1, true)
	GUI:setTag(ItemLooks_2_1, 0)

	-- Create Button_2_1
	local Button_2_1 = GUI:Button_Create(Node_2_1, "Button_2_1", 147.00, 112.00, "res/custom/JuQing/ShiKongLunPan/button1.png")
	GUI:Button_setTitleText(Button_2_1, [[]])
	GUI:Button_setTitleColor(Button_2_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2_1, 16)
	GUI:Button_titleEnableOutline(Button_2_1, "#000000", 1)
	GUI:setAnchorPoint(Button_2_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2_1, true)
	GUI:setTag(Button_2_1, 0)

	-- Create Node_3_1
	local Node_3_1 = GUI:Node_Create(AllNode, "Node_3_1", 536.00, 0.00)
	GUI:setTag(Node_3_1, 0)
	GUI:setVisible(Node_3_1, false)

	-- Create LuoPan_3_1
	local LuoPan_3_1 = GUI:Image_Create(Node_3_1, "LuoPan_3_1", 104.00, 256.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan1.png")
	GUI:setAnchorPoint(LuoPan_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(LuoPan_3_1, false)
	GUI:setTag(LuoPan_3_1, 0)

	-- Create ItemLooks_3_1
	local ItemLooks_3_1 = GUI:Layout_Create(Node_3_1, "ItemLooks_3_1", 162.00, 196.00, 205, 66, false)
	GUI:setAnchorPoint(ItemLooks_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(ItemLooks_3_1, true)
	GUI:setTag(ItemLooks_3_1, 0)

	-- Create Button_3_1
	local Button_3_1 = GUI:Button_Create(Node_3_1, "Button_3_1", 147.00, 112.00, "res/custom/JuQing/ShiKongLunPan/button1.png")
	GUI:Button_setTitleText(Button_3_1, [[]])
	GUI:Button_setTitleColor(Button_3_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3_1, 16)
	GUI:Button_titleEnableOutline(Button_3_1, "#000000", 1)
	GUI:setAnchorPoint(Button_3_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3_1, true)
	GUI:setTag(Button_3_1, 0)

	-- Create Node_1_2
	local Node_1_2 = GUI:Node_Create(AllNode, "Node_1_2", 0.00, 0.00)
	GUI:setTag(Node_1_2, 0)

	-- Create LuoPan_1_2
	local LuoPan_1_2 = GUI:Image_Create(Node_1_2, "LuoPan_1_2", 241.00, 388.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan2.png")
	GUI:setAnchorPoint(LuoPan_1_2, 0.50, 0.50)
	GUI:setTouchEnabled(LuoPan_1_2, false)
	GUI:setTag(LuoPan_1_2, 0)

	-- Create ZhiZhenShow_1
	local ZhiZhenShow_1 = GUI:Image_Create(Node_1_2, "ZhiZhenShow_1", 108.00, 261.00, "res/custom/JuQing/ShiKongLunPan/tx/zz1.png")
	GUI:Image_setScale9Slice(ZhiZhenShow_1, 0, 0, 0, 0)
	GUI:setAnchorPoint(ZhiZhenShow_1, 0.00, 0.00)
	GUI:setTouchEnabled(ZhiZhenShow_1, false)
	GUI:setTag(ZhiZhenShow_1, 0)

	-- Create costlook_1
	local costlook_1 = GUI:Image_Create(Node_1_2, "costlook_1", 92.00, 179.00, "res/custom/JuQing/ShiKongLunPan/costlook.png")
	GUI:setAnchorPoint(costlook_1, 0.00, 0.00)
	GUI:setTouchEnabled(costlook_1, false)
	GUI:setTag(costlook_1, 0)

	-- Create Image_1
	local Image_1 = GUI:Image_Create(Node_1_2, "Image_1", 316.00, 236.00, "res/custom/JuQing/ShiKongLunPan/x0.png")
	GUI:setAnchorPoint(Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Image_1, false)
	GUI:setTag(Image_1, 0)

	-- Create Atrrlooks_1
	local Atrrlooks_1 = GUI:Text_Create(Node_1_2, "Atrrlooks_1", 210.00, 253.00, 16, "#80ff00", [[暂无属性]])
	GUI:Text_enableOutline(Atrrlooks_1, "#000000", 1)
	GUI:setAnchorPoint(Atrrlooks_1, 0.00, 0.50)
	GUI:setTouchEnabled(Atrrlooks_1, false)
	GUI:setTag(Atrrlooks_1, 0)

	-- Create Button_1_2
	local Button_1_2 = GUI:Button_Create(Node_1_2, "Button_1_2", 147.00, 111.00, "res/custom/JuQing/ShiKongLunPan/button2.png")
	GUI:Button_setTitleText(Button_1_2, [[]])
	GUI:Button_setTitleColor(Button_1_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1_2, 16)
	GUI:Button_titleEnableOutline(Button_1_2, "#000000", 1)
	GUI:setAnchorPoint(Button_1_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1_2, true)
	GUI:setTag(Button_1_2, 0)

	-- Create Node_2_2
	local Node_2_2 = GUI:Node_Create(AllNode, "Node_2_2", 268.00, 0.00)
	GUI:setTag(Node_2_2, 0)

	-- Create LuoPan_2_2
	local LuoPan_2_2 = GUI:Image_Create(Node_2_2, "LuoPan_2_2", 241.00, 388.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan2.png")
	GUI:setAnchorPoint(LuoPan_2_2, 0.50, 0.50)
	GUI:setTouchEnabled(LuoPan_2_2, false)
	GUI:setTag(LuoPan_2_2, 0)

	-- Create ZhiZhenShow_2
	local ZhiZhenShow_2 = GUI:Image_Create(Node_2_2, "ZhiZhenShow_2", 108.00, 261.00, "res/custom/JuQing/ShiKongLunPan/tx/zz1.png")
	GUI:setAnchorPoint(ZhiZhenShow_2, 0.00, 0.00)
	GUI:setTouchEnabled(ZhiZhenShow_2, false)
	GUI:setTag(ZhiZhenShow_2, 0)

	-- Create costlook_2
	local costlook_2 = GUI:Image_Create(Node_2_2, "costlook_2", 92.00, 179.00, "res/custom/JuQing/ShiKongLunPan/costlook.png")
	GUI:setAnchorPoint(costlook_2, 0.00, 0.00)
	GUI:setTouchEnabled(costlook_2, false)
	GUI:setTag(costlook_2, 0)

	-- Create Image_2
	local Image_2 = GUI:Image_Create(Node_2_2, "Image_2", 316.00, 236.00, "res/custom/JuQing/ShiKongLunPan/x0.png")
	GUI:setAnchorPoint(Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Image_2, false)
	GUI:setTag(Image_2, 0)

	-- Create Atrrlooks_2
	local Atrrlooks_2 = GUI:Text_Create(Node_2_2, "Atrrlooks_2", 210.00, 253.00, 16, "#80ff00", [[暂无属性]])
	GUI:Text_enableOutline(Atrrlooks_2, "#000000", 1)
	GUI:setAnchorPoint(Atrrlooks_2, 0.00, 0.50)
	GUI:setTouchEnabled(Atrrlooks_2, false)
	GUI:setTag(Atrrlooks_2, 0)

	-- Create Button_2_2
	local Button_2_2 = GUI:Button_Create(Node_2_2, "Button_2_2", 147.00, 112.00, "res/custom/JuQing/ShiKongLunPan/button2.png")
	GUI:Button_setTitleText(Button_2_2, [[]])
	GUI:Button_setTitleColor(Button_2_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2_2, 16)
	GUI:Button_titleEnableOutline(Button_2_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2_2, true)
	GUI:setTag(Button_2_2, 0)

	-- Create Node_3_2
	local Node_3_2 = GUI:Node_Create(AllNode, "Node_3_2", 536.00, 0.00)
	GUI:setTag(Node_3_2, 0)

	-- Create LuoPan_3_2
	local LuoPan_3_2 = GUI:Image_Create(Node_3_2, "LuoPan_3_2", 241.00, 388.00, "res/custom/JuQing/ShiKongLunPan/zhuanpan2.png")
	GUI:setAnchorPoint(LuoPan_3_2, 0.50, 0.50)
	GUI:setTouchEnabled(LuoPan_3_2, false)
	GUI:setTag(LuoPan_3_2, 0)

	-- Create ZhiZhenShow_3
	local ZhiZhenShow_3 = GUI:Image_Create(Node_3_2, "ZhiZhenShow_3", 108.00, 261.00, "res/custom/JuQing/ShiKongLunPan/tx/zz1.png")
	GUI:setAnchorPoint(ZhiZhenShow_3, 0.00, 0.00)
	GUI:setTouchEnabled(ZhiZhenShow_3, false)
	GUI:setTag(ZhiZhenShow_3, 0)

	-- Create costlook_3
	local costlook_3 = GUI:Image_Create(Node_3_2, "costlook_3", 92.00, 179.00, "res/custom/JuQing/ShiKongLunPan/costlook.png")
	GUI:setAnchorPoint(costlook_3, 0.00, 0.00)
	GUI:setTouchEnabled(costlook_3, false)
	GUI:setTag(costlook_3, 0)

	-- Create Image_3
	local Image_3 = GUI:Image_Create(Node_3_2, "Image_3", 316.00, 236.00, "res/custom/JuQing/ShiKongLunPan/x0.png")
	GUI:setAnchorPoint(Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Image_3, false)
	GUI:setTag(Image_3, 0)

	-- Create Atrrlooks_3
	local Atrrlooks_3 = GUI:Text_Create(Node_3_2, "Atrrlooks_3", 210.00, 253.00, 16, "#80ff00", [[暂无属性]])
	GUI:Text_enableOutline(Atrrlooks_3, "#000000", 1)
	GUI:setAnchorPoint(Atrrlooks_3, 0.00, 0.50)
	GUI:setTouchEnabled(Atrrlooks_3, false)
	GUI:setTag(Atrrlooks_3, 0)

	-- Create Button_3_2
	local Button_3_2 = GUI:Button_Create(Node_3_2, "Button_3_2", 147.00, 112.00, "res/custom/JuQing/ShiKongLunPan/button2.png")
	GUI:Button_setTitleText(Button_3_2, [[]])
	GUI:Button_setTitleColor(Button_3_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3_2, 16)
	GUI:Button_titleEnableOutline(Button_3_2, "#000000", 1)
	GUI:setAnchorPoint(Button_3_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3_2, true)
	GUI:setTag(Button_3_2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
