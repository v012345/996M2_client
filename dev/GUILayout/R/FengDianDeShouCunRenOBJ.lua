FengDianDeShouCunRenOBJ = {}
FengDianDeShouCunRenOBJ.__cname = "FengDianDeShouCunRenOBJ"
FengDianDeShouCunRenOBJ.items = { { "杀戮刻印Lv.1", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FengDianDeShouCunRenOBJ:main(objcfg)
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

function FengDianDeShouCunRenOBJ:GetShowStatus()
    local result = 4
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 4 and mainTaskStatus == 0 then
        result = 1
    elseif mainTaskProgress == 4 and mainTaskStatus == 1 then
        result = 2
    elseif mainTaskProgress == 5 and mainTaskStatus == 0 then
        result = 3
    else
        result = 4
    end
    return result
end

function FengDianDeShouCunRenOBJ:UpdateUI()
    local showStatus = self:GetShowStatus()
    local nodeMainList = GUI:getChildren(self.ui.Node_main)
    for i, v in ipairs(nodeMainList) do
        if i == showStatus then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
    --self:StartGuide()
end
--创建引导
function FengDianDeShouCunRenOBJ:StartGuide()
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 4 and mainTaskStatus == 0 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_1        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "继续任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
    if mainTaskProgress == 4 and mainTaskStatus == 1 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_2        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "继续任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
    if mainTaskProgress == 5 and mainTaskStatus == 0 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_3        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "继续任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
end

--刷新任务触发
ssrGameEvent:add(ssrEventCfg.OnTaskRefresh, function()
    FengDianDeShouCunRenOBJ:SyncResponse()
end, FengDianDeShouCunRenOBJ)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FengDianDeShouCunRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FengDianDeShouCunRenOBJ