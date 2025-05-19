
JiNengQiangHuaOBJ = {}
JiNengQiangHuaOBJ.__cname = "JiNengQiangHuaOBJ"
JiNengQiangHuaOBJ.config = ssrRequireCsvCfg("cfg_JiNengQiangHua")
JiNengQiangHuaOBJ.eventName = "技能强化"
JiNengQiangHuaOBJ.pageID = 1
JiNengQiangHuaOBJ.skillId = {7,12,25,26,66,56 }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiNengQiangHuaOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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
    self:SetBtnClick()
    self:UpdateUI()
    self:RegisterEvent()
end

function JiNengQiangHuaOBJ:RefreshBtnState()
    local btnList = self.ui.LeftBtnList
    local childs = GUI:getChildren(btnList)
    for i, child in ipairs(childs) do
        local isSelected = GUI:getName(child) == ("LeftBtn_" .. self.pageID)
        GUI:Button_setBrightEx(child, not isSelected)
        local skillId = self.skillId[i]
        local skillData = SL:GetMetaValue("SKILL_DATA", skillId)
        GUI:removeAllChildren(child)
        if skillData then
            local img = GUI:Image_Create(child, "Image_LevelUp", 40, 0,  string.format("res/custom/jinengqianghua/c%d.png",skillData.LevelUp))
            GUI:setAnchorPoint(img, 0.5,0)
        else
            local img = GUI:Image_Create(child, "Image_LevelUp", 40, 0,  "res/custom/jinengqianghua/c0.png")
            GUI:setAnchorPoint(img, 0.5,0)
        end
    end
end

--设置按钮点击
function JiNengQiangHuaOBJ:SetBtnClick()
    local btnList = self.ui.LeftBtnList
    local childs = GUI:getChildren(btnList)
    for i, child in ipairs(childs) do
        GUI:addOnClickEvent(child, function()
            self.pageID = i
            self:RefreshBtnState()
            self:UpdateUI()
        end)
    end
end

--更新界面显示
function JiNengQiangHuaOBJ:UpdateUI()
    self:RefreshBtnState()
    local skillId = self.skillId[self.pageID]
    local cfg = self.config[skillId]
    showCost(self.ui.LayoutCost,cfg.cost,50)
    local skillData = SL:GetMetaValue("SKILL_DATA", skillId)
    delRedPoint(self.ui.ButtonGo)
    if skillData then
        if skillData.LevelUp < 10 then
            Player:checkAddRedPoint(self.ui.ButtonGo,cfg.cost)
        end
    end
    GUI:addOnClickEvent(self.ui.ButtonGo,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiNengQiangHua_Request,skillId)
    end)
    GUI:Text_enableUnderline(self.ui.Text_1,true)
    GUI:addOnClickEvent(self.ui.Text_1,function(widget)
        local worldPosition = GUI:getWorldPosition(widget)
        local data = {width = 250, str = cfg.tips, worldPos = worldPosition, anchorPoint = {x = 0.5, y = 1},formatWay=1}
        SL:OpenCommonDescTipsPop(data)
    end)
    self:ShowModel(cfg)
end

--排序显示
function JiNengQiangHuaOBJ:sortedPairs(tbl)
    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], tbl[keys[i]]
        end
    end
end

--关闭窗口
function JiNengQiangHuaOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--显示人物模型
function JiNengQiangHuaOBJ:ShowModel(cfg)
    local NodeModel = self.ui.NodeModel
    GUI:removeAllChildren(NodeModel)
    local feature = SL:GetMetaValue("FEATURE")
    local EffectSkill = GUI:Effect_Create(NodeModel, "EffectSkill", 210.00, 127.00, 3, cfg.effectid, 0, 0, 2, 1)
    local EffectActor = GUI:Effect_Create(NodeModel, "EffectActor", 173.00, 126.00, 4, feature.clothID, 0, 2, 2, 1)
    local EffectTarget = GUI:Effect_Create(NodeModel, "EffectTarget", 296.00, 120.00, 4, 1, 0, 7, 6, 0.4)
    local EffecWeapon = GUI:Effect_Create(NodeModel, "EffecWeapon", 171.00, 134.00, 5, feature.weaponID, 0, 2, 2, 1)
end

--------------------------- 注册事件 -----------------------------
function JiNengQiangHuaOBJ:RegisterEvent()
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --穿装备
    SL:RegisterLUAEvent(LUA_EVENT_SKILL_UPDATE, self.eventName, function(t)
        self:UpdateUI()
    end)

end

function JiNengQiangHuaOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_SKILL_UPDATE, self.eventName)
end

function JiNengQiangHuaOBJ:SyncResponse()
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return JiNengQiangHuaOBJ
