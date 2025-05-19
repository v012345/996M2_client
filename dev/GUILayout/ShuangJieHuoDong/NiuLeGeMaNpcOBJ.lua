NiuLeGeMaNpcOBJ = {}
NiuLeGeMaNpcOBJ.__cname = "NiuLeGeMaNpcOBJ"
--NiuLeGeMaNpcOBJ.config = ssrRequireCsvCfg("cfg_NiuLeGeMaNpc")
NiuLeGeMaNpcOBJ.cost = {{}}
NiuLeGeMaNpcOBJ.give = { { "圣诞花环", 50 }, { "圣诞饼干", 7 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function NiuLeGeMaNpcOBJ:main(objcfg)
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
        -- ssrMessage:sendmsg(ssrNetMsgCfg.NiuLeGeMaNpc_Request)
        ssrUIManager:OPEN(ssrObjCfg.NiuLeGeMa)
        GUI:Win_Close(self._parent)
    end)
    ssrAddItemListX(self.ui.Panel_1, self.give, "item_", { })
    ssrMessage:sendmsg(ssrNetMsgCfg.NiuLeGeMaNpc_SyncResponse)
end

function NiuLeGeMaNpcOBJ:UpdateUI()
    --转成数组后根据value排序
    local ranks = {}
    for k, v in pairs(self.data) do
        table.insert(ranks, { name = k, time = v })
    end
    table.sort(ranks, function(a, b)
        return a.time < b.time
    end)
    for i, v in ipairs(ranks) do
        local widget = GUI:Widget_Create(self.ui.ListView_1, "widget_" .. i, 0, 0, 320, 34)
        GUI:LoadExport(widget, "ShuangJieHuoDong/NiuLeGeMaNpcRankCellUI")
        local ui = GUI:ui_delegate(widget)
        GUI:Image_loadTexture(ui.Image_rankNumber, "res/custom/ShuangJieHuoDongMain/NiuLeGeMaNpc/rankNumber/" .. i .. ".png")
        GUI:Text_setString(ui.Text_name, v.name)
        GUI:Text_setString(ui.Text_time, secondsToVariedChineseHMS(v.time))
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function NiuLeGeMaNpcOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return NiuLeGeMaNpcOBJ