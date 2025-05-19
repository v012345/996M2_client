SiShenJiTanOBJ = {}
SiShenJiTanOBJ.__cname = "SiShenJiTanOBJ"
SiShenJiTanOBJ.cost1 = {{"风之圣纹", 1},{"死亡如风[称号]", 1}}
SiShenJiTanOBJ.cost2 = {{"◆影杀阵◆", 1},{"造化结晶", 22}}



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function SiShenJiTanOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.SiShenJiTan_Request)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()

    ssrAddItemListX(self.ui.itemlooks_1, {self.cost1[1]},"影杀阵",{imgRes = ""})
    ssrAddItemListX(self.ui.itemlooks_2, {self.cost1[2]},"圣火遗灰",{imgRes = ""})
end

function SiShenJiTanOBJ:UpdateUI()
    showCost(self.ui.itemlooks_3,{self.cost2[1]},0,{itemBG = ""})
    showCost(self.ui.itemlooks_4,{self.cost2[2]},0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost2,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function SiShenJiTanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return SiShenJiTanOBJ