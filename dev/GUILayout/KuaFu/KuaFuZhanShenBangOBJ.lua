KuaFuZhanShenBangOBJ = {}
KuaFuZhanShenBangOBJ.__cname = "KuaFuZhanShenBangOBJ"
--KuaFuZhanShenBangOBJ.config = ssrRequireCsvCfg("cfg_KuaFuZhanShenBang")
KuaFuZhanShenBangOBJ.cost = {{}}
KuaFuZhanShenBangOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KuaFuZhanShenBangOBJ:main(objcfg)
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
        local feature = SL:GetMetaValue("FEATURE")
        ssrMessage:sendmsg(ssrNetMsgCfg.KuaFuZhanShenBang_Request,feature.clothID,feature.weaponID)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.KuaFuZhanShenBang_RequestSync)
    --self:UpdateUI()
end

function KuaFuZhanShenBangOBJ:UpdateUI()
    GUI:removeAllChildren(self.ui.Node_1)
    GUI:removeAllChildren(self.ui.Node_2)
    GUI:removeAllChildren(self.ui.Node_3)
    local nodes = {self.ui.Node_1,self.ui.Node_2,self.ui.Node_3}
    for i, v in ipairs(self.data or {}) do
        local key, value = next(v)
        local power = value[1] or 0
        local name = value[2] or ""
        local clothID = value[3] or 0
        local weaponID = value[4] or 0
        local nodeObJ = nodes[i]
        GUI:Effect_Create(nodeObJ, "EffectActor", 0.00, 0.00, 4, clothID, 0, 0, 4, 1)
        GUI:Effect_Create(nodeObJ, "EffecWeapon", 0.00, 0.00, 5, weaponID, 0, 0, 4, 1)
        local Text_1 = GUI:Text_Create(nodeObJ, "Text_name", 26.00, 141.00, 16, "#80ff00", name)
        GUI:setAnchorPoint(Text_1, 0.50, 0.00)
        GUI:Text_enableOutline(Text_1, "#000000", 1)
        local Text_2 = GUI:Text_Create(nodeObJ,"Text_power", 28.00, 118.00, 16, "#ff00ff", "战斗力："..power)
        GUI:setAnchorPoint(Text_2, 0.50, 0.00)
        GUI:Text_enableOutline(Text_2, "#000000", 1)
    end
    --local rank1 = self.data[1] or {}
    --local rank2 = self.data[2] or {}
    --local rank3 = self.data[3] or {}
    --local key, value = next(rank1)
    ----[{"30000000001731641526000057134":[62943484108,"k1881_让公主受精了",40064,30085]},{"30000000001731641546000058102":[62297990026,"k1881_璩李志",40064,30085]}]
    --GUI:Effect_Create(self.ui.Node_1, "EffectActor", 0.00, 0.00, 4, feature.clothID, 0, 0, 4, 1)
    --GUI:Effect_Create(self.ui.Node_1, "EffecWeapon", 0.00, 0.00, 5, feature.weaponID, 0, 0, 4, 1)
    --local Text_1 = GUI:Text_Create(self.ui.Node_1, "Text_name", 26.00, 141.00, 16, "#80ff00", [[啊哈哈收到货撒]])
	--GUI:setAnchorPoint(Text_1, 0.50, 0.00)
	--GUI:Text_enableOutline(Text_1, "#000000", 1)
	--local Text_2 = GUI:Text_Create(self.ui.Node_2, "Text_power", 28.00, 118.00, 16, "#ff00ff", [[战斗力：11000001000]])
	--GUI:setAnchorPoint(Text_2, 0.50, 0.00)
	--GUI:Text_enableOutline(Text_2, "#000000", 1)
    --
    --GUI:Effect_Create(self.ui.Node_2, "EffectActor", 0.00, 0.00, 4, feature.clothID, 0, 0, 4, 1)
    --GUI:Effect_Create(self.ui.Node_2, "EffecWeapon", 0.00, 0.00, 5, feature.weaponID, 0, 0, 4, 1)
    --
    --GUI:Effect_Create(self.ui.Node_3, "EffectActor", 0.00, 0.00, 4, feature.clothID, 0, 0, 4, 1)
    --GUI:Effect_Create(self.ui.Node_3, "EffecWeapon", 0.00, 0.00, 5, feature.weaponID, 0, 0, 4, 1)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function KuaFuZhanShenBangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return KuaFuZhanShenBangOBJ