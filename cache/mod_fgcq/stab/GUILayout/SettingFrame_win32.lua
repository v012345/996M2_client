SettingFrame = {}

SettingFrame._GROUPID = 60
SettingFrame._Pages = {}
SettingFrame._index = 0
SettingFrame._ui = nil

-- 页签ID
SettingFrame._pageIDs = {
    SLDefine.SettingPage.SettingBasic,
    SLDefine.SettingPage.SettingFight,
    SLDefine.SettingPage.SettingProtect,
    SLDefine.SettingPage.SettingAuto,
    SLDefine.SettingPage.SettingHelp,
}

function SettingFrame.main(skipPage)
    local parent = GUI:Attach_Parent()
    GUI:LoadExport(parent, "set/setting_frame_win32")
    SettingFrame._ui = GUI:ui_delegate(parent)

    local PMainUI = SettingFrame._ui["PMainUI"]
    local screenW = SL:GetMetaValue("SCREEN_WIDTH")
    local screenH = SL:GetMetaValue("SCREEN_HEIGHT")
    GUI:setPosition(PMainUI, screenW / 2, SL:GetMetaValue("PC_POS_Y"))
    GUI:Win_SetDrag(parent, PMainUI)
    GUI:Win_SetZPanel(parent, PMainUI)

    local sizePanel = GUI:getContentSize(PMainUI)
    SettingFrame.textTips = GUI:Text_Create(PMainUI, "uploadtext", sizePanel.width/2, sizePanel.height/2, 18, "#FFFFFF", "")
    GUI:setAnchorPoint(SettingFrame.textTips, 0.5, 0.5)

    -- 关闭按钮
    GUI:addOnClickEvent(SettingFrame._ui["CloseButton"], function() GUI:Win_Close(parent) end)

    SettingFrame._Pages = {}
    SettingFrame._index = 0

    for i, layerId in ipairs(SettingFrame._pageIDs) do
        local btnName = "page_cell_"..i
        local page = SettingFrame._ui[btnName]
        GUI:Win_SetParam(page, layerId)
        if SL:CheckMenuLayerConditionByID(layerId) then
            GUI:addOnClickEvent(GUI:getChildByName(page, "TouchSize"), function()
                SettingFrame.PageTo(layerId)
            end)
        else
            GUI:addOnClickEvent(GUI:getChildByName(page, "TouchSize"), function()
                SL:ShowSystemTips("条件不满足!")
            end)
        end
        SettingFrame._Pages[btnName] = page
    end
    
    SettingFrame.PageTo(SettingFrame._pageIDs[skipPage or 1])

    SL:RegisterLUAEvent(LUA_EVENT_OPEN_SETTING_FRAME_UP_LOAD_TIPS, "settingFrame", SettingFrame.UpLoadTextTipsOpen)
    SL:RegisterLUAEvent(LUA_EVENT_CLOSE_SETTING_FRAME_UP_LOAD_TIPS, "settingFrame", SettingFrame.UpLoadTextTipsClose)
end

function SettingFrame.UpLoadTextTipsOpen()
    if SettingFrame.textTips then
        GUI:stopAllActions(SettingFrame.textTips)
        local str = GET_STRING(700000142)--"上传中，请稍等"
        GUI:Text_setString(SettingFrame.textTips, str..".")
        local callback1 = function ()
            GUI:Text_setString(SettingFrame.textTips, str..".")
        end
        local callback2 = function ()
            GUI:Text_setString(SettingFrame.textTips, str.."..")
        end
        local callback3 = function ()
            GUI:Text_setString(SettingFrame.textTips, str.."...")
        end
        GUI:runAction(SettingFrame.textTips,GUI:ActionRepeatForever(GUI:ActionSequence(
            GUI:CallFunc(callback1), GUI:DelayTime(0.3),
            GUI:CallFunc(callback2), GUI:DelayTime(0.3),
            GUI:CallFunc(callback3), GUI:DelayTime(0.3)
        )))
    end
end

function SettingFrame.UpLoadTextTipsClose()
    if SettingFrame.textTips then
        GUI:stopAllActions(SettingFrame.textTips)
        GUI:Text_setString(SettingFrame.textTips, "")
    end
end

function SettingFrame.PageTo(index)
    if not index or SettingFrame._index == index then
        return false
    end

    SettingFrame.OnClose()

    SettingFrame._index = index

    SettingFrame.OnOpen()
    SettingFrame.SetPageStatus()
end

function SettingFrame.GetCurPageID()
    return SettingFrame._index
end

function SettingFrame.OnClose()
    SL:CloseMenuLayerByID(SettingFrame._index)
end

function SettingFrame.OnOpen()
    if SettingFrame._ui and SettingFrame._ui["AttachLayout"] then
        SL:OpenMenuLayerByID(SettingFrame._index, SettingFrame._ui["AttachLayout"])
    end 
end

function SettingFrame.SetPageStatus()
    for k, uiPage in pairs(SettingFrame._Pages) do
        if uiPage then
            local index = GUI:Win_GetParam(uiPage)
            local isSel = index == SettingFrame._index and true or false
            GUI:Button_setBright(uiPage, not isSel)
            GUI:setLocalZOrder(uiPage, isSel and 2 or 0)

            local uiText = GUI:getChildByName(uiPage, "PageText")
            if uiText then
                GUI:Text_setFontSize(uiText, 13)
                GUI:Text_setTextColor(uiText, isSel and "#e6e7a7" or "#807256")
                GUI:Text_enableOutline(uiText, "#111111", 2)
                if isSel then
                    SettingFrame.UpdateTitle(string.gsub(GUI:Text_getString(uiText), "\n", ""))
                end
            end
        end
    end
end

function SettingFrame.UpdateTitle(text)
    if not SettingFrame._ui then
        return false
    end
    if not SettingFrame._ui["TitleText"] then
        return false
    end
    GUI:Text_setString(SettingFrame._ui.TitleText, text)
end