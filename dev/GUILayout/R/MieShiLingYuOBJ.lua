MieShiLingYuOBJ = {}
MieShiLingYuOBJ.__cname = "MieShiLingYuOBJ"
--MieShiLingYuOBJ.config = ssrRequireCsvCfg("cfg_MieShiLingYu")
MieShiLingYuOBJ.cost = { { "〈古龙·意志〉", 1 }, { "〈古龙·之力〉", 1 }, { "太虚古龙的秘密", 1 } }
MieShiLingYuOBJ.give = { { "太虚古龙领域[完全体]", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MieShiLingYuOBJ:main(objcfg)
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
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MieShiLingYu_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
    self:UpdateUI()
end

function MieShiLingYuOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 91 )
    delRedPoint(self.ui.Button_1)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MieShiLingYuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MieShiLingYuOBJ