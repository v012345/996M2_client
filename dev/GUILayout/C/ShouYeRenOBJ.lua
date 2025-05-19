ShouYeRenOBJ = {}
ShouYeRenOBJ.__cname = "ShouYeRenOBJ"
--ShouYeRenOBJ.config = ssrRequireCsvCfg("cfg_ShouYeRen")
ShouYeRenOBJ.cost = { { "老村长的怀表", 1 }, { "天工之锤", 1888 }, { "焚天石", 1888 } }
ShouYeRenOBJ.give = { { "守夜人之徽", 1 } }

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShouYeRenOBJ:main(objcfg)
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
    GUI:addOnClickEvent(self.ui.Button, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShouYeRen_Request)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

function ShouYeRenOBJ:UpdateUI()
    showCost(self.ui.Layout, self.cost, 92)
    ssrAddItemListX(self.ui.Layout_1, self.give, "item", { imgRes = "res/custom/public/itemBG.png" })
    Player:checkAddRedPoint(self.ui.Button, self.cost)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShouYeRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShouYeRenOBJ