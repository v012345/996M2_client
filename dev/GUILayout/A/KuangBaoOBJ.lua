KuangBaoOBJ = {}

KuangBaoOBJ.__cname = "KuangBaoOBJ"

KuangBaoOBJ.cfg = ssrRequireCsvCfg("cfg_kuangbao") --读表

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KuangBaoOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true,true,objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    local isPc  = SL:GetMetaValue("WINPLAYMODE")
    if isPc then
        ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-20)
    else
        ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    end
    GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    --开启狂暴
    GUI:addOnClickEvent(self.ui.OpenButton, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.KuangBao_Request)
    end)
    local ext = {
        count = 15,
        speed = 100,
        loop  =  -1,
        finishhide = 0
    }
    
    --创建动画
    local frames = GUI:Frames_Create(self.ui.ImageBG, "Frames_1", 50, 30, "res/custom/KuangBaoZhiLi/Frames1/kb_", ".png", 1, 14, ext)
    GUI:setLocalZOrder(self.ui.ImageView,90)
    GUI:setLocalZOrder(self.ui.CloseButton,99)
    GUI:setLocalZOrder(self.ui.OpenButton,100)
    self:updateUI()
end

function KuangBaoOBJ:updateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------


return KuangBaoOBJ
