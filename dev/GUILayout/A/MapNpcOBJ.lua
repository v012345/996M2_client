MapNpcOBJ = {}
MapNpcOBJ.__cname = "MapNpcOBJ"
function MapNpcOBJ:main(objcfg)
    self.CheckBoxTable = {}
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true,true,objcfg.NPCID)
    self._parent = parent
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent,self.ui.ImageBG,2,0,-50)
    --GUI:Timeline_Window1(self.ui.ImageBG)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    GUI:addOnClickEvent(self.ui.CloseLayout,function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.CloseButton,function()
        GUI:Win_Close(self._parent)
    end)
    local cfg = ssrRequireCsvCfg("cfg_map_npc") --获取表格配置
    local cfg_desc = cfg[objcfg.NPCID]
    --SL:dump(cfg_desc)
    GUI:Text_setString(self.ui.TitleText,cfg_desc.MapName)
    local RTextStr1 = string.format("<font color='#00FFFF'>【地图说明】：</font><font color='#FF00FF'>%s</font>",cfg_desc.ShuoMing)
    local RTextStr2 = string.format("<font color='#00FFFF'>【地图难度】：</font><font color='#FF0000'>%s</font>",cfg_desc.NanDu)
    local RTextStr3 = string.format("<font color='#00FFFF'>【地图怪物】：</font><font color='#FF0000'>%s</font>",cfg_desc.GuaiWu)
    local RTextStr4 = string.format("<font color='#00FFFF'>【地图爆率】：</font><font color='#FFFF00'>%s</font>",cfg_desc.BaoLv)
    local RTextStr5 = string.format("<font color='#00FFFF'>【刷新时间】：</font><font color='#f4d35e'>%s</font>",cfg_desc.ShiJian)
    local RTextStr6 = string.format("<font color='#00FFFF'>【进入条件】：</font><font color='#FFFBF0'>%s</font>",cfg_desc.TiaoJian)
    GUI:RichText_Create(self.ui.Node, "RText1", 110.00, 383.00, RTextStr1, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    GUI:RichText_Create(self.ui.Node, "RText2", 110.00, 353.00, RTextStr2, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    GUI:RichText_Create(self.ui.Node, "RText3", 110.00, 294.00, RTextStr3, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    GUI:RichText_Create(self.ui.Node, "RText4", 110.00, 324.00, RTextStr4, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    GUI:RichText_Create(self.ui.Node, "RText5", 110.00, 265.00, RTextStr5, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    GUI:RichText_Create(self.ui.Node, "RText6", 110.00, 236.00, RTextStr6, 750, 16, "#ffffff", nil, nil, "fonts/font2.ttf")
    for _,v in ipairs(cfg_desc['AnNiu']) do
        local Button = GUI:Button_Create(self.ui.ButtonLayout, "Button".._, 0.00, 0.00, "res/public/1900000661.png")
        GUI:Button_loadTexturePressed(Button, "res/public/1900000660.png")
        GUI:Button_setTitleText(Button, v[1])
        GUI:Button_setTitleColor(Button, "#00ff00")
        GUI:Button_setTitleFontSize(Button, 16)
        GUI:Button_titleEnableOutline(Button, "#000000", 1)
        GUI:Win_SetParam(Button, v[2])
        GUI:setTouchEnabled(Button, true)
        GUI:addOnClickEvent(Button, function(obj)
            ssrMessage:sendmsg(ssrNetMsgCfg.MapNpc_Request,GUI:Win_GetParam(obj))
        end)

    end
     GUI:UserUILayout(self.ui.ButtonLayout, {
        dir=2,
        addDir=2,
        interval=0.2,
        gap = {x=10},
        sortfunc = function (lists)
            table.sort(lists, function (a, b)
                return GUI:Win_GetParam(a) > GUI:Win_GetParam(b)
            end)
        end
    })
end

return MapNpcOBJ
