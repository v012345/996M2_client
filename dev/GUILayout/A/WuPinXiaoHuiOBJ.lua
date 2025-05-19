local WuPinXiaoHuiOBJ = {}
WuPinXiaoHuiOBJ.__cname = "WuPinXiaoHuiOBJ"
--WuPinXiaoHuiOBJ.config = ssrRequireCsvCfg("cfg_WuPinXiaoHui")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function WuPinXiaoHuiOBJ:main(objcfg)
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
    --GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
    GUI:addOnClickEvent(self.ui.Button,function()
        local requestData = {}
        for i, v in ipairs(self.selectItem) do
            local data = GUI:Win_GetParam(v)
            if data.isSelect then
                table.insert(requestData,data.MakeIndex)
            end
        end
        if #requestData == 0 then
            sendmsg9("你没有选择物品#250")
            return
        end
        ssrMessage:sendmsg(ssrNetMsgCfg.WuPinXiaoHui_Request,0,0,0,requestData)
    end )
end

function WuPinXiaoHuiOBJ:UpdateUI()
    local bagData = SL:GetMetaValue("BAG_DATA")
    local function sort_cfg(a, b)
        return a.Index < b.Index
    end
    local newBagData = SL:HashToSortArray(bagData, sort_cfg)
    self.selectItem = {}
    GUI:removeAllChildren(self.ui.Layout)
    for i, v in ipairs(newBagData) do
        if v then
            --SL:dump(v)
            local info = {}
            info.index = v.Index
            info.itemData = v        -- 传入装备数据
            info.look = true
            info.bgVisible = false
            info.starLv = true
            local item = GUI:ItemShow_Create(self.ui.Layout, "item"..i, 0, 0, info)
            table.insert(self.selectItem,item)
            GUI:setTag(item, i)
            GUI:Win_SetParam(item, {isSelect = false})
            GUI:ItemShow_addReplaceClickEvent(item, function (widget)
                local param = GUI:Win_GetParam(item)
                local select = not param.isSelect
                GUI:ItemShow_setItemShowChooseState(widget, select)
                if select then
                    param.MakeIndex = v.MakeIndex
                    param.Name = v.Name
                    param.Index = v.Index
                    param.OverLap = v.OverLap

                else
                    param.MakeIndex = nil
                    param.Name = nil
                    param.Index = nil
                    param.OverLap = nil
                end
                param.isSelect = not param.isSelect
                GUI:Win_SetParam(item, param)
            end)
        end
    end

    GUI:UserUILayout(self.ui.Layout, {
        dir=3,
        interval=0,
        autosize = 1,
        gap = {x=16,y=16},
        rownums  = {10},
        sortfunc = function (lists)
            table.sort(lists, function (a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end
    })
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function WuPinXiaoHuiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return WuPinXiaoHuiOBJ