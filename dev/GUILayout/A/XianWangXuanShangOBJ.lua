XianWangXuanShangOBJ = {}
XianWangXuanShangOBJ.__cname = "XianWangXuanShangOBJ"
XianWangXuanShangOBJ.config = ssrRequireCsvCfg("cfg_XianWangXuanShang")
XianWangXuanShangOBJ.cost = {{}}
XianWangXuanShangOBJ.give = {{}}
--枚举图片
XianWangXuanShangOBJ.enumImg = {
    "res/custom/XianWangXuanShang/js.png",
    "res/custom/XianWangXuanShang/jx.png",
    "res/custom/XianWangXuanShang/lq.png",
    "res/custom/XianWangXuanShang/wc.png",
}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function XianWangXuanShangOBJ:main(objcfg)
    self.objcfg = objcfg
    ssrMessage:sendmsg(ssrNetMsgCfg.XianWangXuanShang_OpenUI)
end

function XianWangXuanShangOBJ:OpenUI(arg1,arg2,arg3,data)
    self.data = data
    objcfg = self.objcfg
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,-14)
    GUI:addOnClickEvent(self.ui.ImageBG, function()
        --ssrPrint("我是防点击穿透")
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    -- 打开窗口缩放动画
    GUI:Timeline_Window1(self.ui.ImageBG)
    --网络消息示例
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.XianWangXuanShang_Request)
    end)
    self.btnList = GUI:getChildren(self.ui.Node_1)
    self.TextList = GUI:getChildren(self.ui.Node_2)
    self:UpdateUI()
end


function XianWangXuanShangOBJ:UpdateUI()
    for i, v in ipairs(self.data or {}) do
        local btnObj = self.btnList[i]
        GUI:Button_loadTextureNormal(btnObj,self.enumImg[v.state+1])
        GUI:addOnClickEvent(btnObj, function()
            ssrMessage:sendmsg(ssrNetMsgCfg.XianWangXuanShang_Request, i)
        end)
        local textObj = self.TextList[i]
        GUI:Text_setString(textObj,string.format("(%d/%d)", v.num, v.max))
        local color = "#00FF00"
        if v.num >= v.max then
            color = "#00FF00"
        else
            color = "#FF0000"
        end
        GUI:Text_setTextColor(textObj, color)
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function XianWangXuanShangOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return XianWangXuanShangOBJ