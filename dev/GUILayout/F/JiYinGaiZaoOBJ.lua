JiYinGaiZaoOBJ = {}
JiYinGaiZaoOBJ.__cname = "JiYinGaiZaoOBJ"
JiYinGaiZaoOBJ.config = ssrRequireCsvCfg("cfg_JiYinGaiZao")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function JiYinGaiZaoOBJ:main(objcfg)
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

    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiYinGaiZao_Request,1)
    end)

    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.JiYinGaiZao_Request,2)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)

    self:UpdateUI()
end

function JiYinGaiZaoOBJ:UpdateUI()
    GUI:Text_setString(self.ui.LevelLoos,"Lv.".. self.data.level)

    if self.data.site1 ~= "暂无" then
        local cfg = self.config[self.data.site1]
        GUI:Text_setString(self.ui.AttrShowLooks1,50*self.data.level..cfg.LooksShow1.."转化为"..50*self.data.level..cfg.LooksShow2)
    end

    if self.data.site2 ~= "暂无" then
        local cfg = self.config[self.data.site2]
        GUI:Text_setString(self.ui.AttrShowLooks2,50*self.data.level..cfg.LooksShow1.."转化为"..50*self.data.level..cfg.LooksShow2)
    end

    if self.data.site3 ~= "暂无" then
        local cfg = self.config[self.data.site3]
        GUI:Text_setString(self.ui.AttrShowLooks3,2000*self.data.level..cfg.LooksShow1.."转化为"..2000*self.data.level..cfg.LooksShow2)
    end

    if self.data.site4 ~= "暂无" then
        local cfg = self.config[self.data.site4]
        GUI:Text_setString(self.ui.AttrShowLooks4,cfg.LooksShow1)
    else
        GUI:Text_setString(self.ui.AttrShowLooks4,"基因等级5级解锁")
    end

    if self.data.site5 ~= "暂无" then
        local cfg = self.config[self.data.site5]
        GUI:Text_setString(self.ui.AttrShowLooks5,cfg.LooksShow1)
    else
        GUI:Text_setString(self.ui.AttrShowLooks5,"基因等级10级解锁")
    end

    if self.data.site6 ~= "暂无" then
        local cfg = self.config[self.data.site6]
        GUI:Text_setString(self.ui.AttrShowLooks6,cfg.LooksShow1)
    else
        GUI:Text_setString(self.ui.AttrShowLooks6,"基因等级15级解锁")
    end

    if self.data.site7 ~= "暂无" then
        local cfg = self.config[self.data.site7]
        GUI:Text_setString(self.ui.AttrShowLooks7,cfg.LooksShow1)
    else
        GUI:Text_setString(self.ui.AttrShowLooks7,"基因等级20级解锁")
    end

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function JiYinGaiZaoOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return JiYinGaiZaoOBJ