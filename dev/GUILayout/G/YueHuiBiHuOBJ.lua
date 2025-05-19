YueHuiBiHuOBJ = {}
YueHuiBiHuOBJ.__cname = "YueHuiBiHuOBJ"
--YueHuiBiHuOBJ.config = ssrRequireCsvCfg("cfg_YueHuiBiHu")
YueHuiBiHuOBJ.cost = {{"〝回魂〞",1},{"灵符",888}}
YueHuiBiHuOBJ.costShow = {{"〝回魂〞",1}}
YueHuiBiHuOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YueHuiBiHuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YueHuiBiHu_Request)
    end)
    self:UpdateUI()
end

function YueHuiBiHuOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.costShow)
    GUI:Text_setString(self.ui.Text_1,string.format("%d/5",self.num))
    delRedPoint(self.ui.Button_1)
    if self.num < 5 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 20, 2)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YueHuiBiHuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.num = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YueHuiBiHuOBJ