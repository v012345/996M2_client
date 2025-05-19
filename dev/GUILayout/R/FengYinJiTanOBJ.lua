FengYinJiTanOBJ = {}
FengYinJiTanOBJ.__cname = "FengYinJiTanOBJ"
--FengYinJiTanOBJ.config = ssrRequireCsvCfg("cfg_FengYinJiTan")
FengYinJiTanOBJ.cost = { { "卡亚神符", 20 }, { "邪神印记", 20 }, { "金币", 300000 } }
FengYinJiTanOBJ.give = { {"邪神之冠",1}, {"邪神之牙",1}, {"神庙掌控者",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FengYinJiTanOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)
    showCost(self.ui.Panel_1, self.cost, 30)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.FengYinJiTan_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2, self.give,"item_",{spacing = 30})
end
function FengYinJiTanOBJ:Close()
    GUI:Win_Close(self._parent)
end
function FengYinJiTanOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FengYinJiTanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FengYinJiTanOBJ