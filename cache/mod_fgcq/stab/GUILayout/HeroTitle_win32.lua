HeroTitle = {} --英雄面板 称号
HeroTitle._ui = nil

function HeroTitle.main(data)
    local parent = GUI:Attach_Parent()
    local path = "hero/hero_title_node_win32.lua"
    HeroTitle._resPath = SLDefine.PATH_RES_PRIVATE .. "title_layer_ui_win32/"

    GUI:LoadExport(parent, path)
    HeroTitle._parent = parent
    HeroTitle._ui = GUI:ui_delegate(parent)
    if not HeroTitle._ui then
        return false
    end
    if data and data.typeCapture == 1 then
        local list = HeroTitle._ui.ListView_cells
        GUI:ListView_setClippingEnabled(list,false)
        HeroTitle.manyHeight = 0
    end
    HeroTitle.initUI()
end


function HeroTitle.initUI(data)
    SL:ResquestTitleList_Hero()--请求称号列表
    local function showTips()
        local activateId = SL:GetMetaValue("H.ACTIVATE_TITLE")--获取激活的称号
        local data = {}
        data.id = activateId
        data.pos = GUI:getWorldPosition(HeroTitle._ui.Button_curTitle)
        data.type = 2
        data.job = SL:GetMetaValue("H.JOB")
        SL:OpenTitleTipsUI(data)
    end

    local function disboardTitle()
        local activateId = SL:GetMetaValue("H.ACTIVATE_TITLE")--获取激活的称号
        if activateId then
            local data = {}
            data.str = "是否取消当前称号？"
            data.btnType = 2
            data.callback = function(type, custom)
                if 1 == type then
                    SL:ResquestDisboardTitle_Hero()
                end
            end
            SL:OpenCommonTipsPop(data)
        end
    end
    
    GUI:addMouseMoveEvent(HeroTitle._ui.Button_curTitle,
    {
        onEnterFunc = function()
            if not SL:GetMetaValue("TOUCH_STATE") then
                showTips()
            end
        end,
        onLeaveFunc = function()
            SL:CloseTitleTipsUI()-- 关闭称号提示界面
        end
    }
    )

    GUI:addOnClickEvent(HeroTitle._ui.Button_curTitle, function()
        local activateId = SL:GetMetaValue("H.ACTIVATE_TITLE")--获取激活的称号
        if activateId then
            disboardTitle()
        end
    end)
    
end

function HeroTitle.refresh()
    --已激活的称号
    local activateId = SL:GetMetaValue("H.ACTIVATE_TITLE")
    local titleListData = SL:GetMetaValue("H.TITLES") --称号数据

    GUI:setTouchEnabled(HeroTitle._ui.Button_curTitle, activateId ~= nil)
    if activateId then
        local res = SL:GetMetaValue("TITLE_IMAGE", activateId)
        GUI:Button_loadTextureNormal(HeroTitle._ui.Button_curTitle, res)
        GUI:Text_setString(HeroTitle._ui.Text_curTitle, SL:GetMetaValue("ITEM_NAME", activateId))
        GUI:Text_setTextColor(HeroTitle._ui.Text_curTitle, SL:GetHexColorByStyleId(SL:GetMetaValue("ITEM_NAME_COLORID", activateId)))
        GUI:Text_setFontSize(HeroTitle._ui.Text_curTitle,  16)
        local contentSize = GUI:getImageContentSize(res)
        if contentSize.width > 0 then
            GUI:setContentSize(HeroTitle._ui.Button_curTitle, contentSize.width, contentSize.height)
        end
    else
        local res = HeroTitle._resPath .. "title_3.png"
        GUI:Button_loadTextureNormal(HeroTitle._ui.Button_curTitle, res)
        local contentSize = GUI:getImageContentSize(res)
        if contentSize.width > 0 then
            GUI:setContentSize(HeroTitle._ui.Button_curTitle, contentSize.width, contentSize.height)
        end
        GUI:Text_setString(HeroTitle._ui.Text_curTitle, "")
    end
    GUI:setIgnoreContentAdaptWithSize(HeroTitle._ui.Button_curTitle, false)

    --称号列表
    local titleList = SL:HashToSortArray(titleListData, function(a, b)
        return a.index < b.index
    end)

    if not titleList then
        titleList = {}
    end

    local count = math.max(5, #titleList)
    local curItems =  GUI:ListView_getItems(HeroTitle._ui.ListView_cells)
    local curItemsCount = #curItems
    if curItemsCount > count then 
        for i = count,curItemsCount - 1 do
            GUI:ListView_removeItemByIndex(HeroTitle._ui.ListView_cells,i)
        end
    elseif curItemsCount < count then 
        local cellPath = "hero/title_cell_win32.lua"
        for i = curItemsCount+1,count  do
            local widget = GUI:Widget_Create(HeroTitle._ui.ListView_cells, "title_cell_" .. i, 0, 0, 278, 42)
            GUI:LoadExport(widget, cellPath)
            local ui = GUI:ui_delegate(widget)
            local buttonIcon = ui.Button_icon
            local function showTips()
                if not buttonIcon._data then 
                    return
                end
                local titleId = buttonIcon._data.id
                local time = buttonIcon._data.time
                local data = {}
                data.id = titleId
                data.pos = GUI:getWorldPosition(buttonIcon)
                data.type = 1
                data.time = time
                data.job = SL:GetMetaValue("H.JOB")
                SL:OpenTitleTipsUI(data)
            end
            local function activeTitle()
                
                if not buttonIcon._data then 
                    return
                end
                local titleId = buttonIcon._data.id
                local activateId = SL:GetMetaValue("H.ACTIVATE_TITLE")--获取激活的称号
                if titleId == activateId then
                    return
                end
                local name = SL:GetMetaValue("ITEM_NAME", titleId)
                local data = {}
                data.str = string.format("是否将%s设置为当前称号？", name)
                data.btnType = 2
                data.callback = function(type, custom)
                    if 1 == type then
                        SL:ResquestActivateTitle_Hero(titleId)
                    end
                end
                SL:OpenCommonTipsPop(data)
            end
            GUI:addMouseMoveEvent(buttonIcon,
                {
                    onEnterFunc = function()
                        if not buttonIcon._data then 
                            return
                        end
                        if not SL:GetMetaValue("TOUCH_STATE") then
                            showTips()
                        end
                    end,
                    onLeaveFunc = function()
                        SL:CloseTitleTipsUI()-- 关闭称号提示界面
                    end
                })
            GUI:addOnClickEvent(buttonIcon, function()
                activeTitle()
            end)
        end

    end
    for i = 1, count do
        local widget = GUI:ListView_getItemByIndex(HeroTitle._ui.ListView_cells,i-1)
        local ui = GUI:ui_delegate(widget)
        local buttonIcon = ui.Button_icon
        GUI:setTouchEnabled(buttonIcon, false)
        if titleList[i] then
            GUI:setTouchEnabled(buttonIcon, true)
            buttonIcon._data = titleList[i]
            local titleId = buttonIcon._data.id
            local time = buttonIcon._data.time
            local name = SL:GetMetaValue("ITEM_NAME", titleId)
            local res = SL:GetMetaValue("TITLE_LIST_IMAGE", titleId)
            GUI:Button_loadTextureNormal(buttonIcon, res)
            GUI:Text_setString(ui.Text_name, name)


            local contentSize = GUI:getImageContentSize(res)
            if contentSize.width > 0 then
                GUI:setContentSize(buttonIcon, contentSize)
            end

            if titleId == activateId then
                GUI:Button_setGrey(buttonIcon, true)
            else
                GUI:Button_setGrey(buttonIcon, false)
            end

        else
            local res = HeroTitle._resPath .. "title_4.png"
            GUI:Button_loadTextureNormal(buttonIcon, res)
            GUI:Text_setString(ui.Text_name, "")

            GUI:setContentSize(buttonIcon, GUI:getImageContentSize(res))
        end

        GUI:setIgnoreContentAdaptWithSize(buttonIcon, false)
    end

    GUI:ListView_doLayout(HeroTitle._ui.ListView_cells)
    local manyHeight = GUI:ListView_getInnerContainerSize(HeroTitle._ui.ListView_cells).height - GUI:getContentSize(HeroTitle._ui.ListView_cells).height
    HeroTitle.manyHeight = math.max(0, manyHeight)
end

return HeroTitle