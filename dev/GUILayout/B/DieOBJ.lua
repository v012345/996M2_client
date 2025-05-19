DieObj = {}

DieObj.__cname = "DieObj"


DieObj.cfg = ssrRequireCsvCfg("cfg_Fuhuo")

DieObj.REVIVE_TYPE = {
    FREE = 0,               --免费复活
    PAY  = 1,                --收费复活
}
--类型 -- 0：常规  1：大乱斗 2:异域大战
DieObj.revive_type = {
    routine = 0,
    dld     = 1,
    yiyu    = 2,
}

function DieObj:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, false)

    GUI:LoadExport(parent, objcfg.UI_PATH ,function ()
        self.ui = GUI:ui_delegate(parent)

        GUI:Text_setTextColor(self.ui.tx_auto_revive, "#FF0000")
        GUI:Text_setTextColor(self.ui.tx_pay_revive, "#FFFFFF")
        GUI:Text_setTextColor(self.ui.tx_can_revive_count, "#7CFC00")
        GUI:Text_setTextColor(self.ui.txt_situ, "#FF0000")

        --击杀者
        local killer_name = self.data[1]
        local map_id = self.data[3]
        self.isOnlyBack = false
        for i, v in ipairs(self.cfg[1].onlyBack) do
            if v == map_id then
                self.isOnlyBack =  true
                break
            end
        end
        --RTextTip
        --君子报仇十年不晚
        local RTextTip = GUI:RichText_Create(self.ui.img_bg, "RTextTip", 218.00, 115.00, string.format(self.cfg[1].Text , killer_name), 500, 16, "#FF0000", 2, nil, "fonts/font2.ttf")
        GUI:setAnchorPoint(RTextTip, 0.50, 0.50)

        --xx秒数后自动回城复活
        local sec = self.cfg[1].Time
        --xx秒数后原地复活
        local countdown_situ = self.cfg[1].Countdown
        --定时器，到时间后复活
        self.ui.tx_auto_revive:setString("自动复活："..sec)
        SL:schedule(parent, function ()
            sec = sec - 1
            self.ui.tx_auto_revive:setString("自动复活："..sec)
            if sec <= 0 then
                GUI:stopAllActions(parent)
                self:RequestRevive(self.arg1,self.REVIVE_TYPE.FREE)
            end
        end, 1)
        --当在非禁止原地复活的地图
        if self.isOnlyBack == false then
            self.ui.txt_situ:setString(countdown_situ.."秒后可")
            GUI:Button_setGrey(self.ui.btn_situ_revive, true)
            GUI:Button_setBright(self.ui.btn_situ_revive, false)
            GUI:Button_setBrightEx(self.ui.btn_situ_revive,false)
            SL:schedule(self.ui.Node_situ, function ()
            countdown_situ = countdown_situ - 1
            self.ui.txt_situ:setString(countdown_situ.."秒后可")
                if countdown_situ <= 0 then
                    GUI:setVisible(self.ui.txt_situ, false)
                    GUI:stopAllActions(self.ui.Node_situ)
                    GUI:Button_setGrey(self.ui.btn_situ_revive, false)
                    GUI:Button_setBright(self.ui.btn_situ_revive, true)
                    GUI:Button_setBrightEx(self.ui.btn_situ_revive,true)
                end
            end, 1)
        end
        --消耗货币
        local name, num = self.cfg[1].Pay[1][1], self.cfg[1].Pay[1][2]
        GUI:Text_setString(self.ui.tx_pay_revive, "消耗"..num..name)

        --可复活次数
        if self.revive_type.routine == self.arg1 then
            local count = self.data[2]
            self.ui.tx_can_revive_count:setString("可复活次数："..count)
            GUI:Button_setTitleText(self.ui.btn_back_revive,"回城复活")
        elseif self.revive_type.dld == self.arg1 then   --大乱斗
            GUI:Button_setTitleText(self.ui.btn_back_revive,"随机复活")
        elseif self.revive_type.yiyu == self.arg1 then  --异域大战
            GUI:Button_setTitleText(self.ui.btn_back_revive,"随机复活")
        end

        --回城复活
        GUI:addOnClickEvent(self.ui.btn_back_revive, function()
            self:RequestRevive(self.arg1,self.REVIVE_TYPE.FREE)
        end)
    
        --原地复活
        GUI:addOnClickEvent(self.ui.btn_situ_revive, function()
            self:RequestRevive(self.arg1,self.REVIVE_TYPE.PAY)
        end)
    
        local free_btnX,free_btnY = 106,51
        local free_txtX,free_txtY = 105,88

        if self.isOnlyBack then free_btnX = free_btnX + 120 end
        if self.isOnlyBack then free_txtX = free_txtX + 120 end
        
        GUI:setVisible(self.ui.btn_situ_revive,not self.isOnlyBack)
        GUI:setVisible(self.ui.tx_pay_revive,not self.isOnlyBack)
    
        GUI:setPosition(self.ui.btn_back_revive,free_btnX, free_btnY)
        GUI:setPosition(self.ui.tx_auto_revive,free_txtX, free_txtY)
    end)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--死亡打开UI
function DieObj:OpenUI(arg1,arg2,arg3,data)
    SL:Print("dasda ")
    self.arg1 = arg1
    self.data = data
    ssrUIManager:CLOSE(ssrObjCfg.Die)
    ssrUIManager:OPEN(ssrObjCfg.Die)
end

--复活
function DieObj:RequestRevive(revive_type,_type)
    ssrMessage:sendmsg(ssrNetMsgCfg.Die_RequestRevive, revive_type,_type,0, {})
end

function DieObj:ReviveResponse(data)
end

function DieObj:updateDieInfo(arg1,arg2,arg3,data)
end

SL:RegisterLUAEvent(LUA_EVENT_MAIN_PLAYER_REVIVE, "DieObj", function ()
    ssrUIManager:CLOSE(ssrObjCfg.Die)
end)

return DieObj