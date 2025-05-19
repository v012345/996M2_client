
XingYunXiangLianOBJ = {}        --定义一个表
XingYunXiangLianOBJ.__cname = "XingYunXiangLianOBJ"

XingYunXiangLianOBJ.config = ssrRequireCsvCfg("cfg_XingYunXiangLian") --变量config = cfg_XingYunXiangLian
XingYunXiangLianOBJ.costDaMi2 = { { "灵符", 2888 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------

function XingYunXiangLianOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XingYunXiangLian_Request)
    end)

    GUI:addOnClickEvent(self.ui.ButtonXingYun12, function()
        local data = {}
        data.str = "确认花费[2888灵符]直接升至幸运12？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.XingYunXiangLian_Request2)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    self:UpdateUI()
    ssrMessage:sendmsg(ssrNetMsgCfg.XingYunXiangLian_RequestSync)
end

function XingYunXiangLianOBJ:UpdateUI()
    xianglianname = Player:getEquipNameByPos(3)
    local index = self.XingYun
    local Cfg = self.config[index+1]

    GUI:Text_setString(self.ui.xingyunlooks,"幸运+"..self.XingYun)
    GUI:Text_setString(self.ui.itmename,xianglianname)
    GUI:Text_setString(self.ui.TextLeiJi,string.format("%d",self.conut))
    local successStr = ""
    if self.tjzrFlag == 1 and self.todayFirst == 0 then
        successStr = "100%(天眷之人生效)"
    else
        successStr = Cfg.successRate.."%"
    end
    GUI:Text_setString(self.ui.ranlooks,successStr)
    GUI:Text_setString(self.ui.expnum,Cfg.moneynum[1][2].."金币")
    delRedPoint(self.ui.ButtonStart)
    delRedPoint(self.ui.ButtonXingYun12)
    if index < 12 then
        Player:checkAddRedPoint(self.ui.ButtonStart, Cfg.moneynum)
        Player:checkAddRedPoint(self.ui.ButtonXingYun12, self.costDaMi2)
    end
end

function XingYunXiangLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.XingYun = arg1
    self.conut = arg2
    self.tjzrFlag = arg3
    self.todayFirst = data[1]
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return XingYunXiangLianOBJ






