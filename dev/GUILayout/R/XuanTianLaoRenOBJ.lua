XuanTianLaoRenOBJ = {}
XuanTianLaoRenOBJ.__cname = "XuanTianLaoRenOBJ"
--XuanTianLaoRenOBJ.config = ssrRequireCsvCfg("cfg_XuanTianLaoRen")
XuanTianLaoRenOBJ.items = { { "灵气枯竭的木匣", 1 } }

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XuanTianLaoRenOBJ:main(objcfg)
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
        --ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:setVisible(self.ui.Node_1,false)
        GUI:setVisible(self.ui.Node_2,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.items,"item_",{spacing=15})
    self:UpdateUI()
end


function XuanTianLaoRenOBJ:GetShowStatus()
    local result = 3
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 7 and mainTaskStatus == 0 then
        result = 1
    elseif mainTaskProgress == 7 and mainTaskStatus == 1 then
        result = 2
    else
        result = 3
    end
    return result
end

function XuanTianLaoRenOBJ:UpdateUI()
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
    XuanTianLaoRenOBJ:SyncResponse()
end, XuanTianLaoRenOBJ)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XuanTianLaoRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XuanTianLaoRenOBJ