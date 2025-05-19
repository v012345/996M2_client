local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/ShouChong/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 691.00, 314.00, 86, 86, false)
	GUI:setAnchorPoint(CloseLayout, 0.00, 0.00)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", -62.00, 12.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.00, 0.00)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ButtonGet
	local ButtonGet = GUI:Button_Create(ImageBG, "ButtonGet", 374.00, 18.00, "res/custom/ShouChong/btn.png")
	GUI:Button_setTitleText(ButtonGet, [[]])
	GUI:Button_setTitleColor(ButtonGet, "#ffffff")
	GUI:Button_setTitleFontSize(ButtonGet, 14)
	GUI:Button_titleEnableOutline(ButtonGet, "#000000", 1)
	GUI:setAnchorPoint(ButtonGet, 0.00, 0.00)
	GUI:setTouchEnabled(ButtonGet, true)
	GUI:setTag(ButtonGet, -1)

	-- Create Effect_1
	local Effect_1 = GUI:Effect_Create(ImageBG, "Effect_1", 135.00, 149.00, 0, 15236, 0, 0, 0, 1)
	GUI:setTag(Effect_1, 0)

	-- Create Effect_2
	local Effect_2 = GUI:Effect_Create(ImageBG, "Effect_2", 329.00, 213.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_2, 0)

	-- Create Effect_3
	local Effect_3 = GUI:Effect_Create(ImageBG, "Effect_3", 421.00, 213.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_3, 0)

	-- Create Effect_4
	local Effect_4 = GUI:Effect_Create(ImageBG, "Effect_4", 513.00, 213.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_4, 0)

	-- Create Effect_5
	local Effect_5 = GUI:Effect_Create(ImageBG, "Effect_5", 606.00, 213.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_5, 0)

	-- Create Effect_6
	local Effect_6 = GUI:Effect_Create(ImageBG, "Effect_6", 377.00, 134.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_6, 0)

	-- Create Effect_7
	local Effect_7 = GUI:Effect_Create(ImageBG, "Effect_7", 469.00, 134.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_7, 0)

	-- Create Effect_8
	local Effect_8 = GUI:Effect_Create(ImageBG, "Effect_8", 561.00, 134.00, 0, 16008, 0, 0, 0, 1)
	GUI:setTag(Effect_8, 0)

	-- Create Layout1
	local Layout1 = GUI:Layout_Create(ImageBG, "Layout1", 330.00, 212.00, 331, 55, false)
	GUI:setAnchorPoint(Layout1, 0.00, 0.00)
	GUI:setTouchEnabled(Layout1, true)
	GUI:setTag(Layout1, 0)

	-- Create Layout2
	local Layout2 = GUI:Layout_Create(ImageBG, "Layout2", 377.00, 133.00, 236, 55, false)
	GUI:setAnchorPoint(Layout2, 0.00, 0.00)
	GUI:setTouchEnabled(Layout2, true)
	GUI:setTag(Layout2, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
