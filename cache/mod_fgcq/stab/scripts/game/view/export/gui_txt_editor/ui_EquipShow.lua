--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Node
local Node=cc.Node:create()
Node:setName("Node")

--Create ui_EquipShow
local ui_EquipShow = ccui.Layout:create()
ui_EquipShow:ignoreContentAdaptWithSize(false)
ui_EquipShow:setClippingEnabled(false)
ui_EquipShow:setBackGroundColorOpacity(102)
ui_EquipShow:setTouchEnabled(true);
ui_EquipShow:setLayoutComponentEnabled(true)
ui_EquipShow:setName("ui_EquipShow")
ui_EquipShow:setTag(2730)
ui_EquipShow:setCascadeColorEnabled(true)
ui_EquipShow:setCascadeOpacityEnabled(true)
ui_EquipShow:setAnchorPoint(0.0000, 1.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ui_EquipShow)
layout:setSize({width = 300.0000, height = 230.0000})
layout:setRightMargin(-300.0000)
layout:setBottomMargin(-230.0000)
Node:addChild(ui_EquipShow)

--Create a0
local a0 = ccui.Layout:create()
a0:ignoreContentAdaptWithSize(false)
a0:setClippingEnabled(false)
a0:setBackGroundColorOpacity(102)
a0:setLayoutComponentEnabled(true)
a0:setName("a0")
a0:setTag(208)
a0:setCascadeColorEnabled(true)
a0:setCascadeOpacityEnabled(true)
a0:setAnchorPoint(0.0000, 1.0000)
a0:setPosition(0.0000, 225.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a0)
layout:setPositionPercentY(0.9783)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(5.0000)
layout:setBottomMargin(205.0000)
ui_EquipShow:addChild(a0)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[装备位ID]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(209)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a0:addChild(Text_name)

--Create bg1
local bg1 = ccui.Layout:create()
bg1:ignoreContentAdaptWithSize(false)
bg1:setClippingEnabled(false)
bg1:setBackGroundColorType(1)
bg1:setBackGroundColor({r = 0, g = 0, b = 0})
bg1:setTouchEnabled(true);
bg1:setLayoutComponentEnabled(true)
bg1:setName("bg1")
bg1:setTag(210)
bg1:setCascadeColorEnabled(true)
bg1:setCascadeOpacityEnabled(true)
bg1:setAnchorPoint(0.0000, 0.5000)
bg1:setPosition(70.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bg1)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2333)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7500)
layout:setPercentHeight(1.0000)
layout:setSize({width = 225.0000, height = 20.0000})
layout:setLeftMargin(70.0000)
layout:setRightMargin(5.0000)
a0:addChild(bg1)

--Create TextField_EquipPos
local TextField_EquipPos = ccui.TextField:create()
TextField_EquipPos:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_EquipPos:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_EquipPos:setFontName("fonts/font.ttf")
TextField_EquipPos:setFontSize(14)
TextField_EquipPos:setPlaceHolder("1")
TextField_EquipPos:setString([[]])
TextField_EquipPos:setMaxLengthEnabled(true)
TextField_EquipPos:setMaxLength(10)
TextField_EquipPos:setLayoutComponentEnabled(true)
TextField_EquipPos:setName("TextField_EquipPos")
TextField_EquipPos:setTag(2733)
TextField_EquipPos:setCascadeColorEnabled(true)
TextField_EquipPos:setCascadeOpacityEnabled(true)
TextField_EquipPos:setAnchorPoint(0.0000, 0.5000)
TextField_EquipPos:setPosition(71.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_EquipPos)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2367)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7433)
layout:setPercentHeight(0.9000)
layout:setSize({width = 223.0000, height = 18.0000})
layout:setLeftMargin(71.0000)
layout:setRightMargin(6.0000)
layout:setTopMargin(1.0000)
layout:setBottomMargin(1.0000)
a0:addChild(TextField_EquipPos)

--Create a2
local a2 = ccui.Layout:create()
a2:ignoreContentAdaptWithSize(false)
a2:setClippingEnabled(false)
a2:setBackGroundColorOpacity(102)
a2:setLayoutComponentEnabled(true)
a2:setName("a2")
a2:setTag(2748)
a2:setCascadeColorEnabled(true)
a2:setCascadeOpacityEnabled(true)
a2:setAnchorPoint(0.0000, 1.0000)
a2:setPosition(0.0000, 199.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a2)
layout:setPositionPercentY(0.8652)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(31.0000)
layout:setBottomMargin(179.0000)
ui_EquipShow:addChild(a2)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[TIPS]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(2749)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0800)
layout:setPercentHeight(0.6000)
layout:setSize({width = 24.0000, height = 12.0000})
layout:setLeftMargin(41.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a2:addChild(Text_name)

--Create CheckBox_Equip_Look
local CheckBox_Equip_Look = ccui.CheckBox:create()
CheckBox_Equip_Look:ignoreContentAdaptWithSize(false)
CheckBox_Equip_Look:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_Look:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_Look:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_Look:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_Look:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_Look:setLayoutComponentEnabled(true)
CheckBox_Equip_Look:setName("CheckBox_Equip_Look")
CheckBox_Equip_Look:setTag(308)
CheckBox_Equip_Look:setCascadeColorEnabled(true)
CheckBox_Equip_Look:setCascadeOpacityEnabled(true)
CheckBox_Equip_Look:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_Look)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a2:addChild(CheckBox_Equip_Look)

--Create a3
local a3 = ccui.Layout:create()
a3:ignoreContentAdaptWithSize(false)
a3:setClippingEnabled(false)
a3:setBackGroundColorOpacity(102)
a3:setLayoutComponentEnabled(true)
a3:setName("a3")
a3:setTag(226)
a3:setCascadeColorEnabled(true)
a3:setCascadeOpacityEnabled(true)
a3:setAnchorPoint(0.0000, 1.0000)
a3:setPosition(0.0000, 175.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a3)
layout:setPositionPercentY(0.7609)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(55.0000)
layout:setBottomMargin(155.0000)
ui_EquipShow:addChild(a3)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[背景框]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(227)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1200)
layout:setPercentHeight(0.6000)
layout:setSize({width = 36.0000, height = 12.0000})
layout:setLeftMargin(29.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a3:addChild(Text_name)

--Create CheckBox_Equip_ShowBg
local CheckBox_Equip_ShowBg = ccui.CheckBox:create()
CheckBox_Equip_ShowBg:ignoreContentAdaptWithSize(false)
CheckBox_Equip_ShowBg:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_ShowBg:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_ShowBg:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_ShowBg:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_ShowBg:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_ShowBg:setLayoutComponentEnabled(true)
CheckBox_Equip_ShowBg:setName("CheckBox_Equip_ShowBg")
CheckBox_Equip_ShowBg:setTag(309)
CheckBox_Equip_ShowBg:setCascadeColorEnabled(true)
CheckBox_Equip_ShowBg:setCascadeOpacityEnabled(true)
CheckBox_Equip_ShowBg:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_ShowBg)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a3:addChild(CheckBox_Equip_ShowBg)

--Create a11
local a11 = ccui.Layout:create()
a11:ignoreContentAdaptWithSize(false)
a11:setClippingEnabled(false)
a11:setBackGroundColorOpacity(102)
a11:setLayoutComponentEnabled(true)
a11:setName("a11")
a11:setTag(279)
a11:setCascadeColorEnabled(true)
a11:setCascadeOpacityEnabled(true)
a11:setAnchorPoint(0.0000, 1.0000)
a11:setPosition(0.0000, 151.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a11)
layout:setPositionPercentY(0.6565)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(79.0000)
layout:setBottomMargin(131.0000)
ui_EquipShow:addChild(a11)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[星级]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(280)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0800)
layout:setPercentHeight(0.6000)
layout:setSize({width = 24.0000, height = 12.0000})
layout:setLeftMargin(41.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a11:addChild(Text_name)

--Create CheckBox_Equip_ShowStar
local CheckBox_Equip_ShowStar = ccui.CheckBox:create()
CheckBox_Equip_ShowStar:ignoreContentAdaptWithSize(false)
CheckBox_Equip_ShowStar:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_ShowStar:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_ShowStar:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_ShowStar:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_ShowStar:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_ShowStar:setLayoutComponentEnabled(true)
CheckBox_Equip_ShowStar:setName("CheckBox_Equip_ShowStar")
CheckBox_Equip_ShowStar:setTag(281)
CheckBox_Equip_ShowStar:setCascadeColorEnabled(true)
CheckBox_Equip_ShowStar:setCascadeOpacityEnabled(true)
CheckBox_Equip_ShowStar:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_ShowStar)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a11:addChild(CheckBox_Equip_ShowStar)

--Create a13
local a13 = ccui.Layout:create()
a13:ignoreContentAdaptWithSize(false)
a13:setClippingEnabled(false)
a13:setBackGroundColorOpacity(102)
a13:setLayoutComponentEnabled(true)
a13:setName("a13")
a13:setTag(306)
a13:setCascadeColorEnabled(true)
a13:setCascadeOpacityEnabled(true)
a13:setAnchorPoint(0.0000, 1.0000)
a13:setPosition(0.0000, 127.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a13)
layout:setPositionPercentY(0.5522)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(103.0000)
layout:setBottomMargin(107.0000)
ui_EquipShow:addChild(a13)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[自动更新]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(307)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a13:addChild(Text_name)

--Create CheckBox_Equip_autoUpdate
local CheckBox_Equip_autoUpdate = ccui.CheckBox:create()
CheckBox_Equip_autoUpdate:ignoreContentAdaptWithSize(false)
CheckBox_Equip_autoUpdate:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_autoUpdate:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_autoUpdate:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_autoUpdate:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_autoUpdate:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_autoUpdate:setLayoutComponentEnabled(true)
CheckBox_Equip_autoUpdate:setName("CheckBox_Equip_autoUpdate")
CheckBox_Equip_autoUpdate:setTag(308)
CheckBox_Equip_autoUpdate:setCascadeColorEnabled(true)
CheckBox_Equip_autoUpdate:setCascadeOpacityEnabled(true)
CheckBox_Equip_autoUpdate:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_autoUpdate)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a13:addChild(CheckBox_Equip_autoUpdate)

--Create a14
local a14 = ccui.Layout:create()
a14:ignoreContentAdaptWithSize(false)
a14:setClippingEnabled(false)
a14:setBackGroundColorOpacity(102)
a14:setLayoutComponentEnabled(true)
a14:setName("a14")
a14:setTag(309)
a14:setCascadeColorEnabled(true)
a14:setCascadeOpacityEnabled(true)
a14:setAnchorPoint(0.0000, 1.0000)
a14:setPosition(0.0000, 103.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a14)
layout:setPositionPercentY(0.4478)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(127.0000)
layout:setBottomMargin(83.0000)
ui_EquipShow:addChild(a14)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[是否英雄]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(310)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a14:addChild(Text_name)

--Create CheckBox_Equip_isHero
local CheckBox_Equip_isHero = ccui.CheckBox:create()
CheckBox_Equip_isHero:ignoreContentAdaptWithSize(false)
CheckBox_Equip_isHero:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_isHero:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_isHero:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_isHero:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_isHero:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_isHero:setLayoutComponentEnabled(true)
CheckBox_Equip_isHero:setName("CheckBox_Equip_isHero")
CheckBox_Equip_isHero:setTag(311)
CheckBox_Equip_isHero:setCascadeColorEnabled(true)
CheckBox_Equip_isHero:setCascadeOpacityEnabled(true)
CheckBox_Equip_isHero:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_isHero)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a14:addChild(CheckBox_Equip_isHero)

--Create a15
local a15 = ccui.Layout:create()
a15:ignoreContentAdaptWithSize(false)
a15:setClippingEnabled(false)
a15:setBackGroundColorOpacity(102)
a15:setLayoutComponentEnabled(true)
a15:setName("a15")
a15:setTag(89)
a15:setCascadeColorEnabled(true)
a15:setCascadeOpacityEnabled(true)
a15:setAnchorPoint(0.0000, 1.0000)
a15:setPosition(0.0000, 79.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a15)
layout:setPositionPercentY(0.3435)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(151.0000)
layout:setBottomMargin(59.0000)
ui_EquipShow:addChild(a15)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[双击脱下]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(90)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a15:addChild(Text_name)

--Create CheckBox_Equip_onDouble
local CheckBox_Equip_onDouble = ccui.CheckBox:create()
CheckBox_Equip_onDouble:ignoreContentAdaptWithSize(false)
CheckBox_Equip_onDouble:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_onDouble:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_onDouble:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_onDouble:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_onDouble:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_onDouble:setLayoutComponentEnabled(true)
CheckBox_Equip_onDouble:setName("CheckBox_Equip_onDouble")
CheckBox_Equip_onDouble:setTag(91)
CheckBox_Equip_onDouble:setCascadeColorEnabled(true)
CheckBox_Equip_onDouble:setCascadeOpacityEnabled(true)
CheckBox_Equip_onDouble:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_onDouble)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a15:addChild(CheckBox_Equip_onDouble)

--Create a16
local a16 = ccui.Layout:create()
a16:ignoreContentAdaptWithSize(false)
a16:setClippingEnabled(false)
a16:setBackGroundColorOpacity(102)
a16:setLayoutComponentEnabled(true)
a16:setName("a16")
a16:setTag(92)
a16:setCascadeColorEnabled(true)
a16:setCascadeOpacityEnabled(true)
a16:setAnchorPoint(0.0000, 1.0000)
a16:setPosition(0.0000, 55.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a16)
layout:setPositionPercentY(0.2391)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(175.0000)
layout:setBottomMargin(35.0000)
ui_EquipShow:addChild(a16)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[能否拖拽]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(93)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a16:addChild(Text_name)

--Create CheckBox_Equip_onMove
local CheckBox_Equip_onMove = ccui.CheckBox:create()
CheckBox_Equip_onMove:ignoreContentAdaptWithSize(false)
CheckBox_Equip_onMove:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_onMove:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_onMove:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_onMove:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_onMove:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_onMove:setLayoutComponentEnabled(true)
CheckBox_Equip_onMove:setName("CheckBox_Equip_onMove")
CheckBox_Equip_onMove:setTag(94)
CheckBox_Equip_onMove:setCascadeColorEnabled(true)
CheckBox_Equip_onMove:setCascadeOpacityEnabled(true)
CheckBox_Equip_onMove:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_onMove)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a16:addChild(CheckBox_Equip_onMove)

--Create a17
local a17 = ccui.Layout:create()
a17:ignoreContentAdaptWithSize(false)
a17:setClippingEnabled(false)
a17:setBackGroundColorOpacity(102)
a17:setLayoutComponentEnabled(true)
a17:setName("a17")
a17:setTag(49)
a17:setCascadeColorEnabled(true)
a17:setCascadeOpacityEnabled(true)
a17:setAnchorPoint(0.0000, 1.0000)
a17:setPosition(0.0000, 31.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(a17)
layout:setPositionPercentY(0.1348)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(0.0870)
layout:setSize({width = 300.0000, height = 20.0000})
layout:setTopMargin(199.0000)
layout:setBottomMargin(11.0000)
ui_EquipShow:addChild(a17)

--Create Text_name
local Text_name = ccui.Text:create()
Text_name:ignoreContentAdaptWithSize(true)
Text_name:setTextAreaSize({width = 0, height = 0})
Text_name:setFontSize(12)
Text_name:setString([[查看他人]])
Text_name:setLayoutComponentEnabled(true)
Text_name:setName("Text_name")
Text_name:setTag(50)
Text_name:setCascadeColorEnabled(true)
Text_name:setCascadeOpacityEnabled(true)
Text_name:setAnchorPoint(1.0000, 0.5000)
Text_name:setPosition(65.0000, 10.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_name)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.2167)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1600)
layout:setPercentHeight(0.6000)
layout:setSize({width = 48.0000, height = 12.0000})
layout:setLeftMargin(17.0000)
layout:setRightMargin(235.0000)
layout:setTopMargin(4.0000)
layout:setBottomMargin(4.0000)
a17:addChild(Text_name)

--Create CheckBox_Equip_lookPlayer
local CheckBox_Equip_lookPlayer = ccui.CheckBox:create()
CheckBox_Equip_lookPlayer:ignoreContentAdaptWithSize(false)
CheckBox_Equip_lookPlayer:loadTextureBackGround("res/public/1900000654.png",0)
CheckBox_Equip_lookPlayer:loadTextureBackGroundSelected("res/public/1900000655.png",0)
CheckBox_Equip_lookPlayer:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_Equip_lookPlayer:loadTextureFrontCross("res/public/1900000655.png",0)
CheckBox_Equip_lookPlayer:loadTextureFrontCrossDisabled("res/public/1900000654.png",0)
CheckBox_Equip_lookPlayer:setLayoutComponentEnabled(true)
CheckBox_Equip_lookPlayer:setName("CheckBox_Equip_lookPlayer")
CheckBox_Equip_lookPlayer:setTag(51)
CheckBox_Equip_lookPlayer:setCascadeColorEnabled(true)
CheckBox_Equip_lookPlayer:setCascadeOpacityEnabled(true)
CheckBox_Equip_lookPlayer:setPosition(77.0000, 10.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_Equip_lookPlayer)
layout:setPositionPercentX(0.2567)
layout:setPositionPercentY(0.5250)
layout:setPercentWidth(0.0533)
layout:setPercentHeight(0.8000)
layout:setSize({width = 16.0000, height = 16.0000})
layout:setLeftMargin(69.0000)
layout:setRightMargin(215.0000)
layout:setTopMargin(1.5000)
layout:setBottomMargin(2.5000)
a17:addChild(CheckBox_Equip_lookPlayer)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result

