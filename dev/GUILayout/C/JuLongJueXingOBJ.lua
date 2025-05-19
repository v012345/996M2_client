JuLongJueXingOBJ = {}
JuLongJueXingOBJ.__cname = "JuLongJueXingOBJ"
JuLongJueXingOBJ.config = ssrRequireCsvCfg("cfg_JuLongJueXing")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JuLongJueXingOBJ:main(objcfg)

    local actorID = SL:GetMetaValue("MAIN_ACTOR_ID")                        --获取玩家对象
    local level = SL:GetMetaValue("ACTOR_LEVEL", actorID)
        if level < 150 then
            sendmsg9("提示#251|:#255|你的等级不足#250||150级#249|请达到等级后再来#250|...")
            return
        end

    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)

    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)

    GUI:addOnClickEvent(self.ui.ImageBG, function()
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

    GUI:addOnClickEvent(self.ui.Button_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JuLongJueXing_ButtonLink1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JuLongJueXing_ButtonLink2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JuLongJueXing_ButtonLink3)
    end)
     self:UpdateUI()
end

function JuLongJueXingOBJ:UpdateUI()
    local itemname = {"龙族雕石[未觉醒]","龙族雕石[一阶觉醒]","龙族雕石[二阶觉醒]","龙族雕石[三阶觉醒]","龙族雕石[四阶觉醒]","龙族雕石[五阶觉醒]"}
    local _itemname
    -- 修改左侧显示
    if self.data[3] == "龙族雕石[未觉醒]" then
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_1,  "res/custom/julongjuexing/js1.png")
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.levellooks_1,  "res/custom/julongjuexing/look_2_1.png")
        GUI:setVisible(JuLongJueXingOBJ.ui.shuxing_1, false)
        GUI:setVisible(JuLongJueXingOBJ.ui.gongji_1, false)
        GUI:setVisible(JuLongJueXingOBJ.ui.jianmian_1, false)
        GUI:setVisible(JuLongJueXingOBJ.ui.daren_1, false)
        GUI:setVisible(JuLongJueXingOBJ.ui.qiege_1, false)
        GUI:setVisible(JuLongJueXingOBJ.ui.shengming_1, false)
    elseif self.data[3] == "龙族雕石[一阶觉醒]" then
        local cfg = self.config[self.data[3]]
        GUI:setVisible(JuLongJueXingOBJ.ui.shuxing_1, true)
        GUI:setVisible(JuLongJueXingOBJ.ui.gongji_1, true)
        GUI:setVisible(JuLongJueXingOBJ.ui.jianmian_1, true)
        GUI:setVisible(JuLongJueXingOBJ.ui.daren_1, true)
        GUI:setVisible(JuLongJueXingOBJ.ui.qiege_1, true)
        GUI:setVisible(JuLongJueXingOBJ.ui.shengming_1, true)
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_1,  "res/custom/julongjuexing/js2.png")
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.levellooks_1,  "res/custom/julongjuexing/look_2_"..cfg.index..".png")
        GUI:Text_setString(JuLongJueXingOBJ.ui.shuxing_1, "+"..cfg.att[1].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.gongji_1, "+"..cfg.att[2].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.jianmian_1, "+"..cfg.att[3].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.daren_1, "+"..cfg.att[4].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.qiege_1, "+"..cfg.att[5])
        GUI:Text_setString(JuLongJueXingOBJ.ui.shengming_1, "+"..cfg.att[6])
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_costYB_1,  "res/custom/julongjuexing/"..cfg.img or "")
    else
        local cfg = self.config[self.data[3]]
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_1,  "res/custom/julongjuexing/js2.png")
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.levellooks_1,  "res/custom/julongjuexing/look_2_"..cfg.index..".png")
        GUI:Text_setString(JuLongJueXingOBJ.ui.shuxing_1, "+"..cfg.att[1].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.gongji_1, "+"..cfg.att[2].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.jianmian_1, "+"..cfg.att[3].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.daren_1, "+"..cfg.att[4].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.qiege_1, "+"..cfg.att[5])
        GUI:Text_setString(JuLongJueXingOBJ.ui.shengming_1, "+"..cfg.att[6])
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_costYB_1,  "res/custom/julongjuexing/"..cfg.img or "")
    end
        --获取下一阶装备名字
    if self.data[3] ~= "龙族雕石[五阶觉醒]" then
        for i = 1, #itemname do
            if itemname[i] == self.data[3] then
                _itemname = itemname[i+1]
                local cfg = self.config[_itemname]
                GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_2,  "res/custom/julongjuexing/js2.png")
                GUI:Image_loadTexture(JuLongJueXingOBJ.ui.levellooks_2,  "res/custom/julongjuexing/look_2_"..cfg.index..".png")
                GUI:Text_setString(JuLongJueXingOBJ.ui.shuxing_2, "+"..cfg.att[1].."%")
                GUI:Text_setString(JuLongJueXingOBJ.ui.gongji_2, "+"..cfg.att[2].."%")
                GUI:Text_setString(JuLongJueXingOBJ.ui.jianmian_2, "+"..cfg.att[3].."%")
                GUI:Text_setString(JuLongJueXingOBJ.ui.daren_2, "+"..cfg.att[4].."%")
                GUI:Text_setString(JuLongJueXingOBJ.ui.qiege_2, "+"..cfg.att[5])
                GUI:Text_setString(JuLongJueXingOBJ.ui.shengming_2, "+"..cfg.att[6])
                GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_costYB_2,  "res/custom/julongjuexing/"..cfg.img or "")
                break
            end
        end
    end
    if self.data[3] == "龙族雕石[五阶觉醒]" then
        local cfg = self.config[self.data[3]]
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_2,  "res/custom/julongjuexing/js2.png")
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.levellooks_2,  "res/custom/julongjuexing/look_2_"..cfg.index..".png")
        GUI:Text_setString(JuLongJueXingOBJ.ui.shuxing_2, "+"..cfg.att[1].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.gongji_2, "+"..cfg.att[2].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.jianmian_2, "+"..cfg.att[3].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.daren_2, "+"..cfg.att[4].."%")
        GUI:Text_setString(JuLongJueXingOBJ.ui.qiege_2, "+"..cfg.att[5])
        GUI:Text_setString(JuLongJueXingOBJ.ui.shengming_2, "+"..cfg.att[6])
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Image_costYB_2,  "res/custom/julongjuexing/"..cfg.img or "")
    end
    -- 修改进度条
    GUI:Text_setString(JuLongJueXingOBJ.ui.levelexp, self.data[1].."/"..self.data[2])
    local val = self.data[1] / self.data[2] * 100
    GUI:LoadingBar_setPercent(JuLongJueXingOBJ.ui.expimg, val)


    GUI:setVisible(JuLongJueXingOBJ.ui.Button_1,false)
    GUI:setVisible(JuLongJueXingOBJ.ui.Button_2,false)
    GUI:setVisible(JuLongJueXingOBJ.ui.Button_3,false)

    --修改显示按钮
    if self.data[1] >= 9999999 or self.data[2] >= 9999999 then
        GUI:setVisible(JuLongJueXingOBJ.ui.Button_1,true)
        GUI:setVisible(JuLongJueXingOBJ.ui.Button_2,true)
    elseif self.data[1] >= self.data[2] then
        local cfg = self.config[self.data[3]]
        GUI:setVisible(JuLongJueXingOBJ.ui.Button_3,true)
        GUI:Image_loadTexture(JuLongJueXingOBJ.ui.Button_Ima_3,  "res/custom/julongjuexing/xh_2_"..cfg.index..".png")
    else
        GUI:setVisible(JuLongJueXingOBJ.ui.Button_1,true)
        GUI:setVisible(JuLongJueXingOBJ.ui.Button_2,true)
    end

end

function JuLongJueXingOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    --SL:dump(data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

return JuLongJueXingOBJ