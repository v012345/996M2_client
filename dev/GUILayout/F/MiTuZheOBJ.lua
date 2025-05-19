MiTuZheOBJ = {}
MiTuZheOBJ.__cname = "MiTuZheOBJ"
MiTuZheOBJ.cost = {{"永恒的秘密", 1}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function MiTuZheOBJ:main(objcfg)
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

        --按钮点击
    GUI:addOnClickEvent(self.ui.Button_1,function()
        ssrMessage:sendmsg(ssrNetMsgCfg.MiTuZhe_Request)
    end)
end

function MiTuZheOBJ:UpdateUI()
    GUI:setVisible(self.ui.Image_1, false)
    GUI:setVisible(self.ui.Image_2, false)
    showCost(self.ui.itemlooks_1,self.cost,0,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,self.cost,30,10)

    if self.arg1 == 0 then
        GUI:setVisible(self.ui.Image_1, true)
    else
        GUI:setVisible(self.ui.Image_2, true)
    end
    
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function MiTuZheOBJ:SyncResponse(arg1, arg2, arg3, data)

    self.arg1 = arg1
    

    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return MiTuZheOBJ