
DiTuZhiYinOBJ = {}
DiTuZhiYinOBJ.__cname = "DiTuZhiYinOBJ"

-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function DiTuZhiYinOBJ:main(objcfg)
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
    --GUI:Timeline_Window1(self._parent)
    local Rtext = [[
        <font size='16' color='#00ff00'>【提示1:】</font> <font size='16' color='#c0c0c0'>来到天元大陆之后优先进入</font> <font size='16' color='#00ff00'>【<font size='16' color='#c0c0c0'>西海岸</font>】</font><font size='16' color='#c0c0c0'>， 此地图难度不高， 适合前期发育，有一定属性之后再去</font> <font size='16' color='#00ff00'>【<font size='16' color='#00ffff'>神龙帝国</font>】</font><font size='16' color='#c0c0c0'>打宝.</font>

        <font size='16' color='#00ff00'>【提示2:】</font> <font size='16' color='#c0c0c0'>有一定的能力之后尽快要前往</font> <font size='16' color='#00ff00'>【<font size='16' color='#00ffff'>遗忘大陆</font>】</font><font size='16' color='#c0c0c0'>， 在遗忘大陆内有非常多的</font> <font size='16' color='#00ff00'>【<font size='16' color='#c0c0c0'>新内容</font>】</font><font size='16' color='#c0c0c0'>前期强烈推荐！！！</font>

        <font size='16' color='#00ff00'>【提示3:】</font> <font size='16' color='#c0c0c0'>本服所有怪物均有概率爆出</font> <font size='16' color='#00ff00'>【<font size='16' color='#00ffff'>超神器，龍之魂器</font>】</font><font size='16' color='#c0c0c0'>， 怪物血量越多， 爆出的装备越好！每个</font> <font size='16' color='#00ff00'>【<font size='16' color='#c0c0c0'>噩梦级BOSS</font>】</font><font size='16' color='#c0c0c0'>都有自己独特的装备！</font>

    ]]
    local RText = GUI:RichText_Create(self.ui.Node, "RText", 18.00, -29.00, Rtext, 520, 12, "#ffffff", 2, nil, "fonts/font2.ttf")

end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------

return DiTuZhiYinOBJ
