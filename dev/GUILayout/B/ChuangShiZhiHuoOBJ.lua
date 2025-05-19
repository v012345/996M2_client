
ChuangShiZhiHuoOBJ = {}

ChuangShiZhiHuoOBJ.__cname = "ChuangShiZhiHuoOBJ"



-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ChuangShiZhiHuoOBJ:main(objcfg)
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

    
    
    -- GUI:addOnClickEvent(self.ui.EquipShow_01, function ()
    --     ssrMessage:sendmsg(ssrNetMsgCfg.ChuangShiZhiHuo_ButtonLink1, 1)
    -- end)


    GUI:addOnClickEvent(self.ui.Layout_1, function ()
        ssrMessage:sendmsg(ssrNetMsgCfg.ChuangShiZhiHuo_ButtonLink1, 1)
    end)

    


-- ChuangShiZhiHuo_SyncResponse
-- ChuangShiZhiHuo_Update
-- ChuangShiZhiHuo_ButtonLink1
-- ChuangShiZhiHuo_ButtonLink2


    -- self:UpdateUI()
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--更新数据
function ChuangShiZhiHuoOBJ:UpdateUI()
    -- 修改显示小神魔 等级
    GUI:Text_setString(self.ui.lvevllook1,self.data[1])
    GUI:Text_setString(self.ui.lvevllook2,self.data[2])
    GUI:Text_setString(self.ui.lvevllook3,self.data[3])
    GUI:Text_setString(self.ui.lvevllook4,self.data[4])
    GUI:Text_setString(self.ui.lvevllook5,self.data[5])

    -- 获取背包内材料数量
    GUI:Text_setString(self.ui.looks1,SL:GetMetaValue("ITEM_COUNT", "焚天石"))
    GUI:Text_setString(self.ui.looks2,SL:GetMetaValue("ITEM_COUNT", "天工之锤"))
    GUI:Text_setString(self.ui.looks3,SL:GetMetaValue("ITEM_COUNT", "幻灵水晶"))
    GUI:Text_setString(self.ui.looks4,SL:GetMetaValue("MONEY", 1))
    GUI:Text_setString(self.ui.looks5,self.data[6])
end

--登录同步消息
function ChuangShiZhiHuoOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ChuangShiZhiHuoOBJ
