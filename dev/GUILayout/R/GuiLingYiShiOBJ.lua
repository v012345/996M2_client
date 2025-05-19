GuiLingYiShiOBJ = {}
GuiLingYiShiOBJ.__cname = "GuiLingYiShiOBJ"
--GuiLingYiShiOBJ.config = ssrRequireCsvCfg("cfg_GuiLingYiShi")
GuiLingYiShiOBJ.cost = { { "妖月之心", 20 }, { "厥阴之灵", 20 } }
GuiLingYiShiOBJ.give = {{"妖月内胆",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuiLingYiShiOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuiLingYiShi_Request)
    end)
    self:UpdateUI()
end

function GuiLingYiShiOBJ:Close()
    GUI:Win_Close(self._parent)
end

function GuiLingYiShiOBJ:UpdateUI()
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    showCost(self.ui.Panel_2,self.cost,80)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuiLingYiShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuiLingYiShiOBJ