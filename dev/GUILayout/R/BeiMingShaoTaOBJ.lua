BeiMingShaoTaOBJ = {}
BeiMingShaoTaOBJ.__cname = "BeiMingShaoTaOBJ"
--BeiMingShaoTaOBJ.config = ssrRequireCsvCfg("cfg_BeiMingShaoTa")
BeiMingShaoTaOBJ.cost = { {"叛军线索",1} }
BeiMingShaoTaOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function BeiMingShaoTaOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0, -30)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.BeiMingShaoTa_Request)
    end)
    self:UpdateUI()
end

function BeiMingShaoTaOBJ:UpdateUI()
    GUI:Text_setString(self.ui.Text_2,self.num.."/100")
    GUI:Text_setString(self.ui.Text_3,self.num.."/100")
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, self.num)
    delRedPoint(self.ui.Button_1)
    if self.num >= 100 then
        GUI:Image_loadTexture(self.ui.Image_2,"res/custom/JuQing/BeiMingShaoTa/finish.png")
    else
        Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function BeiMingShaoTaOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.num = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return BeiMingShaoTaOBJ