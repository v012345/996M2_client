DanChenOBJ = {}
DanChenOBJ.__cname = "DanChenOBJ"
DanChenOBJ.config = ssrRequireCsvCfg("cfg_DanChen")
DanChenOBJ.cost = {{}}
DanChenOBJ.give = {{"丹道学徒[称号]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DanChenOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_OpenUI)
end
function DanChenOBJ:OpenUI(state)
    if GUI:GetWindow(nil, self.__cname) then
        GUI:Win_Close(self._parent)
    end
    objcfg = self.objcfg
    self.state = state
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
    GUI:addOnClickEvent(self.ui.Button_1, function()
        GUI:setVisible(self.ui.Node_1,false)
        GUI:setVisible(self.ui.Node_2,true)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        --GUI:setVisible(self.ui.Node_2,false)
        --GUI:setVisible(self.ui.Node_3,true)
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_ColleTask)
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_5, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_Retry)
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_GiveUp)
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_FinishTask)
    end)
    GUI:addOnClickEvent(self.ui.Button_8, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_9, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_10, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_Request,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_11, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DanChen_Request,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_12,function()
        GUI:setVisible(self.ui.Image_6,false)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    self:UpdateUI()
end

function DanChenOBJ:UpdateUI()
    local showStatus = self.state
    local nodeMainList = GUI:getChildren(self.ui.Node_main)
        for i, v in ipairs(nodeMainList) do
        if i == showStatus then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
    for i, v in ipairs(self.config) do
        local cost = v.cost
        local costShow = SL:CopyData(cost)
        table.remove(costShow,#costShow)
        showCost(self.ui[v.costPanel],costShow,16)
        if v.Cshow1 then
            ssrAddItemListX(self.ui[v.panel1],v.Cshow1,"item_",{spacing=16})
        end
        if v.Cshow2 then
            ssrAddItemListX(self.ui[v.panel2],v.Cshow2,"item_",{spacing=16})
        end
    end
end

function DanChenOBJ:Success(arg1,arg2,arg3,data)
    GUI:setVisible(self.ui.Image_6,true)
    GUI:Timeline_Window3(self.ui.Image_6)
    ssrAddItemListX(self.ui.Panel_10,data,"item_")
    GUI:Text_setString(self.ui.Text_title,data[1][1] or "")
end

function DanChenOBJ:Close()
    GUI:Win_Close(self._parent)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function DanChenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return DanChenOBJ