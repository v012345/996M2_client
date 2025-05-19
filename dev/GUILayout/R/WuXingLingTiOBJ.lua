WuXingLingTiOBJ = {}
WuXingLingTiOBJ.__cname = "WuXingLingTiOBJ"
--WuXingLingTiOBJ.config = ssrRequireCsvCfg("cfg_WuXingLingTi")
WuXingLingTiOBJ.cost = { {"造化结晶",20} }
WuXingLingTiOBJ.cost1 = { {"造化结晶",20},{"元宝",100000} }
WuXingLingTiOBJ.cost2 = { {"造化结晶",20},{"灵符",248} }
WuXingLingTiOBJ.give = { {"五行灵体[称号]",1},{"五行聚灵丹",1} }

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function WuXingLingTiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)

    self.selectIndex = 1

    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    GUI:addOnClickEvent(self.ui.Button_6, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WuXingLingTi_Request1, self.selectIndex)
    end)
    GUI:addOnClickEvent(self.ui.Button_7, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WuXingLingTi_Request2, self.selectIndex)
    end)
    GUI:addOnClickEvent(self.ui.Button_8, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.WuXingLingTi_Request3)
    end)
    ssrAddItemListX(self.ui.Panel_3,self.give,"item_")
    self.btnList = GUI:getChildren(self.ui.Node_button)
    self.lastBtn = self.btnList[1]
    self:InitUI()
end

function WuXingLingTiOBJ:InitUI()
    showCost(self.ui.Panel_2,self.cost,50)
    GUI:Text_setString(self.ui.Text_1,string.format("Lv·%d", self.data[1] or 0))
    GUI:Text_setString(self.ui.Text_2,string.format("+%d%%", self.data[1] or 0))
    for i, v in ipairs(self.btnList) do
        GUI:addOnClickEvent(v, function(widget)
            GUI:removeChildByName(self.lastBtn, "Image_3")
            self.selectIndex = i
            GUI:Image_Create(widget, "Image_3", -17.00, -18.00, "res/custom/JuQing/WuXingLingTi/selected.png")
            self:UpdateShow(i)
            self.lastBtn = widget
        end)
    end
end

function WuXingLingTiOBJ:checkAllActivate()
    local result = true
    for i, v in ipairs(self.data or {}) do
        if v < 10 then
            result = false
            break
        end
    end
    return result
end

function WuXingLingTiOBJ:UpdateShow(index)
    showCost(self.ui.Panel_2,self.cost,50)
    local currNumber = self.data[index]
    GUI:Text_setString(self.ui.Text_1,string.format("Lv·%d", currNumber or 0))
    GUI:Text_setString(self.ui.Text_2,string.format("+%d%%", self.data[index] or 0))
    GUI:Image_loadTexture(self.ui.Image_1, "res/custom/JuQing/WuXingLingTi/fount_" .. index .. ".png")
    GUI:Image_loadTexture(self.ui.Image_2, "res/custom/JuQing/WuXingLingTi/attr_" .. index .. ".png")
    delRedPoint(self.ui.Button_6)
    delRedPoint(self.ui.Button_7)
    if currNumber < 10 then
        Player:checkAddRedPoint(self.ui.Button_6, self.cost1, 30, 5)
        Player:checkAddRedPoint(self.ui.Button_7, self.cost2, 30, 5)
    end
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "五行灵体")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", idx)
    delRedPoint(self.ui.Button_8)
    if not titleData then
        if self:checkAllActivate() then
            addRedPoint(self.ui.Button_8,25,5)
        end
    end

end

function WuXingLingTiOBJ:UpdateUI()
    self:UpdateShow(self.selectIndex)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function WuXingLingTiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return WuXingLingTiOBJ