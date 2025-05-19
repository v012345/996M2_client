FuHuaHuaPuOBJ = {}
FuHuaHuaPuOBJ.__cname = "FuHuaHuaPuOBJ"
FuHuaHuaPuOBJ.show = {{"腐化メ恐惧",1},{"腐化メ奸诈",1},{"腐化メ残暴",1},{"腐化メ虚伪",1}}
FuHuaHuaPuOBJ.cost = {{"腐化之种",1}}
--FuHuaHuaPuOBJ.config = ssrRequireCsvCfg("cfg_FuHuaHuaPu")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FuHuaHuaPuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout,true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    --通信后端获取进度
    ssrMessage:sendmsg(ssrNetMsgCfg.FuHuaHuaPu_SyncResponse)

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.FuHuaHuaPu_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.FuHuaHuaPu_Request,2)
    end)


    GUI:addOnClickEvent(self.ui.Button_3,function()

        local data = {}
        data.str = "随机使用背包内的腐化装备进行随机置换，需要花费888灵符，请确认是否置换？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.FuHuaHuaPu_Request,3)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:runAction(self.ui.LoadingBar_1, GUI:ActionRotateTo(0.01, 270))
    GUI:runAction(self.ui.LoadingBar_2, GUI:ActionRotateTo(0.01, 270))
    GUI:runAction(self.ui.LoadingBar_3, GUI:ActionRotateTo(0.01, 270))
    GUI:runAction(self.ui.LoadingBar_4, GUI:ActionRotateTo(0.01, 270))
    ssrAddItemListX(self.ui.ItemShow, self.show,"奖励1",{imgRes = "",spacing = 128})

    self:UpdateUI()
end

function FuHuaHuaPuOBJ:UpdateUI()
    --种植收获按钮配置
    GUI:setVisible(self.ui.Button_1,false)
    GUI:setVisible(self.ui.Button_2,false)
    GUI:setVisible(self.ui.JiHuoLooks,false)
    if self.arg1 == 0 then
        GUI:setVisible(self.ui.Button_1,true)
    else
        GUI:setVisible(self.ui.Button_2,true)
        GUI:setVisible(self.ui.JiHuoLooks,true)
    end

    --数值显示读取
    local number1 = (self.data[1] >= 1000 and 1000) or self.data[1]
    local number2 = (self.data[2] >= 1000 and 1000) or self.data[2]
    local number3 = (self.data[3] >= 1000 and 1000) or self.data[3]
    local number4 = (self.data[4] >= 1000 and 1000) or self.data[4]
    local AllNum = number1 + number2 + number3 + number4

    --总显示值修改
    GUI:Text_setString(self.ui.Exp_Looks,AllNum.."/4000")
        --分类显示值修改
    GUI:Text_setString(self.ui.NumLooks1,number1)
    GUI:Text_setString(self.ui.NumLooks2,number2)
    GUI:Text_setString(self.ui.NumLooks3,number3)
    GUI:Text_setString(self.ui.NumLooks4,number4)

    --进度条显示
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, (number1/1000)*100)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_2, (number2/1000)*100)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_3, (number3/1000)*100)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_4, (number4/1000)*100)

    --按钮红点以及消耗显示
    showCost(self.ui.ItemCost,self.cost,0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)



end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FuHuaHuaPuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg1 = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FuHuaHuaPuOBJ