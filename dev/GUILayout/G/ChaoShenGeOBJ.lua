ChaoShenGeOBJ = {}
ChaoShenGeOBJ.__cname = "ChaoShenGeOBJ"
ChaoShenGeOBJ.config = ssrRequireCsvCfg("cfg_ChaoShenGe")
ChaoShenGeOBJ.cost = {{}}
ChaoShenGeOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChaoShenGeOBJ:main(objcfg)
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
    self:UpdateUI()
end

function ChaoShenGeOBJ:UpdateUI()
    local childHeight = 238
    local itemNum = #self.config
    GUI:removeAllChildren(self.ui.Panel_1)
    for i, v in ipairs(self.config) do
        local widget = GUI:Widget_Create(self.ui.Panel_1, "widget_" .. i, 0, 0, 166, childHeight)
        GUI:Win_SetParam(widget, i)
        GUI:LoadExport(widget, "G/ChaoShenGeCellUI")
        local ui = GUI:ui_delegate(widget)
        local itemName = v.equip[1][1]
        GUI:Text_setString(ui.Text_1,itemName)
        GUI:Text_setString(ui.Text_2,v.lingfu.."灵符")
        showCost(ui.Panel_1,v.equip)
        Player:checkAddRedPoint(ui.Button_1, v.equip, 10, 10)
        GUI:addOnClickEvent(ui.Button_1, function()
            local name, num = Player:checkItemNumByTable(v.equip)
            if name then
                sendmsg9(string.format("回收失败,你的背包内没有#250|%s#249", name))
                return
            end
            local data = {}
            data.str = string.format("正在回收【%s】，一旦回收无法找回，确定要继续？",itemName)
            data.btnType = 2
            data.callback = function(atype, param)
                if atype == 1 then
                    ssrMessage:sendmsg(ssrNetMsgCfg.ChaoShenGe_Request, i)
                end
            end
            SL:OpenCommonTipsPop(data)
        end)
    end
    local rows = math.ceil(itemNum / 5)
    local layoutHeight = rows * (childHeight + 6)
    GUI:setContentSize(self.ui.Panel_1, 852, layoutHeight)
    GUI:UserUILayout(self.ui.Panel_1, {
        dir = 3,
        interval = 0,
        gap = { x = 4,y = 6 },
        rownums = { 5, rows },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
            end)
        end
    })
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ChaoShenGeOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ChaoShenGeOBJ