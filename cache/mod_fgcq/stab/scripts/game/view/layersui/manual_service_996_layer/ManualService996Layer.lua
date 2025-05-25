local BaseLayer = requireLayerUI( "BaseLayer" )
local ManualService996Layer = class( "ManualService996Layer", BaseLayer )

function ManualService996Layer:ctor()
    ManualService996Layer.super.ctor(self)

    self._show_state = false

    self._move_action_time = 0.5
    self._web_view_width = SL:GetMetaValue("SCREEN_WIDTH") * 0.5
    self._close_button_width = 0
    self._is_url_finish = false
end

function ManualService996Layer.create(data)
    local layer = ManualService996Layer.new()
    if layer and layer:Init(data) then
        return layer
    end
    return nil
end

function ManualService996Layer:Init(data)
    local url = data and data.url
    if not url then
        return false
    end

    local view = ccexp.CustomView or ccexp.WebView
    if not view then
        ShowSystemTips(GET_STRING(600000900))
        return false
    end

    local panel1 = GUI:Layout_Create(self, "panel_1", 0, 0, SL:GetMetaValue("SCREEN_WIDTH"), SL:GetMetaValue("SCREEN_HEIGHT"), true)
    GUI:setTouchEnabled(panel1, true)
    GUI:addOnClickEvent(panel1, function()
        GUI:setTouchEnabled(panel1, false)
        self:ShowHideUI(false)
    end)

    local whitePanel = GUI:Layout_Create(panel1, "panel_white", -1 * self._web_view_width, 0, self._web_view_width, SL:GetMetaValue("SCREEN_HEIGHT"), false)
    GUI:Layout_setBackGroundColor(whitePanel, "#FFFFFF")
    GUI:Layout_setBackGroundColorType(whitePanel, 1)
    GUI:Layout_setBackGroundColorOpacity(whitePanel, 255)
    GUI:setAnchorPoint(whitePanel, 0, 0)

    local widget  = view:create()
    widget:retain()
    GUI:setName(widget, "WEB_VIEW")
    GUI:setPositionX(widget, -1 * self._web_view_width)
    GUI:setAnchorPoint(widget, 0, 0)
    GUI:setContentSize(widget, cc.size(self._web_view_width, SL:GetMetaValue("SCREEN_HEIGHT")))
    GUI:addChild(panel1, widget)

    local maxFailCount = 3
    local failCount = 0
    widget:setOnDidFailLoading(function(sender, surl)
        if failCount >= maxFailCount then
            self:HideLoadingURL()
            ShowSystemTips(GET_STRING(310000901))
            return
        end
        ShowSystemTips(GET_STRING(310000900))
        widget:loadURL(url)
        failCount = failCount + 1
    end)

    widget:setOnDidFinishLoading(function(sender, surl)
        self._is_url_finish = true
        self:HideLoadingURL()
        if self._show_state then
            GUI:setPositionX(sender, 0)
        end
    end)

    self._is_url_finish = false
    widget:loadURL(url)

    local widgetSize = GUI:getContentSize(whitePanel)
    -- 关闭按钮
    local closeButton = GUI:Button_Create(whitePanel, "close_button", widgetSize.width , widgetSize.height)
    GUI:Button_loadTextureNormal(closeButton, global.MMO.PATH_RES_PUBLIC .. "1900000510.png")
    GUI:Button_loadTexturePressed(closeButton, global.MMO.PATH_RES_PUBLIC .. "1900000511.png")

    local buttonSize = GUI:getContentSize(closeButton)
    GUI:setPositionY(closeButton, widgetSize.height-buttonSize.height)
    self._close_button_width = buttonSize.width

    GUI:addOnClickEvent(closeButton, function()
        local ManualService996Proxy = global.Facade:retrieveProxy(global.ProxyTable.ManualService996Proxy)
        ManualService996Proxy:SetShowMaulServiceState(false)
        global.Facade:sendNotification(global.NoticeTable.Layer_Manual_Service_996_Close)
    end)

    local TouchSize = GUI:Layout_Create(closeButton, "TouchSize", 0, -buttonSize.height, buttonSize.width * 2, buttonSize.height * 2, false)
    GUI:setTouchEnabled(TouchSize, true)
    GUI:setVisible(TouchSize, false)

    self:ShowHideUI(true)

    local ManualService996Proxy = global.Facade:retrieveProxy(global.ProxyTable.ManualService996Proxy)
    ManualService996Proxy:SetWebOpenState(true)

    return true
end

-- 加载提示
function ManualService996Layer:ShowLoadingURL()
    if self.loadingImg then
        return
    end

    local panel1 = GUI:getChildByName(self, "panel_1")

    if not panel1 then
        return
    end

    local whitePanel = GUI:getChildByName(panel1, "panel_white")
    local loadingImg = GUI:Image_Create(whitePanel, "LOADING_IMG", 0, 0, "res/private/loading/bg_load_1.png")

    if not loadingImg then
        return
    end

    GUI:setPosition(loadingImg, self._web_view_width/2, SL:GetMetaValue("SCREEN_HEIGHT")/2)
    GUI:setAnchorPoint(loadingImg, 0.5, 0.5)

    self.loadingImg = loadingImg
    loadingImg:stopAllActions()
    loadingImg:runAction(cc.Sequence:create(cc.Hide:create(), cc.DelayTime:create(0.1), cc.Show:create()))
    loadingImg:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(0.04), cc.RotateBy:create(0, 30))))
end

-- 关闭加载提示
function ManualService996Layer:HideLoadingURL()
    if self.loadingImg then
        GUI:removeFromParent(self.loadingImg)
        self.loadingImg = nil
    end
end

function ManualService996Layer:ShowHideUI( isShow, url )
    if self._show_state == isShow then
        return false
    end
    self._show_state = isShow

    local ManualService996Proxy = global.Facade:retrieveProxy(global.ProxyTable.ManualService996Proxy)
    ManualService996Proxy:SetShowMaulServiceState(isShow)

    local panel1 = GUI:getChildByName(self, "panel_1")
    if not panel1 then
        return false
    end
    GUI:setTouchEnabled(panel1, isShow==true)

    local widget = GUI:getChildByName(panel1, "WEB_VIEW")
    if not widget then
        return false
    end

    local whitePanel = GUI:getChildByName(panel1, "panel_white")
    if not whitePanel then
        return false
    end

    GUI:stopAllActions(whitePanel)

    local movePos = isShow and cc.p(0, 0) or cc.p(-1 * (self._web_view_width + self._close_button_width), 0)
    local move = GUI:ActionMoveTo(self._move_action_time, movePos.x, movePos.y)
    local callback = GUI:CallFunc(function()
        if isShow then
            if not self._is_url_finish then
                self:ShowLoadingURL()
            end

            if url then
                widget:loadURL(url)
            end

            if self._is_url_finish then
                GUI:setPositionX(widget, 0)
            end
        else
            self:HideLoadingURL()
        end
        
    end)
    GUI:runAction(whitePanel,  GUI:ActionSequence(move, callback))

    if isShow then
        ManualService996Proxy:RemoveCheck(true)
        widget:evaluateJS("getModelVisible(true)")
    else
        GUI:runAction(widget,  GUI:ActionMoveTo(self._move_action_time, movePos.x, movePos.y))
        local glview = global.Director:getOpenGLView()
        if glview then
            glview:setIMEKeyboardState(false)
        end
        ManualService996Proxy:OnCheckRedPoint()
        widget:evaluateJS("getModelVisible(false)")
    end

    return true
end

function ManualService996Layer:OnClose()

    local panel1 = GUI:getChildByName(self, "panel_1")
    if panel1 then
        local widget = GUI:getChildByName(panel1, "WEB_VIEW")
        if widget then
            widget:evaluateJS("getModelVisible(false)")
            widget:release()
        end
    end

    local glview = global.Director:getOpenGLView()
    if glview then
        glview:setIMEKeyboardState(false)
    end

    local ManualService996Proxy = global.Facade:retrieveProxy(global.ProxyTable.ManualService996Proxy)
    ManualService996Proxy:SetWebOpenState(false)
    ManualService996Proxy:RemoveCheck()
end

return ManualService996Layer