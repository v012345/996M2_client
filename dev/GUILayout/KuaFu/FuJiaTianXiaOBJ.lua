FuJiaTianXiaOBJ = {}
FuJiaTianXiaOBJ.__cname = "FuJiaTianXiaOBJ"
--FuJiaTianXiaOBJ.config = ssrRequireCsvCfg("cfg_FuJiaTianXia")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FuJiaTianXiaOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.FuJiaTianXia_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.FuJiaTianXia_Request,2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.FuJiaTianXia_Request,3)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.FuJiaTianXia_RequestSync)
end

function FuJiaTianXiaOBJ:UpdateUI()
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    local myName = SL:GetMetaValue("USER_NAME")
    for i = 1, 6 do
        local data = self.data[i]
        local name = "暂无"
        local money = 0
        if data then
            name = data.name
            money = data.money
        end
        local color = "#dcd7bb"
        if myName == name then
            color = "#FF00FF"
        end
        local Panel_1 = GUI:Layout_Create(self.ui.ListView_1, "Panel_1"..i, 0.00, 193.00, 334, 38, false)
        --local Text_name = GUI:Text_Create(Panel_1, "Text_3"..i, 101.00, 7.00, 16, "#dcd7bb", name)
        local Text_name = GUI:ScrollText_Create(Panel_1, "scrollText"..i, 101, 7, 220, 16, color, name)
        GUI:ScrollText_enableOutline(Text_name, "#000000", 1)
        GUI:setAnchorPoint(Text_name, 0.50, 0.00)
        local Text_money = GUI:Text_Create(Panel_1, "Text_4"..i, 221.00, 6.00, 16, "#eecf25", SL:GetSimpleNumber(money, 2))
        GUI:Text_enableOutline(Text_money, "#000000", 1)
    end
    GUI:Text_setString(self.ui.Text_1,SL:GetSimpleNumber(self.MyDonate, 2))
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FuJiaTianXiaOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data.data
    self.MyDonate = data.MyDonate
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FuJiaTianXiaOBJ