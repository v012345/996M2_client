GongShaChuanSongOBJ = {}
GongShaChuanSongOBJ.__cname = "GongShaChuanSongOBJ"
--GongShaChuanSongOBJ.config = ssrRequireCsvCfg("cfg_GongShaChuanSong")
GongShaChuanSongOBJ.minimum = 600
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GongShaChuanSongOBJ:main(objcfg)
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

function GongShaChuanSongOBJ:UpdateUI()
    GUI:removeAllChildren(self.ui.LayoutPage)
    if self.pageID == 1 then
        local parent = self.ui.LayoutPage
        GUI:LoadExport(parent, "A/GongShaChuanSongPage1UI")
        local ui = GUI:ui_delegate(parent)
        GUI:addOnClickEvent(ui.Button1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_RequestCS,1)
        end )
        GUI:addOnClickEvent(ui.Button2, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_RequestCS,2)
        end )
        GUI:addOnClickEvent(ui.Button3, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_RequestCS,3)
        end )
        GUI:addOnClickEvent(ui.Button4, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_RequestCS,4)
        end )
        --动画
        --local btnList = GUI:getChildren(ui.NodeCsBtn)
        --for i, child in ipairs(btnList) do
        --    local pos = GUI:getPosition(child)
        --    local newPos = {x = pos.x, y = pos.y + 5}
        --    GUI:stopAllActions(child)
        --    local action1 = GUI:ActionMoveTo(0.6, newPos.x, newPos.y)
        --    local action2 = GUI:ActionMoveTo(0.6, pos.x, pos.y)
        --    local actions = GUI:ActionSequence(action1, action2)
        --    GUI:runAction(child, GUI:ActionRepeatForever(actions))
        --end
    else
        local parent = self.ui.LayoutPage
        GUI:LoadExport(parent, "A/GongShaChuanSongPage2UI")
        self.page2ui = GUI:ui_delegate(parent)
        ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_SyncResponse)

        --领取奖励会长
        GUI:addOnClickEvent(self.page2ui.ButtonHuiZhang, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_HuiZhang)
        end)
        --领取奖励成员
        GUI:addOnClickEvent(self.page2ui.ButtonChengYuan, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_ChengYuan)
        end)
        --领取奖励通用
        GUI:addOnClickEvent(self.page2ui.ButtonLingQu, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.GongShaChuanSong_LingQu)
        end)

        local isPc = SL:GetMetaValue("WINPLAYMODE")
        local titleTipsIdx1 = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "沙城之主")
        local titleTipsIdx2 = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "胜利之师")
        if isPc then
            local tipsData = {}
            GUI:addMouseMoveEvent(self.page2ui.Layout1, {onEnterFunc = function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Layout1)
                tipsData.pos = pos
                tipsData.typeId = titleTipsIdx1
                ssr.OpenItemTips(tipsData)
            end,
           onLeaveFunc = function()
               ssr.CloseItemTips()
           end})
        else
            local tipsData = {}
            GUI:addOnClickEvent(self.page2ui.Layout1, function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Layout1)
                tipsData.pos = pos
                tipsData.typeId = titleTipsIdx1
                ssr.OpenItemTips(tipsData)
            end)
        end

        if isPc then
            local tipsData = {}
            GUI:addMouseMoveEvent(self.page2ui.Layout2, {onEnterFunc = function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Layout2)
                tipsData.pos = pos
                tipsData.typeId = titleTipsIdx2
                ssr.OpenItemTips(tipsData)
            end,
           onLeaveFunc = function()
               ssr.CloseItemTips()
           end})
        else
            local tipsData = {}
            GUI:addOnClickEvent(self.page2ui.Layout2, function(widget)
                local pos = GUI:getWorldPosition(self.page2ui.Layout2)
                tipsData.pos = pos
                tipsData.typeId = titleTipsIdx2
                ssr.OpenItemTips(tipsData)
            end)
        end
    end
end

--初始化按钮状态
function GongShaChuanSongOBJ:RefreshBtnState()
    local btnList = GUI:getChildren(self.ui.Left_btn_list)
    for _, child in ipairs(btnList) do
        local isSelected = GUI:getName(child) == ("ButtonLeft_" .. self.pageID)
        GUI:Button_setBrightEx(child, not isSelected)
    end
end

function GongShaChuanSongOBJ:InitPageChangeBtn()
    local btnList = GUI:getChildren(self.ui.Left_btn_list)
    for i, child in ipairs(btnList) do
        GUI:addOnClickEvent(child, function()
            self.pageID = i
            self:RefreshBtnState()
            self:UpdateUI()
        end )
    end
end

function GongShaChuanSongOBJ:ShowPage2UI(data)
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
    GUI:Text_setString(self.page2ui.TextGuildBoss, bossName)
    GUI:Text_setString(self.page2ui.TextGuild, winnerGuildName)
    GUI:Text_setString(self.page2ui.TextHuoYue, data.myPoints)
    if data.myPoints < self.minimum then
        MyReward = "活跃度小于"..self.minimum
    else
        MyReward = self:round(MyReward)
    end
    GUI:Text_setString(self.page2ui.TextLingFu, MyReward)
end

function GongShaChuanSongOBJ:round(num)
    local decimal = num % 1  -- 获取小数部分
    if decimal >= 0.5 then
        return math.ceil(num)
    else
        return math.floor(num)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GongShaChuanSongOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:ShowPage2UI(data)
    end
end
return GongShaChuanSongOBJ