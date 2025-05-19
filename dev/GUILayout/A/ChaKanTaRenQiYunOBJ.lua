local ChaKanTaRenQiYunOBJ = {}
ChaKanTaRenQiYunOBJ.__cname = "ChaKanTaRenQiYunOBJ"
--ChaKanTaRenQiYunOBJ.config = ssrRequireCsvCfg("cfg_TianMing")
ChaKanTaRenQiYunOBJ.radiusLeft = 400
ChaKanTaRenQiYunOBJ.radiusRight = -400
ChaKanTaRenQiYunOBJ.LeftUnLock = {
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
ChaKanTaRenQiYunOBJ.RightUnLock = {
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
ChaKanTaRenQiYunOBJ.TianMingList = {
    [1] = ssrRequireCsvCfg("cfg_TianMing_Fan"), --天命凡
    [2] = ssrRequireCsvCfg("cfg_TianMing_Ling"), --天命灵
    [3] = ssrRequireCsvCfg("cfg_TianMing_Xian"), --天命仙
    [4] = ssrRequireCsvCfg("cfg_TianMing_Sheng"), --天命圣
    [5] = ssrRequireCsvCfg("cfg_TianMing_Di"), --天命帝
}
--枚举颜色
ChaKanTaRenQiYunOBJ.levelColor = {
    [1] = "#f0ecdd",
    [2] = "#d5e5ff",
    [3] = "#fdcbfe",
    [4] = "#ffddb8",
    [5] = "#ffdbd0",
}

--枚举品质名称
ChaKanTaRenQiYunOBJ.qualityName = {
    [1] = "凡品",
    [2] = "灵品",
    [3] = "仙品",
    [4] = "圣品",
    [5] = "帝品",
}

--后天开启
ChaKanTaRenQiYunOBJ.enumeOpenHouTian = {
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
ChaKanTaRenQiYunOBJ.TianMingTuJianConfig = {
    [1] = { var = "VarCfg.T_TianMing_Fan", max = 18, attr = { [1] = 10000, [4] = 5000 }, baoLvAddtion = { [218] = 5 } },
    [2] = { var = "VarCfg.T_TianMing_Ling", max = 20, attr = { [75] = 1500, [200] = 30000 }, baoLvAddtion = { [218] = 10 } },
    [3] = { var = "VarCfg.T_TianMing_Xian", max = 24, attr = { [21] = 15, [22] = 15 }, baoLvAddtion = { [218] = 20 } },
    [4] = { var = "VarCfg.T_TianMing_Sheng", max = 28, attr = { [79] = 1500, [80] = 15 }, baoLvAddtion = { [218] = 30 } },
    [5] = { var = "VarCfg.T_TianMing_Di", max = 34, attr = { [208] = 15, [209] = 15, [210] = 15, [211] = 15, [212] = 15, [213] = 15, [214] = 15, [221] = 15, [222] = 15, [223] = 15, [224] = 15, [225] = 15, [202] = 1 }, baoLvAddtion = { [218] = 30 } },
}

--图鉴默认选择ID
ChaKanTaRenQiYunOBJ.TuJianSelectId = 1
ChaKanTaRenQiYunOBJ.SkipAnimation = false
--记录引导状态
ChaKanTaRenQiYunOBJ.guideStateID = 0

function ChaKanTaRenQiYunOBJ:main(objcfg)
    self.cfgList = {}
    self.currSelectPos = 0
    self.currQuality = 0
    self.currSelectedBtnObj = nil
    self.objcfg = objcfg
    self.pageType = 1
    self.closeLock = false
     local targetName = SL:GetMetaValue("LOOK_USER_NAME")
    ssrMessage:sendmsg(ssrNetMsgCfg.ChaKanTaRenQiYun_openUI,0,0,0,{targetName})
end

function ChaKanTaRenQiYunOBJ:openUI(arg1, arg2, arg3, data)
    self.unLockData = data["unLock"]
    self.myTianMingData = data["myTianMing"]
    self:ShowUI(self.objcfg)
end
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChaKanTaRenQiYunOBJ:ShowUI(objcfg)
    self.lockBtn = false
    local parent = GUI:Win_Create(self.__cname, 0, 0, ssrConstCfg.width, ssrConstCfg.height, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    GUI:setTouchEnabled(self.ui.ImageBG, true)
    GUI:setPosition(self.ui.ImageBG, 0, 0)
    GUI:setContentSize(self.ui.ImageBG, ssrConstCfg.width, ssrConstCfg.height)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:setLocalZOrder(self.ui.CloseButton, 20)
    GUI:setLocalZOrder(self.ui.Text_1, 20)
    --跳过动画上层
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
    SL:dump(SL:GetMetaValue("LOOK_USER_NAME").."的气运")
    GUI:Text_setString(self.ui.Text_1,SL:GetMetaValue("LOOK_USER_NAME").."的气运")
    if ssrConstCfg.isPc then
        GUI:setPosition(self.ui.Text_1,510,680)
    else
        GUI:setPosition(self.ui.Text_1,570,602)
    end
    self:InitButton()
end

function ChaKanTaRenQiYunOBJ:UpdateUI(data)
    self.unLockData = data["unLock"]
    self.myTianMingData = data["myTianMing"]
    self:InitButton()
end

--初始化按钮
function ChaKanTaRenQiYunOBJ:InitButton()
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
            --addRedPoint(child, 100, 28)
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
            --addRedPoint(child, 200, 28)
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
                --Player:checkAddRedPoint(child, cost, 30, 5)
            end
        end

        GUI:addOnClickEvent(child, function()
            if isActivate == 0 then
                if i >= 1 and i <= 10 then
                    --ssrMessage:sendmsg(ssrNetMsgCfg.TianMing_OpenHouTian,i)
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
function ChaKanTaRenQiYunOBJ:OpenHouTian(index)
    local qiYunWhere = 12 + index
    self.unLockData[qiYunWhere] = 1 --标记为激活
    GUI:Button_setTitleText(self.childListRight[index], "")
    GUI:Button_loadTextureNormal(self.childListRight[index], "res/custom/TianMing/static/unlockRight.png")
    --delRedPoint(self.childListRight[index])
    --addRedPoint(self.childListRight[index], 200, 28)
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
                --delRedPoint(child)
                --Player:checkAddRedPoint(child, cost, 30, 5)
            end
        end
    end
end

--设置按钮选中状态
function ChaKanTaRenQiYunOBJ:SetButtonSelected(tag, where)
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
function ChaKanTaRenQiYunOBJ:SetButtonSelectedImg(widget, where)
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

function ChaKanTaRenQiYunOBJ:updateItemPos(childList, worldPos, radius, shifting)
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

--显示初始界面
function ChaKanTaRenQiYunOBJ:Show()
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

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChaKanTaRenQiYunOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        --self:UpdateUI(data)
    end
end
return ChaKanTaRenQiYunOBJ