
KongJianFaShiOBJ = {}

KongJianFaShiOBJ.__cname = "KongJianFaShiOBJ"
KongJianFaShiOBJ.cost = {{"破碎的魔法阵",20}}
KongJianFaShiOBJ.itemlook = {{"斗转星移[残]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KongJianFaShiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true)
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

    --挂载 文字格式 消耗显示 
    showCostFont(self.ui.Layout1, self.cost,{fontSize=19,fontColor="#44DDFF"})

    --挂载 item 显示
    ssrAddItemListX(self.ui.Layout2, self.itemlook,"item",{imgRes = ""})

    -- 按钮点击
    GUI:addOnClickEvent(self.ui.Button1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.KongJianFaShi_Request)
    end)
    Player:checkAddRedPoint(self.ui.Button1, self.cost, 25, 3)
end

return KongJianFaShiOBJ
