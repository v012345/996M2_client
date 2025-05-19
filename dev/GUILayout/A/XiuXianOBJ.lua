local XiuXianOBJ = {}
XiuXianOBJ.__cname = "XiuXianOBJ"
XiuXianOBJ.config = ssrRequireCsvCfg("cfg_XiuXianFaBaoData")
XiuXianOBJ.where = 43
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XiuXianOBJ:main(objcfg)
    local equip = SL:GetMetaValue("EQUIP_DATA", self.where)
    if not equip then
        sendmsg9("获得修仙装备后才可以进行提升！#249")
        return
    end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setMouseRSwallowTouches(self.ui.ImageBG)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:setPosition(self.ui.CloseButton,ssrConstCfg.width-100,ssrConstCfg.height-100)
    GUI:setLocalZOrder(self.ui.CloseButton,20)

    GUI:setTouchEnabled(self.ui.ImageBG,true)
    GUI:setPosition(self.ui.ImageBG,0,0)
    GUI:setContentSize(self.ui.ImageBG, ssrConstCfg.width, ssrConstCfg.height)
    local FramesBg = GUI:Frames_Create(self.ui.ImageBG, "Frames_bg", 0, 0, "res/custom/XiuXian/bg/xx_", ".jpg", 1, 29, { count = 29, speed = 100, loop  =  -1, finishhide = 0 })
    GUI:setContentSize(FramesBg, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setLocalZOrder(FramesBg,1)
    GUI:setLocalZOrder(self.ui.Node_Main,10)
    GUI:setPosition(self.ui.Node_Main, ssrConstCfg.width/2,ssrConstCfg.height/2)
    GUI:addOnClickEvent(self.ui.Button_start, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XiuXian_Request)
    end )
    self:AddButton()
    self:UpdateUI()
    self:StartGuide()
end
--开始引导
function XiuXianOBJ:StartGuide()
    local guideId = ZhuXianRenWuOBJ:getGuideTask()
    if guideId == 1 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_start        -- 当前节点
        data.guideParent   = self._parent         -- 父窗口
        data.guideDesc     = "点击提升"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
        ZhuXianRenWuOBJ:setGuideTask(0)
    end
end
--开始引导2
--function XiuXianOBJ:StartGuide2()
--    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
--    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
--    if mainTaskProgress == 8 and mainTaskStatus == 0 then
--        local data = {}
--        data.dir           = 5                -- 方向（1~8）从左按瞬时针
--        data.guideWidget   = self.ui.CloseButton        -- 当前节点
--        data.guideParent   = self._parent         -- 父窗口
--        data.guideDesc     = "点击"           -- 文本描述
--        data.isForce       = false             -- 强制引导
--        SL:StartGuide(data)
--    end
--end
--添加按钮
function XiuXianOBJ:AddButton()
    local currLevel = tonumber(self.faBaoLevel) or tonumber(Player:getEquipFieldByPos(self.where, 1))
    for i, v in ipairs(self.config) do
        local btn = GUI:Button_Create(self.ui.Panel_btnList,"Left_btn_"..i,0,0,"res/custom/XiuXian/btn/btn_"..i..".png")
        GUI:setTag(btn,i)
        GUI:addOnClickEvent(btn, function()
            if tonumber(self.faBaoLevel) < i then
                sendmsg9("你没有解锁该等级的修仙装备！#249")
                return
            end
            self:SetBtnState(btn)
            self:UpdateUI(i)
        end )
    end
    --自动适应
    GUI:UserUILayout(self.ui.Panel_btnList, {
        dir = 1,
        addDir = 1,
        autosize = 1,
        gap = {y = 6},
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end
    })
    --初始化按钮
end

--设置按钮选中状态
function XiuXianOBJ:SetBtnState(any)
    local Panel_btnList = GUI:getChildren(self.ui.Panel_btnList)
    for i, v in ipairs(Panel_btnList) do
        local childWidget = GUI:getChildByName(v, "Image_select")
        if childWidget then
            GUI:removeChildByName(v, "Image_select")
        end
    end
    local btn
    if type(any) ~= "userdata" then
        btn = Panel_btnList[any]
    else
        btn = any
    end
    GUI:Image_Create(btn, "Image_select", -1, -2, "res/custom/XiuXian/btn_selected.png")
end
--更新当前icon
function XiuXianOBJ:SetBtnCurr(level)
    local Panel_btnList = GUI:getChildren(self.ui.Panel_btnList)
    for i, v in ipairs(Panel_btnList) do
        local childWidget = GUI:getChildByName(v, "Image_Curr")
        if childWidget then
            GUI:removeChildByName(v, "Image_Curr")
        end
    end
    local btn = Panel_btnList[level]
    local currWidget = GUI:Image_Create(btn, "Image_Curr", 0, 14, "res/custom/XiuXian/curr.png")
    GUI:setLocalZOrder(currWidget, 10)
end

function XiuXianOBJ:UpdateUI(level,Ttype)
    self.faBaoLevel = Player:getEquipFieldByPos(self.where, 1)
    local faBaoLevel = self.faBaoLevel
    local currLevel
    if not level then
        if not faBaoLevel then
            sendmsg9("获得修仙装备后才可以进行提升！#249")
            return
        end
        currLevel = faBaoLevel
    else
        currLevel = level
    end
    local cfg = self.config[tonumber(currLevel)]
    showCostFont(self.ui.Panel_cost, cfg.cost)
    GUI:Text_setString(self.ui.Text_att1, cfg.attrs[1])
    GUI:Text_setString(self.ui.Text_att2, cfg.attrs[3])
    GUI:Text_setString(self.ui.Text_att3, cfg.attrs[5])
    GUI:Text_setString(self.ui.Text_att4, cfg.attrs[2])
    GUI:Text_setString(self.ui.Text_att5, cfg.attrs[4])
    GUI:Text_setString(self.ui.Text_att6, cfg.attrs[6])
    --Image_titleLevel
    --Image_name
    --Image_LoadingBar
    --Image_cost
    --Button_start
    if level then
        if level < tonumber(faBaoLevel) then
            GUI:setVisible(self.ui.Image_activate,true)
            GUI:setVisible(self.ui.Image_LoadingBar,false)
            GUI:setVisible(self.ui.Image_cost,false)
            GUI:setVisible(self.ui.Button_start,false)

        else
            GUI:setVisible(self.ui.Image_activate,false)
            GUI:setVisible(self.ui.Image_LoadingBar,true)
            GUI:setVisible(self.ui.Image_cost,true)
            GUI:setVisible(self.ui.Button_start,true)
        end
    end

    GUI:Image_loadTexture(self.ui.Image_titleLevel, "res/custom/XiuXian/JingJie/JingJie_" .. currLevel .. ".png")
    GUI:Image_loadTexture(self.ui.Image_name, "res/custom/XiuXian/namaList/" .. currLevel .. ".png")
    GUI:removeAllChildren(self.ui.Image_center)
    local sfx = GUI:Effect_Create(self.ui.Image_center, "sfx", cfg.btnOffsetX, cfg.btnOffsetY, 0, cfg.effect, 0, 0, 3, 1)
    GUI:setScale(sfx,cfg.scale)
    local cur, max = Player:getProgressBar(43, 0)
    cur = cur or 0
    max = max or 0
    --添加按钮红点
    delRedPoint(self.ui.Button_start)
    if cur >= max and tonumber(currLevel) < 21 and cur ~= 0 and max ~= 0 then
        local constName, needItemCount = Player:checkItemNumByTable(cfg.cost)
        if not constName then
            addRedPoint(self.ui.Button_start,60,20)
        end
    end
    --计算进度
    local jinDu = math.floor(calculatePercentage(cur, max))
    GUI:Slider_setPercent(self.ui.LoadingBar_1, jinDu)
    GUI:Text_setString(self.ui.Text_LoadingBar, string.format("修仙值%d/%d", cur, max))
    if not level then
        GUI:ScrollView_scrollToPercentVertical(self.ui.ScrollView_1, 6.8 * (tonumber(currLevel) - 1) , 1, true)
        self:SetBtnState(tonumber(currLevel))
        --更新当前的icon
        self:SetBtnCurr(tonumber(currLevel))
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XiuXianOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI(nil,1)
        --local currLevel = tonumber(self.faBaoLevel) or tonumber(Player:getEquipFieldByPos(self.where, 1))
        --if currLevel == 2 then
        --    self:StartGuide2()
        --end
    end
end


return XiuXianOBJ