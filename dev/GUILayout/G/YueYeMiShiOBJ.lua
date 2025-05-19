YueYeMiShiOBJ = {}
YueYeMiShiOBJ.__cname = "YueYeMiShiOBJ"
--YueYeMiShiOBJ.config = ssrRequireCsvCfg("cfg_YueYeMiShi")
YueYeMiShiOBJ.cost = {{"泰兰德的金香蕉",1},{"异界神石",8}}
YueYeMiShiOBJ.give = {{"月夜战神的认可[称号卷]",1},{"月亮井",1},{"月影之痕[足迹]",1},{"除将印信",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YueYeMiShiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YueYeMiShi_Request)
    end)
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing = 30})
end


function YueYeMiShiOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,20)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 25, 5)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YueYeMiShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YueYeMiShiOBJ