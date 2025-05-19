local ssrUIManager = {}

local _layers

local function _get_objcfg_by_id(objid)
    for _, objcfg in pairs(ssrObjCfg) do
        if objcfg.ID == objid then
            return objcfg
        end
    end
end

function ssrUIManager:INIT()
    _layers = {}
    for objname, objcfg in pairs(ssrObjCfg) do
        if objcfg.OBJ_PATH and objcfg.ID then
            local obj
            --加载模块错误处理，防止模块内出错，影响其他模块执行！！！
            local status, result = pcall(function()
                obj = SL:Require(objcfg.OBJ_PATH,true)
            end)
            if not status then
                SL:release_print("----加载模块发生错误----")
                SL:release_print(result)
                SL:release_print("----加载模块发生错误----")
            end
            _layers[objcfg.ID] = obj
            --网络消息
            if objcfg.NET_MESSAGE then
                ssrMessage:RegisterNetMsg(objcfg.NET_MESSAGE, obj)
            end
        end

        if objcfg.OBJ_ORDER then
            for _,page_objcfg in ipairs(objcfg.OBJ_ORDER) do
                page_objcfg.PAGING_OBJ = objcfg
            end
        end
    end

    return self
end

function ssrUIManager:OPEN(objcfg, data, onClose)
    if type(objcfg) == "table" and _layers[objcfg.ID] then
        if onClose == true then
            if GUI:GetWindow(nil,_layers[objcfg.ID].__cname) then
                GUI:Win_CloseByID(_layers[objcfg.ID].__cname)
                return
            end
        end
        --有分页的情况
        local pageobj = objcfg.PAGING_OBJ
        if pageobj then
            --判断父窗口是否打开
            local pageui = GUI:GetWindow(nil,_layers[pageobj.ID].__cname)
            if pageui then
                --父窗口快速化
                local parent_ui = GUI:ui_delegate(pageui)
                --创建子页签
                _layers[objcfg.ID]:main(objcfg,data,parent_ui)
            else
                --未打开则去创建
                _layers[pageobj.ID]:main(pageobj,data,_layers[objcfg.ID],objcfg)
                return
            end
        else
            --没有分页的情况
           _layers[objcfg.ID]:main(objcfg,data)
        end
    else
        --未在OBJCfg中注册,尝试作为系统窗口打开
        SL:JumpTo(objcfg)
    end
end

function ssrUIManager:CLOSE(objcfg, data)
    if _layers[objcfg.ID] then
        if GUI:GetWindow(nil,_layers[objcfg.ID].__cname) then
            GUI:Win_CloseByID(_layers[objcfg.ID].__cname)
        end
    end
    return _layers[objcfg.ID]
end


function ssrUIManager:GET(objcfg)
    return _layers[objcfg.ID]
end

function ssrUIManager:GETBYID(objid)
    local objcfg = _get_objcfg_by_id(objid)
    return _layers[objid],objcfg
end

function ssrUIManager:OPENBYID(objid)
    local obj, objcfg = ssrUIManager:GETBYID(objid)
    ssrUIManager:OPEN(objcfg)
end

return ssrUIManager
