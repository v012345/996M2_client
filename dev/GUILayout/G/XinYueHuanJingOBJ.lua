XinYueHuanJingOBJ = {}
XinYueHuanJingOBJ.__cname = "XinYueHuanJingOBJ"
--XinYueHuanJingOBJ.config = ssrRequireCsvCfg("cfg_XinYueHuanJing")
XinYueHuanJingOBJ.cost = {{}}
XinYueHuanJingOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XinYueHuanJingOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
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

    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XinYueHuanJing_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XinYueHuanJing_Request,2)
    end)

    GUI:addOnClickEvent(self.ui.Tips_Button, function()
        local bool = GUI:getVisible(self.ui.Tips_Show)
        if not bool then
            GUI:setVisible(self.ui.Tips_Show, true)
        else
            GUI:setVisible(self.ui.Tips_Show, false)
        end
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
end

function XinYueHuanJingOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XinYueHuanJingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XinYueHuanJingOBJ