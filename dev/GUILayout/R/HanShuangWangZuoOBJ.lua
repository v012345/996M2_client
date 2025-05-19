HanShuangWangZuoOBJ = {}
HanShuangWangZuoOBJ.__cname = "HanShuangWangZuoOBJ"
--HanShuangWangZuoOBJ.config = ssrRequireCsvCfg("cfg_HanShuangWangZuo")
HanShuangWangZuoOBJ.cost = {{"冰封之心",66},{"金币",5000000}}
HanShuangWangZuoOBJ.give = {{"霜冻守护の心",1},{"冰封の盾",1},{"极寒护甲片",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HanShuangWangZuoOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HanShuangWangZuo_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing = 60})
    self:UpdateUI()
end

function HanShuangWangZuoOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,35)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end

function HanShuangWangZuoOBJ:Close()
    GUI:Win_Close(self._parent)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HanShuangWangZuoOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HanShuangWangZuoOBJ