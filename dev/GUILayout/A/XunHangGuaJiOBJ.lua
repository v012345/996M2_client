XunHangGuaJiOBJ = {}
XunHangGuaJiOBJ.__cname = "XunHangGuaJiOBJ"
--XunHangGuaJiOBJ.config = ssrRequireCsvCfg("cfg_XunHangGuaJi")

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XunHangGuaJiOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-20)
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
    GUI:addOnClickEvent(self.ui.Button_record_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_RecordXunHang,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_record_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_RecordXunHang,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_record_3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_RecordXunHang,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_onOff1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OnAndOff,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_onOff2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OnAndOff,2)
    end)
    GUI:addOnClickEvent(self.ui.Button_onOff3, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_OnAndOff,3)
    end)
    GUI:addOnClickEvent(self.ui.Button_start, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XunHangGuaJi_StartGuaJi)
    end)
    -- 打开窗口缩放动画
    --GUI:Timeline_Window1(self._parent)
    self:UpdateUI()
end
--打开UI
function XunHangGuaJiOBJ:OpenUI(arg1, arg2, arg3, data)
    self.data = data
    ssrUIManager:OPENBYID(9200)
end
function XunHangGuaJiOBJ:UpdateUI()
    local status = self.data.status or 0
    local flag1 = self.data.flag[1] or 0
    local flag2 = self.data.flag[2] or 0
    local flag3 = self.data.flag[3] or 0
    local record1 = self.data.record[1] or {}
    local record2 = self.data.record[2] or {}
    local record3 = self.data.record[3] or {}
    local Button_record_1 = record1[2] ~= nil and "res/custom/XunHangGuaJi/del_map.png" or "res/custom/XunHangGuaJi/record_map.png"
    local Button_record_2 = record2[2] ~= nil and "res/custom/XunHangGuaJi/del_map.png" or "res/custom/XunHangGuaJi/record_map.png"
    local Button_record_3 = record3[2] ~= nil and "res/custom/XunHangGuaJi/del_map.png" or "res/custom/XunHangGuaJi/record_map.png"
    local Text_1 = record1[2] or ""
    local Text_2 = record2[2] or ""
    local Text_3 = record3[2] or ""
    GUI:Button_loadTextureNormal(self.ui.Button_record_1, Button_record_1)
    GUI:Button_loadTextureNormal(self.ui.Button_record_2, Button_record_2)
    GUI:Button_loadTextureNormal(self.ui.Button_record_3, Button_record_3)
    GUI:Text_setString(self.ui.Text_1, Text_1)
    GUI:Text_setString(self.ui.Text_2, Text_2)
    GUI:Text_setString(self.ui.Text_3, Text_3)

    local flag1_imagePath = flag1 == 0 and "res/custom/XunHangGuaJi/off.png" or "res/custom/XunHangGuaJi/on.png"
    local flag2_imagePath = flag2 == 0 and "res/custom/XunHangGuaJi/off.png" or "res/custom/XunHangGuaJi/on.png"
    local flag3_imagePath = flag3 == 0 and "res/custom/XunHangGuaJi/off.png" or "res/custom/XunHangGuaJi/on.png"
    GUI:Button_loadTextureNormal(self.ui.Button_onOff1, flag1_imagePath)
    GUI:Button_loadTextureNormal(self.ui.Button_onOff2, flag2_imagePath)
    GUI:Button_loadTextureNormal(self.ui.Button_onOff3, flag3_imagePath)
    local statusImgPath = status == 0 and "res/custom/XunHangGuaJi/startGuaJi.png" or "res/custom/XunHangGuaJi/stopGuaJi.png"
    GUI:Button_loadTextureNormal(self.ui.Button_start, statusImgPath)
end

----其他接口---
--获取挂机状态
function XunHangGuaJiOBJ:GetGuaJiStatus()
    return self.data.status or 0
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XunHangGuaJiOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    local status = self.data.status or 0
    local parent = GUI:Win_FindParent(107)
    local ui = GUI:ui_delegate(parent)
    --屏幕添加挂机巡航特效
    local _parent = GUI:Win_FindParent(108)
    local _ui = GUI:ui_delegate(_parent)
    if ui["xh"] then
        local imgPath = ""
        if status == 1 then
            imgPath = "res/custom/XunHangGuaJi/icon_2.png"

            --巡航按钮画圈圈
            GUI:removeAllChildren(ui["xh"])
            local Effect_xh = GUI:Effect_Create(ui["xh"], "Effect_xh", -16.00, 77.00, 0, 15250, 0, 0, 0, 4)
            GUI:setScaleX(Effect_xh, 0.7)
            GUI:setScaleY(Effect_xh, 0.7)

            if _ui["Effect_xhxs"] then
                GUI:removeFromParent(_ui["Effect_xhxs"]) --将传入控件从父节点上
            end
            GUI:Effect_Create(_parent, "Effect_xhxs", -135.00, 300.00, 0, 63020, 0, 0, 0, 4)

        else
            imgPath = "res/custom/XunHangGuaJi/icon_1.png"
            GUI:removeAllChildren(ui["xh"])

            local Effect_xhxs = GUI:getChildByName(_parent, "Effect_xhxs")
            if Effect_xhxs then
                GUI:removeFromParent(Effect_xhxs) --将控件从父节点上移除
            end
        end

        GUI:Button_loadTextureNormal(ui["xh"], imgPath)
    end
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XunHangGuaJiOBJ