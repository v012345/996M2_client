TianJieZhiLuOBJ = {}
TianJieZhiLuOBJ.__cname = "TianJieZhiLuOBJ"
--TianJieZhiLuOBJ.config = ssrRequireCsvCfg("cfg_TianJieZhiLu")
TianJieZhiLuOBJ.cost = {{"元宝",500000}}
TianJieZhiLuOBJ.give = { { "仙凡有别[称号]", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TianJieZhiLuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.TianJieZhiLu_Request)
    end)
    self:UpdateUI()
end

function TianJieZhiLuOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,0)
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TianJieZhiLuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TianJieZhiLuOBJ