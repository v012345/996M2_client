local ui = {}

function ui.init(parent)
	-- Create Layer
	local Layer = GUI:Node_Create(parent, "Layer", 0.00, 0.00)
	GUI:setTag(Layer, -1)

	-- Create la_bg
	local la_bg = GUI:Layout_Create(Layer, "la_bg", 3.00, -4.00, 1136.00, 640.00, false)
	GUI:setTouchEnabled(la_bg, true)
	GUI:setTag(la_bg, 89)

	-- Create nd_root
	local nd_root = GUI:Node_Create(Layer, "nd_root", 568.00, 320.00)
	GUI:setAnchorPoint(nd_root, 0.50, 0.50)
	GUI:setTag(nd_root, 11)

	-- Create img_bg
	local img_bg = GUI:Image_Create(nd_root, "img_bg", 0.00, 56.00, "res/public/1900000600.png")
	GUI:setAnchorPoint(img_bg, 0.50, 0.50)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, 12)

	-- Create btn_back_revive
	local btn_back_revive = GUI:Button_Create(img_bg, "btn_back_revive", 106.00, 51.00, "res/public/1900000680.png")
	GUI:Button_loadTexturePressed(btn_back_revive, "res/public/1900000680_1.png")
	GUI:Button_loadTextureDisabled(btn_back_revive, "Default/Button_Disable.png")
	GUI:Button_setScale9Slice(btn_back_revive, 35, 36, 13, 14)
	GUI:setContentSize(btn_back_revive, 106, 40)
	GUI:setIgnoreContentAdaptWithSize(btn_back_revive, false)
	GUI:Button_setTitleText(btn_back_revive, "")
	GUI:Button_setTitleColor(btn_back_revive, "#ffff00")
	GUI:Button_setTitleFontSize(btn_back_revive, 16)
	GUI:Button_titleEnableOutline(btn_back_revive, "#000000", 1)
	GUI:Win_SetParam(btn_back_revive, {grey = 1}, "Button")
	GUI:setAnchorPoint(btn_back_revive, 0.50, 0.50)
	GUI:setTouchEnabled(btn_back_revive, true)
	GUI:setTag(btn_back_revive, 1708)

	-- Create tx_auto_revive
	local tx_auto_revive = GUI:Text_Create(img_bg, "tx_auto_revive", 105.00, 88.00, 16, "#ffffff", [[自动复活：11]])
	GUI:setAnchorPoint(tx_auto_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_auto_revive, false)
	GUI:setTag(tx_auto_revive, 9)
	GUI:Text_enableOutline(tx_auto_revive, "#000000", 1)

	-- Create tx_can_revive_count
	local tx_can_revive_count = GUI:Text_Create(img_bg, "tx_can_revive_count", 221.00, 33.00, 16, "#ffffff", [[可复活次数：1]])
	GUI:setAnchorPoint(tx_can_revive_count, 0.50, 0.50)
	GUI:setTouchEnabled(tx_can_revive_count, false)
	GUI:setTag(tx_can_revive_count, 12)
	GUI:setVisible(tx_can_revive_count, false)
	GUI:Text_enableOutline(tx_can_revive_count, "#000000", 1)

	-- Create TextTitle
	local TextTitle = GUI:Text_Create(img_bg, "TextTitle", 194.00, 142.00, 16, "#ffff00", [[死亡复活]])
	GUI:setTouchEnabled(TextTitle, false)
	GUI:setTag(TextTitle, -1)
	GUI:Text_enableOutline(TextTitle, "#000000", 1)

	-- Create ImageTitBG
	local ImageTitBG = GUI:Image_Create(img_bg, "ImageTitBG", 78.00, 147.00, "res/public/word_sxbt_05.png")
	GUI:setTouchEnabled(ImageTitBG, false)
	GUI:setTag(ImageTitBG, -1)

	-- Create Node_situ
	local Node_situ = GUI:Node_Create(img_bg, "Node_situ", 0.00, 0.00)
	GUI:setTag(Node_situ, -1)

	-- Create txt_situ
	local txt_situ = GUI:Text_Create(Node_situ, "txt_situ", 331.00, 86.00, 16, "#ffffff", [[]])
	GUI:setAnchorPoint(txt_situ, 0.50, 0.50)
	GUI:setTouchEnabled(txt_situ, false)
	GUI:setTag(txt_situ, -1)
	GUI:Text_enableOutline(txt_situ, "#000000", 1)

	-- Create btn_situ_revive
	local btn_situ_revive = GUI:Button_Create(Node_situ, "btn_situ_revive", 334.00, 51.00, "res/public/1900000680.png")
	GUI:Button_loadTexturePressed(btn_situ_revive, "res/public/1900000680_1.png")
	GUI:Button_loadTextureDisabled(btn_situ_revive, "res/public/1900000680_1.png")
	GUI:Button_setScale9Slice(btn_situ_revive, 35, 36, 13, 14)
	GUI:setContentSize(btn_situ_revive, 106, 40)
	GUI:setIgnoreContentAdaptWithSize(btn_situ_revive, false)
	GUI:Button_setTitleText(btn_situ_revive, "原地复活")
	GUI:Button_setTitleColor(btn_situ_revive, "#ffff00")
	GUI:Button_setTitleFontSize(btn_situ_revive, 16)
	GUI:Button_titleEnableOutline(btn_situ_revive, "#000000", 1)
	GUI:Win_SetParam(btn_situ_revive, {grey = 1}, "Button")
	GUI:setAnchorPoint(btn_situ_revive, 0.50, 0.50)
	GUI:setTouchEnabled(btn_situ_revive, true)
	GUI:setTag(btn_situ_revive, 2664)

	-- Create tx_pay_revive
	local tx_pay_revive = GUI:Text_Create(Node_situ, "tx_pay_revive", 334.00, 21.00, 16, "#ffffff", [[消耗200灵符]])
	GUI:setAnchorPoint(tx_pay_revive, 0.50, 0.50)
	GUI:setTouchEnabled(tx_pay_revive, false)
	GUI:setTag(tx_pay_revive, 11)
	GUI:Text_enableOutline(tx_pay_revive, "#000000", 1)
end

return ui