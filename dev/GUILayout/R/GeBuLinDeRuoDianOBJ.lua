GeBuLinDeRuoDianOBJ = {}
GeBuLinDeRuoDianOBJ.__cname = "GeBuLinDeRuoDianOBJ"
GeBuLinDeRuoDianOBJ.config = ssrRequireCsvCfg("cfg_GeBuLinDeRuoDian")
GeBuLinDeRuoDianOBJ.give = {{"※雪舞※[装扮时装]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GeBuLinDeRuoDianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request1,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request1,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request1,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request1,4)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request1,5)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GeBuLinDeRuoDian_Request2)
    end)
    self.panelList = GUI:getChildren(self.ui.Node_panel)
    self.btnList = GUI:getChildren(self.ui.Node_button)
    ssrAddItemListX(self.ui.Panel_6,self.give,"item_")
    self:UpdateUI()

end
function GeBuLinDeRuoDianOBJ:IsAllSubmitted()
    local result = true
    for i, v in ipairs(self.data or {}) do
        if v == 0 then
            result = false
            break
        end
    end
    return result
end
function GeBuLinDeRuoDianOBJ:UpdateUI()
    for i, v in ipairs(self.config) do
        local widget = self.panelList[i]
        if widget then
            showCost(widget,v.cost,0,{itemBG = "res/custom/JuQing/imageMit.png",width=58,height=58})
        end
        local flag = self.data[i] or 0
        local btnWidget = self.btnList[i]
        if btnWidget then
            delRedPoint(btnWidget)
            if flag == 0 then
                Player:checkAddRedPoint(btnWidget, v.cost, 25, 3)
            end
        end

    end
    if self.flag == 0 then
        if self:IsAllSubmitted() then
            addRedPoint(self.ui.Button_6,25,3)
        end
    else
        delRedPoint(self.ui.Button_6)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GeBuLinDeRuoDianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GeBuLinDeRuoDianOBJ