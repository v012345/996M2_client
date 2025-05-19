QuanMinHuaShuiOBJ = {}
QuanMinHuaShuiOBJ.__cname = "QuanMinHuaShuiOBJ"
--QuanMinHuaShuiOBJ.config = ssrRequireCsvCfg("cfg_QuanMinHuaShui")
QuanMinHuaShuiOBJ.cost = {{}}
QuanMinHuaShuiOBJ.give = {{}}
local enumColors = {
        [1] = "#FFEC19",
        [2] = "#3EBDE6",
        [3] = "#CB7637",
    }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function QuanMinHuaShuiOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.QuanMinHuaShui_Request)
        GUI:Win_Close(self._parent)
    end)
    self:UpdateUI()
end

function QuanMinHuaShuiOBJ:OpenUI(arg1,arg2,arg3,data)
    self.data = data
    ssrUIManager:OPEN(ssrObjCfg.QuanMinHuaShui)
end

function QuanMinHuaShuiOBJ:UpdateUI()
    for i, v in ipairs(self.data) do
        local color = enumColors[i] or "#DAD2BF"
        local Text_1 = GUI:Text_Create(self.ui.ListView_1, "Text_"..i, 0.00, 0.00, 16, color, v)
        GUI:Text_enableOutline(Text_1, "#000000", 2)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function QuanMinHuaShuiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return QuanMinHuaShuiOBJ