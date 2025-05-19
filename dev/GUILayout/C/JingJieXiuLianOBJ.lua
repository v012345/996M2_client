JingJieXiuLianOBJ = {}
JingJieXiuLianOBJ.__cname = "JingJieXiuLianOBJ"
--JingJieXiuLianOBJ.config = ssrRequireCsvCfg("cfg_JingJieXiuLian")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JingJieXiuLianOBJ:main(objcfg)
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
    --GUI:Timeline_Window1(self._parent)
    --res\custom\FengDuGuiCheng\bg
    local FramesBg = GUI:Frames_Create(self.ui.ImageBG, "Frames_bg", 0, 0, "res/custom/FengDuGuiCheng/bg/FengDu_", ".jpg", 1, 36, { count = 36, speed = 100, loop  =  -1, finishhide = 0 })
    GUI:setContentSize(FramesBg, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setLocalZOrder(FramesBg,10)
    GUI:setLocalZOrder(self.ui.Node_2,1)
end

function JingJieXiuLianOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JingJieXiuLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JingJieXiuLianOBJ