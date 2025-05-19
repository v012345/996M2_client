ShuangJieHuoDongMainOBJ = {}
ShuangJieHuoDongMainOBJ.__cname = "ShuangJieHuoDongMainOBJ"
--配置信息
ShuangJieHuoDongMainOBJ.config = {
    [1] = { { "圣诞花环", 10 }, { "灵石", 10 }, { "绑定灵符", 100 }, { "元宝", 100000 }, { "混沌本源", 1 } },
    [2] = ssrRequireCsvCfg("cfg_ShuangJieFuLi"),
    [3] = ssrRequireCsvCfg("cfg_ShuangJieKuangHuan"),
    [4] = ssrRequireCsvCfg("cfg_ShuangJieShangCheng"),
}
ShuangJieHuoDongMainOBJ.cost = { {} }
ShuangJieHuoDongMainOBJ.give = { {} }
--子页面配置
ShuangJieHuoDongMainOBJ.subPage = {
    {
        ID = 1,
        UI_PATH = "ShuangJieHuoDong/ShuangJieHuoDongMain1UI",
    },
    {
        ID = 2,
        UI_PATH = "ShuangJieHuoDong/ShuangJieHuoDongMain2UI",
    },
    {
        ID = 3,
        UI_PATH = "ShuangJieHuoDong/ShuangJieHuoDongMain3UI",
    },
    {
        ID = 4,
        UI_PATH = "ShuangJieHuoDong/ShuangJieHuoDongMain4UI",
    },
    {
        ID = 5,
        UI_PATH = "ShuangJieHuoDong/ShuangJieHuoDongMain5UI",
    }
}
--引入子页面功能文件
ShuangJieHuoDongMainOBJ.subPageFunction = SL:Require("GUILayout/ShuangJieHuoDong/ShuangJieHuoDongMainSubPageFunctionOBJ",
    true)

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShuangJieHuoDongMainOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.ShuangJieHuoDongMain_OpenUI)
end

function ShuangJieHuoDongMainOBJ:OpenUI(arg1, arg2, arg3, data)
    self.data = data.data or {}
    self.leftDay = data.leftDays or 0
    local objcfg = self.objcfg
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
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self._parent)
    --网络消息示例

    self:InitButton(1)
    self:OpenSubPage(1, self.data[1], self.leftDay)
    GUI:Text_setString(self.ui.Text_2, self.leftDay.."天")
end

--初始化按钮
function ShuangJieHuoDongMainOBJ:InitButton()
    local btnList = GUI:getChildren(self.ui.Panel_1)
    for i, btn in ipairs(btnList) do
        GUI:addOnClickEvent(btn, function()
            self:OpenSubPage(i, self.data[i], self.leftDay)
        end)
    end
end

-- 打开子页面
function ShuangJieHuoDongMainOBJ:OpenSubPage(index, data, leftDay)
    self.subPageIndex = index
    data = data or {}
    --获取子页面
    local subPage = self.subPage[index]
    if not subPage then
        return
    end
    --设置按钮状态
    self:SetButtonState(index)
    local widget
    local obj = GUI:getChildByName(self.ui.Node_1, "widget_"..index)
    --不在重复创建 防止回弹
    if (GUI:Win_IsNotNull(obj) and index == 4) or (GUI:Win_IsNotNull(obj) and index == 2) then
        widget = obj
    else
        GUI:removeAllChildren(self.ui.Node_1)
        widget = GUI:Widget_Create(self.ui.Node_1, "widget_" .. index, 0, 0, 658, 448)
        GUI:LoadExport(widget, subPage.UI_PATH)
    end
    local ui = GUI:ui_delegate(widget)
    local func = self.subPageFunction[index]
    if func then
        func(ui, self.config[index], data, leftDay)
    end
end

--设置按钮状态
function ShuangJieHuoDongMainOBJ:SetButtonState(index)
    local btnList = GUI:getChildren(self.ui.Panel_1)
    for i, btn in ipairs(btnList) do
        local selected = GUI:getChildByName(btn, "Selected")
        if GUI:Win_IsNotNull(selected) then
            GUI:removeChildByName(btn, "Selected")
        end
        if i == index then
            GUI:Button_setBrightEx(btn, false)
            --创建选中图片
            GUI:Image_Create(btn, "Selected", 0.00, 0.00, "res/custom/ShuangJieHuoDongMain/selected.png")
        else
            GUI:Button_setBrightEx(btn, true)
        end
    end
end

function ShuangJieHuoDongMainOBJ:UpdateUI()
    self:OpenSubPage(self.subPageIndex, self.data[self.subPageIndex], self.leftDay)
    GUI:Text_setString(self.ui.Text_2, self.leftDay.."天")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShuangJieHuoDongMainOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data.data or {}
    self.leftDay = data.leftDays or 0
    self.lingQuNum = data.lingQuNum or 0
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShuangJieHuoDongMainOBJ
