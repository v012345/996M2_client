GuFengJiTanOBJ = {}
GuFengJiTanOBJ.__cname = "GuFengJiTanOBJ"
GuFengJiTanOBJ.items = { { "杀戮刻印Lv.1", 1 },{ "疾风刻印Lv.1", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuFengJiTanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0, -50)
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
    ssrAddItemListX(self.ui.Panel_1,self.items,"item_",{spacing=20})
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
    end)
    self:UpdateUI()
end

function GuFengJiTanOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuFengJiTanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuFengJiTanOBJ