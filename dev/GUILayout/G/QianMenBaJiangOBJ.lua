QianMenBaJiangOBJ = {}
QianMenBaJiangOBJ.__cname = "QianMenBaJiangOBJ"
--QianMenBaJiangOBJ.config = ssrRequireCsvCfg("cfg_QianMenBaJiang")
QianMenBaJiangOBJ.give = {{"八将复苏珠",1},{"千王之王[称号]",1}}


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QianMenBaJiangOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0, -35)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 4)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 5)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 6)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 7)
    end)
    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 8)
    end)
    GUI:addOnClickEvent(self.ui.Button_9, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.QianMenBaJiang_Request, 9)
    end)


    GUI:addOnClickEvent(self.ui.Tips_Button, function()
        local bool = GUI:getVisible(self.ui.Tips_Show)
        if not bool then
            GUI:setVisible(self.ui.Tips_Show, true)
        else
            GUI:setVisible(self.ui.Tips_Show, false)
        end
    end)



    --奖励显示
    ssrAddItemListX(self.ui.ItemShow, self.give,"奖励1",{imgRes = "",spacing = 112})
    self:UpdateUI()
end

function QianMenBaJiangOBJ:UpdateUI()
    GUI:setVisible(self.ui.Button_9, false)
    GUI:setVisible(self.ui.Image_9, false)
    if self.arg3 == 1 then
        GUI:setVisible(self.ui.Image_9, true)
    else
        GUI:setVisible(self.ui.Button_9, true)
    end



    local AllObj =  GUI:getChildren(self.ui.AllIoc)
    for _, v in ipairs(AllObj) do
        GUI:setVisible(v, false)
    end

    if  not self.data["正"] then
        GUI:setVisible(self.ui.Image_1_1, true)
    else
        if self.data["正"].State == "已激活" then
            GUI:setVisible(self.ui.Image_1_2, true)
        else
           GUI:setVisible(self.ui.Image_1_1, true)
        end
    end

    if  not self.data["提"] then
        GUI:setVisible(self.ui.Image_2_1, true)
    else
        if self.data["提"].State == "已激活" then
            GUI:setVisible(self.ui.Image_2_2, true)
        else
           GUI:setVisible(self.ui.Image_2_1, true)
        end
    end

    if  not self.data["反"] then
        GUI:setVisible(self.ui.Image_3_1, true)
    else
        if self.data["反"].State == "已激活" then
            GUI:setVisible(self.ui.Image_3_2, true)
        else
           GUI:setVisible(self.ui.Image_3_1, true)
        end
    end

    if  not self.data["脱"] then
        GUI:setVisible(self.ui.Image_4_1, true)
    else
        if self.data["脱"].State == "已激活" then
            GUI:setVisible(self.ui.Image_4_2, true)
        else
           GUI:setVisible(self.ui.Image_4_1, true)
        end
    end

    if  not self.data["风"] then
        GUI:setVisible(self.ui.Image_5_1, true)
    else
        if self.data["风"].State == "已激活" then
            GUI:setVisible(self.ui.Image_5_2, true)
        else
           GUI:setVisible(self.ui.Image_5_1, true)
        end
    end

    if  not self.data["火"] then
        GUI:setVisible(self.ui.Image_6_1, true)
    else
        if self.data["火"].State == "已激活" then
            GUI:setVisible(self.ui.Image_6_2, true)
        else
           GUI:setVisible(self.ui.Image_6_1, true)
        end
    end

    if  not self.data["除"] then
        GUI:setVisible(self.ui.Image_7_1, true)
    else
        if self.data["除"].State == "已激活" then
            GUI:setVisible(self.ui.Image_7_2, true)
        else
           GUI:setVisible(self.ui.Image_7_1, true)
        end
    end

    if  not self.data["谣"] then
        GUI:setVisible(self.ui.Image_8_1, true)
    else
        if self.data["谣"].State == "已激活" then
            GUI:setVisible(self.ui.Image_8_2, true)
        else
           GUI:setVisible(self.ui.Image_8_1, true)
        end
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QianMenBaJiangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.arg3 = arg3
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QianMenBaJiangOBJ