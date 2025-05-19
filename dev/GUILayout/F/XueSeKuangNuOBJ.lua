XueSeFangXianOBJ = {}
XueSeFangXianOBJ.__cname = "XueSeFangXianOBJ"
XueSeFangXianOBJ.cost1 = {{"狂怒护手",1}}
XueSeFangXianOBJ.cost2 = {{"狂意之怒",1}}
XueSeFangXianOBJ.RewardShow = {{"无尽狂怒[称号]",1}}



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XueSeFangXianOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XueSeKuangNu_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XueSeKuangNu_Request, 2)
    end)

    ssrMessage:sendmsg(ssrNetMsgCfg.XueSeKuangNu_LiaoJie)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

function XueSeFangXianOBJ:UpdateUI()
    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Image_1,false)
    GUI:setVisible(self.ui.Button_2,false)
    GUI:setVisible(self.ui.Image_2,false)

    if self.data[1] == 0 then
        GUI:setVisible(self.ui.Button_1,true)
    else
        GUI:setVisible(self.ui.Image_1,true)
    end

    if self.data[2] == 0 then
        GUI:setVisible(self.ui.Button_2,true)
    else
        GUI:setVisible(self.ui.Image_2,true)
    end


    showCost(self.ui.ItemLooks1,self.cost1,0,{itemBG = ""})
    showCost(self.ui.ItemLooks2,self.cost2,0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,5)
    Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,5)
    ssrAddItemListX(self.ui.ItemLooks3, self.RewardShow,"奖励1",{imgRes = ""})
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XueSeFangXianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XueSeFangXianOBJ