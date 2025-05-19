ShenHunZhiDiOBJ = {}
ShenHunZhiDiOBJ.__cname = "ShenHunZhiDiOBJ"
ShenHunZhiDiOBJ.config = ssrRequireCsvCfg("cfg_ShenHunZhiDi")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenHunZhiDiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    self.NPCID = objcfg.NPCID
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
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunZhiDi_Request, self.NPCID)
    end)

end

function ShenHunZhiDiOBJ:UpdateUI()
    local cfg = self.config[self.NPCID]
    GUI:Image_loadTexture(self.ui.ImageBG, "res/custom/ShenHunZhiDi/".. cfg.bgimg ..".png")
    ssrAddItemListX(self.ui.ItemShow, cfg.ItemShow,"奖励展示",{imgRes = "res/custom/ShenHunZhiDi/img2.png",spacing = 0})
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShenHunZhiDiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenHunZhiDiOBJ