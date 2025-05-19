KuaFuBuffOBJOBJ = {}
KuaFuBuffOBJOBJ.__cname = "KuaFuBuffOBJOBJ"
--KuaFuBuffOBJOBJ.config = ssrRequireCsvCfg("cfg_KuaFuBuffOBJ")
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function KuaFuBuffOBJOBJ:main()

end

function KuaFuBuffOBJOBJ:OpenUI(arg1, arg2, arg3, data)

end

function KuaFuBuffOBJOBJ:Request(data)
    SL:dump("123")
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
function KuaFuBuffOBJOBJ:SyncResponse(arg1, arg2, arg3, data)
    ssrMessage:sendmsg(ssrNetMsgCfg.KuaFuBuff_Request, arg1, arg2)
end
return KuaFuBuffOBJOBJ