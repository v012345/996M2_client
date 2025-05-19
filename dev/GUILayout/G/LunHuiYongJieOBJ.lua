LunHuiYongJieOBJ = {}
LunHuiYongJieOBJ.__cname = "LunHuiYongJieOBJ"
--LunHuiYongJieOBJ.config = ssrRequireCsvCfg("cfg_LunHuiYongJie")
LunHuiYongJieOBJ.costShow = { { "混沌本源", 88 }, { "造化结晶", 88 } }
LunHuiYongJieOBJ.cost = { { "混沌本源", 88 }, { "造化结晶", 88 }, { "元宝", 4880000 } }
LunHuiYongJieOBJ.give = { { "「穿梭」时间轮转", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LunHuiYongJieOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.LunHuiYongJie_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
    self:UpdateUI()
end

function LunHuiYongJieOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.costShow,250)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LunHuiYongJieOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LunHuiYongJieOBJ