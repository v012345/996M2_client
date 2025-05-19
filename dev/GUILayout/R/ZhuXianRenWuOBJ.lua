ZhuXianRenWuOBJ = {}
ZhuXianRenWuOBJ.__cname = "ZhuXianRenWuOBJ"
ZhuXianRenWuOBJ.config = ssrRequireCsvCfg("cfg_ZhuXianRenWu")
ZhuXianRenWuOBJ.cost = {{}}
ZhuXianRenWuOBJ.give = {{}}
ZhuXianRenWuOBJ.rwImgPath = "res/custom/ZhuXianAndJuQing/zhu_xian_btn/"
ZhuXianRenWuOBJ.goToBtnPos = {
    {198,158},
    {478,158},
    {198,11},
    {478,11}
}

ZhuXianRenWuOBJ.finishImgPos = {
    {160,154},
    {442,154},
    {160,8},
    {442,8}
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuXianRenWuOBJ:OpenUI(arg1,arg2,arg3, data)
    self.taskPanelID = arg1
    self.data = data
    ssrUIManager:OPEN(ssrObjCfg.ZhuXianRenWu, nil, true)
end
function ZhuXianRenWuOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self.ui.ImageBG)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuXianRenWu_Request)
    end)
    self:UpdateUI()
end

function ZhuXianRenWuOBJ:UpdateUI()
    local cfg = self.config[self.taskPanelID]
    if not cfg then
        if self.taskPanelID == 0 then
            sendmsg9("请先完成新手村任务！#249")
        else
            sendmsg9("目前没有存在的任务！#249")
        end

        GUI:Win_Close(self._parent)
        return
    end
    ssrAddItemListX(self.ui.Panel_1,cfg.reward,"item_", {})
    --判断控件是否是空，以免造成崩溃
    if GUI:Win_IsNull(self.ui.Node_1) then
        return
    end
    if GUI:Win_IsNull(self.ui.Node_2) then
        return
    end
    if GUI:Win_IsNull(self.ui.Node_3) then
        return
    end
    if GUI:Win_IsNull(self.ui.Node_4) then
        return
    end
    --清理一次
    GUI:removeAllChildren(self.ui.Node_1)
    GUI:removeAllChildren(self.ui.Node_2)
    GUI:removeAllChildren(self.ui.Node_3)
    GUI:removeAllChildren(self.ui.Node_4)
    self:CreateTaskDesc(self.ui.Node_1, cfg.show1[1], cfg.show1[2], 66, 223, 194,1)
    self:CreateTaskDesc(self.ui.Node_2, cfg.show2[1], cfg.show2[2], 344, 223, 194,2)
    self:CreateTaskDesc(self.ui.Node_3, cfg.show3[1], cfg.show3[2], 66, 77, 49,3)
    self:CreateTaskDesc(self.ui.Node_4, cfg.show4[1], cfg.show4[2], 344, 77, 49,4)
    --创建菜单
    self:CreateLeftMenu()
    --创建完成状态
    self:CreateFinishState()
    --判断是否全部完成 给红点
    local isAllFinish = CheckTaskIsFinishEx(self.data)
    delRedPoint(self.ui.Button_1)
    if isAllFinish then
        addRedPoint(self.ui.Button_1,25,5)
    end
end

--创建完成状态
function ZhuXianRenWuOBJ:CreateFinishState()
    GUI:removeAllChildren(self.ui.Node_5)
    for i, v in ipairs(self.data) do
        if not CheckTaskIsFinish(v) then
            local txtPos = self.goToBtnPos[i]
            local Text = GUI:Text_Create(self.ui.Node_5, "Text_"..i, txtPos[1], txtPos[2], 16, "#efe71a", [[立即前往]])
            GUI:setTouchEnabled(Text, true)
            GUI:Text_enableUnderline(Text)
            GUI:addOnClickEvent(Text,function ()
                ssrMessage:sendmsg(ssrNetMsgCfg.ZhuXianRenWu_Goto,self.taskPanelID,i)
                GUI:Win_Close(self._parent)
            end)
            --addRedPoint(Text,20,0)
        else
            local imagePos = self.finishImgPos[i]
            local image = GUI:Image_Create(self.ui.Node_5, "Image_"..i, imagePos[1], imagePos[2], "res/custom/ZhuXianAndJuQing/finish.png")
        end
    end
end

--添加左侧菜单
function ZhuXianRenWuOBJ:CreateLeftMenu()
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    for i = 1, self.taskPanelID do
        local config = self.config[i]
        local path = ""
        if i == self.taskPanelID then
            path = self.rwImgPath .. config.btnImg2
        else
            path = self.rwImgPath .. config.btnImg1
        end
        local parentPathImg = ""
        if config.parentImg then
            parentPathImg = self.rwImgPath .. config.parentImg
            local img = GUI:Image_Create(self.ui.ListView_1, "LeftMenu__"..i, 0.00, 0.00, parentPathImg)
        end
        local img = GUI:Image_Create(self.ui.ListView_1, "LeftMenu_"..i, 0.00, 0.00, path)
    end
    GUI:ListView_scrollToBottom(self.ui.ListView_1, 0.1, false)
end

--创建任务描述
function ZhuXianRenWuOBJ:CreateTaskDesc(parent, RTextTitle, TaskListStr , x, y1, y2, index)
    --创建任务
    RTextTitle = RTextTitle or "" --获取任务标题
    TaskListStr = TaskListStr or "" --获取任务描述字符串
    local TaskListTable = string.split(TaskListStr,"<br>")
    GUI:RichText_Create(parent, "RTextTitle", x, y1, RTextTitle, 260, 16, "#e7e4cf", 2, nil, "fonts/font2.ttf")
    --创建任务
    local initY = y2 --初始化Y坐标
    local datas = self.data[index]
    for i, v in ipairs(TaskListTable or {}) do
        local data = datas[i] or false
        local tmp
        if type(data) == "boolean" then
            tmp = SetCompletionStatus(data)
        elseif type(data) == "table" then
            tmp = SetCompletionProgress(data[1], data[2])
        end
        local tips = StringFormat(v, tmp)
        GUI:RichText_Create(parent, "RText_"..i, x, initY - (i-1) * 20, tips, 280.00, 16, "#ffffff", 2, nil, "fonts/font2.ttf")
    end
end
--更新引导信息
function ZhuXianRenWuOBJ:UpdateGuideTask(arg1)
    self:setGuideTask(arg1)
end
--获取引导信息
function ZhuXianRenWuOBJ:getGuideTask()
     return self.GuideTaskInfo or 0
end
--设置引导信息
function ZhuXianRenWuOBJ:setGuideTask(info)
    self.GuideTaskInfo = info or 0
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhuXianRenWuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.taskPanelID = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZhuXianRenWuOBJ