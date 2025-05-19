MoYanLianYuOBJ = {}
MoYanLianYuOBJ.__cname = "MoYanLianYuOBJ"
MoYanLianYuOBJ.config = ssrRequireCsvCfg("cfg_MoYanLianYu")
MoYanLianYuOBJ.give = { {"魔焰掌控者[称号]",1} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MoYanLianYuOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYanLianYu_Request1, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYanLianYu_Request1, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYanLianYu_Request1, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYanLianYu_Request2, 3)
    end)
    self.panelList = GUI:getChildren(self.ui.Node_panel)
    self.btnList = GUI:getChildren(self.ui.Node_button)
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_4,self.give,"item_")
end

function MoYanLianYuOBJ:IsAllSubmitted()
    local result = true
    for i, v in ipairs(self.data or {}) do
        if v == 0 then
            result = false
            break
        end
    end
    return result
end

function MoYanLianYuOBJ:UpdateUI()
    for i, v in ipairs(self.panelList) do
        local cfg = self.config[i]
        showCost(v, cfg.cost, 0)
    end
    for i, v in ipairs(self.btnList) do
        delRedPoint(v)
        local cfg = self.config[i]
        if self.data[i] == 0 then
            Player:checkAddRedPoint(v, cfg.cost, 25, 3)
        end
    end

    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "魔焰掌控者")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", idx)
    if not titleData then
        if self:IsAllSubmitted() then
            addRedPoint(self.ui.Button_4,25,3)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MoYanLianYuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MoYanLianYuOBJ