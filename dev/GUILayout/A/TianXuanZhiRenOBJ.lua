TianXuanZhiRenOBJ = {}
TianXuanZhiRenOBJ.__cname = "TianXuanZhiRenOBJ"
TianXuanZhiRenOBJ.cfg = ssrRequireCsvCfg("cfg_TianXuanZhiRen") --读表
TianXuanZhiRenOBJ.top1Reward = {
    { "金手指", 1 },
    { "烈焰战车[时装]", 1 },
    { "高级神器盲盒", 1 },
    { "神秘专属盲盒", 1 },
    { "自己摸的鱼", 1 },
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TianXuanZhiRenOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true)
    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.img_bg, 2,0)
    GUI:addOnClickEvent(self.ui.img_bg, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.top1Reward,"item_",{imgRes = "res/custom/TianXuanZhiRen/itemgb.png", spacing = 4})
    self:UpdateUI()
end
local handle
function TianXuanZhiRenOBJ:UpdateUI()
    for i = 1, 4 do
        GUI:removeAllChildren(self.ui["ListView_"..i])
        local rankingNameIndex = 1
        local rankingNumber = 2
        for j, v in ipairs(self.cfg) do
            local Layout = GUI:Layout_Create(self.ui["ListView_"..i], "Layout_"..i.."_"..j, 0.00, 180.00, 222.00, 23.00, false)
            --名字
            local name
            local nameColor = "#F7F7DE"
            local rankingName = self.rankingArr[i][rankingNameIndex] or nil
            if rankingName then
                name = rankingName
            else
                name = "无"
            end
            if SL:GetMetaValue("USER_NAME") == rankingName then
                nameColor = "#FF00FF"
            end
            rankingNameIndex = rankingNameIndex + 2
            --handle = GUI:Text_Create(Layout, "Text1_2"..i.."_"..j, 76.00, 18.00, 16, nameColor, name)
            handle = GUI:ScrollText_Create(Layout, "Text1_2"..i.."_"..j, 76, 18, 108, 16, nameColor, name)
            GUI:setAnchorPoint(handle, 0.50, 0.50)
            GUI:ScrollText_enableOutline(handle, "#000000", 1)

            -- Create Text1_2
            local number
            if self.rankingArr[i][rankingNumber] then
                number = self.rankingArr[i][rankingNumber]
            else
                number = "无"
            end
            rankingNumber = rankingNumber + 2
            handle= GUI:Text_Create(Layout, "Text1_3"..i.."_"..j, 166.00, 17.00, 16, "#ffff00", number)
            GUI:setAnchorPoint(handle, 0.50, 0.50)
            GUI:Text_enableOutline(handle, "#000000", 1)
        end
    end
    --显示方法计时start
    local ResidueTime = 0
    local minTime = self.Gvar
    ResidueTime = 30 - minTime
    if ResidueTime > 0 then
        GUI:Text_setString(self.ui["Text_fftscontent1"], ResidueTime.."分钟")
        GUI:Text_setTextColor(self.ui["Text_fftscontent1"], "#FF0000")
    elseif ResidueTime <= 0 then
        GUI:Text_setString(self.ui["Text_fftscontent1"], "已发放")
        --设置控件颜色
        GUI:Text_setTextColor(self.ui["Text_fftscontent1"], "#00ff00")
    end
    ResidueTime = 60 - minTime
    if ResidueTime > 0 then
        GUI:Text_setString(self.ui["Text_fftscontent2"], ResidueTime.."分钟")
        GUI:Text_setTextColor(self.ui["Text_fftscontent2"], "#FF0000")
    elseif ResidueTime <= 0 then
        GUI:Text_setString(self.ui["Text_fftscontent2"], "已发放")
        GUI:Text_setTextColor(self.ui["Text_fftscontent2"], "#00ff00")
    end

    ResidueTime = 90 - minTime
    if ResidueTime > 0 then
        GUI:Text_setString(self.ui["Text_fftscontent3"], ResidueTime.."分钟")
        GUI:Text_setTextColor(self.ui["Text_fftscontent3"], "#FF0000")
    elseif ResidueTime <= 0 then
        GUI:Text_setString(self.ui["Text_fftscontent3"], "已发放")
        GUI:Text_setTextColor(self.ui["Text_fftscontent3"], "#00ff00")
    end

    ResidueTime = 120 - minTime
    if ResidueTime > 0 then
        GUI:Text_setString(self.ui["Text_fftscontent4"], ResidueTime.."分钟")
        GUI:Text_setTextColor(self.ui["Text_fftscontent4"], "#FF0000")
    elseif ResidueTime <= 0 then
        GUI:Text_setString(self.ui["Text_fftscontent4"], "已发放")
        GUI:Text_setTextColor(self.ui["Text_fftscontent4"], "#00ff00")
    end
end

--Win_FindParent(ID)
function TianXuanZhiRenOBJ:UpdataTime(arg1,arg2,arg3,data)
    local parent = GUI:Win_FindParent(102)
    if arg1 >= 0 then
        local TianXuanZhiRenBtn = GUI:getChildByName(parent,"TianXuanZhiRenBtn")
        if GUI:Win_IsNotNull(TianXuanZhiRenBtn) then
            GUI:removeChildByName(parent,"TianXuanZhiRenBtn")
        end
        if ssrConstCfg.client_type == 2 then
            local btn = GUI:Button_Create(parent, "TianXuanZhiRenBtn" , -324, -220, "res/custom/TianXuanZhiRen/top_txzr.png")
            GUI:addOnClickEvent(btn,function ()
                ssrMessage:sendmsg(ssrNetMsgCfg.TianXuanZhiRen_RequestOpenUI)
            end)
            local Text_1 = GUI:Text_Create(btn, "Text_1", 32.00, -20.00, 16, "#00FF00", [[]])
            GUI:setAnchorPoint(Text_1, 0.5, 0.00)
            GUI:Text_enableOutline(Text_1, "#000000", 1)
            GUI:Text_COUNTDOWN(Text_1, arg1)
        else
            local btn = GUI:Button_Create(parent, "TianXuanZhiRenBtn" , -290, -220, "res/custom/TianXuanZhiRen/top_txzr.png")
            GUI:addOnClickEvent(btn,function ()
                ssrMessage:sendmsg(ssrNetMsgCfg.TianXuanZhiRen_RequestOpenUI)
            end)
            local Text_1 = GUI:Text_Create(btn, "Text_1", 32.00, -20.00, 16, "#00FF00", [[]])
            GUI:setAnchorPoint(Text_1, 0.5, 0.00)
            GUI:Text_enableOutline(Text_1, "#000000", 1)
            GUI:Text_COUNTDOWN(Text_1, arg1)
        end
    else
        local TianXuanZhiRenBtn = GUI:getChildByName(parent,"TianXuanZhiRenBtn")
        if GUI:Win_IsNotNull(TianXuanZhiRenBtn) then
            GUI:removeChildByName(parent,"TianXuanZhiRenBtn")
        end
    end

end


---网络消息
function TianXuanZhiRenOBJ:ResponseOpenUI(arg1,arg2,arg3,data)
    self.Gvar = arg1
    self.myNumber = arg2
    self.roundNumber = arg3
    self.rankingArr = data["rankingArr"]
    self.myNumberList = data["myNumberList"]
    if not GUI:GetWindow(nil,self.__cname) then
        ssrUIManager:OPEN(ssrObjCfg.TianXuanZhiRen)
    else
        self:UpdateUI()
    end
end

return TianXuanZhiRenOBJ