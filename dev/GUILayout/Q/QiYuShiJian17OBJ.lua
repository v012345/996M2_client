QiYuShiJian17OBJ = {}
QiYuShiJian17OBJ.__cname = "QiYuShiJian17OBJ"
QiYuShiJian17OBJ.EventName1 = "关闭界面QiYuShiJian17OBJ"
QiYuShiJian17OBJ.EventName2 = "切换地图QiYuShiJian17OBJ"


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuShiJian17OBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_CloseUI)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

        GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 3)
    end)

    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 4)
    end)

    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 5)
    end)

    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian17_Request, 6)
    end)


    --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian17OBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian17OBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian17OBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian17OBJ.EventName2, function(table)
        GUI:Win_Close(QiYuShiJian17OBJ._parent)
    end)

end

function QiYuShiJian17OBJ:UpdateUI()
    local numlookinfo = GUI:getChildren(self.ui.numlook)
    for i, v in ipairs(numlookinfo) do
        GUI:Text_setString(v,self.data[i].."/3次")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuShiJian17OBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuShiJian17OBJ