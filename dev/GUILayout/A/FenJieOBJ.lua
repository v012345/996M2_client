FenJieOBJ = {}
FenJieOBJ.__cname = "FenJieOBJ"
FenJieOBJ.config = ssrRequireCsvCfg("cfg_FenJie")
function FenJieOBJ:main(objcfg)
    self.status = false
    local data = {}
    data.str = "[系统提示]：\n\n    请将贵重物品存入仓库内，请问是否需要分解装备！"
    data.btnType = 2
    data.showEdit = false
    data.callback = function(atype)
        if atype == 1 then
           self:OpenUI(objcfg)
        end
    end
    SL:OpenCommonTipsPop(data)
end

function FenJieOBJ:OpenUI(objcfg)
    local parent = GUI:Win_Create(FenJieOBJ.__cname, 0, 0, 0, false, false, false, true, true)
    self._parent = parent
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2)
    -- GUI:Timeline_Window1(self.ui.ImageBG)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)

    --下划线
    GUI:Text_enableUnderline(self.ui.TextStop1)
    GUI:Text_enableUnderline(self.ui.TextStop2)

    --中止分解
    GUI:addOnClickEvent(self.ui.TextStop1, function()
        self:StartAndStopFenJie()
    end)
    GUI:addOnClickEvent(self.ui.TextStop2, function()
        self:StartAndStopFenJie()
    end)
    --进度
    self.schedule = 0
    self:StartProgress()

end

--开始分解-进度 
function FenJieOBJ:StartProgress()
    if self.schedule >= 100 then
        self.schedule = 0
    end
    SL:scheduleOnce(self.ui.NodeJinDu, function ()
        self.schedule = self.schedule + 1
        GUI:LoadingBar_setPercent(self.ui.LoadingBar, self.schedule)
        GUI:Text_setString(self.ui.TextJindu, self.schedule .. "%")
        if self.schedule < 100 then
            self:StartProgress()
        else
            self:StartFenJie()
            self:StartAndStopFenJie()
        end
    end, 0.03)
end

--开始请求分解
function FenJieOBJ:StartFenJie()
    local bagData = SL:GetMetaValue("BAG_DATA")
    local hasIdx = {}
    local FenJieItems = {}
    for key, value in pairs(bagData) do
        if self.config[value.Index] then
            if not hasIdx[value.Index] then
                hasIdx[value.Index] = true
                table.insert(FenJieItems, value.Index)
            end
        end
    end
    if #FenJieItems == 0 then
        local data = {}
        data.btnType = 1
        data.str = "[系统提示]：\n\n    你背包内没有可以分解的装备！"
        SL:OpenCommonTipsPop(data)
        return
    end
    ssrMessage:sendmsg(ssrNetMsgCfg.FenJie_Request,0,0,0,FenJieItems)
end
--停止分解
function FenJieOBJ:StopFenJie()
    GUI:stopAllActions(self.ui.NodeJinDu)
end

--继续和终止
function FenJieOBJ:StartAndStopFenJie()
    if self.status then
        GUI:Text_setString(self.ui.TextStop1,"【我要终止分解装备】")
        GUI:Text_setString(self.ui.TextStop2,"【我要终止分解装备】")
        self:StartProgress()
    else
        GUI:Text_setString(self.ui.TextStop1,"【我要继续分解装备】")
        GUI:Text_setString(self.ui.TextStop2,"【我要继续分解装备】")
        self:StopFenJie()
    end
    self.status = not self.status
end

return FenJieOBJ