YiYeYiPuTiOBJ = {}
YiYeYiPuTiOBJ.__cname = "YiYeYiPuTiOBJ"
--YiYeYiPuTiOBJ.config = ssrRequireCsvCfg("cfg_YiYeYiPuTi")
YiYeYiPuTiOBJ.cost = { {"血菩提",1} }
YiYeYiPuTiOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YiYeYiPuTiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YiYeYiPuTi_Request)
    end)
    self:UpdateUI()
end

function YiYeYiPuTiOBJ:UpdateUI()
    GUI:Text_setString(self.ui.Text_1,string.format("(%d/10)",self.count))
    showCost(self.ui.Panel_1,self.cost,0)
    delRedPoint(self.ui.Button_1)
    if self.count < 10 then
        SL:dump("?asd")
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YiYeYiPuTiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YiYeYiPuTiOBJ