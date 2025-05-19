XianJiShiLianOBJ = {}
XianJiShiLianOBJ.__cname = "XianJiShiLianOBJ"
--XianJiShiLianOBJ.config = ssrRequireCsvCfg("cfg_XianJiShiLian")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XianJiShiLianOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.XianJiShiLian_openUI)
end

function XianJiShiLianOBJ:openUI(arg1)
    local objcfg = self.objcfg
    self.jinDu = arg1
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -60)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    --献祭气血
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XianJiShiLian_Request)
    end)
    --恢复满血
    GUI:addOnClickEvent(self.ui.Button_2, function()
        local data = {}
        data.str = "确定花费[1888灵符]恢复满血状态？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.XianJiShiLian_RequestHp)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    GUI:Text_setString(self.ui.Text_1, self.jinDu .. "%")
    self:UpdateUI()
end

function XianJiShiLianOBJ:UpdateUI()
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, self.jinDu)
    GUI:Text_setString(self.ui.Text_1, self.jinDu .. "%")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XianJiShiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.jinDu = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XianJiShiLianOBJ