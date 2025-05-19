CaiLiaoHuoZhanOBJ = {}
CaiLiaoHuoZhanOBJ.__cname = "CaiLiaoHuoZhanOBJ"
CaiLiaoHuoZhanOBJ.config = ssrRequireCsvCfg("cfg_CaiLiaoHuoZhan")
CaiLiaoHuoZhanOBJ.cost = {
    { "幻灵水晶箱", 1 }, { "幻灵水晶箱(大)", 1 }, { "灵石袋(小)", 1 }, { "灵石袋", 1 }
}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function CaiLiaoHuoZhanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    for i, v in ipairs(self.config) do
        local Image_1 = GUI:Image_Create(self.ui.ListView_1, "Image_1"..i, 0.00, 0.00, "res/custom/CaiLiaoHuoZhan/list_bg.png")
        local Image_2 = GUI:Image_Create(Image_1, "Image_2"..i, 74.00, 178.00, "res/custom/CaiLiaoHuoZhan/itemName"..i..".png")
        GUI:setAnchorPoint(Image_2, 0.50, 0.00)
        local Panel_1 = GUI:Layout_Create(Image_1, "Panel_1"..i, 74.00, 132.00, 50, 50, false)
        ssrAddItemListX(Panel_1, v.give, "item_"..i, { imgRes = "" })
        local Button_1 = GUI:Button_Create(Image_1, "Button_1"..i, 16.00, 26.00, "res/custom/CaiLiaoHuoZhan/button.png")
        GUI:setTouchEnabled(Button_1, true)
        GUI:addOnClickEvent(Button_1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.CaiLiaoHuoZhan_Request, i)
        end)
    end
    self:UpdateUI()

    --
    --GUI:addOnClickEvent(self.ui.Button_1, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.CaiLiaoHuoZhan_Request, 1)
    --end)
    --
    --GUI:addOnClickEvent(self.ui.Button_2, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.CaiLiaoHuoZhan_Request, 2)
    --end)
    --
    --ssrAddItemListX(self.ui.ItemLooks_1, { self.cost[1] }, "奖励1", { imgRes = "" })
    --
    --ssrAddItemListX(self.ui.ItemLooks_2, { self.cost[2] }, "奖励2", { imgRes = "" })

end

function CaiLiaoHuoZhanOBJ:UpdateUI()
    GUI:Text_setString(self.ui.BuyUllooks, self.data[1] .. "/" .. self.data[2])
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function CaiLiaoHuoZhanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return CaiLiaoHuoZhanOBJ