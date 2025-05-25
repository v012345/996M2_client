local LoadingPlayLayer = class("LoadingPlayLayer", function ()
    return cc.Layer:create()
end)

function LoadingPlayLayer:ctor()

end

function LoadingPlayLayer.create(...)
    local layer = LoadingPlayLayer.new()
    if layer:Init(...) then
        return layer
    end
    return nil
end

function LoadingPlayLayer:Init()
    self._root = CreateExport_launcher("loading/res_loading")
    if not self._root then
        return false
    end
    self:addChild(self._root)
    self.ui = ui_delegate(self._root)

    local visibleSize = cc.Director:getInstance():getVisibleSize()
    self.ui.Panel_pre:setPosition({x = visibleSize.width / 2, y = visibleSize.height / 2 + 60})

    self.ui.Panel_point:removeAllChildren(true)
    self.ui.PageView:removeAllChildren(true)

    self:InitImagePreview()

    return true
end

function LoadingPlayLayer:updatePoint(index)
    for i, v in ipairs(self.ui.Panel_point:getChildren()) do
        self:UpdatePreLoadingPic(v, string.format("res/private/loading/line_%s.png", v:getTag() == index and 2 or 1))
    end
end

function LoadingPlayLayer:addSchedule()
    local callback = function()
        if not self.ui or not self.ui.PageView then
            global.L_LoadingPlayManager:CloseLayer()
            return false
        end
        local index = self.ui.PageView:getCurrentPageIndex()
        if index >= self._nMax - 1 then
            self.ui.PageView:setCurrentPageIndex(0)
            self:updatePoint(0)
        else
            self.ui.PageView:scrollToPage(index + 1)
            self:updatePoint(index + 1)
        end
    end

    self:CloseLayer()
    self._handler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 5, false)
end

function LoadingPlayLayer:CloseLayer()
    if self._handler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self._handler)
    end
end

function LoadingPlayLayer:UpdatePreLoadingPic(ui, path)
    ui:loadTexture(path)
    ui:setVisible(true)
end

function LoadingPlayLayer:InitImagePreview()
    if not global.L_ModuleManager or not global.L_ModuleManager:GetImagePre() then
        return self.ui.Panel_pre:setVisible(false)
    end

    local paths = global.L_ModuleManager:GetImagePre()
    if #paths < 1 then
        return self.ui.Panel_pre:setVisible(false)
    end

    self._nMax = #paths
    local pw   = math.floor(400 / self._nMax)

    local directoryPath = global.FileUtilCtl:getWritablePath()

    for i = 1, self._nMax do
        local item = self.ui.Item:clone()

        local url = paths[i]

        local name = string.format("Preloadiloading_%s.png", i)

        local filename = directoryPath .. name
        
        if global.FileUtilCtl:isFileExist(filename) then
            global.FileUtilCtl:removeFile(filename)
        end

        global.L_GameEnvManager:downloadResEasy(url, name, function(isOK, path)
            if isOK then
                global.L_LoadingPlayManager:UpdatePreLoadingPic(item, path)
            end
        end)

        self.ui.PageView:addPage(item)

        -- 点
        local point = self.ui.Image_point:clone()
        self:UpdatePreLoadingPic(point, "res/private/loading/line_1.png")
        point:setTag(i-1)
        point:setPosition(cc.p(pw * i - pw / 2, 2))

        point:setContentSize({width = pw, height = 4})
        self.ui.Panel_point:addChild(point)
        point:setVisible(true)
    end

    -- 滑动翻页
    self.ui.PageView:addEventListener(function (sender, eventType)
        if eventType == 0 then
            local index = sender:getCurrentPageIndex()
            self:updatePoint(index)
        end
    end)

    self:updatePoint(0)
    
    self.ui.PageView:scrollToPage(0)

    self:addSchedule()

    self.ui.Panel_pre:setVisible(true)
end

return LoadingPlayLayer
