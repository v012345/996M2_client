FuLiDaTingOBJ = {}
FuLiDaTingOBJ.__cname = "FuLiDaTingOBJ"
FuLiDaTingOBJ.configCache = ssrRequireCsvCfg("cfg_FuLiDaTing")
FuLiDaTingOBJ.shouShaConfig = ssrRequireCsvCfg("cfg_GeRenShouSha")
FuLiDaTingOBJ.geRenShouBaoConfig = ssrRequireCsvCfg("cfg_GeRenShouBao")
FuLiDaTingOBJ.quanFuShouBaoConfig = ssrRequireCsvCfg("cfg_QuanQuShouBao")
FuLiDaTingOBJ.cost = {{}}
FuLiDaTingOBJ.give = {{}}
FuLiDaTingOBJ.objcfg = nil
FuLiDaTingOBJ.config = {}
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

for k,v in pairs(FuLiDaTingOBJ.configCache) do
    if type(k) == "number" then
        if FuLiDaTingOBJ.config[v.type] == nil then
            FuLiDaTingOBJ.config[v.type] = {}
        end

        if FuLiDaTingOBJ.config[v.type][v.number] == nil then
            local tb = CopyTable(v)
            tb.number = nil
            tb.type = nil
            FuLiDaTingOBJ.config[v.type][v.number] = tb
        end
    end
end

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FuLiDaTingOBJ:main(objcfg)
    SL:release_print("FuLiDaTingOBJ:main")
    FuLiDaTingOBJ.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_SyncResponse)
end

function FuLiDaTingOBJ:OpenUI()
    --SL:PrintTable(FuLiDaTingOBJ.data)
    FuLiDaTingOBJ.page = 1
    FuLiDaTingOBJ.sign = 1
    local screen_W = SL:GetMetaValue("SCREEN_WIDTH")
    local screen_H = SL:GetMetaValue("SCREEN_HEIGHT")

    local parent = GUI:Win_Create(FuLiDaTingOBJ.__cname, 0, 0, 0, 0, false, false, true, true, true, FuLiDaTingOBJ.objcfg.NPCID)
    GUI:LoadExport(parent, FuLiDaTingOBJ.objcfg.UI_PATH)
    FuLiDaTingOBJ._parent = parent
    FuLiDaTingOBJ.ui = GUI:ui_delegate(parent)
    --SL:PrintTable( FuLiDaTingOBJ.ui)
    ssrSetWidgetPosition(parent, FuLiDaTingOBJ.ui.ImageBG, 2,0)

    GUI:setAnchorPoint(FuLiDaTingOBJ.ui.ImageBG,0.5,0.5)
    GUI:setPosition(FuLiDaTingOBJ.ui.ImageBG,screen_W/2 - 30,screen_H/2)
    GUI:addOnClickEvent(FuLiDaTingOBJ.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(FuLiDaTingOBJ.ui.close, function()
        GUI:Win_Close(FuLiDaTingOBJ._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(FuLiDaTingOBJ._parent)
    --网络消息示例
    --GUI:addOnClickEvent(self.ui.Button_1, function()
    --    ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request)
    --end)

    --local _Handle = GUI:GetWindow(self.ui.ImageBG,"close")
    --if _Handle then
    --    GUI:addOnClickEvent(_Handle, function()
    --         GUI:Win_Close(self._parent)
    --    end)
    --end

    FuLiDaTingOBJ:UpdateUI()
end

function FuLiDaTingOBJ:UpdateUI()
    local _Parent = GUI:GetWindow(self._parent,"ImageBG")
    if _Parent then
        local _Handle = nil
        local redPoint = FuLiDaTingOBJ.getRedPoint()
        GUI:Image_loadTexture(_Parent,"res/custom/fulidating/"..FuLiDaTingOBJ.page.."/bgk.png")
        local _GUIHandle = GUI:GetWindow(_Parent,"leftLayout")
        if _GUIHandle then

            for i=1,#FuLiDaTingOBJ.config do
                _Handle = GUI:GetWindow(_GUIHandle,"btn"..i)
                if _Handle then
                    if i == FuLiDaTingOBJ.page then
                        GUI:Button_loadTextureNormal(_Handle,"res/custom/fulidating/tab_"..i.."_2.png")
                    else
                        GUI:Button_loadTextureNormal(_Handle,"res/custom/fulidating/tab_"..i.."_1.png")
                    end
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.page ~= i then
                            FuLiDaTingOBJ.page = i
                            FuLiDaTingOBJ.sign = 1
                            FuLiDaTingOBJ:UpdateUI()
                        end
                    end)
                end

                if redPoint[i] == 1 then
                    addRedPoint(_Handle, 20, 0)
                else
                    delRedPoint(_Handle)
                end
                --SL:CreateRedPoint(_Handle, { x=20,y=20 })

                _Handle = GUI:GetWindow(_Parent,"rightLayout"..i)
                if _Handle then
                    if i == FuLiDaTingOBJ.page then
                        GUI:setVisible(_Handle, true)
                    else
                        GUI:setVisible(_Handle, false)
                    end
                end

            end
        end

        _GUIHandle = GUI:GetWindow(_Parent,"rightLayout"..FuLiDaTingOBJ.page)
        if _GUIHandle then
            --GUI:Win_SetZPanel(_Parent, _GUIHandle)
            if FuLiDaTingOBJ.page == 1 then
                _Handle = GUI:GetWindow(_GUIHandle,"Text_1")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][1])
                end

                for i=1,#FuLiDaTingOBJ.config[FuLiDaTingOBJ.page] do
                    _Handle = GUI:GetWindow(_Parent,"rightLayout2/List/list"..i.."/item")
                    if _Handle then
                        GUI:setVisible(_Handle, false)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/ItemShow")
                    if _Handle then
                        local item_data = {}
                        item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][1])
                        item_data.look  = true
                        item_data.bgVisible = false
                        item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][2]
                        item_data.color = 250
                        --
                        --GUI:Win_SetZPanel(GUI:GetWindow(nil,"ImageBG"), _Handle)
                        GUI:setVisible(_Handle, true)
                        GUI:ItemShow_updateItem(_Handle,item_data)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/Button_1")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2] >= i then
                            GUI:setVisible(_Handle, false)
                        else
                            GUI:setVisible(_Handle, true)
                            if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][1] >=  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].need then
                                addRedPoint(_Handle, 20, 0)
                            else
                                delRedPoint(_Handle)
                            end
                        end

                        GUI:addOnClickEvent(_Handle, function()
                            ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page,i)
                        end)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/over")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2] < i then
                            GUI:setVisible(_Handle, false)
                        else
                            GUI:setVisible(_Handle, true)
                        end
                    end


                    --local item_data = {}
                    --item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][1])
                    --item_data.look  = true
                    --item_data.bgVisible = false
                    --item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][2]
                    --item_data.color = 250
                    ----
                    ----GUI:ItemShow_updateItem(_Handle,item_data)
                    ----GUI:ItemShow_addReplaceClickEvent(_Handle, function()
                    ----    SL:release_print("点击了物品")
                    ----end )
                    --local item = GUI:ItemShow_Create(GUI:GetWindow(_GUIHandle,"List/"), "item_1", pos.x, pos.y, item_data)
                    --GUI:setAnchorPoint(item, 0.50, 0.50)
                end
            elseif FuLiDaTingOBJ.page == 2 then
                _Handle = GUI:GetWindow(_GUIHandle,"Text_1")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][1])
                end


                for i=1,#FuLiDaTingOBJ.config[FuLiDaTingOBJ.page] do
                    --_Handle = GUI:GetWindow(_Parent,"rightLayout1/List/list"..i.."/item")
                    --if _Handle then
                    --    GUI:setVisible(_Handle, false)
                    --end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/item")
                    if _Handle then
                        local item_data = {}
                        item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][1])
                        item_data.look  = true
                        item_data.bgVisible = false
                        item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][2]
                        item_data.color = 250
                        --item_data.noMouseTips = false
                        GUI:setVisible(_Handle, true)
                        GUI:ItemShow_updateItem(_Handle,item_data)
                        --
                    end

                    --SL:PrintTable(FuLiDaTingOBJ.data[FuLiDaTingOBJ.page])
                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/Button_1")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2] >= i then
                            GUI:setVisible(_Handle, false)
                        else
                            GUI:setVisible(_Handle, true)

                            if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][1] >=  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].need then
                                addRedPoint(_Handle, 20, 0)
                            else
                                delRedPoint(_Handle)
                            end

                        end

                        GUI:addOnClickEvent(_Handle, function()
                            ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page,i)
                        end)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/over")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2] < i then
                            GUI:setVisible(_Handle, false)
                        else
                            GUI:setVisible(_Handle, true)
                        end
                    end
                end
            elseif FuLiDaTingOBJ.page == 3 then
                for i=1,#FuLiDaTingOBJ.config[FuLiDaTingOBJ.page] do
                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/item")
                    if _Handle then
                        local item_data = {}
                        item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][1])
                        item_data.look  = true
                        item_data.bgVisible = false
                        item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].award[1][2]
                        item_data.color = 250
                        --item_data.noMouseTips = false

                        GUI:ItemShow_updateItem(_Handle,item_data)
                    end
                    local txt = FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].num
                    if type(txt) == "number" then
                        txt = FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].num - FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][3][i]
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/num")
                    if _Handle then
                        GUI:Text_setString(_Handle, txt)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/Button_1")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2][i] > 0 then
                            GUI:setVisible(_Handle, false)
                        else
                            GUI:setVisible(_Handle, true)
                        end

                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][1] >=  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][i].need then
                            if i > 1 then
                                if txt > 0 then
                                    addRedPoint(_Handle, 20, 0)
                                else
                                    delRedPoint(_Handle)
                                end
                            else
                                addRedPoint(_Handle, 20, 0)
                            end
                        else
                            delRedPoint(_Handle)
                        end

                        GUI:addOnClickEvent(_Handle, function()
                            ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page,i)
                        end)
                    end

                    _Handle = GUI:GetWindow(_GUIHandle,"List/list"..i.."/over")
                    if _Handle then
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][2][i] > 0 then
                            GUI:setVisible(_Handle, true)
                        else
                            GUI:setVisible(_Handle, false)
                        end
                    end
                end
            elseif FuLiDaTingOBJ.page == 4 then
                local _data = FuLiDaTingOBJ.getDropData()
                local maxPage = math.ceil(#FuLiDaTingOBJ.geRenShouBaoConfig/10)
                _Handle = GUI:GetWindow(_GUIHandle,"right")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign >= maxPage then
                            SL:ShowSystemTips("已经是最后一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign + 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end
                --
                _Handle = GUI:GetWindow(_GUIHandle,"left")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign <= 1 then
                            SL:ShowSystemTips("已经是第一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign - 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end

                _Handle = GUI:GetWindow(_GUIHandle,"page")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.sign.."/"..maxPage)
                end

                _Handle = GUI:GetWindow(_GUIHandle,"List")
                if _Handle then
                    GUI:removeAllChildren(_Handle)
                    SL:release_print("sss")
                end

                local flag = 0
                local txt = ""
                for i=1,10 do
                    flag = (FuLiDaTingOBJ.sign - 1)*10 + i
                    if flag <= #_data then
                        txt = _data[flag].name
                        local name = GUI:Text_Create(_Handle, "name_"..i, 118.00 , 270.00 - (i-1)*29, 16, "#3ffa00", txt)
                        GUI:setAnchorPoint(name, 0.50, 0.00)
                        GUI:setTouchEnabled(name, false)
                        GUI:setTag(name, 0)
                        --GUI:Text_enableOutline(name, "#3ffa00", 1)

                        -- Create Text_8
                        txt = _data[flag].give[1][2].._data[flag].give[1][1]
                        local reward = GUI:Text_Create(_Handle, "reward_"..i, 342.00 , 270.00 - (i-1)*29, 16, "#00faf2", FuLiDaTingOBJ.geRenShouBaoConfig[flag].give[1][2]..FuLiDaTingOBJ.geRenShouBaoConfig[flag].give[1][1])
                        GUI:setAnchorPoint(reward, 0.50, 0.00)
                        GUI:setTouchEnabled(reward, false)
                        GUI:setTag(reward, 0)
                        --GUI:Text_enableOutline(reward, "#fa003f", 1)

                        -- Create Text_8_1


                        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", _data[flag].name)
                        idx = tostring(idx)
                        txt = [[未领取]]
                        local color = "#ffffff"
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx] == 2 then
                            txt = [[已领取]]
                            color = "#fa0008"
                        end

                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx] ~= 1 then
                            local state = GUI:Text_Create(_Handle, "state_"..i, 516.00 , 270.00 - (i-1)*29, 16, color, txt)
                            GUI:setAnchorPoint(state, 0.50, 0.00)
                            GUI:setTouchEnabled(state, false)
                            GUI:setTag(state, 0)
                            GUI:Text_enableOutline(state, "#000000", 1)
                        else
                            local button = GUI:Button_Create(_Handle, "button"..i, 516.00, 280.00 - (i-1)*29, "res/custom/fulidating/4/button.png")
                            GUI:setAnchorPoint(button, 0.50, 0.50)
                            GUI:setTouchEnabled(button, true)
                            GUI:setTag(button, 0)
                            GUI:addOnClickEvent(button, function()
                                ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page,idx)
                            end )
                        end

                        --local state = GUI:Text_Create(_Handle, "state_"..i, 516.00 , 270.00 - (i-1)*29, 16, "#ffffff", [[未领取]])
                        --GUI:setAnchorPoint(state, 0.50, 0.00)
                        --GUI:setTouchEnabled(state, false)
                        --GUI:setTag(state, 0)
                        --GUI:Text_enableOutline(state, "#000000", 1)
                    end
                end
            elseif FuLiDaTingOBJ.page == 5 then
                local _data =FuLiDaTingOBJ.getKillData()
                local maxPage = math.ceil(#FuLiDaTingOBJ.shouShaConfig/10)
                SL:release_print(SL:JsonEncode(FuLiDaTingOBJ.data[FuLiDaTingOBJ.page]),FuLiDaTingOBJ.page)
                _Handle = GUI:GetWindow(_GUIHandle,"right")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign >= maxPage then
                            SL:ShowSystemTips("已经是最后一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign + 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end
                --
                _Handle = GUI:GetWindow(_GUIHandle,"left")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign <= 1 then
                            SL:ShowSystemTips("已经是第一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign - 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end

                _Handle = GUI:GetWindow(_GUIHandle,"page")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.sign.."/"..maxPage)
                end

                _Handle = GUI:GetWindow(_GUIHandle,"List")
                if _Handle then
                    GUI:removeAllChildren(_Handle)
                end

                local flag = 0
                local txt = ""
                for i=1,10 do
                    flag = (FuLiDaTingOBJ.sign - 1)*10 + i
                    if flag <= #_data then
                        txt = _data[flag].name
                        local name = GUI:Text_Create(_Handle, "name_"..i, 118.00 , 270.00 - (i-1)*29, 16, "#3ffa00", txt)
                        GUI:setAnchorPoint(name, 0.50, 0.00)
                        GUI:setTouchEnabled(name, false)
                        GUI:setTag(name, 0)
                        GUI:Text_enableOutline(name, "#000000", 1)

                        -- Create Text_8
                        txt = _data[flag].give[1][2].._data[flag].give[1][1]
                        local reward = GUI:Text_Create(_Handle, "reward_"..i, 342.00 , 270.00 - (i-1)*29, 16, "#00faf2", txt)
                        GUI:setAnchorPoint(reward, 0.50, 0.00)
                        GUI:setTouchEnabled(reward, false)
                        GUI:setTag(reward, 0)
                        GUI:Text_enableOutline(reward, "#000000", 1)
                        -- Create Text_8_1


                        local idx = _data[flag].id
                        idx = tostring(idx)
                        txt = [[未领取]]
                        local color = "#ffffff"
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx] == 2 then
                            txt = [[已领取]]
                            color = "#fa0008"
                        end
                        --SL:PrintTable(FuLiDaTingOBJ.data[FuLiDaTingOBJ.page])
                        --SL:release_print(idx)
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx] ~= 1 then
                            local state = GUI:Text_Create(_Handle, "state_"..i, 516.00 , 270.00 - (i-1)*29, 16, color, txt)
                            GUI:setAnchorPoint(state, 0.50, 0.00)
                            GUI:setTouchEnabled(state, false)
                            GUI:setTag(state, 0)
                            GUI:Text_enableOutline(state, "#000000", 1)
                        else
                            local button = GUI:Button_Create(_Handle, "button"..i, 516.00, 280.00 - (i-1)*29, "res/custom/fulidating/5/button.png")
                            GUI:setAnchorPoint(button, 0.50, 0.50)
                            GUI:setTouchEnabled(button, true)
                            GUI:setTag(button, 0)
                            GUI:addOnClickEvent(button, function()
                                ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page,idx)
                            end )
                        end
                    end
                end
            elseif FuLiDaTingOBJ.page == 6 then
                local maxPage = math.ceil(#FuLiDaTingOBJ.quanFuShouBaoConfig/5)

                _Handle = GUI:GetWindow(_GUIHandle,"right")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign >= maxPage then
                            SL:ShowSystemTips("已经是最后一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign + 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end

                _Handle = GUI:GetWindow(_GUIHandle,"left")
                if _Handle then
                    GUI:addOnClickEvent(_Handle, function()
                        if FuLiDaTingOBJ.sign <= 1 then
                            SL:ShowSystemTips("已经是第一页了！！！")
                            return ""
                        end
                        FuLiDaTingOBJ.sign = FuLiDaTingOBJ.sign - 1
                        FuLiDaTingOBJ:UpdateUI()
                    end )
                end

                _Handle = GUI:GetWindow(_GUIHandle,"page")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.sign.."/"..maxPage)
                end

                _Handle = GUI:GetWindow(_GUIHandle,"List")
                if _Handle then
                    GUI:removeAllChildren(_Handle)
                end
                local flag = 0
                for i=1,5 do
                    flag = (FuLiDaTingOBJ.sign - 1)*5 + i
                    if flag <= #FuLiDaTingOBJ.quanFuShouBaoConfig then
                        local txt = FuLiDaTingOBJ.quanFuShouBaoConfig[flag].name
                        local name = GUI:Text_Create(_Handle, "name_"..i, 118.00 , 255.00 - (i-1)*56, 16, "#3ffa00", txt)
                        GUI:setAnchorPoint(name, 0.50, 0.00)
                        GUI:setTouchEnabled(name, false)
                        GUI:setTag(name, 0)
                        GUI:Text_enableOutline(name, "#000000", 1)

                        -- Create Text_8
                        txt = FuLiDaTingOBJ.quanFuShouBaoConfig[flag].give[1][2]..FuLiDaTingOBJ.quanFuShouBaoConfig[flag].give[1][1]
                        local reward = GUI:Text_Create(_Handle, "reward_"..i, 342.00 , 255.00 - (i-1)*56, 16, "#00faf2", txt)
                        GUI:setAnchorPoint(reward, 0.50, 0.00)
                        GUI:setTouchEnabled(reward, false)
                        GUI:setTag(reward, 0)
                        GUI:Text_enableOutline(reward, "#000000", 1)
                        -- Create Text_8_1


                        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.quanFuShouBaoConfig[flag].name)
                        local color = "#ffffff"
                        idx = tostring(idx)
                        txt = [[未领取]]
                        --SL:release_print(idx,FuLiDaTingOBJ.quanFuShouBaoConfig[flag].name)
                        --SL:PrintTable(FuLiDaTingOBJ.data[FuLiDaTingOBJ.page])
                        if FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx] ~= nil then
                            txt = FuLiDaTingOBJ.data[FuLiDaTingOBJ.page][idx]
                            color = "#fa0008"
                        end

                        local state = GUI:Text_Create(_Handle, "state_"..i, 516.00 , 255.00 - (i-1)*56, 16, color, txt)
                        GUI:setAnchorPoint(state, 0.50, 0.00)
                        GUI:setTouchEnabled(state, false)
                        GUI:setTag(state, 0)
                        GUI:Text_enableOutline(state, "#000000", 1)
                    end
                end

            elseif FuLiDaTingOBJ.page == 7 then
                _Handle = GUI:GetWindow(_GUIHandle,"points")
                if _Handle then
                    GUI:Text_setString(_Handle, FuLiDaTingOBJ.data[FuLiDaTingOBJ.page])
                end

                _Handle = GUI:GetWindow(_GUIHandle,"button")
                if _Handle then
                    if redPoint[7] > 0 then
                        addRedPoint(_Handle,20,0)
                    else
                        delRedPoint(_Handle)
                    end

                    GUI:addOnClickEvent(_Handle, function()
                        ssrMessage:sendmsg(ssrNetMsgCfg.FuLiDaTing_Request,FuLiDaTingOBJ.page)
                    end )
                end

                _Handle = GUI:GetWindow(_GUIHandle,"item")
                if _Handle then
                    local item_data = {}
                    item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][1].award[1][1])
                    item_data.look  = true
                    item_data.bgVisible = false
                    item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][1].award[1][2]
                    item_data.color = 250
                    item_data.noMouseTips = false

                    GUI:ItemShow_updateItem(_Handle,item_data)
                end

                for i=1,#FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][1].show do
                    _Handle = GUI:GetWindow(_GUIHandle,"ItemShow_"..i)
                    if _Handle then
                        local item_data = {}
                        item_data.index = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][1].show[i][1])
                        item_data.look  = true
                        item_data.bgVisible = false
                        item_data.count =  FuLiDaTingOBJ.config[FuLiDaTingOBJ.page][1].show[i][2]
                        item_data.color = 250
                        item_data.noMouseTips = false

                        GUI:ItemShow_updateItem(_Handle,item_data)
                    end
                end
            end
        end
    end
end

function FuLiDaTingOBJ.getDropData()
    local data = {}
    local flag = 0
    local redPoint = 0
    for i=1,#FuLiDaTingOBJ.geRenShouBaoConfig do
        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.geRenShouBaoConfig[i].name)
        if FuLiDaTingOBJ.data[4][tostring(idx)] == 1 then
            flag = flag + 1
            redPoint = 1
            data[flag] = FuLiDaTingOBJ.geRenShouBaoConfig[i]
        end
    end

    for i=1,#FuLiDaTingOBJ.geRenShouBaoConfig do
        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.geRenShouBaoConfig[i].name)
        if FuLiDaTingOBJ.data[4][tostring(idx)] ~= 1  then
            flag = flag + 1
            data[flag] = FuLiDaTingOBJ.geRenShouBaoConfig[i]
        end
    end

    return data,redPoint
end

function FuLiDaTingOBJ.getKillData()
    local data = {}
    local flag = 0
    local redPoint = 0
    for i=1,#FuLiDaTingOBJ.shouShaConfig do
        local idx = FuLiDaTingOBJ.shouShaConfig[i].id
        if FuLiDaTingOBJ.data[5][tostring(idx)] == 1 then
            flag = flag + 1
            redPoint = 1
            data[flag] = FuLiDaTingOBJ.shouShaConfig[i]
        end
    end

    for i=1,#FuLiDaTingOBJ.shouShaConfig do
        local idx = FuLiDaTingOBJ.shouShaConfig[i].id
        if FuLiDaTingOBJ.data[5][tostring(idx)] ~= 1  then
            flag = flag + 1
            data[flag] = FuLiDaTingOBJ.shouShaConfig[i]
        end
    end

    return data,redPoint
end

function FuLiDaTingOBJ.getRedPoint()
    local data = {0,0,0,0,0,0,0}

    if FuLiDaTingOBJ.data[1][2] < #FuLiDaTingOBJ.config[1] then
        if FuLiDaTingOBJ.config[1][FuLiDaTingOBJ.data[1][2]+1].need <= FuLiDaTingOBJ.data[1][1] then
            data[1] = 1
        end
    end

    if FuLiDaTingOBJ.data[2][2] < #FuLiDaTingOBJ.config[2] then
        if FuLiDaTingOBJ.config[2][FuLiDaTingOBJ.data[2][2]+1].need <= FuLiDaTingOBJ.data[2][1] then
            data[2] = 1
        end
    end

    for i=1,#FuLiDaTingOBJ.config[3] do
        if type(FuLiDaTingOBJ.config[3][i].num) == "number" then
            if FuLiDaTingOBJ.data[3][2][i] == 0 then
                if FuLiDaTingOBJ.data[3][3][i] < FuLiDaTingOBJ.config[3][i].num then
                    if FuLiDaTingOBJ.data[3][1] >= FuLiDaTingOBJ.config[3][i].need then
                        data[3] = 1
                    end
                end
            end
        else
            if FuLiDaTingOBJ.data[3][2][i] == 0 then
                if FuLiDaTingOBJ.data[3][1] >= FuLiDaTingOBJ.config[3][i].need then
                    data[3] = 1
                end
            end
        end
    end

    for i=1,#FuLiDaTingOBJ.geRenShouBaoConfig do
        local idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", FuLiDaTingOBJ.geRenShouBaoConfig[i].name)
        if FuLiDaTingOBJ.data[4][tostring(idx)] == 1 then
            data[4] = 1
        end
    end

    for i=1,#FuLiDaTingOBJ.shouShaConfig do
        local idx = FuLiDaTingOBJ.shouShaConfig[i].id
        if FuLiDaTingOBJ.data[5][tostring(idx)] == 1 then
            data[5] = 1
        end
    end

    if FuLiDaTingOBJ.data[7] > FuLiDaTingOBJ.config[7][1].need then
        data[7] = 1
    end

    --SL:PrintTable(data)
    --addRedPoint(IconObj, 20, 0)
    return data
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FuLiDaTingOBJ:Submit1(arg1, arg2, arg3, data)
    FuLiDaTingOBJ.data = data
end

function FuLiDaTingOBJ:Submit2(arg1, arg2, arg3, data)
    FuLiDaTingOBJ.data[4] = data
end

function FuLiDaTingOBJ:Submit3(arg1, arg2, arg3, data)
    FuLiDaTingOBJ.data[5] = data
end

function FuLiDaTingOBJ:Update(arg1, arg2, arg3, data)
    FuLiDaTingOBJ:UpdateUI()
end

function FuLiDaTingOBJ:Request(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

return FuLiDaTingOBJ