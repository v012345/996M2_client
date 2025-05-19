XinRenShangXianOBJ = {}
XinRenShangXianOBJ.__cname = "XinRenShangXianOBJ"
--XinRenShangXianOBJ.config = ssrRequireCsvCfg("cfg_XinRenShangXian")
XinRenShangXianOBJ.give = {{"恢复光环",1},{"龙·之心",1},{"神·守护",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XinRenShangXianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.Button, function()
        SL:StartGuide({
            id = 110,
            param = 1,
            guideDesc = "点击继续"
        })
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_1",{imgRes = "", spacing = 86})
end

function XinRenShangXianOBJ:UpdateUI()
    ssrUIManager:OPEN(ssrObjCfg.XinRenShangXian)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XinRenShangXianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self:UpdateUI()
end
return XinRenShangXianOBJ