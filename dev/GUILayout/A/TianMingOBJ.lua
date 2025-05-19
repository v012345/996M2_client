local TianMingOBJ = {}
TianMingOBJ.__cname = "TianMingOBJ"
--TianMingOBJ.config = ssrRequireCsvCfg("cfg_TianMing")
TianMingOBJ.radiusLeft = 400
TianMingOBJ.radiusRight = -400
TianMingOBJ.LeftUnLock = {
    "60级解锁",
    "80级解锁",
    "100级解锁",
    "120级解锁",
    "180级解锁",
    "240级解锁",
    "1转解锁",
    "2转解锁",
    "3转解锁",
    "4转解锁",
    "5转解锁",
    "6转解锁",
}
TianMingOBJ.RightUnLock = {
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "后天造化箓*10",
    "激活凡品气运图鉴",
    "激活圣品气运图鉴",
}
TianMingOBJ.TianMingList = {
    [1] = ssrRequireCsvCfg("cfg_TianMing_Fan"), --天命凡
    [2] = ssrRequireCsvCfg("cfg_TianMing_Ling"), --天命灵
    [3] = ssrRequireCsvCfg("cfg_TianMing_Xian"), --天命仙
    [4] = ssrRequireCsvCfg("cfg_TianMing_Sheng"), --天命圣
    [5] = ssrRequireCsvCfg("cfg_TianMing_Di"), --天命帝
}
--枚举颜色
TianMingOBJ.levelColor = {
    [1] = "#f0ecdd",
    [2] = "#d5e5ff",
    [3] = "#fdcbfe",
    [4] = "#ffddb8",
    [5] = "#ffdbd0",
}

--枚举品质名称
TianMingOBJ.qualityName = {
    [1] = "凡品",
    [2] = "灵品",
    [3] = "仙品",
    [4] = "圣品",
    [5] = "帝品",
}

--后天开启
TianMingOBJ.enumeOpenHouTian = {
    [1] = { { "后天造化箓", 10 } },
    [2] = { { "后天造化箓", 10 } },
    [3] = { { "后天造化箓", 10 } },
    [4] = { { "后天造化箓", 10 } },
    [5] = { { "后天造化箓", 10 } },
    [6] = { { "后天造化箓", 10 } },
    [7] = { { "后天造化箓", 10 } },
    [8] = { { "后天造化箓", 10 } },
    [9] = { { "后天造化箓", 10 } },
    [10] = { { "后天造化箓", 10 } },
}

--图鉴配置
TianMingOBJ.TianMingTuJianConfig = {
    [1] = { var = "VarCfg.T_TianMing_Fan", max = 18, attr = { [1] = 10000, [4] = 5000 }, baoLvAddtion = { [218] = 5 } },
    [2] = { var = "VarCfg.T_TianMing_Ling", max = 20, attr = { [75] = 1500, [200] = 30000 }, baoLvAddtion = { [218] = 10 } },
    [3] = { var = "VarCfg.T_TianMing_Xian", max = 24, attr = { [21] = 15, [22] = 15 }, baoLvAddtion = { [218] = 20 } },
    [4] = { var = "VarCfg.T_TianMing_Sheng", max = 28, attr = { [79] = 1500, [80] = 15 }, baoLvAddtion = { [218] = 30 } },
    [5] = { var = "VarCfg.T_TianMing_Di", max = 34, attr = { [208] = 15, [209] = 15, [210] = 15, [211] = 15, [212] = 15, [213] = 15, [214] = 15, [221] = 15, [222] = 15, [223] = 15, [224] = 15, [225] = 15, [202] = 1 }, baoLvAddtion = { [218] = 30 } },
}

--图鉴默认选择ID
TianMingOBJ.TuJianSelectId = 1
TianMingOBJ.SkipAnimation = false
--记录引导状态
TianMingOBJ.guideStateID = 0

function TianMingOBJ:main(objcfg)
    self.cfgList = {}
    self.currSelectPos = 0
    self.currQuality = 0
    self.currSelectedBtnObj = nil
    self.objcfg = objcfg
    self.pageType = 1
    self.closeLock = false
    ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_openUI)
end

function TianMingOBJ:openUI(arg1, arg2, arg3, data)
    self.unLockData = data["unLock"]
    self.myTianMingData = data["myTianMing"]
    self:ShowUI(self.objcfg)
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TianMingOBJ:ShowUI(objcfg)
    self.lockBtn = false
    local parent = GUI:Win_Create(self.__cname, 0, 0, ssrConstCfg.width, ssrConstCfg.height, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    --ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:setTouchEnabled(self.ui.ImageBG, true)
    GUI:setPosition(self.ui.ImageBG, 0, 0)
    GUI:setContentSize(self.ui.ImageBG, ssrConstCfg.width, ssrConstCfg.height)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        self:CloseUI()
    end)
    --关闭按钮上层
    GUI:setLocalZOrder(self.ui.CloseButton, 20)
    --跳过动画上层
    GUI:setLocalZOrder(self.ui.CheckBox, 30)
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    --self:ExtractShow()
    GUI:addOnClickEvent(self.ui.ButtonTuJian, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_TJResponse)
    end)
    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        if self.lockBtn then
            return
        end
        if self.currSelectPos == 0 then
            sendmsg9("请点击选择气运的位置！")
            return
        end
        self.lockBtn = true
        --防止连续点击
        SL:scheduleOnce(self.ui.ButtonStart, function()
            self.lockBtn = false
        end, 0.5)
        if self.currQuality >= 4 then
            local currQualityName = self.qualityName[self.currQuality]
            local data = {}
            data.str = "当前品质为【" .. currQualityName .. "】，继续操作将会覆盖当前品质，是否继续？"
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    self:RequestNet1()
                    --self.lockBtn = true
                end
            end
            SL:OpenCommonTipsPop(data)
        else
            self:RequestNet1()
            --self.lockBtn = true
        end
    end)
    --跳过动画
    GUI:CheckBox_setSelected(self.ui.CheckBox, self.SkipAnimation)
    GUI:addOnClickEvent(self.ui.CheckBox,function ()
        local isSelected = GUI:CheckBox_isSelected(self.ui.CheckBox)
        self.SkipAnimation = not isSelected
    end)
    self:Show()
    self.btnOffset = 0
    if ssrConstCfg.width > 1024 then
        self.btnOffset = (ssrConstCfg.width - 1024) / 2
    end
    self.worldPosLeft = GUI:getWorldPosition(self.ui.ScrollViewLeft)
    self.centerPosLeft = cc.p(self.worldPosLeft.x + self.radiusLeft, self.worldPosLeft.y)
    self.childListLeft = GUI:getChildren(self.ui.ScrollViewLeft)

    self:updateItemPos(self.childListLeft, self.worldPosLeft, self.radiusLeft, 460 - self.btnOffset)
    GUI:ScrollView_addOnScrollEvent(self.ui.ScrollViewLeft, function(sender, type, type1)
        self:updateItemPos(self.childListLeft, self.worldPosLeft, self.radiusLeft, 460 - self.btnOffset)
    end)

    self.worldPosRight = GUI:getWorldPosition(self.ui.ScrollViewRight)
    self.centerPosRight = cc.p(self.worldPosRight.x + self.radiusRight, self.worldPosRight.y)
    self.childListRight = GUI:getChildren(self.ui.ScrollViewRight)
    self:updateItemPos(self.childListRight, self.worldPosRight, self.radiusRight, -1084 - self.btnOffset)
    GUI:ScrollView_addOnScrollEvent(self.ui.ScrollViewRight, function(sender, type, type1)
        self:updateItemPos(self.childListRight, self.worldPosRight, self.radiusRight, -1084 - self.btnOffset)
    end)
    --是否使用鸿运当头
    self.useHYDT = 0
    self:InitButton()
    self:StartGuide()
end

function TianMingOBJ:UpdateUI(data)
    self.unLockData = data["unLock"]
    self.myTianMingData = data["myTianMing"]
    self:InitButton()
end


function TianMingOBJ:StartGuide()
    local guideId = ZhuXianRenWuOBJ:getGuideTask()
    ZhuXianRenWuOBJ:setGuideTask(0)
    if guideId == 3 then
        for _, btn in ipairs(self.childListLeft) do
            local params = GUI:Win_GetParam(btn)
            if params.state == 1 or params.state == 0 then
                self.guideStateID = 1
                local data = {}
                data.dir           = 5                -- 方向（1~8）从左按瞬时针
                data.guideWidget   =  btn       -- 当前节点
                data.guideParent   = self.ui.ImageBG          -- 父窗口
                data.guideDesc     = "点击"           -- 文本描述
                data.isForce       = false             -- 强制引导
                SL:StartGuide(data)
                break
            end
        end
    elseif guideId == 5 then
        for _, btn in ipairs(self.childListRight) do
            local params = GUI:Win_GetParam(btn)
            if params.state == 1 or params.state == 0 then
                self.guideStateID = 1
                local data = {}
                data.dir           = 5                -- 方向（1~8）从左按瞬时针
                data.guideWidget   =  btn       -- 当前节点
                data.guideParent   = self.ui.ImageBG          -- 父窗口
                data.guideDesc     = "点击"           -- 文本描述
                data.isForce       = false             -- 强制引导
                SL:StartGuide(data)
                break
            end
        end
    end

    --修仙引导
    --if guideId == 1 then
    --    local data = {}
    --    data.dir           = 5                -- 方向（1~8）从左按瞬时针
    --    data.guideWidget   = PlayerFrame._ui.Button_xiuXian        -- 当前节点
    --    data.guideParent   = PlayerFrame._parent          -- 父窗口
    --    data.guideDesc     = "点击"           -- 文本描述
    --    data.isForce       = false             -- 强制引导
    --    SL:StartGuide(data)
    --elseif guideId == 2 then
    --local data = {}
    --    data.dir           = 5                -- 方向（1~8）从左按瞬时针
    --    data.guideWidget   = PlayerFrame._ui.Button_qiYun        -- 当前节点
    --    data.guideParent   = PlayerFrame._parent          -- 父窗口
    --    data.guideDesc     = "点击"           -- 文本描述
    --    data.isForce       = false             -- 强制引导
    --    SL:StartGuide(data)
    --end
end


--使用鸿运当头洗练
function TianMingOBJ:RequestNet2()
    local params = GUI:Win_GetParam(self.currSelectedBtnObj)
    --如果当前按钮没有洗练 直接请求
    if params.state == 1 then
        ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_Request, self.currSelectPos, 1, self.useHYDT)
        sendmsg9("首次洗练气运免费#249")
        return
    end
    local costItemName = ""
    local cost = {}
    if self.currSelectPos > 12 then
        costItemName = "转运金丹"
    else
        costItemName = "气运精魄"
    end
    cost = { { costItemName, 1 } }
    local name, name = Player:checkItemNumByTable(cost)
    if name then
        local data = {}
        data.str = "你背包没有【" .. costItemName .. "】是否消耗【200灵符】继续？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_Request, self.currSelectPos, 2 ,self.useHYDT)
            end
        end
        SL:OpenCommonTipsPop(data)
    else
        ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_Request, self.currSelectPos, 1, self.useHYDT)
    end

end

--请求洗练--检测是否有鸿运当头
function TianMingOBJ:RequestNet1()
    local cost = { { "鸿运当头", 1 } }
    local name, name = Player:checkItemNumByTable(cost)
    if not name then
        local data = {}
        data.str = "检测到您背包里有物品 ：鸿运当头   使用鸿运当头洗炼气运必出帝品气运。 是否使用？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                self.useHYDT = 1
                self:RequestNet2()
            else
                self.useHYDT = 0
                self:RequestNet2()
            end
        end
        SL:OpenCommonTipsPop(data)
    else
        self.useHYDT = 0
        self:RequestNet2()
    end
end

--关闭窗口
function TianMingOBJ:CloseUI()
    if self.closeLock then
        return
    end
    if self.pageType == 1 then
        GUI:Win_Close(self._parent)
    elseif self.pageType == 2 then
        self:BackAnimation(1)
        self.pageType = 1
    elseif self.pageType == 3 then
        self:BackAnimation(2)
        self.pageType = 1
    end
end

--响应天命图鉴数据
function TianMingOBJ:TJResponse(arg1, arg2, arg3, data)
    self.tuJianData = data
    self.closeLock = true
    self.pageType = 3
    self:SpreadAnimation(2)
end

--响应抽取结果
function TianMingOBJ:CQResponse(pos, quality, index)
    self.currQuality = quality
    self.currIndex = index
    --跳过动画
    if self.SkipAnimation  then
        self:modifyButtonStyle(pos, quality, index)
    else
        self.closeLock = true
        self.pageType = 2
        self:SpreadAnimation(1)
        SL:scheduleOnce(self.ui.ImageBG, function()
            self:modifyButtonStyle(pos, quality, index)
        end, 0.5)
    end
end

--修改天命展示按钮和说明
function TianMingOBJ:modifyButtonStyle(pos, quality, index)
    local cfg = self.TianMingList[quality][index]
    local pathImg = ""
    if pos > 12 then
        pathImg = "res/custom/TianMing/static/right_" .. quality .. ".png"
    else
        pathImg = "res/custom/TianMing/static/left_" .. quality .. ".png"
    end
    GUI:Button_loadTextureNormal(self.currSelectedBtnObj, pathImg)
    GUI:Button_setTitleText(self.currSelectedBtnObj, cfg.name)
    GUI:Button_setTitleColor(self.currSelectedBtnObj, self.levelColor[quality])
    delRedPoint(self.currSelectedBtnObj)
    GUI:Win_SetParam(self.currSelectedBtnObj,{id = pos , state = 2}) --设置为已洗练状态
    local attDesc = cfg.attDesc or ""
    local fontDesc = cfg.fontDesc or ""
    local Text_desc = attDesc .. "\n" .. fontDesc
    --SL:dump(Text_desc)
    GUI:Text_setString(self.ui.Text_desc, Text_desc)
    self.cfgList[pos] = {
        attDesc = attDesc,
        fontDesc = fontDesc
    }

end

--初始化按钮
function TianMingOBJ:InitButton()
    for i, child in ipairs(self.childListLeft) do
        local isActivate = self.unLockData[i] --是否激活
        local isHas = #self.myTianMingData[i] > 1   --是否拥有
        local tianMingLevel, tianMingType = 0, 0       --天命等级，天命类型
        local tianMingName = "" --天命名字
        local color = ""
        local cfg
        if isHas then
            tianMingLevel = self.myTianMingData[i][1]
            tianMingType = self.myTianMingData[i][2]
            cfg = self.TianMingList[tianMingLevel][tianMingType]
            if cfg then
                self.cfgList[i] = cfg
                tianMingName = cfg.name
                color = self.levelColor[tianMingLevel]
            end
        end
        --给天命位置状态 0=未解锁 1=已解锁未洗练 2=已经洗练
        local tianMingState = 0
        if isActivate == 0 then
            GUI:Button_setTitleText(child, self.LeftUnLock[i])
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/grey_left.png")
            tianMingState = 0
        elseif isActivate == 1 and not isHas then
            GUI:Button_setTitleText(child, "")
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/unlockLeft.png")
            tianMingState = 1
            addRedPoint(child, 100, 28)
        elseif isHas then
            GUI:Button_setTitleText(child, tianMingName)
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/left_" .. tianMingLevel .. ".png")
            GUI:Button_setTitleColor(child, color)
            tianMingState = 2
        end
        GUI:Win_SetParam(child, { id = i, state = tianMingState })
        GUI:addOnClickEvent(child, function()
            if self.guideStateID == 1 then
                self.guideStateID = 0
                local data = {}
                data.dir           = 5                -- 方向（1~8）从左按瞬时针
                data.guideWidget   =  self.ui.ButtonStart       -- 当前节点
                data.guideParent   = self.ui.ImageBG          -- 父窗口
                data.guideDesc     = "点击"           -- 文本描述
                data.isForce       = false             -- 强制引导
                SL:StartGuide(data)
            end
            if isActivate == 0 then
                sendmsg9(self.LeftUnLock[i] .. "解锁")
                return
            end
            local tag = GUI:getTag(child)
            self.currSelectPos = tag
            self.currQuality = tianMingLevel
            self:SetButtonSelected(tag)
            local cfgDesc = self.cfgList[tag]
            if cfgDesc then
                local attDesc = cfgDesc.attDesc or ""
                local fontDesc = cfgDesc.fontDesc or ""
                local Text_desc = attDesc .. "\n" .. fontDesc
                GUI:Text_setString(self.ui.Text_desc, Text_desc)
            else
                GUI:Text_setString(self.ui.Text_desc, "")
            end

        end)
    end

    for i, child in ipairs(self.childListRight) do
        local j = 12 + i
        local isActivate = self.unLockData[j] --是否激活
        local isHas = #self.myTianMingData[j] > 1   --是否拥有
        local tianMingLevel, tianMingType = 0, 0       --天命等级，天命类型
        local tianMingName = "" --天命名字
        local color = ""
        local cfg
        if isHas then
            tianMingLevel = self.myTianMingData[j][1]
            tianMingType = self.myTianMingData[j][2]
            cfg = self.TianMingList[tianMingLevel][tianMingType]
            if cfg then
                self.cfgList[j] = cfg
                tianMingName = cfg.name
                color = self.levelColor[tianMingLevel]
            end
        end
        --给天命位置状态 0=未解锁 1=已解锁未洗练 2=已经洗练
        local tianMingState = 0
        if isActivate == 0 then
            tianMingState = 0
            GUI:Button_setTitleText(child, self.RightUnLock[i])
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/grey_right.png")
        elseif isActivate == 1 and not isHas then
            tianMingState = 1
            GUI:Button_setTitleText(child, "")
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/unlockRight.png")
            addRedPoint(child, 200, 28)
        elseif isHas then
            tianMingState = 2
            GUI:Button_setTitleText(child, tianMingName)
            GUI:Button_loadTextureNormal(child, "res/custom/TianMing/static/right_" .. tianMingLevel .. ".png")
            GUI:Button_setTitleColor(child, color)
        end
        GUI:Win_SetParam(child, { id = i, state = tianMingState })
        --没解锁的检查物品条件
        if isActivate == 0 then
            local cost = self.enumeOpenHouTian[i]
            if cost then
                Player:checkAddRedPoint(child, cost, 30, 5)
            end
        end

        GUI:addOnClickEvent(child, function()
            if isActivate == 0 then
                if i >= 1 and i <= 10 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_OpenHouTian,i)
                else
                    sendmsg9(self.RightUnLock[i] .. "解锁")
                end
                return
            end
            local tag = GUI:getTag(child)
            self.currSelectPos = tag
            self.currQuality = tianMingLevel
            self:SetButtonSelected(tag, 2)
            local cfgDesc = self.cfgList[tag]
            if cfgDesc then
                local attDesc = cfgDesc.attDesc or ""
                local fontDesc = cfgDesc.fontDesc or ""
                local Text_desc = attDesc .. "\n" .. fontDesc
                GUI:Text_setString(self.ui.Text_desc, Text_desc)
            else
                GUI:Text_setString(self.ui.Text_desc, "")
            end
        end)
    end
end

--激活后天气运后返回
function TianMingOBJ:OpenHouTian(index)
    local qiYunWhere = 12 + index
    self.unLockData[qiYunWhere] = 1 --标记为激活
    GUI:Button_setTitleText(self.childListRight[index], "")
    GUI:Button_loadTextureNormal(self.childListRight[index], "res/custom/TianMing/static/unlockRight.png")
    delRedPoint(self.childListRight[index])
    addRedPoint(self.childListRight[index], 200, 28)
    GUI:Win_SetParam(self.childListRight[index],{id = pos , state = 1}) --激活后设置没激活
    GUI:addOnClickEvent(self.childListRight[index],function(widget)
        local tag = GUI:getTag(widget)
        self.currSelectPos = tag
        self:SetButtonSelected(tag,2)
    end)
    for i, child in ipairs(self.childListRight) do
        local qiYunWhere = 12 + i
        local isActivate = self.unLockData[qiYunWhere]
        if isActivate == 0 then
            local cost = self.enumeOpenHouTian[i]
            if cost then
                delRedPoint(child)
                Player:checkAddRedPoint(child, cost, 30, 5)
            end
        end
    end
end

--设置按钮选中状态
function TianMingOBJ:SetButtonSelected(tag, where)
    local childList = SL:CopyData(self.childListRight)
    for i, v in ipairs(self.childListLeft) do
        table.insert(childList, v)
    end
    for i, child in ipairs(childList) do
        local img = GUI:getChildByName(child, "sfx_selected")
        if img then
            GUI:removeChildByName(child, "sfx_selected")
        end
        local thisTag = GUI:getTag(child)
        if thisTag == tag then
            self.currSelectedBtnObj = child
            self:SetButtonSelectedImg(child, where)
        end
    end
end

--设置选中图片
function TianMingOBJ:SetButtonSelectedImg(widget, where)
    local sfx_selected
    if where == 2 then
        --Image_selected = GUI:Image_Create(widget, "Image_selected", -2.00, -1.00, "res/custom/TianMing/static/selected_right.png")
        local sfx_selected = GUI:Effect_Create(widget, "sfx_selected", 128, 56, 0, 17151, 0, 0, 3, 1)
    else
        --Image_selected = GUI:Image_Create(widget, "Image_selected", -2.00, -1.00, "res/custom/TianMing/static/selected_left.png")
        local sfx_selected = GUI:Effect_Create(widget, "sfx_selected", 100, 56, 0, 17150, 0, 0, 3, 1)
    end
    --GUI:setTouchEnabled(sfx_selected, false)
end

function TianMingOBJ:updateItemPos(childList, worldPos, radius, shifting)
    for _, child in ipairs(childList) do
        GUI:setAnchorPoint(child, 0.5, 0.5)
        local oldPos = GUI:getWorldPosition(child)
        local oldPosY = GUI:getPositionY(child)
        local yDiff = worldPos.y - oldPos.y + 4
        local juli = math.sqrt(math.abs((radius ^ 2) - (yDiff ^ 2))) --计算距离
        local newX = worldPos.x - mathSign(radius) * juli
        GUI:setPosition(child, newX + shifting, oldPosY)
    end
end

--按钮扩散动画
function TianMingOBJ:SpreadAnimation(Ttype)
    if Ttype == 2 then
        GUI:Timeline_FadeOut(self.FramesDz, 0.25)
        self:TuJianShow()
    end
    GUI:Timeline_MoveTo(self.ui.NodeLeft, { x = -800, y = 0 }, 0.5)
    GUI:Timeline_MoveTo(self.ui.NodeRigth, { x = 800, y = 0 }, 0.5, function()
        self.closeLock = false
        if Ttype == 1 then
            self:ExtractShow()
        end
    end)
    GUI:Timeline_MoveTo(self.ui.Nodebottom, { x = 0, y = -500 }, 0.4)
    GUI:Timeline_MoveTo(self.ui.CheckBox, { x = -88, y = -500 }, 0.4)
end

--回来的动画
function TianMingOBJ:BackAnimation(Ttype)
    GUI:Timeline_MoveTo(self.ui.NodeLeft, { x = 0, y = 0 }, 0.3)
    GUI:Timeline_MoveTo(self.ui.NodeRigth, { x = 0, y = 0 }, 0.3)
    GUI:Timeline_MoveTo(self.ui.Nodebottom, { x = 0, y = 0 }, 0.3)
    GUI:Timeline_MoveTo(self.ui.CheckBox, { x = -88, y = -137 }, 0.3)
    if Ttype == 1 then
        GUI:removeAllChildren(self.ui.NodeNext)
        GUI:removeAllChildren(self.ui.NodeFont)
    elseif Ttype == 2 then
        GUI:removeAllChildren(self.ui.NodeTuJian)
        GUI:setOpacity(self.FramesDz, 255)
    end
end

--显示初始界面
function TianMingOBJ:Show()
    local FramesBg = GUI:Frames_Create(self.ui.ImageBG, "Frames_bg", 0, 0, "res/custom/TianMing/bg1/bg_", ".jpg", 1, 41, { count = 41, speed = 100, loop = -1, finishhide = 0 })
    GUI:setContentSize(FramesBg, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setLocalZOrder(FramesBg, 1)
    GUI:setPosition(self.ui.NodeMain, ssrConstCfg.width / 2, ssrConstCfg.height / 2)
    GUI:setLocalZOrder(self.ui.NodeMain, 10)
    GUI:setPosition(self.ui.CloseButton, ssrConstCfg.width - 100, ssrConstCfg.height - 100)
    GUI:setPosition(self.ui.NodeMain, ssrConstCfg.width / 2, ssrConstCfg.height / 2)
    local FramesDz = GUI:Frames_Create(self.ui.NodeMain, "Frames_main", 0, 50, "res/custom/TianMing/dz/dz_", ".png", 1, 15, { count = 15, speed = 100, loop = -1, finishhide = 0 })
    GUI:setAnchorPoint(FramesDz, 0.5, 0.5)
    self.FramesDz = FramesDz
end

--显示图鉴界面
function TianMingOBJ:TuJianShow()
    local parent = self.ui.NodeTuJian
    GUI:LoadExport(parent, "A/TianMingTuJianUI")
    local ui = GUI:ui_delegate(parent)
    GUI:setLocalZOrder(self.ui.NodeTuJian, 2)
    GUI:setAnchorPoint(ui.Panel_1, 0.5, 0.5)
    GUI:setPosition(ui.Panel_1, ssrConstCfg.width / 2, ssrConstCfg.height / 2)
    --GUI:setVisible(ui.Panel_1,false)
    --设置默认
    self:TuJianUpdate(ui)
    local defaultSelectedBtn = ui["Button_" .. self.TuJianSelectId]
    self:SetTuJianButtonSelected(ui, defaultSelectedBtn)
    --按钮点击事件
    for i = 1, 5 do
        local btn = ui["Button_" .. i]
        GUI:addOnClickEvent(btn, function(btnObj)
            self.TuJianSelectId = i
            self:TuJianUpdate(ui)
            self:SetTuJianButtonSelected(ui, btnObj)
        end)
    end
    GUI:setChildrenCascadeOpacityEnabled(ui.Panel_1, true)
    GUI:setOpacity(ui.Panel_1, 0)
    GUI:Timeline_FadeIn(ui.Panel_1, 0.5)
end
--设置按钮选中状态
function TianMingOBJ:SetTuJianButtonSelected(ui, btnObj)
    if not btnObj then
        return
    end
    local btnPos = GUI:getPosition(btnObj)
    GUI:setPosition(ui.Image_selected, btnPos.x - 9, btnPos.y - 9)
end

local function _findKeysNum(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

function TianMingOBJ:TuJianUpdate(ui)
    --self.tuJianData
    --TianMingOBJ.TuJianSelectId = 1
    --local helpStr1 = {
    --    self.data[1].."#250|/|10#70"
    --}
    --createMultiLineRichText(self.ui.Node1, "Node1",0,0,helpStr1,nil,600,22)
    --GUI:ScrollView_removeAllChildren(ui.ScrollView_1)
    GUI:removeAllChildren(ui.ScrollView_1)
    local Panel_TJlist = GUI:Layout_Create(ui.ScrollView_1, "Panel_TJlist", 0.00, 0.00, 500, 200, false)
    local childList = self.TianMingList[self.TuJianSelectId]
    local tuJianData = self.tuJianData[self.TuJianSelectId]
    --总数量
    local totalCount = #childList
    --未激活数量
    local inactiveCount = 0
    local setInnerHeight = math.ceil(totalCount / 5) * 212 --计算滚动高度
    local tuJianConfig = self.TianMingTuJianConfig[self.TuJianSelectId]

    for i, v in ipairs(childList or {}) do
        local Image_item_ = GUI:Image_Create(Panel_TJlist, "Image_item_" .. i, 0, 0, string.format("res/custom/TianMing/TuJian/%s/%s.png", self.TuJianSelectId, i))
        GUI:setAnchorPoint(Image_item_, 0.00, 0.00)
        GUI:setTouchEnabled(Image_item_, false)
        GUI:setTag(Image_item_, i)
        if i <= tuJianConfig.max then
            if not tuJianData[tostring(i)] then
                inactiveCount = inactiveCount + 1
                GUI:Image_setGrey(Image_item_, true)
                GUI:Image_Create(Image_item_, "Image_gary_" .. i, 18.00, 2.00, "res/custom/TianMing/TuJian/weikaiqi.png")
            end
        else
            local effect = GUI:Effect_Create(Image_item_, "effect", 130, 200, 0, 63113, 0, 0, 0, 1)
        end
    end
    --更新图片提示
    GUI:Image_loadTexture(ui.Image_tips, string.format("res/custom/TianMing/TuJian/tips_%s.png", self.TuJianSelectId))

    local activatedCount = _findKeysNum(tuJianData)
    local strTbl = {
        --self.data[1].."#250|/|10#70"
        string.format("%s#249|/#251|%s#250", activatedCount, tuJianConfig.max )
    }
    createMultiLineRichText(ui.Panel_count, "Panel_count", 0, 0, strTbl, nil, 600, 24)
    GUI:setPositionY(Panel_TJlist, setInnerHeight - 212) --减去图片的高度
    GUI:ScrollView_setInnerContainerSize(ui.ScrollView_1, 964, setInnerHeight)
    --自动适应
    GUI:UserUILayout(Panel_TJlist, {
        dir = 3,
        addDir = 1,
        autosize = 1,
        gap = { x = 16, y = 0, l = 0 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end,
        rownums = { 5 }
    })
    GUI:removeAllChildren(ui.Node_erticalBar)
    local scrollViewPos = GUI:getPosition(ui.ScrollView_1)
    local scrollViewContentSize = GUI:getContentSize(ui.ScrollView_1)
    local erticalBarOffsetWidth = scrollViewPos.x + scrollViewContentSize.width + 2
    GUI:SetScrollViewVerticalBar(ui.Node_erticalBar, {
        bgPic = "res/private/gui_edit/scroll/line.png", -- 背景图
        barPic = "res/private/gui_edit/scroll/p.png", -- 滑动按钮图片
        Arr1PicN = "res/private/gui_edit/scroll/t.png", -- 上（正常图）
        Arr1PicP = "res/private/gui_edit/scroll/t_1.png", -- 上（按下图）可不传
        Arr2PicN = "res/private/gui_edit/scroll/b.png", -- 下（正常图）
        Arr2PicP = "res/private/gui_edit/scroll/b_1.png", -- 下（按下图）可不传
        default = 0, -- 进度条值（默认是0）
        x = erticalBarOffsetWidth, -- 进度条坐标 x
        y = GUI:getPosition(ui.ScrollView_1).y, -- 进度条坐标 y
        list = ui.ScrollView_1, -- 滚动的容器 list
    })
    GUI:ScrollView_scrollToPercentVertical(ui.ScrollView_1, 0, 0, true)
end

--显示抽取界面
function TianMingOBJ:ExtractShow()
    GUI:setLocalZOrder(self.ui.NodeNext, 15)
    local parent = self.ui.NodeNext
    ---------------------------------------播放背景begin-----------------------------------
    local Frames = GUI:Frames_Create(parent, "Frames_1", 0, 0, "res/custom/TianMing/background/bg_", ".png", 1, 32, { count = 32, speed = 100, loop = -1, finishhide = 0 })
    GUI:setContentSize(Frames, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setOpacity(Frames, 0)
    GUI:runAction(Frames, GUI:ActionSequence(GUI:ActionFadeIn(2)))
    ---------------------------------------播放竹筒begin-----------------------------------
    Frames = GUI:Frames_Create(parent, "Frames_2", ssrConstCfg.width / 2, ssrConstCfg.height / 2 - 100, "res/custom/TianMing/zhuTong/zhankai/zk_", ".png", 1, 21, { count = 21, speed = 100, loop = 1, finishhide = 1 })
    GUI:setAnchorPoint(Frames, 0.5, 0.5)
    SL:scheduleOnce(self.ui.ImageBG, function()
        if self.pageType == 2 then
            Frames = GUI:Frames_Create(parent, "Frames_3", ssrConstCfg.width / 2, ssrConstCfg.height / 2 - 100, "res/custom/TianMing/zhuTong/loop/loop_", ".png", 1, 29, { count = 29, speed = 100, loop = -1, finishhide = 0 })
            if Frames then
                GUI:setAnchorPoint(Frames, 0.5, 0.5)
            end
        end
    end, 2.03)
    ---------------------------------------创建返回按钮-----------------------------------
    local backBtn = GUI:Button_Create(parent,"backBtn",ssrConstCfg.width / 2 - 90, ssrConstCfg.height / 2 - 300,"res/custom/TianMing/back_btn.png")
    GUI:addOnClickEvent(backBtn,function ()
        self:CloseUI()
    end)
    ---------------------------------------播放竹筒end-----------------------------------
    ---------------------------------------播放魔云begin----------------------------------
    Frames = GUI:Frames_Create(parent, "Frames_4", 0, 0, "res/custom/TianMing/moYun/my_", ".png", 1, 32, { count = 32, speed = 100, loop = 1, finishhide = 1 })
    GUI:setContentSize(Frames, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setOpacity(Frames, 0)
    GUI:runAction(Frames, GUI:ActionSequence(GUI:ActionFadeIn(2)))
    ---------------------------------------播放end----------------------------------
    ---------------------------------------播放字begin----------------------------------
    --self.currQuality = quality
    --self.currIndex = index
    GUI:setPosition(self.ui.NodeFont, ssrConstCfg.width / 2, ssrConstCfg.height / 2 + 100)
    GUI:setLocalZOrder(self.ui.NodeFont, 16)
    --字
    Frames = GUI:Frames_Create(self.ui.NodeFont, "Frames_5", 0, 0, string.format("res/custom/TianMing/%s/%s/danru/danru_", self.currQuality, self.currIndex), ".png", 1, 13, { count = 12, speed = 100, loop = 1, finishhide = 1 })
    GUI:setAnchorPoint(Frames, 0.5, 0.5)
    --字二
    SL:scheduleOnce(self.ui.ImageBG, function()
        if self.pageType == 2 then
            Frames = GUI:Frames_Create(self.ui.NodeFont, "Frames_6", 0, 0, string.format("res/custom/TianMing/%s/%s/xunhuan/xunhuan_", self.currQuality, self.currIndex), ".png", 1, 15, { count = 15, speed = 100, loop = -1, finishhide = 0 })
            GUI:setAnchorPoint(Frames, 0.5, 0.5)
        end
    end, 1.15)
    --竹筒
end
---------------------------------------播放字end----------------------------------

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TianMingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        --self:UpdateUI(data)
    end
end
return TianMingOBJ