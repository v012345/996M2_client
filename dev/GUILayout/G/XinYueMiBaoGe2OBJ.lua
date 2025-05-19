XinYueMiBaoGe2OBJ = {}
XinYueMiBaoGe2OBJ.__cname = "XinYueMiBaoGe2OBJ"
XinYueMiBaoGe2OBJ.ItemData = {
    "群星之怒★★★","夜风·不败剑意","星辉的祷告乀","御天机","哨兵之首","无序战盔","生灵·屠杀","星神之坠","新月领域△核心","幕轮","狂魔·永夜","贪婪之噬","影幕之指","★★星魂永燃★★",
    "无序的邪力","无序的凝视","刺·束缚之隐","无序◎奥秘","『神耀』","悟道神带","原初■混乱■","〝回魂〞","心有琉璃","無上生霊″魂灭生","『畸变』","光辉之怒·鸩","星辉·猎杀狩命","◆黑洞◆","万法面具",
    "·天魔之冠·破天·","血奴印记","混乱制造者","神之■庇护","新月头盔[月灵]","新月项链[月灵]","醉月手镯[魂灭]","醉月戒指[魂灭]","风月腰带[魂生]","风月鞋子[魂生]","ζ法相天地ζ","ζ聖●法相天地ζ",
    "卐卐正道鏡卐卐","卐卐提魂锁卐卐","△△雷道天卷△△","△△玄天令△△","▲▲火雲真經▲▲","▲▲水鏡太極▲▲","‖「谣影神靴」‖"
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XinYueMiBaoGe2OBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    ------------------------↓↓↓ 通讯后端 ↓↓↓------------------------
    ssrMessage:sendmsg(ssrNetMsgCfg.XinYueMiBaoGe2_SyncResponse)
    ------------------------↑↑↑ 通讯后端 ↑↑↑------------------------
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
        ssrMessage:sendmsg(ssrNetMsgCfg.XinYueMiBaoGe2_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XinYueMiBaoGe2_Request, 2)
    end)
end

function XinYueMiBaoGe2OBJ:UpdateUI()
    if self.TongXingZheng == 1 then
        GUI:Image_loadTexture(self.ui.StateLooks1, "res/custom/HunDunBenYuan/kx2.png")
    end

    if self.RiChongNum >= 68 then
        GUI:Image_loadTexture(self.ui.StateLooks2, "res/custom/HunDunBenYuan/kx2.png")
    end

    --掉落物品随机展示
    local IsData  = SL:CopyData(self.ItemData)
    local ItemShow = {}
    for i = 1, 10 do
        local Nums = math.random(1, #IsData)
        table.insert(ItemShow, {IsData[Nums], 1})
        table.remove(IsData, Nums)
    end
    ssrAddItemListX(self.ui.ItemLooks, ItemShow,"掉落展示",{spacing = 10})
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XinYueMiBaoGe2OBJ:SyncResponse(TongXingZheng, RiChongNum, arg3, data)
    self.TongXingZheng = TongXingZheng
    self.RiChongNum = RiChongNum

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XinYueMiBaoGe2OBJ