QiYuHeZiOBJ = {}
QiYuHeZiOBJ.__cname = "QiYuHeZiOBJ"
QiYuHeZiOBJ.config = ssrRequireCsvCfg("cfg_LuckyEvent_BoxData")

local Event_UI = {
    ["巨龙幼崽"] = {wnd = ssrObjCfg.QiYuShiJian01},
    ["老铁匠"] = {wnd = ssrObjCfg.QiYuShiJian02},
    ["邪恶秘籍"] = {wnd = ssrObjCfg.QiYuShiJian03},
    ["荒野迷宫"] = {wnd = ssrObjCfg.QiYuShiJian04},
    ["狗策划的手机"] = {wnd = ssrObjCfg.QiYuShiJian05},
    ["技术大神的电脑"] = {wnd = ssrObjCfg.QiYuShiJian06},
    ["老G的老舅"] = {wnd = ssrObjCfg.QiYuShiJian07},
    ["无主的宝箱"] = {wnd = ssrObjCfg.QiYuShiJian08},
    ["美女出浴"] = {wnd = ssrObjCfg.QiYuShiJian09},
    ["老乞丐"] = {wnd = ssrObjCfg.QiYuShiJian10},
    ["腐化符文"] = {wnd = ssrObjCfg.QiYuShiJian11},
    ["契约"] = {wnd = ssrObjCfg.QiYuShiJian12},
    ["诅咒的宝箱"] = {wnd = ssrObjCfg.QiYuShiJian13},
    ["遗落的祭坛"] = {wnd = ssrObjCfg.QiYuShiJian14},
    ["云游商人"] = {wnd = ssrObjCfg.QiYuShiJian15},
    ["黑市商人"] = {wnd = ssrObjCfg.QiYuShiJian16},
    ["钱庄老板"] = {wnd = ssrObjCfg.QiYuShiJian17},
    ["未知的洞窟"] = {wnd = ssrObjCfg.QiYuShiJian18}
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuHeZiOBJ:main(objcfg)
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_SetEventUIState, 1, 0, 0, nil)
    QiYuHeZiOBJ:CloseEventUI()
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -30)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    GUI:Win_SetESCClose(self._parent, false)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_SetEventUIState, 0, 0, 0, nil)
        GUI:Win_Close(self._parent)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.SeitchButton, function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Switch)
    end)


    GUI:addOnClickEvent(self.ui.Event_Button_1, function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Request, 0, 0, 1, {self.data[1]})
    end)

    GUI:addOnClickEvent(self.ui.Event_Button_2, function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Request, 0, 0, 2, {self.data[2]})
    end)

    GUI:addOnClickEvent(self.ui.Event_Button_3, function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Request, 0, 0, 3, {self.data[3]})
    end)

    GUI:addOnClickEvent(self.ui.Event_Button_4, function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Request, 0, 0, 4, {self.data[4]})
    end)

    GUI:addOnClickEvent(self.ui.Event_Button_5 , function()
    ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_Request, 0, 0, 5, {self.data[5]})
    end)

    GUI:addOnClickEvent(self.ui.DelAll , function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QiYuHeZi_DelAllEvent)
    end)
end


function QiYuHeZiOBJ:AddTopIcon()
    if GUI:getChildByName(MainAssist._Panel_hide,"时光回溯容器") then
        GUI:removeChildByName(MainAssist._Panel_hide,"时光回溯容器")
    end
    local layoutshow = GUI:Layout_Create(MainAssist._Panel_hide, "时光回溯容器", 20, 2, 100, 100)
    local Effect = GUI:Effect_Create(layoutshow, "Effect", 0.00, 72.00, 3, 12300, 0, 0, 0, 1.3)
    GUI:setTouchEnabled(layoutshow, true)
    GUI:addOnClickEvent(layoutshow,function()
        ssrUIManager:OPEN(ssrObjCfg.QiYuHeZi)
    end)

    local var1 = self.data[1]
    local var2 = self.data[2]
    local var3 = self.data[3]
    local var4 = self.data[4]
    local var5 = self.data[5]
    --SL:Print(var1, var2, var3, var4, var5)
    -- 判断所有变量是否都不等于 "" 且不等于 "未解锁"
    local all_not_empty_or_locked = (var1 == "" or var1 == "未解锁")
                                    and (var2 == "" or var2 == "未解锁")
                                    and (var3 == "" or var3 == "未解锁")
                                    and (var4 == "" or var4 == "未解锁")
                                    and (var5 == "" or var5 == "未解锁")
    if all_not_empty_or_locked then
        GUI:setVisible(layoutshow, false)
    end
end


function QiYuHeZiOBJ:UpdateUI()
    if self.arg1 == 0 then
        GUI:Button_loadTextureNormal(self.ui.SeitchButton, "res/custom/shiguanghuishuo/swicth01.png")
    else
        GUI:Button_loadTextureNormal(self.ui.SeitchButton, "res/custom/shiguanghuishuo/swicth02.png")
    end

    if self.data[1] ~= "" then
        for i, v in ipairs(self.config) do
            if v.EnevtName == self.data[1] then
                GUI:Button_loadTextureNormal(self.ui.Event_Button_1, "res/custom/shiguanghuishuo/eventimg/".. v.Image.. ".png")
                break
            end
        end
    else
        GUI:Button_loadTextureNormal(self.ui.Event_Button_1, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
    end

    if self.data[2] ~= "" then
        for i, v in ipairs(self.config) do
            if v.EnevtName == self.data[2] then
                GUI:Button_loadTextureNormal(self.ui.Event_Button_2, "res/custom/shiguanghuishuo/eventimg/".. v.Image.. ".png")
                break
            end
        end
    else
        GUI:Button_loadTextureNormal(self.ui.Event_Button_2, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
    end

    if self.data[3] ~= "" then
        for i, v in ipairs(self.config) do
            if v.EnevtName == self.data[3] then
                GUI:Button_loadTextureNormal(self.ui.Event_Button_3, "res/custom/shiguanghuishuo/eventimg/".. v.Image.. ".png")
                break
            end
        end
    else
        GUI:Button_loadTextureNormal(self.ui.Event_Button_3, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
    end

    if self.data[4] == "未解锁" then
    elseif self.data[4] ~= "" then
        for i, v in ipairs(self.config) do
            if v.EnevtName == self.data[4] then
                GUI:Button_loadTextureNormal(self.ui.Event_Button_4, "res/custom/shiguanghuishuo/eventimg/".. v.Image.. ".png")
                break
            end
        end
    else
        GUI:Button_loadTextureNormal(self.ui.Event_Button_4, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
    end

    if self.data[5] == "未解锁" then
    elseif self.data[5] ~= "" then
        for i, v in ipairs(self.config) do
            if v.EnevtName == self.data[5] then
                GUI:Button_loadTextureNormal(self.ui.Event_Button_5, "res/custom/shiguanghuishuo/eventimg/".. v.Image.. ".png")
                break
            end
        end
    else
        GUI:Button_loadTextureNormal(self.ui.Event_Button_5, "res/custom/shiguanghuishuo/eventimg/btn_null.png")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuHeZiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg1 = arg1
    self.data = data
    self:AddTopIcon()
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

--打开对应奇遇UI
function QiYuHeZiOBJ:OpenEventUI(arg1, arg2, arg3, data)
    for _, v in ipairs(self.config) do
        if v.EnevtName == data[1] then
            if v.Types == "召唤" then
                ssrUIManager:OPEN(ssrObjCfg.QiYuZhaoHuan)
            elseif v.Types == "副本" then
                ssrUIManager:OPEN(ssrObjCfg.QiYuFuBen)
            elseif v.Types == "事件" then
                ssrUIManager:OPEN(Event_UI[data[1]].wnd)
            end
        end
    end
end

function QiYuHeZiOBJ:CloseEventUI()
    local _GUIHandle = GUI:GetWindow(nil,"QiYuHeZiOBJ")
    if _GUIHandle then
      GUI:Win_Close(QiYuHeZiOBJ._parent)
    end
    local tb = {
        "QiYuShiJian01OBJ",
        "QiYuShiJian02OBJ",
        "QiYuShiJian03OBJ",
        "QiYuShiJian04OBJ",
        "QiYuShiJian05OBJ",
        "QiYuShiJian06OBJ",
        "QiYuShiJian07OBJ",
        "QiYuShiJian08OBJ",
        "QiYuShiJian09OBJ",
        "QiYuShiJian10OBJ",
        "QiYuShiJian11OBJ",
        "QiYuShiJian12OBJ",
        "QiYuShiJian13OBJ",
        "QiYuShiJian14OBJ",
        "QiYuShiJian15OBJ",
        "QiYuShiJian16OBJ",
        "QiYuShiJian17OBJ",
        "QiYuShiJian18OBJ",
        "QiYuZhaoHuanOBJ",
        "QiYuFuBenOBJ",
    }
    for i=1,#tb do
        local _GUIHandle = GUI:GetWindow(nil,tb[i])
        if _GUIHandle then
           GUI:Win_Close(_GUIHandle)
        end
    end

end


return QiYuHeZiOBJ