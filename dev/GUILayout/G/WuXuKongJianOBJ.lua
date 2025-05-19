WuXuKongJianOBJ = {}
WuXuKongJianOBJ.__cname = "WuXuKongJianOBJ"
--WuXuKongJianOBJ.config = ssrRequireCsvCfg("cfg_WuXuKongJian")
WuXuKongJianOBJ.cost = { {} }
WuXuKongJianOBJ.give = { { "新月领域△核心", 1 }, { "無上生霊″魂灭生", 1 }, { "神之■庇护", 1 }, { "火将印信", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function WuXuKongJianOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.WuXuKongJian_OpenUI)
end

function WuXuKongJianOBJ:OpenUI(arg1, arg2, arg3, data)
    self.data = data
    local objcfg = self.objcfg
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
    GUI:Timeline_Window1(self.ui.ImageBG)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WuXuKongJian_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1, self.give, "item_", { spacing = 24 })
    self:UpdateUI()
end

function WuXuKongJianOBJ:UpdateUI()
    local condition1 = self.data["bai"] or 0
    local condition2 = self.data["hui"] or 0
    local color1 = condition1 >= 300 and "#00FF00" or "#FF0000"
    local color2 = condition2 >= 50 and "#00FF00" or "#FF0000"
    GUI:Text_setTextColor(self.ui.Text_1, color1)
    GUI:Text_setTextColor(self.ui.Text_2, color2)
    GUI:Text_setString(self.ui.Text_1, string.format("%d/300", condition1))
    GUI:Text_setString(self.ui.Text_2, string.format("%d/50", condition2))
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function WuXuKongJianOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return WuXuKongJianOBJ