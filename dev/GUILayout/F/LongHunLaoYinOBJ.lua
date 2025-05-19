LongHunLaoYinOBJ = {}
LongHunLaoYinOBJ.__cname = "LongHunLaoYinOBJ"
LongHunLaoYinOBJ.cost1 = {{"啸之戒指", 1},{"混沌本源", 66},{"灵符", 8888}}
LongHunLaoYinOBJ.cost2 = {{"天殇之痕", 1},{"混沌本源", 66},{"灵符", 8888}}
LongHunLaoYinOBJ.cost3 = {{"巨龙之印", 1},{"混沌本源", 66},{"灵符", 8888}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LongHunLaoYinOBJ:main(objcfg)
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
       ssrMessage:sendmsg(ssrNetMsgCfg.LongHunLaoYin_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LongHunLaoYin_Request,2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LongHunLaoYin_Request,3)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    self:UpdateUI()
end

function LongHunLaoYinOBJ:UpdateUI()
    GUI:setVisible(self.ui.Image_1,false)
    GUI:setVisible(self.ui.Image_2,false)
    GUI:setVisible(self.ui.Image_3,false)

    showCost(self.ui.ItemLooks_1,{self.cost1[1],self.cost1[2]},22,{itemBG = ""})
    showCost(self.ui.ItemLooks_2,{self.cost2[1],self.cost2[2]},22,{itemBG = ""})
    showCost(self.ui.ItemLooks_3,{self.cost3[1],self.cost3[2]},22,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)
    Player:checkAddRedPoint(self.ui.Button_3,self.cost3,30,10)

    if self.data[1] == 1 then
        GUI:setVisible(self.ui.Image_1,true)
    end
    
    if self.data[2] == 1 then
        GUI:setVisible(self.ui.Image_2,true)
    end

    if self.data[3] == 1 then
        GUI:setVisible(self.ui.Image_3,true)
    end


end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LongHunLaoYinOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LongHunLaoYinOBJ