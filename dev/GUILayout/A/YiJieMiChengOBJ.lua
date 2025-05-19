YiJieMiChengOBJ = {}
YiJieMiChengOBJ.__cname = "YiJieMiChengOBJ"
--YiJieMiChengOBJ.config = ssrRequireCsvCfg("cfg_YiJieMiCheng")
YiJieMiChengOBJ.cost = {{}}
YiJieMiChengOBJ.give = {{}}
YiJieMiChengOBJ.maps = {
    "异界迷城1",
    "异界迷城2",
    "异界迷城3",
    "异界迷城4",
    "异界迷城5",
    "异界迷城6",
    "异界迷城7",
    "异界迷城8",
    "异界迷城9",
    "异界迷城10",
    }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YiJieMiChengOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJieMiCheng_Request)
    end)
end

function YiJieMiChengOBJ:ShowReward(ui, currPoints, data)
    --for i, info in ipairs(self.config) do
    --    if not data[tostring(i)] then
    --        --SL:Print("下一档奖励：第 " .. i .. " 档，积分要求：" .. info.points .. "，奖励：" .. SL:Print(info.rewards))
    --        ssrAddItemListX(ui.Panel_MoYuZhiWangChild1, info.rewards, "item_", {spacing = 20, imgRes = "res/custom/MoYuZhiWang/itembg.png"})
    --        GUI:Image_loadTexture(ui.Image_MoYuZhiWangChild1,"res/custom/MoYuZhiWang/jieduan_"..i..".png")
    --        GUI:Text_setString(ui.Text_MoYuZhiWangChild1,string.format("(%d/%d)",currPoints,info.points))
    --        return
    --    end
    --end
    --GUI:removeAllChildren(ui.Panel_MoYuZhiWangChild1)
    --GUI:Image_loadTexture(ui.Image_MoYuZhiWangChild1,"res/custom/MoYuZhiWang/jieduan_7.png")
    --GUI:Text_setString(ui.Text_MoYuZhiWangChild1,"已完成")
    --sendmsg9("你已经全部完成了，继续摸鱼不会再获得奖励#249")
end

--进入地图
function YiJieMiChengOBJ:EnterMap(arg1, arg2, arg2, data)
    self.data = data
    local obj = GUI:Win_FindParent(110)
    local MoYuZhiWangChild = GUI:getChildByName(obj, "YiJieMiChengChild")
    if GUI:Win_IsNotNull(MoYuZhiWangChild) then
        GUI:removeChildByName(obj, "YiJieMiChengChild")
    end
    local mapId = SL:GetMetaValue("MAP_ID")
    GUI:LoadExport(obj, "A/YiJieMiChengChildUI")
    local ui = GUI:ui_delegate(obj)
    local nodes = GUI:getChildren(ui.YiJieMiChengChild_Node_1)
    for i, v in ipairs(self.maps) do
        local posIndex = data[v]
        if posIndex then
            GUI:Image_loadTexture(nodes[i],"res/custom/YiJieMiCheng/"..posIndex..".png")
        end
        if mapId == v then
            local ImageBG = GUI:Image_Create(nodes[i], "YiJieMiChengChildImageBG", 12.00, 0.00, "res/custom/YiJieMiCheng/currImg.png")
        end
    end
    SL:RegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "YiJieMiCheng", function (mapData)
        if not string.find(mapData.mapID,"异界") then
            local obj = GUI:Win_FindParent(110)
            local YiJieMiChengChild = GUI:getChildByName(obj, "YiJieMiChengChild")
            if GUI:Win_IsNotNull(YiJieMiChengChild) then
                GUI:removeChildByName(obj, "YiJieMiChengChild")
            end
            SL:UnRegisterLUAEvent(LUA_EVENT_MAPINFOCHANGE, "YiJieMiCheng")
        end
    end)
end

function YiJieMiChengOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YiJieMiChengOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YiJieMiChengOBJ