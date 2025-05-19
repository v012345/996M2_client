YuWaiZhanChangOBJ = {}
YuWaiZhanChangOBJ.__cname = "YuWaiZhanChangOBJ"
--YuWaiZhanChangOBJ.config = ssrRequireCsvCfg("cfg_YuWaiZhanChang")
YuWaiZhanChangOBJ.cost = {{}}
YuWaiZhanChangOBJ.give = {{"死神代言人",1},{"源火禁锢",1},{"灵魂面具",1},{"死神降临",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YuWaiZhanChangOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YuWaiZhanChang_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
end

function YuWaiZhanChangOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YuWaiZhanChangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YuWaiZhanChangOBJ