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
Panel_1:setTag(92)
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
Panel_2:setTag(75)
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
Button_cancel:setTag(76)
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
Button_submit:setTag(77)
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
Panel_3:setTag(93)
Panel_3:setCascadeColorEnabled(true)
Panel_3:setCascadeOpacityEnabled(true)
Panel_3:setAnchorPoint(0.0000, 0.5000)
Panel_3:setPosition(5.0000, 380.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_3)
layout:setPositionPercentX(0.0083)
layout:setPositionPercentY(0.9500)
layout:setPercentWidth(0.9833)
layout:setPercentHeight(0.0725)
layout:setSize({width = 590.0000, height = 29.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(5.0000)
layout:setTopMargin(5.5000)
layout:setBottomMargin(365.5000)
Panel_2:addChild(Panel_3)

--Create Text_img
local Text_img = ccui.Text:create()
Text_img:ignoreContentAdaptWithSize(true)
Text_img:setTextAreaSize({width = 0, height = 0})
Text_img:setFontSize(16)
Text_img:setString([[图片]])
Text_img:setLayoutComponentEnabled(true)
Text_img:setName("Text_img")
Text_img:setTag(94)
Text_img:setCascadeColorEnabled(true)
Text_img:setCascadeOpacityEnabled(true)
Text_img:setAnchorPoint(1.0000, 0.5000)
Text_img:setPosition(90.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_img)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1525)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0542)
layout:setPercentHeight(0.5517)
layout:setSize({width = 32.0000, height = 16.0000})
layout:setLeftMargin(58.0000)
layout:setRightMargin(500.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_3:addChild(Text_img)

--Create TextField_img
local TextField_img = ccui.TextField:create()
TextField_img:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_img:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_img:setFontSize(16)
TextField_img:setPlaceHolder("输入图片途径")
TextField_img:setString([[]])
TextField_img:setMaxLength(10)
TextField_img:setLayoutComponentEnabled(true)
TextField_img:setName("TextField_img")
TextField_img:setTag(97)
TextField_img:setCascadeColorEnabled(true)
TextField_img:setCascadeOpacityEnabled(true)
TextField_img:setAnchorPoint(0.0000, 0.5000)
TextField_img:setPosition(100.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_img)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1695)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7627)
layout:setPercentHeight(0.7931)
layout:setSize({width = 450.0000, height = 23.0000})
layout:setLeftMargin(100.0000)
layout:setRightMargin(40.0000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(3.0000)
Panel_3:addChild(TextField_img)

--Create Button_N_Res
local Button_N_Res = ccui.Button:create()
Button_N_Res:ignoreContentAdaptWithSize(false)
Button_N_Res:loadTextureNormal("res/private/gui_edit/image_2.png",0)
Button_N_Res:setTitleFontSize(14)
Button_N_Res:setTitleColor({r = 65, g = 65, b = 70})
Button_N_Res:setScale9Enabled(true)
Button_N_Res:setCapInsets({x = 15, y = 6, width = 1, height = 8})
Button_N_Res:setLayoutComponentEnabled(true)
Button_N_Res:setName("Button_N_Res")
Button_N_Res:setTag(237)
Button_N_Res:setCascadeColorEnabled(true)
Button_N_Res:setCascadeOpacityEnabled(true)
Button_N_Res:setPosition(572.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_N_Res)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.9695)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0508)
layout:setPercentHeight(0.6897)
layout:setSize({width = 30.0000, height = 20.0000})
layout:setLeftMargin(557.0000)
layout:setRightMargin(3.0000)
layout:setTopMargin(4.5000)
layout:setBottomMargin(4.5000)
Panel_3:addChild(Button_N_Res)

--Create Panel_3_0
local Panel_3_0 = ccui.Layout:create()
Panel_3_0:ignoreContentAdaptWithSize(false)
Panel_3_0:setClippingEnabled(false)
Panel_3_0:setBackGroundColorType(1)
Panel_3_0:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_3_0:setBackGroundColorOpacity(102)
Panel_3_0:setTouchEnabled(true);
Panel_3_0:setLayoutComponentEnabled(true)
Panel_3_0:setName("Panel_3_0")
Panel_3_0:setTag(65)
Panel_3_0:setCascadeColorEnabled(true)
Panel_3_0:setCascadeOpacityEnabled(true)
Panel_3_0:setVisible(false)
Panel_3_0:setAnchorPoint(0.0000, 0.5000)
Panel_3_0:setPosition(3.0000, 350.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_3_0)
layout:setPositionPercentX(0.0050)
layout:setPositionPercentY(0.8750)
layout:setPercentWidth(0.5000)
layout:setPercentHeight(0.0725)
layout:setSize({width = 300.0000, height = 29.0000})
layout:setLeftMargin(3.0000)
layout:setRightMargin(297.0000)
layout:setTopMargin(35.5000)
layout:setBottomMargin(335.5000)
Panel_2:addChild(Panel_3_0)

--Create Text_img
local Text_img = ccui.Text:create()
Text_img:ignoreContentAdaptWithSize(true)
Text_img:setTextAreaSize({width = 0, height = 0})
Text_img:setFontSize(16)
Text_img:setString([[能否移动（背包gold) :]])
Text_img:setLayoutComponentEnabled(true)
Text_img:setName("Text_img")
Text_img:setTag(66)
Text_img:setCascadeColorEnabled(true)
Text_img:setCascadeOpacityEnabled(true)
Text_img:setAnchorPoint(0.0000, 0.5000)
Text_img:setPosition(10.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_img)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.0333)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.5600)
layout:setPercentHeight(0.5517)
layout:setSize({width = 168.0000, height = 16.0000})
layout:setLeftMargin(10.0000)
layout:setRightMargin(122.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_3_0:addChild(Text_img)

--Create CheckBox_movable
local CheckBox_movable = ccui.CheckBox:create()
CheckBox_movable:ignoreContentAdaptWithSize(false)
CheckBox_movable:loadTextureBackGround("Default/CheckBox_Normal.png",0)
CheckBox_movable:loadTextureBackGroundSelected("Default/CheckBox_Press.png",0)
CheckBox_movable:loadTextureBackGroundDisabled("Default/CheckBox_Disable.png",0)
CheckBox_movable:loadTextureFrontCross("Default/CheckBoxNode_Normal.png",0)
CheckBox_movable:loadTextureFrontCrossDisabled("Default/CheckBoxNode_Disable.png",0)
CheckBox_movable:setSelected(true)
CheckBox_movable:setLayoutComponentEnabled(true)
CheckBox_movable:setName("CheckBox_movable")
CheckBox_movable:setTag(64)
CheckBox_movable:setCascadeColorEnabled(true)
CheckBox_movable:setCascadeOpacityEnabled(true)
CheckBox_movable:setPosition(250.0000, 15.0000)
CheckBox_movable:setScaleX(0.5000)
CheckBox_movable:setScaleY(0.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(CheckBox_movable)
layout:setPositionPercentX(0.8333)
layout:setPositionPercentY(0.5172)
layout:setPercentWidth(0.1333)
layout:setPercentHeight(1.3793)
layout:setSize({width = 40.0000, height = 40.0000})
layout:setLeftMargin(230.0000)
layout:setRightMargin(30.0000)
layout:setTopMargin(-6.0000)
layout:setBottomMargin(-5.0000)
Panel_3_0:addChild(CheckBox_movable)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

