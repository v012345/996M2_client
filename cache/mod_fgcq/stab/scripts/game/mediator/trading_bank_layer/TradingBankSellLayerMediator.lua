local BaseUIMediator        = requireMediator("BaseUIMediator")
local TradingBankSellLayerMediator = class('TradingBankSellLayerMediator', BaseUIMediator)
TradingBankSellLayerMediator.NAME = "TradingBankSellLayerMediator"

function TradingBankSellLayerMediator:ctor()
    TradingBankSellLayerMediator.super.ctor(self)
end

function TradingBankSellLayerMediator:listNotificationInterests()
    local noticeTable = global.NoticeTable
    return {
        noticeTable.Layer_TradingBankSellLayer_Open,
        noticeTable.Layer_TradingBankSellLayer_Close,
        noticeTable.Layer_Box996SVIP_Refresh,
        noticeTable.Layer_TradingBankSellLayer_RefGoodList,
        noticeTable.QuickUseItemAdd,
        noticeTable.QuickUseItemRefresh,
        noticeTable.QuickUseItemRmv,
        noticeTable.Bag_Oper_Data,
        noticeTable.Layer_TradingBankBuyEquip_Tips,
    }
end

function TradingBankSellLayerMediator:handleNotification(notification)
    local noticeName    = notification:getName()
    local noticeTable   = global.NoticeTable
    local noticeData    = notification:getBody()
    if noticeTable.Layer_TradingBankSellLayer_Open == noticeName then
        self:OpenLayer(noticeData)
    elseif noticeTable.Layer_TradingBankSellLayer_Close == noticeName then
        self:CloseLayer()
    elseif noticeTable.Layer_Box996SVIP_Refresh == noticeName then
        self:OnRefresh(noticeData)
    elseif noticeTable.Layer_TradingBankSellLayer_RefGoodList == noticeName then 
        self:OnRefGoodList()
    elseif noticeTable.Bag_Oper_Data == noticeName
    or noticeTable.QuickUseItemAdd == noticeName
    or noticeTable.QuickUseItemRmv == noticeName
    or noticeTable.QuickUseItemRefresh == noticeName then
        self:OnUpdateBag()
    elseif noticeTable.Layer_TradingBankBuyEquip_Tips == noticeName then
        self:OnTips(noticeData)
    end
end

function TradingBankSellLayerMediator:OpenLayer(Data)
    if not (self._layer) then
        self._layer = requireLayerUI("trading_bank_layer/TradingBankSellLayer").create()
        Data.parent:addChild(self._layer)
    end
end

function TradingBankSellLayerMediator:CloseLayer()
    if not self._layer then
        return
    end
    self._layer:ExitLayer()
    self._layer:removeFromParent()
    self._layer = nil
end

function TradingBankSellLayerMediator:OnRefresh(data)
    if self._layer then
        self._layer:OnRefreshSVIPTitle(data)
    end
end

function TradingBankSellLayerMediator:OnTips(data)
    if not self._layer then
        return
    end
    self._layer:OnTips(data)
end

function TradingBankSellLayerMediator:OnRefGoodList(data)
    if self._layer then
        self._layer:ReqgetEquipGoodsInfo(data)
    end
end

function TradingBankSellLayerMediator:OnUpdateBag(data)
    if self._layer then
        self._layer:UpdateBag(data)
    end
end

return TradingBankSellLayerMediator