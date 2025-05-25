local BaseUIMediator = requireMediator( "BaseUIMediator" )
local ItemIconMediator = class("ItemIconMediator", BaseUIMediator)
ItemIconMediator.NAME = "ItemIconMediator"

function ItemIconMediator:ctor()
    ItemIconMediator.super.ctor( self )
end

function ItemIconMediator:listNotificationInterests()
    local noticeTable = global.NoticeTable
    return {
             noticeTable.Layer_ItemIcon_Open,
             noticeTable.Layer_ItemIcon_Close
            }
end

function ItemIconMediator:handleNotification(notification)
    local noticeName    = notification:getName()
    local noticeTable   = global.NoticeTable
    local noticeData    = notification:getBody()
    if noticeTable.Layer_ItemIcon_Open == noticeName then
        self:OpenLayer(noticeData)
    elseif noticeTable.Layer_ItemIcon_Close == noticeName then
        self:CloseLayer()
    end
end

function ItemIconMediator:OpenLayer(noticeData)
    if not (self._layer) then
        local Layer = requireLayerUI( "item_tips_layer/ItemIconLayer" )
        local layer = Layer.create(noticeData)
        self._layer         = layer
        self._type          = global.UIZ.UI_MOUSE
        ssr.GUI.ATTACH_PARENT = self._layer
        GUI.ATTACH_PARENT = self._layer
        self._layer:InitGUI(noticeData)
        ItemIconMediator.super.OpenLayer( self )
    else
        if self._layer then
            self:CloseLayer()
        end
    end
end

function ItemIconMediator:CloseLayer()
    ItemIconMediator.super.CloseLayer( self )
end

return ItemIconMediator