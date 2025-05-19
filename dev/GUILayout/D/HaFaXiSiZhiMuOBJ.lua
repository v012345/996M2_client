HaFaXiSiZhiMuOBJ = {}
HaFaXiSiZhiMuOBJ.__cname = "HaFaXiSiZhiMuOBJ"
--HaFaXiSiZhiMuOBJ.config = ssrRequireCsvCfg("cfg_HaFaXiSiZhiMu")
HaFaXiSiZhiMuOBJ.items1 = { { "哈法西斯之心", 1 } }
HaFaXiSiZhiMuOBJ.items2 = { { "星瀚之力", 1 }, { "信念支柱", 1 }, { "蓝色恶魔之眼", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HaFaXiSiZhiMuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HaFaXiSiZhiMu_Request)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrAddItemListX(self.ui.Panel_1,self.items1,"item_",{spacing=20})
    ssrAddItemListX(self.ui.Panel_2,self.items2,"item_",{spacing=20})
end

function HaFaXiSiZhiMuOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HaFaXiSiZhiMuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HaFaXiSiZhiMuOBJ