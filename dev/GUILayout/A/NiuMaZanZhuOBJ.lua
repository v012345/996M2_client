NiuMaZanZhuOBJ = {}
NiuMaZanZhuOBJ.__cname = "NiuMaZanZhuOBJ"
--NiuMaZanZhuOBJ.config = ssrRequireCsvCfg("cfg_NiuMaZanZhu")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function NiuMaZanZhuOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)

    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.NiuMaZanZhu_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.NiuMaZanZhu_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.NiuMaZanZhu_Request, 3)
    end)
end

function NiuMaZanZhuOBJ:UpdateUI()
    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Button_2,false)
    GUI:setVisible(self.ui.Button_3,false)
    GUI:setVisible(self.ui.Image_1,false)
    GUI:setVisible(self.ui.Image_2,false)
    GUI:setVisible(self.ui.Image_3,false)

    if self.data[1] == 0 then
        GUI:setVisible(self.ui.Button_1,true)
        GUI:setVisible(self.ui.Button_2,true)
        GUI:setVisible(self.ui.Button_3,true)
    elseif self.data[1] == 1 then
        GUI:setVisible(self.ui.Image_1,true)
        GUI:setVisible(self.ui.Button_2,true)
        GUI:setVisible(self.ui.Button_3,true)
    elseif self.data[1] == 2 then
        GUI:setVisible(self.ui.Image_1,true)
        GUI:setVisible(self.ui.Image_2,true)
        GUI:setVisible(self.ui.Button_3,true)
    elseif self.data[1] == 3 then
        GUI:setVisible(self.ui.Image_1,true)
        GUI:setVisible(self.ui.Image_2,true)
        GUI:setVisible(self.ui.Image_3,true)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function NiuMaZanZhuOBJ:SyncResponse(arg1, arg2, arg3, data)
    SL:Print(data[1])
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

function NiuMaZanZhuOBJ:AddRedPoint(arg1, arg2, arg3, data)
    local TopIconNode_look = GUI:GetWindow(MainMiniMap._parent, "TopIconLayout")
    local TopIconNode = GUI:GetWindow(TopIconNode_look, "TopIconNode_1")
    local IconObj = GUI:GetWindow(TopIconNode, "111")
    if IconObj then
        delRedPoint(IconObj)
        if arg1 == 1 then
            addRedPoint(IconObj, 20, 0)
        end
    end
end

return NiuMaZanZhuOBJ