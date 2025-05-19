local ssrResponseCfg = {
    yes                                         = 0,
    no                                          = 1,
    
    not_item                                    = 101,      --%s不足
}

local Chinese = {
    [ssrResponseCfg.not_item]                   = '{"Msg":"<font color=\'#ff0000\'>%s不足</font>","Type":9}',
}

function ssrResponseCfg.get(code, ...)
    return string.format(Chinese[code], ...)
end

return ssrResponseCfg