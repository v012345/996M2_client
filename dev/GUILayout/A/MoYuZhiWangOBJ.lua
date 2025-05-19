MoYuZhiWangOBJ = {}
MoYuZhiWangOBJ.__cname = "MoYuZhiWangOBJ"
MoYuZhiWangOBJ.config = ssrRequireCsvCfg("cfg_MoYuZhiWang")
MoYuZhiWangOBJ.cost = { {} }
MoYuZhiWangOBJ.give = { {} }
MoYuZhiWangOBJ.eventName = "MoYuZhiWang"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MoYuZhiWangOBJ:main(objcfg)
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
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYuZhiWang_Request)
    end)
end

function MoYuZhiWangOBJ:ShowReward(ui, currPoints, data)
    for i, info in ipairs(self.config) do
        if not data[tostring(i)] then
            --SL:Print("下一档奖励：第 " .. i .. " 档，积分要求：" .. info.points .. "，奖励：" .. SL:Print(info.rewards))
            ssrAddItemListX(ui.Panel_MoYuZhiWangChild1, info.rewards, "item_", {spacing = 20, imgRes = "res/custom/MoYuZhiWang/itembg.png"})
            GUI:Image_loadTexture(ui.Image_MoYuZhiWangChild1,"res/custom/MoYuZhiWang/jieduan_"..i..".png")
            GUI:Text_setString(ui.Text_MoYuZhiWangChild1,string.format("(%d/%d)",currPoints,info.points))
            return
        end
    end
    GUI:removeAllChildren(ui.Panel_MoYuZhiWangChild1)
    GUI:Image_loadTexture(ui.Image_MoYuZhiWangChild1,"res/custom/MoYuZhiWang/jieduan_7.png")
    GUI:Text_setString(ui.Text_MoYuZhiWangChild1,"已完成")
    sendmsg9("你已经全部完成了，继续摸鱼不会再获得奖励#249")
end

--进入地图
function MoYuZhiWangOBJ:Enter(arg1, arg2, arg2, data)
    local obj = GUI:Win_FindParent(110)
    local MoYuZhiWangChild = GUI:getChildByName(obj, "MoYuZhiWangChild")
    if GUI:Win_IsNotNull(MoYuZhiWangChild) then
        GUI:removeChildByName(obj, "MoYuZhiWangChild")
    end
    GUI:LoadExport(obj, "A/MoYuZhiWangChildUI")
    local ui = GUI:ui_delegate(obj)
    self:ShowReward(ui, arg1, data)
end

function MoYuZhiWangOBJ:Leave()
    local obj = GUI:Win_FindParent(110)
    local MoYuZhiWangChild = GUI:getChildByName(obj, "MoYuZhiWangChild")
    if GUI:Win_IsNotNull(MoYuZhiWangChild) then
        GUI:removeChildByName(obj, "MoYuZhiWangChild")
    end
end

function MoYuZhiWangOBJ:UpdateUI(arg1, arg2, arg2, data)
    local obj = GUI:Win_FindParent(110)
    local MoYuZhiWangChild = GUI:getChildByName(obj, "MoYuZhiWangChild")
    if GUI:Win_IsNull(MoYuZhiWangChild) then
        GUI:LoadExport(obj, "A/MoYuZhiWangChildUI")
    end
    local ui = GUI:ui_delegate(obj)
    self:ShowReward(ui, arg1, data)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MoYuZhiWangOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MoYuZhiWangOBJ