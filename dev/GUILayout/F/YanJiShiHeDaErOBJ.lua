YanJiShiHeDaErOBJ = {}
YanJiShiHeDaErOBJ.__cname = "YanJiShiHeDaErOBJ"
YanJiShiHeDaErOBJ.cost1 = {{"炎魂碎片", 1}}
YanJiShiHeDaErOBJ.cost2 = {{"日耀精华", 1}}

--YanJiShiHeDaErOBJ.config = ssrRequireCsvCfg("cfg_YanJiShiHeDaEr")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YanJiShiHeDaErOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YanJiShiHeDaEr_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YanJiShiHeDaEr_Request, 2)
    end)

    ssrAddItemListX(self.ui.itemlooks_2, self.cost2,"日耀精华",{imgRes = ""})
    self:UpdateUI()
end

function YanJiShiHeDaErOBJ:UpdateUI()

	GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, self.arg1 * 10)



    showCost(self.ui.itemlooks_1,self.cost1,0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
    GUI:Text_setString(self.ui.ExpLooks,  self.arg1 .."/10")



end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YanJiShiHeDaErOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg1 = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YanJiShiHeDaErOBJ