ShenQiGeKuoZhanOBJ = {}
ShenQiGeKuoZhanOBJ.__cname = "ShenQiGeKuoZhanOBJ"
ShenQiGeKuoZhanOBJ.config = ssrRequireCsvCfg("cfg_ShenQiGeKuoZhan")
ShenQiGeKuoZhanOBJ.cost = {{}}
ShenQiGeKuoZhanOBJ.give = {{}}
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function ShenQiGeKuoZhanOBJ:main(objcfg)
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true, objcfg.NPCID)
    GUI:LoadExport(parent, objcfg.UI_PATH)
    self._parent = parent
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.ImageBG, 2,0)
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
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenQiGeKuoZhan_Request,1)
    end)
    GUI:addOnClickEvent(self.ui.Button_2, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.ShenQiGeKuoZhan_Request,2)
    end)
    self:ShowUI()
    self:UpdateUI()
end
function ShenQiGeKuoZhanOBJ:ShowUI()
    self.images = {}
    for i = 1, 10 do
        local Image = GUI:Image_Create(self.ui.Panel_1, "ImageBG"..i, 0, 0, "res/custom/ShenQiGeKuoZhan/lock.png")
        GUI:setTag(Image, i)
        table.insert(self.images,Image)
    end
    --排序
    GUI:UserUILayout(self.ui.Panel_1, {
        dir = 3,
        interval = 0,
        autosize = 1,
        gap = { x = 8, y = 8 },
        rownums = {5,2},
        sortfunc = function(lists)
            table.sort(lists, function(a, b)
                return GUI:getTag(a) < GUI:getTag(b)
            end)
        end
    })

end
function ShenQiGeKuoZhanOBJ:UpdateUI()
    local num = self.num + 1
    if num > 10 then
        num = 10
    end
    local cfg = self.config[num]
    showCost(self.ui.Panel_2,cfg.freeCost)
    showCost(self.ui.Panel_3,cfg.payCost)
    GUI:Text_setString(self.ui.Text_1,string.format("%s/10",self.num))
    for i = 1, self.num do
        GUI:Image_loadTexture(self.images[i],"res/custom/ShenQiGeKuoZhan/unlock.png")
    end
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function ShenQiGeKuoZhanOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.num = arg1
    if GUI:GetWindow(nil, self.__cname) then
        self:UpdateUI()
    end
end
return ShenQiGeKuoZhanOBJ