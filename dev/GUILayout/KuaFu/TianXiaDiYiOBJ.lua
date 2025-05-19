TianXiaDiYiOBJ = {}
TianXiaDiYiOBJ.__cname = "TianXiaDiYiOBJ"
TianXiaDiYiOBJ.config = ssrRequireCsvCfg("cfg_TianXiaDiYi")
TianXiaDiYiOBJ.cost = {{}}
TianXiaDiYiOBJ.give = {{}}
TianXiaDiYiOBJ.EventName = "天下第一"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TianXiaDiYiOBJ:main(objcfg)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrMessage:sendmsg(ssrNetMsgCfg.TianXiaDiYi_PanelSync)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TianXiaDiYi_Request)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TianXiaDiYi_LingQu)
    end)
end

function TianXiaDiYiOBJ:UpdateUI()

end

function TianXiaDiYiOBJ:PanelSync(arg1,arg2,arg3,data)
    local ranks = data.rankSort
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    local fontColor = "#00ff00"
    for i, v in ipairs(self.config) do
        local textStr = "无"
        local contents = ranks[i]
        if contents and contents.score > 0 then
            textStr = contents.name .. "(".. contents.score .."积分)"
        end
        if i > 10 then
            textStr = "所有参与活动的玩家"
            fontColor = "#FFFFFF"
        end
        local Image_1 = GUI:Image_Create(self.ui.ListView_1, "Image_1"..i, 0.00, 255.00, "res/custom/TianXiaDiYi/rank_"..i..".png")
        local Text_1 = GUI:ScrollText_Create(Image_1, "Text_1"..i, 94.00, 24.00,192, 16, fontColor, textStr)
        GUI:ScrollText_enableOutline(Text_1, "#000000", 1)
        local Panel_1 = GUI:Layout_Create(Image_1, "Panel_1"..i, 286.00, 10.00, 205, 51, false)
        ssrAddItemListX(Panel_1, v.rewardShow,"item_",{imgRes = "res/custom/TianXiaDiYi/itembg.png"})
    end
end

function TianXiaDiYiOBJ:LeftRankShow(ui, dataArray)
    if not dataArray or not ui then
        return
    end
    GUI:ListView_removeAllItems(ui.ListView_1)
    for i, v in ipairs(dataArray.rankSort or {}) do
        local widget = GUI:Widget_Create(ui.ListView_1, "widget_" .. i, 0, 0, 200, 22)
        GUI:LoadExport(widget, "KuaFu/TianXiaDiYi_cell_UI")
        local left_ui = GUI:ui_delegate(widget)
        GUI:Text_setString(left_ui.Text_1, i)
        local scrollText = GUI:ScrollText_Create(left_ui.Image_1, "scrollText", 22, 2, 120, 16, "#C7BB99", v.name)
        GUI:ScrollText_enableOutline(scrollText, "#000000", 1)
        GUI:Text_setString(left_ui.Text_3, v.score)
    end
    GUI:Text_setString(ui.Text_4, dataArray.myRank or 0)
    GUI:Text_setString(ui.Text_5, dataArray.myPoint or 0)
end

function TianXiaDiYiOBJ:UpdateLeftRank()
    local obj = GUI:Win_FindParent(110)
    local left_bg = GUI:getChildByName(obj, "txdy_left_bg")
    if GUI:Win_IsNotNull(left_bg) then
        local ui = GUI:ui_delegate(left_bg)
        self:LeftRankShow(ui, self.rankData)
    end
end

function TianXiaDiYiOBJ:SyncRank(arg1,arg2,arg3,data)
    self.rankData = data
    self:UpdateLeftRank()
end

SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, TianXiaDiYiOBJ.EventName, function(data)
    if data.mapID == "天下第一" then
        TianXiaDiYiOBJ.currRank = 1
        local parent = GUI:Win_FindParent(110)
        GUI:LoadExport(parent, "KuaFu/TianXiaDiYiRankUI")
        if GUI:Win_IsNotNull(parent) then
            TianXiaDiYiOBJ.txdy_rank = GUI:getChildByName(parent, "txdy_left_bg")
            TianXiaDiYiOBJ.txdy_rank_ui = GUI:ui_delegate(TianXiaDiYiOBJ.txdy_rank)
        end
    elseif data.lastMapID == "天下第一" then
        local parent = GUI:Win_FindParent(110)
        local txdy_rank = GUI:getChildByName(parent, "txdy_left_bg")
        if GUI:Win_IsNotNull(txdy_rank) then
            GUI:removeChildByName(parent, "txdy_left_bg")
        end
    end
end)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TianXiaDiYiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TianXiaDiYiOBJ