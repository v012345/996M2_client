local BaseLayer = requireLayerUI("BaseLayer")
local TradingBankCostZFPanel = class("TradingBankCostZFPanel", BaseLayer)
local cjson = require("cjson")
local utf8 = require("util/utf8")

function TradingBankCostZFPanel:ctor()
    TradingBankCostZFPanel.super.ctor(self)
    self.OtherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
    self.LoginProxy    = global.Facade:retrieveProxy(global.ProxyTable.Login)
    self.AuthProxy = global.Facade:retrieveProxy(global.ProxyTable.AuthProxy)
end
local payChannel = {
    "ALIPAY",
    "HUABEI",
    "ALIPAY_EWM"
}
local BuyType = {
    ORDER = 1,
    PAY = 2,
}
local payMax = 3
local getTimeStr = function (s)
    return string.format("%.2d:%.2d", s/60, s%60)
end
function TradingBankCostZFPanel.create(...)
    local ui = TradingBankCostZFPanel.new()
    if ui and ui:Init(...) then
        return ui
    end
    return nil
end

function TradingBankCostZFPanel:Init(data)
    local path = GUI:LoadInternalExport(self, "trading_bank_other/trading_bank_cost_zf_panel")
    self._root = ui_delegate(self)
    self.m_goodsData = data.goodsData
    -- self.m_orderData = data.orderData
    self.m_callback = data.callback
    self:InitUI()
    return true
end
function TradingBankCostZFPanel:InitUI()
    self._root.Text_money:setString(self.m_goodsData.coinConfigTypeName .. ":" .. self.m_goodsData.coinNum)
    self._root.Text_name:setString(GET_STRING(600000157) .. ":" .. self.m_goodsData.role)
    local price = self.m_goodsData.price or 0
    self._root.Text_serverName:setString(utf8:show_sub(self.m_goodsData.serverName, 1, 16))
    self._root.Text_account:setString(utf8:show_sub(self.AuthProxy:GetUsername(), 1, 16))
    self._root.Text_serverName:getVirtualRenderer():setMaxLineWidth(152)
    self._root.Text_account:getVirtualRenderer():setMaxLineWidth(152)
    self._root.Text_money1:setString("￥" .. price)
    for i = 1, payMax do
        local btn = self._root["Panel_pay" .. i]
        btn:setTag(i)
        btn:addTouchEventListener(handler(self, self.onButtonClick))
    end
    self._initPayType = 1
    self.platform = global.isAndroid and "game_ad" or "game_ios"

    self._root.ButtonClose:addTouchEventListener(handler(self, self.onBtnClick))
    self._root.Button_buy:addTouchEventListener(handler(self, self.onBtnClick))

    -- self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)

    -- self._order_id = self.m_orderData.id
    -- self._root.Text_time:stopAllActions()
    -- schedule(self._root.Text_time, function(sender)
    --     self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)
    --     sender:setString(self._time .. "S")
    --     if self._time <= 0 then
    --         self.OtherTradingBankProxy:reqCancelorder(self, { order_id = self._order_id }, handler(self, self.resCancelorder))
    --     end
    -- end, 1)
    self._root.Text_time:stopAllActions()
    self._root.Text_time:setVisible(false)
    self._root.Text_time_desc:setVisible(true)
    self._root.Text_time_desc2:setVisible(false)
    self._root.Text_time_desc3:setVisible(false)
    self._buyType = BuyType.ORDER
    self:setSelPayType(self._initPayType)


    ------协议
    local RichTextHelp = requireUtil("RichTextHelp")
    local pstr = self.OtherTradingBankProxy.PrivacyPolicyList
    local PrivacyPolicyStr = string.format(GET_STRING(600000658), pstr[1], pstr[2], pstr[3], pstr[4], pstr[5])

    local PrivacyPolicy = RichTextHelp:CreateRichTextWithXML(PrivacyPolicyStr, 600, 15)
    self._root.Panel_agreement:addChild(PrivacyPolicy)
    PrivacyPolicy:setAnchorPoint(0, 1)
    PrivacyPolicy:setPosition(26, 90)
    PrivacyPolicy:setOpenUrlHandler(function(sender, url)
        cc.Application:getInstance():openURL(url)
    end)
    self._root.CheckBox:setSelected(self:getAgreement())
    self._root.Panel_agreement:addClickEventListener(function(sender, type)--协议
        self._root.CheckBox:setSelected(not self._root.CheckBox:isSelected())
        self:saveAgreement()
    end)

    --检测是否自己下单
    self._root.Button_buy:setVisible(false)
    self:commodityIsMyOrder()
end

function TradingBankCostZFPanel:commodityIsMyOrder()
    self.OtherTradingBankProxy:commodityIsMyOrder(self,{commodityId = tonumber(self.m_goodsData.id)},function (code ,data ,msg)
        if code == 200 then 
            self._root.Button_buy:setVisible(true)
            if data then 
                self.m_orderData = data
                self._order_id = self.m_orderData.id
                self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)
                
                self._root.Text_time:stopAllActions()
                self._root.Text_time:setVisible(true)
                self._root.Text_time_desc2:setVisible(true)
                self._root.Text_time_desc3:setVisible(true)
                self._root.Text_time_desc:setVisible(false)
                schedule(self._root.Text_time, function(sender)
                    self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)
                    sender:setString(self._time)
                    if self._time <= 0 then
                        self.OtherTradingBankProxy:reqCancelorder(self, { order_id = self._order_id }, handler(self, self.resCancelorder))
                        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPowerfulLayer_Close_other)
                    end
                end, 1)
                self._root.Text_time:setString(self._time)
                self._root.Button_buy:setTitleText(GET_STRING(600000662))

                self._buyType = BuyType.PAY
            end
        elseif code == 40050 then --锁定中
            self._root.Button_buy:setVisible(true)
        else
            ShowSystemTips(msg or GET_STRING(600000137))
        end      
    end)
end 

function TradingBankCostZFPanel:reqpayOrder()
    local val = {   
                    payinfo = { 
                        order_id = self._order_id, 
                        channel = self._payChannel, 
                        client_type = self.platform, 
                        price = self.m_orderData.totalAmount , 
                        commodityType = "money",
                        count = self.m_goodsData.coinNum,
                        commodityID = self.m_goodsData.id,
                        commodityName = self.m_goodsData.coinConfigTypeName
                    },
                    callback = self.m_callback
                }
    if self._payChannel == "ALIPAY" or self._payChannel == "HUABEI" then--支付宝H5
        val.type = 2
    elseif self._payChannel == "ALIPAY_EWM" then 
        val.type = 1
    end
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPowerfulLayer_Open_other,val)
end

function TradingBankCostZFPanel:resCancelorder(code, data, msg)
    dump({ code, data, msg }, "resCancelorder___")
    if code == 200 then
    else
        ShowSystemTips(msg)
    end
    self:CloseLayer()
end

function TradingBankCostZFPanel:onBtnClick(sender, type)
    if type ~= 2 then
        return
    end
    local name = sender:getName()
    if name == "ButtonClose" then
        --self.OtherTradingBankProxy:reqCancelorder(self, { order_id = self._order_id }, handler(self, self.resCancelorder))
        --v1.1关闭不取消订单
        self:CloseLayer()
    elseif name == "Button_buy" then
        if not self._root.CheckBox:isSelected() then 
            ShowSystemTips(GET_STRING(600000652))
            return 
        end
        --下单 
        if self._buyType == BuyType.ORDER then
            local function checkAuthentication()
                self.OtherTradingBankProxy:checkAuthentication(self,function(code, data, msg)
                    dump({code, data, msg}, "实名认证")
                    if code == 200 then
                        if data then
                            self.OtherTradingBankProxy:reqcommodityInfo(self, { commodity_id = self.m_goodsData.id }, function(code, data, msg)
                                if code == 200 then
                                    dump(data,"商品信息")
                                    local mainServerId = self.LoginProxy:GetMainSelectedServerId()
                                    local goodMainServerId =  tonumber(data.mainServerId)
                                    local sameServer = false
                                    if mainServerId and goodMainServerId then 
                                        if  mainServerId == goodMainServerId then 
                                            sameServer = true 
                                        end
                                    else
                                        if tonumber(self.LoginProxy:GetSelectedServerId()) == tonumber(data.serverId) then 
                                            sameServer = true 
                                        end
                                    end

                                    if not sameServer then 
                                        local params = {}
                                        params.type = 1
                                        params.btntext = {GET_STRING(600000653),GET_STRING(600000704)}
                                        params.text = string.format(GET_STRING(600000705), self.m_goodsData.serverName or "") 
                                        params.titleImg = global.MMO.PATH_RES_PRIVATE .. "trading_bank_other/img_tips.png"
                                        params.callback = function(res)
                                            if res == 1 or res == 2 or res == 3 then
                                                if res == 2 then 
                                                    self:reqOrderPlace()
                                                end
                                                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Close_other)
                                            end
                                        end
                                        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Open_other, params)
                                    else 
                                        self:reqOrderPlace()
                                    end
                                else
                                    ShowSystemTips(msg)
                                end
                            end)
                        else
                            local params = {}
                            params.type = 1
                            params.btntext = {GET_STRING(600000653),GET_STRING(600000654)}
                            params.text = GET_STRING(600000655)
                            params.titleImg = global.MMO.PATH_RES_PRIVATE .. "trading_bank_other/img_tips.png"
                            params.callback = function(res)
                                if res == 1 or res == 2 or res == 3 then
                                    if res == 2 then 
                                        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankBindIdentityLayer_Open_other)
                                    end
                                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Close_other)
                                end
                            end
                            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Open_other, params)
                        end
                    end
                end)
            end
            --检测绑定手机
            self.OtherTradingBankProxy:checkBindPhone(self,{}, function (code, data, msg)
                dump({code, data, msg},"checkBindPhone__")
                if code  == 200 then 
                    if data then 
                        checkAuthentication()
                    else
                        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPhoneLayer_Open_other, { callback = function(code)
                            if code == 1 then--手机绑定成功 --自动开启寄售锁
                                checkAuthentication()
                            end
                        end})
                    end
                else
                    ShowSystemTips(msg)
                end
            end)
        else 
        --支付
            self.OtherTradingBankProxy:doTrack(self.OtherTradingBankProxy.UpLoadData.TraingBuyLayerOKBtnClick)
            self:reqpayOrder()
        end
    end
end
--下单
function TradingBankCostZFPanel:reqOrderPlace()
    local val = {}
    val.callback = function(res)
    end
    val.showPayTips = true
    val.notcancel = true
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open_other, val)
    self.OtherTradingBankProxy:reqOrderPlace(self, { commodity_id = self.m_goodsData.id }, handler(self, self.resOrderPlace))--下单
end


function TradingBankCostZFPanel:resOrderPlace(code, data, msg)
    dump({ code, data, msg }, "resOrderPlace___")
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close_other)
    if code == 200 then
        self.OtherTradingBankProxy:doTrack(self.OtherTradingBankProxy.UpLoadData.TraingCreateOrder,
                    {
                        properities = {
                            amount = string.format("%0.2f元",self.m_goodsData.price),
                            prodid = self.m_goodsData.id,
                            prod_name = self.m_goodsData.coinConfigTypeName
                        }
                    })
        ----下单成功
        self.m_orderData = data
        self._order_id = self.m_orderData.id
        self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)
        self._root.Text_time:stopAllActions()
        self._root.Text_time:setVisible(true)
        self._root.Text_time_desc2:setVisible(true)
        self._root.Text_time_desc3:setVisible(true)
        self._root.Text_time_desc:setVisible(false)
        schedule(self._root.Text_time, function(sender)
            self._time = math.max(self.m_orderData.expireTime - GetServerTime(), 0)
            sender:setString(self._time.."S")
            if self._time <= 0 then
                self.OtherTradingBankProxy:reqCancelorder(self, { order_id = self._order_id }, handler(self, self.resCancelorder))
            end
        end, 1)
        self._root.Text_time:setString(self._time.."S")
        self._root.Button_buy:setTitleText(GET_STRING(600000662))

        self._buyType = BuyType.PAY
    elseif code == 40050 then --锁定中
        local data = {}
        data.txt = GET_STRING(600000804)--
        data.lockTime = msg
        data.callback = function()
        end
        data.btntext = {}
        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open_other, data)
    elseif code == 40002 then --不买自己的商品
        local data = {}
        data.txt = GET_STRING(600000404)--
        data.callback = function()
        end
        data.btntext = {}
        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Open_other, data)
    else
        ShowSystemTips(msg)
    end
end

function TradingBankCostZFPanel:onButtonClick(sender, type)
    if type ~= 2 then
        return
    end
    local tag = sender:getTag()
    self:setSelPayType(tag)
end

--1支付宝   2花呗
function TradingBankCostZFPanel:setSelPayType(index)
    for i = 1, payMax do
        local btn = self._root["Panel_pay" .. i]
        local Image_1 = UIGetChildByName(btn, "Image_2", "Image_1")
        Image_1:setVisible(i == index)
    end
    self.m_selType = index
    self._payChannel = payChannel[index]
end

----协议
function TradingBankCostZFPanel:saveAgreement()
    local mainPlayerID = self.LoginProxy:GetSelectedRoleID()
    local path    = "TradingBank" .. mainPlayerID
    local key    = "PrivacyPolicyAgreement"
    local userData = UserData:new(path)

    local writeData = { agree = self._root.CheckBox:isSelected() and 1 or 0 }
    local jsonStr = cjson.encode(writeData)
    userData:setStringForKey(key, jsonStr)
end

function TradingBankCostZFPanel:getAgreement()
    local mainPlayerID = self.LoginProxy:GetSelectedRoleID()
    local path    = "TradingBank" .. mainPlayerID
    local key    = "PrivacyPolicyAgreement"
    local userData = UserData:new(path)
    local jsonStr = userData:getStringForKey(key, "")
    if not jsonStr or string.len(jsonStr) == 0 then
        return true
    end

    local jsonData = cjson.decode(jsonStr)
    if not jsonData then
        return true
    end
    return jsonData.agree == 1
end

function TradingBankCostZFPanel:CloseLayer()
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCostZFPanel_Close_other)
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankCostZFLayer_Close_other)
    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankPowerfulLayer_Close_other)
end
function TradingBankCostZFPanel:exitLayer()
    self.OtherTradingBankProxy:removeLayer(self)
end
-------------------------------------
return TradingBankCostZFPanel