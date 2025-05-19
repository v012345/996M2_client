JiFenDuiHuanOBJ = {}
JiFenDuiHuanOBJ.__cname = "JiFenDuiHuanOBJ"
JiFenDuiHuanOBJ.config = ssrRequireCsvCfg("cfg_JiFenDuiHuan")
JiFenDuiHuanOBJ.cost = { {} }
JiFenDuiHuanOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiFenDuiHuanOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.JiFenDuiHuan_OpenUI) --请求打开
end
function JiFenDuiHuanOBJ:OpenUI(arg1,arg2,arg3,data)
    local objcfg = self.objcfg
    self.toDayPoint = arg1
    self.kuaFuPiont = arg2
    self.data = data
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
    --GUI:addOnClickEvent(self.ui.Button_1, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.JiFenDuiHuan_Request)
    --end)
    self:UpdateUI()
end

--获取兑换的剩余次数
function JiFenDuiHuanOBJ:getRemainingCount(itemName)
    return self.data[itemName] or 0
end
function JiFenDuiHuanOBJ:UpdateUI()
    local childObj = 200
    local itemNum = #self.config
    GUI:removeAllChildren(self.ui.Panel_1)
    for i, v in ipairs(self.config) do
        local widget = GUI:Widget_Create(self.ui.Panel_1, "widget_" .. i, 0, 0, 136, childObj)
        GUI:Win_SetParam(widget, i)
        GUI:LoadExport(widget, "KuaFu/JiFenDuiHuan_cell_UI")
        local ui = GUI:ui_delegate(widget)
        local itemName = v.item[1][1]
        local itemNum = v.item[1][2]
        GUI:Text_setString(ui.Text_title,itemName)
        ssrAddItemListX(ui.Panel_1,v.item,"item_")
        local remainingCount = v.max - self:getRemainingCount(itemName)
        GUI:Text_setString(ui.Text_1,"剩余兑换："..remainingCount.."次")
        GUI:Text_setString(ui.Text_2,v.point.."积分")
        local remainingCountColor = "#00FF00"
        if remainingCount <= 0 then
            remainingCountColor = "#FF0000"
        end
        GUI:Text_setTextColor(ui.Text_1, remainingCountColor)
        delRedPoint(ui.Button_1)
        if self.kuaFuPiont >= v.point and remainingCount > 0 then
            addRedPoint(ui.Button_1)
        end
        GUI:addOnClickEvent(ui.Button_1,function()
            local data = {}
            data.str = string.format("确定花费[%s积分],兑换[%s*%d]？", v.point, itemName, itemNum)
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.JiFenDuiHuan_Request, i)
                end
            end
            SL:OpenCommonTipsPop(data)
        end)
    end
    GUI:Text_setString(self.ui.Text_1, self.toDayPoint)
    GUI:Text_setString(self.ui.Text_2, self.kuaFuPiont)
    local rows = math.ceil(itemNum / 6)
    local layoutHeight = rows * childObj
    GUI:setContentSize(self.ui.Panel_1, 826, layoutHeight)
    GUI:UserUILayout(self.ui.Panel_1, {
        dir = 3,
        interval = 0,
        gap = { x = 4 },
        rownums = { 6, rows },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
            end)
        end
    })
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiFenDuiHuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.toDayPoint = arg1
    self.kuaFuPiont = arg2
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiFenDuiHuanOBJ