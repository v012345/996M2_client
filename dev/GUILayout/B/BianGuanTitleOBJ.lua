
BianGuanTitleOBJ = {}
BianGuanTitleOBJ.__cname = "BianGuanTitleOBJ"
BianGuanTitleOBJ.config = ssrRequireCsvCfg("cfg_BianGuanTitle")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BianGuanTitleOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,10,-30)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout,true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.ButtonSubmit, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.BianGuanTitle_Request)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI(false)

end

function BianGuanTitleOBJ:UpdateUI(isAnimation)
    local level = self.currLevel or 0
    local isRed = true
    local cfg = self.config[level]
    if not cfg then
        level = 10
        isRed = false
        cfg = self.config[#self.config]
    else
        level = level + 1
    end
    -- Create ImageView
    GUI:removeAllChildren(self.ui.Node)
	local ImageView = GUI:Image_Create(self.ui.Node, "level1", 676.00, 390.00, "res/custom/bianguanshouhu/Lv"..level..".png")
	GUI:setTouchEnabled(ImageView, false)
	GUI:setTag(ImageView, -1)

	-- Create ImageView_1
	local ImageView_1 = GUI:Image_Create(self.ui.Node, "level2", 580.00, 286.00, "res/custom/bianguanshouhu/number_"..level..".png")
	GUI:setTouchEnabled(ImageView_1, false)
	GUI:setTag(ImageView_1, -1)

    if isAnimation then
        GUI:Timeline_Window1(ImageView)
        GUI:Timeline_Window1(ImageView_1)
    end

    showCost(self.ui.Layout, cfg.cost)
    if isRed then
        Player:checkAddRedPoint(self.ui.ButtonSubmit, cfg.cost)
    else
        delRedPoint(self.ui.ButtonSubmit)
    end

end

function BianGuanTitleOBJ:SyncResponse(arg1)
    local isDh = false
    if self.currLevel ~= arg1 then
        isDh = true
    end
    self.currLevel = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI(isDh)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return BianGuanTitleOBJ
