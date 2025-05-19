MieShiLaoLongOBJ = {}
MieShiLaoLongOBJ.__cname = "MieShiLaoLongOBJ"
--MieShiLaoLongOBJ.config = ssrRequireCsvCfg("cfg_MieShiLaoLong")
MieShiLaoLongOBJ.cost = { { "龙魂封印石", 88 }, { "元宝", 300000 } }
MieShiLaoLongOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MieShiLaoLongOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.MieShiLaoLong_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MieShiLaoLong_Request2)
    end)
    self:UpdateUI()
end

function MieShiLaoLongOBJ:UpdateUI()
    local cost = { { "龙魂封印石", 88 } }
    showCostFont(self.ui.Panel_1, cost, { fontSize = 24 })
    local widget = GUI:getChildByName(self.ui.Panel_1, "Text_Cost_Name_1")
    if widget then
        local postX = GUI:getPositionX(widget)
        GUI:setPositionX(widget, postX - 130)
    end
    delRedPoint(self.ui.Button_1)
    if self.flag == 0 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    else
        addRedPoint(self.ui.Button_2,30,5)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MieShiLaoLongOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MieShiLaoLongOBJ