MoHuaTianShiCOBJ = {}
MoHuaTianShiCOBJ.__cname = "MoHuaTianShiCOBJ"
MoHuaTianShiCOBJ.itemlooks = {{"毁灭·魔化天使[無盡]", 1}}
MoHuaTianShiCOBJ.cost1 = {{"[無盡]死神之盾", 1},{"毁灭·魔化天使[傳奇]", 1},{"天工之锤", 1888},{"焚天石", 1888},{"金币", 60000000}}
MoHuaTianShiCOBJ.cost2 = {{"[無盡]死神之盾", 1},{"毁灭·魔化天使[傳奇]", 1},{"天工之锤", 1888},{"焚天石", 1888},{"元宝", 5000000}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MoHuaTianShiCOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.MoHuaTianShiC_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoHuaTianShiC_Request, 2)
    end)

    -- Create Effect
	GUI:Effect_Create(self.ui.Effect_1, "Effect", -117.00, 165.00, 3, 17505)
    self:UpdateUI()

end


function MoHuaTianShiCOBJ:UpdateUI()

    showCost(self.ui.item_1,{self.cost1[1]},0,{itemBG = ""})
    showCost(self.ui.item_2,{self.cost1[2]},0,{itemBG = ""})
    showCost(self.ui.item_3,{self.cost1[3]},0,{itemBG = ""})
    showCost(self.ui.item_4,{self.cost1[4]},0,{itemBG = ""})
    ssrAddItemListX(self.ui.item_5, self.itemlooks,"毁灭·魔化天使[無盡]",{imgRes = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MoHuaTianShiCOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MoHuaTianShiCOBJ