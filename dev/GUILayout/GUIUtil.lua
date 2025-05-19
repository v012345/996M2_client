-- @file GUIUtil.lua
-- @description 游戏主入口
-- @author an
-- @email 490719516@qq.com
-- @version 1.0
-- @date 2024-05-10
function SLMainError(errinfo)
    if errinfo then
        SL:release_print("--------------------error-----------------------")
        SL:release_print("--------------------error-----------------------")
        SL:release_print("--------------------error-----------------------")
        SL:release_print("--------------------error-----------------------")
        SL:release_print(errinfo)
        SL:release_print("--------------------error-------------------------")
        SL:release_print("--------------------error-------------------------")
        SL:release_print("--------------------error-------------------------")
        SL:release_print("--------------------error-------------------------")
    end
end
local function init()
    --全局方法
    SL:Require("GUILayout/ssrgame/util/logger", true)                               --日志打印函数
    SL:Require("GUILayout/ssrgame/util/uiEx", true)                                 --ui扩展
    SL:Require("GUILayout/ssrgame/util/util", true)                                 --工具库
    json = SL:Require("GUILayout/ssrgame/util/json", true)                                 --工具库
    Player = SL:Require("GUILayout/ssrgame/util/Player", true)                      --个人一些操作
    --配置              
    ssrConstCfg = SL:Require("GUILayout/ssrgame/cfg/ConstCfg", true)                --常量配置
    ssrRTextCfg = SL:Require("GUILayout/ssrgame/cfg/RTextCfg", true)                --字符串配置
    --事件
    ssrEventCfg = SL:Require("GUILayout/ssrgame/cfg/EventCfg", true)                --事件配置
    ssrGameEvent = SL:Require("GUILayout/ssrgame/ui/GameEvent", true)               --事件管理器

    ssrNetMsgCfg = SL:Require("GUILayout/ssrgame/net/NetMsgCfg", true)              --网络消息配置
    ssrMessage = SL:Require("GUILayout/ssrgame/net/Message", true):Register()       --网络消息管理，并且注册所有消息

    ssrDataPlayer = SL:Require("GUILayout/ssrgame/ui/DataPlayer", true)             --个人全局数据

    ssrObjCfg = SL:Require("GUILayout/ssrgame/cfg/ObjCfg", true)                    --界面配置
    ssrDescCfg = SL:Require("GUILayout/ssrgame/cfg/DescCfg", true)
    ssrUIManager = SL:Require("GUILayout/ssrgame/ui/UIManager", true)               --UI管理
    cfg_Desc = ssrRequireCsvCfg("cfg_Desc")                                         --描述配置
    --初始化功能模块
    ssrUIManager:INIT()
end

local result, errinfo = pcall(init)
if not result then SLMainError(errinfo) end
-- -- --------------------------↓↓↓ 引擎事件 ↓↓↓--------------------------

--根据cfg_npc_open打开对应面板
local cfg_npc_open = ssrRequireCsvCfg("cfg_npc_open")
SL:RegisterLUAEvent(LUA_EVENT_TALKTONPC, "GUIUtil", function(data)
    local open_cfg = cfg_npc_open[data.index]
    if open_cfg then
        local _, objcfg = ssrUIManager:GETBYID(open_cfg.moduleid)
        if objcfg then
            objcfg["NPCID"] = data.index
            ssrUIManager:OPEN(objcfg)
        end
    end
end)

--小退释放
SL:RegisterLUAEvent(LUA_EVENT_LEAVE_WORLD, "GUIUtil", function()
    SL:Print("-小退释放缓存-")
    for k, _ in pairs(package.loaded) do
        if string.find(k, "^ssr/ssrgame/") or string.find(k, "GUILayout") or string.find(k, "GUIExport") then
            package.loaded[k] = nil
            _G[k] = nil
        end
    end
end)

local function reClientLua()
    --跨服中禁止记载。
    if SL:GetMetaValue("KFSTATE") then
        return
    end
    ssrMessage:sendmsg(ssrNetMsgCfg.sync)
    --关闭ui
    GUI:Win_CloseAll()
    for k, _ in pairs(package.loaded) do
        if string.find(k, "^ssr/ssrgame/") or string.find(k, "GUILayout") or string.find(k, "GUIExport") then
            package.loaded[k] = nil
            _G[k] = nil
        end
    end
    --重新启动
    SL:Require("GUILayout/GUIUtil", true)
    SL:Print("重载脚本...")
end

GUI:addKeyboardEvent({ "KEY_CTRL", "KEY_TAB" }, reClientLua)
SL:RegisterLUAEvent(LUA_EVENT_RICHTEXT_OPEN_URL, "GUIUtil", function(data)
    local result = string.gsub(data, "@", "")
    ssrUIManager:OPEN(ssrObjCfg[result])
end)



