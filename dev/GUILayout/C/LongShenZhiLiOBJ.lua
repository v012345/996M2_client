LongShenZhiLiOBJ = {}
LongShenZhiLiOBJ.__cname = "LongShenZhiLiOBJ"
LongShenZhiLiOBJ.config = ssrRequireCsvCfg("cfg_LongShenZhiLi")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LongShenZhiLiOBJ:main(objcfg)
    local myLevel = SL:GetMetaValue("LEVEL")
    if myLevel < 230 then
        sendmsg9("你还没有达到230级呢，无法进行极限觉醒！#249")
        return
    end
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-50,-50)
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
    --元宝晋升
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LongShenZhiLi_Request,1)
    end )
    --灵符晋升
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LongShenZhiLi_Request,2)
    end )
    self.starList = {}
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    self.lightWidgets = {}
    self:InitUI()
    self:UpdateUI()
end

function LongShenZhiLiOBJ:InitUI()
    for i = 1, 10 do
        local img = GUI:Image_Create(self.ui.Panel_star, "Star"..i,0,0,"res/custom/LongShenZhiLi/star1.png")
        GUI:setTag(img, i)
        table.insert(self.starList, img)
    end
     GUI:UserUILayout(self.ui.Panel_star, {
        dir=2,
        addDir=2,
        interval=0,
        gap = {x=10},
        sortfunc = function (lists)
            table.sort(lists, function (a, b)
                return GUI:getTag(a) > GUI:getTag(b)
            end)
        end
    })
    self.lightWidgets = GUI:getChildren(self.ui.Node_light)
    local j = 9
    for i = 1, #self.lightWidgets do
        GUI:setLocalZOrder(self.lightWidgets[i], j)
        j = j - 1
    end
end
--更新星星
function LongShenZhiLiOBJ:UpdateStar(star)
    for i = 1, 10 do
        if star >= i then
            GUI:Image_loadTexture(self.starList[i], "res/custom/LongShenZhiLi/star2.png")
        else
            GUI:Image_loadTexture(self.starList[i], "res/custom/LongShenZhiLi/star1.png")
        end
    end
end

--更新点亮
function LongShenZhiLiOBJ:UpdateLight(light)
    for i, v in ipairs(self.lightWidgets) do
        if light >= i then
            GUI:setVisible(v, true)
        else
            GUI:setVisible(v, false)
        end
    end
end

function LongShenZhiLiOBJ:UpdateUI()
    local currLevel = self.longShenZhiLiLevel
    local Nextlevel = self.longShenZhiLiLevel + 1
    self:UpdateStar(self.currCount)
    self:UpdateLight(currLevel)
    GUI:Image_loadTexture(self.ui.Image_currLevel, "res/custom/LongShenZhiLi/level/level_"..currLevel..".png")
    GUI:Image_loadTexture(self.ui.Image_nextLevel, "res/custom/LongShenZhiLi/level/level_"..Nextlevel..".png")
    local currCfg = self.config[currLevel]
    local nextCfg = self.config[Nextlevel]
    local successRate1, successRate2 --成功率
    local currAtt1,currAtt2,currAtt3 --当前属性
    local nextAtt1,nextAtt2,nextAtt3 --下级属性
    local cost1,cost2 = {}, {}
    if not currCfg then
        currAtt1 = 0
        currAtt2 = 0
        currAtt3 = "0%"
        successRate1 = "100%"
        successRate2 = "100%"
    else
        currAtt1 = currCfg.attr1
        currAtt2 = currCfg.attr2
        currAtt3 = currCfg.zhanXue .. "%"
    end
    if not nextCfg then
        local maxCfg = self.config[#self.config]
        nextAtt1 = maxCfg.attr1
        nextAtt2 = maxCfg.attr2
        nextAtt3 = maxCfg.zhanXue .. "%"
        successRate1 = maxCfg.YBGLshow
        successRate2 = maxCfg.LFGLshow
        cost1,cost2 = maxCfg.YBcost, maxCfg.LFcost
    else
        nextAtt1 = nextCfg.attr1
        nextAtt2 = nextCfg.attr2
        nextAtt3 = nextCfg.zhanXue .. "%"
        cost1,cost2 = nextCfg.YBcost, nextCfg.LFcost
        successRate1 = nextCfg.YBGLshow
        successRate2 = nextCfg.LFGLshow
        --SL:dump(nextCfg)
    end
    --更新属性显示
    GUI:Text_setString(self.ui.Text_successRate1, successRate1)
    GUI:Text_setString(self.ui.Text_successRate2, successRate2)
    GUI:Text_setString(self.ui.Text_currAtt1, "+"..currAtt1)
    GUI:Text_setString(self.ui.Text_currAtt2, "+"..currAtt2)
    GUI:Text_setString(self.ui.Text_currAtt3, currAtt3)
    GUI:Text_setString(self.ui.Text_nextAtt1, "+"..nextAtt1)
    GUI:Text_setString(self.ui.Text_nextAtt2, "+"..nextAtt2)
    GUI:Text_setString(self.ui.Text_nextAtt3, nextAtt3)
    GUI:Text_setString(self.ui.Text_BDshow, string.format("%d/10", self.currCount))
    showCost(self.ui.Panel_cost1, cost1,26)
    showCost(self.ui.Panel_cost2, cost2,26)
    delRedPoint(self.ui.Button_1)
    delRedPoint(self.ui.Button_2)
    if currLevel < 9 then
        Player:checkAddRedPoint(self.ui.Button_1, cost1, 30, 10)
        Player:checkAddRedPoint(self.ui.Button_2, cost2, 30, 10)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LongShenZhiLiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.longShenZhiLiLevel = arg1
    self.currCount = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LongShenZhiLiOBJ