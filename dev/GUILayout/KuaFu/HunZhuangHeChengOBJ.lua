HunZhuangHeChengOBJ = {}
HunZhuangHeChengOBJ.__cname = "HunZhuangHeChengOBJ"
--HunZhuangHeChengOBJ.config = ssrRequireCsvCfg("cfg_HunZhuangHeCheng")
HunZhuangHeChengOBJ.config = {
    { pos = 101, config = ssrRequireCsvCfg("cfg_HunZhuang_WuQi"), name = "魂装武器" },
    { pos = 102, config = ssrRequireCsvCfg("cfg_HunZhuang_YiFu"), name = "魂装衣服" },
    { pos = 103, config = ssrRequireCsvCfg("cfg_HunZhuang_TouKui"), name = "魂装头盔" },
    { pos = 104, config = ssrRequireCsvCfg("cfg_HunZhuang_XiangLian"), name = "魂装项链" },
    { pos = 105, config = ssrRequireCsvCfg("cfg_HunZhuang_ShouZhuo"), name = "魂装手镯" },
    { pos = 106, config = ssrRequireCsvCfg("cfg_HunZhuang_ZhiHuan"), name = "魂装指环" }
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HunZhuangHeChengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    self.leftBtnList = {}
    self:CreateLeftBtn()
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HunZhuangHeCheng_Request, self.parentIndex, self.childIndex)
    end)

end

--设置主菜单红点
function HunZhuangHeChengOBJ:setMainMenuRed()
    for i, v in ipairs(self.config) do
        local widget = self.leftBtnList[i]
        if widget then
            delRedPoint(widget)
        end
        for _, cfg in ipairs(v.config) do
            if widget then
                local constName, needItemCount = Player:checkItemNumByTable(cfg.cost)
                if not constName then
                    addRedPoint(widget, 25, 5)
                    break
                end
            end
        end
    end
end
--设置子菜单红点
function HunZhuangHeChengOBJ:setChildMenuRed()
    local config = self.config[self.parentIndex]
    local cfg = config.config
    for i, v in pairs(cfg) do
        local widget = self.childBtnList[i]
        if widget then
            delRedPoint(widget)
            Player:checkAddRedPoint(widget, v.cost, 16, 0)
        end
    end
end

function HunZhuangHeChengOBJ:showHunZhuangCost(parentIndex, childIndex)
    local config = self.config[parentIndex]
    local cfg = config.config[childIndex]
    local costNum = #cfg.cost
    local spacing = 0
    if costNum > 3 then
        spacing = 30
        GUI:Image_loadTexture(self.ui.Image_2, "res/custom/HunZhuangHeCheng/costBg2.png")
    else
        spacing = 46
        GUI:Image_loadTexture(self.ui.Image_2, "res/custom/HunZhuangHeCheng/costBg1.png")
    end
    showCost(self.ui.Panel_1, cfg.cost)
    GUI:UserUILayout(self.ui.Panel_1, {
        dir = 2,
        interval = 0,
        gap = { x = spacing },
        autosize = 1,
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:Win_GetParam(a) < GUI:Win_GetParam(b)
            end)
        end
    })
    Player:checkAddRedPoint(self.ui.Button_1, cfg.cost, 30, 5)
    ssrAddItemListX(self.ui.Panel_2,cfg.give,"item_")
    --设置红点
    self:setMainMenuRed()
    self:setChildMenuRed()
end

--所有按钮解除禁用
function HunZhuangHeChengOBJ:setAllBtnState()
    for i, v in ipairs(self.leftBtnList) do
        GUI:Button_setBrightEx(v, true)
    end
end
--设置子菜单按钮选中状态
function HunZhuangHeChengOBJ:setChildBtnSelected(widget)
    for i, v in ipairs(self.childBtnList) do
        GUI:removeAllChildren(v)
    end
    GUI:Image_Create(widget, "Image_select", 0.00, 0.00, "res/custom/HunZhuangHeCheng/select.png")
end
--显示子菜单
function HunZhuangHeChengOBJ:showChildMenu(parentIndex)
    GUI:ListView_removeAllItems(self.ui.ListView_2)
    self.childBtnList = {}
    for i = 1, 9 do
        local Button = GUI:Button_Create(self.ui.ListView_2, "Button_child_" .. i, 0.00, 0.00, "res/custom/HunZhuangHeCheng/" .. parentIndex .. "/btn_" .. i .. ".png")
        GUI:setTouchEnabled(Button, true)
        GUI:setTag(Button, i)
        GUI:addOnClickEvent(Button, function(widget)
            self:setChildBtnSelected(widget)
            self.childIndex = i
            self:showHunZhuangCost(parentIndex, i)
        end)
        if i == 1 then
            self.childIndex = i
            GUI:Image_Create(Button, "Image_select", 0.00, 0.00, "res/custom/HunZhuangHeCheng/select.png")
        end
        table.insert(self.childBtnList, Button)
    end
end

function HunZhuangHeChengOBJ:CreateLeftBtn()
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    for i = 1, 6 do
        local Button = GUI:Button_Create(self.ui.ListView_1, "Button_left_" .. i, 0.00, 0.00, "res/custom/HunZhuangHeCheng/left_btn/btn_" .. i .. "_1.png")
        GUI:Button_loadTextureDisabled(Button, "res/custom/HunZhuangHeCheng/left_btn/btn_" .. i .. ".png")
        GUI:setTouchEnabled(Button, true)
        GUI:setTag(Button, i)
        GUI:addOnClickEvent(Button, function(widget)
            self:setAllBtnState()
            GUI:Button_setBrightEx(widget, false)
            self:showChildMenu(i)
            self.parentIndex = i
            self:showHunZhuangCost(i, 1)
        end)
        if i == 1 then
            self.parentIndex = i
            GUI:Button_setBrightEx(Button, false)
        end
        table.insert(self.leftBtnList, Button)
    end
    --初始化子菜单显示
    self:showChildMenu(1)
    self:showHunZhuangCost(1, 1)
end

function HunZhuangHeChengOBJ:UpdateUI()
    self:showHunZhuangCost(self.parentIndex, self.childIndex)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HunZhuangHeChengOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HunZhuangHeChengOBJ