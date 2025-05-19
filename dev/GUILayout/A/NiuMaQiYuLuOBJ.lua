NiuMaQiYuLuOBJ = {}
NiuMaQiYuLuOBJ.__cname = "NiuMaQiYuLuOBJ"
NiuMaQiYuLuOBJ.config1 = ssrRequireCsvCfg("cfg_TitelLookData")
NiuMaQiYuLuOBJ.config2 = ssrRequireCsvCfg("cfg_TitleNumData")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function NiuMaQiYuLuOBJ:main(objcfg)
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
    self.lastBtn = nil
    self:UpdateUI()
end

function NiuMaQiYuLuOBJ:setSelected(widget, name)
    if self.lastBtn then
        GUI:removeAllChildren(self.lastBtn)
    end
    if not GUI:getChildByName(widget, "Image_2") then
	    GUI:Image_Create(widget, "Image_2", 0.00, 0.00, "res/custom/niumaqiyulu/ch_0.png")
        GUI:removeAllChildren(self.ui.TipsLayout)
        local cfg = self.config2[name]
                GUI:Image_Create(self.ui.TipsLayout, "sxxq", 0.00, 0.00, "res/custom/niumaqiyulu/sxxq.png")
                local AttLayout1 = 100
                local atttbl = ""
                for i, v in ipairs(cfg.AttLook) do
                    atttbl = atttbl .. "<".. v .."/FCOLOR=254>\\"
                    AttLayout1 = AttLayout1 + 15
                end
                local AttLookLayout1 = GUI:Layout_Create(self.ui.TipsLayout, "AttLookLayout1", 0.00, 0.00, 220.00, AttLayout1, false)
                    --GUI:Layout_setBackGroundColorType(AttLookLayout1, 1)
                    --GUI:Layout_setBackGroundColor(AttLookLayout1, "#96c8ff")
                    --GUI:RichTextFCOLOR_Create(AttLookLayout1, "rich1", 0, 0, atttbl, 200, 16, "#28EF01", 5)
                    local rich1 = GUI:RichTextFCOLOR_Create(AttLookLayout1, "rich12", 0, 0, atttbl, 200, 16, "#28EF01", 5)
                    GUI:UserUILayout(AttLookLayout1, {
                    dir=1,
                    gap={x=0,y=50,l=0,t=20},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                    addDir=1
                    })

                GUI:Image_Create(self.ui.TipsLayout, "cftj", 0.00, 0.00, "res/custom/niumaqiyulu/cftj.png")
                    local AttLookLayout2 = GUI:Layout_Create(self.ui.TipsLayout, "AttLookLayout2", 0.00, 0.00, 220.00, 100, false)
                    --GUI:Layout_setBackGroundColorType(AttLookLayout2, 1)
                    --GUI:Layout_setBackGroundColor(AttLookLayout2, "#96c8ff")
                    local rich2 = GUI:RichTextFCOLOR_Create(AttLookLayout2, "rich2", 0, 0, cfg.Tips , 200, 16, "#28EF02", 5)
                    GUI:UserUILayout(AttLookLayout2, {
                    dir=1,
                    gap={x=0,y=50,l=0,t=0},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                    addDir=1
                    })
                GUI:UserUILayout(self.ui.TipsLayout, {
                dir=1,
                gap={x=0,y=50,l=0,t=0},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                addDir=1
               })

    end
    self.lastBtn = widget
end

function NiuMaQiYuLuOBJ:UpdateUI()
    local MyTitleTbl = {}
    local _MyTitleTbl = SL:GetMetaValue("TITLES")     --获取玩家所有称号 插入tbl
    for i, v in ipairs(_MyTitleTbl) do
        local TitleName = SL:GetMetaValue("ITEM_NAME", v.id)
        table.insert(MyTitleTbl, TitleName)
    end
    for z, v in ipairs(self.config1) do
        local TitleTbl = v.Title --遍历称号组 返回为tbl
        local CheckNum = 0
        for n, k in ipairs(TitleTbl) do --遍历称号组tbl
            for _, j in ipairs(MyTitleTbl) do --将取出来检查是否在  玩家所有称号 tbl里面
                if j == k then
                    CheckNum = n
                    break
                end
            end
        end
        for i = 1, #TitleTbl do
            local btn = GUI:Button_Create(self.ui.Panel_1, TitleTbl[i], 0.00, 0.00, "")
            if i <=  CheckNum then
                GUI:Button_loadTextureNormal(btn,"res/custom/niumaqiyulu/titleimg/ch_".. z .."_".. i .."_2.png")
            else
                GUI:Button_loadTextureNormal(btn,"res/custom/niumaqiyulu/titleimg/ch_".. z .."_".. i .."_1.png")
            end
            GUI:addOnClickEvent(btn,function (widget)
                self:setSelected(widget, TitleTbl[i])
            end)
            if z== 1 and i == 1 then
                GUI:Image_Create(btn, "Image_2", 0.00, 0.00, "res/custom/niumaqiyulu/ch_0.png")
                self.lastBtn = btn
                --local cfg = self.config2["合格牛马"]
                local cfg = self.config2["初露锋芒"]
                GUI:Image_Create(self.ui.TipsLayout, "sxxq", 0.00, 0.00, "res/custom/niumaqiyulu/sxxq.png")
                local AttLayout1 = 100
                local atttbl = ""
                for i, v in ipairs(cfg.AttLook) do
                    atttbl = atttbl .. "<".. v .."/FCOLOR=254>\\"
                    AttLayout1 = AttLayout1 + 15
                end
                local AttLookLayout1 = GUI:Layout_Create(self.ui.TipsLayout, "AttLookLayout1", 0.00, 0.00, 220.00, AttLayout1, false)
                --GUI:Layout_setBackGroundColorType(AttLookLayout1, 1)
                --GUI:Layout_setBackGroundColor(AttLookLayout1, "#96c8ff")
                local rich1 = GUI:RichTextFCOLOR_Create(AttLookLayout1, "rich1", 0, 0, atttbl, 200, 16, "#28EF01", 5)
                GUI:UserUILayout(AttLookLayout1, {
                dir=1,
                gap={x=0,y=50,l=0,t=20},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                addDir=1
                })
                GUI:Image_Create(self.ui.TipsLayout, "cftj", 0.00, 0.00, "res/custom/niumaqiyulu/cftj.png")
                local AttLookLayout2 = GUI:Layout_Create(self.ui.TipsLayout, "AttLookLayout2", 0.00, 0.00, 220.00, 100, false)
                    --GUI:Layout_setBackGroundColorType(AttLookLayout2, 1)
                    --GUI:Layout_setBackGroundColor(AttLookLayout2, "#96c8ff")
                    local rich2 = GUI:RichTextFCOLOR_Create(AttLookLayout2, "rich2", 0, 0, cfg.Tips , 200, 16, "#28EF02", 5)
                    GUI:UserUILayout(AttLookLayout2, {
                    dir=1,
                    gap={x=0,y=50,l=0,t=0},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                    addDir=1
                    })
                GUI:UserUILayout(self.ui.TipsLayout, {
                dir=1,
                gap={y=50},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
                addDir=1,
                colnum=1
               })
            end
        end
    end
    GUI:UserUILayout(self.ui.Panel_1, {
        dir=3,
        gap={x=0,y=0,l=0,t=0},                                      --x: 左右间距; y: 上下间距; l: 左边距; t: 上边距
        addDir=1,
        colnum=3
       })

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function NiuMaQiYuLuOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return NiuMaQiYuLuOBJ