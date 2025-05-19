SheChaoJinDiOBJ = {}
SheChaoJinDiOBJ.__cname = "SheChaoJinDiOBJ"
--SheChaoJinDiOBJ.config = ssrRequireCsvCfg("cfg_SheChaoJinDi")
SheChaoJinDiOBJ.cost =  { { "幻灵水晶", 188 }, { "元宝", 50000 } }
SheChaoJinDiOBJ.give = {{"碧波三花曈",1},{"不灭大蟒(称号卷)",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function SheChaoJinDiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.SheChaoJinDi_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing = 30})
    self:UpdateUI()
end

function SheChaoJinDiOBJ:UpdateUI()
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function SheChaoJinDiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return SheChaoJinDiOBJ