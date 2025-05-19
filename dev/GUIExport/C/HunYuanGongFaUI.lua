local ui = {}
function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 127.00, 69.00, "res/custom/hunyuangongfa/jm.png")
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 844.00, 438.00, 75.00, 75.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(CloseLayout, "CloseButton", 22.00, 4.00, "res/custom/hunyuangongfa/close.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 14)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create infolokks
	local infolokks = GUI:Node_Create(ImageBG, "infolokks", 105.00, 394.00)
	GUI:setTag(infolokks, -1)

	-- Create dclooks
	local dclooks = GUI:Text_Create(ImageBG, "dclooks", 633.00, 367.00, 15, "#100808", [[攻击]])
	GUI:setTouchEnabled(dclooks, false)
	GUI:setTag(dclooks, -1)
	GUI:Text_disableOutLine(dclooks)

	-- Create hplooks
	local hplooks = GUI:Text_Create(ImageBG, "hplooks", 633.00, 340.00, 15, "#100808", [[血量]])
	GUI:setTouchEnabled(hplooks, false)
	GUI:setTag(hplooks, -1)
	GUI:Text_disableOutLine(hplooks)

	-- Create magicname
	local magicname = GUI:Text_Create(ImageBG, "magicname", 655.00, 314.00, 15, "#efa54a", [[功法]])
	GUI:setTouchEnabled(magicname, false)
	GUI:setTag(magicname, -1)
	GUI:Text_enableOutline(magicname, "#000000", 1)

	-- Create itemlooks
	local itemlooks = GUI:Layout_Create(ImageBG, "itemlooks", 569.00, 225.00, 200.00, 25.00, false)
	GUI:setTouchEnabled(itemlooks, false)
	GUI:setTag(itemlooks, -1)

	-- Create zhuangtailooks
	local zhuangtailooks = GUI:Image_Create(ImageBG, "zhuangtailooks", 563.00, 110.00, "res/custom/hunyuangongfa/an_2.png")
	GUI:setTouchEnabled(zhuangtailooks, false)
	GUI:setTag(zhuangtailooks, -1)
	GUI:setVisible(zhuangtailooks, false)

	-- Create Button_1
	local Button_1 = GUI:Button_Create(ImageBG, "Button_1", 601.00, 90.00, "res/custom/hunyuangongfa/an_1.png")
	GUI:Button_setTitleText(Button_1, "")
	GUI:Button_setTitleColor(Button_1, "#ffffff")
	GUI:Button_setTitleFontSize(Button_1, 14)
	GUI:Button_titleEnableOutline(Button_1, "#000000", 1)
	GUI:setTouchEnabled(Button_1, true)
	GUI:setTag(Button_1, -1)

	-- Create Button_2
	local Button_2 = GUI:Button_Create(ImageBG, "Button_2", 63.00, 28.00, "res/custom/hunyuangongfa/fy_1.png")
	GUI:Button_setTitleText(Button_2, "")
	GUI:Button_setTitleColor(Button_2, "#ffffff")
	GUI:Button_setTitleFontSize(Button_2, 14)
	GUI:Button_titleEnableOutline(Button_2, "#000000", 1)
	GUI:setTouchEnabled(Button_2, true)
	GUI:setTag(Button_2, -1)

	-- Create Button_3
	local Button_3 = GUI:Button_Create(ImageBG, "Button_3", 657.00, 28.00, "res/custom/hunyuangongfa/fy_2.png")
	GUI:Button_setTitleText(Button_3, "")
	GUI:Button_setTitleColor(Button_3, "#ffffff")
	GUI:Button_setTitleFontSize(Button_3, 14)
	GUI:Button_titleEnableOutline(Button_3, "#000000", 1)
	GUI:setTouchEnabled(Button_3, true)
	GUI:setTag(Button_3, -1)

	-- Create levellooks
	local levellooks = GUI:Text_Create(ImageBG, "levellooks", 600.00, 401.00, 15, "#000000", [[等级]])
	GUI:setAnchorPoint(levellooks, 0.50, 0.50)
	GUI:setTouchEnabled(levellooks, false)
	GUI:setTag(levellooks, -1)
	GUI:Text_disableOutLine(levellooks)

	-- Create Frames
	local Frames = GUI:Node_Create(ImageBG, "Frames", 203.00, 358.00)
	GUI:setTag(Frames, -1)
end
return ui