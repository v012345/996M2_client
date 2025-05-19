LuoPanZhanBuOBJ = {}
LuoPanZhanBuOBJ.__cname = "LuoPanZhanBuOBJ"
--LuoPanZhanBuOBJ.config = ssrRequireCsvCfg("cfg_LuoPanZhanBu")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LuoPanZhanBuOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LuoPanZhanBu_Request)
    end)

    -- 打开窗口缩放动画
    GUI:Timeline_Window2(self._parent)

    self:UpdateUI()
end

-- 获取占卜状态是否开启
function LuoPanZhanBuOBJ:getSwitchTbl()
    local AllType = {"命运罗盘·祝福","命运罗盘·速度","命运罗盘·武力","命运罗盘·体魄","命运罗盘·怒火","命运罗盘·暴力","命运罗盘·破坏","命运罗盘·绝杀","命运罗盘·穿透","命运罗盘·撕裂"}
    local MyTitleTbl = {}
    local SwitchTbl = {}
    local _MyTitleTbl = SL:GetMetaValue("TITLES")     --获取玩家所有称号 插入tbl
    for i, v in ipairs(_MyTitleTbl) do
        local TitleName = SL:GetMetaValue("ITEM_NAME", v.id)
        table.insert(MyTitleTbl, TitleName)
    end

    for _, k in ipairs(AllType) do
        local  bool = false
        for _, v in ipairs(MyTitleTbl) do
            if k == v or "命运罗盘·掌控者" == v then
                bool = true
                break
            end
        end
        table.insert(SwitchTbl, bool)
    end
    return  SwitchTbl
end

function LuoPanZhanBuOBJ:UpdateUI()
    --将所有空间隐藏
    local NodeTbl = GUI:getChildren(self.ui.AllNode)
    for _, k in ipairs(NodeTbl) do
        local _nodeTbl = GUI:getChildren(k)
        for _, v in ipairs(_nodeTbl) do
            GUI:setVisible(v, false)
        end
    end
    local  SwitchTbl = LuoPanZhanBuOBJ:getSwitchTbl()

    for i, v in ipairs(SwitchTbl) do
        if v then
            GUI:setVisible(self.ui["Att_Text_"..i.."_2"], true)
            GUI:setVisible(self.ui["Att_Text_"..i.."_3"], true)

            GUI:Text_setString(self.ui["Att_Text_"..i.."_3"], "(".. self.data[i] .."/66)")
        else
            GUI:setVisible(self.ui["Image_"..i], true)
            GUI:setVisible(self.ui["Att_Text_"..i.."_1"], true)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LuoPanZhanBuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
-------------------------------↓↓↓ 后端打开前端界面 ↓↓↓---------------------------------------
function LuoPanZhanBuOBJ:OpenUI(arg1, arg2, arg3, data)
    self.data = data
    ssrUIManager:OPEN(ssrObjCfg.LuoPanZhanBu)
end
return LuoPanZhanBuOBJ




