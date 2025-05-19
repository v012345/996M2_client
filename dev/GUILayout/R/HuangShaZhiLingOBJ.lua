HuangShaZhiLingOBJ = {}
HuangShaZhiLingOBJ.__cname = "HuangShaZhiLingOBJ"
--HuangShaZhiLingOBJ.config = ssrRequireCsvCfg("cfg_HuangShaZhiLing")
HuangShaZhiLingOBJ.cost = { { "流金沙砾", 10 }, { "天工之锤", 1888 } }
HuangShaZhiLingOBJ.give = { { "[風魂]黃沙之靈", 1 } }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HuangShaZhiLingOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HuangShaZhiLing_Request)
    end)
    ssrAddItemListX(self.ui.Panel_2,self.give,"item_")
    self:UpdateUI()
end

function HuangShaZhiLingOBJ:ScenePlayEffectEx(arg1, arg2, arg3, data)
    --SL:dump(data)
    for i, v in ipairs(data or {}) do
        if v and data[i + 1] then
            SL:ScheduleOnce(function()
                self:Animation(v, data[i + 1])
            end,0.3 * (i - 1))
        end
    end
end

function HuangShaZhiLingOBJ:Animation(mon1, mon2)
    local mon1_cfg = {
        --世界坐标
        posM_x = SL:GetMetaValue("ACTOR_POSITION_X", mon1),
        posM_y = SL:GetMetaValue("ACTOR_POSITION_Y", mon1),
        --地图坐标
        mapM_x = SL:GetMetaValue("ACTOR_MAP_X", mon1),
        mapM_y = SL:GetMetaValue("ACTOR_MAP_Y", mon1),
    }

    local mon2_cfg = {
        --世界坐标
        posM_x = SL:GetMetaValue("ACTOR_POSITION_X", mon2),
        posM_y = SL:GetMetaValue("ACTOR_POSITION_Y", mon2),
        --地图坐标
        mapM_x = SL:GetMetaValue("ACTOR_MAP_X", mon2),
        mapM_y = SL:GetMetaValue("ACTOR_MAP_Y", mon2),
    }

    local x, y = SL:ConvertMapPos2WorldPos(mon2_cfg.mapM_x - mon1_cfg.mapM_x, mon2_cfg.mapM_y - mon1_cfg.mapM_y, true)

    --local pos = SL:GetSubPoint(
    --        GUI:p(mon2_cfg.mapM_x, mon2_cfg.mapM_y),
    --        GUI:p(mon1_cfg.mapM_x, mon1_cfg.mapM_y)
    --)
    --local dir = SL:GetPointRotateSelf(pos) + 90
    local parent = GUI:Attach_SceneF()
    self.name = self.name and self.name + 1 or 0
    local sfx = GUI:Effect_Create(parent, "effect_1_" .. self.name, mon1_cfg.posM_x, mon1_cfg.posM_y, 0, 15236, 0, 0, 0, 1)
    GUI:Effect_play(sfx, 0, 0, true)
    --GUI:setRotation(sfx, dir)
    GUI:runAction(sfx,
            GUI:ActionSequence(
                    GUI:ActionMoveBy(0.3, x, y),
                    GUI:CallFunc(function()
                        self.name2 = self.name2 and self.name2 + 1 or 0
                        local handle = GUI:Effect_Create(parent, "effect_2_" .. self.name2, mon2_cfg.posM_x, mon2_cfg.posM_y, 0, 23, 0, 0, 0, 1)
                        GUI:Effect_addOnCompleteEvent(handle, function(widget)
                            GUI:removeFromParent(widget)
                        end)
                    end),
                    GUI:ActionRemoveSelf()
            )
    )
end

function HuangShaZhiLingOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,150)
    Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HuangShaZhiLingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HuangShaZhiLingOBJ