DianFengDengJi1OBJ = {}
DianFengDengJi1OBJ.__cname = "DianFengDengJi1OBJ"
DianFengDengJi1OBJ.config = ssrRequireCsvCfg("cfg_DianFengDengJi1")
DianFengDengJi1OBJ.cost = {{}}
DianFengDengJi1OBJ.give = {{"你我山巅自相逢·入世[称号]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DianFengDengJi1OBJ:main(objcfg)
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
    self.dotList = GUI:getChildren(self.ui.Node_1)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DianFengDengJi1_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DianFengDengJi1_Request,2)
    end)
    self:UpdateUI()
end
--createMultiLineRichText(parent, ID, x, y, textData, lineHeight, width, fontSize, fontColor, vspace)
function DianFengDengJi1OBJ:UpdateUI()
    if self.currLevel < 1 then
        GUI:Text_setString(self.ui.Text_currLevelMax,"未获得")
        GUI:Text_setString(self.ui.Text_curr,"未获得")
    end
    local currCfg = self.config[self.currLevel]
    if currCfg then
        GUI:Text_setString(self.ui.Text_currLevelMax,currCfg.unlockLevel)
        GUI:Text_setString(self.ui.Text_curr,currCfg.currDesc)
        GUI:removeAllChildren(self.ui.Panel_currAtt)
        GUI:RichText_Create(self.ui.Panel_currAtt, "nextAtt", 1,1, currCfg.desc, 220, 16, "#FFFFFF", 2, nil, "fonts/font2.ttf")
    end
    local nextCfg = self.config[self.currLevel + 1]
    if self.currLevel + 1 > 10 then
        delRedPoint(self.ui.Button_1)
        delRedPoint(self.ui.Button_2)
        GUI:Text_setString(self.ui.Text_nextLevelMax,"已满级")
        --GUI:Text_setString(self.ui.Text_next,"已满级")
    end
    if nextCfg then
        GUI:Text_setString(self.ui.Text_nextLevelMax,nextCfg.unlockLevel)
        GUI:removeAllChildren(self.ui.Panel_nextAtt)
        local rtxt = GUI:RichText_Create(self.ui.Panel_nextAtt, "nextAtt", 1,1, nextCfg.desc, 220, 16, "#FFFFFF", 2, nil, "fonts/font2.ttf")
        GUI:setAnchorPoint(rtxt,0.5,0)
        showCost(self.ui.Panel_1,nextCfg.showCost,0)
        Player:checkAddRedPoint(self.ui.Button_1, nextCfg.cost1, 30, 5)
        Player:checkAddRedPoint(self.ui.Button_2, nextCfg.cost2, 30, 5)
    end
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
    self:UpdateDot()
end

function DianFengDengJi1OBJ:UpdateDot()
    for i, v in ipairs(self.dotList) do
        if i > self.currLevel then
            GUI:setVisible(v, false)
        else
            GUI:setVisible(v, true)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function DianFengDengJi1OBJ:SyncResponse(arg1, arg2, arg3, data)
    self.currLevel = arg1 or 0
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return DianFengDengJi1OBJ