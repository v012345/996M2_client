BuQiYanDeQiGaiOBJ = {}
BuQiYanDeQiGaiOBJ.__cname = "BuQiYanDeQiGaiOBJ"
--BuQiYanDeQiGaiOBJ.config = ssrRequireCsvCfg("cfg_BuQiYanDeQiGai")
BuQiYanDeQiGaiOBJ.cost = { {} }
BuQiYanDeQiGaiOBJ.give = { { "谣将印信", 1 } }
BuQiYanDeQiGaiOBJ.isShiShe = false
BuQiYanDeQiGaiOBJ.targetNum = 1000000000
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BuQiYanDeQiGaiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
        local goldNum = tonumber(GUI:TextInput_getString(self.ui.TextInput_1)) or 0
        if type(goldNum) ~= "number" then
            sendmsg9("请输入正确的内容#249")
            return
        end
        if goldNum > 2100000000 then
            sendmsg9("数量不可以超过21亿！#249")
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.BuQiYanDeQiGai_Request, goldNum)
        self.isShiShe = true
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        self.isShiShe = false
        self:UpdateUI()
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        self.isShiShe = false
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        self.isShiShe = false
        ssrMessage:sendmsg(ssrNetMsgCfg.BuQiYanDeQiGai_LingQu)
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    self:UpdateUI()
end

function BuQiYanDeQiGaiOBJ:UpdateUI()
    local condition = 1
    if self.currNum < self.targetNum then
        condition = 1
    end
    if self.currNum < self.targetNum and self.isShiShe then
        condition = 2
    end
    if self.currNum >= self.targetNum and self.flag == 0 then
        condition = 3
    end
    if self.currNum >= self.targetNum and self.flag == 1 then
        condition = 4
    end
    self:PanelShow(condition)
end

function BuQiYanDeQiGaiOBJ:PanelShow(condition)
    local nodeList = { self.ui.Node_1, self.ui.Node_2, self.ui.Node_3, self.ui.Node_4 }
    for i, v in ipairs(nodeList) do
        if i == condition then
            GUI:setVisible(v,true)
        else
            GUI:setVisible(v,false)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function BuQiYanDeQiGaiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.currNum = arg1
    self.flag = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return BuQiYanDeQiGaiOBJ