local BaseUIMediator = requireMediator("BaseUIMediator")
local SettingBasicMediator = class('SettingBasicMediator', BaseUIMediator)
SettingBasicMediator.NAME = "SettingBasicMediator"

function SettingBasicMediator:ctor()
    SettingBasicMediator.super.ctor(self)
end

function SettingBasicMediator:listNotificationInterests()
    local noticeTable = global.NoticeTable
    return {
        noticeTable.Layer_SettingBasic_Open,
        noticeTable.Layer_SettingBasic_Close,
    }
end

function SettingBasicMediator:handleNotification(notification)
    local noticeTable = global.NoticeTable
    local name = notification:getName()
    local data = notification:getBody()
    
    if noticeTable.Layer_SettingBasic_Open == name then
        self:OpenLayer(data)
    elseif noticeTable.Layer_SettingBasic_Close == name then
        self:CloseLayer()
    end
end

function SettingBasicMediator:OpenLayer(data)
    if not (self._layer) then
        local path = global.isWinPlayMode and "setting_layer/SettingBasicLayer_win32" or "setting_layer/SettingBasicLayer" 
        self._layer = requireLayerUI(path).create(data)
        data.parent:addChild(self._layer)
        -- for GUI
        GUI.ATTACH_PARENT = self._layer
        self._layer:InitGUI()
        -- 自定义组件挂接
        local componentData = 
        {
            root  = self._layer:GetSUIParent(),
            index = global.SUIComponentTable.SettingBasic
        }
        global.Facade:sendNotification(global.NoticeTable.SUIComponentAttach, componentData)
    end
end

function SettingBasicMediator:CloseLayer()
    if not self._layer then
        return nil
    end
    self._layer:CloseLayer()
    -- 自定义组件挂接
    local componentData = 
    {
        index = global.SUIComponentTable.SettingBasic
    }
    global.Facade:sendNotification(global.NoticeTable.SUIComponentDetach, componentData)
    self._layer:removeFromParent()
    self._layer = nil
end



return SettingBasicMediator
