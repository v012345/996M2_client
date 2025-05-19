local ssrNetMsgCfg = {}

local  cfg_ssrNetMsg = ssrRequireCsvCfg("cfg_ssrNetMsg") --绑定网络消息配置

for k, v in pairs(cfg_ssrNetMsg) do
    ssrNetMsgCfg[k] = v.value
end

local t = {}
for msgName,msgID in pairs(ssrNetMsgCfg) do
    t[msgName] = msgID
    t[msgID] = msgName
end
ssrNetMsgCfg = t
return ssrNetMsgCfg