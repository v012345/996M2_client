HunYuanFaXiangOBJ = {}
HunYuanFaXiangOBJ.__cname = "HunYuanFaXiangOBJ"
--HunYuanFaXiangOBJ.config = ssrRequireCsvCfg("cfg_HunYuanFaXiang")
HunYuanFaXiangOBJ.cost = { { "天尊令", 400 }, { "造化结晶", 488 }, { "灵符", 8888 } }
HunYuanFaXiangOBJ.give = { { "ζ聖●法相天地ζ", 1 } }
local equipPos = 21 --装备位置
local equipName = "ζ法相天地ζ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HunYuanFaXiangOBJ:main(objcfg)
    local currEquipName = Player:getEquipNameByPos(equipPos)
    if currEquipName ~= equipName then
        sendmsg9("你身上没有穿戴#250|ζ法相天地ζ#249|无法觉醒！#250")
        return
    end
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HunYuanFaXiang_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
    self.textList = GUI:getChildren(self.ui.Node_1)
    self:UpdateUI()
end

function HunYuanFaXiangOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 30)
    for i, v in ipairs(self.textList) do
        local values = Player:getEquipCustomAttrValue(equipPos, i)
        local attrValues1 = values[1] or {}
        local attrValue1 = attrValues1[3] or 0
        local color = attrValue1 < 20 and "#FF0000" or "#00FF00"
        GUI:Text_setString(v,string.format("%d/20",attrValue1))
        GUI:Text_setTextColor(v,color)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HunYuanFaXiangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HunYuanFaXiangOBJ