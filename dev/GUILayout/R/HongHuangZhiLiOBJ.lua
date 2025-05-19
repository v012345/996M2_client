HongHuangZhiLiOBJ = {}
HongHuangZhiLiOBJ.__cname = "HongHuangZhiLiOBJ"
HongHuangZhiLiOBJ.config = ssrRequireCsvCfg("cfg_HongHuangZhiLi")
HongHuangZhiLiOBJ.cost = {}
for i, v in ipairs(HongHuangZhiLiOBJ.config) do
    HongHuangZhiLiOBJ.cost[i] = v.cost[1]
end
HongHuangZhiLiOBJ.give = {{"洪荒之力[称号]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HongHuangZhiLiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiLi_Request1,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiLi_Request1,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiLi_Request1,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiLi_Request2)
    end)
    self.btnList = GUI:getChildren(self.ui.Node_button)
    ssrAddItemListX(self.ui.Panel_2, self.give, "item_")
    self:UpdateUI()

end

function HongHuangZhiLiOBJ:IsAllSubmitted()
    local result = true
    for i, v in ipairs(self.data or {}) do
        if v == 0 then
            result = false
            break
        end
    end
    return result
end

function HongHuangZhiLiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,96)
    for i, v in ipairs(self.btnList) do
        delRedPoint(v)
        local flag = self.data[i] or 0
        local cost = {self.cost[i] or {}}
        if flag == 0 then
            Player:checkAddRedPoint(v, cost, 25, 3)
        end
    end
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "洪荒之力")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", idx)
    if not titleData then
        if self:IsAllSubmitted() then
            addRedPoint(self.ui.Button_4,25,3)
        end
    else
        delRedPoint(self.ui.Button_4)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HongHuangZhiLiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HongHuangZhiLiOBJ