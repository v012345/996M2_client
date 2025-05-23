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

--Create Panel_pre
local Panel_pre = ccui.Layout:create()
Panel_pre:ignoreContentAdaptWithSize(false)
Panel_pre:setClippingEnabled(false)
Panel_pre:setBackGroundColorOpacity(102)
Panel_pre:setTouchEnabled(true);
Panel_pre:setLayoutComponentEnabled(true)
Panel_pre:setName("Panel_pre")
Panel_pre:setTag(10)
Panel_pre:setCascadeColorEnabled(true)
Panel_pre:setCascadeOpacityEnabled(true)
Panel_pre:setVisible(true)
Panel_pre:setAnchorPoint(0.5000, 0.5000)
Panel_pre:setPosition(568.0000, 345.6000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_pre)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5400)
layout:setPercentWidth(0.7509)
layout:setPercentHeight(0.5781)
layout:setSize({width = 853.0000, height = 370.0000})
layout:setLeftMargin(141.5000)
layout:setRightMargin(141.5000)
layout:setTopMargin(109.4000)
layout:setBottomMargin(160.6000)
Scene:addChild(Panel_pre)

--Create PageView
local PageView = ccui.PageView:create()
PageView:ignoreContentAdaptWithSize(false)
PageView:setClippingEnabled(true)
PageView:setBackGroundColorOpacity(102)
PageView:setLayoutComponentEnabled(true)
PageView:setName("PageView")
PageView:setTag(7)
PageView:setCascadeColorEnabled(true)
PageView:setCascadeOpacityEnabled(true)
PageView:setAnchorPoint(0.5000, 0.5000)
PageView:setPosition(426.5000, 185.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(PageView)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.7667)
layout:setPercentHeight(1.0000)
layout:setSize({width = 654.0000, height = 370.0000})
layout:setLeftMargin(99.5000)
layout:setRightMargin(99.5000)
Panel_pre:addChild(PageView)

--Create Panel_point
local Panel_point = ccui.Layout:create()
Panel_point:ignoreContentAdaptWithSize(false)
Panel_point:setClippingEnabled(false)
Panel_point:setBackGroundColorOpacity(102)
Panel_point:setTouchEnabled(true);
Panel_point:setLayoutComponentEnabled(true)
Panel_point:setName("Panel_point")
Panel_point:setTag(9)
Panel_point:setCascadeColorEnabled(true)
Panel_point:setCascadeOpacityEnabled(true)
Panel_point:setPosition(226.0000, -6.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_point)
layout:setPositionPercentX(0.2723)
layout:setPositionPercentY(-0.0162)
layout:setPercentWidth(0.4819)
layout:setPercentHeight(0.0108)
layout:setSize({width = 400.0000, height = 4.0000})
layout:setLeftMargin(226.0000)
layout:setRightMargin(204.0000)
layout:setTopMargin(372.0000)
layout:setBottomMargin(-6.0000)
Panel_pre:addChild(Panel_point)


--Create Image_point
local Image_point = ccui.ImageView:create()
Image_point:ignoreContentAdaptWithSize(false)
Image_point:loadTexture("line_1.png",0)
Image_point:setLayoutComponentEnabled(true)
Image_point:setVisible(false)
Image_point:setName("Image_point")
Image_point:setTag(8)
Image_point:setCascadeColorEnabled(true)
Image_point:setCascadeOpacityEnabled(true)
Image_point:setAnchorPoint(0.5000, 0.5000)
Image_point:setPosition(426.0000, -2.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_point)
layout:setPositionPercentX(0.5133)
layout:setPositionPercentY(-0.0054)
layout:setPercentWidth(0.0964)
layout:setPercentHeight(0.0108)
layout:setSize({width = 74.0000, height = 4.0000})
layout:setLeftMargin(386.0000)
layout:setRightMargin(364.0000)
layout:setTopMargin(372.0000)
layout:setBottomMargin(-6.0000)
Panel_pre:addChild(Image_point)

--Create Item
local Item = ccui.ImageView:create()
Item:ignoreContentAdaptWithSize(false)
Item:loadTexture("Default/ImageFile.png",0)
Item:setLayoutComponentEnabled(true)
Item:setName("Item")
Item:setTag(12)
Item:setCascadeColorEnabled(true)
Item:setCascadeOpacityEnabled(true)
Item:setVisible(false)
layout = ccui.LayoutComponent:bindLayoutComponent(Item)
layout:setPercentWidth(0.0405)
layout:setPercentHeight(0.0719)
layout:setSize({width = 46.0000, height = 46.0000})
layout:setLeftMargin(-23.0000)
layout:setRightMargin(1113.0000)
layout:setTopMargin(617.0000)
layout:setBottomMargin(-23.0000)
Scene:addChild(Item)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

