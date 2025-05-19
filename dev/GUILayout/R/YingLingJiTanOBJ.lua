YingLingJiTanOBJ = {}
YingLingJiTanOBJ.__cname = "YingLingJiTanOBJ"
YingLingJiTanOBJ.config = ssrRequireCsvCfg("cfg_YingLingJiTan")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YingLingJiTanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-20)
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
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YingLingJiTan_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YingLingJiTan_Request2)
    end)
    self:UpdateUI()
end

function YingLingJiTanOBJ:UpdateUI()
    local nextCount = self.count + 1
    if nextCount > 10 then
        nextCount = 10
    end
    local totalRecharge = tonumber(Player:getServerVar("U225"))
    local cfg = self.config[nextCount]
    local currTitle = ""
    local nextTitle = ""
    if not self.config[self.count] then
        currTitle = "无"
    else
        currTitle = self.config[self.count].title
    end
    nextTitle = cfg.title
    showCost(self.ui.Panel_1,cfg.cost,36)
    delRedPoint(self.ui.Button_1)
    delRedPoint(self.ui.Button_2)
    GUI:Text_setString(self.ui.Text_1, string.format("%s/%s",cfg.totalRecharge,totalRecharge))
    --GUI:Text_setString(self.ui.Text_3, string.format("当前称号：%s",currTitle))
    --GUI:Text_setString(self.ui.Text_4, string.format("下级称号：%s",nextTitle))
    local currImagePath = "res/custom/JuQing/YingLingDian/desc/"..self.count..".png"
    local nextImagePath = "res/custom/JuQing/YingLingDian/desc/"..(self.count+1)..".png"
    GUI:Image_loadTexture(self.ui.Image_1,currImagePath)
    GUI:Image_loadTexture(self.ui.Image_2,nextImagePath)
    if self.count < 10 then
        Player:checkAddRedPoint(self.ui.Button_1, cfg.cost, 30, 5)
        if totalRecharge >= cfg.totalRecharge then
            GUI:Text_setTextColor(self.ui.Text_1,"#00FF00")
            addRedPoint(self.ui.Button_2, 30, 5)
        else
            GUI:Text_setTextColor(self.ui.Text_1,"#FF0000")
        end
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YingLingJiTanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.count = arg1
    self.totalRecharge = arg2
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YingLingJiTanOBJ