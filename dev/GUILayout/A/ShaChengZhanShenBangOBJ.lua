ShaChengZhanShenBangOBJ = {}
ShaChengZhanShenBangOBJ.__cname = "ShaChengZhanShenBangOBJ"
--ShaChengZhanShenBangOBJ.config = ssrRequireCsvCfg("cfg_ShaChengZhanShenBang")
ShaChengZhanShenBangOBJ.cost = { {} }
ShaChengZhanShenBangOBJ.give = {
    { "至尊宝箱", 1 },
    { "钻石宝箱", 1 },
    { "黄金宝箱", 1 },
    { "白银宝箱", 1 },
    { "白银宝箱", 1 },
    { "白银宝箱", 1 },
}
ShaChengZhanShenBangOBJ.eventName = "ShaChengZhanShenBangOBJ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShaChengZhanShenBangOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -20)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ShaChengZhanShenBang_Request)
    end)
    self:UpdateUI()
end

function ShaChengZhanShenBangOBJ:UpdateUI()
    local gongshaData = Player:getServerVar("A1")
    local Tdata = SL:JsonDecode(gongshaData)
    if not Tdata then
        sendmsg9("暂无排名！#249")
    end
    local gongshaRank = {}
    for i, v in pairs(Tdata or {}) do
        for key, value in pairs(v) do
            table.insert(gongshaRank,
                    { name = key,
                      point = value
                    }
            )
        end
    end
    table.sort(gongshaRank, function(a, b)
        return a.point > b.point
    end)
    if #gongshaRank > 6 then
        for i = #gongshaRank, 7, -1 do
            table.remove(gongshaRank, i)
        end
    end
    for i, v in ipairs(gongshaRank) do
        local widget = GUI:Widget_Create(self.ui.ListView_1, "widget_" .. i, 0, 0, 670, 46)
        GUI:LoadExport(widget, "A/ShaChengZhanShenBang_cell_UI")
        local ui = GUI:ui_delegate(widget)
        GUI:Text_setString(ui.Text_1, v.name)
        GUI:Text_setString(ui.Text_1_1, v.point)
        local give = { self.give[i] }
        ssrAddItemListX(ui.Panel_give, give, "item_", { imgRes = "res/custom/ShaChengZhanShenBang/item.png" })
    end
end

--显示左侧排行
function ShaChengZhanShenBangOBJ:LeftRankShow(ui, gongshaRank)
    if not gongshaRank or not ui then
        return
    end
    local myRank, myPoint
    local userName = SL:GetMetaValue("USER_NAME")
    GUI:ListView_removeAllItems(ui.ListView_1)
    for i, v in ipairs(gongshaRank) do
        if v.name == userName then
            myRank = i
            myPoint = v.point
        end
        local widget = GUI:Widget_Create(ui.ListView_1, "widget_" .. i, 0, 0, 200, 22)
        GUI:LoadExport(widget, "A/GongShaRank_cell_UI")
        local left_ui = GUI:ui_delegate(widget)
        GUI:Text_setString(left_ui.Text_1, i)
        --GUI:Text_setString(left_ui.Text_2, v.name)
        local scrollText = GUI:ScrollText_Create(left_ui.Image_1, "scrollText", 46, 2, 100, 16, "#C7BB99", v.name)
        GUI:ScrollText_enableOutline(scrollText, "#000000", 1)
        GUI:Text_setString(left_ui.Text_3, v.point)
    end
    GUI:Text_setString(ui.Text_MyRank, myRank or 0)
    GUI:Text_setString(ui.Text_MyPoint, myPoint or "未上榜")

end

function ShaChengZhanShenBangOBJ:UpdateLeftRank()
    if SL:GetMetaValue("KFSTATE") then
        return
    end
    local obj = GUI:Win_FindParent(110)
    local left_bg = GUI:getChildByName(obj, "left_bg")
    if GUI:Win_IsNotNull(left_bg) then
        local ui = GUI:ui_delegate(left_bg)
        local gongshaData = Player:getServerVar("A1")
        local Tdata = SL:JsonDecode(gongshaData)
        local gongshaRank = {}
        for i, v in pairs(Tdata or {}) do
            for key, value in pairs(v) do
                table.insert(gongshaRank,
                        { name = key,
                          point = value
                        }
                )
            end
        end
        table.sort(gongshaRank, function(a, b)
            return a.point > b.point
        end)
        self:LeftRankShow(ui, gongshaRank)
    end
end

SL:RegisterLUAEvent(LUA_EVENT_MAP_SIEGEAREA_CHANGE, ShaChengZhanShenBangOBJ.eventName, function(bool)
    --如果在跨服里面，不显示数据。
    if SL:GetMetaValue("KFSTATE") then
        return
    end
    local obj = GUI:Win_FindParent(110)
    if bool then
        GUI:removeChildByName(obj, "left_bg")
        GUI:LoadExport(obj, "A/GongShaRankUI")
        local ui = GUI:ui_delegate(obj)
        --先执行一次
        ShaChengZhanShenBangOBJ:UpdateLeftRank()
        GUI:schedule(ui.left_bg, function()
            ShaChengZhanShenBangOBJ:UpdateLeftRank()
        end, 3)
    else
        GUI:removeChildByName(obj, "left_bg")
    end
end)

--SL:RegisterLUAEvent(LUA_EVENT_SERVER_VALUE_CHANGE, ShaChengZhanShenBangOBJ.eventName, function(t)
--    local obj = GUI:Win_FindParent(110)
--    local left_bg = GUI:getChildByName(obj, "left_bg")
--    if GUI:Win_IsNotNull(left_bg) then
--        if t.key == "A1" then
--            local Tdata = SL:JsonDecode(t.value)
--            local gongshaRank = {}
--            for i, v in pairs(Tdata) do
--                for key, value in pairs(v) do
--                    table.insert(gongshaRank,
--                            { name = key,
--                              point = value
--                            }
--                    )
--                end
--            end
--            table.sort(gongshaRank, function(a, b)
--                return a.point > b.point
--            end)
--            if #gongshaRank > 6 then
--                for i = #gongshaRank, 7, -1 do
--                    table.remove(gongshaRank, i)
--                end
--            end
--            for i, v in ipairs(gongshaRank) do
--                SL:dump(i)
--                local widget = GUI:Widget_Create(self.ui.ListView_1, "widget_" .. i, 0, 0, 670, 46)
--                GUI:LoadExport(widget, "A/ShaChengZhanShenBang_cell_UI")
--                local ui = GUI:ui_delegate(widget)
--                GUI:Text_setString(ui.Text_1, v.name)
--                GUI:Text_setString(ui.Text_1_1, v.point)
--                local give = { self.give[i] }
--                ssrAddItemListX(ui.Panel_give, give, "item_", { imgRes = "res/custom/ShaChengZhanShenBang/item.png" })
--            end
--
--        end
--    end
--end)
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShaChengZhanShenBangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShaChengZhanShenBangOBJ