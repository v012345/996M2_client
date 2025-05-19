
JiuXianLiBaiOBJ = {}

JiuXianLiBaiOBJ.__cname = "JiuXianLiBaiOBJ"


JiuXianLiBaiOBJ.itemlooks1 = {{"女儿红", 1}}
JiuXianLiBaiOBJ.itemlooks2 = {{"竹叶青", 1}}
JiuXianLiBaiOBJ.itemlooks3 = {{"寒潭香", 1}}
JiuXianLiBaiOBJ.itemlooks4 = {{"金茎露", 1}}
JiuXianLiBaiOBJ.itemlooks5 = {{"秋露白", 1}}
JiuXianLiBaiOBJ.cost1 = {{"我不是酒神[称号]",0}}
JiuXianLiBaiOBJ.MaxNum = {750,750,550,200,200}
JiuXianLiBaiOBJ.costList = {}
table.insert(JiuXianLiBaiOBJ.costList, JiuXianLiBaiOBJ.itemlooks1)
table.insert(JiuXianLiBaiOBJ.costList, JiuXianLiBaiOBJ.itemlooks2)
table.insert(JiuXianLiBaiOBJ.costList, JiuXianLiBaiOBJ.itemlooks3)
table.insert(JiuXianLiBaiOBJ.costList, JiuXianLiBaiOBJ.itemlooks4)
table.insert(JiuXianLiBaiOBJ.costList, JiuXianLiBaiOBJ.itemlooks5)
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiuXianLiBaiOBJ:main(objcfg)
    self.imgBGlist = {}
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
    GUI:Timeline_Window1(self._parent)

    GUI:addOnClickEvent(self.ui.Button_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink1, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink1, 2)
    end)

    GUI:addOnClickEvent(self.ui.Button_3, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink1, 3)
    end)

    GUI:addOnClickEvent(self.ui.Button_4, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink1, 4)
    end)

    GUI:addOnClickEvent(self.ui.Button_5, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink1, 5)
    end)


    GUI:addOnClickEvent(self.ui.Button_lingqu, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiuXianLiBai_ButtonLink2)
    end)

    --挂载 item 显示
    ssrAddItemListX(self.ui.Layout1, self.itemlooks1,"女儿红",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2, self.itemlooks2,"竹叶青",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3, self.itemlooks3,"寒潭香",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4, self.itemlooks4,"金茎露",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5, self.itemlooks5,"秋露白",{imgRes = ""})

    table.insert(self.imgBGlist,self.ui.ImageView1)
    table.insert(self.imgBGlist,self.ui.ImageView2)
    table.insert(self.imgBGlist,self.ui.ImageView3)
    table.insert(self.imgBGlist,self.ui.ImageView4)
    table.insert(self.imgBGlist,self.ui.ImageView5)
    --执行动画函数
    self:PlayOnce()
    --挂载 文字格式 消耗显示 
    showCostFont(self.ui.titlelooks, self.cost1,{fontSize=16,fontColor="#44DDFF"})
    --刷新界面UI
    self:UpdateUI()
end
--更新数据
--判断是否满足领取我不是酒神的称号
function JiuXianLiBaiOBJ:isTitle()
    local count = 0
    for i, v in ipairs(self.data) do
        if v == self.MaxNum[i] then
            count = count + 1
        end
    end
    if count >= 5 then
        return true
    else
        return false
    end
end
--添加红点
function JiuXianLiBaiOBJ:AddRedDot()
    for i, v in ipairs(self.costList) do
        delRedPoint(self.ui["Button_"..i])
        if self.data[i] < self.MaxNum[i] then
            Player:checkAddRedPoint(self.ui["Button_"..i], v)
        end
    end
    local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "我不是酒神")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", idx)
    delRedPoint(self.ui.Button_lingqu)
    if not titleData then
        if self:isTitle() then
            addRedPoint(self.ui.Button_lingqu)
        end
    end
end
--播放一次动画
function JiuXianLiBaiOBJ:PlayOnce()
    for i, v in ipairs(self.imgBGlist) do
        local pos = GUI:getPosition(v)
        SL:scheduleOnce(self.ui.ListView, function ()
            GUI:runAction(v, GUI:ActionMoveTo(0.2, pos.x, pos.y-300))
        end , (i-1)*0.03)
    end
end

function JiuXianLiBaiOBJ:UpdateUI()

    local helpStr1 = {
        self.data[1].."#250|/|750#70"
    }
    createMultiLineRichText(self.ui.Node1, "Node1",0,0,helpStr1,nil,600,15)

    local helpStr2 = {
        self.data[2].."#250|/|750#70"
    }
    createMultiLineRichText(self.ui.Node2, "Node2",0,0,helpStr2,nil,600,15)

    local helpStr3 = {
        self.data[3].."#250|/|550#70"
    }
    createMultiLineRichText(self.ui.Node3, "Node3",0,0,helpStr3,nil,600,15)

    local helpStr4 = {
        self.data[4].."#250|/|200#70"
    }
    createMultiLineRichText(self.ui.Node4, "Node4",0,0,helpStr4,nil,600,15)

    local helpStr5 = {
        self.data[5].."#250|/|200#70"
    }
    createMultiLineRichText(self.ui.Node5, "Node5",0,0,helpStr5,nil,600,15)
    self:AddRedDot()
--     GUI:Text_setString(self.ui.numlooks1,self.data[1].."|50")
--     GUI:Text_setString(self.ui.numlooks2,self.data[2].."|50")
--     GUI:Text_setString(self.ui.numlooks3,self.data[3].."|50")
--     GUI:Text_setString(self.ui.numlooks4,self.data[4].."|50")
--     GUI:Text_setString(self.ui.numlooks5,self.data[5].."|50")

--     GUI:Text_setString(self.ui.attlooks_1,(self.data[1]*150))
--     GUI:Text_setString(self.ui.attlooks_2,(self.data[2]*100))
--     GUI:Text_setString(self.ui.attlooks_3,(self.data[3]*88))
--     GUI:Text_setString(self.ui.attlooks_4,(self.data[4]*100))
--     GUI:Text_setString(self.ui.attlooks_5,(self.data[5]*2).."%")

-- --     -- 获取背包内材料数量
--     GUI:Text_setString(self.ui.Itemnum_1,SL:GetMetaValue("ITEM_COUNT", "女儿红"))
--     GUI:Text_setString(self.ui.Itemnum_2,SL:GetMetaValue("ITEM_COUNT", "竹叶青"))
--     GUI:Text_setString(self.ui.Itemnum_3,SL:GetMetaValue("ITEM_COUNT", "寒潭香"))
--     GUI:Text_setString(self.ui.Itemnum_4,SL:GetMetaValue("ITEM_COUNT", "寒潭香"))
--     GUI:Text_setString(self.ui.Itemnum_5,SL:GetMetaValue("ITEM_COUNT", "秋露白"))

end
-- -------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function JiuXianLiBaiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiuXianLiBaiOBJ
