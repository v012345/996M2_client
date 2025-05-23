--region *.lua
--Date
--此文件由[BabeLua]插件自动生成

local UTF8 = {}
--
-- lua
-- 判断utf8字符byte长度
-- 0xxxxxxx - 1 byte
-- 110yxxxx - 192, 2 byte
-- 1110yyyy - 225, 3 byte
-- 11110zzz - 240, 4 byte
local function chsize(char)
    if not char then
        print("not char")
        return 0
    elseif char > 240 then
        return 4
    elseif char > 225 then
        return 3
    elseif char > 192 then
        return 2
    else
        return 1
    end
end

-- 计算utf8字符串字符数, 各种字符都按一个字符计算
-- 例如utf8len("1你好") => 3
function UTF8:length(str)
    local len = 0
    local currentIndex = 1
    while currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + chsize(char)
        len = len +1
    end
    return len
end

-- 截取utf8 字符串
-- str:            要截取的字符串
-- startChar:    开始字符下标,从1开始
-- numChars:    要截取的字符长度
function UTF8:sub(str, startChar, numChars)
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + chsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        currentIndex = currentIndex + chsize(char)
        numChars = numChars -1
    end
    return str:sub(startIndex, currentIndex - 1)
end
--截取utf字符串 用于显示 中文算两个字符  英文算一个  例: 输入 哈哈 哈hh  hhhh
-- 2  哈 哈 hh  3:哈 哈h hhh  4: 哈哈  哈hh hhhh  
function UTF8:show_sub(str, startChar, numChars)
    local startIndex = 1
    while startChar > 1 do
        local char = string.byte(str, startIndex)
        startIndex = startIndex + chsize(char)
        startChar = startChar - 1
    end

    local currentIndex = startIndex

    while numChars > 0 and currentIndex <= #str do
        local char = string.byte(str, currentIndex)
        local len = chsize(char)
        if numChars >= 2 then 
            if len > 1 then 
                numChars = numChars - 2
            else 
                numChars = numChars - 1
            end
            currentIndex = currentIndex + len
        elseif numChars == 1 then 
            if len > 1 then 
                numChars = numChars - 2
            else 
                numChars = numChars - 1
                currentIndex = currentIndex + len
            end
        end
    end
    return str:sub(startIndex, currentIndex - 1)
end
return UTF8
--endregion
