QiYuShiJian08OBJ = {}
QiYuShiJian08OBJ.__cname = "QiYuShiJian08OBJ"
QiYuShiJian08OBJ.cost = {{"无主的宝箱", 1}}
QiYuShiJian08OBJ.EventName = "切换地图"

QiYuShiJian08OBJ.EventName1 = "关闭界面QiYuShiJian08OBJ"
QiYuShiJian08OBJ.EventName2 = "切换地图QiYuShiJian08OBJ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuShiJian08OBJ:main(objcfg)
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
        GUI:setVisible(self.ui.Ask_bg, true)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:setVisible(self.ui.Ask_bg, true)
    end)

    --收进盒子按钮
    GUI:addOnClickEvent(self.ui.Button_Yes, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian08_CloseUI)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian08_Request)
        GUI:Win_Close(self._parent)
    end)

    --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian08OBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian08OBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian08OBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian08OBJ.EventName2, function(table)
        GUI:Win_Close(QiYuShiJian08OBJ._parent)
    end)
end

function QiYuShiJian08OBJ:UpdateUI()
        ssrAddItemListX(self.ui.items_1, self.cost,"奖励1",{imgRes = ""})
end




-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuShiJian08OBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuShiJian08OBJ