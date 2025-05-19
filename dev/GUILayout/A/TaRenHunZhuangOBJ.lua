TaRenHunZhuangOBJ = {}
TaRenHunZhuangOBJ.__cname = "TaRenHunZhuangOBJ"
TaRenHunZhuangOBJ.config = ssrRequireCsvCfg("cfg_HunZhuangLevel")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TaRenHunZhuangOBJ:main(objcfg)
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
    --GUI:Timeline_Window1(self._parent)

    --获取对方玩家所有装备
    local EquipList = SL:GetMetaValue("L.M.EQUIP_POS_DATAS")
    --计算混装等级
    local HunZhangLevel = 0
    for i = 101, 106 do
        if EquipList[i] then
            local ItemName = SL:GetMetaValue("ITEM_NAME", EquipList[i].Index)
            local Num = TaRenHunZhuangOBJ.config[ItemName].level
            HunZhangLevel = HunZhangLevel + Num
        else
            HunZhangLevel = HunZhangLevel + 0
        end
    end
    --修改显示魂装等级
    GUI:Text_setString(self.ui.Text_1, HunZhangLevel)
end

function TaRenHunZhuangOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TaRenHunZhuangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TaRenHunZhuangOBJ