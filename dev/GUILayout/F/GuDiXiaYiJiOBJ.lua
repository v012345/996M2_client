GuDiXiaYiJiOBJ = {}
GuDiXiaYiJiOBJ.__cname = "GuDiXiaYiJiOBJ"
--GuDiXiaYiJiOBJ.config = ssrRequireCsvCfg("cfg_GuDiXiaYiJi")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuDiXiaYiJiOBJ:main(objcfg)
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
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuDiXiaYiJi_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuDiXiaYiJi_Request, 2)
    end)
end

function GuDiXiaYiJiOBJ:UpdateUI()
    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Button_2,false)
    if self.arg1 == 1 then
        GUI:setVisible(self.ui.Button_2,true)
    else
        GUI:setVisible(self.ui.Button_1,true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuDiXiaYiJiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg1 = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuDiXiaYiJiOBJ