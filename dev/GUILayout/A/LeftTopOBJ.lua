LeftTopOBJ = {}
LeftTopOBJ.__cname = "LeftTopOBJ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LeftTopOBJ:main()

end


local function createLeftPanel()
    local parent = GUI:Win_FindParent(101)
    if parent then
        if GUI:getChildByName(parent, "ImageView") then
           GUI:removeChildByName(parent, "ImageView")
        end
        local ImageView = GUI:Image_Create(parent, "ImageView", -1.00, -34.00, "res/custom/LeftTop/bg.png")
        GUI:setLocalZOrder(ImageView,-1)
        local TextAtlas_1 = GUI:TextAtlas_Create(ImageView, "TextAtlas_1", 56.00, 4.00, "0", "res/custom/public/text1.png", 14, 30, ".")
    end
end

--重载初始化
function LeftTopOBJ:reloadInit()
    if not self.ui then
        local parent = GUI:Win_FindParent(101)
        self.ui = GUI:ui_delegate(parent)
    end
end

--显示战斗力
function LeftTopOBJ:ShowPower()
    self:reloadInit()
    local varValue =  Player:getServerVar("B2")
    local startValue = GUI:TextAtlas_getString(LeftTopOBJ.ui.TextAtlas_1)
    animateNumberTransition(tonumber(startValue),tonumber(varValue),0.2,20,function (value)
        GUI:TextAtlas_setString(LeftTopOBJ.ui.TextAtlas_1, tostring(value))
    end)
end

-- 优先加载界面
local function onEnterGameWorld()
    createLeftPanel()
end
--进入游戏触发
SL:RegisterLUAEvent(LUA_EVENT_ENTER_WORLD, "LeftTop", onEnterGameWorld)

-- 处理器映射表
local valueHandlers = {
    --战斗力
    ["B2"] = function(data)
        LeftTopOBJ:ShowPower()
    end,
    --福利大厅红点
    ["N$福利大厅红点"] = function(data)
        local TopIconNode_look = GUI:GetWindow(MainMiniMap._parent, "TopIconLayout")
        local TopIconNode = GUI:GetWindow(TopIconNode_look, "TopIconNode_1")
        local IconObj = GUI:GetWindow(TopIconNode, "105")
        if IconObj then
            delRedPoint(IconObj)
            if data.value == "1" then
                -- SL:release_print("添加红点成功")
                addRedPoint(IconObj, 20, 0)
            end
        end
    end,
    --主线任务红点
    ["{206}"] = function(data)
        local taskParent = GUI:Win_FindParent(110)
        local widgetObj = GUI:getChildByName(taskParent, "ZhuXianRenWu")
        if GUI:Win_IsNotNull(widgetObj) then
            if data.value == "1" then
                addRedPoint(widgetObj, 20, 2)
            else
                delRedPoint(widgetObj)
            end
        end
    end,
    --双节活动图标显示
    ["G21"] = function(data)
        if data.value == "1" then
            local taskParent = GUI:Win_FindParent(110)
            if taskParent then
                local widgetObj = GUI:getChildByName(taskParent, "ImageViewShuangJie")
                if not GUI:Win_IsNotNull(widgetObj) then
                    local Button = GUI:Button_Create(taskParent, "ImageViewShuangJie", 226.00, 100, "res/custom/LeftTop/top_jieri.png")
                    GUI:Effect_Create(taskParent, "EffectShuangJie", 222.00, 192.00, 0, 63155, 0, 0, 0, 1)
                    GUI:addOnClickEvent(Button, function()
                        ssrUIManager:OPEN(ssrObjCfg.ShuangJieHuoDongMain)
                    end)
                end
            end
        else
            local taskParent = GUI:Win_FindParent(110)
            if taskParent then
                local widgetObj = GUI:getChildByName(taskParent, "ImageViewShuangJie")
                if GUI:Win_IsNotNull(widgetObj) then
                    GUI:removeChildByName(taskParent, "ImageViewShuangJie")
                    GUI:removeChildByName(taskParent, "EffectShuangJie")
                end
            end
        end
    end

}

local function onServerValueChange(data)
    local handler = valueHandlers[data.key]
    if handler then
        handler(data)
    end
end

SL:RegisterLUAEvent(LUA_EVENT_SERVER_VALUE_CHANGE, "LeftTop", onServerValueChange)


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
--function LeftTopOBJ:SyncResponse(arg1, arg2, arg3, data)
--    self.data = data
--    if GUI:GetWindow(nil, self.__cname) then
--        --self:UpdateUI()
--    end
--end


return LeftTopOBJ