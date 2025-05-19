HaFaXiSiChengHaoOBJ = {}
HaFaXiSiChengHaoOBJ.__cname = "HaFaXiSiChengHaoOBJ"
HaFaXiSiChengHaoOBJ.config = ssrRequireCsvCfg("cfg_HaFaXiSiChengHao")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HaFaXiSiChengHaoOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HaFaXiSiChengHao_Request)
    end)


    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()
end

local CheckTitle = {"哈法西斯挑战者Lv1","哈法西斯挑战者Lv2", "哈法西斯挑战者Lv3", "哈法西斯挑战者Lv4", "哈法西斯挑战者Lv5"}
function HaFaXiSiChengHaoOBJ:UpdateUI()
    GUI:removeAllChildren(self.ui.ListView_All)
    local MyTitleTbl = {}
    local _MyTitleTbl = SL:GetMetaValue("TITLES")     --获取玩家所有称号 插入tbl
    for i, v in ipairs(_MyTitleTbl) do
        local TitleName = SL:GetMetaValue("ITEM_NAME", v.id)
        table.insert(MyTitleTbl, TitleName)
    end
    --检测拥有那个称号
    local NowTitle = ""
    for _, k in ipairs(CheckTitle) do
        for _, v in ipairs(MyTitleTbl) do
            if k == v  then
                NowTitle = k
                break
            end
        end
    end
    --获取称号对应的配置
    local LooskNum = 1
    local cfg = {}
    if NowTitle == "哈法西斯挑战者Lv5" then
        LooskNum = 5
        cfg = self.config[5]
    elseif NowTitle == "" then
        LooskNum = 1
        cfg = self.config[1]
    else
        for i, v in ipairs(self.config) do
            if NowTitle == v.Title then
                LooskNum = i+1
                cfg = self.config[i+1]
            end
        end
    end
    for i = 1, 5 do
        if LooskNum >= i then
            local Image = GUI:Image_Create(self.ui.ListView_All, "Image_"..i, 0.00, 0.00, "res/custom/JuQing/HaFaXiSiChengHao/button_".. i .."_2.png")
            if LooskNum == i  then
                GUI:Image_Create(Image, "Image_pick", 0.00, 0.00, "res/custom/JuQing/HaFaXiSiChengHao/img_pick.png")
            end
        else
            GUI:Image_Create(self.ui.ListView_All, "Image_"..i, 0.00, 0.00, "res/custom/JuQing/HaFaXiSiChengHao/button_".. i .."_1.png")
        end
    end
    GUI:Text_setString(self.ui.Att_GongJi,"攻击增加："..cfg.Attr)
    GUI:Text_setString(self.ui.Att_MoFa,"魔法增加："..cfg.Attr)
    GUI:Text_setString(self.ui.Att_DaoShu,"道数增加："..cfg.Attr)
    GUI:Text_setString(self.ui.Att_HPZhi,"HP增加："..cfg.HpAndMp)
    GUI:Text_setString(self.ui.Att_MPZhi,"MP增加："..cfg.HpAndMp)
    GUI:Text_setString(self.ui.Att_AllAttr,"全属性增加："..cfg.AllAttr.."%")
    showCost(self.ui.ItemLooks, cfg.Cost,30)
    Player:checkAddRedPoint(self.ui.Button_1, cfg.Cost, 30, 10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HaFaXiSiChengHaoOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HaFaXiSiChengHaoOBJ