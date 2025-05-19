FenJinShiZhuangHeOBJ = {}
FenJinShiZhuangHeOBJ.__cname = "FenJinShiZhuangHeOBJ"
--FenJinShiZhuangHeOBJ.config = ssrRequireCsvCfg("cfg_FenJinShiZhuangHe")


-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function FenJinShiZhuangHeOBJ:main(objcfg)
end

function FenJinShiZhuangHeOBJ:OpenUI(arg1, arg2, arg3, data)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true)
    GUI:LoadExport(parent, "A/FenJinShiZhuangHeUI")
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-30)
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

    local pickItem = nil
    for i, v in ipairs(data) do
        local ItemLayout = GUI:Layout_Create(self.ui.AllItemShow, "ItemLayout"..i, 0.00, 0.00, 60, 60, false)
        local Idx = SL:GetMetaValue("ITEM_INDEX_BY_NAME", v)
        local ItemShow = GUI:ItemShow_Create(ItemLayout, "ItemShow"..i, 14, 13, {index = Idx, count = 1, look = true, bgVisible = false})
        local Layout = GUI:Layout_Create(ItemLayout, "Layout"..i, 0.00, 0.00, 60, 60, false)
        GUI:setTouchEnabled(Layout, true)
        	--GUI:Layout_setBackGroundColorType(Layout, 1)
            --GUI:Layout_setBackGroundColor(Layout, "#00ff00")
        GUI:addOnClickEvent(Layout, function()
            local  allObj = GUI:getChildren(self.ui.AllItemShow)
            for j, k in ipairs(allObj) do
                local PickState = GUI:GetWindow(k, "Pick"..j)
                if PickState then
                    GUI:removeFromParent(PickState) --将传入控件从父节点上移除
                end
            end
            GUI:Image_Create(ItemLayout, "Pick"..i, -4.00, -3.00, "res/custom/fulidating/9/pick.png")
            pickItem = v
        end)
    end
    -- 自适应排列
    GUI:UserUILayout(self.ui.AllItemShow, {
        dir=3,
        colnum=4,
        addDir=1,
        gap = {y=23,x=34},
    })
    --通信后端
    GUI:addOnClickEvent(self.ui.Button_1, function()
        if pickItem == nil then
            sendmsg9("提示#251|:#255|请#250|选择后#249|再进行点击...#250|")
            return
        else
            ssrMessage:sendmsg(ssrNetMsgCfg.FenJinShiZhuangHe_Request,0,0,0,{pickItem})
            GUI:Win_Close(self._parent)
        end
    end)
end

function FenJinShiZhuangHeOBJ:UpdateUI()

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function FenJinShiZhuangHeOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return FenJinShiZhuangHeOBJ