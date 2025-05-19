local testOBJ = {}

testOBJ.__cname = "testOBJ"

function testOBJ:main()
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true,true,1)

    self._parent = parent
    GUI:LoadExport(parent, "A/testUI")
    self.ui = GUI:ui_delegate(parent)
    -- 屏幕适配
    ssrSetWidgetPosition(parent,self.ui.img_bg)

    --背景关闭
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        GUI:Win_Close(self._parent)
    end)
    --关闭按钮
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        GUI:Win_Close(self._parent)
    end)
    --测试网络消息
    GUI:addOnClickEvent(self.ui.Button_1, function()
        ssrMessage:sendmsg(ssrNetMsgCfg.test_Request)
    end)
    local function encrypt(plaintext, key)
        local magicPrefix = "flag|"
        local data = magicPrefix .. plaintext
        local klen = #key
        local result = {}
        for i = 1, #data do
            local c = data:byte(i)
            local k = key:byte(((i - 1) % klen) + 1)
            local e = bit.bxor(c, k)
            table.insert(result, string.format("%02X", e))
        end
        return table.concat(result)
    end
    --测试网络消息1
    GUI:addOnClickEvent(self.ui.Button_3, function()
        local n = 123456
        local key = ssrConstCfg.key
        ssrMessage:sendmsg(ssrNetMsgCfg.test_Request1,0,0,0,{encrypt(tostring(n), key)})
    end)

    --测试本地
    GUI:addOnClickEvent(self.ui.Button_2, function()
    end)
end

-- 打开面板
function testOBJ:OpenUI()

end
-------------------------网络消息---------------------------
--同步数据
function testOBJ:SyncResponse(arg1,arg2,arg3,data)
    self.testData = data

end

return testOBJ