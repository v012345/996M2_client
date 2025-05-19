local ssrRTextCfg = {
    --Demo2转生
    [10000] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='18'>消耗：</font><font color='#4AE74A' size='18'>%s</font></outline>",
    [10001] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='18'>消耗：</font><font color='#FF0000' size='18'>%s</font></outline>",
    [10002] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='16'>人物</font><font color='#4AE74A' size='16'>%d</font><font color='#C0C0C0' size='16'>级，转生降</font><font color='#4AE74A' size='16'>%d</font><font color='#C0C0C0' size='16'>级</font></outline>",
    [10003] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='16'>人物</font><font color='#FF0000' size='16'>%d</font><font color='#C0C0C0' size='16'>级，转生降</font><font color='#FF0000' size='16'>%d</font><font color='#C0C0C0' size='16'>级</font></outline>",

    [20000] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='16'>%s</font><font color='#C0C0C0' size='16'>：</font><font color='#4AE74A' size='16'>%s</font></outline>",
    [20001] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='16'>%s</font><font color='#C0C0C0' size='16'>：</font><font color='#FF0000' size='16'>%s</font></outline>",
    [20002] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='18'>[</font><font color='#FF0000' size='18'>%s</font><font color='#C0C0C0' size='18'>]已满级</font></outline>",
    [20003] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='15'>%s</font><font color='#C0C0C0' size='15'>：</font><font color='#4AE74A' size='15'>%s</font></outline>",
    [20004] = "<outline color = '#000000' size = '1'><font color='#C0C0C0' size='15'>%s</font><font color='#C0C0C0' size='15'>：</font><font color='#FF0000' size='15'>%s</font></outline>",
    [20005] = "<outline color = '#000000' size = '1'><font color='#32CD32' size='20'>%s</font></outline>",
    [20006] = "<outline color = '#000000' size = '1'><font color='#00FFFF' size='16'>%s</font></outline>",
    [20007] = "<outline color = '#000000' size = '1'><font color='#4AE74A' size='16'>%s</font></outline>",
    [20008] = "<outline color = '#000000' size = '1'><font color='#FF0000' size='16'>%s</font></outline>",
}

function ssrRTextCfg.get(code, ...)
    return string.format(ssrRTextCfg[code], ...)
end

return ssrRTextCfg