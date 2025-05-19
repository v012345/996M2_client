local ui = {}
local _V = function(v) return SL:GetMetaValue(v) end
local FUNCQUEUE = {}
local TAGOBJ = {}

function ui.init(parent, __data__, __update__)
	if __update__ then return ui.update(__data__) end
	-- Create img_bg
	local img_bg = GUI:Image_Create(parent, "img_bg", 66.00, 10.00, "res/custom/TianXuanZhiRen/bg.png")
	GUI:Image_setScale9Slice(img_bg, 272, 272, 194, 194)
	GUI:setAnchorPoint(img_bg, 0.00, 0.00)
	GUI:setTouchEnabled(img_bg, false)
	GUI:setTag(img_bg, -1)

	-- Create CloseButton
	local CloseButton = GUI:Button_Create(img_bg, "CloseButton", 985.00, 549.00, "res/custom/public/btn_close.png")
	GUI:Button_setTitleText(CloseButton, [[]])
	GUI:Button_setTitleColor(CloseButton, "#ffffff")
	GUI:Button_setTitleFontSize(CloseButton, 10)
	GUI:Button_titleEnableOutline(CloseButton, "#000000", 1)
	GUI:setAnchorPoint(CloseButton, 0.50, 0.50)
	GUI:setTouchEnabled(CloseButton, true)
	GUI:setTag(CloseButton, -1)

	-- Create ImageView
	local ImageView = GUI:Image_Create(img_bg, "ImageView", 51.00, 32.00, "")
	GUI:setContentSize(ImageView, 50, 50)
	GUI:setIgnoreContentAdaptWithSize(ImageView, false)
	GUI:setAnchorPoint(ImageView, 0.00, 0.00)
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create Nodeffts
	local Nodeffts = GUI:Node_Create(ImageView, "Nodeffts", 0.00, 0.00)
	GUI:setTag(Nodeffts, -1)
	GUI:setVisible(Nodeffts, false)

	-- Create Text_ffts1
	local Text_ffts1 = GUI:Text_Create(Nodeffts, "Text_ffts1", 47.00, 382.00, 16, "#00ff00", [[发放倒计时：]])
	GUI:setAnchorPoint(Text_ffts1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_ffts1, false)
	GUI:setTag(Text_ffts1, -1)
	GUI:Text_enableOutline(Text_ffts1, "#000000", 1)

	-- Create Text_fftscontent1
	local Text_fftscontent1 = GUI:Text_Create(Text_ffts1, "Text_fftscontent1", 90.00, 0.00, 16, "#ff0000", [[10分钟]])
	GUI:setAnchorPoint(Text_fftscontent1, 0.00, 0.00)
	GUI:setTouchEnabled(Text_fftscontent1, false)
	GUI:setTag(Text_fftscontent1, -1)
	GUI:Text_enableOutline(Text_fftscontent1, "#000000", 1)

	-- Create Text_ffts2
	local Text_ffts2 = GUI:Text_Create(Nodeffts, "Text_ffts2", 274.00, 382.00, 16, "#00ff00", [[发放倒计时：]])
	GUI:setAnchorPoint(Text_ffts2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_ffts2, false)
	GUI:setTag(Text_ffts2, -1)
	GUI:Text_enableOutline(Text_ffts2, "#000000", 1)

	-- Create Text_fftscontent2
	local Text_fftscontent2 = GUI:Text_Create(Text_ffts2, "Text_fftscontent2", 90.00, 0.00, 16, "#ff0000", [[10分钟]])
	GUI:setAnchorPoint(Text_fftscontent2, 0.00, 0.00)
	GUI:setTouchEnabled(Text_fftscontent2, false)
	GUI:setTag(Text_fftscontent2, -1)
	GUI:Text_enableOutline(Text_fftscontent2, "#000000", 1)

	-- Create Text_ffts3
	local Text_ffts3 = GUI:Text_Create(Nodeffts, "Text_ffts3", 502.00, 382.00, 16, "#00ff00", [[发放倒计时：]])
	GUI:setAnchorPoint(Text_ffts3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_ffts3, false)
	GUI:setTag(Text_ffts3, -1)
	GUI:Text_enableOutline(Text_ffts3, "#000000", 1)

	-- Create Text_fftscontent3
	local Text_fftscontent3 = GUI:Text_Create(Text_ffts3, "Text_fftscontent3", 90.00, 0.00, 16, "#ff0000", [[10分钟]])
	GUI:setAnchorPoint(Text_fftscontent3, 0.00, 0.00)
	GUI:setTouchEnabled(Text_fftscontent3, false)
	GUI:setTag(Text_fftscontent3, -1)
	GUI:Text_enableOutline(Text_fftscontent3, "#000000", 1)

	-- Create Text_ffts4
	local Text_ffts4 = GUI:Text_Create(Nodeffts, "Text_ffts4", 738.00, 382.00, 16, "#00ff00", [[发放倒计时：]])
	GUI:setAnchorPoint(Text_ffts4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_ffts4, false)
	GUI:setTag(Text_ffts4, -1)
	GUI:Text_enableOutline(Text_ffts4, "#000000", 1)

	-- Create Text_fftscontent4
	local Text_fftscontent4 = GUI:Text_Create(Text_ffts4, "Text_fftscontent4", 90.00, 0.00, 16, "#ff0000", [[10分钟]])
	GUI:setAnchorPoint(Text_fftscontent4, 0.00, 0.00)
	GUI:setTouchEnabled(Text_fftscontent4, false)
	GUI:setTag(Text_fftscontent4, -1)
	GUI:Text_enableOutline(Text_fftscontent4, "#000000", 1)

	-- Create Node_list
	local Node_list = GUI:Node_Create(ImageView, "Node_list", 0.00, 0.00)
	GUI:setTag(Node_list, -1)

	-- Create ListView_1
	local ListView_1 = GUI:ListView_Create(Node_list, "ListView_1", 69.00, 87.00, 180, 234, 1)
	GUI:ListView_setClippingEnabled(ListView_1, false)
	GUI:ListView_setGravity(ListView_1, 2)
	GUI:setAnchorPoint(ListView_1, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_1, true)
	GUI:setTag(ListView_1, -1)

	-- Create ListView_2
	local ListView_2 = GUI:ListView_Create(Node_list, "ListView_2", 290.00, 87.00, 180, 234, 1)
	GUI:ListView_setClippingEnabled(ListView_2, false)
	GUI:ListView_setGravity(ListView_2, 2)
	GUI:setAnchorPoint(ListView_2, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_2, true)
	GUI:setTag(ListView_2, -1)

	-- Create ListView_3
	local ListView_3 = GUI:ListView_Create(Node_list, "ListView_3", 513.00, 87.00, 180, 234, 1)
	GUI:ListView_setClippingEnabled(ListView_3, false)
	GUI:ListView_setGravity(ListView_3, 2)
	GUI:setAnchorPoint(ListView_3, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_3, true)
	GUI:setTag(ListView_3, -1)

	-- Create ListView_4
	local ListView_4 = GUI:ListView_Create(Node_list, "ListView_4", 736.00, 87.00, 180, 234, 1)
	GUI:ListView_setClippingEnabled(ListView_4, false)
	GUI:ListView_setGravity(ListView_4, 2)
	GUI:setAnchorPoint(ListView_4, 0.00, 0.00)
	GUI:setTouchEnabled(ListView_4, true)
	GUI:setTag(ListView_4, -1)

	-- Create Panel_1
	local Panel_1 = GUI:Layout_Create(img_bg, "Panel_1", 654.00, 428.00, 304, 43, false)
	GUI:setAnchorPoint(Panel_1, 0.00, 0.00)
	GUI:setTouchEnabled(Panel_1, true)
	GUI:setTag(Panel_1, 0)

	ui.update(__data__)
	return img_bg
end

function ui.update(data)
	for _, func in pairs(FUNCQUEUE) do
		if func then func(data) end
	end
end

return ui
