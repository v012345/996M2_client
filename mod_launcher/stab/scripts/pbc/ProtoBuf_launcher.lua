
require("pbc/protobuf")
local pb = protobuf

local ProtoBuf = {}
ProtoBuf.registerPBT = {} -- 注册的pb
local LuaBridgeCtl = LuaBridgeCtl:Inst()

function ProtoBuf:registerPB(filePath)
    if not LuaBridgeCtl or LuaBridgeCtl:GetModulesSwitch( 17 ) ~= 1 then
        return
    end
    if not filePath then
        return
    end
    if ProtoBuf.registerPBT[filePath] then
        return ProtoBuf.registerPBT[filePath]
    end
    local pbFilePath = cc.FileUtils:getInstance():fullPathForFilename(filePath)
    if not cc.FileUtils:getInstance():isFileExist(pbFilePath) then
        releasePrint("protobuf register fail")
        return
    end
    local buffer = read_protobuf_file_c(pbFilePath)
    local pbdecode = pb.decode("google.protobuf.FileDescriptorSet" , buffer)
	if not pbdecode or not next(pbdecode) then
		releasePrint("protobuf register fail~")
        return
	end
    pb.register(buffer)
    ProtoBuf.registerPBT[filePath] = pbdecode
    return pbdecode
end

function ProtoBuf:encodePB(message, t , func , ...)
    if not LuaBridgeCtl or LuaBridgeCtl:GetModulesSwitch( 17 ) ~= 1 then
        return
    end
    return pb.encode(message, t , func , ...)
end

function ProtoBuf:decodePB(typename, buffer, length)
    if not LuaBridgeCtl or LuaBridgeCtl:GetModulesSwitch( 17 ) ~= 1 then
        return
    end
    return pb.decodeAll(typename, buffer, length)
end

return ProtoBuf