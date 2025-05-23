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

--Create Panel_bottom_sui
local Panel_bottom_sui = ccui.Layout:create()
Panel_bottom_sui:ignoreContentAdaptWithSize(false)
Panel_bottom_sui:setClippingEnabled(false)
Panel_bottom_sui:setBackGroundColorOpacity(102)
Panel_bottom_sui:setLayoutComponentEnabled(true)
Panel_bottom_sui:setName("Panel_bottom_sui")
Panel_bottom_sui:setTag(48)
Panel_bottom_sui:setCascadeColorEnabled(true)
Panel_bottom_sui:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_bottom_sui)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_bottom_sui)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(49)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_bottom_sui:addChild(Node_lt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(50)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_bottom_sui:addChild(Node_rt)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(51)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_bottom_sui:addChild(Node_lb)

--Create Node_rb
local Node_rb=cc.Node:create()
Node_rb:setName("Node_rb")
Node_rb:setTag(59)
Node_rb:setCascadeColorEnabled(true)
Node_rb:setCascadeOpacityEnabled(true)
Node_rb:setPosition(1136.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rb)
layout:setPositionPercentX(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(1)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_bottom_sui:addChild(Node_rb)

--Create Panel_extra
local Panel_extra = ccui.Layout:create()
Panel_extra:ignoreContentAdaptWithSize(false)
Panel_extra:setClippingEnabled(false)
Panel_extra:setBackGroundColorOpacity(102)
Panel_extra:setLayoutComponentEnabled(true)
Panel_extra:setName("Panel_extra")
Panel_extra:setTag(103)
Panel_extra:setCascadeColorEnabled(true)
Panel_extra:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_extra)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_extra)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(104)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_extra:addChild(Node_lt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(111)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_extra:addChild(Node_rt)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(110)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_extra:addChild(Node_lb)

--Create Node_mt
local Node_mt=cc.Node:create()
Node_mt:setName("Node_mt")
Node_mt:setTag(64)
Node_mt:setCascadeColorEnabled(true)
Node_mt:setCascadeOpacityEnabled(true)
Node_mt:setPosition(568.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_mt)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setBottomMargin(640.0000)
Panel_extra:addChild(Node_mt)

--Create Panel_adapet
local Panel_adapet = ccui.Layout:create()
Panel_adapet:ignoreContentAdaptWithSize(false)
Panel_adapet:setClippingEnabled(false)
Panel_adapet:setBackGroundColorOpacity(102)
Panel_adapet:setLayoutComponentEnabled(true)
Panel_adapet:setName("Panel_adapet")
Panel_adapet:setTag(62)
Panel_adapet:setCascadeColorEnabled(true)
Panel_adapet:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_adapet)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_adapet)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(298)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_adapet:addChild(Node_lb)

--Create Node_mb
local Node_mb=cc.Node:create()
Node_mb:setName("Node_mb")
Node_mb:setTag(295)
Node_mb:setCascadeColorEnabled(true)
Node_mb:setCascadeOpacityEnabled(true)
Node_mb:setPosition(568.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_mb)
layout:setPositionPercentX(0.5000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(1)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setTopMargin(640.0000)
Panel_adapet:addChild(Node_mb)

--Create Node_rb
local Node_rb=cc.Node:create()
Node_rb:setName("Node_rb")
Node_rb:setTag(54)
Node_rb:setCascadeColorEnabled(true)
Node_rb:setCascadeOpacityEnabled(true)
Node_rb:setPosition(1136.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rb)
layout:setPositionPercentX(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(1)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_adapet:addChild(Node_rb)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(296)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_adapet:addChild(Node_lt)

--Create Node_mt
local Node_mt=cc.Node:create()
Node_mt:setName("Node_mt")
Node_mt:setTag(49)
Node_mt:setCascadeColorEnabled(true)
Node_mt:setCascadeOpacityEnabled(true)
Node_mt:setPosition(568.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_mt)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setBottomMargin(640.0000)
Panel_adapet:addChild(Node_mt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(297)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_adapet:addChild(Node_rt)

--Create Panel_sui
local Panel_sui = ccui.Layout:create()
Panel_sui:ignoreContentAdaptWithSize(false)
Panel_sui:setClippingEnabled(false)
Panel_sui:setBackGroundColorOpacity(102)
Panel_sui:setLayoutComponentEnabled(true)
Panel_sui:setName("Panel_sui")
Panel_sui:setTag(41)
Panel_sui:setCascadeColorEnabled(true)
Panel_sui:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_sui)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_sui)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(45)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_sui:addChild(Node_lt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(47)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_sui:addChild(Node_rt)

--Create Node_rb
local Node_rb=cc.Node:create()
Node_rb:setName("Node_rb")
Node_rb:setTag(44)
Node_rb:setCascadeColorEnabled(true)
Node_rb:setCascadeOpacityEnabled(true)
Node_rb:setPosition(1136.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rb)
layout:setPositionPercentX(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(1)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_sui:addChild(Node_rb)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(42)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_sui:addChild(Node_lb)

--Create Node_lm
local Node_lm=cc.Node:create()
Node_lm:setName("Node_lm")
Node_lm:setTag(68)
Node_lm:setCascadeColorEnabled(true)
Node_lm:setCascadeOpacityEnabled(true)
Node_lm:setPosition(0.0000, 320.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lm)
layout:setPositionPercentY(0.5000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(3)
layout:setRightMargin(1136.0000)
layout:setTopMargin(320.0000)
layout:setBottomMargin(320.0000)
Panel_sui:addChild(Node_lm)

--Create Node_tm
local Node_tm=cc.Node:create()
Node_tm:setName("Node_tm")
Node_tm:setTag(69)
Node_tm:setCascadeColorEnabled(true)
Node_tm:setCascadeOpacityEnabled(true)
Node_tm:setPosition(568.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_tm)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setBottomMargin(640.0000)
Panel_sui:addChild(Node_tm)

--Create Node_rm
local Node_rm=cc.Node:create()
Node_rm:setName("Node_rm")
Node_rm:setTag(70)
Node_rm:setCascadeColorEnabled(true)
Node_rm:setCascadeOpacityEnabled(true)
Node_rm:setPosition(1136.0000, 320.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rm)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(0.5000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(3)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(320.0000)
layout:setBottomMargin(320.0000)
Panel_sui:addChild(Node_rm)

--Create Node_bm
local Node_bm=cc.Node:create()
Node_bm:setName("Node_bm")
Node_bm:setTag(71)
Node_bm:setCascadeColorEnabled(true)
Node_bm:setCascadeOpacityEnabled(true)
Node_bm:setPosition(568.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_bm)
layout:setPositionPercentX(0.5000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(1)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setTopMargin(640.0000)
Panel_sui:addChild(Node_bm)

--Create Node_sui_bm
local Node_sui_bm=cc.Node:create()
Node_sui_bm:setName("Node_sui_bm")
Node_sui_bm:setTag(70)
Node_sui_bm:setCascadeColorEnabled(true)
Node_sui_bm:setCascadeOpacityEnabled(true)
Node_sui_bm:setPosition(568.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_sui_bm)
layout:setPositionPercentX(0.5000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(1)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setTopMargin(640.0000)
Scene:addChild(Node_sui_bm)

--Create Panel_top
local Panel_top = ccui.Layout:create()
Panel_top:ignoreContentAdaptWithSize(false)
Panel_top:setClippingEnabled(false)
Panel_top:setBackGroundColorOpacity(102)
Panel_top:setLayoutComponentEnabled(true)
Panel_top:setName("Panel_top")
Panel_top:setTag(487)
Panel_top:setCascadeColorEnabled(true)
Panel_top:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_top)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_top)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(488)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_top:addChild(Node_lt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(489)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_top:addChild(Node_rt)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(490)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_top:addChild(Node_lb)

--Create Node_mt
local Node_mt=cc.Node:create()
Node_mt:setName("Node_mt")
Node_mt:setTag(491)
Node_mt:setCascadeColorEnabled(true)
Node_mt:setCascadeOpacityEnabled(true)
Node_mt:setPosition(568.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_mt)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(3)
layout:setVerticalEdge(2)
layout:setLeftMargin(568.0000)
layout:setRightMargin(568.0000)
layout:setBottomMargin(640.0000)
Panel_top:addChild(Node_mt)

--Create Panel_top_sui
local Panel_top_sui = ccui.Layout:create()
Panel_top_sui:ignoreContentAdaptWithSize(false)
Panel_top_sui:setClippingEnabled(false)
Panel_top_sui:setBackGroundColorOpacity(102)
Panel_top_sui:setLayoutComponentEnabled(true)
Panel_top_sui:setName("Panel_top_sui")
Panel_top_sui:setTag(53)
Panel_top_sui:setCascadeColorEnabled(true)
Panel_top_sui:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_top_sui)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_top_sui)

--Create Node_lt
local Node_lt=cc.Node:create()
Node_lt:setName("Node_lt")
Node_lt:setTag(54)
Node_lt:setCascadeColorEnabled(true)
Node_lt:setCascadeOpacityEnabled(true)
Node_lt:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lt)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_top_sui:addChild(Node_lt)

--Create Node_rt
local Node_rt=cc.Node:create()
Node_rt:setName("Node_rt")
Node_rt:setTag(55)
Node_rt:setCascadeColorEnabled(true)
Node_rt:setCascadeOpacityEnabled(true)
Node_rt:setPosition(1136.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rt)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(2)
layout:setLeftMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_top_sui:addChild(Node_rt)

--Create Node_lb
local Node_lb=cc.Node:create()
Node_lb:setName("Node_lb")
Node_lb:setTag(56)
Node_lb:setCascadeColorEnabled(true)
Node_lb:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_lb)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(1)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_top_sui:addChild(Node_lb)

--Create Node_rb
local Node_rb=cc.Node:create()
Node_rb:setName("Node_rb")
Node_rb:setTag(58)
Node_rb:setCascadeColorEnabled(true)
Node_rb:setCascadeOpacityEnabled(true)
Node_rb:setPosition(1136.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_rb)
layout:setPositionPercentX(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(1)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_top_sui:addChild(Node_rb)

--Create Panel_chat
local Panel_chat = ccui.Layout:create()
Panel_chat:ignoreContentAdaptWithSize(false)
Panel_chat:setClippingEnabled(true)
Panel_chat:setBackGroundColorOpacity(102)
Panel_chat:setLayoutComponentEnabled(true)
Panel_chat:setName("Panel_chat")
Panel_chat:setTag(121)
Panel_chat:setCascadeColorEnabled(true)
Panel_chat:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_chat)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1136.0000, height = 640.0000})
layout:setStretchWidthEnabled(true)
layout:setStretchHeightEnabled(true)
Scene:addChild(Panel_chat)

--Create Node_chat_main
local Node_chat_main=cc.Node:create()
Node_chat_main:setName("Node_chat_main")
Node_chat_main:setTag(123)
Node_chat_main:setCascadeColorEnabled(true)
Node_chat_main:setCascadeOpacityEnabled(true)
Node_chat_main:setPosition(0.0000, 640.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_chat_main)
layout:setPositionPercentY(1.0000)
layout:setHorizontalEdge(1)
layout:setVerticalEdge(2)
layout:setRightMargin(1136.0000)
layout:setBottomMargin(640.0000)
Panel_chat:addChild(Node_chat_main)

--Create Node_chat_mini
local Node_chat_mini=cc.Node:create()
Node_chat_mini:setName("Node_chat_mini")
Node_chat_mini:setTag(21)
Node_chat_mini:setCascadeColorEnabled(true)
Node_chat_mini:setCascadeOpacityEnabled(true)
Node_chat_mini:setPosition(1136.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_chat_mini)
layout:setPositionPercentX(1.0000)
layout:setHorizontalEdge(2)
layout:setVerticalEdge(1)
layout:setLeftMargin(1136.0000)
layout:setTopMargin(640.0000)
Panel_chat:addChild(Node_chat_mini)

--Create Node_guide
local Node_guide=cc.Node:create()
Node_guide:setName("Node_guide")
Node_guide:setTag(62)
Node_guide:setCascadeColorEnabled(true)
Node_guide:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(Node_guide)
layout:setRightMargin(1136.0000)
layout:setTopMargin(640.0000)
Scene:addChild(Node_guide)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result

