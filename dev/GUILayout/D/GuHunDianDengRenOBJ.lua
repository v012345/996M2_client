GuHunDianDengRenOBJ = {}
GuHunDianDengRenOBJ.__cname = "GuHunDianDengRenOBJ"
--GuHunDianDengRenOBJ.config = ssrRequireCsvCfg("cfg_GuHunDianDengRen")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function GuHunDianDengRenOBJ:main(objcfg)
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
    GUI:Timeline_Window2(self._parent)
    self:UpdateUI()
end

--判断称号是否存在
function GuHunDianDengRenOBJ:chaeckHasTitle(index)
    return  SL:GetMetaValue("TITLE_DATA_BY_ID", index)
end

function GuHunDianDengRenOBJ:UpdateUI()
    local titletab = SL:GetMetaValue("TITLES")
    local newTable = {}
    for i, v in pairs(titletab) do
        newTable[v.id] = 1
    end
    local nodeList = GUI:getChildren(self.ui.Node_1)
    local titleIdStart = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "子时旧魂灯")
    local totalTitleId = SL:GetMetaValue("ITEM_INDEX_BY_NAME", "冥魂引渡人")
    local chaeckHasTitle = self:chaeckHasTitle(totalTitleId)
    for i, v in ipairs(nodeList) do
        GUI:removeAllChildren(v)
        if chaeckHasTitle then
            local Effect = GUI:Effect_Create(v, "Effect"..i, -3, 68, 3, 17523)
            GUI:setScaleX(Effect, 0.35)
            GUI:setScaleY(Effect, 0.35)
        else
            if newTable[titleIdStart] then
                local Effect = GUI:Effect_Create(v, "Effect"..i, -3, 68, 3, 17523)
                GUI:setScaleX(Effect, 0.35)
                GUI:setScaleY(Effect, 0.35)
            else
                local Image_bg = GUI:Image_Create(v, "Image_bg"..i, 5, -5, "res/custom/guhundiandengren/00001.png")
            end
            titleIdStart = titleIdStart + 1
        end

    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function GuHunDianDengRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return GuHunDianDengRenOBJ