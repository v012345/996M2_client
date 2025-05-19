AnYuLieXiOBJ = {}
AnYuLieXiOBJ.__cname = "AnYuLieXiOBJ"
--AnYuLieXiOBJ.config = ssrRequireCsvCfg("cfg_AnYuLieXi")
AnYuLieXiOBJ.textConfig = {100,100,100,5}
AnYuLieXiOBJ.items = {{"灵魂牢笼",1},{"典狱长的锁链",1},{"小妖魔吊坠♀",1},{"安菲翁の魂魄",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function AnYuLieXiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-50)
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
    self:UpdateUI()
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.AnYuLieXi_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.AnYuLieXi_Request2)
    end)
    self:ClickShowTips()
    ssrMessage:sendmsg(ssrNetMsgCfg.AnYuLieXi_SyncResponse,nil)
    ssrAddItemListX(self.ui.Panel_1,self.items,"item_",{spacing = 15})
end

function AnYuLieXiOBJ:ClickShowTips()
    GUI:addOnClickEvent(self.ui.Image_1, function(widget)
       local str = [[
            <font size='16' color='#FFFFFF'>击杀以下怪物：</font>
            <font size='16' color='#00FF00'>地藏</font>
            <font size='16' color='#00FF00'>风魔</font>
            <font size='16' color='#00FF00'>暗影魔王</font>
            ]]
        local thisWorldPosition = GUI:getTouchEndPosition(widget)
        local data = {width = 300, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
    GUI:addOnClickEvent(self.ui.Image_2, function(widget)
       local str = [[
            <font size='16' color='#FFFFFF'>击杀以下怪物：</font>
            <font size='16' color='#00FF00'>天之御风(卧龙)</font>
            <font size='16' color='#00FF00'>天之斩浪(卧龙)</font>
            <font size='16' color='#00FF00'>三魂四魄者[赤血]</font>
            ]]
        local thisWorldPosition = GUI:getTouchEndPosition(widget)
        local data = {width = 300, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
    GUI:addOnClickEvent(self.ui.Image_3, function(widget)
       local str = [[
            <font size='16' color='#FFFFFF'>击杀以下怪物：</font>
            <font size='16' color='#00FF00'>重甲守卫</font>
            <font size='16' color='#00FF00'>爆毒神魔</font>
            <font size='16' color='#00FF00'>震天魔神</font>
            ]]
        local thisWorldPosition = GUI:getTouchEndPosition(widget)
        local data = {width = 300, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
    GUI:addOnClickEvent(self.ui.Image_4, function(widget)
       local str = [[
            <font size='16' color='#FFFFFF'>击杀以下怪物：</font>
            <font size='16' color='#00FF00'>小妖魔安菲翁[乱世]</font>
            ]]
        local thisWorldPosition = GUI:getTouchEndPosition(widget)
        local data = {width = 300, str = str, worldPos = thisWorldPosition, formatWay=1, anchorPoint = {x = 1, y = 1}}
        SL:OpenCommonDescTipsPop(data)
    end)
end

function AnYuLieXiOBJ:UpdateUI()
    local textWidgets = GUI:getChildren(self.ui.Node_Text)
    for i, v in pairs(self.data) do
        GUI:Text_setString(textWidgets[i],string.format("(%d/%d)",v,self.textConfig[i]))
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function AnYuLieXiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return AnYuLieXiOBJ