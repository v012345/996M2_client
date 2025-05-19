YunLieOBJ = {}
YunLieOBJ.__cname = "YunLieOBJ"
--YunLieOBJ.config = ssrRequireCsvCfg("cfg_YunLie")
YunLieOBJ.cost = { { "魔龙牙", 10 }, { "魔龙骨", 10 } }
YunLieOBJ.give = {{"魔龙幻化碎片",1},{"二元归灵珠",1},{"魔龙·幻化",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YunLieOBJ:main(objcfg)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        GUI:setVisible(self.ui.Node_1,false)
        GUI:setVisible(self.ui.Node_2,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        GUI:setVisible(self.ui.Node_2,false)
        GUI:setVisible(self.ui.Node_3,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YunLie_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YunLie_Request2)
    end)
    self:UpdateUI()
end

function YunLieOBJ:Close()
    GUI:Win_Close(self._parent)
end

function YunLieOBJ:UpdateUI()
    if self.flag == 1 then
        GUI:setVisible(self.ui.Node_4,true)
    else
        GUI:setVisible(self.ui.Node_1,true)
    end
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing=20})
    showCost(self.ui.Panel_2,self.cost,20)
    Player:checkAddRedPoint(self.ui.Button_8, self.cost, 30, 5)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YunLieOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YunLieOBJ