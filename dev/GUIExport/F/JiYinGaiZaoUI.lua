local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, -2.00, "res/custom/JuQing/JiYinGaiZao/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 843.00, 490.00, 86, 86, false)
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

	-- Create LevelLoos
	local LevelLoos = GUI:Text_Create(ImageBG, "LevelLoos", 511.00, 467.00, 30, "#00ff00", [[Lv.14]])
	GUI:Text_enableOutline(LevelLoos, "#000000", 1)
	GUI:setAnchorPoint(LevelLoos, 0.00, 0.00)
	GUI:setTouchEnabled(LevelLoos, false)
	GUI:setTag(LevelLoos, 0)

	-- Create AttrShow1
	local AttrShow1 = GUI:Image_Create(ImageBG, "AttrShow1", 155.00, 215.00, "res/custom/JuQing/JiYinGaiZao/show1.png")
	GUI:setAnchorPoint(AttrShow1, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShow1, false)
	GUI:setTag(AttrShow1, 0)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(ImageBG, "ListView_1", 662.00, 203.00, 183, 264, 1)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, 0)

	-- Create AttrShow2
	local AttrShow2 = GUI:Image_Create(ListView_1, "AttrShow2", 0.00, -202.00, "res/custom/JuQing/JiYinGaiZao/show2.png")
	GUI:setAnchorPoint(AttrShow2, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShow2, false)
	GUI:setTag(AttrShow2, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 283.00, 91.00, "res/custom/JuQing/JiYinGaiZao/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 514.00, 91.00, "res/custom/JuQing/JiYinGaiZao/button2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create AttrShowLooks1
	local AttrShowLooks1 = GUI:Text_Create(ImageBG, "AttrShowLooks1", 441.00, 429.00, 16, "#00ff00", [[暂无基因]])
	GUI:Text_enableOutline(AttrShowLooks1, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks1, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks1, false)
	GUI:setTag(AttrShowLooks1, 0)

	-- Create AttrShowLooks2
	local AttrShowLooks2 = GUI:Text_Create(ImageBG, "AttrShowLooks2", 441.00, 392.00, 16, "#00ff00", [[暂无基因]])
	GUI:Text_enableOutline(AttrShowLooks2, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks2, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks2, false)
	GUI:setTag(AttrShowLooks2, 0)

	-- Create AttrShowLooks3
	local AttrShowLooks3 = GUI:Text_Create(ImageBG, "AttrShowLooks3", 441.00, 355.00, 16, "#00ff00", [[暂无基因]])
	GUI:Text_enableOutline(AttrShowLooks3, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks3, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks3, false)
	GUI:setTag(AttrShowLooks3, 0)

	-- Create AttrShowLooks4
	local AttrShowLooks4 = GUI:Text_Create(ImageBG, "AttrShowLooks4", 441.00, 319.00, 16, "#00ff00", [[基因等级5级解锁]])
	GUI:Text_enableOutline(AttrShowLooks4, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks4, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks4, false)
	GUI:setTag(AttrShowLooks4, 0)

	-- Create AttrShowLooks5
	local AttrShowLooks5 = GUI:Text_Create(ImageBG, "AttrShowLooks5", 441.00, 281.00, 16, "#00ff00", [[基因等级10级解锁]])
	GUI:Text_enableOutline(AttrShowLooks5, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks5, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks5, false)
	GUI:setTag(AttrShowLooks5, 0)

	-- Create AttrShowLooks6
	local AttrShowLooks6 = GUI:Text_Create(ImageBG, "AttrShowLooks6", 441.00, 246.00, 16, "#00ff00", [[基因等级15级解锁]])
	GUI:Text_enableOutline(AttrShowLooks6, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks6, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks6, false)
	GUI:setTag(AttrShowLooks6, 0)

	-- Create AttrShowLooks7
	local AttrShowLooks7 = GUI:Text_Create(ImageBG, "AttrShowLooks7", 441.00, 209.00, 16, "#00ff00", [[基因等级20级解锁]])
	GUI:Text_enableOutline(AttrShowLooks7, "#000000", 1)
	GUI:setAnchorPoint(AttrShowLooks7, 0.00, 0.00)
	GUI:setTouchEnabled(AttrShowLooks7, false)
	GUI:setTag(AttrShowLooks7, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
