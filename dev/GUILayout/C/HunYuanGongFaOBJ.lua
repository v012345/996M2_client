HunYuanGongFaOBJ = {}
HunYuanGongFaOBJ.__cname = "HunYuanGongFaOBJ"
HunYuanGongFaOBJ.effectdata = {11500,11501,11502,11503,11506,11507}

HunYuanGongFaOBJ.config = ssrRequireCsvCfg("cfg_HunYuanGongFa")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HunYuanGongFaOBJ:main(objcfg)
    self.p_num = 1
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

    GUI:addOnClickEvent(self.ui.Button_1, function () 
        ssrMessage:sendmsg(ssrNetMsgCfg.HunYuanGongFa_Request, self.p_num)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()  --上一页翻页
        if self.p_num > 1 then
            self.p_num = self.p_num - 1
            local ext = {
                count = 20,
                speed = 20,
                loop  =  1,   --播放次数
                finishhide = 1
            }
            GUI:removeAllChildren(self.ui.Frames)
            GUI:Frames_Create(self.ui.Frames, "Frames_1", -203, -380, "res/custom/hunyuangongfa/frame/sy_", ".png", 1, 20, ext)
        else
            sendmsg9(string.format("[提示]:#251|当前已经是#250|第一页#249|了...#250"))
            return
        end 
    self:UpdateUI()
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function ()  --下一页翻页
        if self.p_num < 6 then
            self.p_num = self.p_num + 1
            local ext = {
                count = 20,
                speed = 20,
                loop  =  1,   --播放次数
                finishhide = 1
            }
            GUI:removeAllChildren(self.ui.Frames)
            GUI:Frames_Create(self.ui.Frames, "Frames_1", -203, -380, "res/custom/hunyuangongfa/frame/xy_", ".png", 1, 20, ext)
            GUI:Timeline_FadeOut(self.ui.Frames, 3,self.ui.Button_3)
        else
            sendmsg9(string.format("[提示]:#251|当前已经是#250|最后一页#249|了...#250"))
            return
        end

    self:UpdateUI()
    end)

    self:UpdateUI()
    ssrMessage:sendmsg(ssrNetMsgCfg.HunYuanGongFa_Open)
end
function HunYuanGongFaOBJ:UpdateUI()
    local index = self.p_num*10
    local cfg = self.config[index]
    local checklevel = self.data[1] - index + 10
    local attackAddition,hpAddition = 0
    if self.zsjxFlag == 0 then
        attackAddition = 80
        hpAddition = 1600
    else
        attackAddition = 90
        hpAddition = 1700
    end
    GUI:removeAllChildren(self.ui.infolokks)
	GUI:Image_Create(self.ui.infolokks, "ImageView1", -30.00, -80.00, "res/custom/hunyuangongfa/tips1_"..self.p_num..".png")
    GUI:Effect_Create(self.ui.infolokks, "Effect", -36.00, 90.00, 3,self.effectdata[self.p_num] , 0, 0, 0, 1)
	GUI:Image_Create(self.ui.infolokks, "ImageView2", 280.00, -330.00, "res/custom/hunyuangongfa/tips2_"..self.p_num..".png")
    GUI:Text_setString(self.ui.dclooks,self.data[1]*attackAddition)
    GUI:Text_setString(self.ui.hplooks,self.data[1]*hpAddition)
    GUI:Text_setString(self.ui.magicname,cfg.skillName)

    showCostFont(self.ui.itemlooks, cfg.cost,{dir=0,spacing=7,fontSize=14,fontColor="#FFFFFF"})  --挂载消耗显示
    Player:checkAddRedPoint(self.ui.Button_1, cfg.cost)

    if checklevel > 0  then
        GUI:Text_setString(self.ui.levellooks,checklevel.."/10" )
    else
        GUI:Text_setString(self.ui.levellooks,"0/10" )
    end

    if self.data[1] >= index then
        GUI:setVisible(self.ui.Button_1,false)
        GUI:setVisible(self.ui.zhuangtailooks,true)
        GUI:Text_setString(self.ui.levellooks,"10/10" )
    else
        GUI:setVisible(self.ui.Button_1,true)
        GUI:setVisible(self.ui.zhuangtailooks,false)
    end

end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HunYuanGongFaOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    self.zsjxFlag = arg1
    -- SL:dump(self.data[1])
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HunYuanGongFaOBJ