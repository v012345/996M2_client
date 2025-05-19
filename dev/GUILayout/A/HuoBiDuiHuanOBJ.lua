HuoBiDuiHuanOBJ = {}
HuoBiDuiHuanOBJ.__cname = "HuoBiDuiHuanOBJ"
--HuoBiDuiHuanOBJ.config = ssrRequireCsvCfg("cfg_HuoBiDuiHuan")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HuoBiDuiHuanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)



    -------------------请求后端显示同步-------------------
    ssrMessage:sendmsg(ssrNetMsgCfg.HuoBiDuiHuan_SyncResponse)



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

    --问号按钮
    GUI:addOnClickEvent(self.ui.Button_help, function()
        local isShow = GUI:getVisible(self.ui.Help_layout)
        if isShow then
            GUI:setVisible(self.ui.Help_layout, false)
        else
            GUI:setVisible(self.ui.Help_layout, true)
        end
    end)

        --兑换按钮
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoBiDuiHuan_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoBiDuiHuan_Request,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoBiDuiHuan_Request,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoBiDuiHuan_Request,4)
    end)





    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()
end

function HuoBiDuiHuanOBJ:UpdateUI()
    GUI:Text_setString(self.ui.NumLooks, self.data[1].."/"..self.data[2])
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HuoBiDuiHuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    --SL:dump(data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HuoBiDuiHuanOBJ