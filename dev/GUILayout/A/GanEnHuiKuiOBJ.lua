GanEnHuiKuiOBJ = {}
GanEnHuiKuiOBJ.__cname = "GanEnHuiKuiOBJ"
GanEnHuiKuiOBJ.show = {{"10元充值红包", 1},{"每日特权礼包", 1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GanEnHuiKuiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)

    --同步后端
    ssrMessage:sendmsg(ssrNetMsgCfg.GanEnHuiKui_SyncResponse)

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

    --打开日冲界面
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GanEnHuiKui_Request,1)
    end)

    --查看兑换界面
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrUIManager:OPEN(ssrObjCfg.HuoBiDuiHuan)
    end)

    --领取礼包
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GanEnHuiKui_Request,2)
    end)

    --领取称号
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GanEnHuiKui_Request,3)
    end)

    ssrAddItemListX(self.ui.ItemLooks, self.show,"奖励显示",{imgRes = "",spacing = 88})
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:setVisible(self.ui.Image_LingQu1,false)
    --self:UpdateUI()
end

function GanEnHuiKuiOBJ:UpdateUI()
    GUI:setVisible(self.ui.Button_3,false)
    if self.data[1] == "已领取" then
        GUI:setVisible(self.ui.Image_LingQu1,true)
    else
        GUI:setVisible(self.ui.Button_3,true)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GanEnHuiKuiOBJ:SyncResponse(arg1, arg2, arg3, data)
     self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

function GanEnHuiKuiOBJ:OpenClientUI(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        ssrUIManager:OPEN(ssrObjCfg.MeiRiChongZhi)
    end
end

return GanEnHuiKuiOBJ