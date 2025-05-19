ShengMingShenZhuOBJ = {}
ShengMingShenZhuOBJ.__cname = "ShengMingShenZhuOBJ"
--ShengMingShenZhuOBJ.config = ssrRequireCsvCfg("cfg_ShengMingShenZhu")
ShengMingShenZhuOBJ.cost = {{}}
ShengMingShenZhuOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShengMingShenZhuOBJ:main(objcfg,data)
    self.objcfg = objcfg
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    if not data then
        self.arg1 = nil
    end
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例
    local npcid = 0
    if self.arg1 == 1 then
        npcid = 2509
    elseif self.arg1 == 2 then
        npcid = 2510
    else
        npcid = objcfg.NPCID
    end
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShengMingShenZhu_Request, npcid)
    end)
    ssrMessage:sendmsg(ssrNetMsgCfg.ShengMingShenZhu_SyncResponse)
end

function ShengMingShenZhuOBJ:UpdateUI()
    local npcid = ""
    if self.arg1 == 1 then
        npcid = tostring(2509)
    elseif self.arg1 == 2 then
        npcid = tostring(2510)
    else
        npcid = tostring(self.objcfg.NPCID)
    end
    local currhp = self.data[npcid]
    local jindu = calculatePercentage(currhp, 3000000)
    GUI:LoadingBar_setPercent(self.ui.LoadingBar_1, jindu)
    GUI:Text_setString(self.ui.Text_1,string.format("%d/%d",currhp,3000000))
end

function ShengMingShenZhuOBJ:OpenUI(arg1)
    self.arg1 = arg1
    ssrUIManager:OPEN(ssrObjCfg.ShengMingShenZhu,1)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShengMingShenZhuOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShengMingShenZhuOBJ