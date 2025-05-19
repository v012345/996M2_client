YueGuangYuHuiOBJ = {}
YueGuangYuHuiOBJ.__cname = "YueGuangYuHuiOBJ"
YueGuangYuHuiOBJ.config = ssrRequireCsvCfg("cfg_YueGuangYuHui")
YueGuangYuHuiOBJ.cost = {{"月光之尘",1},{"幽夜精华",1}}
YueGuangYuHuiOBJ.give = {{"月光余晖[称号]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YueGuangYuHuiOBJ:main(objcfg)
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
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YueGuangYuHui_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YueGuangYuHui_Request,2)
    end)

    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
    self.textList = GUI:getChildren(self.ui.Node_text)
    self.buttonList = GUI:getChildren(self.ui.Node_button)
    self:UpdateUI()
end

function YueGuangYuHuiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,94)
    for i, v in ipairs(self.textList or {}) do
        local cfg = self.config[i]
        GUI:Text_setString(v,string.format("%d/%d",self.data[i],cfg.max))
    end
    for i, v in ipairs(self.buttonList) do
        delRedPoint(v)
        local cfg = self.config[i]
        local count = self.data[i]
        if count < cfg.max then
            Player:checkAddRedPoint(v, cfg.cost, 25, 3)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YueGuangYuHuiOBJ:SyncResponse(arg1, arg2, arg3, data)
    --SL:dump(data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YueGuangYuHuiOBJ