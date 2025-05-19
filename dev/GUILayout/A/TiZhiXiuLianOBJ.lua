
TiZhiXiuLianOBJ = {}

TiZhiXiuLianOBJ.__cname = "TiZhiXiuLianOBJ"
TiZhiXiuLianOBJ.itemlooks1 = {{"焚天石", 5}}
TiZhiXiuLianOBJ.itemlooks2 = {{"天工之锤", 5}}
TiZhiXiuLianOBJ.itemlooks3 = {{"金币", 50000}}
TiZhiXiuLianOBJ.config = ssrRequireCsvCfg("cfg_TiZhiXiuLian")
TiZhiXiuLianOBJ.allCost = {{"元宝", 1000000}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TiZhiXiuLianOBJ:main(objcfg)
    if self:checkIsMax() then
        sendmsg9("体质修炼已经全满了！#249")
        return
    end
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


    GUI:addOnClickEvent(self.ui.Button1, function () 
        ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_Request, 1)
    end)

    GUI:addOnClickEvent(self.ui.Button2, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_Request, 2)
    end)

    GUI:addOnClickEvent(self.ui.Button3, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_Request, 3)
    end)

    GUI:addOnClickEvent(self.ui.Button4, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_Request, 4)
    end)

    GUI:addOnClickEvent(self.ui.Button5, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_Request, 5)
    end)

    GUI:addOnClickEvent(self.ui.Button10, function ()
        local data = {}
        data.str = "确认花费[100W元宝]一键点满？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.TiZhiXiuLian_ButtonLink1)
            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    
    ssrAddItemListX(self.ui.Layout1_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout1_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout1_3, self.itemlooks3,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout2_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout2_3, self.itemlooks3,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout3_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout3_3, self.itemlooks3,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout4_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout4_3, self.itemlooks3,"金币",{imgRes = ""})

    ssrAddItemListX(self.ui.Layout5_1, self.itemlooks1,"焚天石",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5_2, self.itemlooks2,"天工之锤",{imgRes = ""})
    ssrAddItemListX(self.ui.Layout5_3, self.itemlooks3,"金币",{imgRes = ""})
    
    self:UpdateUI()
end

function TiZhiXiuLianOBJ:checkIsMax()
    local result = true
    for i, v in ipairs(self.data) do
        if v < 10 then
            result = false
            break
        end
    end
    return result
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--更新数据
function TiZhiXiuLianOBJ:UpdateUI()
    -- 修改显示小神魔 等级
    local helpStr1 = {
        self.data[1].."#250|/|10#70"
    }
    createMultiLineRichText(self.ui.Node1, "Node1",0,0,helpStr1,nil,600,20)

    local helpStr2 = {
        self.data[2].."#250|/|10#70"
    }
    createMultiLineRichText(self.ui.Node2, "Node2",0,0,helpStr2,nil,600,20)

    local helpStr3 = {
        self.data[3].."#250|/|10#70"
    }
    createMultiLineRichText(self.ui.Node3, "Node3",0,0,helpStr3,nil,600,20)

    local helpStr4 = {
        self.data[4].."#250|/|10#70"
    }
    createMultiLineRichText(self.ui.Node4, "Node4",0,0,helpStr4,nil,600,20)

    local helpStr5 = {
        self.data[5].."#250|/|10#70"
    }
    createMultiLineRichText(self.ui.Node5, "Node5",0,0,helpStr5,nil,600,20)
    self:addRedPoint()
end

--添加红点
function TiZhiXiuLianOBJ:addRedPoint(widgetName)
    for i, v in ipairs(self.config) do
        local widget = self.ui["Button"..i]
        if widget then
            delRedPoint(widget)
            if self.data[i] < 10 then
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
function TiZhiXiuLianOBJ:checkAllFull()
    for i, v in ipairs(self.data) do
        if v < 10 then
            return false
        end
    end
    return true
end

--登录同步消息
function TiZhiXiuLianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TiZhiXiuLianOBJ
