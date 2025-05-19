JiLuShiOBJ = {}
JiLuShiOBJ.__cname = "JiLuShiOBJ"
--JiLuShiOBJ.config = ssrRequireCsvCfg("cfg_JiLuShi")
JiLuShiOBJ.eventName = "记录石"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiLuShiOBJ:main(objcfg)
end

function JiLuShiOBJ:OpenUI(arg1, arg2, arg3, data)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true)
    GUI:LoadExport(parent, "A/JiLuShiUI")
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-42,-18)
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
     --打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    if data[1].name then
        GUI:Text_setString(self.ui.name_1,data[1].name)
        GUI:Text_setString(self.ui.xylooks_1,"["..data[1].x..","..data[1].y.."]")
    end

    if data[2].name then
        GUI:Text_setString(self.ui.name_2,data[2].name)
        GUI:Text_setString(self.ui.xylooks_2,"["..data[2].x..","..data[2].y.."]")
    end

    if data[3].name then
        GUI:Text_setString(self.ui.name_3,data[3].name)
        GUI:Text_setString(self.ui.xylooks_3,"["..data[3].x..","..data[3].y.."]")
    end

    if data[4].name then
        GUI:Text_setString(self.ui.name_4,data[4].name)
        GUI:Text_setString(self.ui.xylooks_4,"["..data[4].x..","..data[4].y.."]")
    end

    if data[5].name then
        GUI:Text_setString(self.ui.name_5,data[5].name)
        GUI:Text_setString(self.ui.xylooks_5,"["..data[5].x..","..data[5].y.."]")
    end

    if data[6].name then
        GUI:Text_setString(self.ui.name_6,data[6].name)
        GUI:Text_setString(self.ui.xylooks_6,"["..data[6].x..","..data[6].y.."]")
    end
    ------------------------------------------------------------记录地图
    GUI:addOnClickEvent(self.ui.Record_1, function ()
        local name = GUI:Text_getString(self.ui.name_1)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,1)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,1)
        end

    end)

    GUI:addOnClickEvent(self.ui.Record_2, function ()
        local name = GUI:Text_getString(self.ui.name_2)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,2)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,2)
        end
    end)

    GUI:addOnClickEvent(self.ui.Record_3, function ()
        local name = GUI:Text_getString(self.ui.name_3)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,3)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,3)
        end
    end)

    GUI:addOnClickEvent(self.ui.Record_4, function ()
        local name = GUI:Text_getString(self.ui.name_4)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,4)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,4)
        end
    end)

    GUI:addOnClickEvent(self.ui.Record_5, function ()
        local name = GUI:Text_getString(self.ui.name_5)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,5)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,5)
        end
    end)

    GUI:addOnClickEvent(self.ui.Record_6, function ()
        local name = GUI:Text_getString(self.ui.name_6)
        if name ~= "未记录" then
            local data = {}
            data.str = "当前位置已记录【"..name.."】，是否覆盖？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,6)
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Record,6)
        end
    end)

    ------------------------------------------------------------传送地图
    GUI:addOnClickEvent(self.ui.Move_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,1)
    end)

    GUI:addOnClickEvent(self.ui.Move_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,2)
    end)

    GUI:addOnClickEvent(self.ui.Move_3, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,3)
    end)

    GUI:addOnClickEvent(self.ui.Move_4, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,4)
    end)

    GUI:addOnClickEvent(self.ui.Move_5, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,5)
    end)

    GUI:addOnClickEvent(self.ui.Move_6, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiLuShi_Move,6)
    end)
    self:RegisterEvent()
end

function JiLuShiOBJ:UpdateUI(data)
    if data[1].name then
        GUI:Text_setString(self.ui.name_1,data[1].name)
        GUI:Text_setString(self.ui.xylooks_1,"["..data[1].x..","..data[1].y.."]")
    end

    if data[2].name then
        GUI:Text_setString(self.ui.name_2,data[2].name)
        GUI:Text_setString(self.ui.xylooks_2,"["..data[2].x..","..data[2].y.."]")
    end

    if data[3].name then
        GUI:Text_setString(self.ui.name_3,data[3].name)
        GUI:Text_setString(self.ui.xylooks_3,"["..data[3].x..","..data[3].y.."]")
    end

    if data[4].name then
        GUI:Text_setString(self.ui.name_4,data[4].name)
        GUI:Text_setString(self.ui.xylooks_4,"["..data[4].x..","..data[4].y.."]")
    end

    if data[5].name then
        GUI:Text_setString(self.ui.name_5,data[5].name)
        GUI:Text_setString(self.ui.xylooks_5,"["..data[5].x..","..data[5].y.."]")
    end

    if data[6].name then
        GUI:Text_setString(self.ui.name_6,data[6].name)
        GUI:Text_setString(self.ui.xylooks_6,"["..data[6].x..","..data[6].y.."]")
    end
end

--关闭窗口
function JiLuShiOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end
-------------------------------↓↓↓ 注册事件 ↓↓↓---------------------------------------
function JiLuShiOBJ:RegisterEvent()
    SL:RegisterLUAEvent(LUA_EVENT_CHANGESCENE, self.eventName, function()
        GUI:Win_Close(self._parent)
    end)
        --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function JiLuShiOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CHANGESCENE, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiLuShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI(data)
    end
end
return JiLuShiOBJ