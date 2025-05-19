WangLingZhiShuOBJ = {}
WangLingZhiShuOBJ.__cname = "WangLingZhiShuOBJ"
WangLingZhiShuOBJ.config = ssrRequireCsvCfg("cfg_WangLingZhiShu")
WangLingZhiShuOBJ.cost1 = { { "死亡笔记(上)", 1 } }
WangLingZhiShuOBJ.cost2 = { { "死亡笔记(下)", 1 } }
WangLingZhiShuOBJ.give = { {"从小爱学习[称号]",1} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function WangLingZhiShuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.WangLingZhiShu_Request1,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WangLingZhiShu_Request1,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WangLingZhiShu_Request2)
        delRedPoint(self.ui.Button_3)
    end)
    ssrAddItemListX(self.ui.Panel_3,self.give,"item_")
    self:UpdateUI()
end

function WangLingZhiShuOBJ:UpdateUI()
    local cost1 = self.config[1].cost
    local cost2 = self.config[2].cost
    showCost(self.ui.Panel_1,cost1,0)
    showCost(self.ui.Panel_2,cost2,0)
    delRedPoint(self.ui.Button_1)
    if self.flag1 == 0 then
        Player:checkAddRedPoint(self.ui.Button_1, cost1, 25, 3)
    end
    delRedPoint(self.ui.Button_2)
    if self.flag2 == 0 then
        Player:checkAddRedPoint(self.ui.Button_2, cost2, 25, 3)
    end
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "从小爱学习")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", idx)
    if not titleData then
        if self.flag1 == 1 and self.flag2 == 1 then
            addRedPoint(self.ui.Button_3,25,3)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function WangLingZhiShuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag1 = data[1] or 0
    self.flag2 = data[2] or 0
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return WangLingZhiShuOBJ