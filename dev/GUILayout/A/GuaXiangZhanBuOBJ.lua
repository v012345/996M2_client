GuaXiangZhanBuOBJ = {}
GuaXiangZhanBuOBJ.__cname = "GuaXiangZhanBuOBJ"
--GuaXiangZhanBuOBJ.config = ssrRequireCsvCfg("cfg_GuaXiangZhanBu")
GuaXiangZhanBuOBJ.config = { "初窥天机", "通灵神眼", "天机尊者", "命运掌控", "玄秘宗师" }
GuaXiangZhanBuOBJ.eventName = "卦象占卜"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuaXiangZhanBuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -30)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self.imageList = GUI:getChildren(self.ui.Node_1)
    --local imageListOldPosition = {}
    for i, v in ipairs(self.imageList) do
        local currPos = GUI:getPosition(v)
        --table.insert(imageListOldPosition, currPos)
        local randomX = math.random(0, ssrConstCfg.width)
        local randomY = math.random(0, ssrConstCfg.height)
        GUI:setPosition(v, randomX, randomY)
        local endPos = GUI:p(currPos.x, currPos.y)
        local controlPoint_1 = GUI:p(randomX, randomY)
        local controlPoint_2 = GUI:p(randomX, randomX)
        local endPosition = endPos
        local bezier = GUI:ActionBezierTo(0.5, controlPoint_1, controlPoint_2, endPosition)
        GUI:runAction(v, bezier)
    end
    self:RegisterEvent()
    local titleId = self:GetIDByTitle()
    self:SetImageByTitleId(titleId)
    GUI:Text_setString(self.ui.Text_count, self.buGuacount)
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuaXiangZhanBu_Request)
    end)
    --SL:dump(imageListOldPosition)
    GUI:addOnClickEvent(self.ui.ButtonHelp, function(widget)
        local str = [[
            <font size='16' color='#FF00FF'>每次占卜消耗100灵符</font>
            <font size='16' color='#00ff00'>66次必得玄秘宗师</font>
            ]]
        local thisWorldPosition = GUI:getWorldPosition(widget)
        local data = {width = 800, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end )
end

--根据称号ID设置选中图片
function GuaXiangZhanBuOBJ:SetImageByTitleId(titleId)
    for i, v in ipairs(self.imageList) do
        GUI:removeAllChildren(v)
        if i == titleId then
            GUI:Image_Create(v, "selected_img_" .. i, 0, 0, "res/custom/GuaXiangZhanBu/selected.png")
            GUI:setLocalZOrder(v, 100)
        end
    end
end

--根据称号获取ID
function GuaXiangZhanBuOBJ:GetIDByTitle()
    for i, v in ipairs(self.config) do
        local titleId = SL:GetMetaValue("ITEM_INDEX_BY_NAME", v)
        if SL:GetMetaValue("TITLE_DATA_BY_ID", titleId) then
            return i
        end
    end
    return 0
end

--移动选中框动画
function GuaXiangZhanBuOBJ:MoveSelectedImg(titleId, callback)

    local last_selected_widget
    local last_selected_img_widget
    for i, v in ipairs(self.imageList) do
        local widget = GUI:getChildByName(v, "selected_img_" .. i)
        if widget then
            last_selected_widget = v
            last_selected_img_widget = widget
            break
        end
    end
    --local currWorldPos = GUI:getWorldPosition(last_selected_widget)
    local widget = self.imageList[titleId]
    if not last_selected_widget then
        callback()
        return
    end
    local targetWorldPos = GUI:getWorldPosition(widget)
    local movPos = GUI:convertToNodeSpace(last_selected_widget, targetWorldPos.x, targetWorldPos.y)
    local action1 = GUI:ActionMoveTo(0.5, movPos.x, movPos.y)
    GUI:stopAllActions(last_selected_img_widget)
    GUI:runAction(last_selected_img_widget, action1, GUI:CallFunc(callback))
end

function GuaXiangZhanBuOBJ:UpdateUI()
    local titleId = self:GetIDByTitle()
    local widget = self.imageList[titleId]
    GUI:Timeline_Shake(widget, 0.5, 5, 5)
    self:MoveSelectedImg(titleId, function ()
        self:SetImageByTitleId(titleId)
    end)
end


--刷新UI
function GuaXiangZhanBuOBJ:refreshUI()
    if not self.isExecuting then
        self.isExecuting = true -- 标记函数正在执行
        SL:scheduleOnce(self.ui.Node_1, function()
            self:UpdateUI()
            self.isExecuting = false
        end, 0.1)
    end
end

--关闭窗口
function GuaXiangZhanBuOBJ:OnClose(widgetName)
    if widgetName == self.__cname then
        self:UnRegisterEvent()
    end
end

--------------------------- 注册事件 -----------------------------
function GuaXiangZhanBuOBJ:RegisterEvent()
    --飘字提示
    SL:RegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName, function(t)
        self:refreshUI()
    end)
    --关闭窗口
    SL:RegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName, function(widgetName)
        self:OnClose(widgetName)
    end)

    --称号改变
    SL:RegisterLUAEvent(LUA_EVENT_PLAYER_TITLE_CHANGE, self.eventName, function(t)
        if t.opera == 2 then
            self:refreshUI()
        end
    end)

end

function GuaXiangZhanBuOBJ:UnRegisterEvent()
    SL:UnRegisterLUAEvent(LUA_EVENT_NOTICE_ITEM_TIPS, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_CLOSEWIN, self.eventName)
    SL:UnRegisterLUAEvent(LUA_EVENT_PLAYER_TITLE_CHANGE, self.eventName)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuaXiangZhanBuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.buGuacount = arg1
    if GUI:GetWindow(nil, self.__cname) then
        GUI:Text_setString(self.ui.Text_count, self.buGuacount)
    end
end
return GuaXiangZhanBuOBJ