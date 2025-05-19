DianDengRenOBJ = {}
DianDengRenOBJ.__cname = "DianDengRenOBJ"
DianDengRenOBJ.config = ssrRequireCsvCfg("cfg_DianDengRen")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DianDengRenOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    self.NPCID = objcfg.NPCID
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

    local cfg = self.config[objcfg.NPCID]
    GUI:Image_loadTexture(self.ui.Image_1, "res/custom/guhundiandengren/"..cfg.imgPath..".png")
    GUI:Effect_Create(self.ui.Panel_1, "Effect", 0.00, 165.00, 3, 17523)
    self:UpdateUI()


    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.DianDengRen_Request,self.NPCID)
    end)
end

--判断称号是否存在
function DianDengRenOBJ:chaeckHasTitle(index)
    local titletab = SL:GetMetaValue("TITLES")
    local newTable = {}
    for i, v in pairs(titletab) do
        newTable[v.id] = 1
    end

    if newTable[index] then
        return true
    else
        return false
    end
end

function DianDengRenOBJ:UpdateUI()
    local cfg = self.config[self.NPCID]
    local showCostArray = {}
    for i = 1, 3 do
        table.insert(showCostArray, cfg.cost[i])
    end
    showCost(self.ui.Panel_cost, showCostArray,50,{itemBG = ""})
    Player:checkAddRedPoint(self.ui.Button_1,cfg.cost,30,10)
    GUI:setVisible(self.ui.Button_1, false)
	GUI:setVisible(self.ui.Image_2, false)
    local state = self:chaeckHasTitle(cfg.titleIdx)
    SL:Print(state)
    if state then
        GUI:setVisible(self.ui.Image_2, true)
    else
        GUI:setVisible(self.ui.Button_1, true)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function DianDengRenOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return DianDengRenOBJ