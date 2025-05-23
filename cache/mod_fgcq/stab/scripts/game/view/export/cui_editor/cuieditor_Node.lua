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

--Create Scene
local Scene=cc.Node:create()
Scene:setName("Scene")

--Create Panel_1
local Panel_1 = ccui.Layout:create()
Panel_1:ignoreContentAdaptWithSize(false)
Panel_1:setClippingEnabled(false)
Panel_1:setBackGroundColorType(1)
Panel_1:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_1:setBackGroundColorOpacity(178)
Panel_1:setTouchEnabled(true);
Panel_1:setLayoutComponentEnabled(true)
Panel_1:setName("Panel_1")
Panel_1:setTag(81)
Panel_1:setCascadeColorEnabled(true)
Panel_1:setCascadeOpacityEnabled(true)
Panel_1:setPosition(0.0000, 4.6918)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_1)
layout:setPositionPercentY(0.0073)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setTopMargin(-4.6918)
layout:setBottomMargin(4.6918)
Scene:addChild(Panel_1)

--Create Panel_2
local Panel_2 = ccui.Layout:create()
Panel_2:ignoreContentAdaptWithSize(false)
Panel_2:setClippingEnabled(false)
Panel_2:setBackGroundColorType(1)
Panel_2:setBackGroundColor({r = 229, g = 229, b = 229})
Panel_2:setBackGroundColorOpacity(153)
Panel_2:setTouchEnabled(true);
Panel_2:setLayoutComponentEnabled(true)
Panel_2:setName("Panel_2")
Panel_2:setTag(72)
Panel_2:setCascadeColorEnabled(true)
Panel_2:setCascadeOpacityEnabled(true)
Panel_2:setAnchorPoint(0.5000, 0.5000)
Panel_2:setPosition(568.0000, 320.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.5282)
layout:setPercentHeight(0.6250)
layout:setSize({width = 600.0000, height = 400.0000})
layout:setLeftMargin(268.0000)
layout:setRightMargin(268.0000)
layout:setTopMargin(120.0000)
layout:setBottomMargin(120.0000)
Scene:addChild(Panel_2)

--Create Button_cancel
local Button_cancel = ccui.Button:create()
Button_cancel:ignoreContentAdaptWithSize(false)
Button_cancel:loadTextureNormal("Default/Button_Normal.png",0)
Button_cancel:loadTexturePressed("Default/Button_Press.png",0)
Button_cancel:loadTextureDisabled("Default/Button_Disable.png",0)
Button_cancel:setTitleFontSize(14)
Button_cancel:setTitleText("取消")
Button_cancel:setTitleColor({r = 65, g = 65, b = 70})
Button_cancel:setScale9Enabled(true)
Button_cancel:setCapInsets({x = 15, y = 11, width = 16, height = 14})
Button_cancel:setLayoutComponentEnabled(true)
Button_cancel:setName("Button_cancel")
Button_cancel:setTag(73)
Button_cancel:setCascadeColorEnabled(true)
Button_cancel:setCascadeOpacityEnabled(true)
Button_cancel:setPosition(180.0000, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_cancel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.3000)
layout:setPositionPercentY(0.0750)
layout:setPercentWidth(0.1333)
layout:setPercentHeight(0.0875)
layout:setSize({width = 80.0000, height = 35.0000})
layout:setLeftMargin(140.0000)
layout:setRightMargin(380.0000)
layout:setTopMargin(352.5000)
layout:setBottomMargin(12.5000)
Panel_2:addChild(Button_cancel)

--Create Button_submit
local Button_submit = ccui.Button:create()
Button_submit:ignoreContentAdaptWithSize(false)
Button_submit:loadTextureNormal("Default/Button_Normal.png",0)
Button_submit:loadTexturePressed("Default/Button_Press.png",0)
Button_submit:loadTextureDisabled("Default/Button_Disable.png",0)
Button_submit:setTitleFontSize(14)
Button_submit:setTitleText("提交")
Button_submit:setTitleColor({r = 65, g = 65, b = 70})
Button_submit:setScale9Enabled(true)
Button_submit:setCapInsets({x = 15, y = 11, width = 16, height = 14})
Button_submit:setLayoutComponentEnabled(true)
Button_submit:setName("Button_submit")
Button_submit:setTag(74)
Button_submit:setCascadeColorEnabled(true)
Button_submit:setCascadeOpacityEnabled(true)
Button_submit:setPosition(420.0000, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_submit)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.7000)
layout:setPositionPercentY(0.0750)
layout:setPercentWidth(0.1333)
layout:setPercentHeight(0.0875)
layout:setSize({width = 80.0000, height = 35.0000})
layout:setLeftMargin(380.0000)
layout:setRightMargin(140.0000)
layout:setTopMargin(352.5000)
layout:setBottomMargin(12.5000)
Panel_2:addChild(Button_submit)

--Create Panel_3
local Panel_3 = ccui.Layout:create()
Panel_3:ignoreContentAdaptWithSize(false)
Panel_3:setClippingEnabled(false)
Panel_3:setBackGroundColorType(1)
Panel_3:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_3:setBackGroundColorOpacity(102)
Panel_3:setTouchEnabled(true);
Panel_3:setLayoutComponentEnabled(true)
Panel_3:setName("Panel_3")
Panel_3:setTag(75)
Panel_3:setCascadeColorEnabled(true)
Panel_3:setCascadeOpacityEnabled(true)
Panel_3:setAnchorPoint(0.0000, 0.5000)
Panel_3:setPosition(5.0000, 380.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_3)
layout:setPositionPercentX(0.0083)
layout:setPositionPercentY(0.9500)
layout:setPercentWidth(0.7500)
layout:setPercentHeight(0.0725)
layout:setSize({width = 450.0000, height = 29.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(145.0000)
layout:setTopMargin(5.5000)
layout:setBottomMargin(365.5000)
Panel_2:addChild(Panel_3)

--Create Text_order
local Text_order = ccui.Text:create()
Text_order:ignoreContentAdaptWithSize(true)
Text_order:setTextAreaSize({width = 0, height = 0})
Text_order:setFontSize(16)
Text_order:setString([[相对父节点层级]])
Text_order:setLayoutComponentEnabled(true)
Text_order:setName("Text_order")
Text_order:setTag(76)
Text_order:setCascadeColorEnabled(true)
Text_order:setCascadeOpacityEnabled(true)
Text_order:setAnchorPoint(1.0000, 0.5000)
Text_order:setPosition(135.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_order)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.3000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2489)
layout:setPercentHeight(0.5517)
layout:setSize({width = 112.0000, height = 16.0000})
layout:setLeftMargin(23.0000)
layout:setRightMargin(315.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_3:addChild(Text_order)

--Create TextField_order
local TextField_order = ccui.TextField:create()
TextField_order:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_order:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_order:setFontSize(16)
TextField_order:setPlaceHolder("输入层级 （层级越大显示越在上层")
TextField_order:setString([[]])
TextField_order:setMaxLength(10)
TextField_order:setLayoutComponentEnabled(true)
TextField_order:setName("TextField_order")
TextField_order:setTag(77)
TextField_order:setCascadeColorEnabled(true)
TextField_order:setCascadeOpacityEnabled(true)
TextField_order:setAnchorPoint(0.0000, 0.5000)
TextField_order:setPosition(148.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_order)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.3289)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.6667)
layout:setPercentHeight(0.7931)
layout:setSize({width = 300.0000, height = 23.0000})
layout:setLeftMargin(148.0000)
layout:setRightMargin(2.0000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(3.0000)
Panel_3:addChild(TextField_order)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

