QiYuShiJian04OBJ = {}
QiYuShiJian04OBJ.__cname = "QiYuShiJian04OBJ"
QiYuShiJian04OBJ.cost1 = {{"焚天石", 10}}
QiYuShiJian04OBJ.cost2 = {{"金币", 100000}}
QiYuShiJian04OBJ.EventName1 = "关闭界面QiYuShiJian04OBJ"
QiYuShiJian04OBJ.EventName2 = "切换地图QiYuShiJian04OBJ"


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuShiJian04OBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_CloseUI)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)


    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_SyncResponse)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_SyncResponse)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_SyncResponse)
    end)

    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_SyncResponse)
    end)

    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_Request, 1)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_Request, 2)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_Request, 3)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuShiJian04_Request, 4)
        GUI:Win_Close(self._parent)
    end)

    --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian04OBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuShiJian04OBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian04OBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuShiJian04OBJ.EventName2, function(table)
        GUI:Win_Close(QiYuShiJian04OBJ._parent)
    end)
end

function QiYuShiJian04OBJ:UpdateUI(num)
    GUI:setVisible(self.ui.Button_1, false)
    GUI:setVisible(self.ui.Button_2, false)
    GUI:setVisible(self.ui.Button_3, false)
    GUI:setVisible(self.ui.Button_4, false)

    if num == 1 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_4_2.png")
        GUI:setVisible(self.ui.Button_5, true)
        ssrAddItemListX(self.ui.items_1, self.cost1,"奖励1",{imgRes = ""})
    elseif num == 2 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_4_3.png")
        GUI:setVisible(self.ui.Button_6, true)
    elseif num == 3 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_4_4.png")
        GUI:setVisible(self.ui.Button_7, true)
        ssrAddItemListX(self.ui.items_2, self.cost2,"奖励2",{imgRes = ""})
    elseif num == 4 then
        GUI:Image_loadTexture(self.ui.ImageBG,"res/custom/qiyuxitong/jm/jm_4_5.png")
        GUI:setVisible(self.ui.Button_8, true)
    end

end



-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuShiJian04OBJ:SyncResponse(arg1, arg2, arg3, data)
    SL:dump(data[1])
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI(data[1])
    end
end
return QiYuShiJian04OBJ