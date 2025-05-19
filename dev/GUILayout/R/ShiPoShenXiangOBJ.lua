ShiPoShenXiangOBJ = {}
ShiPoShenXiangOBJ.__cname = "ShiPoShenXiangOBJ"
--ShiPoShenXiangOBJ.config = ssrRequireCsvCfg("cfg_ShiPoShenXiang")
ShiPoShenXiangOBJ.give = { { "湿婆信徒", 1 } }
ShiPoShenXiangOBJ.cost = { { "湿婆神像", 2 }, { "金币", 50000 } }

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShiPoShenXiangOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -60)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShiPoShenXiang_Request)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShiPoShenXiang_SyncResponse)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{imgRes=""})
end

function ShiPoShenXiangOBJ:UpdateUI()
    GUI:Slider_setPercent(self.ui.LoadingBar_1, self.jindu)
    GUI:Text_setString(self.ui.Text_1, string.format("%d/100", self.jindu))
    delRedPoint(self.ui.Button_1)
    if self.jindu < 100 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShiPoShenXiangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.jindu = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShiPoShenXiangOBJ