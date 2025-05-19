XingYunDaFuWengOBJ = {}
XingYunDaFuWengOBJ.__cname = "XingYunDaFuWengOBJ"
--XingYunDaFuWengOBJ.config = ssrRequireCsvCfg("cfg_XingYunDaFuWeng")
XingYunDaFuWengOBJ.give = {{"异界神石", 5},{"圣诞花环", 5},{"圣诞幸运星", 3},{"圣诞花环", 10},{"圣诞幸运星", 3},{"圣诞花环", 15},{"圣诞幸运星", 3},{"圣诞花环", 20},{"圣诞幸运星", 3},{"大富翁礼包", 1}}

XingYunDaFuWengOBJ.NumData = {5, 10, 20, 30, 40, 50}



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XingYunDaFuWengOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -20)
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
    GUI:addOnClickEvent(self.ui.OpenButton, function()
        local bool = GUI:getVisible(self.ui.Button_All)
        if bool then
            GUI:setVisible(self.ui.Button_All, false)
        else
            GUI:setVisible(self.ui.Button_All, true)
        end
    end)

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XingYunDaFuWeng_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XingYunDaFuWeng_Request, 2)
    end)
    for i, v in ipairs(self.give) do
        ssrAddItemListX(self.ui["ItemShow_".. i * 5], {v},"奖励1",{imgRes = ""})
    end

    self:UpdateUI()
    self:InitialSite()
end

function XingYunDaFuWengOBJ:InitialSite()
    --local AllTbl = GUI:getChildren(self.ui.Node_All)
    --for _, v in ipairs(AllTbl) do
    --    GUI:removeAllChildren(v)
    --end
    --绘制所在点的动画
    local SiteNum = self.data[2]
	local SiteEffects = GUI:Frames_Create(self.ui["Panel_"..SiteNum], "SiteEffects", 30.00, 40.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/rwj/tx", ".png", 1, 8, {count=8, speed=100, loop=-1, finishhide=0})
	GUI:setAnchorPoint(SiteEffects, 0.50, 0.50)
end


function XingYunDaFuWengOBJ:UpdateUI()

    if self.data[1] >= 5 then
        local _num = self.data[1] - 5 + 1
        local num = (_num >= 6 and 6) or _num
        SL:Print(self.data[1],_num,num)
        local NumShow = self.NumData[num]
        GUI:Text_setString(self.ui.ShaiZiLooks_1,NumShow .."万元宝一次")
    else
        GUI:Text_setString(self.ui.ShaiZiLooks_1,"免费:".. self.data[1] .."/5")
    end

    --清空所有节点的动画
end

--转动骰子
function XingYunDaFuWengOBJ:PlayAnimation(OldSite, NewSite, Steps, data)
    local imgnum = 12 + Steps
	local Frames_1 = GUI:Frames_Create(self.ui.ShaiZiShow, "Frames_1", 30.00, 47.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/sztx/sz", ".png", 1, imgnum, {count=imgnum, speed=50, loop=1, finishhide=0})
	GUI:setAnchorPoint(Frames_1, 0.50, 0.50)
    SL:scheduleOnce(self.ui.ImageBG, function()
        GUI:removeAllChildren(self.ui.ShaiZiShow) --清空骰子的动画
        GUI:removeAllChildren(self.ui["Panel_"..OldSite]) --删除原有动画
        local SiteEffects = GUI:Frames_Create(self.ui["Panel_"..OldSite], "SiteEffects1", 30.00, 89.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/rwt/tx", ".png", 1, 8, {count=8, speed=100, loop=1, finishhide=1})
        GUI:setAnchorPoint(SiteEffects, 0.50, 0.50)

            SL:scheduleOnce(self.ui.ImageBG, function()--开启一个定时器 绘制落点动画
                local SiteEffects = GUI:Frames_Create(self.ui["Panel_".. NewSite], "SiteEffects2", 30.00, 89.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/rwl/tx", ".png", 1, 8, {count=8, speed=100, loop=1, finishhide=1})
                GUI:setAnchorPoint(SiteEffects, 0.50, 0.50)

                SL:scheduleOnce(self.ui.ImageBG, function()--开启一个定时器 落完后 绘制固定动画
                    GUI:removeAllChildren(self.ui["Panel_".. NewSite]) --删除原有动画
                    local SiteEffects = GUI:Frames_Create(self.ui["Panel_"..NewSite], "SiteEffects", 30.00, 40.00, "res/custom/ShuangJieHuoDongMain/XingYunDaFuWeng/rwj/tx", ".png", 1, 8, {count=8, speed=100, loop=-1, finishhide=0})
                    GUI:setAnchorPoint(SiteEffects, 0.50, 0.50)
                end , 0.5)
            end , 0.5)
    end , 2)
end





-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XingYunDaFuWengOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XingYunDaFuWengOBJ