HuoZhiYuOBJ = {}
HuoZhiYuOBJ.__cname = "HuoZhiYuOBJ"
--HuoZhiYuOBJ.config = ssrRequireCsvCfg("cfg_HuoZhiYu")
HuoZhiYuOBJ.cost = {{}}
HuoZhiYuOBJ.give = {{ "克苏恩之眼", 1 }, { "堕落的黑曜战靴", 1 }, { "燃烧の地狱轮盘", 1 }, { "火焰之魂环", 1 }}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HuoZhiYuOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HuoZhiYu_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
end

function HuoZhiYuOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HuoZhiYuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HuoZhiYuOBJ