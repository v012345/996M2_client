local BaseUIMediator = requireMediator("BaseUIMediator")
local LoginOtpPassWordMediator = class('LoginOtpPassWordMediator', BaseUIMediator)
LoginOtpPassWordMediator.NAME = "LoginOtpPassWordMediator"

function LoginOtpPassWordMediator:ctor()
    LoginOtpPassWordMediator.super.ctor(self)
end

function LoginOtpPassWordMediator:listNotificationInterests()
    local notice = global.NoticeTable
    return
        {
            notice.Layer_Login_OtpPassWord_Open,
            notice.Layer_Login_OtpPassWord_Close,
            notice.Layer_Login_OtpPassWord_Refresh
        }
end

function LoginOtpPassWordMediator:handleNotification(notification)
    local id = notification:getName()
    local notices = global.NoticeTable
    local data = notification:getBody()
    
    if notices.Layer_Login_OtpPassWord_Open == id then
        self:Open()

    elseif notices.Layer_Login_OtpPassWord_Close == id then
        self:Close()

    elseif notices.Layer_Login_OtpPassWord_Refresh == id then
        self:OnRefresh(data)

    end
end

function LoginOtpPassWordMediator:Open()
    if not self._layer then
        self._layer = requireLayerUI("login_layer/LoginOtpPassWordLayer").create()
        if not self._layer then
            global.Facade:sendNotification(global.NoticeTable.Layer_Login_Server_Open)
            global.Facade:sendNotification(global.NoticeTable.RequestLoginServer)
            return
        end
        
        self._type = global.UIZ.UI_TOBOX
        self._layer:IsOpenVerifyOtpPassWord()

        LoginOtpPassWordMediator.super.OpenLayer(self)
    end
end

function LoginOtpPassWordMediator:Close()
    LoginOtpPassWordMediator.super.CloseLayer(self)
end

function LoginOtpPassWordMediator:OnRefresh(data)
    if self._layer then
        self._layer:OnRefresh(data)
    end
end

return LoginOtpPassWordMediator