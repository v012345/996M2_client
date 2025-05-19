ShouShiHe = {}
ShouShiHe.__cname = "ShouShiHe"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShouShiHe:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true)
    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    --GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
end

function ShouShiHe:updateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------


return ShouShiHe
