JinXuZhiMenOBJ = {}
JinXuZhiMenOBJ.__cname = "JinXuZhiMenOBJ"
JinXuZhiMenOBJ.cost ={{ "时空门票", 1 }}
JinXuZhiMenOBJ.looks ={"孤影流觞","降星者","永恒凛冬","金色黎明的圣物箱","暮潮","一缕神念"}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JinXuZhiMenOBJ:main(objcfg)
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
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JinXuZhiMen_Request)
    end)

end


--打乱tab表
function JinXuZhiMenOBJ:shuffle(array)
    local length = #array
    for i = length, 2, -1 do
        local j = math.random(i)
        array[i], array[j] = array[j], array[i]
    end
    return array
end

function JinXuZhiMenOBJ:UpdateUI()
    local tab = self:shuffle(self.looks)
    local nodeList = GUI:getChildren(self.ui.Node_1)

    for i, v in ipairs(tab) do
        if i < 5 then
            GUI:removeAllChildren(nodeList[i])
            local itemIdx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", v)
            GUI:setAnchorPoint(GUI:ItemShow_Create(nodeList[i], "ItemShow_"..i, 30.00, 28.00, {index = itemIdx, count = 1, look = false, bgVisible = false}), 0.50, 0.50)
        end
    end

    GUI:removeAllChildren(self.ui.Panel_Effect)
    GUI:Effect_Create(self.ui.Panel_Effect, "Effect", 25.00, 0.00, 2, 12125, 0, 0, 0, 1.99)

    GUI:Text_setString(self.ui.Text_1,self.data[1].."/5")
    showCost(self.ui.Panel_1,{self.cost[1]},0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JinXuZhiMenOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JinXuZhiMenOBJ