LeftAttrOBJ = {}
LeftAttrOBJ.__cname = "LeftAttrOBJ"
LeftAttrOBJ.config = ssrRequireCsvCfg("cfg_FuHuoZhuangBei")
LeftAttrOBJ.scheduleID = nil
if ssrConstCfg.isPc then
    LeftAttrOBJ.left_position_hide = { x = -200, y = -36 }
    LeftAttrOBJ.left_position_show = { x = 0, y = -36 }
else
    LeftAttrOBJ.left_position_hide = { x = -200, y = -96 }
    LeftAttrOBJ.left_position_show = { x = 0, y = -96 }
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LeftAttrOBJ:main()

end

function LeftAttrOBJ:HideandShow(bool)
    local function visible()
        if self.IsShow then
            GUI:Timeline_EaseSineIn_MoveTo(self.ui.ImageView, self.left_position_hide, 0.1)
        else
            GUI:Timeline_EaseSineIn_MoveTo(self.ui.ImageView, self.left_position_show, 0.1)
        end
    end
    if bool then
        if self.IsShow then
            GUI:Timeline_RotateTo(self.ui.HideButton, 180, 0.1, visible)
        else
            GUI:Timeline_RotateTo(self.ui.HideButton, 0, 0.1, visible)
        end
    else
        visible()
    end
end

local function createLeftPanel()
    local parent = GUI:Win_FindParent(105)
    if parent then
        GUI:removeAllChildren(parent)
        local node = GUI:Node_Create(parent, "Node", 0.00, 0.00)
        local ImageView = GUI:Image_Create(node, "ImageView", 0.00, LeftAttrOBJ.left_position_show.y, "res/custom/LeftAttr/bg.png")
        local defaultY = 137
        GUI:Text_Create(ImageView, "gongSu", 70, defaultY, 15, "#21faf2", "")
        defaultY = defaultY - 26
        GUI:Text_Create(ImageView, "qieGe", 70, defaultY, 15, "#21faf2", "")
        defaultY = defaultY - 26
        GUI:Text_Create(ImageView, "baoLv", 70, defaultY, 15, "#21faf2", "")
        defaultY = defaultY - 26
        GUI:Text_Create(ImageView, "beiGong", 70, defaultY, 15, "#21faf2", "")
        defaultY = defaultY - 26
        GUI:Text_Create(ImageView, "fuHuo", 70, defaultY, 15, "#FF0000", "")
        defaultY = defaultY - 26
        GUI:Text_Create(ImageView, "zhuangTai", 70, defaultY, 15, "#00FF00", "脱战状态")
        local HideButtonY = LeftAttrOBJ.left_position_show.y - 14
        local HideButton = GUI:Button_Create(node, "HideButton", 14, HideButtonY, "res/custom/LeftAttr/btn.png")
        GUI:setTouchEnabled(HideButton, true)
        GUI:setAnchorPoint(HideButton, 0.5, 0.5)
        LeftAttrOBJ.ui = GUI:ui_delegate(parent)
        --SL:CustomAttrWidgetAdd("&<REDKEY/U40>&%", LeftAttrOBJ.ui.gongSu)
        SL:CustomAttrWidgetAdd("&<REDKEY/T40>&倍", LeftAttrOBJ.ui.beiGong)
        GUI:addOnClickEvent(LeftAttrOBJ.ui.HideButton, function()
            LeftAttrOBJ.IsShow = not LeftAttrOBJ.IsShow
            LeftAttrOBJ:HideandShow(true)
        end)
    end
end
--buff改变触发
function LeftAttrOBJ:onBuffUpdate(t)
    self:reloadInit()
    if t.buffID == 10001 then
        if t.type == 1 then
            GUI:Text_setString(LeftAttrOBJ.ui.zhuangTai, "战斗状态")
            GUI:Text_setTextColor(LeftAttrOBJ.ui.zhuangTai, "#FF0000")
        end

        if t.type == 0 then
            GUI:Text_setString(LeftAttrOBJ.ui.zhuangTai, "脱战状态")
            GUI:Text_setTextColor(LeftAttrOBJ.ui.zhuangTai, "#00FF00")
        end
    end

    if t.buffID == 10003 then
        if t.type == 1 then
            local actorID = SL:GetMetaValue("MAIN_ACTOR_ID")                        --获取玩家对象
            local _buff = SL:GetMetaValue("ACTOR_BUFF_DATA_BY_ID", actorID, 10003)  --获取10003号buff信息
            local endtime = _buff["endTime"]   --获取该buff剩余时间
            self.endtime = endtime
        end
    end
end

function LeftAttrOBJ:onAttrChange()
    self:reloadInit()
    local qieGe = SL:GetMetaValue("ATT_BY_TYPE", 200)
    local baoLv = SL:GetMetaValue("ATT_BY_TYPE", 204)
    local gongSu = SL:GetMetaValue("ATT_BY_TYPE", 228)
    GUI:Text_setString(self.ui.qieGe, qieGe)
    GUI:Text_setString(self.ui.baoLv, baoLv .. "%")
    GUI:Text_setString(self.ui.gongSu, gongSu + 100 .. "%")
end

function LeftAttrOBJ:UpdateUI()
    self:reloadInit()
    GUI:unSchedule(self.ui.fuHuo) --停止该控件下定时器
    if type(self.state[1]) == "string" then
        GUI:Text_setString(self.ui.fuHuo, self.state[1])
        if self.state[1] == "未穿戴" then
            GUI:Text_setTextColor(self.ui.fuHuo, "#FF0000")
        else
            GUI:Text_setTextColor(self.ui.fuHuo, "#00FF00")
        end
    end

    if type(self.state[1]) == "number" then
        local times = self.state[1]
        GUI:Text_setTextColor(self.ui.fuHuo, "#FF0000")
        GUI:Text_setString(self.ui.fuHuo, "倒计时" .. times .. "秒")
        local function showTime()
            GUI:Text_setString(self.ui.fuHuo, "倒计时" .. times .. "秒")
            times = times - 1
            if times < 0 then
                GUI:unSchedule(self.ui.fuHuo) --停止该控件下定时器
            end
        end
        GUI:schedule(self.ui.fuHuo, showTime, 1)
    end
end
--重载初始化
function LeftAttrOBJ:reloadInit()
    if not self.ui then
        local parent = GUI:Win_FindParent(105)
        self.ui = GUI:ui_delegate(parent)
    end
end

-- 优先加载界面
local function onEnterGameWorld()
    LeftAttrOBJ.isInit = true
    createLeftPanel()
end
--进入游戏触发
SL:RegisterLUAEvent(LUA_EVENT_ENTER_WORLD, "LeftAttr", onEnterGameWorld)

-- BUFF触发
local function onBuffUpdate(t)
    LeftAttrOBJ:onBuffUpdate(t)
end
SL:RegisterLUAEvent(LUA_EVENT_MAINBUFFUPDATE, "LeftAttr", onBuffUpdate)

-- 属性触发
local function onAttrChange()
    LeftAttrOBJ:onAttrChange()
end
SL:RegisterLUAEvent(LUA_EVENT_ROLE_PROPERTY_CHANGE, "LeftAttr", onAttrChange)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
--function LeftAttrOBJ:SyncResponse(arg1, arg2, arg3, data)
--    self.data = data
--    if GUI:GetWindow(nil, self.__cname) then
--        --self:UpdateUI()
--    end
--end


--登录同步消息
function LeftAttrOBJ:FuHuo(arg1, arg2, arg3, state)
    if not self.ui then
        local parent = GUI:Win_FindParent(105)
        self.ui = GUI:ui_delegate(parent)
    end
    self.state = state
    self:UpdateUI()
end

return LeftAttrOBJ
