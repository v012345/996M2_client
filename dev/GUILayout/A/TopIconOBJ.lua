local TopIcon = {}
TopIcon.__cname = "TopIcon"
TopIcon.eventName = "图标配置"
TopIcon.IocnSaate = true
TopIcon.config = ssrRequireCsvCfg("cfg_top_icon")
TopIcon.time = 0
TopIcon.Switch = false

--顶部按钮配置
local top_but_cfg = {
    ["101"] = {wnd = ssrObjCfg.ChongZhiZhongXin},
    ["102"] = {wnd = ssrConstCfg.Box996},
    ["103"] = {wnd = ssrConstCfg.TradingBank},
    ["104"] = {wnd = ssrObjCfg.HuoDongDaTing},  --活动大厅
    ["105"] = {wnd = ssrObjCfg.FuLiDaTing},     --福利大厅
    ["106"] = {wnd = ssrObjCfg.YouXiGongLve},   --游戏攻略
    ["107"] = {wnd = ssrObjCfg.ShiJieDiTu},     --世界地图
    ["108"] = {wnd = ssrObjCfg.KuangBao},       --狂暴之力
    ["109"] = {wnd = ssrObjCfg.NiuMaQiYuLu},    --牛马奇遇录

    ["110"] = {wnd = ssrObjCfg.NiuMaNiXi},      --牛马逆袭
    ["111"] = {wnd = ssrObjCfg.NiuMaZanZhu},    --牛马赞助
    ["112"] = {wnd = ssrObjCfg.TeQuan},         --解绑特权
    ["113"] = {wnd = ssrObjCfg.ShouChong},      --首充
    ["114"] = {wnd = ssrObjCfg.MeiRiChongZhi},   --日冲图标
}

--右侧按钮配置
local right_icon_cfg = {
    ["btn_icon_1"]  =   {1,  x = 0, y = 170, icon = "1900013012", wnd = ssrConstCfg.SkillSetting},  --技能
    ["btn_icon_2"]  =   {2,  x = 70, y = 170, icon = "1900013014", wnd = ssrConstCfg.Team},         --组队
    ["btn_icon_3"]  =   {3,  x = 140, y = 170, icon = "1900013013", wnd = ssrConstCfg.Guild},       --行会
    ["btn_icon_4"]  =   {4,  x = 0, y = 90, icon = "1900013019", wnd = ssrConstCfg.Auction},        --拍卖行
    --["btn_icon_5"]  =   {5,  x = 70, y = 90, icon = "jiaoyihang", wnd = ssrConstCfg.TradingBank},   --交易行
    --["btn_icon_6"]  =   {6,  x = 140, y = 90, icon = "1900013015", wnd = ssrConstCfg.Trade},        --交易
    --["btn_icon_7"]  =   {7,  x = 0, y = 10, icon = "1900012583", wnd = ssrConstCfg.Friend},          --好友
    ["btn_icon_8"]  =   {8,  x = 70, y = 90, icon = "1900013017", wnd = ssrConstCfg.Setting},        --设置
    ["btn_icon_9"]  =   {9,  x = 140, y = 90, icon = "1900013018", wnd = ssrConstCfg.ExitToRole},    --退出
}

-----------------------------------------------------------------
-----------------------↓↓↓↓  顶部功能按钮 ↓↓↓↓-----------------------
-----------------------------------------------------------------
local handle
if ssrConstCfg.client_type == 1 then
    TopIcon.top_position_hide = {x=-60,y=-5}
    TopIcon.top_position_show = {x=-720,y=-5}
else
    TopIcon.top_position_hide = {x=-60,y=0}
    TopIcon.top_position_show = {x=-750,y=0}
end
function TopIcon:setShowCopyBtn(bool)
    local function visible()
        if self.icon_is_show then
            GUI:Timeline_EaseSineIn_MoveTo(self.top_layout, self.top_position_hide,0.1)
        else
            GUI:Timeline_EaseSineIn_MoveTo(self.top_layout, self.top_position_show,0.1)
        end
    end
    if bool then
        if self.icon_is_show then
            GUI:Timeline_RotateTo(self.top_btn,180,0.1,visible)
        else
            GUI:Timeline_RotateTo(self.top_btn,0,0.1,visible)
        end
    else
        visible()
    end
end

--配置顶部Icon
function TopIcon:createTopIcon(data)
    local Node_x,Node_y = 0,0
    local state = SL:GetMetaValue("CURRENT_OPERMODE")     -- 1为端游 2为手游
    if state == 1 then
        Node_x, Node_y = -150,0
    else
        Node_x, Node_y = -183,27
    end
    --点击按钮  查找对应界面  并打打开
    local function Click(var)
        var =  tostring(var)
        for key, value in pairs(top_but_cfg) do
            if var == key then
                if value.wnd ~= nil then
                    GUI:Win_CloseAll()
                    ssrUIManager:OPEN(value.wnd)
                end
            end
        end
    end
    --绘制图标
    local function AddIcon()
        local TopIconNode_look = GUI:GetWindow( MainMiniMap._parent, "TopIconLayout")
        if TopIconNode_look then
            GUI:removeFromParent(TopIconNode_look) --将传入控件从父节点上移除
        end
        TopIconNode_look = GUI:Layout_Create(MainMiniMap._parent, "TopIconLayout", Node_x, Node_y, 550, 300)
        self.TopIconNode_look = TopIconNode_look
        local  TopIconNode_1 = GUI:Layout_Create(TopIconNode_look, "TopIconNode_1", 0, 0, 550, 300)
        local  TopIconNode_2 = GUI:Layout_Create(TopIconNode_look, "TopIconNode_2", 0, 0, 550, 300)
        GUI:setAnchorPoint(TopIconNode_1, 1, 1)
        GUI:setAnchorPoint(TopIconNode_2, 1, 1)
        self.TopIconNode_1 = TopIconNode_1
        self.TopIconNode_2 = TopIconNode_2
        if TopIconNode_1 then
            for i, v in ipairs(data) do
                if i >= 1 and  i <= 6 then
                    local x,y = 0,0
                    for j, k in ipairs(self.config) do
                        if v == k.id then
                            x,y = 475+(1-i)*70, 230
                            --local buttonName = "Button"..k.id
                            --SL:Print("绘制"..k.ico)
                            local _Handle = GUI:Button_Create(TopIconNode_1, k.id , x, y, "res/custom/topIcon/".. k.ico .."")
                            GUI:addOnClickEvent(_Handle,function()
                                Click(k.id)
                            end)

                            if k.effect ~= nil then
                                local pos = GUI:getContentSize(_Handle)
                                local _EffectHandle = GUI:Effect_Create(_Handle, "effect"..i, pos.width/2,pos.height/2, 0, k.effect , 0, 0, 3, 1)
                                if _EffectHandle then
                                    GUI:setScale(_EffectHandle, 1)
                                end
                            end
                        end
                    end
                elseif i >= 7  then
                    local x,y = 0,0
                    for j, k in ipairs(self.config) do
                        if v == k.id then
                            x,y = 475+(1-i+5)*70, 160
                            --local buttonName = "Button"..k.id
                            --SL:Print("绘制"..k.ico)
                            local _Handle = GUI:Button_Create(TopIconNode_1, k.id , x, y, "res/custom/topIcon/".. k.ico .."")
                            GUI:addOnClickEvent(_Handle,function()
                                Click(k.id)
                            end)

                            if k.effect ~= nil then
                                local pos = GUI:getContentSize(_Handle)
                                local _EffectHandle = GUI:Effect_Create(_Handle, "effect"..i, pos.width/2 + k.effect[2],pos.height/2 + k.effect[3], 0, k.effect[1] , 0, 0, 3, 1)
                                if _EffectHandle then
                                    GUI:setScale(_EffectHandle,  k.effect[4])
                                end
                            end
                        end
                    end

                end
            end
        end
        local _Handle1 = GUI:Button_Create(TopIconNode_2, "101" , 475, 230, "res/custom/topIcon/001.png")
        GUI:addOnClickEvent(_Handle1,function()
            Click(101)
        end)
        local _Handle2 = GUI:Button_Create(TopIconNode_2, "107" , 410, 230, "res/custom/topIcon/008.png")
        GUI:addOnClickEvent(_Handle2,function()
            Click(107)
        end)
        GUI:runAction(TopIconNode_2, GUI:ActionScaleTo(0, 0.001)) --将第二个控件缩小
    end

    --设置缩放动画
    local function SetAnimation()
        local Newstate = SL:GetMetaValue("CURRENT_OPERMODE")     -- 1为端游 2为手游
        local New_x, New_y = 0 ,0
        if Newstate == 1 then
            New_x, New_y = -150,0
        else
            New_x, New_y = -153,-3
        end
        if self.IocnSaate then
            GUI:runAction(self.TopIconNode_1,
                    GUI:ActionSequence(
                        GUI:ActionMoveTo(0, 100, 200),
                        GUI:ActionSpawn(GUI:ActionScaleTo(0, 1), GUI:ActionEaseBackOut(GUI:ActionMoveTo(0.2, New_x+150, New_y)))
            ))
        else
            GUI:runAction(self.TopIconNode_2,
                GUI:ActionSequence(
                    GUI:ActionMoveTo(0, 100, 200),
                    GUI:ActionSpawn(GUI:ActionScaleTo(0, 1), GUI:ActionEaseBackOut(GUI:ActionMoveTo(0.2, New_x+150, New_y)))
            ))
        end

    end
    --绘制切换图标
    GUI:removeChildByName(MainMiniMap._parent,"Button_switch")
    local Button_switch = GUI:Button_Create(MainMiniMap._parent, "Button_switch", Node_x-45, Node_y-107, "res/custom/topIcon/000.png")
    if Button_switch then
        GUI:setAnchorPoint(Button_switch, 0.5, 0.5)
        GUI:addOnClickEvent(Button_switch, function()
            if self.IocnSaate then
                self.IocnSaate = false
                GUI:Timeline_RotateTo(Button_switch,180,0.1)
                GUI:runAction(self.TopIconNode_1,
                    GUI:ActionSequence(                 --多个动作顺序播放
                        GUI:ActionScaleTo(0.3, 0),      --0.3秒缩放到0
                        GUI:CallFunc(SetAnimation)
                ))
            else
                self.IocnSaate = true
                GUI:Timeline_RotateTo(Button_switch,0,0.1)
                GUI:runAction(self.TopIconNode_2,
                    GUI:ActionSequence(
                        GUI:ActionScaleTo(0.3, 0),
                        GUI:CallFunc(SetAnimation)
                ))
            end
        end)
    end
    AddIcon()
end

function TopIcon:AFKUpdate()
    if SL:GetMetaValue("BATTLE_IS_AFK") then
        GUI:Button_loadTextureNormal(self.AFKbutton, "res/private/main/Skill/1900012709.png")
        if self.AFKeffect then
            GUI:setVisible(self.AFKeffect,true)
        end
    else
        GUI:Button_loadTextureNormal(self.AFKbutton, "res/private/main/Skill/1900012708.png")
        if self.AFKeffect then
            GUI:setVisible(self.AFKeffect,false)
        end
    end
end

function TopIcon:StartAFK()
    if SL:GetMetaValue("BATTLE_IS_AFK") then
        SL:SetMetaValue("BATTLE_AFK_END")
    else
        SL:SetMetaValue("BATTLE_AFK_BEGIN")
    end
end

function TopIcon:createSkillBtn()
    if ssrConstCfg.client_type == 2 then
        local parent = GUI:Win_FindParent(109)
        if parent then
            GUI:removeAllChildren(parent)
            for key, val in pairs(right_icon_cfg) do
                handle = GUI:Button_Create(parent, key, val.x, val.y, "res/private/main/bottom/"..val.icon..".png")
                GUI:addOnClickEvent(handle, function()
                    ssrUIManager:OPEN(val.wnd)
                end)
            end
        end
        parent = GUI:Win_FindParent(107)
        if parent then
            GUI:removeAllChildren(parent)
            --背包
            handle = GUI:Button_Create(parent, "10086",-65,60, "res/private/main/bottom/1900013011.png")
            GUI:addOnClickEvent(handle, function()
                ssrUIManager:OPEN(ssrConstCfg.Bag)
            end)
            --角色
            handle = GUI:Button_Create(parent, "1000",-135,60, "res/private/main/bottom/1900013010.png")
            GUI:addOnClickEvent(handle, function()
               ssrMessage:sendmsg(ssrNetMsgCfg.Public_Request,2)
            end)
            --------------- 挂机按钮 ------------------
            self.AFKbutton = GUI:Button_Create(parent, "Button_AFK", -205, 60, "res/private/main/Skill/1900012708.png")
            self.AFKeffect = GUI:Effect_Create(parent, "effect_AFK", -211, 127, 0, 0)
            handle = GUI:Layout_Create(parent, "Layout_AFK", -205, 60, 60, 55, false)
            GUI:setVisible(self.AFKeffect,false)
            GUI:setTouchEnabled(handle,true)
            GUI:setTouchEnabled(self.AFKbutton, true)
            GUI:Button_loadTexturePressed(self.AFKbutton, "res/private/main/Skill/1900012709.png")
            GUI:addOnClickEvent(self.AFKbutton, function()
                self:StartAFK()
            end)
            GUI:addOnClickEvent(handle, function()
                self:StartAFK()
            end)
            --巡航
            handle = GUI:Button_Create(parent, "xh",-135,-4, "res/custom/XunHangGuaJi/icon_1.png")
            GUI:addOnClickEvent(handle, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OpenUI)
            end)
            --潜能
            local qianneng = GUI:Button_Create(parent, "qn",-205,-4, "res/private/main/Skill/btn_jxqn1.png")
            self.qianneng = qianneng
            GUI:addOnClickEvent(self.qianneng, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.JiXianQianNeng_Request)
            end)
            --宠物
            handle = GUI:Button_Create(parent, "zh",-205,-8, "res/custom/zdy/zyx_topbutton_11.png")
            GUI:addOnClickEvent(handle, function()
                ssrUIManager:OPEN(ssrConstCfg.Equip)
            end)
            --左上角
            --主线任务剧情
            local taskParent = GUI:Win_FindParent(110)
            if taskParent then
                local widgetObj = GUI:getChildByName(taskParent, "ChaoJiJuQing")
                if not GUI:Win_IsNotNull(widgetObj) then
                    local Button = GUI:Button_Create(taskParent, "ChaoJiJuQing", 1.00, 0, "res/custom/public/task_right.png")
                    GUI:Button_loadTexturePressed(Button, "res/custom/public/task_right.png")
                    GUI:addOnClickEvent(Button, function()
                        ssrUIManager:OPEN(ssrObjCfg.ChaoJiJuQing, nil, true)
                    end)
                    Button = GUI:Button_Create(taskParent, "ZhuXianRenWu", 101.00, 0, "res/custom/public/task_left.png")
                    GUI:Button_loadTexturePressed(Button, "res/custom/public/task_left.png")
                    GUI:addOnClickEvent(Button, function()
                        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuXianRenWu_OpenUI)
                    end)
                end
            end
        end
    --端游显示
    elseif ssrConstCfg.client_type == 1 then
        local parent = GUI:Win_FindParent(107)
        if parent then
            GUI:removeAllChildren(parent)
            --背包
            --------------- 挂机按钮 ------------------
            self.AFKbutton = GUI:Button_Create(parent, "Button_AFK", -65, 10, "res/private/main/Skill/1900012708.png")
            self.AFKeffect = GUI:Effect_Create(parent, "effect_AFK", -71, 77, 0, 0)
            handle = GUI:Layout_Create(parent, "Layout_AFK", -65, 10, 60, 55, false)
            GUI:setVisible(self.AFKeffect,false)
            GUI:setTouchEnabled(handle,true)
            GUI:setTouchEnabled(self.AFKbutton, true)
            GUI:Button_loadTexturePressed(self.AFKbutton, "res/private/main/Skill/1900012709.png")
            GUI:addOnClickEvent(self.AFKbutton, function()
                self:StartAFK()
            end)
            GUI:addOnClickEvent(handle, function()
                self:StartAFK()
            end)
            --宠物
            --handle = GUI:Button_Create(parent, "zh",-65,150, "res/private/main/Skill/1900012709.png")
            --GUI:addOnClickEvent(handle, function()
            --    ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OpenUI)
            --end)
            --巡航
            handle = GUI:Button_Create(parent, "xh",-65,80, "res/custom/XunHangGuaJi/icon_1.png")
            GUI:addOnClickEvent(handle, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OpenUI)
            end)

            --潜能
            local qianneng = GUI:Button_Create(parent, "qn",-65,-60, "res/private/main/Skill/btn_jxqn1.png")
            self.qianneng = qianneng
            GUI:addOnClickEvent(self.qianneng, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.JiXianQianNeng_Request)
            end)


            --测试按钮
            local gmlevel = ssrDataPlayer:getGMLevel()
            --SL:dump(gmlevel)
            if gmlevel == 10 then
                handle = GUI:Button_Create(parent, "ceshi", -200.00, 10, "")
                GUI:setContentSize(handle, 60, 36)
                GUI:Button_setTitleText(handle, [[ ]])
                GUI:Button_setTitleColor(handle, "#ffffff")
                GUI:Button_setTitleFontSize(handle, 14)
                GUI:Button_titleEnableOutline(handle, "#000000", 1)
                GUI:addOnClickEvent(handle, function()
                    ssrUIManager:OPEN(ssrObjCfg.test)
                end)
            end
            --左上角
            --主线任务剧情
            local taskParent = GUI:Win_FindParent(110)
            if taskParent then
                local widgetObj = GUI:getChildByName(taskParent, "ChaoJiJuQing")
                if not GUI:Win_IsNotNull(widgetObj) then
                    local Button = GUI:Button_Create(taskParent, "ChaoJiJuQing", 1.00, 0, "res/custom/public/task_right.png")
                    GUI:Button_loadTexturePressed(Button, "res/custom/public/task_right.png")
                    GUI:addOnClickEvent(Button, function()
                        ssrUIManager:OPEN(ssrObjCfg.ChaoJiJuQing, nil, true)
                    end)
                    Button = GUI:Button_Create(taskParent, "ZhuXianRenWu", 101.00, 0, "res/custom/public/task_left.png")
                    GUI:Button_loadTexturePressed(Button, "res/custom/public/task_left.png")
                    GUI:addOnClickEvent(Button, function()
                        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuXianRenWu_OpenUI)
                    end)
                end
            end

        end
    end
end


--------------------------- 注册事件 -----------------------------
function TopIcon:RegisterEvent()
    --自动挂机
    SL:RegisterLUAEvent(LUA_EVENT_AFKBEGIN, self.eventName, function()
        self:AFKUpdate()
    end)

    --自动挂机结束
    SL:RegisterLUAEvent(LUA_EVENT_AFKEND, self.eventName, function()
        self:AFKUpdate()
    end)
end

-------------------------网络消息---------------------------
--同步数据
function TopIcon:UpdateIcon(arg1,arg2,arg3,data)
        if data[1] == 1 then
            GUI:Button_loadTextureNormal(self.qianneng, "res/private/main/Skill/btn_jxqn2.png")
        else
            GUI:Button_loadTextureNormal(self.qianneng, "res/private/main/Skill/btn_jxqn1.png")
        end
        local itemText =  GUI:Text_Create(self.qianneng, "qndjs", 15, 15, 18, "#FF0000", "倒计旄1�7")
        GUI:Text_COUNTDOWN(itemText,30, function()
            self.time = 0
            GUI:removeAllChildren(self.qianneng)
        end)
end

--同步数据
function TopIcon:SyncResponse(arg1,arg2,arg3,data)
    --SL:ScheduleOnce(function ()
    --    self:createTopIcon()
    --end, 1.5)
    --SL:dump(data)

        self:createTopIcon(data[1])
    --SL:ScheduleOnce(function ()
        self:createSkillBtn()
    --end, 1.5)
        self:RegisterEvent()
        --SL:dump(data)
    --self.data = data


end

return TopIcon