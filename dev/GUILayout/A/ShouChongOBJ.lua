local ShouChongOBJ = {}
ShouChongOBJ.__cname = "ShouChongOBJ"
--ShouChongOBJ.config = ssrRequireCsvCfg("cfg_ShouChong")
ShouChongOBJ.show1 = {{"金币",2000000},{"破碎的魔法阵",20},{"飓风之灵",1},{"牛马新星[称号]",1}}
ShouChongOBJ.show2 = {{"半月弯刀[技能]",1},{"智能挂机[自动]",1},{"天选之人[资格]",1}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShouChongOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0,-50)
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
    self:UpdateUI()
end

function ShouChongOBJ:OpenUI()
    SL:dump("asdasd")
    ssrUIManager:OPEN(ssrObjCfg.ShouChong)
end

--关闭界面
function ShouChongOBJ:CloseUI()
    if GUI:GetWindow(nil, self.__cname) then
        GUI:Win_Close(self._parent)
    end
end

function ShouChongOBJ:UpdateUI()
    ssrAddItemListX(self.ui.Layout1,self.show1,"show1",{spacing = 92, imgRes = ""})
    ssrAddItemListX(self.ui.Layout2,self.show2,"show2",{spacing = 92, imgRes = ""})
    GUI:addOnClickEvent(self.ui.ButtonGet, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShouChong_Request)
    end )
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShouChongOBJ:SyncResponse(arg1, arg2, arg3, data)
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end

function ShouChongOBJ:AddRedPoint(arg1, arg2, arg3, data)
    local TopIconNode_look = GUI:GetWindow(MainMiniMap._parent, "TopIconLayout")
    local TopIconNode = GUI:GetWindow(TopIconNode_look, "TopIconNode_1")
    local IconObj = GUI:GetWindow(TopIconNode, "113")
    if IconObj then
        delRedPoint(IconObj)
        if arg1 == 1 then
            SL:release_print("添加红点成功")
            addRedPoint(IconObj, 20, 0)
        end
    end
end

return ShouChongOBJ