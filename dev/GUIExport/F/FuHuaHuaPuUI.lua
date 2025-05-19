local ui = {}
local _V = function(...) return SL:GetMetaValue(...) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/JuQing/FuHuaHuaPu/bg.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 744.00, 470.00, 86, 86, false)
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

	-- Create ItemShow
	local ItemShow = GUI:Layout_Create(ImageBG, "ItemShow", 227.00, 365.00, 441, 56, false)
	GUI:setAnchorPoint(ItemShow, 0.00, 0.00)
	GUI:setTouchEnabled(ItemShow, true)
	GUI:setTag(ItemShow, 0)

	-- Create ItemCost
	local ItemCost = GUI:Layout_Create(ImageBG, "ItemCost", 386.00, 219.00, 61, 56, false)
	GUI:setAnchorPoint(ItemCost, 0.00, 0.00)
	GUI:setTouchEnabled(ItemCost, true)
	GUI:setTag(ItemCost, 0)

	-- Create LoadingBar_1
	local LoadingBar_1 = GUI:LoadingBar_Create(ImageBG, "LoadingBar_1", 195.00, 244.00, "res/custom/JuQing/FuHuaHuaPu/ex4.png", 0)
	GUI:setAnchorPoint(LoadingBar_1, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar_1, false)
	GUI:setTag(LoadingBar_1, 0)

	-- Create LoadingBar_2
	local LoadingBar_2 = GUI:LoadingBar_Create(ImageBG, "LoadingBar_2", 294.00, 244.00, "res/custom/JuQing/FuHuaHuaPu/ex3.png", 0)
	GUI:setAnchorPoint(LoadingBar_2, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar_2, false)
	GUI:setTag(LoadingBar_2, 0)

	-- Create LoadingBar_3
	local LoadingBar_3 = GUI:LoadingBar_Create(ImageBG, "LoadingBar_3", 543.00, 244.00, "res/custom/JuQing/FuHuaHuaPu/ex2.png", 0)
	GUI:setAnchorPoint(LoadingBar_3, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar_3, false)
	GUI:setTag(LoadingBar_3, 0)

	-- Create LoadingBar_4
	local LoadingBar_4 = GUI:LoadingBar_Create(ImageBG, "LoadingBar_4", 640.00, 244.00, "res/custom/JuQing/FuHuaHuaPu/ex1.png", 0)
	GUI:setAnchorPoint(LoadingBar_4, 0.50, 0.50)
	GUI:setTouchEnabled(LoadingBar_4, false)
	GUI:setTag(LoadingBar_4, 0)

	-- Create Type_Image_1
	local Type_Image_1 = GUI:Image_Create(ImageBG, "Type_Image_1", 154.00, 107.00, "res/custom/JuQing/FuHuaHuaPu/type4.png")
	GUI:setAnchorPoint(Type_Image_1, 0.00, 0.00)
	GUI:setTouchEnabled(Type_Image_1, false)
	GUI:setTag(Type_Image_1, 0)

	-- Create Type_Image_2
	local Type_Image_2 = GUI:Image_Create(ImageBG, "Type_Image_2", 252.00, 107.00, "res/custom/JuQing/FuHuaHuaPu/type3.png")
	GUI:setAnchorPoint(Type_Image_2, 0.00, 0.00)
	GUI:setTouchEnabled(Type_Image_2, false)
	GUI:setTag(Type_Image_2, 0)

	-- Create Type_Image_3
	local Type_Image_3 = GUI:Image_Create(ImageBG, "Type_Image_3", 500.00, 107.00, "res/custom/JuQing/FuHuaHuaPu/type2.png")
	GUI:setAnchorPoint(Type_Image_3, 0.00, 0.00)
	GUI:setTouchEnabled(Type_Image_3, false)
	GUI:setTag(Type_Image_3, 0)

	-- Create Type_Image_4
	local Type_Image_4 = GUI:Image_Create(ImageBG, "Type_Image_4", 599.00, 107.00, "res/custom/JuQing/FuHuaHuaPu/type1.png")
	GUI:setAnchorPoint(Type_Image_4, 0.00, 0.00)
	GUI:setTouchEnabled(Type_Image_4, false)
	GUI:setTag(Type_Image_4, 0)

	-- Create Exp_Looks
	local Exp_Looks = GUI:Text_Create(ImageBG, "Exp_Looks", 408.00, 187.00, 16, "#00ff00", [[4000/4000]])
	GUI:Text_enableOutline(Exp_Looks, "#000000", 1)
	GUI:setAnchorPoint(Exp_Looks, 0.00, 0.50)
	GUI:setTouchEnabled(Exp_Looks, false)
	GUI:setTag(Exp_Looks, 0)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 331.00, 94.00, "res/custom/JuQing/FuHuaHuaPu/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 331.00, 94.00, "res/custom/JuQing/FuHuaHuaPu/button2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create NumLooks1
	local NumLooks1 = GUI:Text_Create(ImageBG, "NumLooks1", 195.00, 132.00, 13, "#ffffff", [[1000]])
	GUI:Text_enableOutline(NumLooks1, "#000000", 1)
	GUI:setAnchorPoint(NumLooks1, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks1, false)
	GUI:setTag(NumLooks1, 0)

	-- Create NumLooks2
	local NumLooks2 = GUI:Text_Create(ImageBG, "NumLooks2", 293.00, 132.00, 13, "#ffffff", [[1000]])
	GUI:Text_enableOutline(NumLooks2, "#000000", 1)
	GUI:setAnchorPoint(NumLooks2, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks2, false)
	GUI:setTag(NumLooks2, 0)

	-- Create NumLooks3
	local NumLooks3 = GUI:Text_Create(ImageBG, "NumLooks3", 541.00, 132.00, 13, "#ffffff", [[1000]])
	GUI:Text_enableOutline(NumLooks3, "#000000", 1)
	GUI:setAnchorPoint(NumLooks3, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks3, false)
	GUI:setTag(NumLooks3, 0)

	-- Create NumLooks4
	local NumLooks4 = GUI:Text_Create(ImageBG, "NumLooks4", 640.00, 132.00, 13, "#ffffff", [[1000]])
	GUI:Text_enableOutline(NumLooks4, "#000000", 1)
	GUI:setAnchorPoint(NumLooks4, 0.50, 0.50)
	GUI:setTouchEnabled(NumLooks4, false)
	GUI:setTag(NumLooks4, 0)

	-- Create JiHuoLooks
	local JiHuoLooks = GUI:Image_Create(ImageBG, "JiHuoLooks", 389.00, 227.00, "res/custom/ZhuXianAndJuQing/finish.png")
	GUI:setAnchorPoint(JiHuoLooks, 0.00, 0.00)
	GUI:setScale(JiHuoLooks, 0.60)
	GUI:setTouchEnabled(JiHuoLooks, false)
	GUI:setTag(JiHuoLooks, 0)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 672.00, 90.00, "res/custom/JuQing/FuHuaHuaPu/button3.png")
	GUI:Button_setTitleText(Button_3, [[]])
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 16)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setAnchorPoint(Button_3, 0.00, 0.00)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
