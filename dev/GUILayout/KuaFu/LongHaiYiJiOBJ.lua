LongHaiYiJiOBJ = {}
LongHaiYiJiOBJ.__cname = "LongHaiYiJiOBJ"
--LongHaiYiJiOBJ.config = ssrRequireCsvCfg("cfg_LongHaiYiJi")
LongHaiYiJiOBJ.cost = {{}}
LongHaiYiJiOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function LongHaiYiJiOBJ:main(objcfg)
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
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    ssrMessage:sendmsg(ssrNetMsgCfg.LongHaiYiJi_Sync)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.LongHaiYiJi_Request)
    end)
end

function LongHaiYiJiOBJ:UpdateUI()

end

function LongHaiYiJiOBJ:Sync(arg1,arg2,arg3,data)
    local objList = GUI:getChildren(self.ui.Node_1)
    local isKill1 = data[1]
    local isKill2 = data[2]
    local isKill3 = data[3]
    for i, v in ipairs(objList) do
        local state = data[i]
        local resPath = state == 1 and "res/custom/LongHaiYiJi/cunhuo.png" or "res/custom/LongHaiYiJi/yijisha.png"
        GUI:Image_loadTexture(v,resPath)
    end
    if isKill1 == 1 or isKill2 == 1 or isKill3 == 1 then
        GUI:Image_loadTexture(self.ui.Image_4,"res/custom/LongHaiYiJi/off.png")
    else
        GUI:Image_loadTexture(self.ui.Image_4,"res/custom/LongHaiYiJi/on.png")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function LongHaiYiJiOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return LongHaiYiJiOBJ