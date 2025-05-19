TeQuanOBJ = {}
TeQuanOBJ.__cname = "TeQuanOBJ"
--TeQuanOBJ.config = ssrRequireCsvCfg("cfg_TeQuan")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TeQuanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-55,-20)

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
    GUI:addOnClickEvent(self.ui.ButtonGet, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TeQuan_Request)
    end)


    --关闭置灰背景
    GUI:setTouchEnabled(self.ui.ChongZhiBeiJIng,true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.ChongZhiBeiJIng, function()
            GUI:setVisible(self.ui.ChongZhiBeiJIng, false)
    end)


    --选择充值类型并向后端发送信息
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TeQuan_PickType, 3)
        GUI:setVisible(self.ui.ChongZhiBeiJIng, false)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TeQuan_PickType, 1)
        GUI:setVisible(self.ui.ChongZhiBeiJIng, false)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TeQuan_PickType, 2)
        GUI:setVisible(self.ui.ChongZhiBeiJIng, false)
    end)

end

function TeQuanOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TeQuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TeQuanOBJ:TopUp(arg1, arg2, arg3, data)
    GUI:Text_setString(self.ui.ChongZhi_Num, arg1)
    GUI:setVisible(self.ui.ChongZhiBeiJIng, true)
    GUI:Timeline_Window2(self.ui.ImageView)
    GUI:Timeline_Window2(self.ui.ImageView)


end

return TeQuanOBJ