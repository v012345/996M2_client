QiYuFuBenOBJ = {}
QiYuFuBenOBJ.__cname = "QiYuFuBenOBJ"
QiYuFuBenOBJ.config = ssrRequireCsvCfg("cfg_LuckyEvent_BoxData")
QiYuFuBenOBJ.EventName1 = "关闭界面QiYuFuBenOBJ"
QiYuFuBenOBJ.EventName2 = "切换地图QiYuFuBenOBJ"

local qyBanMaps = {
    ["月夜密室"] = true
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuFuBenOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuFuBen_CloseUI,0,0,0,self.data)
        GUI:Win_Close(self._parent)
    end)

    --放弃奇遇按钮
    GUI:addOnClickEvent(self.ui.Button_No, function()
       GUI:Win_Close(self._parent)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.Button_JinRuFuBen, function ()
        local NowMapID = SL:GetMetaValue("MAP_ID")
        if qyBanMaps[NowMapID] then
            sendmsg9("提示#251|:#255|当前地图禁止进入奇遇副本!#249")
            return
        end
        local _EventName = self.data[1]
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuFuBen_Request,0,0,0, {_EventName})
        GUI:Win_Close(self._parent)
    end)
        --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuFuBenOBJ.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, QiYuFuBenOBJ.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuFuBenOBJ.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, QiYuFuBenOBJ.EventName2, function(table)
        GUI:Win_Close(QiYuFuBenOBJ._parent)
    end)
end

function QiYuFuBenOBJ:UpdateUI()
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
function QiYuFuBenOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuFuBenOBJ