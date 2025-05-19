HunDunBenYuanOBJ = {}
HunDunBenYuanOBJ.__cname = "HunDunBenYuanOBJ"
--HunDunBenYuanOBJ.config = ssrRequireCsvCfg("cfg_HunDunBenYuan")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HunDunBenYuanOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunDunBenYuan_Switch,1)
    end )

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunDunBenYuan_Switch,2)
    end )

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunDunBenYuan_Switch,3)
    end )

    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunDunBenYuan_Request)
    end )

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end

function HunDunBenYuanOBJ:UpdateUI()
    if self.data[1] == 0 then
        GUI:Button_loadTextures(self.ui.Button_1,"res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png")
    else
        GUI:Button_loadTextures(self.ui.Button_1,"res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png")
    end

    if self.data[2] == 0 then
        GUI:Button_loadTextures(self.ui.Button_2,"res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png")
    else
        GUI:Button_loadTextures(self.ui.Button_2,"res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png")
    end

    if self.data[3] == 0 then
        GUI:Button_loadTextures(self.ui.Button_3,"res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png","res/custom/HunDunBenYuan/kx1.png")
    else
        GUI:Button_loadTextures(self.ui.Button_3,"res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png","res/custom/HunDunBenYuan/kx2.png")
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HunDunBenYuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HunDunBenYuanOBJ