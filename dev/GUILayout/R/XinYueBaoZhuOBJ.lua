XinYueBaoZhuOBJ = {}
XinYueBaoZhuOBJ.__cname = "XinYueBaoZhuOBJ"
--XinYueBaoZhuOBJ.config = ssrRequireCsvCfg("cfg_XinYueBaoZhu")
XinYueBaoZhuOBJ.cost = { { "新月之冠", 1 }, { "月光手环", 1 }, { "月光印记", 1 } }
XinYueBaoZhuOBJ.give = { { "新月宝珠", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XinYueBaoZhuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -40)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.XinYueBaoZhu_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_", { imgRes = "" })
    self:UpdateUI()
end

function XinYueBaoZhuOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 91, { itemBG = "" })
    delRedPoint(self.ui.Button_1)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XinYueBaoZhuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XinYueBaoZhuOBJ