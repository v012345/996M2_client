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

--Create Image_arrow
local Image_arrow = ccui.ImageView:create()
Image_arrow:ignoreContentAdaptWithSize(false)
Image_arrow:loadTexture("res/private/guide/arrow_guide_1.png",0)
Image_arrow:setLayoutComponentEnabled(true)
Image_arrow:setName("Image_arrow")
Image_arrow:setTag(46)
Image_arrow:setCascadeColorEnabled(true)
Image_arrow:setCascadeOpacityEnabled(true)
Image_arrow:setPosition(16.4700, 0.0000)
Image_arrow:setRotationSkewX(180.0000)
Image_arrow:setRotationSkewY(180.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_arrow)
layout:setSize({width = 33.0000, height = 29.0000})
layout:setLeftMargin(-0.0300)
layout:setRightMargin(-32.9700)
layout:setTopMargin(-14.5000)
layout:setBottomMargin(-14.5000)
Node:addChild(Image_arrow)

--Create Image_desc
local Image_desc = ccui.ImageView:create()
Image_desc:ignoreContentAdaptWithSize(false)
Image_desc:loadTexture("res/private/guide/btn_guide_1.png",0)
Image_desc:setLayoutComponentEnabled(true)
Image_desc:setName("Image_desc")
Image_desc:setTag(45)
Image_desc:setCascadeColorEnabled(true)
Image_desc:setCascadeOpacityEnabled(true)
Image_desc:setPosition(110.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_desc)
layout:setSize({width = 167.0000, height = 66.0000})
layout:setLeftMargin(26.5000)
layout:setRightMargin(-193.5000)
layout:setTopMargin(-33.0000)
layout:setBottomMargin(-33.0000)
Node:addChild(Image_desc)

--Create Node_desc
local Node_desc=cc.Node:create()
Node_desc:setName("Node_desc")
Node_desc:setTag(44)
Node_desc:setCascadeColorEnabled(true)
Node_desc:setCascadeOpacityEnabled(true)
Node_desc:setPosition(110.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_desc)
layout:setLeftMargin(110.0000)
layout:setRightMargin(-110.0000)
Node:addChild(Node_desc)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result

