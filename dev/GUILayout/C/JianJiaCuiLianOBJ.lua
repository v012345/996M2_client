JianJiaCuiLianOBJ = {}
JianJiaCuiLianOBJ.__cname = "JianJiaCuiLianOBJ"
--JianJiaCuiLianOBJ.config = ssrRequireCsvCfg("cfg_JianJiaCuiLian")
JianJiaCuiLianOBJ.cost1 = {{"流光淬火剣[戮兽]",1},{"流光淬火剣[饮血]",1},{"流光淬火剣[天殇]",1},{"幻灵水晶",18}}
JianJiaCuiLianOBJ.cost2 = {{"流光淬火衣[男]",1},{"流光锦绣衣[男]",1},{"流光幻彩衣[男]",1},{"幻灵水晶",18}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JianJiaCuiLianOBJ:main(objcfg)
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
    --GUI:Timeline_Window1(self._parent)
    --武器
    GUI:addOnClickEvent(self.ui.Button_Go1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JianJiaCuiLian_Request,1)
    end)
    --衣服
    GUI:addOnClickEvent(self.ui.Button_Go2,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JianJiaCuiLian_Request,2)
    end)

    self:UpdateUI()

end

function JianJiaCuiLianOBJ:UpdateUI()
    showCost(self.ui.Layout,self.cost1,10)
    showCost(self.ui.Layout_1,self.cost2,10)
    Player:checkAddRedPoint(self.ui.Button_Go1,self.cost1)
    Player:checkAddRedPoint(self.ui.Button_Go2,self.cost2)
    local idx1 = SL:GetMetaValue("ITEM_INDEX_BY_NAME","流光剣[综合之力]")
    local idx2 = SL:GetMetaValue("ITEM_INDEX_BY_NAME","流光·庇护[男]")
    GUI:ItemShow_updateItem(self.ui.Item1,{index = idx1})
    GUI:ItemShow_updateItem(self.ui.Item2,{index = idx2})

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JianJiaCuiLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JianJiaCuiLianOBJ