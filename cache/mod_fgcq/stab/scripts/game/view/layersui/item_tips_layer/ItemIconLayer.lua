local BaseLayer = requireLayerUI( "BaseLayer" )
local ItemIconLayer = class( "ItemIconLayer", BaseLayer )

function ItemIconLayer:ctor()
    ItemIconLayer.super.ctor(self)
end

function ItemIconLayer.create(data)
    local layer = ItemIconLayer.new()
    if layer:Init(data) then
        return layer
    else
        return nil
    end
end

function ItemIconLayer:Init()
    return true
end

function ItemIconLayer:InitGUI(data)
    local parent = GUI:Attach_Parent()
    local node = GUI:Widget_Create(parent, "widget_icon", 0, 0)
    GUI:LoadExport(node, "item/item_tips")
    local ui = GUI:ui_delegate(node)

    local itemSize = GUI:getContentSize(ui.tipsLayout)
    local nodeIcon = GUI:Node_Create(ui.tipsLayout, "NodeIcon", itemSize.width / 2, itemSize.height / 2)
	GUI:setAnchorPoint(nodeIcon, 0.50, 0.50)
    local goodsInfo = { itemData = data.itemData, index = data.itemData.Index }
    local goodsItem = GUI:ItemShow_Create(nodeIcon, "goodsItem", 0, 0, goodsInfo)
    GUI:setAnchorPoint(goodsItem, 0.5, 0.5)
    self._CaptureNode = goodsItem
end

return ItemIconLayer