PoXiaoMiBaoGeAOBJ = {}
PoXiaoMiBaoGeAOBJ.__cname = "PoXiaoMiBaoGeAOBJ"
PoXiaoMiBaoGeAOBJ.ItemData = {
  "异界神石","幽冥残魂","造化结晶","被封印的剑灵","苦修者的秘籍","暗黑之神宝藏","大天使的神威","轮回经","掌控奥义","一团杂乱的纸",
  "漆黑的刀","龙蛋?","时空门票","时空旅人称号卷","时空游侠称号卷","给你马一拳","强化+9999","勿忘我","无尽的华尔兹","孤影流觞",
  "降星者","永恒凛冬","金色黎明的圣物箱","一缕神念","暮潮"
}



--PoXiaoMiBaoGeAOBJ.config = ssrRequireCsvCfg("cfg_ShengChengMiBaoGeA")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function PoXiaoMiBaoGeAOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    ------------------------↓↓↓ 通讯后端 ↓↓↓------------------------
    ssrMessage:sendmsg(ssrNetMsgCfg.PoXiaoMiBaoGeA_SyncResponse)
    ------------------------↑↑↑ 通讯后端 ↑↑↑------------------------
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

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.PoXiaoMiBaoGeA_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.PoXiaoMiBaoGeA_Request,2)
    end)



    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)


end

function PoXiaoMiBaoGeAOBJ:UpdateUI()

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
function PoXiaoMiBaoGeAOBJ:SyncResponse(TongXingZheng, RiChongNum, arg3, data)
    self.TongXingZheng = TongXingZheng
    self.RiChongNum = RiChongNum


    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return PoXiaoMiBaoGeAOBJ