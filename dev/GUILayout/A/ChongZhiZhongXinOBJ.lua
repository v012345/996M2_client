ChongZhiZhongXinOBJ = {}
ChongZhiZhongXinOBJ.__cname = "ChongZhiZhongXinOBJ"
ChongZhiZhongXinOBJ.config = ssrRequireCsvCfg("cfg_ChongZhiZhongXin")
ChongZhiZhongXinOBJ.PayWay = 1
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChongZhiZhongXinOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -30, 0)
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
    GUI:Timeline_Window1(self._parent)
    self:UpdateUI()

    -------------------------------↓↓↓支付方式切换↓↓↓-------------------------------
    GUI:addOnClickEvent(self.ui.TopUp_Button_1, function()
        ChongZhiZhongXinOBJ:Switchpay(1)
    end)

    GUI:addOnClickEvent(self.ui.TopUp_Button_2, function()
        ChongZhiZhongXinOBJ:Switchpay(2)
    end)

    GUI:addOnClickEvent(self.ui.TopUp_Button_3, function()

        ChongZhiZhongXinOBJ:Switchpay(3)
    end)
    -------------------------------↑↑↑支付方式切换↑↑↑-------------------------------


    --自定义充值
    GUI:addOnClickEvent(self.ui.Request_Button, function()
        local num = GUI:TextInput_getString(self.ui.Input)
        ssrMessage:sendmsg(ssrNetMsgCfg.ChongZhiZhongXin_Request1, self.PayWay, num)
    end)
end

function ChongZhiZhongXinOBJ:Switchpay(num)
    GUI:setVisible(self.ui.ZhiFuFangShi1, false)
    GUI:setVisible(self.ui.ZhiFuFangShi2, false)
    GUI:setVisible(self.ui.ZhiFuFangShi3, false)
    GUI:setVisible(self.ui["ZhiFuFangShi"..num], true)
    self.PayWay = num
end

function ChongZhiZhongXinOBJ:UpdateUI()
    ChongZhiZhongXinOBJ:Switchpay(self.PayWay)
    GUI:removeAllChildren(self.ui.Panel_1)
    for i = 1, 8 do
        local cfg = self.config[i]
        local Type_Image = GUI:Image_Create(self.ui.Panel_1, "Type_Image"..i, 0.00, 0.00, "res/custom/ChongZhiZhongXin/".. cfg.Image ..".png")
        local ButtonLayout = GUI:Layout_Create(Type_Image, "ButtonLayout"..i, 5.00, 15.00, 190, 235, false)
            GUI:setTouchEnabled(ButtonLayout,true)
            GUI:addOnClickEvent(ButtonLayout, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.ChongZhiZhongXin_Request2,self.PayWay,i,cfg.Sum)
            end)
        local itemlooks = GUI:Layout_Create(Type_Image, "itemlooks"..i, 35.00, 67.00, 160, 35, false)
        if self.data[i] == 0 then
            ssrAddItemListX(itemlooks, cfg.award,"奖励1",{imgRes = "",spacing = 45, itemScale = 1})
        else
            ssrAddItemListX(itemlooks, {cfg.award[1]},"奖励",{imgRes = "",spacing = 45, itemScale = 1})
        end
    end
    --容器自适应排列
    GUI:UserUILayout(self.ui.Panel_1, { dir=3, addDir=1, colnum=4 })

    --判断是否已经领取全部档位
    local AwardState = 0
    for i = 1, 8 do
        AwardState = AwardState + self.data[i]
    end
    if AwardState == 8 then
        GUI:setVisible(self.ui.Money_24_Img, false)
    else
        GUI:Text_setString(self.ui.Money_24_Num, self.data[9])
    end
    GUI:Text_setString(self.ui.Money_22_Num, self.data[10])
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChongZhiZhongXinOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    --SL:dump(data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

function ChongZhiZhongXinOBJ:OpenUI(arg1, arg2, arg3, data)
    ssrUIManager:OPEN(ssrObjCfg.ChongZhiZhongXin)
end
return ChongZhiZhongXinOBJ