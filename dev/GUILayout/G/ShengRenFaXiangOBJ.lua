ShengRenFaXiangOBJ = {}
ShengRenFaXiangOBJ.__cname = "ShengRenFaXiangOBJ"
ShengRenFaXiangOBJ.give = {{"圣人之资[称号]",1},{"ζ法相天地ζ",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShengRenFaXiangOBJ:main(objcfg)
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
    ssrMessage:sendmsg(ssrNetMsgCfg.ShengRenFaXiang_SyncResponse)


    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShengRenFaXiang_Request)
    end)

    ssrAddItemListX(self.ui.ItemShow, self.give,"掉落",{imgRes = "",spacing = 110})
    --
    ----更新界面
    --self:UpdateUI()
end

function ShengRenFaXiangOBJ:UpdateUI()

    if self.data[1] == 0 then
        GUI:setVisible(self.ui.state_1_1,true)
    else
        GUI:setVisible(self.ui.state_1_2,true)
    end

    if self.data[2] == 0 then
        GUI:setVisible(self.ui.state_2_1,true)
    else
        GUI:setVisible(self.ui.state_2_2,true)
    end

    if self.data[3] == 0 then
        GUI:setVisible(self.ui.state_3_1,true)
    else
        GUI:setVisible(self.ui.state_3_2,true)
    end

    if self.data[4] == 0 then
        GUI:setVisible(self.ui.state_4_1,true)
    else
        GUI:setVisible(self.ui.state_4_2,true)
    end




end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShengRenFaXiangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShengRenFaXiangOBJ