JiMieGuiXuOBJ = {}
JiMieGuiXuOBJ.__cname = "JiMieGuiXuOBJ"
JiMieGuiXuOBJ.cost = {{"黑暗精华", 288},{"书页", 3888}}
JiMieGuiXuOBJ.show = {{"寂灭归墟[技能]", 1}}



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiMieGuiXuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.JiMieGuiXu_Request)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrAddItemListX(self.ui.ItemLooks_1, self.show,"奖励展示",{imgRes = ""})


    self:UpdateUI()
end

function JiMieGuiXuOBJ:UpdateUI()
    showCost(self.ui.ItemLooks_2,self.cost,52,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiMieGuiXuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiMieGuiXuOBJ