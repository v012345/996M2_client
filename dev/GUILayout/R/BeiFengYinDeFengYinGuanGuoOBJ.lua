BeiFengYinDeFengYinGuanGuoOBJ = {}
BeiFengYinDeFengYinGuanGuoOBJ.__cname = "BeiFengYinDeFengYinGuanGuoOBJ"
--BeiFengYinDeFengYinGuanGuoOBJ.config = ssrRequireCsvCfg("cfg_BeiFengYinDeFengYinGuanGuo")
BeiFengYinDeFengYinGuanGuoOBJ.items = { { "百年古棺", 1 }, { "千年古棺", 1 }, { "万年古棺", 1 }, { "十万年古棺", 1 } }
BeiFengYinDeFengYinGuanGuoOBJ.gives = { { "被封印的棺材", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BeiFengYinDeFengYinGuanGuoOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
    ssrAddItemListX(self.ui.Panel_1, self.items, "item_", { spacing = 15 })
    ssrAddItemListX(self.ui.Panel_2, self.gives, "item_", { spacing = 15 })
    ssrAddItemListX(self.ui.Panel_3, self.gives, "item_", { spacing = 15 })
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.BeiFengYinDeFengYinGuanGuo_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.BeiFengYinDeFengYinGuanGuo_Request2)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.BeiFengYinDeFengYinGuanGuo_SyncResponse)
end

function BeiFengYinDeFengYinGuanGuoOBJ:UpdateUI()
    local num1, num2 = self.data[1], self.data[2]
    GUI:Text_setString(self.ui.Text_1, string.format("(%d/400)", num1))
    GUI:Text_setString(self.ui.Text_2, string.format("(%d/10)", num2))
    delRedPoint(self.ui.Button_1)
    delRedPoint(self.ui.Button_2)
    if num1 >= 2000 and self.flag1 == 0 then
        addRedPoint(self.ui.Button_1,30,5)
    end
    if num2 >= 30 and self.flag2 == 0 then
        addRedPoint(self.ui.Button_2,30,5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function BeiFengYinDeFengYinGuanGuoOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag1 = arg1
    self.flag2 = arg2
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return BeiFengYinDeFengYinGuanGuoOBJ