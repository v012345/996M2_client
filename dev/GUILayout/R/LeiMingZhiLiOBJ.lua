LeiMingZhiLiOBJ = {}
LeiMingZhiLiOBJ.__cname = "LeiMingZhiLiOBJ"
--LeiMingZhiLiOBJ.config = ssrRequireCsvCfg("cfg_LeiMingZhiLi")
LeiMingZhiLiOBJ.cost = {{"天雷之环",1},{"万雷",1},{"神兵·雷神之威",1},{"「掌控雷电」",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LeiMingZhiLiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LeiMingZhiLi_Request, 1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LeiMingZhiLi_Request, 2)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LeiMingZhiLi_Request, 3)
    end)
    GUI:addOnClickEvent(self.ui.Button_4, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LeiMingZhiLi_Request, 4)
    end)
    self:UpdateUI()
end

function LeiMingZhiLiOBJ:UpdateUI()
    showCost(self.ui.Panel_1,self.cost,78)
    local btnList = GUI:getChildren(self.ui.Node_1)
    for i, v in ipairs(btnList) do
        delRedPoint(v)
        if self.data[i] == 0 then
            local cost = {self.cost[i]}
            Player:checkAddRedPoint(v,cost,20,5)
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LeiMingZhiLiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LeiMingZhiLiOBJ