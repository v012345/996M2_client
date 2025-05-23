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
Panel_1:setTag(367)
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
Panel_2:setTag(352)
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
Button_cancel:setTag(353)
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
Button_submit:setTitleText("转出")
Button_submit:setTitleColor({r = 65, g = 65, b = 70})
Button_submit:setScale9Enabled(true)
Button_submit:setCapInsets({x = 15, y = 11, width = 16, height = 14})
Button_submit:setLayoutComponentEnabled(true)
Button_submit:setName("Button_submit")
Button_submit:setTag(354)
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

--Create Panel_c1
local Panel_c1 = ccui.Layout:create()
Panel_c1:ignoreContentAdaptWithSize(false)
Panel_c1:setClippingEnabled(false)
Panel_c1:setBackGroundColorType(1)
Panel_c1:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_c1:setBackGroundColorOpacity(102)
Panel_c1:setTouchEnabled(true);
Panel_c1:setLayoutComponentEnabled(true)
Panel_c1:setName("Panel_c1")
Panel_c1:setTag(355)
Panel_c1:setCascadeColorEnabled(true)
Panel_c1:setCascadeOpacityEnabled(true)
Panel_c1:setAnchorPoint(0.0000, 0.5000)
Panel_c1:setPosition(5.0000, 380.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_c1)
layout:setPositionPercentX(0.0083)
layout:setPositionPercentY(0.9500)
layout:setPercentWidth(0.9833)
layout:setPercentHeight(0.0725)
layout:setSize({width = 590.0000, height = 29.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(5.0000)
layout:setTopMargin(5.5000)
layout:setBottomMargin(365.5000)
Panel_2:addChild(Panel_c1)

--Create Text_nimg
local Text_nimg = ccui.Text:create()
Text_nimg:ignoreContentAdaptWithSize(true)
Text_nimg:setTextAreaSize({width = 0, height = 0})
Text_nimg:setFontSize(16)
Text_nimg:setString([[转出文件名]])
Text_nimg:setLayoutComponentEnabled(true)
Text_nimg:setName("Text_nimg")
Text_nimg:setTag(356)
Text_nimg:setCascadeColorEnabled(true)
Text_nimg:setCascadeOpacityEnabled(true)
Text_nimg:setAnchorPoint(1.0000, 0.5000)
Text_nimg:setPosition(90.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_nimg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1525)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1356)
layout:setPercentHeight(0.5517)
layout:setSize({width = 80.0000, height = 16.0000})
layout:setLeftMargin(10.0000)
layout:setRightMargin(500.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_c1:addChild(Text_nimg)

--Create TextField_nimg
local TextField_nimg = ccui.TextField:create()
TextField_nimg:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_nimg:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_nimg:setFontName("fonts/font2.ttf")
TextField_nimg:setFontSize(16)
TextField_nimg:setPlaceHolder("输入文件名")
TextField_nimg:setString([[]])
TextField_nimg:setMaxLength(10)
TextField_nimg:setLayoutComponentEnabled(true)
TextField_nimg:setName("TextField_nimg")
TextField_nimg:setTag(357)
TextField_nimg:setCascadeColorEnabled(true)
TextField_nimg:setCascadeOpacityEnabled(true)
TextField_nimg:setAnchorPoint(0.0000, 0.5000)
TextField_nimg:setPosition(100.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_nimg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1695)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.8136)
layout:setPercentHeight(0.7931)
layout:setSize({width = 480.0000, height = 23.0000})
layout:setLeftMargin(100.0000)
layout:setRightMargin(10.0000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(3.0000)
Panel_c1:addChild(TextField_nimg)

--Create Panel_c2
local Panel_c2 = ccui.Layout:create()
Panel_c2:ignoreContentAdaptWithSize(false)
Panel_c2:setClippingEnabled(false)
Panel_c2:setBackGroundColorType(1)
Panel_c2:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_c2:setBackGroundColorOpacity(102)
Panel_c2:setTouchEnabled(true);
Panel_c2:setLayoutComponentEnabled(true)
Panel_c2:setName("Panel_c2")
Panel_c2:setTag(358)
Panel_c2:setCascadeColorEnabled(true)
Panel_c2:setCascadeOpacityEnabled(true)
Panel_c2:setVisible(false)
Panel_c2:setAnchorPoint(0.0000, 0.5000)
Panel_c2:setPosition(5.0000, 350.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_c2)
layout:setPositionPercentX(0.0083)
layout:setPositionPercentY(0.8750)
layout:setPercentWidth(0.9833)
layout:setPercentHeight(0.0725)
layout:setSize({width = 590.0000, height = 29.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(5.0000)
layout:setTopMargin(35.5000)
layout:setBottomMargin(335.5000)
Panel_2:addChild(Panel_c2)

--Create Text_pimg
local Text_pimg = ccui.Text:create()
Text_pimg:ignoreContentAdaptWithSize(true)
Text_pimg:setTextAreaSize({width = 0, height = 0})
Text_pimg:setFontSize(16)
Text_pimg:setString([[文件路径]])
Text_pimg:setLayoutComponentEnabled(true)
Text_pimg:setName("Text_pimg")
Text_pimg:setTag(359)
Text_pimg:setCascadeColorEnabled(true)
Text_pimg:setCascadeOpacityEnabled(true)
Text_pimg:setAnchorPoint(1.0000, 0.5000)
Text_pimg:setPosition(90.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_pimg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1525)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1085)
layout:setPercentHeight(0.5517)
layout:setSize({width = 64.0000, height = 16.0000})
layout:setLeftMargin(26.0000)
layout:setRightMargin(500.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_c2:addChild(Text_pimg)

--Create TextField_pimg
local TextField_pimg = ccui.TextField:create()
TextField_pimg:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_pimg:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_pimg:setFontName("fonts/font2.ttf")
TextField_pimg:setFontSize(16)
TextField_pimg:setPlaceHolder("dev/ssrExportFile")
TextField_pimg:setString([[]])
TextField_pimg:setMaxLength(10)
TextField_pimg:setLayoutComponentEnabled(true)
TextField_pimg:setName("TextField_pimg")
TextField_pimg:setTag(360)
TextField_pimg:setCascadeColorEnabled(true)
TextField_pimg:setCascadeOpacityEnabled(true)
TextField_pimg:setAnchorPoint(0.0000, 0.5000)
TextField_pimg:setPosition(100.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_pimg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1695)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.8136)
layout:setPercentHeight(0.7931)
layout:setSize({width = 480.0000, height = 23.0000})
layout:setLeftMargin(100.0000)
layout:setRightMargin(10.0000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(3.0000)
Panel_c2:addChild(TextField_pimg)

--Create Panel_c3
local Panel_c3 = ccui.Layout:create()
Panel_c3:ignoreContentAdaptWithSize(false)
Panel_c3:setClippingEnabled(false)
Panel_c3:setBackGroundColorType(1)
Panel_c3:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_c3:setBackGroundColorOpacity(102)
Panel_c3:setTouchEnabled(true);
Panel_c3:setLayoutComponentEnabled(true)
Panel_c3:setName("Panel_c3")
Panel_c3:setTag(361)
Panel_c3:setCascadeColorEnabled(true)
Panel_c3:setCascadeOpacityEnabled(true)
Panel_c3:setVisible(false)
Panel_c3:setAnchorPoint(0.0000, 0.5000)
Panel_c3:setPosition(5.0000, 320.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_c3)
layout:setPositionPercentX(0.0083)
layout:setPositionPercentY(0.8000)
layout:setPercentWidth(0.9833)
layout:setPercentHeight(0.0725)
layout:setSize({width = 590.0000, height = 29.0000})
layout:setLeftMargin(5.0000)
layout:setRightMargin(5.0000)
layout:setTopMargin(65.5000)
layout:setBottomMargin(305.5000)
Panel_2:addChild(Panel_c3)

--Create Text_default
local Text_default = ccui.Text:create()
Text_default:ignoreContentAdaptWithSize(true)
Text_default:setTextAreaSize({width = 0, height = 0})
Text_default:setFontSize(16)
Text_default:setString([[默认选择]])
Text_default:setLayoutComponentEnabled(true)
Text_default:setName("Text_default")
Text_default:setTag(362)
Text_default:setCascadeColorEnabled(true)
Text_default:setCascadeOpacityEnabled(true)
Text_default:setAnchorPoint(1.0000, 0.5000)
Text_default:setPosition(90.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_default)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1525)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1085)
layout:setPercentHeight(0.5517)
layout:setSize({width = 64.0000, height = 16.0000})
layout:setLeftMargin(26.0000)
layout:setRightMargin(500.0000)
layout:setTopMargin(6.5000)
layout:setBottomMargin(6.5000)
Panel_c3:addChild(Text_default)

--Create TextField_default
local TextField_default = ccui.TextField:create()
TextField_default:ignoreContentAdaptWithSize(false)
tolua.cast(TextField_default:getVirtualRenderer(), "cc.Label"):setLineBreakWithoutSpace(true)
TextField_default:setFontName("fonts/font2.ttf")
TextField_default:setFontSize(16)
TextField_default:setPlaceHolder("")
TextField_default:setString([[]])
TextField_default:setMaxLength(10)
TextField_default:setLayoutComponentEnabled(true)
TextField_default:setName("TextField_default")
TextField_default:setTag(363)
TextField_default:setCascadeColorEnabled(true)
TextField_default:setCascadeOpacityEnabled(true)
TextField_default:setAnchorPoint(0.0000, 0.5000)
TextField_default:setPosition(100.0000, 14.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(TextField_default)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.1695)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.8136)
layout:setPercentHeight(0.7931)
layout:setSize({width = 480.0000, height = 23.0000})
layout:setLeftMargin(100.0000)
layout:setRightMargin(10.0000)
layout:setTopMargin(3.0000)
layout:setBottomMargin(3.0000)
Panel_c3:addChild(TextField_default)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

