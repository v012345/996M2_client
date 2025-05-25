local BaseUIMediator = requireMediator("BaseUIMediator")
local SettingFrameMediator = class("SettingFrameMediator", BaseUIMediator)
SettingFrameMediator.NAME = "SettingFrameMediator"

function SettingFrameMediator:ctor()
    SettingFrameMediator.super.ctor( self )
end

function SettingFrameMediator:listNotificationInterests()
    local noticeTable = global.NoticeTable
    return 
    {
        noticeTable.Layer_SettingFrame_Open,
        noticeTable.Layer_SettingFrame_Close,
    }
end

function SettingFrameMediator:handleNotification(notification)
    local noticeTable = global.NoticeTable
    local id = notification:getName()
    local data = notification:getBody()

    if noticeTable.Layer_SettingFrame_Open == id then
        self:OpenLayer(data)
    elseif noticeTable.Layer_SettingFrame_Close == id then
        self:CloseLayer()
    end
end

function SettingFrameMediator:OpenLayer(data)
    if not (self._layer) then
        local path = global.isWinPlayMode and "setting_layer/SettingFrameLayer_win32" or "setting_layer/SettingFrameLayer" 
        self._layer    = requireLayerUI(path).create()
        self._type     = global.UIZ.UI_NORMAL
        self._escClose = true
        self._GUI_ID   = SLDefine.LAYERID.SettingFrameGUI

        SettingFrameMediator.super.OpenLayer(self)
        if global.isWinPlayMode and tonumber(data) then
            if tonumber(data) == 2 then
                data = 1
            elseif tonumber(data) > 2 then
                data = tonumber(data) - 1
            end
        end
        self._layer:InitGUI(data)
        LoadLayerCUIConfig(global.CUIKeyTable.SETTING_FRAME, self._layer)

        self:OnAddReportBtn()
        self:OnAddKeyBtn()
    else
        local id =  self._layer:GetCurPageID()
        if (not data and id == SLDefine.SettingPage.SettingBasic) or data == id  then 
            self:CloseLayer()
        else 
            self._layer:PageTo(data)
        end
        
    end
end

function SettingFrameMediator:OnAddReportBtn( ... )
    if not self._layer then 
        return 
    end

    local sPath = global.MMO.PATH_RES_PRIVATE.."report/report_btn_s.png"
    local path = global.MMO.PATH_RES_PRIVATE.."report/report_btn.png"
    self:RemoveCUIFile(sPath)
    self:RemoveCUIFile(path)

    local envProxy = global.Facade:retrieveProxy(global.ProxyTable.GameEnvironment)
    local isOpen = tonumber(envProxy:GetCustomDataByKey("openReport")) == 1
    local GameSettingProxy = global.Facade:retrieveProxy(global.ProxyTable.GameSettingProxy)
    self._reportBtn = ccui.Button:create()
    self._reportBtn:setAnchorPoint(1, 0)
    self._reportBtn:loadTextureNormal(path)
    self._reportBtn:setVisible(isOpen)

    self._sBtn = ccui.Button:create()
    self._sBtn:setAnchorPoint(1, 0)
    self._sBtn:loadTextureNormal(sPath)
    self._sBtn:setVisible(false)

    if GameSettingProxy:IsHideReportBtn() then
        self._reportBtn:setVisible(false)
        self._sBtn:setVisible(true)
    end

    local offsetX = SL:GetMetaValue("WINPLAYMODE") and 20 or 25
    local offsetY = SL:GetMetaValue("WINPLAYMODE") and 27 or 38

    if self._layer._ui.PMainUI then
        self._reportBtn:addTo(self._layer._ui.PMainUI)
        self._sBtn:addTo(self._layer._ui.PMainUI)
        self._reportBtn:setPosition(self._layer._ui.PMainUI:getContentSize().width - offsetX, offsetY)
        self._sBtn:setPosition(self._layer._ui.PMainUI:getContentSize().width - offsetX, offsetY)
    end

    local showList = false

    local function showHideBtn()
        if GameSettingProxy:IsHideReportBtn() then
            self._reportBtn:setVisible(false)
            self._sBtn:setVisible(true)
        end
        self._sBtn:setPositionY(50)
        self._sBtn:runAction(cc.EaseElasticOut:create(cc.MoveTo:create(0.35, cc.p(self._layer._ui.PMainUI:getContentSize().width - offsetX, offsetY)), 0.35))
    end

    local function addFunc( ... )
        local moveX = -40
        local tsBtn = ccui.Button:create()
        tsBtn:setAnchorPoint(1, 0)
        tsBtn:setPosition(cc.p(0 + moveX, 0))
        tsBtn:loadTextureNormal(global.MMO.PATH_RES_PRIVATE.."report/ts_btn.png")
        tsBtn:addTo(self._reportBtn)
        tsBtn:addClickEventListener(function()
            local url = GetReportUrl()
            cc.Application:getInstance():openURL(url)
        end)

        local hideBtn = ccui.Button:create()
        hideBtn:setAnchorPoint(1, 0)
        hideBtn:setPosition(cc.p(- tsBtn:getContentSize().width + moveX, 0))
        hideBtn:loadTextureNormal(global.MMO.PATH_RES_PRIVATE.."report/hide_btn.png")
        hideBtn:addTo(self._reportBtn)
        hideBtn:setVisible(false)
        hideBtn:addClickEventListener(function()
            GameSettingProxy:SetHideReportBtn(true)
            showList = false
            self._reportBtn:removeAllChildren()
            showHideBtn()
        end)

        tsBtn:runAction(cc.Sequence:create(
            cc.EaseElasticOut:create(cc.MoveTo:create(0.25, cc.p(0, 0)), 0.35),
            cc.CallFunc:create(function()
                hideBtn:setVisible(true)
                hideBtn:runAction(cc.EaseElasticOut:create(cc.MoveTo:create(0.25, cc.p(- tsBtn:getContentSize().width, 0)), 0.35))
            end)
        ))
        
    end

    self._sBtn:addClickEventListener(function ()
        if not showList then
            showList = true
            self._sBtn:setVisible(false)
            self._reportBtn:setVisible(true)
            self._reportBtn:runAction(cc.Sequence:create(
                cc.ScaleTo:create(0, 1.5),
                cc.EaseBackOut:create(cc.ScaleTo:create(0.3, 1)),
                cc.CallFunc:create(function()
                    addFunc()
                end)
            ))
        else
            showList = false
            showHideBtn()
        end
    end)


    self._reportBtn:addClickEventListener(function ( ... )
        if not showList then
            addFunc()
            showList = true
        else
            showList = false
            local childs = self._reportBtn:getChildren()
            for _, child in ipairs(childs) do
                child:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(self._reportBtn:getContentSize().width, 0)),
                cc.CallFunc:create(function()
                    child:removeFromParent()
                end)))
            end
            showHideBtn()
        end
    end)
    DelayTouchEnabled(self._reportBtn, 0.2)

end

function SettingFrameMediator:OnAddKeyBtn( ... )
    local otherTradingBankProxy = global.Facade:retrieveProxy(global.ProxyTable.OtherTradingBankProxy)
    if not self._layer then 
        return 
    end
    if otherTradingBankProxy:getPublishOpen() ~= 1 then 
        return 
    end
    
    local pathAcc = global.MMO.PATH_RES_PRIVATE.."report/key_acc.png"
    local pathId = global.MMO.PATH_RES_PRIVATE.."report/key_id.png"

    self:RemoveCUIFile(pathAcc)
    self:RemoveCUIFile(pathId)

    self._keyAccBtn = ccui.Button:create()
    self._keyAccBtn:setAnchorPoint(1, 0)
    self._keyAccBtn:loadTextureNormal(pathId)
    self._keyAccBtn:setScale(0.85)

    self._keyIdBtn = ccui.Button:create()
    self._keyIdBtn:setAnchorPoint(1, 0)
    self._keyIdBtn:loadTextureNormal(pathAcc)
    self._keyIdBtn:setScale(0.85)

    local offsetX = SL:GetMetaValue("WINPLAYMODE") and 80 or 105
    local offsetY = SL:GetMetaValue("WINPLAYMODE") and 27 or 38

    if self._layer._ui.PMainUI then
        self._keyAccBtn:addTo(self._layer._ui.PMainUI)
        self._keyIdBtn:addTo(self._layer._ui.PMainUI)
        self._keyAccBtn:setPosition(offsetX, offsetY)
        self._keyIdBtn:setPosition(offsetX+50, offsetY)
    end



    local getPublishKeyUsing = function()
        if otherTradingBankProxy:getPublishKeyValidTime() <= 0 or otherTradingBankProxy:getPublishKey() == "" then
            otherTradingBankProxy:getPublishKeyUsing(self, function(code, tabledata, msg)
                if code == 200 then
                    dump(tabledata,"tabledata")
                    otherTradingBankProxy:setPublishKeyValidTime(1800)
                    otherTradingBankProxy:setPublishTableData(tabledata)
                    otherTradingBankProxy:setPublishKey(tabledata.key)
                    otherTradingBankProxy:setPublishLockID(tabledata.prePublishId)

                    global.Facade:sendNotification(global.NoticeTable.TradingBank_other_Capture,{type = 1})
                else
                    ShowSystemTips(msg)
                end
            end)
        else
            global.Facade:sendNotification(global.NoticeTable.TradingBank_other_Capture,{type = 1})
        end
    end

    local TextTips = function()
        local params = {}
        params.rich = 1
        params.type = 1
        params.btntext = {GET_STRING(700000137), GET_STRING(600000170)}
        params.text = GET_STRING(700000135)
        params.titleImg = global.MMO.PATH_RES_PRIVATE .. "trading_bank_other/img_tips.png"
        params.callback = function(res)     
            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Close_other)
            if res == 1 then
                --是否登录
                if otherTradingBankProxy:getToken() == "" then 
                    otherTradingBankProxy:Login1_2(function(code, msg)
                        if code == 200 then 
                            if otherTradingBankProxy:getToken() ~= "" then 
                                getPublishKeyUsing()
                            end
                        else
                            ShowSystemTips(msg or "")
                        end
                    end)
                else
                    getPublishKeyUsing()
                end
            end
            
        end
        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Open_other, params)
    end
    self._keyIdBtn:addClickEventListener(function ()
        local MapProxy = global.Facade:retrieveProxy( global.ProxyTable.Map )
        if not MapProxy:IsInSafeArea() then--安全区才能打开
            ShowSystemTips(GET_STRING(700000144))
            return
        end

        if SL:GetMetaValue("USEHERO") and SL:GetMetaValue("HERO_IS_ACTIVE") then
            if not SL:GetMetaValue("HERO_IS_ALIVE") then
                SL:ShowSystemTips("英雄还未召唤")
                return
            end
        end
        otherTradingBankProxy:doTrack(otherTradingBankProxy.UpLoadData.TraingCobyPlayerIDBtnClick)
        TextTips()
    end)



    local getRoleKey = function()
        otherTradingBankProxy:getRoleKey(self, function(code, data, msg)
            if code == 200 then
                SL:SetMetaValue("CLIPBOARD_TEXT", data)--账号ID (购买ID)
                ShowSystemTips(GET_STRING(600000419))
            else
                ShowSystemTips(msg)
            end
        end)
    end
    local TextTips2 = function()
        local params = {}
        params.type = 1
        params.btntext = {GET_STRING(600000139), GET_STRING(600000170)}
        params.text = GET_STRING(700000134)
        params.titleImg = global.MMO.PATH_RES_PRIVATE .. "trading_bank_other/img_tips.png"
        params.callback = function(res)
            global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Close_other)
            if res == 1 then
                --是否登录
                if otherTradingBankProxy:getToken() == "" then 
                    otherTradingBankProxy:Login1_2(function(code, msg)
                        if code == 200 then 
                            if otherTradingBankProxy:getToken() ~= "" then 
                                getRoleKey()
                            end
                        else
                            ShowSystemTips(msg or "")
                        end
                    end)
                else
                    getRoleKey()
                end
            end
            
        end
        global.Facade:sendNotification(global.NoticeTable.Layer_TradingBankTips2Layer_Open_other, params)
    end
    self._keyAccBtn:addClickEventListener(function ( ... )
        otherTradingBankProxy:doTrack(otherTradingBankProxy.UpLoadData.TraingCobyAccountIDBtnClick)
        TextTips2()
    end)
end

function SettingFrameMediator:RemoveCUIFile( path )
    local fullPath = global.FileUtilCtl:fullPathForFilename(path)

    if string.find(fullPath, "dev", 1, true) then
        global.FileUtilCtl:removeFile( fullPath )
        global.FileUtilCtl:purgeCachedEntries()
    end

    local currentModule = global.L_ModuleManager:GetCurrentModule()
    local currentSubMod = currentModule:GetCurrentSubMod()
    local subFolderName = nil
    if currentSubMod then
        if nil == global.LuaBridgeCtl.GetNewFoldername then
            subFolderName =  currentSubMod:GetID()
        else
            subFolderName = global.LuaBridgeCtl:GetNewFoldername(currentSubMod:GetID())
        end
    end

    local fullPath2 = global.FileUtilCtl:fullPathForFilename(path)
    if subFolderName and string.find(fullPath2, subFolderName, 1, true) then
        global.FileUtilCtl:removeFile( fullPath2 )
        global.FileUtilCtl:purgeCachedEntries()
    end

end

function SettingFrameMediator:CloseLayer()
    if self._layer then
        self._layer:OnClose()
    end
    SettingFrameMediator.super.CloseLayer(self)
end

return SettingFrameMediator
