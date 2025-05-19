QiYuZhaoHuanOBJ = {}
QiYuZhaoHuanOBJ.__cname = "QiYuZhaoHuanOBJ"
QiYuZhaoHuanOBJ.config = ssrRequireCsvCfg("cfg_LuckyEvent_BoxData")
QiYuZhaoHuanOBJ.EventName1 = "关闭界面QiYuZhaoHuanOBJ"
QiYuZhaoHuanOBJ.EventName2 = "切换地图QiYuZhaoHuanOBJ"

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuZhaoHuanOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuZhaoHuan_CloseUI,0,0,0,self.data)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)

     --打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.Button_ZhaoHuan, function ()
        local _MonName = self.data[1]
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuZhaoHuan_Request,0,0,0, {_MonName})
        GUI:Win_Close(self._parent)
    end)
        --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuZhaoHuanOBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuZhaoHuanOBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuZhaoHuanOBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuZhaoHuanOBJ.EventName2, function(table)
        GUI:Win_Close(QiYuZhaoHuanOBJ._parent)
    end)
end

function QiYuZhaoHuanOBJ:UpdateUI()
    local img = nil
    for i, v in ipairs(self.config) do
        if self.data[1] == v.EnevtName then
            img = v.BGimg
            break
        end
    end
    GUI:Image_loadTexture(self.ui.ImageBG, "res/custom/qiyuxitong/jm/".. img ..".png")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuZhaoHuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuZhaoHuanOBJ