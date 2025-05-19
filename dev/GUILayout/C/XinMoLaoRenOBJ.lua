XinMoLaoRenOBJ = {}
XinMoLaoRenOBJ.__cname = "XinMoLaoRenOBJ"
--XinMoLaoRenOBJ.config = ssrRequireCsvCfg("cfg_XinMoLaoRen")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XinMoLaoRenOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.XinMoLaoRen_openUI)
end

function XinMoLaoRenOBJ:openUI(arg1, arg2, arg3, data)
    local objcfg = self.objcfg
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 召唤心魔
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XinMoLaoRen_Request)
    end)
    GUI:Timeline_Window1(self._parent)
    local currTiaoZhan = data.currTiaoZhan
    local TiaoZhanImgPath = "res/custom/XinMoLaoRen/layer/"..currTiaoZhan..".png"
    GUI:Image_loadTexture(self.ui.Image_1, TiaoZhanImgPath)
    local rankData = data.rankData
    for i, v in ipairs(rankData) do
        GUI:Text_setString(self.ui["Text_nickname_"..i], v[1])
        GUI:Text_setString(self.ui["Text_time_"..i], v[2])
    end
    GUI:addOnClickEvent(self.ui.Button_2, function()
        local isShow = not GUI:getVisible(self.ui.Image_2)
        GUI:setVisible(self.ui.Image_2, isShow)
    end )
    GUI:addOnClickEvent(self.ui.Button_rankClose, function()
        GUI:setVisible(self.ui.Image_2, false)
    end )
end

function XinMoLaoRenOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XinMoLaoRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XinMoLaoRenOBJ