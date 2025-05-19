MiLuBaoZangOBJ = {}
MiLuBaoZangOBJ.__cname = "MiLuBaoZangOBJ"
--MiLuBaoZangOBJ.config = ssrRequireCsvCfg("cfg_MiLuBaoZang")
MiLuBaoZangOBJ.cost = {{}}
MiLuBaoZangOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MiLuBaoZangOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -50, -20)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MiLuBaoZang_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MiLuBaoZang_Request, 2)
    end)


    GUI:addOnClickEvent(self.ui.Button_OpenIncUI, function()
        local bool = GUI:getVisible(self.ui.IncUI)
        if not bool then
            GUI:setVisible(self.ui.IncUI, true)
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_Close, function()
        local bool = GUI:getVisible(self.ui.IncUI)
        if bool then
            GUI:setVisible(self.ui.IncUI, false)
        end
    end)

    self:UpdateUI()
end

function MiLuBaoZangOBJ:UpdateUI()
    --显示进入次数
    GUI:Text_setString(self.ui.NumShow, self.data[1].. "/" .. self.data[2])

    --剩余购买次数
    GUI:Text_setString(self.ui.NumLooks, 8 - self.data[2])


end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MiLuBaoZangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MiLuBaoZangOBJ