TianYuanBianGuanOBJ = {}
TianYuanBianGuanOBJ.__cname = "TianYuanBianGuanOBJ"
--TianYuanBianGuanOBJ.config = ssrRequireCsvCfg("cfg_TianYuanBianGuan")
TianYuanBianGuanOBJ.cost = {{}}
TianYuanBianGuanOBJ.give = {{"魔化的眼罩",1},{"收割者",1},{"梦魇头冠",1},{"魔兽之爪",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TianYuanBianGuanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,30)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.TianYuanBianGuan_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_",{spacing = 10})
end

function TianYuanBianGuanOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TianYuanBianGuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TianYuanBianGuanOBJ