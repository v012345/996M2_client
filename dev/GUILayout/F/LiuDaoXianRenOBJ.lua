LiuDaoXianRenOBJ = {}
LiuDaoXianRenOBJ.__cname = "LiuDaoXianRenOBJ"
LiuDaoXianRenOBJ.cost = {{"天道灵玉", 1},{"修罗血晶", 1},{"人道魂石", 1},{"兽魂骨髓", 1},{"鬼泣之魄", 1},{"地狱业火石", 1}}

LiuDaoXianRenOBJ.itemlooks1 = {{"芭蕉扇", 1}}
LiuDaoXianRenOBJ.itemlooks2 = {{"琥珀净瓶", 1}}
LiuDaoXianRenOBJ.itemlooks3 = {{"六道轮回尘", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LiuDaoXianRenOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LiuDaoXianRen_Request)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    ssrAddItemListX(self.ui.itemshow_1, self.itemlooks1,"芭蕉扇",{imgRes = ""})
    ssrAddItemListX(self.ui.itemshow_2, self.itemlooks2,"琥珀净瓶",{imgRes = ""})
    ssrAddItemListX(self.ui.itemshow_3, self.itemlooks3,"六道轮回尘",{imgRes = ""})
    self:UpdateUI()
end

function LiuDaoXianRenOBJ:UpdateUI()
    showCost(self.ui.itemlook_1,{self.cost[1]},0,{itemBG = ""})
    showCost(self.ui.itemlook_2,{self.cost[2]},0,{itemBG = ""})
    showCost(self.ui.itemlook_3,{self.cost[3]},0,{itemBG = ""})
    showCost(self.ui.itemlook_4,{self.cost[4]},0,{itemBG = ""})
    showCost(self.ui.itemlook_5,{self.cost[5]},0,{itemBG = ""})
    showCost(self.ui.itemlook_6,{self.cost[6]},0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LiuDaoXianRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LiuDaoXianRenOBJ