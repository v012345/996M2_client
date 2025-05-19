ZhanJiangDuoQiOBJ = {}
ZhanJiangDuoQiOBJ.__cname = "ZhanJiangDuoQiOBJ"
ZhanJiangDuoQiOBJ.cfg_ZhanJiangDuoQiGuildReward = ssrRequireCsvCfg("cfg_ZhanJiangDuoQiGuildReward")
ZhanJiangDuoQiOBJ.cfg_ZhanJiangDuoQiPersonReward = ssrRequireCsvCfg("cfg_ZhanJiangDuoQiPersonReward")
ZhanJiangDuoQiOBJ.cost = { {} }
ZhanJiangDuoQiOBJ.give = { {} }
ZhanJiangDuoQiOBJ.isLoadBarObj = nil
ZhanJiangDuoQiOBJ.barUi = nil
ZhanJiangDuoQiOBJ.zjdq_rank = nil
ZhanJiangDuoQiOBJ.zjdq_rank_ui = nil
ZhanJiangDuoQiOBJ.EventName = "ZhanJiangDuoQi"
ZhanJiangDuoQiOBJ.currRank = 1
--取前十个元素
local function getFirstTenElements(arr)
    local result = {}
    -- 计算需要获取的元素数量，防止数组长度小于10
    local count = math.min(10, #arr)
    for i = 1, count do
        result[i] = arr[i]
    end
    return result
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhanJiangDuoQiOBJ:main(objcfg)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhanJiangDuoQi_Request)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.ZhanJiangDuoQi_GetRankData)
    GUI:addOnClickEvent(self.ui.Button_lingQu,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhanJiangDuoQi_LingQuReward)
    end)

    GUI:addOnClickEvent(self.ui.Button_Tips,function ()
        local bool = GUI:getVisible(self.ui.Image_Tips)
        if bool then
            GUI:setVisible(self.ui.Image_Tips,false)
        else
            GUI:setVisible(self.ui.Image_Tips,true)
        end
    end)

end

function ZhanJiangDuoQiOBJ:GetRankData(arg1,arg2,arg3,data)
    local tPersonRank = getFirstTenElements(data.tPersonRank)
    local tGuildRank = getFirstTenElements(data.tGuildRank)
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    GUI:ListView_removeAllItems(self.ui.ListView_2)
    for i, v in ipairs(tGuildRank) do
        local Panel = GUI:Layout_Create(self.ui.ListView_1, "Panel_" .. i, 0.00, 42.00, 188, 22, false)
        local rankId = GUI:Text_Create(Panel, "Text_rankId_" .. i, 5.00, 3.00, 14, "#ffffff", i)
        GUI:Text_enableOutline(rankId, "#000000", 1)
        local nameText = GUI:ScrollText_Create(Panel, "Text_nameText_" .. i, 16.00, 3.00, 110, 14, "#ffffff", v[1])
        GUI:ScrollText_enableOutline(nameText, "#000000", 1)
        local pointText = GUI:Text_Create(Panel, "Text_pointText_" .. i, 150.00, 3.00, 14, "#ffffff", v[2])
        GUI:Text_enableOutline(pointText, "#000000", 1)
    end
    for i, v in ipairs(tPersonRank) do
        local Panel = GUI:Layout_Create(self.ui.ListView_2, "Panel_" .. i, 0.00, 42.00, 188, 22, false)
        local rankId = GUI:Text_Create(Panel, "Text_rankId_" .. i, 5.00, 3.00, 14, "#ffffff", i)
        GUI:Text_enableOutline(rankId, "#000000", 1)
        local nameText = GUI:ScrollText_Create(Panel, "Text_nameText_" .. i, 16.00, 3.00, 110, 14, "#ffffff", v[1])
        GUI:ScrollText_enableOutline(nameText, "#000000", 1)
        local pointText = GUI:Text_Create(Panel, "Text_pointText_" .. i, 150.00, 3.00, 14, "#ffffff", v[2])
        GUI:Text_enableOutline(pointText, "#000000", 1)
    end
end

function ZhanJiangDuoQiOBJ:UpdateUI()

end

function ZhanJiangDuoQiOBJ:ShowRankMain(ListView,index,cfg,rankData)
    GUI:ListView_removeAllItems(ListView)
    for i = 1, index do
        local config = cfg[i]
        local name = "暂无"
        if rankData[i] then
           name = string.format("%s(积分:%s)",rankData[i][1],rankData[i][2])
        end
        local Image_1 = GUI:Image_Create(ListView, "Image_"..i, 0.00, 309.00, "res/custom/ZhanJiangDuoQi/rank_"..i..".png")
        local Text_1 = GUI:Text_Create(Image_1, "Text_"..i, 337.00, 32.00, 22, "#00ff00", name)
        GUI:setAnchorPoint(Text_1, 0.50, 0.00)
        GUI:Text_enableOutline(Text_1, "#000000", 1)
        local Panel_Cost = GUI:Layout_Create(Image_1, "Panel_Cost"..i, 580.00, 12.00, 213, 51, false)
        ssrAddItemListX(Panel_Cost,config.rewardShow or {},"item_"..i)
    end
end

function ZhanJiangDuoQiOBJ:GetHonorData(arg1,arg2,arg3,data)
    self.honorData = data
end

function ZhanJiangDuoQiOBJ:OpenRankUI()
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true)
    GUI:LoadExport(parent, "KuaFu/ZhanJiangDuoQi_Mian_Rank_UI")
    local rank_ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, rank_ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(rank_ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(rank_ui.CloseButton, function()
        GUI:Win_Close(parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(parent)
    local bntList = GUI:getChildren(rank_ui.Node_1)
    local function btn_state(index)
        for i, v in ipairs(bntList) do
            if i == index then
                GUI:setLocalZOrder(v,2)
                GUI:Button_setBrightEx(v,false)
            else
                GUI:Button_setBrightEx(v,true)
                GUI:setLocalZOrder(v,1)
            end
        end
    end
    ssrMessage:sendmsg(ssrNetMsgCfg.ZhanJiangDuoQi_GetHonorData)
    --默认按钮状态
    GUI:Button_setBrightEx(rank_ui.Button_right_1,false)
    GUI:setLocalZOrder(rank_ui.Button_right_1,2)
    --初始化显示
    self:ShowRankMain(rank_ui.ListView_1,11,self.cfg_ZhanJiangDuoQiPersonReward,self.tPersonRank)
    GUI:Image_loadTexture(rank_ui.Image_title,"res/custom/ZhanJiangDuoQi/titile2.png")
    GUI:addOnClickEvent(rank_ui.Button_right_1, function()
        btn_state(1)
        GUI:Image_loadTexture(rank_ui.Image_title,"res/custom/ZhanJiangDuoQi/titile2.png")
        GUI:Image_loadTexture(rank_ui.Image_title_1,"res/custom/ZhanJiangDuoQi/reward.png")
        self:ShowRankMain(rank_ui.ListView_1,11,self.cfg_ZhanJiangDuoQiPersonReward,self.tPersonRank)
    end)
    GUI:addOnClickEvent(rank_ui.Button_right_2, function()
        btn_state(2)
        GUI:Image_loadTexture(rank_ui.Image_title,"res/custom/ZhanJiangDuoQi/titile1.png")
        GUI:Image_loadTexture(rank_ui.Image_title_1,"res/custom/ZhanJiangDuoQi/reward.png")
        self:ShowRankMain(rank_ui.ListView_1,10,self.cfg_ZhanJiangDuoQiGuildReward,self.tGuildRank)
    end)
    GUI:addOnClickEvent(rank_ui.Button_right_3, function()
        btn_state(3)
        local rongYuData = {"积分：","击杀数：","助攻数："}
        local keys = {"scorePlayer","killPlayer","assistPlayer"}
        GUI:ListView_removeAllItems(rank_ui.ListView_1)
        GUI:Image_loadTexture(rank_ui.Image_title,"res/custom/ZhanJiangDuoQi/titile2.png")
        GUI:Image_loadTexture(rank_ui.Image_title_1,"res/custom/ZhanJiangDuoQi/reward1.png")
        for i, v in ipairs(rongYuData) do
            local txtstr = ""
            local score = {}
            local kill = {}
            local assist = {}
            if not self.honorData then
                txtstr = "暂无"
            else
                local playerData = self.honorData[keys[i]]
                if playerData.name == 0  then
                    txtstr = "暂无"
                else
                    txtstr = playerData.name .. "(" .. v.. playerData.point .. ")"
                end
            end

            local Image_1 = GUI:Image_Create(rank_ui.ListView_1, "Image_"..i, 0.00, 309.00, "res/custom/ZhanJiangDuoQi/rongyu"..i..".png")
            local Text_1 = GUI:Text_Create(Image_1, "Text_"..i, 300.00, 32.00, 22, "#00ff00", txtstr)
            GUI:setAnchorPoint(Text_1, 0.0, 0.00)
            GUI:Text_enableOutline(Text_1, "#000000", 1)
        end
    end)
end
--主界面下中
function ZhanJiangDuoQiOBJ:UpdateProgressbar(arg1, arg2, arg3, data)
    local areaName = data.areaName
    local curProgress = data.curProgress
    local maxProgress = data.maxProgress
    local tempOwnGuildName = data.tempOwnGuildName
    local ownGuildName = data.ownGuildName
    local topGuildName = data.topGuildName
    local speed = data.speed
    local leftLimitTime = data.leftLimitTime
    local barPosition = {
        x = -110, y = 260
    }
    if ssrConstCfg.isPc then
        barPosition.x = -140
        barPosition.y = 230
    else
        barPosition.x = -100
        barPosition.y = 230
    end
    local progressPer = math.floor(curProgress / maxProgress * 100)
    local str = areaName .. "#255| "
    if ownGuildName ~= "" then
        str = str .. ownGuildName .. "#254| " .. progressPer .. "%#250"
    else
        if leftLimitTime > 0 then
            str = str .. leftLimitTime .. "秒后可占领#247| " .. progressPer .. "%#250>"
        else
            str = str .. " " .. progressPer .. "%"
        end
    end
    local desc = ""
    if ownGuildName ~= "" then
        if topGuildName ~= ownGuildName then
            if speed > 0 then
                desc = "[" .. topGuildName .. "]夺旗中"
            end
        end
    else
        if tempOwnGuildName ~= "" then
            if speed > 0 then
                desc = "[" .. topGuildName .. "]夺旗中"
            else
                desc = "行会争夺中"
            end
        end
    end
    local parent = GUI:Win_FindParent(108)
    if GUI:Win_IsNull(self.isLoadBarObj) then
        GUI:LoadExport(parent, "KuaFu/ZhanJiangDuoQi_Progressbar_UI")
        self.isLoadBarObj = GUI:getChildByName(parent, "zjdq_Progressbar")
        self.barUi = GUI:ui_delegate(self.isLoadBarObj)
        GUI:setPosition(self.isLoadBarObj, barPosition.x, barPosition.y)
    end
    local ImageRes = "res/custom/ZhanJiangDuoQi/pg1.png"
    local userId = SL:GetMetaValue("USER_ID")
    local guildName = SL:GetMetaValue("ACTOR_GUILD_NAME", userId)
    if ownGuildName == "" or ownGuildName == guildName then
        ImageRes = "res/custom/ZhanJiangDuoQi/pg2.png"
    end
    GUI:LoadingBar_loadTexture(self.barUi.LoadingBar_1, ImageRes)
    GUI:LoadingBar_setPercent(self.barUi.LoadingBar_1, progressPer)

    createMultiLineRichText(self.barUi.zjdq_Node_1, "tips", 8, 0, { str }, nil, 280, 14)
end

function ZhanJiangDuoQiOBJ:ClearProgressbar()
    local parent = GUI:Win_FindParent(108)
    local zjdq_Progressbar = GUI:getChildByName(parent, "zjdq_Progressbar")
    if GUI:Win_IsNotNull(zjdq_Progressbar) then
        GUI:removeChildByName(parent, "zjdq_Progressbar")
        self.isLoadBarObj = nil
    end
end

function ZhanJiangDuoQiOBJ:zjdqShowMap(arg1, arg2, arg3, data)
    ssrGameEvent:push(ssrEventCfg.OnZjdqShowMap, data)
end

function ZhanJiangDuoQiOBJ:GetMyRank(data)
    local myRank, myPoint, guildRank, guildPoint = 0,0,0,0
        local Name = SL:GetMetaValue("USER_NAME")
        for i, v in ipairs(data.tPersonRank) do
            if v[1] == Name then
                myRank, myPoint = i, v[2]
                break
            end
        end
        local userId = SL:GetMetaValue("USER_ID")
        local guildName = SL:GetMetaValue("ACTOR_GUILD_NAME", userId)
        for i, v in ipairs(data.tGuildRank) do
            if v[1] == guildName then
                guildRank, guildPoint = i, v[2]
                break
            end
        end
    return myRank, myPoint, guildRank, guildPoint
end


function ZhanJiangDuoQiOBJ:ShowRank(arg1, arg2, arg3, data)
    if GUI:Win_IsNull(self.zjdq_rank_ui.ListView_1) then
        return
    end
    local tPersonRank = getFirstTenElements(data.tPersonRank)
    local tGuildRank = getFirstTenElements(data.tGuildRank)
    self.tPersonRank = tPersonRank
    self.tGuildRank = tGuildRank
    local myRank, myPoint, guildRank, guildPoint = self:GetMyRank(data)
    GUI:Text_setString(self.zjdq_rank_ui.Text_5, myRank)
    GUI:Text_setString(self.zjdq_rank_ui.Text_7, myPoint)
    GUI:Text_setString(self.zjdq_rank_ui.Text_11, guildRank)
    GUI:Text_setString(self.zjdq_rank_ui.Text_13, guildPoint)
    if GUI:Win_IsNotNull(self.zjdq_rank_ui.Text_9) then
        local Text_9Content = GUI:Text_setString(self.zjdq_rank_ui.Text_9)
        if Text_9Content == "" or not Text_9Content then
            GUI:Text_COUNTDOWN(self.zjdq_rank_ui.Text_9, data.leftTime)
        end
    end

    if GUI:Win_IsNotNull(self.zjdq_rank) then
        GUI:ListView_removeAllItems(self.zjdq_rank_ui.ListView_1)
        for i, v in ipairs(tPersonRank) do
            local widget = GUI:Widget_Create(self.zjdq_rank_ui.ListView_1, "widget1_" .. i, 0, 0, 200, 22)
            GUI:LoadExport(widget, "KuaFu/ZhanJiangDuoQiRank_cell_UI")
            local rank_ui = GUI:ui_delegate(widget)
            GUI:Text_setString(rank_ui.Text_1, i)
            local scrollText = GUI:ScrollText_Create(rank_ui.Panel_1, "scrollText", 22, 2, 120, 14, "#C7BB99", v[1])
            GUI:ScrollText_enableOutline(scrollText, "#000000", 1)
            GUI:Text_setString(rank_ui.Text_3, v[2])
        end
        GUI:ListView_removeAllItems(self.zjdq_rank_ui.ListView_2)
        for i, v in ipairs(tGuildRank) do
            local widget = GUI:Widget_Create(self.zjdq_rank_ui.ListView_2, "widget2_" .. i, 0, 0, 200, 22)
            GUI:LoadExport(widget, "KuaFu/ZhanJiangDuoQiRank_cell_UI")
            local rank_ui = GUI:ui_delegate(widget)
            GUI:Text_setString(rank_ui.Text_1, i)
            local scrollText = GUI:ScrollText_Create(rank_ui.Panel_1, "scrollText", 22, 2, 120, 14, "#C7BB99", v[1])
            GUI:ScrollText_enableOutline(scrollText, "#000000", 1)
            GUI:Text_setString(rank_ui.Text_3, v[2])
        end
    end
end

SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, ZhanJiangDuoQiOBJ.EventName, function(data)
    if data.mapID == "斩将夺旗" then
        ZhanJiangDuoQiOBJ.currRank = 1
        local parent = GUI:Win_FindParent(110)
        GUI:LoadExport(parent, "KuaFu/ZhanJiangDuoQi_Rank_UI")
        if GUI:Win_IsNotNull(parent) then
            ZhanJiangDuoQiOBJ.zjdq_rank = GUI:getChildByName(parent, "zjdq_rank")
            ZhanJiangDuoQiOBJ.zjdq_rank_ui = GUI:ui_delegate(ZhanJiangDuoQiOBJ.zjdq_rank)
            GUI:addOnClickEvent(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_1,function ()
                GUI:Button_loadTextureNormal(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_1,"res/custom/ZhanJiangDuoQi/rank/btn_1_1.png")
                GUI:Button_loadTextureNormal(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_2,"res/custom/ZhanJiangDuoQi/rank/btn_2_2.png")
                GUI:setVisible(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Node_1, true)
                GUI:setVisible(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Node_2, false)
                ZhanJiangDuoQiOBJ.currRank = 1
            end)

            GUI:addOnClickEvent(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_2,function ()
                GUI:Button_loadTextureNormal(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_1,"res/custom/ZhanJiangDuoQi/rank/btn_1_2.png")
                GUI:Button_loadTextureNormal(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_2,"res/custom/ZhanJiangDuoQi/rank/btn_2_1.png")
                GUI:setVisible(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Node_1, false)
                GUI:setVisible(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Node_2, true)
                ZhanJiangDuoQiOBJ.currRank = 2
            end)

            --退出活动
            GUI:addOnClickEvent(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_3,function ()
                local data = {}
                data.str = "退出活动再次进入扣除10%个人积分，确定退出？"
                data.btnType = 2
                data.callback = function(atype, param)
                    if atype == 1 then
                        ssrMessage:sendmsg(ssrNetMsgCfg.ZhanJiangDuoQi_Exit)
                    end
                end
                SL:OpenCommonTipsPop(data)
            end)

            --查看排名奖励
            GUI:addOnClickEvent(ZhanJiangDuoQiOBJ.zjdq_rank_ui.Button_4,function ()
                ZhanJiangDuoQiOBJ:OpenRankUI()
            end)

        end
    elseif data.lastMapID == "斩将夺旗" then
        local parent = GUI:Win_FindParent(110)
        local zjdq_rank = GUI:getChildByName(parent, "zjdq_rank")
        if GUI:Win_IsNotNull(zjdq_rank) then
            GUI:removeChildByName(parent, "zjdq_rank")
        end
    end

    --local zjdq_Progressbar = GUI:getChildByName(parent, "zjdq_rank")
    --if GUI:Win_IsNotNull(zjdq_Progressbar) then
    --    GUI:removeChildByName(parent,"zjdq_Progressbar")
    --    self.isLoadBarObj = nil
    --end

end)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhanJiangDuoQiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZhanJiangDuoQiOBJ