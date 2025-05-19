YiJiangGongChengWanGuKuOBJ = {}
YiJiangGongChengWanGuKuOBJ.__cname = "YiJiangGongChengWanGuKuOBJ"
--YiJiangGongChengWanGuKuOBJ.config = ssrRequireCsvCfg("cfg_YiJiangGongChengWanGuKu")
YiJiangGongChengWanGuKuOBJ.cost = {{"黄泉",1},{"离火",1},{"深渊之行",1}}
YiJiangGongChengWanGuKuOBJ.give = {{"骷髅将军[装扮时装]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YiJiangGongChengWanGuKuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJiangGongChengWanGuKu_Request1,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJiangGongChengWanGuKu_Request1,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJiangGongChengWanGuKu_Request1,3)
    end)
     GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJiangGongChengWanGuKu_Request2)
    end)
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
end

function YiJiangGongChengWanGuKuOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,76)
    local btnList = GUI:getChildren(self.ui.Node_1)
    for i, v in ipairs(btnList) do
        delRedPoint(v)
        if self.data[i] == 0 then
            local cost = {self.cost[i]}
            Player:checkAddRedPoint(v, cost, 20, 5)
        end
    end

    delRedPoint(self.ui.Button_4)
    if self.flag == 0 and self:isSubmitOk() then
        addRedPoint(self.ui.Button_4,20,5)
    end
end

function YiJiangGongChengWanGuKuOBJ:isSubmitOk()
    local result = true
    for i, v in ipairs(self.data) do
        if v == 0 then
            result = false
            break
        end
    end
    return result
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YiJiangGongChengWanGuKuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YiJiangGongChengWanGuKuOBJ