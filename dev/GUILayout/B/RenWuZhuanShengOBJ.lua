RenWuZhuanShengOBJ = {}
RenWuZhuanShengOBJ.__cname = "RenWuZhuanShengOBJ"
RenWuZhuanShengOBJ.config = ssrRequireCsvCfg("cfg_RenewLevelData")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function RenWuZhuanShengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    local NPCID = objcfg.NPCID
    self.NPCID = NPCID
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)

    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-45,-20)
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
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_Request, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.RenWuZhuanSheng_Request, objcfg.NPCID)
    end)

end

function RenWuZhuanShengOBJ:UpdateUI()

    local RenewLevel_data = { [205]= 1, [310]= 2, [426]= 4, [518]= 5, [625]= 6, [711]= 7, [801]= 8}
    local RenewLevel_data = RenewLevel_data[self.NPCID]  --根据Npc获取配置页面
    local Relevellooks = SL:GetMetaValue("RELEVEL")     --获取人物转生等级
    local cfg = self.config[RenewLevel_data]             --获取人物配置

    if self.NPCID == 310 then
        if Relevellooks == 1 then
            cfg = self.config[2]             --获取人物配置
            RenewLevel_data = 2
        end
        if Relevellooks >= 2 then
            cfg = self.config[3]             --获取人物配置
            RenewLevel_data = 3
        end
    end

    GUI:Image_loadTexture(self.ui.Level_looks, "res/custom/zhuanshengxitong/num_"..RenewLevel_data..".png")
    GUI:Text_setString(self.ui.DecLevel_Looks, cfg.DecLevel)
    --配置左侧 条件显示
    local L_x = 180
    for i, v in ipairs(cfg.Check) do
        local Image_Cost = GUI:Image_Create(self.ui.Layout_Cost, "Image_Cost"..i, 0.00, L_x, "res/custom/zhuanshengxitong/yq".. i ..".png")
        GUI:Text_Create(Image_Cost, "Cost_Looks"..i, 75.00, 8.00, 16, "#ff8000", v)
        L_x = L_x - 40
    end
    --配置左侧 奖励显示
    local R_x = 180
    for i, v in ipairs(cfg.Award) do
        local Image_Cost = GUI:Image_Create(self.ui.Layout_Award, "Image_Cost"..i, 0.00, R_x, "res/custom/zhuanshengxitong/jl".. i ..".png")
        GUI:Text_Create(Image_Cost, "Cost_Looks"..i, 75.00, 8.00, 16, "#ff8000", v)
        R_x = R_x - 40
    end
    showCost(self.ui.Item_Looks, {cfg.Cost[1],cfg.Cost[2]},60)


    Player:checkAddRedPoint(self.ui.Button_Request,cfg.Cost,30,10)


end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function RenWuZhuanShengOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return RenWuZhuanShengOBJ