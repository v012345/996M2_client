ShengHuoYiHuiOBJ = {}
ShengHuoYiHuiOBJ.__cname = "ShengHuoYiHuiOBJ"
ShengHuoYiHuiOBJ.cost = {{"圣火遗灰", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShengHuoYiHuiOBJ:main(objcfg)
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
    ssrAddItemListX(self.ui.itemlooks_1, self.cost,"圣火遗灰",{imgRes = ""})

    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShengHuoYiHui_Request)
    end)

end

function ShengHuoYiHuiOBJ:UpdateUI()
    if self.data[1] >= 10 then
        GUI:setVisible(self.ui.Effect_1, true)
    end

    if self.data[2] >= 10 then
        GUI:setVisible(self.ui.Effect_2, true)
    end
    if self.data[3] >= 10 then
        GUI:setVisible(self.ui.Effect_3, true)
    end
    if self.data[4] >= 10 then
        GUI:setVisible(self.ui.Effect_4, true)
    end
    if self.data[5] == 1 then
        GUI:setVisible(self.ui.Image_1, true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShengHuoYiHuiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data =data 
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShengHuoYiHuiOBJ