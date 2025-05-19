ShengDanShuOBJ = {}
ShengDanShuOBJ.__cname = "ShengDanShuOBJ"
ShengDanShuOBJ.config = ssrRequireCsvCfg("cfg_ShengDanShu")
ShengDanShuOBJ.cost = { {} }
ShengDanShuOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShengDanShuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ShengDanShu_Request)
    end)
    self:ShowUI()
    --初始化点击事件
    self:InitClickEvent()
    --更新UI
    self:UpdateUI()
end

--显示界面
function ShengDanShuOBJ:ShowUI()
    local showItemsObj = GUI:getChildren(self.ui.Node_showItem)
    for i = 1, #showItemsObj do
        local itemObj = showItemsObj[i]
        local itemCfg = self.config[i]
        ssrAddItemListX(itemObj, itemCfg.give, "item_", { imgRes = "" })
    end
    local isPc = SL:GetMetaValue("WINPLAYMODE")
    local showTipsList = GUI:getChildren(self.ui.Node_showTips)
    for index, Text_Cost_Name in ipairs(showTipsList) do
        local itemCfg = self.config[index]
        local itemIdx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", itemCfg.cost[1][1])
        local tipsData = {}
        tipsData.typeId = itemIdx
        if isPc then
            GUI:addMouseMoveEvent(Text_Cost_Name, {
                onEnterFunc = function(widget)
                    local pos = GUI:getWorldPosition(Text_Cost_Name)
                    tipsData.pos = pos
                    ssr.OpenItemTips(tipsData)
                end,
                onLeaveFunc = function()
                    ssr.CloseItemTips()
                end
            })
        else
            GUI:addOnClickEvent(Text_Cost_Name, function(widget)
                local pos = GUI:getWorldPosition(widget)
                tipsData.pos = pos
                ssr.OpenItemTips(tipsData)
            end)
        end
    end
end

--初始化点击事件
function ShengDanShuOBJ:InitClickEvent()
    local btnList = GUI:getChildren(self.ui.Node_btnList)
    for index, btn in ipairs(btnList) do
        GUI:addOnClickEvent(btn, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.ShengDanShu_Request, index)
        end)
    end
end

function ShengDanShuOBJ:UpdateUI()
    local btnList = GUI:getChildren(self.ui.Node_btnList)
    for index, btn in ipairs(btnList) do
        local itemCfg = self.config[index]
        Player:checkAddRedPoint(btn, itemCfg.cost, 16, 0)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShengDanShuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShengDanShuOBJ
