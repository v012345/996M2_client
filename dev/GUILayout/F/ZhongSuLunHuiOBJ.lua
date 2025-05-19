ZhongSuLunHuiOBJ = {}
ZhongSuLunHuiOBJ.__cname = "ZhongSuLunHuiOBJ"
ZhongSuLunHuiOBJ.show = { {"六道轮回盘",1}}
ZhongSuLunHuiOBJ.cost1 = { {"混沌之心",1},{"元宝", 5550000} }
ZhongSuLunHuiOBJ.cost2 = { {"破灭之核",1},{"元宝", 5550000} }
ZhongSuLunHuiOBJ.cost3 = { {"轮回之魂",1},{"灵符", 12888} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhongSuLunHuiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhongSuLunHui_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhongSuLunHui_Request,2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhongSuLunHui_Request,3)
    end)





    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrAddItemListX(self.ui.ItemLooks1, self.show,"六道轮回盘",{imgRes = ""})
    self:UpdateUI()
end

function ZhongSuLunHuiOBJ:UpdateUI()
    local UiTbl = GUI:getChildren(self.ui.ButtonNode)
    for _, v in ipairs(UiTbl) do
        GUI:setVisible(v,false)
    end
    showCost(self.ui.ItemLooks2,{self.cost1[1]},0,{itemBG = ""})
    showCost(self.ui.ItemLooks3,{self.cost2[1]},0,{itemBG = ""})
    showCost(self.ui.ItemLooks4,{self.cost3[1]},0,{itemBG = ""})



    if self.data[1] == 0 then
        GUI:setVisible(self.ui.Button_1,true)
        Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    else
         GUI:setVisible(self.ui.JiHuo_1,true)
    end
    if self.data[2] == 0 then
        GUI:setVisible(self.ui.Button_2,true)
        Player:checkAddRedPoint(self.ui.Button_2,self.cost2,30,10)
    else
         GUI:setVisible(self.ui.JiHuo_2,true)
    end
    if self.data[3] == 0 then
        GUI:setVisible(self.ui.Button_3,true)
        Player:checkAddRedPoint(self.ui.Button_3,self.cost3,30,10)
    else
         GUI:setVisible(self.ui.JiHuo_3,true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhongSuLunHuiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZhongSuLunHuiOBJ