local CommonTipsLayer = class( "CommonTipsLayer", function()
    return cc.Layer:create()
end)

--[[
    data.btnType        --按钮类型 btnType=1:"确定" =2:{"确定","取消"} 
    data.str           --文本
    callback            --按钮回调 参数1:点击的按钮id 参数2:数据{editStr=输入框字符串}
    showEdit            --是否显示输入框
    editParams          --输入框参数 可以不传{inputMode, maxLength}
]]

local defaultSize = 16
local defaultColor = "#FFFFFF"
local richWidth = 400

function  CommonTipsLayer:ctor()
end

function CommonTipsLayer.create(noticeData)
    local layer = CommonTipsLayer.new()

    if layer:Init(noticeData) then
        return layer
    else
        return nil
    end
end

function CommonTipsLayer:Init(data)
    local visibleSize = cc.Director:getInstance():getVisibleSize()

    local layout = ccui.Layout:create()
    self:addChild(layout)
    layout:setBackGroundColor({r = 255, g = 255, b = 255})
    layout:setContentSize(visibleSize)
    layout:setTouchEnabled(true)
    layout:setPosition(0,0)

    --init bg
    self._panel = ccui.Layout:create()
    layout:addChild(self._panel)
    self._panel:setBackGroundImage("res/public/1900000600.png",0)
    self._panel:setContentSize({width=452, height=179})
    self._panel:setTouchEnabled(true)
    self._panel:setAnchorPoint(0.5, 0.5)
    self._panel:setPosition(visibleSize.width/2, visibleSize.height/2)

    return true
end

function CommonTipsLayer:SetLayerType(data)
    self._panel:removeAllChildren()
    self._data = self:setNewData(data)

    self:initStr(self._data)
    self:initBtn(self._data)
end

function CommonTipsLayer:setNewData( data )
    data.str = data.str
    if data.btnType == 1 then
        data.btnDesc = {"确认"}
    elseif data.btnType == 2 then
        data.btnDesc = {"确定", "取消"}
    end
    return data
end

function CommonTipsLayer:initStr(data)
    if not data.str then return end

    local text = ccui.Text:create()
    text:setString(data.str)
    text:setFontName("fonts/font.ttf")
    text:setFontSize(18)
    text:setAnchorPoint(0,1)
    text:setPosition(30, 160)
    self._panel:addChild(text)
end

function CommonTipsLayer:initBtn(data, touchCallBack)
    if not data.btnDesc then return end

    local function clickCallBack( tag )
        if data.callback ~= nil then
            data.callback(tag)
            global.L_CommonTipsManager:CloseLayer()
        end
    end

    local count = #data.btnDesc
    for i=1, count do
        local btn = ccui.Button:create()
        self._panel:addChild(btn)
        btn:loadTextureNormal("res/public/1900001022.png",0)
        btn:loadTexturePressed("res/public/1900001023.png",0)
        btn:setTitleFontName("fonts/font.ttf")
        btn:setTitleFontSize(18)
        btn:setTitleColor({r = 255, g = 255, b = 255})
        -- btn:setPositionX(390-(i-1)*110)
        btn:setPositionX(390-(count-i)*110)
        btn:setPositionY(40)
        btn:setTitleText(data.btnDesc[i])
        btn:addClickEventListener(function()
            clickCallBack(i)
        end)
    end
end

return CommonTipsLayer