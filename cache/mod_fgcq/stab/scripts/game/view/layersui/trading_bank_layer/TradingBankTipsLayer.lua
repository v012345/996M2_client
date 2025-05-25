local BaseLayer = requireLayerUI("BaseLayer")
local TradingBankTipsLayer = class("TradingBankTipsLayer", BaseLayer)
local cjson = require("cjson")

function TradingBankTipsLayer:ctor()
    TradingBankTipsLayer.super.ctor(self)
    self.TradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.TradingBankProxy)

end

--0点空白区域  1 第一个按钮 2第二个按钮 3 超时
function TradingBankTipsLayer.create(...)
    local ui = TradingBankTipsLayer.new()
    if ui and ui:Init(...) then
        return ui
    end
    return nil
end

function TradingBankTipsLayer:Init(data)
    local path = GUI:LoadInternalExport(self, "trading_bank/trading_bank_tips")
    self._root = ui_delegate(self)
    self:InitAdapt()

    ---init
    self._root.Panel_2:setVisible(false)
    self._root.Text_time:setVisible(false)
    self._root.Text_title:setVisible(false)
    self._root.TextField_4 = (self._root.TextField_4)
    self.TradingBankProxy:cancelEmpty(self._root.TextField_4)

    self._root.TextField_4:onEditHandler(function(event)
        if event.name == "changed" then
            local s = event.target:getString()
            s = string.gsub(s, "%s", "")
            event.target:setString(s)
            if self._root.dickerButton:getChildByName("Text_1"):isVisible() then
                self.minPrice = 0
                self.dickerType = 0
                self._root.dickerButton:getChildByName("Text"):setVisible(true)
                self._root.dickerButton:getChildByName("Text_1"):setVisible(false)
                self._root.dickerButton:getChildByName("Text_2"):setVisible(false)
                local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
                nodeInput:setString("")
            end
        end
    end)
    ------
    self.m_callback = data.callback
    local txt = data.txt
    local time = data.time
    local title = data.title
    local notcancel = data.notcancel
    local onlyTime = data.onlyTime
    local exitTime = data.exitTime
    self._root.Text_txt:setString(txt or "")
    -- txt = self:replaceText(txt)
    self._root.Text_txt = SetRichText(self._root.Text_txt, txt or " ")
    self._root.Text_txt:removeFromParent()
    self._root.ListView_1:pushBackCustomItem(self._root.Text_txt)
    local btnTxt = data.btntext or {}
    local btnFontSize = data.btnFontSize or {}
    local btnfontSize1 = btnFontSize[1] or 20
    local btnfontSize2 = btnFontSize[2] or 20
    if #btnTxt == 1 then
        self._root.Button_2:setVisible(false)
        self._root.Button_1:setPositionX(self._root.Button_1:getPositionX() + 110)
        self._root.Button_1:setTitleText(btnTxt[1])
        self._root.Button_1:setTitleFontSize(btnfontSize1)
    elseif #btnTxt == 2 then
        self._root.Button_1:setTitleText(btnTxt[1])
        self._root.Button_2:setTitleText(btnTxt[2])
        self._root.Button_1:setTitleFontSize(btnfontSize1)
        self._root.Button_2:setTitleFontSize(btnfontSize2)
    end
    if time and time > 0 then
        self._root.Text_time:setVisible(true)
        self._root.Text_time:setString(GET_STRING(600000155) .. time .. "s")
        schedule(self._root.Text_time, function()
            time = time - 1
            if time == -1 then
                local num = self._root.TextField_4:getString()
                if not self.m_callback(3, num) then
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close)
                end
                return
            end
            self._root.Text_time:setString(GET_STRING(600000155) .. time .. "s")
        end, 1)
    end

    if onlyTime and onlyTime > 0 then
        local Text_time = ccui.Text:create()
        Text_time:setFontName("fonts/font2.ttf")
        Text_time:setFontSize(18)
        Text_time:setName("Text_Onlytime")
        Text_time:setTextColor({ r = 255, g = 0, b = 0 })
        Text_time:setString(onlyTime .. "s")
        Text_time:setAnchorPoint(0, 0.5)
        self._root.Text_txt:formatText()
        local size = self._root.Text_txt:getContentSize()
        Text_time:setPosition(cc.p(size.width + 10, size.height / 2))
        Text_time:addTo(self._root.Text_txt)
        schedule(Text_time, function()
            onlyTime = onlyTime - 1
            if onlyTime == 0 then
                local num = self._root.TextField_4:getString()
                if not self.m_callback(3, num) then
                    global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close)
                end
                return
            end
            Text_time:setString(onlyTime .. "s")
        end, 1)
    end


    local price = data.price
    if price then
        self._root.Panel_1:setVisible(false)
        self._root.Panel_2:setVisible(true)
        self._root.Text_2:setString(GET_STRING(600000145) .. price)
    end

    --title
    if title then
        self._root.Text_title:setVisible(true)
        self._root.Text_title:setString(title)
        self._root.Text_txt:setFontSize(16)
        self._root.Text_txt:setPositionY(self._root.Text_txt:getPositionY() - 12)
    end
    if not notcancel then
        self._root.Panel_cancel:addTouchEventListener(function(sender, type)
            if type ~= 2 then
                return
            end
            if self.m_callback then
                self.m_callback(0)
            end
            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close)
        end)
    end
    self._root.Button_1:addTouchEventListener(handler(self, self.onButtonClick))
    self._root.Button_2:addTouchEventListener(handler(self, self.onButtonClick))
    ----寄售成功倒计时
    if exitTime then 
        self._root.ListView_1:removeAllItems()
        local Text_txt = ccui.Text:create()
        Text_txt:setFontName(global.MMO.PATH_FONT2)
        self._root.Panel_1:addChild(Text_txt)
        Text_txt:setPosition(cc.p(260, 161))
        Text_txt:setFontSize(18)
        local color = GetColorFromHexString( "#ffffff" )
        Text_txt:setTextColor(color)
        Text_txt:getVirtualRenderer():setMaxLineWidth(484)
        Text_txt:setAnchorPoint( 0.50, 1.00)
        local OutlineColor = GetColorFromHexString( "#000000" )
        Text_txt:enableOutline(OutlineColor, 1)
        Text_txt:setString(string.format(txt or "",exitTime))
        schedule(Text_txt,function()
            exitTime = exitTime - 1
            if exitTime < 0 then 
                self.m_callback(1)
                return 
            end
            Text_txt:setString(string.format(txt or "",exitTime))

        end,1)
    end

    self.minPrice   = 0
    self.dickerType = 0

    self.title     = data.title or ""
    self.content   = data.content or ""
    self.min_price = data.min_price or ""
    self.rate      = data.rate or ""
    self:InitBargain(self._root.Panel_bargain_role)
    --打开省心模式页面
    self.minInitPrice = 0   --记录推荐价格
    self.autoPrice = 0      --记录自动确定价格
    self._root.dickerButton:addClickEventListener(function()
        if self.autoPrice > 0 and self.dickerType == 1 then
            local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
            nodeInput:setString(tostring(self.autoPrice))
            self._root.Panel_dicker:setVisible(true)
            return
        end
        local newprice = self._root.TextField_4:getString()
        if not self:IsGoodNumber(newprice) then
            global.Facade:sendNotification(global.NoticeTable.SystemTips, GET_STRING(600000116))
            return true
        end
        newprice = tonumber(newprice)
        if newprice > 0 then
            local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
            nodeInput:setString("")

            GUI:setAnchorPoint(self._root.Panel_dicker:getChildByName("Text"),0,0.5)
            GUI:Text_setMaxLineWidth(self._root.Panel_dicker:getChildByName("Text"), 369)
            self._root.Panel_dicker:getChildByName("Text"):setString(self.content)
            local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
            self.minPrice = math.ceil(newprice*self.rate)
            self.minInitPrice = self.minPrice
            GUI:TextInput_setPlaceHolder(nodeInput, "推荐"..self.minPrice.."元")
            self._root.Panel_dicker:setVisible(true)
        end
    end)

     --不开启
     self._root.Panel_dicker:getChildByName("Button"):addClickEventListener(function()
        self.minPrice = 0
        self.dickerType = 0
        self._root.Panel_dicker:setVisible(false)
        self._root.dickerButton:getChildByName("Text"):setVisible(true)
        self._root.dickerButton:getChildByName("Text_1"):setVisible(false)
        self._root.dickerButton:getChildByName("Text_2"):setVisible(false)
    end)

    --开启省心模式
    self._root.Panel_dicker:getChildByName("Button_1"):addClickEventListener(function()

        local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
        local s = nodeInput:getString()
        if s == "" then
            s = tostring(self.minPrice)
        end
        s = string.gsub(s, "%s", "")
        s = string.gsub(s, "[^%d]", "")
        local open = false
        if self:IsDrckerGoodNumber(s) then
            local lastprice = tonumber(s)
            local price = self._root.TextField_4:getString()
            price = tonumber(price)
            if price >= lastprice and lastprice > 0 then
                self.minPrice = lastprice
                open = true
            end
        end
        if self.minPrice > 0 and open then
            self.dickerType = 1
            self.autoPrice = self.minPrice
            self._root.Panel_dicker:setVisible(false)
            self._root.dickerButton:getChildByName("Text"):setVisible(false)
            self._root.dickerButton:getChildByName("Text_1"):setVisible(true)
            self._root.dickerButton:getChildByName("Text_2"):setString("超过"..self.minPrice.."元的还价，自动同意。")
            self._root.dickerButton:getChildByName("Text_2"):setVisible(true)
        else
            self.minPrice = self.minInitPrice
            self.dickerType = 0
            local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
            nodeInput:setString("")
            --global.Facade:sendNotification(global.NoticeTable.SystemTips, GET_STRING(700000131))--预期价格不能为0或大于售价
            self._root.dickerButton:getChildByName("Text"):setVisible(true)
            self._root.dickerButton:getChildByName("Text_1"):setVisible(false)
            self._root.dickerButton:getChildByName("Text_2"):setVisible(false)
        end
        dump(self.minPrice,"self.minPriceself.minPriceself.minPriceself.minPrice")
    end)

    --关闭省心模式页面
    self._root.Panel_dicker:getChildByName("Button_2"):addClickEventListener(function()
        if self.dickerType == 1 and self.minPrice > 0 and self.autoPrice > 0 then
            self.minPrice = self.autoPrice
        end
        self._root.Panel_dicker:setVisible(false)
    end)

    --还价最低价格输入框
    self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input"):onEditHandler(function(event)
        if event.name == "changed" then
            local s = event.target:getString()
            s = string.gsub(s, "%s", "")
            s = string.gsub(s, "[^%d]", "")
            event.target:setString(s)

            if self:IsDrckerGoodNumber(s) then
                local lastprice = tonumber(s)
                local price = self._root.TextField_4:getString()
                price = tonumber(price)
                if price >= lastprice and lastprice > 0 then
                    self._root.Panel_dicker:getChildByName("Button_1"):setTouchEnabled(true)
                else
                    self._root.Panel_dicker:getChildByName("Button_1"):setTouchEnabled(false)
                end
            end
        end
        if event.name == "return" then
            local s = event.target:getString()
            if self:IsDrckerGoodNumber(s) then
                local lastprice = tonumber(s)
                local price = self._root.TextField_4:getString()
                price = tonumber(price)
                if price >= lastprice and lastprice > 0 then
                    self.minPrice = lastprice
                else
                    self.minPrice = self.minInitPrice
                    event.target:setString("")
                    self.dickerType = 0
                    global.Facade:sendNotification(global.NoticeTable.SystemTips, "预期价格不能为0或大于售价")

                    self._root.dickerButton:getChildByName("Text"):setVisible(true)
                    self._root.dickerButton:getChildByName("Text_1"):setVisible(false)
                    self._root.dickerButton:getChildByName("Text_2"):setVisible(false)
                end
            end
            SL:ScheduleOnce(
            function()
                self._root.Panel_dicker:getChildByName("Button_1"):setTouchEnabled(true)
            end,
            0.2
            )      
        end
    end)
    return true
end

function TradingBankTipsLayer:IsGoodNumber(str)
    if not (string.len(str) > 0) then
        return false
    end
    if not self:IsNumber(str) then
        return false
    end
    if not tonumber(str) then
        return false
    end
    if tonumber(str) <= 0 then
        return false
    end
    return true
end
function TradingBankTipsLayer:IsDrckerGoodNumber(str)
    if not (string.len(str) > 0) then
        return false
    end
    if not self:IsNumber(str) then
        return false
    end
    if not tonumber(str) then
        return false
    end
    return true
end
--是否纯数字
function TradingBankTipsLayer:IsNumber(str)
    if string.find(str, "[^%d]") then
        return false
    end
    return true
end
function TradingBankTipsLayer:InitAdapt()
    local winSizeW = SL:GetMetaValue("SCREEN_WIDTH")
    local winSizeH = SL:GetMetaValue("SCREEN_HEIGHT")
    GUI:setContentSize(self._root.Panel_cancel, winSizeW, winSizeH)
    GUI:setPosition(self._root.Image_1, winSizeW / 2, winSizeH / 2)
end

function TradingBankTipsLayer:onButtonClick(sender, type)
    if type ~= 2 then
        return
    end
    local name = sender:getName()
    local num = self._root.TextField_4:getString()
    if name == "Button_1" then
        if self.m_callback then
            if not self.m_callback(1, num) then
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close)
            end
        end
    else
        if self.m_callback then
            local data = {}
            data.bargain_switch      = self._root.Panel_bargain_role._isSelect and 1 or 2  --是否开启还价 开启1 关闭2
            data.bargain_save_price  = self.minPrice        --还价最低
            data.bargain_save_switch = self.dickerType      --省心模式 开启1 关闭0
            if data.bargain_switch == 1 and self.minPrice > 0 and self.dickerType == 1 then
                data.bargain_save_price   = self.minPrice
                data.bargain_save_switch  = self.dickerType
            end 
            if not self.m_callback(2, num, data) then
                global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTipsLayer_Close)
            end
        end
    end

end

function TradingBankTipsLayer:InitBargain(node)
    node._isSelect = true
    local CheckBox_true = node:getChildByName("CheckBox_true")
    local CheckBox_false = node:getChildByName("CheckBox_false")
    CheckBox_true:setSelected(true)
    CheckBox_true:addEventListener(function()
        node._isSelect = true
        self._root.dickerButton:setTouchEnabled(true)
        local select = CheckBox_true:isSelected()
        if select then
            CheckBox_false:setSelected(false)
        end
    end)
    CheckBox_false:addEventListener(function()
        node._isSelect = false
        self._root.dickerButton:setTouchEnabled(false)
        local select = CheckBox_false:isSelected()
        if select then
            CheckBox_true:setSelected(false)
        end
        self.minPrice = 0
        self.dickerType = 0
        self._root.dickerButton:getChildByName("Text"):setVisible(true)
        self._root.dickerButton:getChildByName("Text_1"):setVisible(false)
        self._root.dickerButton:getChildByName("Text_2"):setVisible(false)
        local nodeInput = self._root.Panel_dicker:getChildByName("ImageView_2"):getChildByName("Input")
        nodeInput:setString("")
    end)
end

return TradingBankTipsLayer