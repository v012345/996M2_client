CuiPanGuanOBJ = {}
CuiPanGuanOBJ.__cname = "CuiPanGuanOBJ"
CuiPanGuanOBJ.config = ssrRequireCsvCfg("cfg_CuiPanGuan")
CuiPanGuanOBJ.config2 = ssrRequireCsvCfg("cfg_CuiPanGuan_config")
CuiPanGuanOBJ.cost = { {} }
CuiPanGuanOBJ.give = { {"生死簿",1} }
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function CuiPanGuanOBJ:main(objcfg)
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
        local data = {}
        data.str = "确定花费200灵符更改命格？"
        data.btnType = 2
        data.callback = function(atype, param)
            if atype == 1 then
                if self.data[1] == 1 then
                    local data1 = {}
                    data1.str = "当前命格是【天选之名】是否继续更改？"
                    data1.btnType = 2
                    data1.callback = function(atype1, param1)
                        if atype1 == 1 then
                            ssrMessage:sendmsg(ssrNetMsgCfg.CuiPanGuan_Request)
                        end
                    end
                    SL:OpenCommonTipsPop(data1)
                else
                   ssrMessage:sendmsg(ssrNetMsgCfg.CuiPanGuan_Request)
                end

            end
        end
        SL:OpenCommonTipsPop(data)
    end)
    ssrAddItemListX(self.ui.Panel_1,self.give,"item_")
    self:UpdateUI()
end

function CuiPanGuanOBJ:UpdateUI()
    local index = self.data[1] or 0
    local idx1 = self.data[2] or 0
    local idx2 = self.data[3] or 0
    local attrName1, attValue1, attrName2, attValue2
    local cfg1 = self.config[idx1]
    if cfg1 then
        attrName1 = cfg1.name
    else
        attrName1 = "未获得"
    end
    local cfg2 = self.config[idx2]
    if cfg2 then
        attrName2 = cfg2.name
    else
        attrName2 = "未获得"
    end
    local cfg = self.config2[index]
    if cfg then
        attValue1 = cfg.attrValue1
        attValue2 = cfg.attrValue2
    else
        attValue1 = ""
        attValue2 = ""
    end
    local symbol1,symbol2 = "",""
    if type(attValue1) == "number" then
        symbol1 = "+"
    end
    if type(attValue2) == "number" then
        symbol2 = "+"
    end
    GUI:Text_setString(self.ui.Text_1, string.format("%s：%s%s%%",attrName1,symbol1,attValue1))
    GUI:Text_setString(self.ui.Text_2, string.format("%s：%s%s%%",attrName2,symbol2,attValue2))
    GUI:Image_loadTexture(self.ui.Image_1,"res/custom/JuQing/CuiPanGuan/tips_".. index ..".png")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function CuiPanGuanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return CuiPanGuanOBJ