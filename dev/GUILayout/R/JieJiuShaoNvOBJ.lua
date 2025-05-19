JieJiuShaoNvOBJ = {}
JieJiuShaoNvOBJ.__cname = "JieJiuShaoNvOBJ"
--JieJiuShaoNvOBJ.config = ssrRequireCsvCfg("cfg_JieJiuShaoNv")
JieJiuShaoNvOBJ.cost = {{}}
JieJiuShaoNvOBJ.give = {{"少女拯救者[称号]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JieJiuShaoNvOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.JieJiuShaoNv_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JieJiuShaoNv_Request2)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    self:UpdateUI()
end

function JieJiuShaoNvOBJ:UpdateUI()
    GUI:Text_setString(self.ui.Text_1,string.format("(%d/3)",self.count))
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JieJiuShaoNvOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JieJiuShaoNvOBJ