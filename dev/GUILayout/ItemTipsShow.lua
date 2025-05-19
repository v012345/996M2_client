ItemTipsShow = {}
ItemTipsShow.config = ssrRequireCsvCfg("cfg_ItemTipsShow_Data")
function ssrGlobal_ItemTipsBasePanelEx( itemData, tips )
    local cfg = ItemTipsShow.config[itemData.Name]
    if not cfg then return end
    local efW = cfg.efW
    local efH = cfg.efH
    local offx = cfg.offx
    local offy = cfg.offy
    --local efW = 330
    --local efH = 560
    --local offx = 119
    --local offy = 1
    local PlayNum = 12
    if cfg.Type == 6  then
        PlayNum = 11
    end

    local ext = {
        speed = 5, --播放速度
        count = PlayNum, --播放张数
        loop  =  -1, --始终循环
        finishhide = 0 --不隐藏
    }
    local lujing = "tipsshow/"..cfg.Type.."/tx"
    local tipsWidth  = GUI:getContentSize(tips).width       --获取宽
    local tipsHeight  = GUI:getContentSize(tips).height     --获取高
    local frames = ssr.GUI:Frames_Create(tips, "Frames_"..math.random(0, 999999), 0, 0, lujing, ".png", nil, ext )  --设置序列帧

    ssr.GUI:setAnchorPoint(frames,-0.03, -0.15)  --设置序列帧 锚点
    ssr.GUI:setScaleX(frames,tipsWidth/efW)  --设置控件X轴方向缩放
    ssr.GUI:setScaleY(frames, tipsHeight/efH)  --设置控件Y轴方向缩放
    ssr.GUI:setPosition(frames,-5-offx*((tipsWidth/efH)), offy) -- 设置坐标
end
