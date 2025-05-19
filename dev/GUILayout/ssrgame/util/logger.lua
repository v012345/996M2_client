local logger = {}

-- if val of t has nil, table.concat will crushed.
local function concat(t) 
    local ret = ""
    for _, v in pairs(t) do
        if string.len(ret) == 0 then
            ret = tostring(v)
        else
            ret = ret .. " " .. tostring(v)
        end
    end
    return ret
end

local function timestamp()
    local t = os.date("*t")
    return string.format("[%04d-%02d-%02d %02d:%02d:%02d]",
        t.year, t.month, t.day, t.hour, t.min, t.sec)
end

local function src_line(debug_level)
    local info = debug.getinfo(debug_level)
    local filename = string.match(info.short_src, "[^/.]+.lua")
    return string.format("[%s:%d]", filename, info.currentline)
end

function ssrPrint(...)
   SL:Print(timestamp()..src_line(3).." "..concat({...}))
end

function ssrPrintf(fmt, ...)
    SL:Print(timestamp()..src_line(3).." "..string.format(tostring(fmt), ...))
end

return logger