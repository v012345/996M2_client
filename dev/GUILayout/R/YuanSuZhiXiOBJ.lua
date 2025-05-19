YuanSuZhiXiOBJ = {}
YuanSuZhiXiOBJ.__cname = "YuanSuZhiXiOBJ"
--YuanSuZhiXiOBJ.config = ssrRequireCsvCfg("cfg_YuanSuZhiXi")
YuanSuZhiXiOBJ.give = {{"元素裂隙权杖",1}}
YuanSuZhiXiOBJ.cost = {{"放逐之心",20}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YuanSuZhiXiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-30)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YuanSuZhiXi_Request)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrAddItemListX(self.ui.Panel_1, self.give,"item_")
    ssrMessage:sendmsg(ssrNetMsgCfg.YuanSuZhiXi_SyncResponse)
    self:UpdateUI()
end

function YuanSuZhiXiOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,10)
    delRedPoint(self.ui.Button_1)
    if self.flag == 0 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YuanSuZhiXiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YuanSuZhiXiOBJ