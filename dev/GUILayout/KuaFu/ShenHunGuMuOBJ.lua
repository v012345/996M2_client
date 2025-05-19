ShenHunGuMuOBJ = {}
ShenHunGuMuOBJ.__cname = "ShenHunGuMuOBJ"
--ShenHunGuMuOBJ.config = ssrRequireCsvCfg("cfg_ShenHunGuMu")
ShenHunGuMuOBJ.cost = {{}}
ShenHunGuMuOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenHunGuMuOBJ:main(objcfg)
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
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunGuMu_Request)
    end)
    self:UpdateUI()
end

function ShenHunGuMuOBJ:UpdateUI()
    local id = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "狂暴之力")
    local titleData = SL:GetMetaValue("TITLE_DATA_BY_ID", id)
    if titleData then
        GUI:Image_loadTexture(self.ui.Image_1,"res/custom/ShenHunGuMu/2.png")
    end
    local power = tonumber(Player:getServerVar("B2"))
    if power > 50000000 then
        GUI:Image_loadTexture(self.ui.Image_2,"res/custom/ShenHunGuMu/2.png")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShenHunGuMuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenHunGuMuOBJ