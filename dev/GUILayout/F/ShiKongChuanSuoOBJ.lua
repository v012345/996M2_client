ShiKongChuanSuoOBJ = {}
ShiKongChuanSuoOBJ.__cname = "ShiKongChuanSuoOBJ"
ShiKongChuanSuoOBJ.itemlooks = {{"「穿梭」时间轮转", 1}}
ShiKongChuanSuoOBJ.cost = {{"斗转星移[精]+10", 1},{"穿梭时空的秘密", 1},{"哈法西斯之心", 5},{"灵石",288},{"金币",100000000},{"元宝",5880000}}



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShiKongChuanSuoOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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

    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiKongChuanSuo_Request, 1)
    end)
    self:UpdateUI()
end

function ShiKongChuanSuoOBJ:UpdateUI()
    showCost(self.ui.item_1,{self.cost[1]},0,{itemBG = ""})
    showCost(self.ui.item_2,{self.cost[2]},0,{itemBG = ""})
    showCost(self.ui.item_3,{self.cost[3]},0,{itemBG = ""})
    showCost(self.ui.item_4,{self.cost[4]},0,{itemBG = ""})
    ssrAddItemListX(self.ui.item_5, self.itemlooks,"「穿梭」时间轮转",{imgRes = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShiKongChuanSuoOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShiKongChuanSuoOBJ