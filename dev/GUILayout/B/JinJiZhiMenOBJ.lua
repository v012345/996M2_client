JinJiZhiMenOBJ = {}
JinJiZhiMenOBJ.__cname = "JinJiZhiMenOBJ"
JinJiZhiMenOBJ.config = ssrRequireCsvCfg("cfg_JinJiZhiMen")
JinJiZhiMenOBJ.npcIdEnum = {
    [212] = 1,
    [221] = 2,
    [222] = 3,
    [223] = 4,
}
local group_sizes = { 9, 9, 9, 9 }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JinJiZhiMenOBJ:main(objcfg)
    self.buttonLock = false
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    self.tuJianType = self.npcIdEnum[objcfg.NPCID]
    local bGImgPath = "res/custom/JinJiZhiMen/bg"..self.tuJianType..".png"
    GUI:Image_loadTexture(self.ui.ImageBG, bGImgPath)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-40)
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

    GUI:addOnClickEvent(self.ui.Button_enterMap, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JinJiZhiMen_EnterMap, self.tuJianType)
    end)
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    self.cfg = {}
    for k,v in ipairs(self.config) do
        if v.type == self.tuJianType then
            table.insert(self.cfg, v)
        end
    end
    self:ShowUI()
end

--显示UI
function JinJiZhiMenOBJ:ShowUI()
    self.items = {}
    local function createCircularLayout(radius, numItems, centerPosX, centerPosY, startAngleDegrees, offsets)
    local angleOffset = startAngleDegrees or 0 -- 起始角度偏移，默认为0
    -- 创建一个表来存储所有控件的引用
    local items = {}
    local drawNode = cc.DrawNode:create()
    GUI:addChild(self.ui.ImageBG,drawNode)
    --local color = cc.c4f(1, 0, 0, 1)
    --drawNode:drawCircle(cc.p(centerPosX, centerPosY), radius, math.pi * 2, 100, false, 1, 1, color)
    -- 循环遍历每个控件的索引
    local angleStep = -2 * math.pi / numItems
    local startAngleRadians = math.rad(angleOffset)
    for i = 0, numItems - 1 do
        local angle = startAngleRadians + angleStep * i
        local offset = offsets[i+1] or {x = 0, y = 0}
        local x = centerPosX + (radius + offset.x) * math.cos(angle)
        local y = centerPosY + (radius + offset.y) * math.sin(angle)
        local widget = GUI:Widget_Create(self.ui.ImageBG, "widget_"..i, 0, 0, 100, 110)
        GUI:LoadExport(widget, "B/JinJiZhiMenCellUI")
        GUI:setAnchorPoint(widget, 0.50, 0.50)
        GUI:setPosition(widget, x, y)
        local item = GUI:ui_delegate(widget)
        GUI:addOnClickEvent(item.Button_jiHuo, function()
            if self.buttonLock == true then
                return
            end
            ssrMessage:sendmsg(ssrNetMsgCfg.JinJiZhiMen_Request, self.tuJianType, i+1)
            self.buttonLock = true
            SL:scheduleOnce(self.ui.ImageBG, function()
                self.buttonLock = false
            end , 0.3)
        end )
        table.insert(items, item)
    end
        -- 返回控件的引用表，以便可以进一步操作这些控件（如果需要）
        return items
    end
    -- 使用示例
    local radius = 166        -- 圆的半径
    local numItems = 9        -- 控件数量

    -- 调用函数创建圆形布局
    local offsets = {
    [3] = {x = 0, y = -60},  -- 为第三个点设置偏移
    [8] = {x = 0, y = -60},    -- 为第八个点设置偏移
    [4] = {x = 0, y = 20},  -- 为第四个点设置偏移
    [7] = {x = 0, y = 20},    -- 为第七个点设置偏移
    }
    self.items = createCircularLayout(radius, numItems, 650, 290,90, offsets)
    self:UpdateUI()
end

function JinJiZhiMenOBJ:UpdateUI()
    --SL:dump(self.data)
    for i, v in ipairs(self.cfg) do
        local ui = self.items[i]
        if ui then
            local titImgPath = "res/custom/JinJiZhiMen/itemName/".. self.tuJianType .."/title_".. i ..".png"
            local showItem = {{v.cost[1][1],v.cost[1][2]}}
            GUI:Image_loadTexture(ui.Image_titile, titImgPath)
            showCost(ui.Panel_item, showItem,5,{itemBG = "res/custom/JinJiZhiMen/item_bg.png",textY = 16})
            delRedPoint(ui.Button_jiHuo)
            if not self.data[v.name] then
                Player:checkAddRedPoint(ui.Button_jiHuo, v.cost, 14, 0)
            else
                GUI:Button_loadTextureNormal(ui.Button_jiHuo, "res/custom/JinJiZhiMen/alreadyActivated.png")
                GUI:setTouchEnabled(ui.Button_jiHuo,false)
            end
        end
    end
end

--判断当前页是否激活
function JinJiZhiMenOBJ:IsActivated(name)
    if self.data[name] then
        return true
    else
        return false
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JinJiZhiMenOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JinJiZhiMenOBJ