YeMuJiangLingOBJ = {}
YeMuJiangLingOBJ.__cname = "YeMuJiangLingOBJ"
YeMuJiangLingOBJ.cost = {{"幕轮", 1},{"影幕之指", 1},{"造化结晶", 188}}
YeMuJiangLingOBJ.give = {{"黑刀·夜", 1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YeMuJiangLingOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YeMuJiangLing_Request)
    end)
    self:UpdateUI()
    ssrAddItemListX(self.ui.ItemShow, self.give,"奖励1",{imgRes = ""})
end

function YeMuJiangLingOBJ:UpdateUI()
    showCost(self.ui.CostShow,self.cost,90,{itemBG = ""})
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YeMuJiangLingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YeMuJiangLingOBJ