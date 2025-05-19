ShiJieDiTuOBJ = {}
ShiJieDiTuOBJ.__cname = "ShiJieDiTuOBJ"
ShiJieDiTuOBJ.EventName1 = "关闭界面ShiJieDiTuOBJ"
ShiJieDiTuOBJ.EventName2 = "切换地图ShiJieDiTuOBJ"

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShiJieDiTuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 3)
    end)

    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 4)
    end)

    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 5)
    end)

    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 6)
    end)

    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 7)
    end)

    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 8)
    end)

    GUI:addOnClickEvent(self.ui.Button_9, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 9)
    end)
    GUI:addOnClickEvent(self.ui.Button_10, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 10)
    end)

    GUI:addOnClickEvent(self.ui.Button_KuFu, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiJieDiTu_Request, 65535)
    end)

    GUI:addMouseMoveEvent(self.ui.Button_1,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_1, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_1, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_2,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_2, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_2, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_3,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_3, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_3, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_4,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_4, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_4, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_5,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_5, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_5, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_6,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_6, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_6, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_7,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_7, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_7, false)
        end
    } )

    GUI:addMouseMoveEvent(self.ui.Button_8,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_8, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_8, false)
        end
    } )
    GUI:addMouseMoveEvent(self.ui.Button_9,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_9, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_9, false)
        end
    } )
    GUI:addMouseMoveEvent(self.ui.Button_10,{
        onEnterFunc = function()
            GUI:setVisible(self.ui.statelook_10, true)
        end,
        onLeaveFunc = function()
            GUI:setVisible(self.ui.statelook_10, false)
        end
    } )
    self:UpdateUI()

        --关闭窗口 删除事件
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.EventName1, function()
        SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.EventName1)
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.EventName2)
    end)

    --切换地图关闭NPC窗口
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.EventName2, function(table)
        GUI:Win_Close(self._parent)
    end)
end

function ShiJieDiTuOBJ:UpdateUI()
    local num = tonumber(Player:getServerVar("U54"))
    local ObjTbl = GUI:getChildren(self.ui.AllNode)
    for i, v in ipairs(ObjTbl) do
        if num >= i then
            GUI:setVisible(v, true)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShiJieDiTuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShiJieDiTuOBJ