TongGuanWenDieOBJ = {}
TongGuanWenDieOBJ.__cname = "TongGuanWenDieOBJ"
TongGuanWenDieOBJ.config = ssrRequireCsvCfg("cfg_TongGuanWenDie")
TongGuanWenDieOBJ.ParentCfg = ssrRequireCsvCfg("cfg_JuQingCategories")
TongGuanWenDieOBJ.cost = {{}}
TongGuanWenDieOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TongGuanWenDieOBJ:main(objcfg)
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
    local cfg = self.config[objcfg.NPCID]
    if not cfg then
        sendmsg9("错误！")
        GUI:Win_Close(self._parent)
        return
    end
    local cfg2 = self.ParentCfg[cfg.jqID]
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.TongGuanWenDie_Request,cfg.jqID, objcfg.NPCID)
    end)
    ssrAddItemListX(self.ui.Panel_1,cfg2.rewardShow,"item_",{spacing = 50})
    local tips1Path = "res/custom/TongGuanWenDie/".. objcfg.NPCID .."_tips1.png"
    local tips2Path = "res/custom/TongGuanWenDie/".. objcfg.NPCID .."_tips2.png"
    local titileNamePath = "res/custom/TongGuanWenDie/".. objcfg.NPCID .."_title.png"
    GUI:Image_loadTexture(self.ui.Image_1,tips1Path)
    GUI:Image_loadTexture(self.ui.Image_2,tips2Path)
    GUI:Image_loadTexture(self.ui.Image_3,titileNamePath)
    ssrMessage:sendmsg(ssrNetMsgCfg.TongGuanWenDie_Sync1, cfg.jqID)
end

function TongGuanWenDieOBJ:RefreshRichText(index, data)
    local cfg = self.ParentCfg[index]
    if GUI:Win_IsNull(self.ui.Panel_3) then
        return
    end
    GUI:removeAllChildren(self.ui.Panel_3)
    local jinduTs = {}
    for i, v in ipairs(data) do
        local tmp
        if type(v) == "boolean" then
            tmp = SetCompletionStatus(v)
        elseif type(v) == "table" then
            tmp = SetCompletionProgress(v[1], v[2])
        end
        table.insert(jinduTs,tmp)
    end
    local tips = StringFormat(cfg.tips, unpack(jinduTs))
    local RichText2 = GUI:RichText_Create(self.ui.Panel_3, "RichText1_" .. index, 30, 270, tips, 464, 16, "#39B5EF", 5, nil, "fonts/font2.ttf")
    GUI:setAnchorPoint(RichText2, 0, 1)
    local RichText2Size = GUI:getContentSize(RichText2)
    GUI:setContentSize(self.ui.Panel_3, 480, RichText2Size.height)
    GUI:ScrollView_setInnerContainerSize(self.ui.ScrollView_1, 480, RichText2Size.height)
    GUI:setPositionY(RichText2, RichText2Size.height)
    local isFinish = CheckTaskIsFinish(data)
    if not self.data[tostring(index)] then
        if isFinish then
            addRedPoint(self.ui.Button_1, 25 ,5)
        end
    else
        --GUI:Button_loadTextureNormal(self.ui.Button_1,"res/custom/public/yilingqu.png")
        GUI:Button_setBrightEx(self.ui.Button_1,false)
    end
end
--同步网络消息
function TongGuanWenDieOBJ:Sync1(arg1,arg2,arg2,data)
    self:RefreshRichText(arg1,data)
end

function TongGuanWenDieOBJ:UpdateUI()
    delRedPoint(self.ui.Button_1)
    GUI:Button_setBrightEx(self.ui.Button_1,false)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function TongGuanWenDieOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return TongGuanWenDieOBJ