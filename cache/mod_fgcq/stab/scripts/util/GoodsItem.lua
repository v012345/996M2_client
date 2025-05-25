local CacheWidget = requireUtil("CacheWidget")
local GoodsItem = class("GoodsItem", CacheWidget)
local ItemConfigProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemConfigProxy)
local RichTextHelp = requireUtil("RichTextHelp")

-- 点击事件
local kTouchAll = 0
local kTouchPress = 1 -- 长按
local kTouchClick = 2 -- 点击
local kTouchWidget = 3 -- widget touch

local kDoubleTime = global.MMO.CLICK_DOUBLE_TIME
local itemMoveState = {
    begin = 1,
    moving = 2,
    end_move = 3,
}

local mmax = math.max
local mmin = math.min
local sformat = string.format

function GoodsItem:ctor()
    GoodsItem.super.ctor(self)

    self._pressCallback = nil
    self._clickCallback = nil
    self._replaceClickEvent = nil
    self._iconTouchEventListener = nil
    self._doubleEvent = nil
    self._lastClickTime = nil
    self._clickDelayHandler = nil
    self._moveCancelCallBack = nil

    self._data = nil
    self._itemData = nil
    self._from = nil
    self._movable = nil
    self._canLooks = nil
    self._mouseEventCheckTimes = nil
    self._moveItem = nil
    self._noSwallow = nil
    self._extraLockStatus = nil
    self._greyStatus = nil

    self._itemTipsCenter = nil
end

function GoodsItem:init(data)
    self._quickUI = ui_delegate(self)
    self:InitGUI(data)
end

function GoodsItem:InitGUI(data)
    self._itemClass = require(SLDefine.LUAFile.LUA_FILE_ITEM).new(self, data)

    self:Cleanup()
    self:InitData(data)
end

function GoodsItem:InitData(data)
    if tonumber(data) then
        local index = data
        data = {}
        data.index = index
    end

    local ItemConfigProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemConfigProxy)

    data = data or {}
    self._data = data

    self._itemData = data.itemData or ItemConfigProxy:GetItemDataByIndex(data.index)

    self._mouseEventCheckTimes = data.mouseCheckTimes

    self._moveItem = data.moveItem

    if data.from then
        self._from = data.from
    end

    -- 是否注册鼠标tips
    local isShowMouseTip = data.noMouseTips
    if not isShowMouseTip and global.isWinPlayMode then
        self:RegisterWin32MouseMove()
        global.mouseEventController:registerMouseButtonEvent(self, {checkIsVisible = true})
    end

    local noSwallow = data.noSwallow
    if type(noSwallow) == "boolean" then
        self:setItemTouchSwallow(noSwallow)
    end

    -- 是否查看道具信息
    local look = data.look
    -- 是否可移动
    local movable = data.movable
    if look or movable then
        self._movable = movable
        self._canLooks = look
        self:addLookItemInfoEvent(data.posType)
    end
end

function GoodsItem:OnEnter()
end

function GoodsItem:OnExit()
    if self._clickDelayHandler then
        UnSchedule(self._clickDelayHandler)
        self._clickDelayHandler = nil
    end

    if not global.isWinPlayMode then
        if not self._moveItem and self._itemData and self._itemData.MakeIndex then
            global.Facade:sendNotification(global.NoticeTable.Layer_Moved_Cancel, {MakeIndex = self._itemData.MakeIndex})
        end
    end
    
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:removeEventListenersForTarget(self, true)
end

function GoodsItem:Cleanup()
    self._movingState = false
    self._data = nil
    self._itemData = nil
    self._from = nil
    self._movable = nil
    self._canLooks = nil
    self._mouseEventCheckTimes = nil
    self._moveItem = nil
    self._noSwallow = nil
    self._extraLockStatus = nil
    self._greyStatus = nil


    self._pressCallback = nil
    self._clickCallback = nil
    self._replaceClickEvent = nil
    self._iconTouchEventListener = nil
    self._doubleEvent = nil
    self._lastClickTime = nil
    self._clickDelayHandler = nil
    self._moveCancelCallBack = nil
end

function GoodsItem:OnRunFunc(func, ...)
    if self._itemClass and self._itemClass[func] and type(self._itemClass[func]) == "function" then
        return self._itemClass[func](self._itemClass, ...)
    end
end

function GoodsItem:UpdateItem(data)
    self._itemClass:Cleanup()
    self._itemClass:InitData(data)

    self:Cleanup()
    self:InitData(data)
end

function GoodsItem:setCount(count)
    self._itemClass:SetCount(count)
end

function GoodsItem:setItemExtraLockStatus(status)
    self._extraLockStatus = status
    self._itemClass:SetItemExtraLockStatus(status)
end

function GoodsItem:setIconGrey(value)
    self._greyStatus = value
    self._itemClass:SetIconGrey(value)
end

function GoodsItem:setItemPowerTag()
    self._itemClass:SetItemPowerFlag()
end

function GoodsItem:UpdateGoodsItem(itemData)
    self._itemData = itemData
    self._itemClass:UpdateGoodsItem(itemData)
end

function GoodsItem:SetItemIndex(index)
    self._itemData = ItemConfigProxy:GetItemDataByIndex(index)
    if self._itemData.Looks == null then return end
    self._itemClass._looks = self._itemData.Looks
    self._itemClass._index = index
    self._itemClass:SetItemIndex(index)
    GUI:setVisible(self._itemClass._ui["Button_icon"], true)
end

function GoodsItem:setItemTouchSwallow(bool)
    if not type(bool) == "boolean" then
        return false
    end
    self._noSwallow = not bool

    self._itemClass:SetItemTouchSwallow(bool)
end

function GoodsItem:SetMoveEable(enable)
    self._movable = enable
end

function GoodsItem:GetLayoutExtra()
    return self._quickUI.Panel_extra
end

function GoodsItem:GetButtonIcon()
    return self._quickUI.Button_icon
end

function GoodsItem:GetTextCount()
    return self._quickUI.Text_count
end

function GoodsItem:SetGoodItemState( state, pos )
    if not self._from or not self._movable then
        return
    end
    if itemMoveState.begin == state then
        self:setVisible(false)
        self._movingState = true
        global.Facade:sendNotification(global.NoticeTable.Layer_ItemTips_Close)
        global.Facade:sendNotification(global.NoticeTable.Layer_Moved_Begin,{
            pos = pos,
            itemData = self._itemData,
            cancelCallBack = self._moveCancelCallBack,
            goodsItem = self,
            from = self._from
        })
    elseif itemMoveState.moving == state then

    elseif itemMoveState.end_move == state then
        global.Facade:sendNotification(global.NoticeTable.Layer_Moved_End, pos)
    end
end

function GoodsItem:resetMoveState(bool)
    self._movingState = bool
    self:setVisible(not bool)
end

function GoodsItem:showIteminfo(posType, setPos)
    if not self._itemData or self._movingState then
        return nil
    end
    local result = true
    if self._replaceClickEvent then
        result = self._replaceClickEvent(self)
    end
    if result then
        local pos = self:getWorldPosition()
        -- pick item audio
        if global.isWinPlayMode and self._movable then
            if setPos and next(setPos) then-- 交换道具位置后的
                pos = setPos
            end
            self:SetGoodItemState(itemMoveState.begin, pos)
        else
            if self._canLooks and not global.isWinPlayMode then
                if not self._itemData or next(self._itemData) == nil then
                    return
                end
                local data = {}
                data.itemData = self._itemData
                data.pos = pos
                data.from = self._from
                data.lookPlayer = self._data and self._data.lookPlayer
                global.Facade:sendNotification(global.NoticeTable.Layer_ItemTips_Open, data)
            end
        end
    end
end

function GoodsItem:addLookItemInfoEvent(posType, eventType)
    eventType = eventType or kTouchClick

    self:addTouchEventListener(function() 
        self:showIteminfo(posType)
    end, eventType)
end

function GoodsItem:addReplaceClickEventListener(callback)
    self._replaceClickEvent = callback
end

function GoodsItem:addDoubleEventListener(callback)
    self._doubleEvent = callback
end

function GoodsItem:addMoveCancelCallBack(callback)
    self._moveCancelCallBack = callback
end

function GoodsItem:addPressCallBack(callback)
    self._pressCallback = callback
end

function GoodsItem:SetChooseState(visible)
    self._quickUI.Image_choosTag:setVisible(visible)
end

-- 注册鼠标移动事件
function GoodsItem:RegisterWin32MouseMove()
    local function UnScheduler()
        if self._delayFunc then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._delayFunc)
            self._delayFunc = nil
        end
    end

    local function onShowItemTips(touchPos)
        if self._movingState then
            return false
        end
        if not (self._itemData and next(self._itemData)) then
            return false
        end

        if not CheckNodeCanCallBack(self, touchPos, self._mouseEventCheckTimes) then
            return false
        end
        
        local data = {}
        data.itemData = self._itemData
        data.pos = self:getWorldPosition()
        data.from = self._from
        data.lookPlayer = self._data and self._data.lookPlayer

        SL:OpenItemTips(data)
    end

    local function onLeaveFunc() 
        SL:CloseItemTips()
        UnScheduler()
    end

    local function onEnterFunc(touchPos)
        if self._delayFunc then
            return false
        end
        self._delayFunc = PerformWithDelayGlobal(function()
            onShowItemTips(touchPos)
        end, global.MMO.PC_TIPS_DELAY_TIME)
    end

    GUI:addMouseMoveEvent(self, {onEnterFunc = onEnterFunc, onLeaveFunc = onLeaveFunc, checkIsVisible = true})
    self.isSignMouListner = true
end

--注册鼠标滚动回调
function GoodsItem:RegisterWin32MouseMoveScrollCall(data)
    global.Facade:sendNotification(global.NoticeTable.Layer_ItemTips_Mouse_Scroll, data)
end

function GoodsItem:addTouchEventListener(callback, eventType)
    -- 0:长按,点击  1:长按  2:点击  3:touch响应回调
    eventType = eventType or kTouchClick

    if eventType == kTouchAll then
        self._pressCallback = callback
        self._clickCallback = callback
    elseif eventType == kTouchPress then
        self._pressCallback = callback
    elseif eventType == kTouchClick then
        self._clickCallback = callback
    elseif eventType == kTouchWidget then
        self._iconTouchEventListener = callback
    end

    local isEventPress = false
    local isMoved = true
    local canCallBack = true
    local isMobile = not global.isWinPlayMode
    local isMoveNode = false

    local function delayCallback()
        isEventPress = true

        if self._pressCallback then
            if not self._pressCallback then
                return false
            end

            if not isMoved then
                self._pressCallback(self)
                return false
            end

            local movedPos = self._quickUI.Panel_bg:getTouchMovePosition()
            local beganPos = self._quickUI.Panel_bg:getTouchBeganPosition()

            local diff = cc.pSub(movedPos, beganPos)
            local distSq = cc.pLengthSQ(diff)
            if distSq <= 100 then
                self._pressCallback(self)
            end
        end
    end

    local function touchEvent(_, eventType)
        if not isMobile then
            local ItemMoveProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemMoveProxy)
            local itemMoving = ItemMoveProxy:GetMovingItemState()
            if itemMoving then --在道具移动中
                if eventType == 0 then
                    self:retain()
                    canCallBack = ItemMoveProxy:GetItemMoveFrome() ~= ItemMoveProxy.ItemGoTo.BAG or self._from ~= ItemMoveProxy.ItemGoTo.BAG
                end
                return
            end
            
            local BagProxy = global.Facade:retrieveProxy(global.ProxyTable.Bag)
            if BagProxy:GetBagCollimator() then
                self:retain()
                return
            end
        end
        if self._iconTouchEventListener then
            self._iconTouchEventListener(self, eventType)
        end
        if eventType == 0 then
            self:retain()
            isEventPress = false
            isMoved = false
            canCallBack = true
            isMoveNode = false

            if self._pressCallback then
                self._quickUI.Panel_bg:stopAllActions()
                performWithDelay(self._quickUI.Panel_bg, delayCallback, kDoubleTime)
            end
        elseif eventType == 1 then
            local movedPos = self._quickUI.Panel_bg:getTouchMovePosition()
            local beganPos = self._quickUI.Panel_bg:getTouchBeganPosition()

            local diff = cc.pSub(movedPos, beganPos)
            local distSq = cc.pLengthSQ(diff)
            if not isMoved and distSq > 100 then
                isMoved = true
                if isMobile and self._movable then
                    local beginMovePos = self:getWorldPosition()
                    self:SetGoodItemState(itemMoveState.begin, beginMovePos)
                end
            end
            if isMobile and self._movable then
                local movedPos = self._quickUI.Panel_bg:getTouchMovePosition()
                global.Facade:sendNotification(global.NoticeTable.Layer_Moved_Moving,{pos = movedPos})
            end
        elseif eventType == 2 or eventType == 3 then
            
            self:autorelease()
            self._quickUI.Panel_bg:stopAllActions()

            if not isMoved then
                if not isEventPress then
                    -- 判断是否有双击事件
                    if self._doubleEvent then
                        -- 记录上一次点击时间
                        if not self._lastClickTime then
                            self._lastClickTime = true
                            -- 记录单击触发
                            self._clickDelayHandler =
                                PerformWithDelayGlobal(
                                function()
                                    if self._clickCallback and canCallBack then
                                        self._clickCallback(self, eventType)
                                        canCallBack = false
                                    end

                                    self._lastClickTime = nil
                                end,
                                kDoubleTime
                            )
                        else
                            if self._clickDelayHandler then
                                UnSchedule(self._clickDelayHandler)
                                self._clickDelayHandler = nil
                            end

                            if self._doubleEvent then
                                self._doubleEvent(self)
                            end

                            self._lastClickTime = nil
                        end
                    else
                        if self._clickCallback and canCallBack then
                            self._clickCallback(self, eventType)
                            canCallBack = false
                        end
                    end
                end
            else
                if isMobile and self._movable then
                    local endPos = self._quickUI.Panel_bg:getTouchEndPosition()
                    self:SetGoodItemState(itemMoveState.end_move, endPos)
                end
            end
        end
    end

    RemoveAllWidgetTouchEventListener(self._quickUI.Panel_bg)
    self._quickUI.Panel_bg:addTouchEventListener(touchEvent)
    self._quickUI.Panel_bg:setTouchEnabled(true)
    self._quickUI.Panel_bg:setSwallowTouches(not self._noSwallow)
end

function GoodsItem:DelayTouchEnabled(delay)
    GUI:delayTouchEnabled(self._quickUI.Panel_bg, delay)
end

return GoodsItem
