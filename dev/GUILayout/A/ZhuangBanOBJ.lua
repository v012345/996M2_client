ZhuangBanOBJ = {}
ZhuangBanOBJ.__cname = "ZhuangBanOBJ"
ZhuangBanOBJ.config = ssrRequireCsvCfg("cfg_ZhuangBan")
ZhuangBanOBJ.cost = { {} }
ZhuangBanOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ZhuangBanOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBan_OpenUI)
end

function ZhuangBanOBJ:OpenUI(arg1, arg2, arg3, data)
    self.received = data.received or {}
    self.curr = data.curr or {}
    local objcfg = self.objcfg
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -20)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ZhuangBan_Request,self.Shape)
    end)

    self.btnList = GUI:getChildren(self.ui.Node_left_btn)
    self.currSelect = 1
    self:UpdateUI()
end

function ZhuangBanOBJ:setButton()
    for i, v in ipairs(self.btnList) do
        if self.currSelect == i then
            GUI:Button_setBrightEx(v, false)
        else
            GUI:Button_setBrightEx(v, true)
        end
    end
    self:ShowList()
end

--选中后
function ZhuangBanOBJ:SetSelect(btnObj, ui, info)
    if not GUI:getChildByName(btnObj, "Image_1") then
        GUI:Image_Create(btnObj, "Image_1", 0.00, 0.00, "res/custom/ZhuangBan/selected.png")
        if GUI:Win_IsNotNull(self.lastBtn) then
            GUI:removeChildByName(self.lastBtn, "Image_1")
        end
        self.lastBtn = btnObj
    end
    local sEffectId = info.sEffect[1] or 0
    local sEffectX = info.sEffect[2] or 0
    local sEffectY = info.sEffect[3] or 0
    local sEffectScale = info.sEffect[4] or 1
    self.Shape = info.Shape[1] or 0
    GUI:removeAllChildren(self.ui.Panel_1)
    local status, result = pcall(function()
        local sfx = GUI:Effect_Create(self.ui.Panel_1, "sEffect", sEffectX, sEffectY, 0, sEffectId, 0, 0, 4)
        GUI:setScale(sfx, sEffectScale)
    end)
    GUI:removeAllChildren(self.ui.NodeModel)
    if info.type == 2 then
        self:ShowModel2()
    elseif info.type == 3 then
        self:ShowModel3()
    end
    local status, result = pcall(function()
        local attStr = info.attshow or ""
        --显示属性
        local atts = {}
        for i, v in ipairs(attStr) do
            table.insert(atts,v.."#250|")
        end
        createMultiLineRichText(self.ui.Panel_3, "RiText",0,0,atts,nil,600,16)
    end)
end
--显示奔跑的模型

function ZhuangBanOBJ:ShowModel2()
    local NodeModel = self.ui.NodeModel
    local feature = SL:GetMetaValue("FEATURE")
    local EffecWeapon = GUI:Effect_Create(NodeModel, "EffecWeapon", .00, 0.00, 5, feature.weaponID, 0, 5, 4, 1)
    local EffectActor = GUI:Effect_Create(NodeModel, "EffectActor", .00, 0.00, 4, feature.clothID, 0, 5, 4, 1)
end
--显示人物模型
function ZhuangBanOBJ:ShowModel3()
    local NodeModel = self.ui.NodeModel
    local feature = SL:GetMetaValue("FEATURE")
    local EffecWeapon = GUI:Effect_Create(NodeModel, "EffecWeapon", 0.00, 0.00, 5, feature.weaponID, 0, 0, 4, 1)
    local EffectActor = GUI:Effect_Create(NodeModel, "EffectActor", 0.00, 0.00, 4, feature.clothID, 0, 0, 4, 1)
end

--显示装扮列表
function ZhuangBanOBJ:ShowList()
    --加载列表
    local zhuangBanList = self.received[self.currSelect]
    local currZhuangBanId = self.curr[self.currSelect] or 0
    local showZhuangBnaArray = {}
    if #zhuangBanList > 0 then
        for i, v in ipairs(zhuangBanList) do
            local cfg = self.config[v]
            if cfg then
                cfg.id = v
                table.insert(showZhuangBnaArray, cfg)
            end
        end
        table.sort(showZhuangBnaArray, function(a, b)
            return a.index < b.index
        end)
    else
        GUI:removeAllChildren(self.ui.Panel_1)
        sendmsg9("未获得对应装扮#249")
    end
    GUI:ListView_removeAllItems(self.ui.ListView)
	local Panel_2 = GUI:Layout_Create(self.ui.ListView, "Panel_2", 0.00, 0.00, 294, 444, false)
    for i, v in ipairs(showZhuangBnaArray) do
        local widget = GUI:Widget_Create(Panel_2, "widget_" .. i, 0, 0, 142, 224)
        GUI:LoadExport(widget, "A/ZhuangBan_cell_UI")
        GUI:setTag(widget, i)
        local ui = GUI:ui_delegate(widget)
        GUI:Text_setString(ui.Text_1, v.name)
        local ShapeId = v.Shape[1] or 0
        local ShapeX = v.Shape[2] or 0
        local ShapeY = v.Shape[3] or 0
        local ShapeScale = v.Shape[4] or 1
        local sfx = GUI:Effect_Create(ui.Panel_1, "sfx", ShapeX, ShapeY, v.effType, ShapeId, 0, 0, 4)
        GUI:setScale(sfx, ShapeScale)
        GUI:addOnClickEvent(ui.Button_1, function(btnObj)
            self:SetSelect(btnObj, ui, v)
        end)
        --设置当前的
        if currZhuangBanId > 0 then
            if currZhuangBanId == v.id then
                self:SetSelect(ui.Button_1, ui, v)
            end
        end
    end
    --排序
    GUI:UserUILayout(Panel_2, {
        dir = 3,
        --addDir = 2,
        interval = 0,
        autosize = 1,
        gap = { x = 4, y = 4 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) > GUI:getTag(b)
            end)
        end
    })
end

function ZhuangBanOBJ:UpdateUI()
    for i, v in ipairs(self.btnList) do
        if self.currSelect == i then
            GUI:Button_setBrightEx(v, false)
        else
            GUI:Button_setBrightEx(v, true)
        end
        GUI:addOnClickEvent(v, function()
            self.currSelect = i
            self:setButton()
        end)
    end
    self:ShowList()
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ZhuangBanOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ZhuangBanOBJ