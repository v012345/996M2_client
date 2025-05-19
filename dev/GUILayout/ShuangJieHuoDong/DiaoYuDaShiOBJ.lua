DiaoYuDaShiOBJ = {}
DiaoYuDaShiOBJ.__cname = "DiaoYuDaShiOBJ"
--DiaoYuDaShiOBJ.config = ssrRequireCsvCfg("cfg_DiaoYuDaShi")
DiaoYuDaShiOBJ.cost = {{}}
DiaoYuDaShiOBJ.give = {{}}
--鱼竿位置
DiaoYuDaShiOBJ.fishing_pos = {
    {330,90},
    {196,108},
    {70,128},
}
local startFishingPath = "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/start/tx_"
local holdFishingPath = "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/hold/tx_"
local endFishingPath = "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/end/tx_"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DiaoYuDaShiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.DiaoYuDaShi_Request)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        GUI:setVisible(self.ui.Panel_addFishingRod, true)
    end)
    GUI:addOnClickEvent(self.ui.Panel_addFishingRod, function()
        GUI:setVisible(self.ui.Panel_addFishingRod, false)
    end)
    GUI:addOnClickEvent(self.ui.Button_addFishingRodClose, function()
        GUI:setVisible(self.ui.Panel_addFishingRod, false)
    end)
    --关闭鱼获
    GUI:addOnClickEvent(self.ui.Panel_shouHuo, function()
        GUI:setVisible(self.ui.Panel_shouHuo, false)
    end)
    GUI:addOnClickEvent(self.ui.Button_ShouHuoClose, function()
        GUI:setVisible(self.ui.Panel_shouHuo, false)
    end)
    --购买位置
    GUI:addOnTouchEvent(self.ui.Panel_gouMaiCiShu, function()
        GUI:setVisible(self.ui.Panel_gouMaiCiShu, false)
    end)
    GUI:addOnTouchEvent(self.ui.Button_gouMaiCiShuClose, function()
        GUI:setVisible(self.ui.Panel_gouMaiCiShu, false)
    end)
    GUI:addOnTouchEvent(self.ui.Button_2, function()
        GUI:setVisible(self.ui.Panel_gouMaiCiShu, true)
    end)
    GUI:addOnTouchEvent(self.ui.Button_gouMaiCiShu, function()
        local data = {}
        data.str = "确定花费[100非绑灵符]增加次数？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.DiaoYuDaShi_BuyCount)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    --购买钓位
    GUI:addOnClickEvent(self.ui.Button_buyFishingRod, function()
        local data = {}
        data.str = "确定花费[200W元宝]购买钓位？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.DiaoYuDaShi_BuyPos)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    
    self:ShowUI()
    self:UpdateUI()
end

--显示界面
function DiaoYuDaShiOBJ:ShowUI()
    local ext = {
        count = 20,
        speed = 100,
        loop  =  -1,
        finishhide = 0
    }
    GUI:Frames_Create(self.ui.Node_1, "frame_bg", 0, 0, "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/frames/bg_", ".png", 1, 20,ext)
end

--开始钓鱼
function DiaoYuDaShiOBJ:StartFishing()
    local ext = {
        count = 5,
        speed = 200,
        loop  =  1,
        finishhide = 1
    }
    GUI:removeAllChildren(self.ui.Node_fishingRod)
    for i = 1, self.fishingRodNum do
        local pos = self.fishing_pos[i]
        GUI:Frames_Create(self.ui.Node_fishingRod, "fishingRod_"..i, pos[1], pos[2], startFishingPath, ".png", 1, 5,ext)
    end
    local jindu = 0
    local function updateJindu()
        jindu = jindu + 1
        GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, jindu)
        GUI:Text_setString(self.ui.Text_jinDuFont, "钓鱼中.."..jindu.."%")
        SL:scheduleOnce(self.ui.Node_fishingRod, function()
            if jindu < 100 then
                updateJindu()
            end
        end, 0.04)
    end
    SL:ScheduleOnce(function()
        ext = {
            count = 2,
            speed = 200,
            loop  =  -1,
            finishhide = 1
        }
        for i = 1, self.fishingRodNum do
            local pos = self.fishing_pos[i]
            GUI:Frames_Create(self.ui.Node_fishingRod, "holdFishingRod_"..i, pos[1], pos[2], holdFishingPath, ".png", 1, 2,ext)
        end
        GUI:setVisible(self.ui.Panel_jinDu, true)
        updateJindu()
    end, 0.9)
end

function DiaoYuDaShiOBJ:UpdateUI()
    --如果界面显示则隐藏
    if GUI:getVisible(self.ui.Panel_addFishingRod) then
        GUI:setVisible(self.ui.Panel_addFishingRod, false)
    end
    GUI:removeAllChildren(self.ui.Node_fishingRod)
    for i = 1, self.fishingRodNum do
        local pos = self.fishing_pos[i]
        if pos then
            GUI:Image_Create(self.ui.Node_fishingRod, "Image_"..i, pos[1], pos[2], startFishingPath.."1.png")
        end
    end
    if self.fishingRodNum == 1 then
          GUI:setPosition(self.ui.Button_3, 420, 186)
    elseif self.fishingRodNum == 2 then
        GUI:setPosition(self.ui.Button_3, 283, 186)
    else
        GUI:setVisible(self.ui.Button_3, false)
    end
    local shengYuCiShu = 10 - self.toDayFishingCount
    if shengYuCiShu <= 0 then
        shengYuCiShu = 0
    end
    GUI:Text_setString(self.ui.Text_1, shengYuCiShu + self.buyFishingNum)
    GUI:Text_setString(self.ui.Text_sygmcs, string.format("今日还可购买%d次", 30 - self.fishingNum))
end
function DiaoYuDaShiOBJ:ShouHuo(arg1, arg2, arg3, data)
    GUI:setVisible(self.ui.Panel_jinDu, false)
    GUI:setVisible(self.ui.Panel_shouHuo, true)
    ssrAddItemListX(self.ui.Panel_shouHuoShou, data, "item_list", {spacing = 49, imgRes = "res/custom/ShuangJieHuoDongMain/DiaoYuDaShi/itembg.png"})
    GUI:Timeline_Window1(self.ui.Image_5)
    GUI:removeAllChildren(self.ui.Node_fishingRod)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function DiaoYuDaShiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.fishingRodNum = arg1 + 1
    self.toDayFishingCount = arg2
    self.buyFishingNum = arg3
    self.fishingNum = data[1]
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return DiaoYuDaShiOBJ