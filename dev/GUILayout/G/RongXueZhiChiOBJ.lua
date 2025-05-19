RongXueZhiChiOBJ = {}
RongXueZhiChiOBJ.__cname = "RongXueZhiChiOBJ"
--RongXueZhiChiOBJ.config = ssrRequireCsvCfg("cfg_RongXueZhiChi")
RongXueZhiChiOBJ.cost = { { "血色残刃", 1 }, { "破天印记", 1 } }
RongXueZhiChiOBJ.cost1 = { { "血色残刃", 1 } }
RongXueZhiChiOBJ.cost2 = { { "破天印记", 1 } }
RongXueZhiChiOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function RongXueZhiChiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.RongXueZhiChi_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RongXueZhiChi_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RongXueZhiChi_EnterMap)
    end)
    self:UpdateUI()
end

function RongXueZhiChiOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 126)
    GUI:Text_setString(self.ui.Text_1, string.format("%d/100", self.count1))
    GUI:Text_setString(self.ui.Text_2, string.format("%d/5", self.count2))
    delRedPoint(self.ui.Button_1)
    delRedPoint(self.ui.Button_2)
    if self.count1 < 100 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost1, 20, 4)
    end
    if self.count2 < 5 then
        Player:checkAddRedPoint(self.ui.Button_2, self.cost2, 20, 4)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function RongXueZhiChiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count1 = arg1
    self.count2 = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return RongXueZhiChiOBJ