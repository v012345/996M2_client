GuiYuLingQiOBJ = {}
GuiYuLingQiOBJ.__cname = "GuiYuLingQiOBJ"
GuiYuLingQiOBJ.config = ssrRequireCsvCfg("cfg_GuiYuLingQi")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuiYuLingQiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.GuiYuLingQi_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuiYuLingQi_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.GuiYuLingQi_Request, 3)
    end)
    self.btnList = GUI:getChildren(self.ui.Node_Button)
    self:UpdateUI()
end

function GuiYuLingQiOBJ:UpdateUI()
    local cost = {}
    for i, v in ipairs(self.config) do
        local tmp = v.cost
        table.insert(cost, { tmp[1][1], tmp[1][2] })
    end
    showCost(self.ui.Panel_1,cost,104)
    for i, v in ipairs(self.btnList) do
        delRedPoint(v)
        if self.data[i] == 0 then
            Player:checkAddRedPoint(v, self.config[i].cost or {}, 25, 3)
        else
            --标注提交
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuiYuLingQiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuiYuLingQiOBJ