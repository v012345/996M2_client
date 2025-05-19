JiHanZhiXinOBJ = {}
JiHanZhiXinOBJ.__cname = "JiHanZhiXinOBJ"
JiHanZhiXinOBJ.cost1 = {{"冰河之心", 1},{"金币", 18800000}}
JiHanZhiXinOBJ.cost2 = {{"冰魂结晶", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiHanZhiXinOBJ:main(objcfg)
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

    --按钮点击
    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiHanZhiXin_Request)
    end)


    ssrAddItemListX(self.ui.itemlooks_2, self.cost2,"冰魂结晶",{imgRes = ""})
    self:UpdateUI()

end

function JiHanZhiXinOBJ:UpdateUI()
    showCost(self.ui.itemlooks_1,{self.cost1[1]},0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost1,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiHanZhiXinOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiHanZhiXinOBJ