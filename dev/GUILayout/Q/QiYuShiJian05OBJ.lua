QiYuShiJian05OBJ = {}
QiYuShiJian05OBJ.__cname = "QiYuShiJian05OBJ"
QiYuShiJian05OBJ.cost1 = {{"狗策划的手机[切割]", 1}}
QiYuShiJian05OBJ.cost2 = {{"狗策划的手机[爆率]", 1}}
QiYuShiJian05OBJ.cost3 = {{"狗策划的手机[经验]", 1}}
QiYuShiJian05OBJ.EventName1 = "关闭界面QiYuShiJian05OBJ"
QiYuShiJian05OBJ.EventName2 = "切换地图QiYuShiJian05OBJ"

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuShiJian05OBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian05_CloseUI)
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
        self:UpdateUI(3)
    end)


    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian05_Request, 1)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian05_Request, 2)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian05_Request, 3)
        GUI:Win_Close(self._parent)
    end)
    --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian05OBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian05OBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian05OBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian05OBJ.EventName2, function(table)
        GUI:Win_Close(QiYuShiJian05OBJ._parent)
    end)

end

function QiYuShiJian05OBJ:UpdateUI(num)

    GUI:setVisible(self.ui.Button_1, false)
    GUI:setVisible(self.ui.Button_2, false)
    GUI:setVisible(self.ui.Button_3, false)
    if num == 1 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_5_2.png")
        GUI:setVisible(self.ui.Button_4, true)
        ssrAddItemListX(self.ui.items_1, self.cost1,"奖励1",{imgRes = ""})
    elseif num == 2 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_5_3.png")
        GUI:setVisible(self.ui.Button_5, true)
        ssrAddItemListX(self.ui.items_2, self.cost2,"奖励1",{imgRes = ""})
    elseif num == 3 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_5_4.png")
        GUI:setVisible(self.ui.Button_6, true)
        ssrAddItemListX(self.ui.items_3, self.cost3,"奖励1",{imgRes = ""})
    end

end





-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuShiJian05OBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuShiJian05OBJ