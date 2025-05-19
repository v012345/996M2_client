XuanYouOBJ = {}
XuanYouOBJ.__cname = "XuanYouOBJ"
--XuanYouOBJ.config = ssrRequireCsvCfg("cfg_XuanYou")
XuanYouOBJ.cost = {{"一念花尘", 1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XuanYouOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.XuanYou_OpenUI)
end

function XuanYouOBJ:OpenUI(flag)
    if GUI:GetWindow(nil, self.__cname) then
        GUI:Win_Close(self._parent)
    end
    objcfg = self.objcfg
    self.flag = flag
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-50)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
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
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XuanYou_Request)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_7,function ()
        GUI:Win_Close(self._parent)
    end)
    --提交任务
    GUI:addOnClickEvent(self.ui.Button_8,function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.XuanYou_RequestSubmit)
    end)
    self:UpdateUI()
end

function XuanYouOBJ:UpdateUI()
    local showStatus = self:GetShowStatus()
    local nodeMainList = GUI:getChildren(self.ui.Node_main)
    for i, v in ipairs(nodeMainList) do
        if i == showStatus then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
    if showStatus == 4 then
        local itemCount = SL:GetMetaValue("ITEM_COUNT", "超级护身符")
        local jinDu = math.floor(calculatePercentage(itemCount, 38))
        GUI:Slider_setPercent(self.ui.LoadingBar_1, jinDu)
        local rtext = GUI:RichText_Create(self.ui.Image_7, "Rtext_1", 146, 11, string.format("超级护身符    <font color= '#fb512f'>%d/%d</font>",itemCount,38), 300, 18, "#fff6c3")
        GUI:setAnchorPoint(rtext,0.5,0)

         ssrAddItemListX(self.ui.Panel_1, self.cost,"奖励1")

    end
end

function XuanYouOBJ:GetShowStatus()
    local result = 4
    local taskList = TaskOBJ:GetAllTask()
    local currTask = taskList["200"]
    if currTask then
        result = 4
    elseif self.flag == 1 then
        result = 5
    else
        result = 1
    end
    return result
end

ssrGameEvent:add(ssrEventCfg.OnTaskRefresh, function()
    XuanYouOBJ:SyncResponse()
end, XuanYouOBJ)


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XuanYouOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XuanYouOBJ