HuoYanJieOBJ = {}
HuoYanJieOBJ.__cname = "HuoYanJieOBJ"
--HuoYanJieOBJ.config = ssrRequireCsvCfg("cfg_HuoYanJie")
HuoYanJieOBJ.cost = {{"神魂碎片",44},{"混沌本源",88},{"元宝",4444444}}
HuoYanJieOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HuoYanJieOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoYanJie_Request)
    end)
    --更新界面
    self:UpdateUI()
end

function HuoYanJieOBJ:UpdateUI()
    --消耗显示
    showCost(self.ui.ItemShow,self.cost,12,{itemBG = ""})

    local bool = self.data[1]
    if bool == 1 then
        GUI:setVisible(self.ui.Image_1,true)
    else
        GUI:setVisible(self.ui.Button_1,true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HuoYanJieOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HuoYanJieOBJ