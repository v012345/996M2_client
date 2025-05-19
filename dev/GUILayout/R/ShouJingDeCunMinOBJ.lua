ShouJingDeCunMinOBJ = {}
ShouJingDeCunMinOBJ.__cname = "ShouJingDeCunMinOBJ"
ShouJingDeCunMinOBJ.items = { { "开天斩", 1 }, { "逐日剑法", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShouJingDeCunMinOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -50)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.items,"item_",{spacing=15})
    self:UpdateUI()
end

function ShouJingDeCunMinOBJ:GetShowStatus()
    local result = 3
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 1 then
        result = 1
    elseif mainTaskProgress == 2 then
        result = 2
    else
        result = 3
    end
    return result
end

function ShouJingDeCunMinOBJ:UpdateUI()
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
function ShouJingDeCunMinOBJ:StartGuide()
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    if mainTaskProgress == 1 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_1        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "领取任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
    if mainTaskProgress == 2 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_2        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "前往任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
end

--刷新任务触发
ssrGameEvent:add(ssrEventCfg.OnTaskRefresh, function()
    ShouJingDeCunMinOBJ:SyncResponse()
end, ShouJingDeCunMinOBJ)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShouJingDeCunMinOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShouJingDeCunMinOBJ