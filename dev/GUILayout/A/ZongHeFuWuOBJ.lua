ZongHeFuWuOBJ = {}
ZongHeFuWuOBJ.__cname = "ZongHeFuWuOBJ"

function ZongHeFuWuOBJ:main(objcfg)
    local parent = GUI:Win_Create(ZongHeFuWuOBJ.__cname, 0, 0, 0, false, false, false, true, true)
    self._parent = parent
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2)
    -- GUI:Timeline_Window1(self.ui.ImageBG)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    ----列表点击事件----
    GUI:addOnClickEvent(self.ui.Text1_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZongHeFuWu_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Text1_2, function()
        GUI:setVisible(self.ui.Layout, true)
    end)
    GUI:addOnClickEvent(self.ui.Text1_3, function()
        SL:SendLuaNetMsg(5000, 1, 0, 0, "")
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Text2_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZongHeFuWu_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Text2_2, function()
        GUI:setVisible(self.ui.Layout, true)
    end)
    GUI:addOnClickEvent(self.ui.Text2_3, function()
        SL:SendLuaNetMsg(5000, 1, 0, 0, "")
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Text3_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZongHeFuWu_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Text3_2, function()
        GUI:setVisible(self.ui.Layout, true)
    end)
    GUI:addOnClickEvent(self.ui.Text3_3, function()
        SL:SendLuaNetMsg(5000, 1, 0, 0, "")
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Text4_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZongHeFuWu_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Text4_2, function()
        GUI:setVisible(self.ui.Layout, true)
    end)
    GUI:addOnClickEvent(self.ui.Text4_3, function()
        SL:SendLuaNetMsg(5000, 1, 0, 0, "")
        GUI:Win_Close(self._parent)
    end)

    -----千里传音点击事件
    GUI:addOnClickEvent(self.ui.Layout, function()
        GUI:setVisible(self.ui.Layout, false)
        -- GUI:TextInput_setString(self.ui.Input, "")
    end)
    GUI:addOnClickEvent(self.ui.CloseCYButton, function()
        GUI:setVisible(self.ui.Layout, false)
        -- GUI:TextInput_setString(self.ui.Input, "")
    end)
    GUI:addOnClickEvent(self.ui.ButtonCYSend, function()
        local str = GUI:TextInput_getString(self.ui.Input)
        if str == "" then
            SL:ShowSystemTips("输入内容不能为空!")
            return
        end
        if utf8_length(str) > 60 then
            SL:ShowSystemTips("字符数量不能超过60个字符!")
            return
        end
        local moneyNum = tonumber(SL:GetMetaValue("TMONEY", "灵符"))
        if moneyNum < 10 then
            sendmsg9("抱歉你的#250|灵符#249|不足#250|10#249")
            return
        end
        local myRelevel = SL:GetMetaValue("RELEVEL")
        if myRelevel < 1 then
            sendmsg9("抱歉你的#250|转生等级#249|不足#250|1#249|无法使用千里传音!#250")
            return
        end
        
        ssrMessage:sendmsg(ssrNetMsgCfg.ZongHeFuWu_Request,2,0,0,{str})
        GUI:TextInput_setString(self.ui.Input, "")
        GUI:setVisible(self.ui.Layout, false)
    end)
    self:TextLine()
end

function ZongHeFuWuOBJ:TextLine()
    GUI:Text_enableUnderline(self.ui.Text1_1)
    GUI:Text_enableUnderline(self.ui.Text1_2)
    GUI:Text_enableUnderline(self.ui.Text1_3)
    GUI:Text_enableUnderline(self.ui.Text2_1)
    GUI:Text_enableUnderline(self.ui.Text2_2)
    GUI:Text_enableUnderline(self.ui.Text2_3)
    GUI:Text_enableUnderline(self.ui.Text3_1)
    GUI:Text_enableUnderline(self.ui.Text3_2)
    GUI:Text_enableUnderline(self.ui.Text3_3)
    GUI:Text_enableUnderline(self.ui.Text4_1)
    GUI:Text_enableUnderline(self.ui.Text4_2)
    GUI:Text_enableUnderline(self.ui.Text4_3)
end

return ZongHeFuWuOBJ