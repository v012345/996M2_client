ZuLongZhiDiOBJ = {}
ZuLongZhiDiOBJ.__cname = "ZuLongZhiDiOBJ"
--ZuLongZhiDiOBJ.config = ssrRequireCsvCfg("cfg_ZuLongZhiDi")
ZuLongZhiDiOBJ.cost = { { "金币", 30000000 } }
ZuLongZhiDiOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZuLongZhiDiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ZuLongZhiDi_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZuLongZhiDi_Request2)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.ZuLongZhiDi_SyncResponse)
end

function ZuLongZhiDiOBJ:UpdateUI()
    GUI:Text_setString(self.ui.Text_1,string.format("%d/10", self.count))
    delRedPoint(self.ui.Button_1)
    if self.flag == 0 and self.count >= 10 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end
    if self.flag == 1 then
        addRedPoint(self.ui.Button_2,30,5)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZuLongZhiDiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count = arg1
    self.flag = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZuLongZhiDiOBJ