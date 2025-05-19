HuoDongDaTingOBJ = {}
HuoDongDaTingOBJ.__cname = "HuoDongDaTingOBJ"
HuoDongDaTingOBJ.config = ssrRequireCsvCfg("cfg_HuoDongDaTing")
HuoDongDaTingOBJ.imgPath = "res/custom/HuoDongDaTing/"
HuoDongDaTingOBJ.emunHuoDongTiXing = {
    [1] = {imgPath = "tixing/txzrtx.png",name = "txzrtx", actIndex = 1},
    [15] = {imgPath = "tixing/fxqptx.png",name = "fxqptx", actIndex = 2},
    [25] = {imgPath = "tixing/txzrtx.png",name = "txzrtx", actIndex = 1},
    [45] = {imgPath = "tixing/qmhstx.png",name = "qmhstx", actIndex = 3},
    [55] = {imgPath = "tixing/txzrtx.png",name = "txzrtx", actIndex = 1},
    [75] = {imgPath = "tixing/jqpdtx.png",name = "jqpdtx", actIndex = 4},
    [85] = {imgPath = "tixing/txzrtx.png",name = "txzrtx", actIndex = 1},
    [105] = {imgPath = "tixing/myzwtx.png",name = "myzwtx", actIndex = 5},
    [115] = {imgPath = "tixing/txzrtx.png",name = "txzrtx", actIndex = 1},
    [135] = {imgPath = "tixing/fxqptx.png",name = "fxqptx", actIndex = 2},
}

HuoDongDaTingOBJ.emunMeiRiHuoDongXianWangBaoZang = {
    [1] = {imgPath = "tixing/xwbztx.png",name = "xwbztx", actIndex = 6},
}
HuoDongDaTingOBJ.emunMeiRiHuoDongYiJieZhanChang = {
    [1] = {imgPath = "tixing/yjzctx.png",name = "yjzctx", actIndex = 7},
}
HuoDongDaTingOBJ.emunMeiRiHuoDongYiJieMiCheng = {
    [1] = {imgPath = "tixing/yjmctx.png",name = "yjmctx", actIndex = 8},
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function HuoDongDaTingOBJ:main(objcfg)
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
    self.lastBtn = nil
    self:UpdateUI()
end

function HuoDongDaTingOBJ:UpdateUI()
    local newTbl = {}
    for i, v in ipairs(self.config) do
        if not evaluate_condition(v.hideCondition) then
            v.sort = i
        else
            v.sort = i  * 100
        end
        if evaluate_condition(v.varCondition) then
            v.isOpen = true
        else
            v.isOpen = false
        end
        table.insert(newTbl,v)
    end
    --排序
    table.sort(newTbl, function(a, b)
        return a.sort < b.sort
    end)
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    self.btnList = {}
    for i, v in ipairs(newTbl) do
        --if not evaluate_condition(v.hideCondition) then
            local btn = GUI:Button_Create(self.ui.ListView_1, "Button_"..i, 0.00, 0.00, self.imgPath .. v.listImg)
            table.insert(self.btnList, btn)
            if v.isOpen then
                GUI:Image_Create(btn, "image"..i, 501.00, 6.00, self.imgPath.."jinxingzhong.png")
            else
                GUI:Image_Create(btn, "image"..i, 501.00, 6.00, self.imgPath.."weikaiqi.png")
            end

            GUI:addOnClickEvent(btn,function ()
                self:selected(v,btn)
            end)
        --end
    end
    local cfg = newTbl[1]
    self:selected(cfg,self.btnList[1])
end

function HuoDongDaTingOBJ:act(actIndex)
    if actIndex == 1 then
        ssrMessage:sendmsg(ssrNetMsgCfg.TianXuanZhiRen_RequestOpenUI)
    elseif actIndex == 2 then
        ssrMessage:sendmsg(ssrNetMsgCfg.FuXingQiPan_EnterMap)
    elseif actIndex == 3 then
        ssrMessage:sendmsg(ssrNetMsgCfg.QuanMinHuaShui_EnterMap)
    elseif actIndex == 4 then
        ssrMessage:sendmsg(ssrNetMsgCfg.JiQingPaoDian_EnterMap)
    elseif actIndex == 5 then
        ssrMessage:sendmsg(ssrNetMsgCfg.MoYuZhiWang_EnterMap)
    elseif actIndex == 6 then
        ssrMessage:sendmsg(ssrNetMsgCfg.XianWangBaoZang_EnterMap)
    elseif actIndex == 7 then
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJieDiXiaCheng_Request,2)
    elseif actIndex == 8 then
        ssrMessage:sendmsg(ssrNetMsgCfg.YiJieMiCheng_Request)
    end
    if GUI:GetWindow(nil, self.__cname) then
        GUI:Win_Close(self._parent)
    end
end

function HuoDongDaTingOBJ:selected(cfg,btn)
    self.actIndex = cfg.actIndex
    if self.lastBtn then
        local selectObj = GUI:getChildByName(self.lastBtn, "selected")
        if GUI:Win_IsNotNull(selectObj) then
            GUI:removeChildByName(self.lastBtn, "selected")
        end
    end
    GUI:Image_loadTexture(self.ui.Image_1,self.imgPath..cfg.jsImg)
    GUI:Image_Create(btn, "selected", 5.00, 5.00, self.imgPath.."selected.png")
    ssrAddItemListX(self.ui.Panel_1,cfg.reward,"item_",{imgRes = self.imgPath .. "itembg.png"})
    GUI:Text_setString(self.ui.Text_desc,cfg.desc)
    GUI:setContentSize(self.ui.Text_desc, 238, 78)
    self.lastBtn = btn
        --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        self:act(self.actIndex)
    end)
end

function HuoDongDaTingOBJ:ShowHuoDongTips(cfg)
    if cfg then
        local parent = GUI:Win_FindParent(102)
        if ssrConstCfg.client_type == 2 then
            local btn = GUI:Button_Create(parent, cfg.name , -390, -440, HuoDongDaTingOBJ.imgPath .. cfg.imgPath)
            local close = GUI:Button_Create(btn, "hdClose", 138, 144, "res/public/1900000510.png")
            GUI:Button_loadTexturePressed(close, "res/public/1900000511.png")
            GUI:addOnClickEvent(btn,function ()
                HuoDongDaTingOBJ:act(cfg.actIndex)
                GUI:removeChildByName(parent,cfg.name)
            end)
            GUI:addOnClickEvent(close,function ()
                GUI:removeChildByName(parent,cfg.name)
            end)

        else
            local btn = GUI:Button_Create(parent, cfg.name, -330, -440, HuoDongDaTingOBJ.imgPath .. cfg.imgPath)
            local close = GUI:Button_Create(btn, "hdClose", 138, 144, "res/public/1900000510.png")
            GUI:Button_loadTexturePressed(close, "res/public/1900000511.png")
            GUI:addOnClickEvent(btn,function ()
                HuoDongDaTingOBJ:act(cfg.actIndex)
                GUI:removeChildByName(parent,cfg.name)
            end)
            GUI:addOnClickEvent(close,function ()
                GUI:removeChildByName(parent,cfg.name)
            end)
        end
    end
end

SL:RegisterLUAEvent(LUA_EVENT_SERVER_VALUE_CHANGE, "HuoDongDaTingOBJ", function(data)
    if data.key == "G1" then
        local value = tonumber(data.value)
        local cfg = HuoDongDaTingOBJ.emunHuoDongTiXing[value]
        if cfg then
            HuoDongDaTingOBJ:ShowHuoDongTips(cfg)
        end
    end

    if data.key == "G8" then
        local value = tonumber(data.value)
        if value == 1 then
            local cfg = HuoDongDaTingOBJ.emunMeiRiHuoDongXianWangBaoZang[value]
            if cfg then
                HuoDongDaTingOBJ:ShowHuoDongTips(cfg)
            end
        end
    end
    --异界战场
    if data.key == "G9" then
        local value = tonumber(data.value)
        if value == 1 then
            local cfg = HuoDongDaTingOBJ.emunMeiRiHuoDongYiJieZhanChang[value]
            if cfg then
                HuoDongDaTingOBJ:ShowHuoDongTips(cfg)
            end
        end
    end
    --异界迷城
    if data.key == "G16" then
        local value = tonumber(data.value)
        if value == 1 then
            local cfg = HuoDongDaTingOBJ.emunMeiRiHuoDongYiJieMiCheng[value]
            if cfg then
                HuoDongDaTingOBJ:ShowHuoDongTips(cfg)
            end
        end
    end
end)

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function HuoDongDaTingOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return HuoDongDaTingOBJ