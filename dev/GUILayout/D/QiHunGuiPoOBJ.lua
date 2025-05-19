QiHunGuiPoOBJ = {}
QiHunGuiPoOBJ.__cname = "QiHunGuiPoOBJ"
--QiHunGuiPoOBJ.config = ssrRequireCsvCfg("cfg_QiHunGuiPo")
QiHunGuiPoOBJ.cost = {{"七魄·尸狗", 1},{"七魄·伏矢", 1},{"七魄·雀阴", 1},{"七魄·吞贼", 1},{"七魄·非毒", 1},{"七魄·除秽", 1},{"七魄·臭肺", 1},{"灵符", 200}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiHunGuiPoOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 4)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 5)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 6)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiHunGuiPo_Request, 7)
    end)

    QiHunGuiPoOBJ:UpdateUI()
end

function QiHunGuiPoOBJ:UpdateUI()
    showCost(self.ui.ItemShow_1, {self.cost[1]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_2, {self.cost[2]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_3, {self.cost[3]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_4, {self.cost[4]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_5, {self.cost[5]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_6, {self.cost[6]}, 30, {itemBG = ""})
    showCost(self.ui.ItemShow_7, {self.cost[7]}, 30, {itemBG = ""})

    GUI:Text_setString(self.ui.NumShow_1, self.data["尸狗"].."/10")
    GUI:Text_setString(self.ui.NumShow_2, self.data["伏矢"].."/10")
    GUI:Text_setString(self.ui.NumShow_3, self.data["雀阴"].."/10")
    GUI:Text_setString(self.ui.NumShow_4, self.data["吞贼"].."/10")
    GUI:Text_setString(self.ui.NumShow_5, self.data["非毒"].."/10")
    GUI:Text_setString(self.ui.NumShow_6, self.data["除秽"].."/10")
    GUI:Text_setString(self.ui.NumShow_7, self.data["臭肺"].."/10")

    Player:checkAddRedPoint(self.ui.Button_1, {self.cost[1], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_2, {self.cost[2], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_3, {self.cost[3], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_4, {self.cost[4], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_5, {self.cost[5], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_6, {self.cost[6], self.cost[8]}, 18, 16)
    Player:checkAddRedPoint(self.ui.Button_7, {self.cost[7], self.cost[8]}, 18, 16)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiHunGuiPoOBJ:SyncResponse(arg1, arg2, arg3, data)

    self.data = data

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiHunGuiPoOBJ