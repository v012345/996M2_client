YiJieDiXiaChengOBJ = {}
YiJieDiXiaChengOBJ.__cname = "YiJieDiXiaChengOBJ"
--YiJieDiXiaChengOBJ.config = ssrRequireCsvCfg("cfg_YiJieDiXiaCheng")
YiJieDiXiaChengOBJ.give = {{"拥抱黑暗吧",1},{"黑暗之触",1},{"【镇压】血色结界",1},{"异界神石",1},{"神之头颅",1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YiJieDiXiaChengOBJ:main(objcfg)
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
    GUI:addOnClickEvent(self.ui.Button_1,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJieDiXiaCheng_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJieDiXiaCheng_Request,2)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing = 20})
end

function YiJieDiXiaChengOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YiJieDiXiaChengOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YiJieDiXiaChengOBJ