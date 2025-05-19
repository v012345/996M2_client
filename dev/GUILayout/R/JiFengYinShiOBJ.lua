JiFengYinShiOBJ = {}
JiFengYinShiOBJ.__cname = "JiFengYinShiOBJ"
JiFengYinShiOBJ.cost = {{"斗转星移[精]+10", 1}}
JiFengYinShiOBJ.items = { { "疾风刻印Lv.1", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiFengYinShiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.items,"item_",{spacing=15})
    self:UpdateUI()
end

function JiFengYinShiOBJ:GetShowStatus()
    local result = 4
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 5 and mainTaskStatus == 0 then
        result = 1
    elseif mainTaskProgress == 5 and mainTaskStatus == 1 then
        result = 2
    elseif mainTaskProgress == 6 and mainTaskStatus == 0 then
        result = 3
    elseif mainTaskProgress == 5 and mainTaskStatus == 2 then
        result = 3
    else
        result = 4
    end
    return result
end

function JiFengYinShiOBJ:UpdateUI()
    local showStatus = self:GetShowStatus()
    local nodeMainList = GUI:getChildren(self.ui.Node_main)
    for i, v in ipairs(nodeMainList) do
        if i == showStatus then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
end

--刷新任务触发
ssrGameEvent:add(ssrEventCfg.OnTaskRefresh, function()
    JiFengYinShiOBJ:SyncResponse()
end, JiFengYinShiOBJ)


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiFengYinShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiFengYinShiOBJ