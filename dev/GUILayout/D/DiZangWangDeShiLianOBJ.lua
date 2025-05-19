DiZangWangDeShiLianOBJ = {}
DiZangWangDeShiLianOBJ.__cname = "DiZangWangDeShiLianOBJ"
--DiZangWangDeShiLianOBJ.config = ssrRequireCsvCfg("cfg_DiZangWangDeShiLian")
DiZangWangDeShiLianOBJ.eventName = "地藏王的试炼"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DiZangWangDeShiLianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    self.layer1Damage = 0
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DiZangWangDeShiLian_Request)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self.layerShowList = GUI:getChildren(self.ui.Node_layer_Activate)
    self:RegisterEvent()
    self:UpdateUI()
end

function DiZangWangDeShiLianOBJ:UpdateUI()
    self:UpdateUnlockLayer(self.layer)
    local currLayer = (self.layer or 0) + 1
    GUI:Image_loadTexture(self.ui.Image_cost, "res/custom/DiZangWangDeShiLian/cost/".. currLayer ..".png")
    GUI:Image_loadTexture(self.ui.Image_title, "res/custom/DiZangWangDeShiLian/title/".. currLayer ..".png")
    GUI:Image_loadTexture(self.ui.Image_desc1, "res/custom/DiZangWangDeShiLian/tips/tips".. currLayer .."_1.png")
    GUI:Image_loadTexture(self.ui.Image_desc2, "res/custom/DiZangWangDeShiLian/tips/tips".. currLayer .."_2.png")
end

--更新解锁层数
function DiZangWangDeShiLianOBJ:UpdateUnlockLayer(layer)
    for i, v in ipairs(self.layerShowList) do
        if i <= layer then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
end

--第一层创建提示文字
function DiZangWangDeShiLianOBJ:CreateTipLayer1()
    local parent = GUI:Win_FindParent(108)
    local widget = GUI:Widget_Create(parent, "Tips1", 0, 0, 432, 142)
    GUI:LoadExport(widget, "D/DiZangWangDeShiLian_Layer1UI")
    self.layer1TipsUi = GUI:ui_delegate(widget)
    --手机端
    if not ssrConstCfg.isPc then
        local pos = GUI:getPositionY(self.layer1TipsUi.ImageBG)
        GUI:setPositionY(self.layer1TipsUi.ImageBG, pos - 76)
        GUI:setScale(self.layer1TipsUi.ImageBG, 0.8)
    end
    local time = 15
    GUI:schedule(self.layer1TipsUi.ImageBG, function()
        time = time - 1
        GUI:TextAtlas_setString(self.layer1TipsUi.TextAtlas_1, time)
        if time <= 0 then
            GUI:unSchedule(self.layer1TipsUi.ImageBG)
        end
    end , 1)
end
--第一层删除提示文字
function DiZangWangDeShiLianOBJ:DeleteTipLayer1()
    local parent = GUI:Win_FindParent(108)
    GUI:removeChildByName(parent, "Tips1")
end
--第一层结束提示
function DiZangWangDeShiLianOBJ:EndTipLayer1()
    if self.layer1Damage >= 200000000 then
        self:SuccessOrFailShow(true)
    else
        self:SuccessOrFailShow(false)
    end
end

--同步伤害
function DiZangWangDeShiLianOBJ:SyncResponseDamage(arg1,arg2,arg3,data)
    self.layer1Damage = data[1]
    GUI:TextAtlas_setString(self.layer1TipsUi.TextAtlas, self.layer1Damage)
    GUI:Timeline_Window1(self.layer1TipsUi.TextAtlas)
end

--第二层创建提示文字
function DiZangWangDeShiLianOBJ:CreateTipLayer2()
    local parent = GUI:Win_FindParent(108)
    local widget = GUI:Widget_Create(parent, "Tips2", 0, 0, 432, 142)
    GUI:LoadExport(widget, "D/DiZangWangDeShiLian_Layer2UI")
    self.layer1TipsUi = GUI:ui_delegate(widget)
    --手机端
    if not ssrConstCfg.isPc then
        local pos = GUI:getPositionY(self.layer1TipsUi.ImageBG)
        GUI:setPositionY(self.layer1TipsUi.ImageBG, pos - 10)
        GUI:setScale(self.layer1TipsUi.ImageBG, 0.8)
    end
    local time = 100
    local schedule = SL:schedule(self.layer1TipsUi.ImageBG, function()
        time = time - 1
        GUI:TextAtlas_setString(self.layer1TipsUi.TextAtlas_1, time)
        if time <= 0 then
            SL:UnSchedule(schedule)
        end
    end , 1)
end


--第二层删除提示文字
function DiZangWangDeShiLianOBJ:DeleteTipLayer2()
    local parent = GUI:Win_FindParent(108)
    GUI:removeChildByName(parent, "Tips2")
end
--第二层结束提示
function DiZangWangDeShiLianOBJ:EndTipLayer2()
    if self.isLayer1Ok == 1 then
        self.isLayer1Ok = 0
        self:SuccessOrFailShow(true)
    else
        self:SuccessOrFailShow(false)
    end
end

--第三层创建提示文字
function DiZangWangDeShiLianOBJ:CreateTipLayer3()
    local parent = GUI:Win_FindParent(108)
    local widget = GUI:Widget_Create(parent, "Tips3", 0, 0, 432, 142)
    GUI:LoadExport(widget, "D/DiZangWangDeShiLian_Layer3UI")
    self.layer1TipsUi = GUI:ui_delegate(widget)
    --手机端
    if not ssrConstCfg.isPc then
        local pos = GUI:getPositionY(self.layer1TipsUi.ImageBG)
        GUI:setPositionY(self.layer1TipsUi.ImageBG, pos - 10)
        GUI:setScale(self.layer1TipsUi.ImageBG, 0.8)
    end
    local time = 180
    local schedule = SL:schedule(self.layer1TipsUi.ImageBG, function()
        time = time - 1
        GUI:TextAtlas_setString(self.layer1TipsUi.TextAtlas_1, time)
        if time <= 0 then
            SL:UnSchedule(schedule)
        end
    end , 1)
end

--第三层删除提示文字
function DiZangWangDeShiLianOBJ:DeleteTipLayer3()
    local parent = GUI:Win_FindParent(108)
    GUI:removeChildByName(parent, "Tips3")
end
--第三层结束提示
function DiZangWangDeShiLianOBJ:EndTipLayer3()
    if self.isLayer1Ok == 1 then
        self.isLayer1Ok = 0
        self:SuccessOrFailShow(true)
    else
        self:SuccessOrFailShow(false)
    end
end
--第四层创建提示文字
function DiZangWangDeShiLianOBJ:CreateTipLayer4()
    local parent = GUI:Win_FindParent(108)
    local widget = GUI:Widget_Create(parent, "Tips4", 0, 0, 432, 142)
    GUI:LoadExport(widget, "D/DiZangWangDeShiLian_Layer3UI")
    self.layer1TipsUi = GUI:ui_delegate(widget)
    --手机端
    if not ssrConstCfg.isPc then
        local pos = GUI:getPositionY(self.layer1TipsUi.ImageBG)
        GUI:setPositionY(self.layer1TipsUi.ImageBG, pos - 10)
        GUI:setScale(self.layer1TipsUi.ImageBG, 0.8)
    end
    local time = 180
    local schedule = SL:schedule(self.layer1TipsUi.ImageBG, function()
        time = time - 1
        GUI:TextAtlas_setString(self.layer1TipsUi.TextAtlas_1, time)
        if time <= 0 then
            SL:UnSchedule(schedule)
        end
    end , 1)
end

--第四层删除提示文字
function DiZangWangDeShiLianOBJ:DeleteTipLayer4()
    local parent = GUI:Win_FindParent(108)
    GUI:removeChildByName(parent, "Tips4")
end
--第四层结束提示
function DiZangWangDeShiLianOBJ:EndTipLayer4()
    if self.isLayer1Ok == 1 then
        self.isLayer1Ok = 0
        self:SuccessOrFailShow(true)
    else
        self:SuccessOrFailShow(false)
    end
end

function DiZangWangDeShiLianOBJ:EndTipLayer5()
    if self.isLayer1Ok == 1 then
        self.isLayer1Ok = 0
        self:SuccessOrFailShow(true)
    else
        self:SuccessOrFailShow(false)
    end
end

function DiZangWangDeShiLianOBJ:SyncResponseLayer2End(arg1, arg2)
    self.layer = arg1
    self.isLayer1Ok = arg2
    self:EndTipLayer5()
end

--显示结束之后成功失败 state == true成功 state == false失败
function DiZangWangDeShiLianOBJ:SuccessOrFailShow(state)
    local parent = GUI:Win_Create("Layer1End", 0, 0, 0, 0, false, false, true, true, true)
    GUI:LoadExport(parent, "D/DiZangWangDeShiLian_Layer1_EndUI")
    local ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, ui.ImageBG, 2,0)
    GUI:addOnClickEvent(ui.Button_close, function()
        GUI:Win_Close(parent)
    end)
    local image_title, image_font = "",""
    if state then
        image_title = "res/custom/DiZangWangDeShiLian/layer1/success_title.png"
        image_font = "res/custom/DiZangWangDeShiLian/layer1/success_font.png"
    else
        image_title = "res/custom/DiZangWangDeShiLian/layer1/fail_title.png"
        image_font = "res/custom/DiZangWangDeShiLian/layer1/fail_font.png"
    end
    GUI:Image_loadTexture(ui.Image_title, image_title)
    GUI:Image_loadTexture(ui.Image_font, image_font)
end

--进入地图触发
function DiZangWangDeShiLianOBJ:OnEnterMap(t)
    local myName = SL:GetMetaValue("USER_NAME")
    local mapID = t.mapID
    local lastMapID = t.lastMapID

    if mapID == myName.."伤害试炼" then
        local getNum = 0
        local function afkBegin()
            SL:ScheduleOnce(function()
                local targets = SL:GetMetaValue("FIND_IN_VIEW_MONSTER_LIST",true,true)
                if #targets > 0 then
                    SL:SetMetaValue("SELECT_TARGET_ID", targets[1])
                    SL:SetMetaValue("BATTLE_AFK_BEGIN")
                elseif getNum < 2 then
                    getNum = getNum + 1
                    afkBegin()
                end
            end, 0.2)
        end
        --自动打怪
        afkBegin()
        self:CreateTipLayer1()
    end

    --生存试炼
    if mapID == myName.."生存试炼" then
        self:CreateTipLayer2()
    end

    --心魔试炼
    if mapID == myName.."心魔试炼" then
        self:CreateTipLayer3()
    end

    --心魔试炼
    if mapID == myName.."献祭试炼" then
        self:CreateTipLayer4()
    end

    if lastMapID == myName.."伤害试炼" then
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName)
        self:EndTipLayer1()
        self:DeleteTipLayer1()
    end
    if lastMapID == myName.."生存试炼" then
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName)
        self:EndTipLayer2()
        self:DeleteTipLayer2()
    end
    if lastMapID == myName.."心魔试炼" then
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName)
        self:EndTipLayer3()
        self:DeleteTipLayer3()
    end
    if lastMapID == myName.."献祭试炼" then
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName)
        self:EndTipLayer4()
        self:DeleteTipLayer4()
    end
    if lastMapID == myName.."最终试炼" then
        SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName)
    end
end

--关闭窗口
function DiZangWangDeShiLianOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function DiZangWangDeShiLianOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, self.eventName, function(t)
        self:OnEnterMap(t)
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)
end

function DiZangWangDeShiLianOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function DiZangWangDeShiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.layer = arg1
    self.isLayer1Ok = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return DiZangWangDeShiLianOBJ