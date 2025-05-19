YouMingGuiShiOBJ = {}
YouMingGuiShiOBJ.__cname = "YouMingGuiShiOBJ"
--YouMingGuiShiOBJ.config = ssrRequireCsvCfg("cfg_YouMingGuiShi")
YouMingGuiShiOBJ.give = { { "■龙之叹息■", 1 }, { "玄阴〃吊坠", 1 }, { "纯阴之体", 1 }, { "灵魂枷锁", 1 }, { "掌控奥义", 1 }, }
YouMingGuiShiOBJ.cost = { {"异界神石",58},{"元宝",3888888} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YouMingGuiShiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YouMingGuiShi_Request1)
    end)
     GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YouMingGuiShi_Request2)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item",{spacing = 15})
    self:UpdateUI()
end

function YouMingGuiShiOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,30)
    delRedPoint(self.ui.Button_1)
    if self.flag == 0 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    else
        addRedPoint(self.ui.Button_2,30,5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YouMingGuiShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YouMingGuiShiOBJ