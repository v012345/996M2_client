EnterDaLuOBJ = {}
EnterDaLuOBJ.__cname = "EnterDaLuOBJ"
EnterDaLuOBJ.config = ssrRequireCsvCfg("cfg_EnterDaLu")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function EnterDaLuOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.EnterDaLu_OpenUI, objcfg.NPCID)
end

--请求打开UI
function EnterDaLuOBJ:OpenUI(arg1, arg2, arg3, data)
    local objcfg = self.objcfg
    self.data = data
    local cfg = self.config[objcfg.NPCID]
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    GUI:setTouchEnabled(self.ui.ImageBG, true)
    GUI:setPosition(self.ui.ImageBG, 0, 0)
    GUI:setContentSize(self.ui.ImageBG, ssrConstCfg.width, ssrConstCfg.height)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)

    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.EnterDaLu_Request, objcfg.NPCID)
    end)
    --关闭按钮位置
    GUI:setPosition(self.ui.CloseButton, ssrConstCfg.width - 100, ssrConstCfg.height - 100)
    GUI:setLocalZOrder(self.ui.CloseButton, 100)
    --修改背景
    --SL:dump(cfg.number)
    --SL:Print(cfg.number )
    GUI:Image_loadTexture(self.ui.ImageBG, "res/custom/enterDaLu/" .. cfg.number .. "DaLu/bg_1.jpg")
    local FramesBg = GUI:Frames_Create(self.ui.ImageBG, "Frames_bg", 0, 0, "res/custom/enterDaLu/" .. cfg.number .. "DaLu/bg_", ".jpg", 1, 25, { count = 25, speed = 100, loop = -1, finishhide = 0 })
    GUI:setContentSize(FramesBg, ssrConstCfg.width, ssrConstCfg.height)
    GUI:setLocalZOrder(FramesBg, 10)
    GUI:setPosition(self.ui.Node_1, ssrConstCfg.width / 2, ssrConstCfg.height / 2)
    GUI:setLocalZOrder(self.ui.Node_1, 11)
    --文字描述
    GUI:Image_loadTexture(self.ui.Image_desc, "res/custom/enterDaLu/" .. cfg.number .. ".png")
    local widgets = ssrAddItemListX(self.ui.Panel_itemList, cfg.itemList or {}, "item_")
    for i, v in ipairs(widgets) do
        GUI:setTag(v, i)
    end
    GUI:UserUILayout(self.ui.Panel_itemList, {
        dir = 2,
        addDir = 2,
        interval = 0.15,
        gap = { x = 5 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) > GUI:getTag(b)
            end)
        end
    })

    for i, v in ipairs(self.data) do
        local Image_Condition = GUI:Image_Create(self.ui.Panel_Condition, "Image_Condition" .. i, 0.00, 91.00, "res/custom/enterDaLu/condition.png")
        local Image_Condition_bg = GUI:Image_Create(Image_Condition, "Image_Condition" .. i, 120.00, 2.00, "res/custom/enterDaLu/conditionBG.png")
        GUI:Image_setScale9Slice(Image_Condition_bg, 8, 8, 8, 8)
        GUI:setContentSize(Image_Condition_bg, 250, 40)
        GUI:setTag(Image_Condition, i)
        local color = v[2] == 1 and "#00FF00" or "#FF0000"
        GUI:RichText_Create(Image_Condition_bg, "rich" .. i, 6, 8, v[1], 600, 18, color, 5)
    end
    GUI:UserUILayout(self.ui.Panel_Condition, {
        dir = 1,
        addDir = 1,
        interval = 0,
        gap = { x = 5 },
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) > GUI:getTag(b)
            end)
        end
    })
end

function EnterDaLuOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function EnterDaLuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return EnterDaLuOBJ