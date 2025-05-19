HunLuanDuTuOBJ = {}
HunLuanDuTuOBJ.__cname = "HunLuanDuTuOBJ"
HunLuanDuTuOBJ.config = ssrRequireCsvCfg("cfg_HunLuanDuTu")
HunLuanDuTuOBJ.cost = { {} }
HunLuanDuTuOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HunLuanDuTuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        GUI:setVisible(self.ui.Node_1,false)
        GUI:setVisible(self.ui.Node_2,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        GUI:setVisible(self.ui.Node_2,false)
        GUI:setVisible(self.ui.Node_3,true)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.HunLuanDuTu_Sync)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunLuanDuTu_Request)
    end)
end

function HunLuanDuTuOBJ:UpdateUI()

end

function HunLuanDuTuOBJ:Response(arg1, arg2, arg3, data)
    local cfg = self.config[arg1]
    local pi = 360
    local cur_angle = GUI:getRotation(self.ui.Image_pointer) % pi                        --当前指针角度
    local prize_angle = cfg.prizeangles                --奖品角度
    local action_turn_angle = 3 * pi + pi - (cur_angle - prize_angle) % pi      --转动总度数
    local rotate = GUI:ActionRotateBy(1.2, action_turn_angle)
    GUI:runAction(self.ui.Image_pointer, rotate)
end

function HunLuanDuTuOBJ:Sync(arg1, arg2, arg3, data)
    self.diff = arg1
    self.flag = arg2
    GUI:Text_setString(self.ui.Text_1, self.flag)
    if self.diff == 0 then
        GUI:Text_setString(self.ui.Text_2, "可抽取")
    else
        GUI:Text_COUNTDOWN(self.ui.Text_2, self.diff, function()
            GUI:Text_setString(self.ui.Text_2, "可抽取")
            GUI:Text_setString(self.ui.Text_1, 1)
            GUI:Text_setTextColor(self.ui.Text_2,"#00FF00")
        end)
        GUI:Text_setTextColor(self.ui.Text_2,"#FF0000")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HunLuanDuTuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HunLuanDuTuOBJ