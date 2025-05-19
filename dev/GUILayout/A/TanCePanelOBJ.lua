TanCePanelOBJ = {}
TanCePanelOBJ.__cname = "TanCePanelOBJ"
--TanCePanelOBJ.config = ssrRequireCsvCfg("cfg_TanCePanel")
TanCePanelOBJ.cost = { {} }
TanCePanelOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TanCePanelOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        local titleID = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "洞察之眼")
        local isHasTitle = SL:GetMetaValue("TITLE_DATA_BY_ID", titleID)
        if not isHasTitle then
            sendmsg9("完成#250|平判将领#249|剧情任务后获得#250|探测功能#249")
            return
        end
        local data = {}
        data.str = "确定花费[50灵符]探测玩家位置？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                local name = GUI:TextInput_getString(self.ui.TextInput_1)
                if name == "" then
                    sendmsg9("玩家名字不能是空#249")
                    return
                end
                ssrMessage:sendmsg(ssrNetMsgCfg.TanCePanel_Request, 0, 0, 0, { name })
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
end

function TanCePanelOBJ:UpdateUI()
    local str = self.data[1] or ""
    GUI:Text_setString(self.ui.Text_1, str)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TanCePanelOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TanCePanelOBJ