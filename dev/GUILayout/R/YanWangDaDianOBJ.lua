YanWangDaDianOBJ = {}
YanWangDaDianOBJ.__cname = "YanWangDaDianOBJ"
--YanWangDaDianOBJ.config = ssrRequireCsvCfg("cfg_YanWangDaDian")
YanWangDaDianOBJ.cost = { { "元宝", 300000 }, { "幻灵水晶", 188 } }
YanWangDaDianOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YanWangDaDianOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, 0)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.YanWangDaDian_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.YanWangDaDian_Request2)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        if self.flag == 1 then
            sendmsg9("你已经开启过了!#249")
            return
        end
        SL:SetMetaValue("BATTLE_AFK_BEGIN")
        GUI:Win_Close(self._parent)
    end)
    self:UpdateUI()
end

function YanWangDaDianOBJ:UpdateUI()
    if self.flag == 1 then
        GUI:Image_loadTexture(self.ui.Image_1,"res/custom/JuQing/YanWangDaDian/yikaiqi.png")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function YanWangDaDianOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return YanWangDaDianOBJ