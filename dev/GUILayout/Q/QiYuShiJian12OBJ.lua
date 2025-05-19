QiYuShiJian12OBJ = {}
QiYuShiJian12OBJ.__cname = "QiYuShiJian12OBJ"
QiYuShiJian12OBJ.cost1 = {{"神圣契约", 1}}
QiYuShiJian12OBJ.cost2 = {{"恶魔契约", 1}}
QiYuShiJian12OBJ.EventName1 = "关闭界面QiYuShiJian12OBJ"
QiYuShiJian12OBJ.EventName2 = "切换地图QiYuShiJian12OBJ"

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuShiJian12OBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian12_CloseUI)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        self:UpdateUI(1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        self:UpdateUI(2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian12_Request, 1)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian12_Request, 2)
        GUI:Win_Close(self._parent)
    end)
    --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian12OBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian12OBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian12OBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian12OBJ.EventName2, function(table)
        GUI:Win_Close(QiYuShiJian12OBJ._parent)
    end)

end

function QiYuShiJian12OBJ:UpdateUI(num)
    GUI:setVisible(self.ui.Button_1, false)
    GUI:setVisible(self.ui.Button_2, false)
    if num == 1 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_12_3.png")
        GUI:setVisible(self.ui.Button_3, true)
        ssrAddItemListX(self.ui.items_1, self.cost1,"奖励1",{imgRes = ""})
    else
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_12_2.png")
        GUI:setVisible(self.ui.Button_4, true)
        ssrAddItemListX(self.ui.items_2, self.cost2,"奖励1",{imgRes = ""})
    end
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuShiJian12OBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuShiJian12OBJ