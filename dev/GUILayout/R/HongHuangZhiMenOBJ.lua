HongHuangZhiMenOBJ = {}
HongHuangZhiMenOBJ.__cname = "HongHuangZhiMenOBJ"
--HongHuangZhiMenOBJ.config = ssrRequireCsvCfg("cfg_HongHuangZhiMen")
HongHuangZhiMenOBJ.cost = { { "异界神石", 88 } }
HongHuangZhiMenOBJ.give = { {} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HongHuangZhiMenOBJ:main(objcfg)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiMen_Request1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.HongHuangZhiMen_Request2)
    end)
    self:UpdateUI()
end

function HongHuangZhiMenOBJ:UpdateUI()
    local idx1 = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "神魔·完美")
    local titleData1 = SL:GetMetaValue("TITLE_DATA_BY_ID", idx1)
    local idx2 = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "洪荒之力")
    local titleData2 = SL:GetMetaValue("TITLE_DATA_BY_ID", idx2)
    delRedPoint(self.ui.Button_1)
    if self.flag == 0 then
        if titleData1 and titleData2 then
            Player:checkAddRedPoint(self.ui.Button_1, self.cost, 30, 5)
        end
    end

    if self.flag == 1 then
        addRedPoint(self.ui.Button_2, 30, 5)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HongHuangZhiMenOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.flag = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HongHuangZhiMenOBJ