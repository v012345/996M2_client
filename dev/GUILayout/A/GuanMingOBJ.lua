GuanMingOBJ = {}
GuanMingOBJ.__cname = "GuanMingOBJ"
GuanMingOBJ.config = ssrRequireCsvCfg("cfg_GuanMing")
GuanMingOBJ.cost = {{}}
GuanMingOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuanMingOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, -20, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-60)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.GuanMing_Request)
    end)

    GuanMingOBJ:UpdateUI()
end

function GuanMingOBJ:UpdateUI()
    for i=1,#GuanMingOBJ.config[1].give do
        local  _Handle = GUI:GetWindow(self.ui.ImageBG,"item"..i)
        if _Handle then
            local item_data = {}
            item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", GuanMingOBJ.config[1].give[i][1])
            item_data.look  = true
            item_data.bgVisible = false
            item_data.count =   GuanMingOBJ.config[1].give[i][3]
            item_data.color = 250

            GUI:setVisible(_Handle, true)
            GUI:ItemShow_updateItem(_Handle,item_data)
        end
    end

    local Effect_1 = GUI:Effect_Create(self.ui.ImageBG, "Effect_1", 350.00, 160, 4, GuanMingOBJ.config[1].effect[1], 0, 0, 2, 1)
    GUI:setTag(Effect_1, 0)

    -- Create Effect_1
    Effect_1 = GUI:Effect_Create(self.ui.ImageBG, "Effect_2", 370.00, 320.00, 0, GuanMingOBJ.config[1].effect[2], 0, 0, 0, 1)
    GUI:setTag(Effect_1, 0)

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuanMingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuanMingOBJ