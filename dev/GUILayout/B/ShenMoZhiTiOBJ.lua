ShenMoZhiTiOBJ = {}

ShenMoZhiTiOBJ.__cname = "ShenMoZhiTiOBJ"
ShenMoZhiTiOBJ.itemlooks1 = {{"焚天石", 35}}
ShenMoZhiTiOBJ.itemlooks2 = {{"天工之锤", 35}}
ShenMoZhiTiOBJ.itemlooks3 = {{"幻灵水晶", 10}}
ShenMoZhiTiOBJ.itemlooks4 = {{"金币", 1000000}}
ShenMoZhiTiOBJ.config = ssrRequireCsvCfg("cfg_ShenMoZhiTi")
ShenMoZhiTiOBJ.allCost = {{"灵符", 2888}}

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenMoZhiTiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)

    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-30)
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

    self.data = TiZhiXiuLianOBJ.data

    GUI:addOnClickEvent(self.ui.Button1, function () 
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_Request, 1)
    end)
    
    GUI:addOnClickEvent(self.ui.Button2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_Request, 2)
    end)

    GUI:addOnClickEvent(self.ui.Button3, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_Request, 3)
    end)

    GUI:addOnClickEvent(self.ui.Button4, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_Request, 4)
    end)

    GUI:addOnClickEvent(self.ui.Button5, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_Request, 5)
    end)

     GUI:addOnClickEvent(self.ui.Button10, function ()
        local data = {}
        data.str = "确认花费[2888灵符]一键点满？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.ShenMoZhiTi_ButtonLink1)
            end
        end
        SL:OpenCommonTipsPop(data)
     end)

    ssrAddItemListX(self.ui.Layout1_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout1_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout1_3, self.itemlooks3,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout1_4, self.itemlooks4,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout2_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2_3, self.itemlooks3,"金币",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2_4, self.itemlooks4,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout3_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3_3, self.itemlooks3,"金币",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3_4, self.itemlooks4,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout4_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4_3, self.itemlooks3,"金币",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4_4, self.itemlooks4,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout5_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5_3, self.itemlooks3,"金币",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5_4, self.itemlooks4,"金币",{imgRes = ""})
    self:UpdateUI()
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--更新数据
function ShenMoZhiTiOBJ:UpdateUI()
    -- 修改显示小神魔 等级
    local helpStr1 = {
        self.data[1].."#250|/|20#70"
    }
    createMultiLineRichText(self.ui.Node1, "Node1",0,0,helpStr1,nil,600,20)

    local helpStr2 = {
        self.data[2].."#250|/|20#70"
    }
    createMultiLineRichText(self.ui.Node2, "Node2",0,0,helpStr2,nil,600,20)

    local helpStr3 = {
        self.data[3].."#250|/|20#70"
    }
    createMultiLineRichText(self.ui.Node3, "Node3",0,0,helpStr3,nil,600,20)

    local helpStr4 = {
        self.data[4].."#250|/|20#70"
    }
    createMultiLineRichText(self.ui.Node4, "Node4",0,0,helpStr4,nil,600,20)

    local helpStr5 = {
        self.data[5].."#250|/|20#70"
    }
    createMultiLineRichText(self.ui.Node5, "Node5",0,0,helpStr5,nil,600,20)

    GUI:Text_setString(self.ui.Text_curCount,self.currCount)
    self:addRedPoint()
end


--添加红点
function ShenMoZhiTiOBJ:addRedPoint(widgetName)
    for i, v in ipairs(self.config) do
        local widget = self.ui["Button"..i]
        if widget then
            delRedPoint(widget)
            if self.data[i] < 20 and self.data[i] > 9 then
                Player:checkAddRedPoint(widget, v.cost)
            end
        end
    end
    delRedPoint(self.ui.Button10)
    if not self:checkAllFull() then
        Player:checkAddRedPoint(self.ui.Button10, self.allCost)
    end
end
--验证是否全满
function ShenMoZhiTiOBJ:checkAllFull()
    for i, v in ipairs(self.data) do
        if v < 10 then
            return true
        end

        if v < 20 then
            return false
        end
    end
    return true
end

--登录同步消息
function ShenMoZhiTiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.currCount = arg1
    TiZhiXiuLianOBJ.data = data
    self.data = TiZhiXiuLianOBJ.data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenMoZhiTiOBJ
