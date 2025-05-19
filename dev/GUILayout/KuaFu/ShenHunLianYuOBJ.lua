ShenHunLianYuOBJ = {}
ShenHunLianYuOBJ.__cname = "ShenHunLianYuOBJ"
ShenHunLianYuOBJ.config = ssrRequireCsvCfg("cfg_ShenHunLianYu")
ShenHunLianYuOBJ.cost = {{}}
ShenHunLianYuOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenHunLianYuOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunLianYu_OpenUI)
end


function ShenHunLianYuOBJ:showMainPanel(index)
    local cfg = self.config[index]
    local isCunHuo = self.data[index][1]
    local guiShu = self.data[index][2]
    if cfg then
        GUI:Text_setString(self.ui.Text_1,cfg.showTiaoJian)
        GUI:Text_setString(self.ui.Text_2,cfg.point)
        ssrAddItemListX(self.ui.Panel_1,cfg.diaoLuoShow,"item_")
        if isCunHuo == 0 then
            GUI:removeAllChildren(self.ui.Node_1)
            local Text_3 = GUI:Text_Create(self.ui.Node_1, "Text_3", 0.00, 0.00, 18, "#00FF00", "已刷新  归属("..guiShu..")")
            GUI:Text_enableOutline(Text_3, "#000000", 1)
        else
            GUI:removeAllChildren(self.ui.Node_1)
            local Text_3 = GUI:Text_Create(self.ui.Node_1, "Text_3", 0.00, 0.00, 18, "#FF0000", "")
            GUI:Text_enableOutline(Text_3, "#000000", 1)
            GUI:Text_COUNTDOWN(Text_3, isCunHuo)
        end
        GUI:removeAllChildren(self.ui.Node_mode)
        GUI:Effect_Create(self.ui.Node_mode, "EffecWeapon", 0.00, 0.00, 5, cfg.weaponID, 0, 0, 4, 1)
        GUI:Effect_Create(self.ui.Node_mode, "EffectActor", 0.00, 0.00, 4, cfg.clothID, 0, 0, 4, 1)
        GUI:addOnClickEvent(self.ui.Button_1,function()
            ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunLianYu_Request, index)
        end)
    end
end

--所有按钮解除禁用
function ShenHunLianYuOBJ:setAllBtnState()
    for i, v in ipairs(self.leftBtnList) do
        GUI:Button_setBrightEx(v, true)
    end
end

function ShenHunLianYuOBJ:CreateLeftBtn()
    GUI:ListView_removeAllItems(self.ui.ListView_1)
    self.leftBtnList = {}
    for i = 1, 12 do
        local Button = GUI:Button_Create(self.ui.ListView_1, "Button_left_" .. i, 0.00, 0.00, "res/custom/ShenHunLianYu/left_btn/btn_" .. i .. "_1.png")
        GUI:Button_loadTextureDisabled(Button, "res/custom/ShenHunLianYu/left_btn/btn_" .. i .. "_2.png")
        local isCunHuo = self.data[i][1]
        local resPath = ""
        if isCunHuo == 0 then
            resPath = "res/custom/ShenHunLianYu/1.png"
        else
            resPath = "res/custom/ShenHunLianYu/2.png"
        end
        GUI:Image_Create(Button, "Image_"..i, 154.00, -3.00, resPath)
        GUI:setTouchEnabled(Button, true)
        GUI:setTag(Button, i)
        GUI:addOnClickEvent(Button, function(widget)
            self:setAllBtnState()
            GUI:Button_setBrightEx(widget, false)
            self:showMainPanel(i)
        end)
        if i == 1 then
            self.GetIndex = i
            GUI:Button_setBrightEx(Button, false)
        end
        table.insert(self.leftBtnList, Button)
    end
    --显示主面板
    self:showMainPanel(1)
end

function ShenHunLianYuOBJ:OpenUI(arg1,arg2,arg3,data)
    self.data = data
    objcfg = self.objcfg
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
    self:CreateLeftBtn()
end

function ShenHunLianYuOBJ:UpdateUI()
    objcfg = self.objcfg
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenHunLianYu_Request)
    end)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShenHunLianYuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenHunLianYuOBJ