MoHuaTianShiAOBJ = {}
MoHuaTianShiAOBJ.__cname = "MoHuaTianShiAOBJ"
MoHuaTianShiAOBJ.itemlooks1 = {{"毁灭·魔化天使[永恆]", 1}}
MoHuaTianShiAOBJ.cost = {{"魔化的眼罩", 1},{"圣灵壁垒+10", 1},{"天工之锤", 888},{"焚天石", 888},{"金币", 6000000}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MoHuaTianShiAOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)


    GUI:addOnClickEvent(self.ui.Button_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoHuaTianShiA_Request, 1)
    end)

    -- Create Effect
	GUI:Effect_Create(self.ui.Effect_1, "Effect", -105.00, 160.00, 3, 17513)
    self:UpdateUI()

end

function MoHuaTianShiAOBJ:UpdateUI()
    showCost(self.ui.item_1,{self.cost[1]},0,{itemBG = ""})
    showCost(self.ui.item_2,{self.cost[2]},0,{itemBG = ""})
    showCost(self.ui.item_3,{self.cost[3]},0,{itemBG = ""})
    showCost(self.ui.item_4,{self.cost[4]},0,{itemBG = ""})
    ssrAddItemListX(self.ui.item_5, self.itemlooks1,"毁灭·魔化天使[永恆]",{imgRes = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MoHuaTianShiAOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MoHuaTianShiAOBJ