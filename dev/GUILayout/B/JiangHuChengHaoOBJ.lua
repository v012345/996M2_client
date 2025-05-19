
JiangHuChengHaoOBJ = {}
JiangHuChengHaoOBJ.__cname = "JiangHuChengHaoOBJ"
JiangHuChengHaoOBJ.config = ssrRequireCsvCfg("cfg_JiangHuChengHao")
JiangHuChengHaoOBJ.CurrentTextWidgets = {"Text_attr10", "Text_attr20", "Text_attr30", "Text_attr40", "Text_attr50", "Text_attr60"}
JiangHuChengHaoOBJ.NextTextWidgets = {"Text_attr1", "Text_attr2", "Text_attr3", "Text_attr4", "Text_attr5", "Text_attr6"}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiangHuChengHaoOBJ:main(objcfg)

    if self.titleLevel >=20 then
        sendmsg9("[提示]:#251|你的江湖称号已满级#249")
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
    GUI:setTouchEnabled(self.ui.CloseLayout,true)
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
    GUI:addOnClickEvent(self.ui.ButtonStart,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiangHuChengHao_Request)
    end)

    self:UpdateUI()
    end

function JiangHuChengHaoOBJ:UpdateUI()
    local currLevel = self.titleLevel or 0
    if self.titleLevel >= 20 then
        sendmsg9("[提示]:#251|你的江湖称号已满级#249")
        GUI:Win_Close(self._parent)
        return
    end
    local index = currLevel + 1
    --大于二十给二十
    if currLevel > 20 then
        currLevel = 20
    end

    --更新展示
    --当前属性
    local currentCfg = self.config[currLevel]
    --下级属性
    local nextCfg = self.config[index]

    if not currentCfg then
        currentCfg = {
            title = "未获得",
            attr = {"15-15","5%","0%","0%","0%","0%"}
        }
    end
    if not nextCfg then
        sendmsg9("[提示]:#251,你的江湖称号已满级#250")
        return
    end
    
    --当前显示
    local currentCustom = Player:getEquipFieldByName(currentCfg.title, 1)
    local currentEffectId, currentCustomField
    --如果没有获得
    if currentCustom == nil or currentCustom == "" then
        currentEffectId = 0
    else
        currentCustomField = SL:Split(currentCustom, "#")
        currentEffectId = currentCustomField[2]
    end
    GUI:Text_setString(self.ui.TextCurrent, currentCfg.title)
    --显示称号
    GUI:removeAllChildren(self.ui.NodeCurrentEffect)
    GUI:Effect_Create(self.ui.NodeCurrentEffect, "Effect2", 348.00, 373.00, 3, currentEffectId, 0, 0, 0, 1)
    for i, v in ipairs(currentCfg.attr) do
        GUI:Text_setString(self.ui[self.CurrentTextWidgets[i]], v)
    end


    --下级显示
    local nextCustom = Player:getEquipFieldByName(nextCfg.title, 1)
    local nextCustomField = SL:Split(nextCustom, "#")
    local nextEffectId = nextCustomField[2]
	GUI:removeAllChildren(self.ui.NodeNextEffect)
    GUI:Effect_Create(self.ui.NodeNextEffect, "Effect1", 764.00, 373.00, 3, nextEffectId, 0, 0, 0, 1)
    GUI:Text_setString(self.ui.TextNext, nextCfg.title)
    for i, v in ipairs(nextCfg.attr) do
        GUI:Text_setString(self.ui[self.NextTextWidgets[i]], v)
    end
    showCost(self.ui.LayoutCost, nextCfg.cost, 30,{width=48,height=48,itemBG = "res/custom/JiangHuChengHao/item_bg.png"})
    delRedPoint(self.ui.ButtonStart)
    local currDaLu = tonumber(Player:getServerVar("U54"))
    if currDaLu >= nextCfg.dalu then
        Player:checkAddRedPoint(self.ui.ButtonStart, nextCfg.cost, 20, 0)
    end
end


-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

--同步网络消息
function JiangHuChengHaoOBJ:SyncResponse(arg1)
    self.titleLevel = arg1 or 0
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

return JiangHuChengHaoOBJ
