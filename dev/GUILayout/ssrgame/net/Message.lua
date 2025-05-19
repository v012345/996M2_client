local ssrMessage = {}

local dispatch_handler = {}

local function _dispatchex(msgID, arg1, arg2, arg3, msgData)
    local msgName = ssrNetMsgCfg[msgID]
    if not msgName then
        ssrPrint("error: msgID:"..msgID.." not register!")
        return
    end
    --根据字符串“_”划分模块和方法
    local module, method = msgName:match "([^.]*)_(.*)"
    local target = dispatch_handler[module]
    if not target or not target[method] then return end
    target[method](target, arg1, arg2, arg3, msgData)
end

local function _dispatch(msgID, arg1, arg2, arg3, jsonstr)
    local msgData = jsonstr and SL:JsonDecode(jsonstr) or nil
    if ssrNetMsgCfg.sync == msgID then                  --一次性同步登录数据
        for _,v in ipairs(msgData or {}) do
            local id,arg1,arg2,arg3,data = v[1], v[2] or 0, v[3] or 0, v[4] or 0, v[5] or {}
            local jsonstr = SL:JsonEncode(data)
            --ssrPrint("一次性同步数据 net data: msgID="..id.."  data=", arg1, arg2, arg3, jsonstr)
            local result, errinfo = pcall(_dispatchex, id, arg1, arg2, arg3, data)
            if not result then
                local msgName = ssrNetMsgCfg[id]
                SL:Print("LUA ERROR: msgID="..id .."|msgName="..msgName, errinfo, debug.traceback())
            end
        end
    else
        --ssrPrint("同步数据 net data: msgID="..msgID.."  data=", arg1, arg2, arg3, jsonstr)
        _dispatchex(msgID, arg1, arg2, arg3, msgData)
    end
end
function ssrMessage:sendmsg(msgID, arg1, arg2, arg3, msgData)
    assert(msgID, "ssr sendmsg msgID is nil!")
    if msgData then msgData = SL:JsonEncode(msgData) end
    --ssrPrint("send net msgData:", ssrNetMsgCfg[msgID], msgID, arg1, arg2, arg3, msgData)
    SL:SendLuaNetMsg(msgID, arg1, arg2, arg3, msgData)
end

function ssrMessage:RegisterNetMsg(msgType, target)
    if dispatch_handler[msgType] then
        local objname = target.NAME or ""
        ssrPrint("网络消息类【"..msgType.."】已被【"..objname.."】注册")
        return
    end
    dispatch_handler[msgType] = target
end

function ssrMessage:Register()
    dispatch_handler = {}
    for msgID,msgName in pairs(ssrNetMsgCfg) do
        if type(msgID) == "number" and (not string.find(msgName, "Request")) then
            SL:RegisterLuaNetMsg(msgID, _dispatch)
        end
    end
    return ssrMessage
end

return ssrMessage