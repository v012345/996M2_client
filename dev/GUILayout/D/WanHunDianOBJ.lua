WanHunDianOBJ = {}
WanHunDianOBJ.__cname = "WanHunDianOBJ"
WanHunDianOBJ.show1 = {{"七魄·尸狗", 1},{"七魄·伏矢", 1},{"七魄·雀阴", 1}}
WanHunDianOBJ.show2 = {{"七魄·吞贼", 1},{"七魄·非毒", 1},{"七魄·除秽", 1},{"七魄·臭肺", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function WanHunDianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)

    --同步后端信息
    ssrMessage:sendmsg(ssrNetMsgCfg.WanHunDian_SyncResponse)


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
        ssrMessage:sendmsg(ssrNetMsgCfg.WanHunDian_Request)
    end)
    ssrAddItemListX(self.ui.ItemShow_1, self.show1,"展示1",{imgRes = "", spacing = 70})
    ssrAddItemListX(self.ui.ItemShow_2, self.show2,"展示2",{imgRes = "", spacing = 70.5})

    WanHunDianOBJ:UpdateUI()
end

function WanHunDianOBJ:UpdateUI()
    GUI:Text_setString(self.ui.NumShow_1, self.data[1].."/33")
    GUI:Text_setString(self.ui.NumShow_2, self.data[2].."/33")
    GUI:Text_setString(self.ui.NumShow_3, self.data[3].."/33")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function WanHunDianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return WanHunDianOBJ