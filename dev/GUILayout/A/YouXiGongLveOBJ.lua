YouXiGongLveOBJ = {}
YouXiGongLveOBJ.__cname = "YouXiGongLveOBJ"
YouXiGongLveOBJ.config = ssrRequireCsvCfg("cfg_YouXiGongLve")
YouXiGongLveOBJ.Level_1_Button = 1
YouXiGongLveOBJ.Level_2_Button = 1
YouXiGongLveOBJ.Level_2_Button_Obj = nil
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function YouXiGongLveOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2, -30)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    GUI:setTouchEnabled(self.ui.CloseLayout, true)
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
    self:UpdateButtonLevel_1()
end


local function CopyTable(tab)      --深拷贝
    function _copy(obj)
        if type(obj) ~= "table" then
            return obj
        end
        local new_table = {}
        for k, v in pairs(obj) do
            new_table[_copy(k)] = _copy(v)
        end
        return setmetatable(new_table, getmetatable(obj))
    end
    return _copy(tab)
end



--一级按钮绘制
function YouXiGongLveOBJ:UpdateButtonLevel_1()
    local TypeNum = self.Level_1_Button
    GUI:removeAllChildren(self.ui.All_ListView)
    for i, v in ipairs(self.config) do
        local ButtonLevel_1 = GUI:Button_Create(self.ui.All_ListView, v.ButtonName, 0.00, 0.00, "res/custom/YouXiGongLve/button1/button_" .. i .. "_1.png")
        GUI:Button_loadTextureDisabled(ButtonLevel_1, "res/custom/YouXiGongLve/button1/button_" .. i .. "_2.png")
        if i == 7 then
            GUI:addOnClickEvent(ButtonLevel_1, function()
                SL:RequestOpen996ManualService()
            end)
        else
            GUI:addOnClickEvent(ButtonLevel_1, function()
                self.Level_1_Button = i
                self:UpdateButtonLevel_1()
            end)
        end
        if TypeNum == i and i < 7 then
            GUI:Button_setBright(ButtonLevel_1, false)
            for k, j in ipairs(v.Type) do
                local ButtonLevel_2 = GUI:Button_Create(self.ui.All_ListView, j, 0.00, 0.00, "res/custom/YouXiGongLve/button2/" .. i .. "/list_" .. k .. "_1.png")
                GUI:Button_loadTextureDisabled(ButtonLevel_2, "res/custom/YouXiGongLve/button2/" .. i .. "/list_" .. k .. "_2.png")
                --二级小按钮点击
                if k == 1 then
                    GUI:Button_setBright(ButtonLevel_2, false)
                    self.Level_2_Button_Obj = ButtonLevel_2
                    self.Level_2_Button = 1
                    YouXiGongLveOBJ:UpdateButtonLevel_2()
                end
                GUI:addOnClickEvent(ButtonLevel_2, function()
                    GUI:Button_setBright(self.Level_2_Button_Obj, true)
                    GUI:Button_setBright(ButtonLevel_2, false)
                    self.Level_2_Button_Obj = ButtonLevel_2
                    self.Level_2_Button = k
                    self:UpdateButtonLevel_2()
                end)
            end
        end
    end
end

--二级按钮绘制
function YouXiGongLveOBJ:UpdateButtonLevel_2()
    local list_Obj = GUI:getChildren(self.ui.ALLNode)
    for i, v in ipairs(list_Obj) do
        GUI:setVisible(v, false)
    end
    GUI:setVisible(self.ui["Tips_" .. self.Level_1_Button .. "_" .. self.Level_2_Button .. ""], true)
    if self.Level_1_Button == 2 then
        if self.Level_2_Button == 1 then
            GUI:removeAllChildren(self.ui.ItemShow_2_1)
            local _Y = -323
            for i = 1, 9 do
                local cengjilist = {}
                cengjilist = self.config["装备层级"..i].List

                local tempTbl =  CopyTable(cengjilist)
                local IsNewtTbl = {}
                for j = 1, 7 do
                    if #tempTbl == 0 then break end  -- 如果没有更多元素可取
                    local randomIndex = math.random(1, #tempTbl)
                    table.insert(IsNewtTbl, {tempTbl[randomIndex],1})
                    table.remove(tempTbl, randomIndex)  -- 移除已取出的元素以避免重复
                end
                --SL:dump(IsNewtTbl)
                local ItemShow = GUI:Layout_Create(self.ui.ItemShow_2_1, "ItemShow专属装备"..i, 45, _Y, 400, 90)
                ssrAddItemListX(ItemShow, IsNewtTbl, "展示装备" .. i, { imgRes = "", spacing = 78 })
                _Y = _Y - 137
            end
        end
        if self.Level_2_Button == 2 then
            GUI:removeAllChildren(self.ui.ItemShow_2_2)
            local _Y = 1960
            for i = 1, 7 do
                local zhuanshulist = {}
                zhuanshulist = self.config["专属展示"..i].List
                local tempTbl  = nil
                tempTbl =  CopyTable(zhuanshulist)
                for f = 1, 4 do
                    local IsNewtTbl = {}
                    for j = 1, 7 do
                        if #tempTbl == 0 then break end  -- 如果没有更多元素可取
                        local randomIndex = math.random(1, #tempTbl)
                        table.insert(IsNewtTbl, {tempTbl[randomIndex],1})
                        table.remove(tempTbl, randomIndex)  -- 移除已取出的元素以避免重复
                    end
                    SL:dump(IsNewtTbl)
                    local ItemShow = GUI:Layout_Create(self.ui.ItemShow_2_2, "ItemShow专属装备"..i..f, -5, _Y, 400, 90)
                    ssrAddItemListX(ItemShow, IsNewtTbl, "展示装备" .. i..f, { imgRes = "res/custom/YouXiGongLve/tips/2/dt.png", spacing = 15 })
                    _Y = _Y - 77
                end
                _Y = _Y - 96
            end
        end
        --更新日志
    elseif self.Level_1_Button == 6 then
        local function httpCB(success, response)
            local data = { }
            if not success then
                sendmsg9("获取更新日志失败！")
                return
            end
            --SL:dump(response)
            local logData = SL:JsonDecode(response, false)
            if not logData.msg or #logData.msg == 0 then
                sendmsg9("获取更新日志失败！")
                return
            end
            data = logData.msg
            GUI:removeAllChildren(self.ui.Tips_6_1)
            for i, v in ipairs(data) do
                --local RText = GUI:RichText_Create(self.ui.Tips_6_1, "log" .. i, 0, 0, v, 500, 16, "#FF0000", 22, nil, "fonts/font2.ttf")
                --local rich = GUI:RichTextFCOLOR_Create(self.ui.Tips_6_1, "rich"..i, 100, 0, "<灼伤：%s几率灼烧目标/FCOLOR=254>\\<每秒燃烧目标5%生命值/FCOLOR=249>", 600, 16, "#28EF01", 5)
                --SL:dump(rich)
                local str = SL:Split(v, "#")
                local colorNum = tonumber(str[2])
                colorNum = colorNum or 255
                local hexColor = SL:GetHexColorByStyleId(colorNum)
                GUI:Text_Create(self.ui.Tips_6_1, "Text_1"..i, 0.00, 0.00, 16, hexColor, str[1])
            end
            --createMultiLineRichTextEX(self.ui.Tips_6_1, "upLog", 0, 0, data, nil, 560, 16)
        end
        --SL:HTTPRequestGet("http://159.75.153.98:880/api/Index/GetUpLog", httpCB)
    end
end

return YouXiGongLveOBJ