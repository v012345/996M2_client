local SwitchMapOBJ = {}
SwitchMapOBJ.__cname = "SwitchMapOBJ"

-- 切换地图
local function onSwitchMap(table)
    local parent = GUI:Win_FindParent(106)
    if GUI:getChildByName(parent,"maskingOut") then
        GUI:removeChildByName(parent,"maskingOut")
    end
    local maskingOut = GUI:Layout_Create(parent, "maskingOut", 0.00, 0.00, ssrConstCfg.width*2, ssrConstCfg.height*2, false)
    GUI:setAnchorPoint(maskingOut,0.5,0.5)
	GUI:Layout_setBackGroundColorType(maskingOut, 1)
	GUI:Layout_setBackGroundColor(maskingOut, "#000000")
	GUI:Layout_setBackGroundColorOpacity(maskingOut, 150)
    GUI:Timeline_FadeOut(maskingOut, 0.8, function ()
        if GUI:getChildByName(parent,"maskingOut") then
            GUI:removeChildByName(parent,"maskingOut")
        end
    end)
    local parentDown = GUI:Win_FindParent(106)
    if GUI:getChildByName(parentDown,"mapName") then
        GUI:removeChildByName(parentDown,"mapName")
    end
    local mapNameWidget = GUI:Text_Create(parentDown, "mapName", 20, -140, 50, "#ffffff","")
    GUI:setOpacity(mapNameWidget,200)
    GUI:setAnchorPoint(mapNameWidget,0.5,0.5)
    GUI:Text_setFontName(mapNameWidget, "fonts/10001.ttf")
    GUI:Text_setString(mapNameWidget, "—"..SL:GetMetaValue("MAP_NAME").."—")
    GUI:Text_enableOutline(mapNameWidget, "#000000", 2)
    SL:scheduleOnce(mapNameWidget, function ()
        GUI:Timeline_FadeOut(mapNameWidget, 0.5, function ()
        if GUI:getChildByName(mapNameWidget,"mapName") then
            GUI:removeChildByName(mapNameWidget,"mapName")
        end
    end)
    end , 1)

end
--切换地图
SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "SwitchMap", onSwitchMap)
return SwitchMapOBJ
