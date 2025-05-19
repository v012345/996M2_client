BiBoTianZunGeOBJ = {}
BiBoTianZunGeOBJ.__cname = "BiBoTianZunGeOBJ"
BiBoTianZunGeOBJ.give = {{"碧波灵珠",1},{"天尊令",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BiBoTianZunGeOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.BiBoTianZunGe_Request)
    end)
    ssrAddItemListX(self.ui.ItemShow, self.give,"掉落",{imgRes = "",spacing = 94})
end

function BiBoTianZunGeOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function BiBoTianZunGeOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return BiBoTianZunGeOBJ