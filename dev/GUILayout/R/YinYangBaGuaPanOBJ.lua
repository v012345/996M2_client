YinYangBaGuaPanOBJ = {}
YinYangBaGuaPanOBJ.__cname = "YinYangBaGuaPanOBJ"
--YinYangBaGuaPanOBJ.config = ssrRequireCsvCfg("cfg_YinYangBaGuaPan")
YinYangBaGuaPanOBJ.cost1 = { { "阴", 1 }, { "元宝", 100000 } }
YinYangBaGuaPanOBJ.cost2 = { { "阳", 1 }, { "元宝", 100000 } }
YinYangBaGuaPanOBJ.give = { {"阴阳合一[称号]",1} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YinYangBaGuaPanOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YinYangBaGuaPan_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YinYangBaGuaPan_Request2)
    end)
    ssrAddItemListX(self.ui.Panel_3,self.give,"item_")
    self:UpdateUI()
end

function YinYangBaGuaPanOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost1, 30)
    showCost(self.ui.Panel_2, self.cost2, 30)
    GUI:Text_setString(self.ui.Text_1,self.yin)
    GUI:Text_setString(self.ui.Text_2,self.yang)
    local yinJinDu = calculatePercentage(self.yin, 66)
    local yangJinDu = calculatePercentage(self.yang, 66)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_1,yinJinDu)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_2,yangJinDu)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YinYangBaGuaPanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.yin = arg1
    self.yang = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YinYangBaGuaPanOBJ