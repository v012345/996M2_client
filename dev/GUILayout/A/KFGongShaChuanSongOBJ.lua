KFGongShaChuanSongOBJ = {}
KFGongShaChuanSongOBJ.__cname = "KFGongShaChuanSongOBJ"
--KFGongShaChuanSongOBJ.config = ssrRequireCsvCfg("cfg_KFGongShaChuanSong")
KFGongShaChuanSongOBJ.minimum = 600
KFGongShaChuanSongOBJ.eventName = "跨服沙巴克"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KFGongShaChuanSongOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-30)
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
    self.pageID = 1
    self:RefreshBtnState()
    self:InitPageChangeBtn()
    self:UpdateUI()
end

function KFGongShaChuanSongOBJ:UpdateUI()
    GUI:removeAllChildren(self.ui.LayoutPage)
    if self.pageID == 1 then
        local parent = self.ui.LayoutPage
        GUI:LoadExport(parent, "A/KFGongShaChuanSongPage1UI")
        local ui = GUI:ui_delegate(parent)
        GUI:addOnClickEvent(ui.Button1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_RequestCS,1)
        end )
        GUI:addOnClickEvent(ui.Button2, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_RequestCS,2)
        end )
        GUI:addOnClickEvent(ui.Button3, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_RequestCS,3)
        end )
        GUI:addOnClickEvent(ui.Button4, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_RequestCS,4)
        end )
    else
        local parent = self.ui.LayoutPage
        GUI:LoadExport(parent, "A/KFGongShaChuanSongPage2UI")
        self.page2ui = GUI:ui_delegate(parent)
        ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_SyncResponse)
        --领取奖励通用
        GUI:addOnClickEvent(self.page2ui.ButtonLingQu, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.KFGongShaChuanSong_LingQu)
        end)
        local isPc = SL:GetMetaValue("WINPLAYMODE")
        local tipsData = {}
        tipsData.typeId = SL:GetMetaValue("ITEM_INDEX_BY_NAME","天下共主宝箱")
        if isPc then
            GUI:addMouseMoveEvent(self.page2ui.Image_1, { onEnterFunc = function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Image_1)
                tipsData.pos = pos
                ssr.OpenItemTips(tipsData)
            end,
                onLeaveFunc = function()
                    ssr.CloseItemTips()
                end })
        else
            GUI:addOnClickEvent(self.page2ui.Image_1, function(widget)
                local pos = GUI:getWorldPosition(widget)
                tipsData.pos = pos
                ssr.OpenItemTips(tipsData)
            end)
        end
        local tipsData1 = {}
        tipsData1.typeId = SL:GetMetaValue("ITEM_INDEX_BY_NAME","不灭之魂宝箱")
        if isPc then
            GUI:addMouseMoveEvent(self.page2ui.Image_2, { onEnterFunc = function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Image_1)
                tipsData1.pos = pos
                ssr.OpenItemTips(tipsData1)
            end,
                onLeaveFunc = function()
                    ssr.CloseItemTips()
                end })
        else
            GUI:addOnClickEvent(self.page2ui.Image_2, function(widget)
                local pos = GUI:getWorldPosition(widget)
                tipsData1.pos = pos
                ssr.OpenItemTips(tipsData1)
            end)
        end
    end
end

--初始化按钮状态
function KFGongShaChuanSongOBJ:RefreshBtnState()
    local btnList = GUI:getChildren(self.ui.Left_btn_list)
    for _, child in ipairs(btnList) do
        local isSelected = GUI:getName(child) == ("ButtonLeft_" .. self.pageID)
        GUI:Button_setBrightEx(child, not isSelected)
    end
end

function KFGongShaChuanSongOBJ:InitPageChangeBtn()
    local btnList = GUI:getChildren(self.ui.Left_btn_list)
    for i, child in ipairs(btnList) do
        GUI:addOnClickEvent(child, function()
            self.pageID = i
            self:RefreshBtnState()
            self:UpdateUI()
        end )
    end
end

function KFGongShaChuanSongOBJ:ShowPage2UI(data)
     local MyReward = 0
    --如果是失败方
    if data.castleidentity == 0 then
        if data.loserPoints == 0 then
            MyReward = 0
        else
            MyReward = (data.loserReward / data.loserPoints) * data.myPoints --奖励算法，奖金池/失败方总积分*我的积分
        end
    --胜利方
    else
        if data.winnerPoints == 0 then
            MyReward = 0
        else
            MyReward = (data.winReward / data.winnerPoints) * data.myPoints --奖励算法，奖金池/失败方总积分*我的积分
        end

    end

    local bossName = ""
    local winnerGuildName = ""
    if data.bossName == "管理员"  then
        bossName = "未攻沙"
    else
        bossName = data.bossName
    end
    if data.winnerGuildName == "" then
        winnerGuildName = "未攻沙"
    else
        winnerGuildName = data.winnerGuildName
    end
    --GUI:Text_setString(self.page2ui.TextGuildBoss, bossName)
    --GUI:Text_setString(self.page2ui.TextGuild, winnerGuildName)
    GUI:Text_setString(self.page2ui.TextHuoYue, data.myPoints)
    if data.myPoints < self.minimum then
        MyReward = "活跃度小于"..self.minimum
    else
        MyReward = self:round(MyReward)
    end
    GUI:Text_setString(self.page2ui.TextLingFu, MyReward)
end

function KFGongShaChuanSongOBJ:round(num)
    local decimal = num % 1  -- 获取小数部分
    if decimal >= 0.5 then
        return math.ceil(num)
    else
        return math.floor(num)
    end
end

--显示左侧排行
function KFGongShaChuanSongOBJ:LeftRankShow(ui, gongshaRank)
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

function KFGongShaChuanSongOBJ:UpdateLeftRank()
    local obj = GUI:Win_FindParent(110)
    local left_bg = GUI:getChildByName(obj, "left_bg")
    if GUI:Win_IsNotNull(left_bg) then
        local ui = GUI:ui_delegate(left_bg)
        --local gongshaData = self.gongShaPoints or {}
        local Tdata = self.gongShaPoints
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

--同步数据
function KFGongShaChuanSongOBJ:SyncPoints(arg1,arg2,arg3,data)
    self.gongShaPoints = data
    self:UpdateLeftRank()
end

SL:RegisterLUAEvent(LUA_EVENT_MAP_SIEGEAREA_CHANGE, KFGongShaChuanSongOBJ.eventName, function(bool)
    --如果在跨服里面，不显示数据。
    if SL:GetMetaValue("KFSTATE") then
        local obj = GUI:Win_FindParent(110)
        if bool then
            GUI:removeChildByName(obj, "left_bg")
            GUI:LoadExport(obj, "A/GongShaRankUI")
            local ui = GUI:ui_delegate(obj)
            --先执行一次
            KFGongShaChuanSongOBJ:UpdateLeftRank()
        else
            GUI:removeChildByName(obj, "left_bg")
        end
    end
end)

SL:RegisterLUAEvent(LUA_EVENT_KF_STATUS_CHANGE, KFGongShaChuanSongOBJ.eventName, function(bool)
    --退出跨服时删除控件
    if not bool then
        local obj = GUI:Win_FindParent(110)
        local left_bgObj = GUI:getChildByName(obj,"left_bg")
        if GUI:Win_IsNotNull(left_bgObj) then
            GUI:removeChildByName(obj, "left_bg")
        end
    end
end)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function KFGongShaChuanSongOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:ShowPage2UI(data)
    end
end
return KFGongShaChuanSongOBJ