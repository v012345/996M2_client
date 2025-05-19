XingCuiCanOBJ = {}
XingCuiCanOBJ.__cname = "XingCuiCanOBJ"
--XingCuiCanOBJ.config = ssrRequireCsvCfg("cfg_XingCuiCan")
XingCuiCanOBJ.cost = {{"星图残卷",10},{"元宝",1880000}}
XingCuiCanOBJ.give = {{"群星之怒★★★",1}}
local attrGroup = 4
local clientAttrGroup = attrGroup + 1 --客户端的自定义属性的下标是从1开始
local equipPos = 1 --装备位置
local equipName = "群星之怒★★★"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XingCuiCanOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.XingCuiCan_Request)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    self:UpdateUI()
end

function XingCuiCanOBJ:UpdateUI()
    showCost(self.ui.Panel_2,self.cost,30)
    local values = Player:getEquipCustomAttrValue(equipPos, clientAttrGroup)
    local attrValues1 = values[1] or {}
    local attrValues2 = values[2] or {}
    local attrValue1 = attrValues1[3] or 0
    local attrValue2 = attrValues2[3] or 0
    GUI:Text_setString(self.ui.Text_1, string.format("%d/10", attrValue2/100))
    delRedPoint(self.ui.Button_1)
    if attrValue2/100 < 10 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 25, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XingCuiCanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XingCuiCanOBJ