local PercentVertica = 0
local fuc = {
    --双节登陆
    [1] = function(ui, config, data, leftDay)
        ssrAddItemListX(ui.Panel_1, config, "item1", { spacing = 30 })
        GUI:addOnClickEvent(ui.Button_1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_LingQuReward)
        end)
        local isLingQu = data[1] or 0
        if isLingQu == 1 then
            GUI:Button_setBrightEx(ui.Button_1, false)
        end
    end,
    --双节福利
    [2] = function(ui, config, data, leftDay)
        local totalGive = { { "三百六十五个祝福", 1 } }
        --拆分数组
        local function splitArray(array)
            local result = {}
            local length = #array
            if length == 3 then
                result[1] = { array[1] }
                result[2] = { array[2], array[3] }
            elseif length == 4 then
                result[1] = { array[1], array[2] }
                result[2] = { array[3], array[4] }
            end
            return result
        end
        --全部领取完总奖励
        ssrAddItemListX(ui.Panel_give, totalGive, "item1", { imgRes = "res/custom/ShuangJieHuoDongMain/itembox.png" })
        GUI:addOnClickEvent(ui.Button_1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_ShuangJieFuLiLingQu)
        end)
        -- GUI:ListView_removeAllItems(ui.ListView_1)
        GUI:removeAllChildren(ui.Panel_1)
        for i, v in ipairs(config) do
            local widget = GUI:Widget_Create(ui.Panel_1, "widget2_" .. i, 0, 0, 208, 320)
            GUI:Win_SetParam(widget, i)
            GUI:LoadExport(widget, "ShuangJieHuoDong/ShuangJieHuoDongMain2_cell_UI")
            local childUi = GUI:ui_delegate(widget)
            GUI:Image_loadTexture(childUi.Image_1, "res/custom/ShuangJieHuoDongMain/2/day_" .. i .. ".png")
            local gives = splitArray(v.give)
            ssrAddItemListX(childUi.Panel_1, gives[1], "item1", {})
            ssrAddItemListX(childUi.Panel_2, gives[2], "item2", {})
            --如果数量为4，则将第一个物品的X坐标向左移动34
            if #v.give == 4 then
                local x = GUI:getPositionX(childUi.Panel_1)
                GUI:setPositionX(childUi.Panel_1, x - 34)
            end
            --领取按钮
            GUI:addOnClickEvent(childUi.Button_1, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_ShuangJieFuLi, i)
            end)
            if data[i] == 2 then
                GUI:Button_setBrightEx(childUi.Button_1, false)
            elseif data[i] == 1 or data[i] == 3 then
                if leftDay >= 0 then
                    addRedPoint(childUi.Button_1, 18, 2)
                end
            end
            if data[i] == 3 then
                GUI:Button_loadTextureNormal(childUi.Button_1, "res/custom/ShuangJieHuoDongMain/2/buling.png")
            end
        end
        -- GUI:setContentSize(ui.Panel_1, 2560, 300)
        GUI:UserUILayout(ui.Panel_1, {
            dir = 2,
            interval = 0,
            autosize = 1,
            gap = { x = 10},
            sortfunc = function(lists)
                table.sort(lists, function(a, b)
                    return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
                end)
            end
        })
    end,
    [3] = function(ui, config, data, leftDay)
        local flags = data.flags or {}
        GUI:Text_setString(ui.Text_1, data.leiChong)
        GUI:Text_setString(ui.Text_2, string.format("(%d/5)", data.lingQuNum))
        GUI:ListView_removeAllItems(ui.ListView_1)
        for i, v in ipairs(config) do
            local widget = GUI:Widget_Create(ui.ListView_1, "widget3_" .. i, 0, 0, 644, 78)
            GUI:LoadExport(widget, "ShuangJieHuoDong/ShuangJieHuoDongMain3_cell_UI")
            local childUi = GUI:ui_delegate(widget)
            GUI:Image_loadTexture(childUi.Image_1, "res/custom/ShuangJieHuoDongMain/3/money_" .. i .. ".png")
            ssrAddItemListX(childUi.Panel_1, v.give, "item3", {})
            --领取按钮
            GUI:addOnClickEvent(childUi.Button_1, function()
                ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_ShuangJieKuangHuan, i)
            end)
            delRedPoint(childUi.Button_1)
            if flags[i] == 1 then
                GUI:Button_setBrightEx(childUi.Button_1, false)
            elseif flags[i] == 0 and leftDay >= 0 and data.leiChong >= v.money and data.lingQuNum < 5 then
                addRedPoint(childUi.Button_1, 18, 2)
            end
        end
    end,
    [4] = function(ui, config, data, leftDay)
        local function getRemainingCount(itemName)
            return data[itemName] or 0
        end
        local childObj = 200
        local itemNum = #config
        GUI:removeAllChildren(ui.Panel_1)
        local Panel_1 = ui.Panel_1
        for i, v in ipairs(config) do
            local widget = GUI:Widget_Create(Panel_1, "widget_4" .. i, 0, 0, 158, childObj)
            GUI:Win_SetParam(widget, i)
            GUI:LoadExport(widget, "ShuangJieHuoDong/ShuangJieHuoDongMain4_cell_UI")
            local childUi = GUI:ui_delegate(widget)
            local itemName = v.item[1][1]
            local itemNum = v.item[1][2]
            local costName = v.cost[1][1]
            local costNum = v.cost[1][2]
            GUI:Text_setString(childUi.Text_title, itemName)
            ssrAddItemListX(childUi.Panel_1, v.item, "item_")
            local remainingCount = v.max - getRemainingCount(itemName)
            local strTbl = {
                string.format("%s:#246|%s#249", costName, costNum),
                string.format("剩余:#246|%s#250|次#246", remainingCount)
            }
            createMultiLineRichText(childUi.Panel_2, "Panel_count", 0, 0, strTbl, 16, 600, 13, "#FFFFFF", 2, 0.5, 0.5)
            delRedPoint(childUi.Button_1)
            if remainingCount > 0 then
                Player:checkAddRedPoint(childUi.Button_1, v.cost, 14, -3)
            end
            GUI:addOnClickEvent(childUi.Button_1, function()
                local data = {}
                data.str = string.format("确定使用[%s*%d],兑换[%s*%d]？", costName, costNum, itemName, itemNum)
                data.btnType = 2
                data.callback = function(atype, param)
                    if atype == 1 then
                        ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_ShuangJieShangCheng, i)
                    end
                end
                SL:OpenCommonTipsPop(data)
            end)
        end
        local rows = math.ceil(itemNum / 4)
        local layoutHeight = rows * childObj
        GUI:setContentSize(Panel_1, 654, layoutHeight)
        GUI:UserUILayout(Panel_1, {
            dir = 3,
            interval = 0,
            gap = { x = 4 },
            rownums = { 4 },
            sortfunc = function(lists)
                table.sort(lists, function(a, b)
                    return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
                end)
            end
        }) 
    end,
    [5] = function(ui, data, leftDay)
        GUI:addOnClickEvent(ui.Button_1, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_KuangHuanXiaoZhen)
            GUI:Win_CloseAll()
        end)
    end,
}
return fuc
