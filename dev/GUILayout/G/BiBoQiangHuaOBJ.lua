BiBoQiangHuaOBJ = {}
BiBoQiangHuaOBJ.__cname = "BiBoQiangHuaOBJ"
--BiBoQiangHuaOBJ.config = ssrRequireCsvCfg("cfg_BiBoQiangHua")
BiBoQiangHuaOBJ.cost = {{"碧波灵珠",20},{"造化结晶",10},{"灵符",400}}
BiBoQiangHuaOBJ.give = {{}}
local attrGroup = 2
local clientAttrGroup = attrGroup + 1 --客户端的自定义属性的下标是从1开始
local equipPos = 21 --装备位置
local equipName = "ζ法相天地ζ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BiBoQiangHuaOBJ:main(objcfg)
    local currEquipName = Player:getEquipNameByPos(equipPos)
    if currEquipName ~= equipName then
        sendmsg9("你身上没有穿戴#250|ζ法相天地ζ#249|无法强化！#250")
        return
    end
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
        ssrMessage:sendmsg(ssrNetMsgCfg.BiBoQiangHua_Request)
    end)
    GUI:Effect_Create(self.ui.Node_1, "sfx1111", 0, 0, 6, 10002, 0, 0, 4, 1)
    self:UpdateUI()
end

function BiBoQiangHuaOBJ:UpdateUI()
    showCost(self.ui.Panel_1, self.cost, 30)
    local values = Player:getEquipCustomAttrValue(equipPos, clientAttrGroup)
    local attrValues1 = values[1] or {}
    local attrValues2 = values[2] or {}
    local attrValue1 = attrValues1[3] or 0
    local attrValue2 = attrValues2[3] or 0
    GUI:Text_setString(self.ui.Text_1, attrValue1 .. "%")
    GUI:Text_setString(self.ui.Text_2, attrValue2 .. "%")
    GUI:Text_setString(self.ui.Text_3, string.format("%d/20", attrValue1))
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function BiBoQiangHuaOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return BiBoQiangHuaOBJ