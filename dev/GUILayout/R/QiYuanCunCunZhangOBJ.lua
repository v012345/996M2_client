QiYuanCunCunZhangOBJ = {}
QiYuanCunCunZhangOBJ.__cname = "QiYuanCunCunZhangOBJ"
--QiYuanCunCunZhangOBJ.config = ssrRequireCsvCfg("cfg_QiYuanCunCunZhang")
QiYuanCunCunZhangOBJ.items = { { "牛马实习生[称号]", 1 } }

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QiYuanCunCunZhangOBJ:main(objcfg)
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 2 and mainTaskStatus ~= 2 then
        sendmsg9("请完成击杀任务后再来找我！#249")
        return
    end
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
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.Task_Request, objcfg.NPCID)
        GUI:Win_Close(self._parent)
    end)

    ssrAddItemListX(self.ui.Panel_1,self.items,"item_")

    self:UpdateUI()
end

function QiYuanCunCunZhangOBJ:GetShowStatus()
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    local result = 4
    if mainTaskProgress == 3 then
        result = 1
    elseif mainTaskProgress == 4 then
        result = 2
    elseif mainTaskProgress == 6 then
        result = 3
    else
        result = 4
    end
    return result
end

function QiYuanCunCunZhangOBJ:UpdateUI()
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
function QiYuanCunCunZhangOBJ:StartGuide()
    local mainTaskProgress = TaskOBJ:GetMainTaskProgress()
    local mainTaskStatus = TaskOBJ:GetMainTaskStatus()
    if mainTaskProgress == 3 and mainTaskStatus == 1 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_1        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "继续任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
    if mainTaskProgress == 4 and mainTaskStatus == 0 then
        local data = {}
        data.dir           = 5                -- 方向（1~8）从左按瞬时针
        data.guideWidget   = self.ui.Button_2        -- 当前节点
        data.guideParent   = self.ui.ImageBG          -- 父窗口
        data.guideDesc     = "继续任务"           -- 文本描述
        data.isForce       = false             -- 强制引导
        SL:StartGuide(data)
    end
end

--刷新任务触发
ssrGameEvent:add(ssrEventCfg.OnTaskRefresh, function()
    QiYuanCunCunZhangOBJ:SyncResponse()
end, QiYuanCunCunZhangOBJ)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QiYuanCunCunZhangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QiYuanCunCunZhangOBJ