
KuangFengXiLianOBJ = {}
KuangFengXiLianOBJ.__cname = "KuangFengXiLianOBJ"
KuangFengXiLianOBJ.config = ssrRequireCsvCfg("cfg_KuangFengXiLian")
KuangFengXiLianOBJ.locks = {0,0,0,0,0}
KuangFengXiLianOBJ.where = 14
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KuangFengXiLianOBJ:main(objcfg)
    local equipName = Player:getEquipNameByPos(self.where)
    if equipName ~= "疾风刻印Lv.10" then
        sendmsg9("疾风刻印Lv.10#249|才可以洗练！#250")

        return
    end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-20)
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

    GUI:addOnClickEvent(self.ui.ButtonStart, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.KuangFengXiLian_Request,arg1,arg2,arg3,self.locks)
    end)
    self.abilTextList = {}
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    GUI:removeAllChildren(self.ui.Layout)
    for i, v in ipairs(self.config) do
        -- Create ImageView_1
        local Panel_1 = GUI:Layout_Create(self.ui.Layout, "Panel_"..i, 0.00, 0.00, 282.00, 36.00, false)
        GUI:setTag(Panel_1, i)
        GUI:setTouchEnabled(Panel_1, true)
        -- Create Text_1
        local Text_1 = GUI:Text_Create(Panel_1, "Text_1"..i, 114.00, 5.00, 18, "#00fb00", [[未洗炼]])
        GUI:setTouchEnabled(Text_1, false)
        GUI:Text_enableOutline(Text_1, "#000000", 1)
        table.insert(self.abilTextList,Text_1)

        -- Create Text_2
        local Text_2 = GUI:Text_Create(Panel_1, "Text_2"..i, 178.00, 6.00, 18, "#FF0006", string.format("[max:%s%%]",v.max))
        GUI:setTouchEnabled(Text_2, false)
        GUI:Text_enableOutline(Text_2, "#000000", 1)

        GUI:addOnClickEvent(Panel_1, function()
            local txtObj  = GUI:getChildByName(Panel_1, "Text_1"..i)
            local txt = ""
            if txtObj then
                txt = GUI:Text_getString(txtObj)
            end
            if txt == "未洗炼" then
                sendmsg9("未洗炼无法锁定！")
                return
            end
            self.locks[i] = self.locks[i] == 0 and 1 or 0
            if self.locks[i] == 1 then
                local ImageView = GUI:Image_Create(Panel_1, "ImageView_lock"..i, 0.00, 0.00, "res/custom/KuangFengXiLian/lookState.png")
                GUI:setContentSize(ImageView, 281, 36)
            else
                GUI:removeChildByName(Panel_1, "ImageView_lock"..i)
            end
            self:UpdateCost()
        end)
        if self.locks[i] == 1 then
            local ImageView = GUI:Image_Create(Panel_1, "ImageView_lock"..i, 0.00, 0.00, "res/custom/KuangFengXiLian/lookState.png")
            GUI:setContentSize(ImageView, 281, 36)
        end
    end

    GUI:UserUILayout(self.ui.Layout, {
        dir=1,
        addDir=2,
        interval=0,
        gap = {y=13},
        sortfunc = function (lists)
            table.sort(lists, function (a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end
    })

    self:UpdateUI()
end

function KuangFengXiLianOBJ:UpdateUI()
    --self.yuanBaoconu
    GUI:Text_setString(self.ui.Text_1, SL:GetSimpleNumber(self.yuanBaoConut, 2) )
    local equip = SL:GetMetaValue("EQUIP_DATA", self.where)
    local abils = equip.ExAbil.abil[1].v
    self.isMax = 0
    if #abils >= 5 then
        for i, v in ipairs(self.abilTextList) do
            local cfg = self.config[i]
            if abils[i][3] == cfg.max then
                self.isMax = self.isMax + 1
            end
            GUI:Text_setString(v, string.format("+%d%%", abils[i][3]))
         end
    end
    self:UpdateCost()
end

function KuangFengXiLianOBJ:UpdateCost()
    local costYuanBao = {{"元宝", 100000}}
    for i, v in ipairs(self.locks) do
        if v ~= 0 then
            costYuanBao[1][2] = costYuanBao[1][2] + 200000
        end
    end
    showCostFont(self.ui.Layout_1, costYuanBao,{hideName = true})
    delRedPoint(self.ui.ButtonStart)
    if self.isMax < 5 then
        Player:checkAddRedPoint(self.ui.ButtonStart, costYuanBao)
    end

end


function KuangFengXiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.yuanBaoConut = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return KuangFengXiLianOBJ
