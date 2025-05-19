YongHengHuiJiOBJ = {}
YongHengHuiJiOBJ.__cname = "YongHengHuiJiOBJ"
--YongHengHuiJiOBJ.config = ssrRequireCsvCfg("cfg_YongHengHuiJi")
YongHengHuiJiOBJ.cost = { { "永恒杀戮徽记", 1 }, { "永恒生命徽记", 1 }, { "永恒魔法徽记", 1 }, { "永恒时空徽记", 1 } }
YongHengHuiJiOBJ.give = { { "追逐永恒之路[称号]", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YongHengHuiJiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengHuiJi_Request1, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengHuiJi_Request1, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengHuiJi_Request1, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengHuiJi_Request1, 4)
    end)
    self.txtList = GUI:getChildren(self.ui.Node_Text)
    self.btnList = GUI:getChildren(self.ui.Node_Button)
    self:UpdateUI()
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YongHengHuiJi_Request2)
    end)
end

function YongHengHuiJiOBJ:isClaimable()
    local result = true
    for i, v in ipairs(self.data) do
        if v < 3 then
            result = false
            break
        end
    end
    return result
end

function YongHengHuiJiOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 151)
    for i, v in ipairs(self.txtList) do
        GUI:Text_setString(v, string.format(self.data[i] .. "/3"))
    end
    for i, v in ipairs(self.btnList) do
        delRedPoint(v)
        if self.data[i] < 3 then
            Player:checkAddRedPoint(v, self.cost[i], 20, 5)
        end
    end
    local titleID = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "追逐永恒之路")
    local isHasTitle = SL:GetMetaValue("TITLE_DATA_BY_ID", titleID)
    delRedPoint(self.ui.Button_5)
    if not isHasTitle then
        if self:isClaimable() then
            addRedPoint(self.ui.Button_5, 20, 3)
        end
    else
        SetClaimedStatus(self.ui.Button_5, "res/public/yilingqu.png", { y = 8 })
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YongHengHuiJiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YongHengHuiJiOBJ