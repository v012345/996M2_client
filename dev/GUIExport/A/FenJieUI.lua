local ui = {}

function ui.init(parent)
	-- Create ImageBG
	local ImageBG = GUI:Image_Create(parent, "ImageBG", 245.00, 99.00, "res/public/bg_sifud_05.png")
	GUI:Image_setScale9Slice(ImageBG, 15, 15, 50, 20)
	GUI:setContentSize(ImageBG, 600, 360)
	GUI:setIgnoreContentAdaptWithSize(ImageBG, false)
	GUI:setTouchEnabled(ImageBG, false)
	GUI:setTag(ImageBG, -1)

	-- Create TextTitle
	local TextTitle = GUI:Text_Create(ImageBG, "TextTitle", 268.00, 320.00, 16, "#ffffff", [[装备分解]])
	GUI:setTouchEnabled(TextTitle, false)
	GUI:setTag(TextTitle, -1)
	GUI:Text_enableOutline(TextTitle, "#000000", 1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(ImageBG, "ImageView", 110.00, 469.00, "res/private/gui_edit/ImageFile.png")
	GUI:setContentSize(ImageView, 0, 0)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create CloseLayout
	local CloseLayout = GUI:Layout_Create(ImageBG, "CloseLayout", 579.00, 306.00, 70.00, 70.00, false)
	GUI:setTouchEnabled(CloseLayout, false)
	GUI:setTag(CloseLayout, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(ImageBG, "CloseButton", 600.00, 318.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseButton, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseButton, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseButton, "")
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 0)
	GUI:Button_titleDisableOutLine(CloseButton)
	GUI:Win_SetParam(CloseButton, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create Button_Help
	local Button_Help = GUI:Button_Create(ImageBG, "Button_Help", 545.00, 307.00, "res/public/1900001024.png")
	GUI:Button_loadTexturePressed(Button_Help, "res/public/1900001024.png")
	GUI:Button_loadTextureDisabled(Button_Help, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(Button_Help, "")
	GUI:Button_setTitleColor(Button_Help, "#ffffff")
	GUI:Button_setTitleFontSize(Button_Help, 14)
	GUI:Button_titleEnableOutline(Button_Help, "#000000", 1)
	GUI:Win_SetParam(Button_Help, {grey = 1}, "Button")
	GUI:setTouchEnabled(Button_Help, true)
	GUI:setTag(Button_Help, -1)

	-- Create Help_body
	local Help_body = GUI:Image_Create(ImageBG, "Help_body", 173.00, 51.00, "res/private/item_tips/bg_tipszy_05.png")
	GUI:Image_setScale9Slice(Help_body, 45, 45, 58, 57)
	GUI:setContentSize(Help_body, 330, 420)
	GUI:setIgnoreContentAdaptWithSize(Help_body, false)
	GUI:setTouchEnabled(Help_body, false)
	GUI:setTag(Help_body, -1)
	GUI:setVisible(Help_body, false)

	-- Create CloseHelp
	local CloseHelp = GUI:Button_Create(Help_body, "CloseHelp", 329.00, 378.00, "res/public/1900000510.png")
	GUI:Button_loadTexturePressed(CloseHelp, "res/public/1900000511.png")
	GUI:Button_loadTextureDisabled(CloseHelp, "res/private/gui_edit/Button_Disable.png")
	GUI:Button_setTitleText(CloseHelp, "")
	GUI:Button_setTitleColor(CloseHelp, "#ffffff")
	GUI:Button_setTitleFontSize(CloseHelp, 14)
	GUI:Button_titleEnableOutline(CloseHelp, "#000000", 1)
	GUI:Win_SetParam(CloseHelp, {grey = 1}, "Button")
	GUI:setTouchEnabled(CloseHelp, true)
	GUI:setTag(CloseHelp, -1)

	-- Create Text
	local Text = GUI:Text_Create(Help_body, "Text", 172.00, 397.00, 16, "#ffff00", [[回收价格(剑甲翻倍)]])
	GUI:setAnchorPoint(Text, 0.50, 0.50)
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create ListViewJiaGe
	local ListViewJiaGe = GUI:ListView_Create(Help_body, "ListViewJiaGe", 19.00, 1.00, 300.00, 380.00, 1)
	GUI:ListView_setBounceEnabled(ListViewJiaGe, true)
	GUI:ListView_setGravity(ListViewJiaGe, 5)
	GUI:ListView_setItemsMargin(ListViewJiaGe, 3)
	GUI:setTouchEnabled(ListViewJiaGe, true)
	GUI:setTag(ListViewJiaGe, -1)

	-- Create NodeBottom
	local NodeBottom = GUI:Node_Create(ImageBG, "NodeBottom", 0.00, 0.00)
	GUI:setTag(NodeBottom, -1)

	-- Create ImageView_line_1_1
	local ImageView_line_1_1 = GUI:Image_Create(ImageBG, "ImageView_line_1_1", 49.00, 305.00, "res/public/1900000667.png")
	GUI:setContentSize(ImageView_line_1_1, 500, 2)
	GUI:setIgnoreContentAdaptWithSize(ImageView_line_1_1, false)
	GUI:setTouchEnabled(ImageView_line_1_1, false)
	GUI:setTag(ImageView_line_1_1, -1)

	-- Create ImageView_line_1_2
	local ImageView_line_1_2 = GUI:Image_Create(ImageBG, "ImageView_line_1_2", 54.00, 163.00, "res/public/1900000667.png")
	GUI:setContentSize(ImageView_line_1_2, 500, 2)
	GUI:setIgnoreContentAdaptWithSize(ImageView_line_1_2, false)
	GUI:setTouchEnabled(ImageView_line_1_2, false)
	GUI:setTag(ImageView_line_1_2, -1)

	-- Create RText
	local RText = GUI:RichText_Create(ImageBG, "RText", 97.00, 257.00, "<font color='#c5ffff'>注：分解装备可以获得本服十分珍贵稀有的材料</font><font color='#00ff00'>“灵石”</font>", 450, 15, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setTag(RText, -1)

	-- Create RText_1
	local RText_1 = GUI:RichText_Create(ImageBG, "RText_1", 97.00, 223.00, "<font color='#CEB5F7'>注：贵重物品请存入仓库，因个人失误导致分解请玩家自行负责！</font>", 450, 15, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setTag(RText_1, -1)

	-- Create RText_2
	local RText_2 = GUI:RichText_Create(ImageBG, "RText_2", 98.00, 189.00, "<font color='#00ffff'>如果有不想分解的装备请在进度条结束前点击</font><font color='#ff0000'>【终止分解装备】</font>", 450, 15, "#ffffff", nil, nil, "fonts/font2.ttf")
	GUI:setTag(RText_2, -1)

	-- Create NodeJinDu
	local NodeJinDu = GUI:Node_Create(ImageBG, "NodeJinDu", 0.00, 0.00)
	GUI:setTag(NodeJinDu, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(NodeJinDu, "ImageView", 128.00, 100.00, "res/public/bg_szjm_03.png")
	GUI:Image_setScale9Slice(ImageView, 31, 31, 1, 1)
	GUI:setContentSize(ImageView, 350, 9)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create LoadingBar
	local LoadingBar = GUI:LoadingBar_Create(ImageView, "LoadingBar", 0.00, 0.00, "res/public/bg_szjm_02.png", 0)
	GUI:setContentSize(LoadingBar, 350, 9)
	GUI:setIgnoreContentAdaptWithSize(LoadingBar, false)
	GUI:LoadingBar_setColor(LoadingBar, "#ffffff")
	GUI:setTouchEnabled(LoadingBar, false)
	GUI:setTag(LoadingBar, -1)
	GUI:LoadingBar_setPercent(LoadingBar, 0)
	GUI:Win_SetParam(LoadingBar, {value = 0, maxValue = 100, interval = 0, step = 1, lx = 0.00, ly = 0.00, lsize = 0, lvisible = 0, lcolor = ""}, "LoadingBar")

	-- Create Text
	local Text = GUI:Text_Create(NodeJinDu, "Text", 233.00, 125.00, 16, "#00ff00", [[当前分解进度：]])
	GUI:setTouchEnabled(Text, false)
	GUI:setTag(Text, -1)
	GUI:Text_enableOutline(Text, "#000000", 1)

	-- Create TextJindu
	local TextJindu = GUI:Text_Create(Text, "TextJindu", 104.00, 0.00, 16, "#ff0000", [[0%]])
	GUI:setTouchEnabled(TextJindu, false)
	GUI:setTag(TextJindu, -1)
	GUI:Text_enableOutline(TextJindu, "#000000", 1)

	-- Create TextStop1
	local TextStop1 = GUI:Text_Create(NodeJinDu, "TextStop1", 80.00, 43.00, 16, "#ffff00", [[【我要终止分解装备】]])
	GUI:setTouchEnabled(TextStop1, true)
	GUI:setTag(TextStop1, -1)
	GUI:Text_enableOutline(TextStop1, "#000000", 1)

	-- Create TextStop2
	local TextStop2 = GUI:Text_Create(NodeJinDu, "TextStop2", 349.00, 42.00, 16, "#ffff00", [[【我要终止分解装备】]])
	GUI:setTouchEnabled(TextStop2, true)
	GUI:setTag(TextStop2, -1)
	GUI:Text_enableOutline(TextStop2, "#000000", 1)
end

return ui