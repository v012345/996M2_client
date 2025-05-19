TanYuBuZhiOBJ = {}
TanYuBuZhiOBJ.__cname = "TanYuBuZhiOBJ"
TanYuBuZhiOBJ.config = ssrRequireCsvCfg("cfg_TanYuBuZhi")
TanYuBuZhiOBJ.cost = {}
TanYuBuZhiOBJ.give = {{"毁灭·魔化天使[吞噬]",1}}
for i, v in ipairs(TanYuBuZhiOBJ.config) do
    TanYuBuZhiOBJ.cost[i] = v.cost[1]
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TanYuBuZhiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.TanYuBuZhi_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TanYuBuZhi_Request,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TanYuBuZhi_Request,3)
    end)
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
end

function TanYuBuZhiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,120)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TanYuBuZhiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TanYuBuZhiOBJ