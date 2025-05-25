local BaseLayer = requireLayerUI("BaseLayer")
local TradingBankBuyAllyLayer = class("TradingBankBuyAllyLayer", BaseLayer)
local QuickCell = requireUtil("QuickCell")
local cjson = require("cjson")
local moneyData
function TradingBankBuyAllyLayer:ctor()
    TradingBankBuyAllyLayer.super.ctor(self)
    self.TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
    self.TradingBankLookPlayerProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankLookPlayerProxy)
end

function TradingBankBuyAllyLayer.create(...)
    local ui = TradingBankBuyAllyLayer.new()
    if ui and ui:Init(...) then
        return ui
    end

    return nil
end
function TradingBankBuyAllyLayer:Init()
    local path = GUI:LoadInternalExport(self, "trading_bank/trading_bank_buy_all")
    self._root = ui_delegate(self)
    self.m_page = 1
    self.m_maxpage = 1
    self.m_pagenum = 10
    self.m_data = {}
    self.m_selType = 1
    self.m_order_price = nil
    self.m_unit_price  = nil
    self.m_order_level = nil
    self._root.Panel_item_equip:setVisible(false)
    self._root.Panel_item_role:setVisible(false)
    self._root.Panel_item_money:setVisible(false)
    self:InitUI()
    self.m_reqState = true
    --获取全部商品列表
    local val = {
        type = 0,
        page = self.m_page,
        pagenum = self.m_pagenum
    }
    self:ReqgetGoodsInfo(val, handler(self, self.refListView))

    return true
end
function TradingBankBuyAllyLayer:InitUI()
    self._root.ListView_2:addScrollViewEventListener(function(sender, event)
        local itemnum = #sender:getItems()
        local Bottomitem = sender:getBottommostItemInCurrentView()
        local lastitem = sender:getItem(itemnum - 1)
        if (event == 1 or (event == 10 and lastitem == Bottomitem)) and self.m_page < self.m_maxpage and not self.m_reqState then
            local val = {
                type           = 0,
                page           = self.m_page + 1,
                pagenum        = self.m_pagenum
            }
            self:ReqgetGoodsInfo(val, handler(self, self.refListView))
        end
    end)
end
function TradingBankBuyAllyLayer:ReqgetGoodsInfo(val, func)
    self.m_reqState = true
    self.TradingBankProxy:getGoodsInfo(self, val, func)
end
function TradingBankBuyAllyLayer:refListView(success, response, code)
    dump({ success, response, code }, "all_refListView__")
    self.m_reqState = false
    if success then
        local data = cjson.decode(response)
        if data.code == 200 then
            data = data.data
            self.m_page = data.current_page
            self.m_maxpage = data.last_page
            local listdata = data.data or {}
            dump(listdata, "all_listdata__")
            local lastIndex = #self._root.ListView_2:getItems() - 1
            for i, v in ipairs(listdata) do
                local cell_data = {}
                cell_data.wid = 612
                cell_data.hei = 85
                cell_data.anchor = cc.p(0.5, 1)
                cell_data.tick_interval = 0.05
                cell_data.createCell = function()
                    local cell = self:createItem(v)
                    return cell
                end
                local item = QuickCell:Create(cell_data)
                self._root.ListView_2:pushBackCustomItem(item)
            end
            self._root.ListView_2:jumpToItem(lastIndex, cc.p(0, 0), cc.p(0, 0))
        end
    end
end

function TradingBankBuyAllyLayer:createItem(data)
    local item = nil
    if data and data.type == 1 then --角色
        item = self._root.Panel_item_role:cloneEx()
        item:setVisible(true)
        local jobid = data.role_config_id or 0 -- 0-2 战法道
        jobid = tonumber(jobid)
        local sex = data.sex or 0 -- 0-1 男女
        local jobName = GET_STRING(600000111 + jobid)
        local ui = ui_delegate(item)
        local Image_item = item:getChildByName("Image_item")
        local Text_name = item:getChildByName("Text_name")
        local Text_job = item:getChildByName("Text_job")
        local Text_level = item:getChildByName("Text_level")
        local Text_pirce = item:getChildByName("Text_pirce")
        local Button_buy = item:getChildByName("Button_buy")
        local Image_head = Image_item:getChildByName("Image_head")
        Image_head:loadTexture(global.MMO.PATH_RES_PRIVATE .. "trading_bank/img_0" .. (sex + 1) .. (jobid + 1) .. ".png")
        Text_name:setString(data.role or "")
        Text_job:setString(jobName)
        Text_level:setString(data.role_level or "0")
        Text_pirce:setString(data.price or "0")
        item.roleData = data
        item:setTouchEnabled(true)
        item:addTouchEventListener(function(sender, type)
            if type ~= 2 then
                return
            end
    
            self.TradingBankLookPlayerProxy:RequestPlayerData(data.role_id, function()
                local TradingBankBuyRoleLayerMediator = global.Facade:retrieveMediator("TradingBankBuyRoleLayerMediator")
                if not TradingBankBuyRoleLayerMediator._layer then
                    return
                end
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPlayerInfo_Open, { position = cc.p(150, 60),data = data })
            end)
    
        end)
        Button_buy:addTouchEventListener(function(sender, type)
            if type ~= 2 then
                return
            end
            local callback = function()
                local data = {}
                data.txt = GET_STRING(600000192)--
                data.btntext = { GET_STRING(600000139), GET_STRING(600000193) }
                data.callback = function(res)
                    if res == 1 then
                        self._root.ListView_2:removeAllChildren()
                        local seltype = {[1] = nil, [2] = 0, [3] = 1, [4] = 2 }
                        self.m_page = 1
                        local val = {
                            type = 0,
                            page = self.m_page,
                            pagenum = self.m_pagenum
                        }
                        self:ReqgetGoodsInfo(val, handler(self, self.refListView))
                    elseif res == 2 then
                        global.gameWorldController:OnGameLeaveWorld()
                    end
                end
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, data)
            end
    
            self:reqcommodityInfoRole({ data = data, callback = callback, role_id = data.role_id })
    
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyClick)
        end)
        
        if not global.isWindows and data.bargain_switch == 1 then 
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            ui.Button_bargain:addClickEventListener(function()
                local isBoxLogin = global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") == 1
                local isBoxOpen  = isBoxLogin and not global.BoxLaunchExternal
                local tipsData = {}
                tipsData.title =  GET_STRING(600000904)
                tipsData.btntext = { GET_STRING(600000901) }
                tipsData.notcancel = true
                if isBoxOpen then
                    if compareBoxVersion("3.8.0") < 0 then 
                        ShowSystemTips(GET_STRING(600001016))
                        return 
                    end
                    tipsData.txt = GET_STRING(600000905)
                    tipsData.btntext[2] = GET_STRING(600000902)
                    tipsData.btnFontSize = {16, 16}
                else
                    tipsData.txt = GET_STRING(600000906)
                    tipsData.btntext[2] = GET_STRING(600000903)
                    tipsData.btnFontSize = {16, 16}
                end
                
                tipsData.callback = function(res)
                    if res == 2 then
                        if isBoxOpen then 
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToBoxClick)
    
                            local LoginProxy = global.Facade:retrieveProxy(global.ProxyTable.Login)
                            local server_id   = tonumber(LoginProxy:GetSelectedServerId())
                            local server_name = LoginProxy:GetSelectedServerName()
                            local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
                            NativeBridgeProxy:GN_GoToCommondity({
                                id = data.id,
                                server_id = server_id,
                                server_name = server_name
                            })
                            
                        else
                            local Box996Proxy = global.Facade:retrieveProxy(global.ProxyTable.Box996Proxy)
                            Box996Proxy:getBox996DownloadURL(5)
    
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToDownClick)
                        end 
                    elseif res == 1 then --取消
                        TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainCancelClick)
                    end
                end
                
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, tipsData)
    
                TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainClick)
            end)
        else 
            ui.Button_bargain:setVisible(false)
            ui.Button_buy:setPositionX(ui.Button_buy:getPositionX() + 30)
        end
    elseif data and data.type == 2 then --货币
        item = self._root.Panel_item_money:cloneEx()
        item:setVisible(true)
        -- local jobid = data.role_config_id or 0
        -- jobid = tonumber(jobid)
        -- local jobName =  GET_STRING(600000111+jobid)
        local ui = ui_delegate(item)
        local Image_item = item:getChildByName("Image_item")
        local Text_type = item:getChildByName("Text_num_2")
        local Text_goodname = item:getChildByName("Text_goodname")
        local Text_single = item:getChildByName("Text_single")
        local Text_num = item:getChildByName("Text_num")
        local Text_pirce = item:getChildByName("Text_pirce")
        local Button_buy = item:getChildByName("Button_buy")
        --local Image_head = Image_item:getChildByName("Image_head")
        Text_type:setString(data.type_ch or "")
        Text_goodname:setString(data.coin_config_type_name or "")
        Text_single:setString(data.single_price or "")
        Text_pirce:setString(data.price or "0")
        local count = self.TradingBankProxy:addNewLine(data.commodity_detail or data.coin_num or "0")
        
        Text_num:setString(count)
    
        -- GUI:Text_setMaxLineWidth(Text_num, 80)
        --Image_head:loadTexture(global.MMO.PATH_RES_PRIVATE.."trading_bank/img_cost.png")
        local call = function(...)
            self._root.ListView_2:removeAllChildren()
            self.m_page = 1
            local coin_id
            if self.m_selType ~= 1 then
                coin_id = moneyData[self.m_selType - 1].id
            end
            local val = {
                type = 0,
                page = self.m_page,
                pagenum = self.m_pagenum
            }
            self:ReqgetGoodsInfo(val, handler(self, self.refListView))
        end
        Button_buy:addTouchEventListener(function(sender, type)
            if type ~= 2 then
                return
            end
            --global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCostZFLayer_Open,{data = data,callback = call})
            self:reqcommodityInfoMoney({ data = data, callback = call })
    
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyClick)
        end)
        
        if not global.isWindows and data.bargain_switch == 1 then 
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            ui.Button_bargain:addClickEventListener(function()
                local isBoxLogin = global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") == 1
                local isBoxOpen  = isBoxLogin and not global.BoxLaunchExternal
                local tipsData = {}
                tipsData.title =  GET_STRING(600000904)
                tipsData.btntext = { GET_STRING(600000901) }
                tipsData.notcancel = true
                if isBoxOpen then
                    if compareBoxVersion("3.8.0") < 0 then 
                        ShowSystemTips(GET_STRING(600001016))
                        return 
                    end
                    tipsData.txt = GET_STRING(600000905)
                    tipsData.btntext[2] = GET_STRING(600000902)
                    tipsData.btnFontSize = {16, 16}
                else
                    tipsData.txt = GET_STRING(600000906)
                    tipsData.btntext[2] = GET_STRING(600000903)
                    tipsData.btnFontSize = {16, 16}
                end
                
                tipsData.callback = function(res)
                    if res == 2 then
                        if isBoxOpen then 
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToBoxClick)
                            
                            local LoginProxy = global.Facade:retrieveProxy(global.ProxyTable.Login)
                            local server_id   = tonumber(LoginProxy:GetSelectedServerId())
                            local server_name = LoginProxy:GetSelectedServerName()
                            local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
                            NativeBridgeProxy:GN_GoToCommondity({
                                id = data.id,
                                server_id = server_id,
                                server_name = server_name
                            })
    
                        else
                            local Box996Proxy = global.Facade:retrieveProxy(global.ProxyTable.Box996Proxy)
                            Box996Proxy:getBox996DownloadURL(5)
                            
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToDownClick)
                        end 
                    elseif res == 1 then --取消
                        TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainCancelClick)
                    end
                end
                
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, tipsData)
    
                TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainClick)
            end)
        else 
            ui.Button_bargain:setVisible(false)
            ui.Button_buy:setPositionX(ui.Button_buy:getPositionX() + 30)
        end
    elseif data and data.type == 3 then --装备
        item = self._root.Panel_item_equip:cloneEx()
        item:setVisible(true)
        local ui = ui_delegate(item)
        local ItemConfigProxy = global.Facade:retrieveProxy(global.ProxyTable.ItemConfigProxy)
        local itemData =  ItemConfigProxy:GetItemDataByIndex(data.equip_id)
        local goodparam = {index = data.equip_id}
        if data.equip_num and data.equip_num > 1 then 
            goodparam.count = data.equip_num
        end
        local goodsItem = GoodsItem:create(goodparam)
        ui.Image_item:addChild(goodsItem)
        local size = ui.Image_item:getContentSize()
        goodsItem:setPosition(size.width/2, size.height/2)
        goodsItem:addTouchEventListener(function()--点击tips
            self._tipsIndex = self.TradingBankProxy:GetTipsIndex() 
            self._tipsPos = ui.Image_item:getWorldPosition()
            self.TradingBankProxy:ReqQueryItemData(data.id, self._tipsIndex)
        end, 2)
        local color = (itemData.Color and itemData.Color > 0) and itemData.Color or 255
        local name = itemData.Name or ""
        -- 道具名字
        ui.Text_name:setString(name)
        ui.Text_name:setTextColor(SL:GetColorByStyleId(color))
        --价格
        ui.Text_price:setString(data.price or 0)
        --单价
        ui.Text_single:setString(data.single_price or "")
        --数量
        ui.Text_num:setString(data.equip_num or "")
        --类型
        ui.Text_num_2:setString(data.equip_type_ch or "")
    
        ui.Button_buy:addClickEventListener(function()
            local callback = function(...)
                self._order_price = nil
                self._order_num = nil
                self._page = 1
                self._max_page = 1
                self._root.ListView_2:removeAllItems()
                local val = {
                    type = 0,
                    page = self._page,
                    pagenum = self._page_num
                }
                self:ReqgetGoodsInfo(val, handler(self, self.RefListView))
            end
    
            self:ReqcommodityInfoEquip({ data = data, callback = callback, role_id = data.role_id })
    
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyClick)
        end)
    
        if not global.isWindows and data.bargain_switch == 1 then 
            local TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)
            ui.Button_bargain:addClickEventListener(function()
                local isBoxLogin = global.L_GameEnvManager:GetEnvDataByKey("isBoxLogin") == 1
                local isBoxOpen  = isBoxLogin and not global.BoxLaunchExternal
                local tipsData = {}
                tipsData.title =  GET_STRING(600000904)
                tipsData.btntext = { GET_STRING(600000901) }
                tipsData.notcancel = true
                if isBoxOpen then
                    if compareBoxVersion("3.8.0") < 0 then 
                        ShowSystemTips(GET_STRING(600001016))
                        return 
                    end
    
                    tipsData.txt = GET_STRING(600000905)
                    tipsData.btntext[2] = GET_STRING(600000902)
                    tipsData.btnFontSize = {16, 16}
                else
                    tipsData.txt = GET_STRING(600000906)
                    tipsData.btntext[2] = GET_STRING(600000903)
                    tipsData.btnFontSize = {16, 16}
                end
                
                tipsData.callback = function(res)
                    if res == 2 then
                        if isBoxOpen then 
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToBoxClick)
                            
                            local LoginProxy = global.Facade:retrieveProxy(global.ProxyTable.Login)
                            local server_id   = tonumber(LoginProxy:GetSelectedServerId())
                            local server_name = LoginProxy:GetSelectedServerName()
                            local NativeBridgeProxy = global.Facade:retrieveProxy( global.ProxyTable.NativeBridgeProxy )
                            NativeBridgeProxy:GN_GoToCommondity({
                                id = data.id,
                                server_id = server_id,
                                server_name = server_name
                            })
                        else
                            local Box996Proxy = global.Facade:retrieveProxy(global.ProxyTable.Box996Proxy)
                            Box996Proxy:getBox996DownloadURL(5)
    
                            TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainToDownClick)
                        end 
                    elseif res == 1 then --取消
                        TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainCancelClick)
                    end
                end
                
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, tipsData)
    
                TradingBankProxy:doTrack(TradingBankProxy.UpLoadData.TraingBuyBargainClick)
                
            end)
        else 
            ui.Button_bargain:setVisible(false)
            ui.Button_buy:setPositionX(ui.Button_buy:getPositionX() + 30)
        end
    end
    

    return item
end

function TradingBankBuyAllyLayer:reqcommodityInfoRole(val)
    dump(val, "val___")
    self.TradingBankProxy:reqcommodityInfo(self, { commodity_id = val.data.id }, function(success, response, code)
        if success then
            local data = cjson.decode(response)
            if data.code == 200 then
                data = data.data
                -- local order_id = data.order_id
                -- self._order_id = order_id
                if data.status and data.status == 3 then--已出售
                    local data = {}
                    data.txt = GET_STRING(600000185)--
                    data.btntext = { GET_STRING(600000139) }
                    data.callback = function()
                    end
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, data)
                else
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankZFPlayerLayer_Open, { data = data, callback = val.callback, role_id = val.role_id })
                end
            elseif data.code >= 50000 and data.code <= 50020 then--token失效
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPhoneLayer_Open, { callback = function(code)
                    if code == 1 then
                        self:reqcommodityInfoRole(val)
                    else
                        -- global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankGoodsLayer_Close)
                    end
                end })
            else
                global.Facade:sendNotification(global.NoticeTable.SystemTips, data.msg or "")
            end
        else
            global.Facade:sendNotification(global.NoticeTable.SystemTips, GET_STRING(600000137))
        end
    end)
end

function TradingBankBuyAllyLayer:reqcommodityInfoMoney(val)
    dump(val, "val___")
    self.TradingBankProxy:reqcommodityInfo(self, { commodity_id = val.data.id }, function(success, response, code)
        if success then
            local data = cjson.decode(response)
            if data.code == 200 then
                data = data.data
                -- local order_id = data.order_id
                -- self._order_id = order_id
                if data.status and data.status == 3 then--已出售
                    local data = {}
                    data.txt = GET_STRING(600000185)--
                    data.callback = function()
                    end
                    data.btntext = { GET_STRING(600000139) }
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, data)
                else
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCostZFLayer_Open, { data = data, callback = val.callback })
                end
            elseif data.code >= 50000 and data.code <= 50020 then--token失效
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPhoneLayer_Open, { callback = function(code)
                    if code == 1 then
                        self:reqcommodityInfoMoney(val)
                    else
                        -- global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankGoodsLayer_Close)
                    end
                end })
            else
                global.Facade:sendNotification(global.NoticeTable.SystemTips, data.msg or "")
            end
        else
            global.Facade:sendNotification(global.NoticeTable.SystemTips, GET_STRING(600000137))
        end
    end)
end

function TradingBankBuyAllyLayer:ReqcommodityInfoEquip(val)
    dump(val, "val___")
    self.TradingBankProxy:reqcommodityInfo(self, { commodity_id = val.data.id }, function(success, response, code)
        if success then
            local data = cjson.decode(response)
            if data.code == 200 then
                data = data.data
                if data.status and data.status == 3 then--已出售
                    local data = {}
                    data.txt = GET_STRING(600000185)--
                    data.callback = function()
                    end
                    data.btntext = { GET_STRING(600000139) }
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open, data)
                else
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCostZFLayer_Open, { data = data, callback = val.callback })
                end
            elseif data.code >= 50000 and data.code <= 50020 then--token失效
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPhoneLayer_Open, { callback = function(code)
                    if code == 1 then
                        self:ReqcommodityInfoEquip(val)
                    else
                
                    end
                end })
            else
                ShowSystemTips(data.msg or "")
            end
        else
            ShowSystemTips(GET_STRING(600000137))
        end
    end)
end
function TradingBankBuyAllyLayer:exitLayer()
    self.TradingBankProxy:removeLayer(self)
end

return TradingBankBuyAllyLayer