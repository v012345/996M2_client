local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 0.00, 0.00, "res/custom/MeiRiHuanJing/hjbg3.png")
	GUI:setAnchorPoint(ImageBG, 0.00, 0.00)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 794.00, 434.00, 86, 86, false)
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

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 504.00, 85.00, "res/custom/MeiRiHuanJing/button1.png")
	GUI:Button_setTitleText(Button_1, [[]])
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 16)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setAnchorPoint(Button_1, 0.00, 0.00)
	GUI:setScaleX(Button_1, 0.90)
	GUI:setScaleY(Button_1, 0.90)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, 0)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 699.00, 85.00, "res/custom/MeiRiHuanJing/button2.png")
	GUI:Button_setTitleText(Button_2, [[]])
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 16)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setAnchorPoint(Button_2, 0.00, 0.00)
	GUI:setScaleX(Button_2, 0.90)
	GUI:setScaleY(Button_2, 0.90)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, 0)

	-- Create Tips_Button
	local Tips_Button = GUI:Button_Create(ImageBG, "Tips_Button", 409.00, 315.00, "res/custom/public/helpBtn.png")
	GUI:Button_setTitleText(Tips_Button, [[]])
	GUI:Button_setTitleColor(Tips_Button, "#ffffff")
	GUI:Button_setTitleFontSize(Tips_Button, 16)
	GUI:Button_titleEnableOutline(Tips_Button, "#000000", 1)
	GUI:setAnchorPoint(Tips_Button, 0.00, 0.00)
	GUI:setScaleX(Tips_Button, 0.60)
	GUI:setScaleY(Tips_Button, 0.60)
	GUI:setTouchEnabled(Tips_Button, true)
	GUI:setTag(Tips_Button, 0)

	-- Create Tips_Show
	local Tips_Show = GUI:Image_Create(ImageBG, "Tips_Show", 317.00, 201.00, "res/custom/public/picktypeui.png")
	GUI:setAnchorPoint(Tips_Show, 0.00, 0.00)
	GUI:setScaleX(Tips_Show, 0.50)
	GUI:setScaleY(Tips_Show, 0.50)
	GUI:setTouchEnabled(Tips_Show, false)
	GUI:setTag(Tips_Show, 0)
	GUI:setVisible(Tips_Show, false)

	-- Create TipsInfo
	local TipsInfo = GUI:RichText_Create(Tips_Show, "TipsInfo", 30.00, 24.00, "<font color='#ffff00' size='16' >刷新: </font><font color='#00ff00' size='16' >幻の炎月牛王[极恶]</font><br><font color='#00ff00' size='16' >          幻の千蛛之母[极恶]</font><br><font color='#ffff00' size='16' >爆出: </font><font color='#00ff00' size='16' >造化结晶</font><br><font color='#ff0000' size='16' >再次点击按钮关闭提示</font>", 200)
	GUI:setAnchorPoint(TipsInfo, 0.00, 0.00)
	GUI:setScaleX(TipsInfo, 2.00)
	GUI:setScaleY(TipsInfo, 2.00)
	GUI:setTag(TipsInfo, 0)

	ui.update(__data__)
	return ImageBG
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
