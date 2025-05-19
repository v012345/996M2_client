ManHuangXueMaiOBJ = {}
ManHuangXueMaiOBJ.__cname = "ManHuangXueMaiOBJ"
ManHuangXueMaiOBJ.config = ssrRequireCsvCfg("cfg_ManHuangXueMai")
ManHuangXueMaiOBJ.cost1 = { { "幻灵水晶", 100 }, { "灵符", 100 } }
ManHuangXueMaiOBJ.cost2 = { { "蛮荒图腾", 66 }, { "金币", 18880000 } }
ManHuangXueMaiOBJ.CheckBoxList = {}
ManHuangXueMaiOBJ.lastSelect = 0
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ManHuangXueMaiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    --关闭背景
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        local number = self:GetCheckBoxNumber()
        self.lastSelect = number
        ssrMessage:sendmsg(ssrNetMsgCfg.ManHuangXueMai_Request1, number)

    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ManHuangXueMai_Request2)
    end)
    self:UpdateUI()
end

function ManHuangXueMaiOBJ:UpdateUI()
    GUI:removeAllChildren(self.ui.Panel_1)
    local size = GUI:getContentSize(self.ui.Panel_1)
    local beginY = size.height - 30
    GUI:Text_setString(self.ui.Text_count, string.format("[%d/10]", self.count))
    self.CheckBoxList = {}
    for i = 1, 8 do
        local cfg = self.config[i]
        local attrValue = self.data[i] or 0
        local Text_1 = GUI:Text_Create(self.ui.Panel_1, "Text_" .. i, 10.00, beginY - (i - 1) * 38, 18, "#00ff00", attrValue .. "%")
        GUI:setAnchorPoint(Text_1, 0.00, 0.00)
        GUI:Text_enableOutline(Text_1, "#000000", 1)
        local CheckBox_1 = GUI:CheckBox_Create(Text_1, "CheckBox_" .. i, 60.00, -5.00, "res/custom/JuQing/ManHuangXueMai/checkbox2.png", "res/custom/JuQing/ManHuangXueMai/checkbox1.png")
        GUI:setTouchEnabled(CheckBox_1, true)
        GUI:setTag(CheckBox_1, i)
        table.insert(self.CheckBoxList, CheckBox_1)
        if self.lastSelect == i and attrValue ~= 0 then
            GUI:CheckBox_setSelected(CheckBox_1, true)
        end
        GUI:CheckBox_addOnEvent(CheckBox_1, function()
            if GUI:CheckBox_isSelected(CheckBox_1) then
                if attrValue == 0 then
                    local name = cfg.name or ""
                    sendmsg9(name .. "#249|属性为0,无法洗练!#250")
                    GUI:CheckBox_setSelected(CheckBox_1, false)
                    return
                end
            end
            self:SelectCheckBox(i)
        end)
    end
    local number = self:GetCheckBoxNumber()
    if number == 0 then
        delRedPoint(self.ui.Button_1)
    end
    delRedPoint(self.ui.Button_2)
    if self.count < 10 then
        Player:checkAddRedPoint(self.ui.Button_2, self.cost2, 30, 5)
    end
end

--获取编号
function ManHuangXueMaiOBJ:GetCheckBoxNumber()
    local result = 0
    for i, v in ipairs(self.CheckBoxList) do
        if GUI:CheckBox_isSelected(v) then
            result = GUI:getTag(v)
            break
        end
    end
    return result
end

function ManHuangXueMaiOBJ:SelectCheckBox(exclude)
    for i, v in ipairs(self.CheckBoxList) do
        local tag = GUI:getTag(v)
        if tag ~= exclude then
            GUI:CheckBox_setSelected(v, false)
        end
    end
    local number = self:GetCheckBoxNumber()
    if number > 0 then
        Player:checkAddRedPoint(self.ui.Button_1, self.cost1, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ManHuangXueMaiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count = arg1
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ManHuangXueMaiOBJ