local NiuLeGeMaOBJ = {}

NiuLeGeMaOBJ.__cname = "NiuLeGeMaOBJ"

--定义块资源
NiuLeGeMaOBJ.blocks = {
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_1.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_2.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_3.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_4.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_5.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_6.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_7.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_8.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_9.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_10.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_11.png",
    "res/custom/ShuangJieHuoDongMain/NiuLeGeMa/icon_12.png",
}
--游戏配置
NiuLeGeMaOBJ.gameConfig = {
    randomBlocks = { 14, 14 }, --放到下面的
    levelBlockNum = 40,        --每层的块数
    levelNum = 8,              --层数
    slotNum = 7,               --槽数量

    composeNum = 3,            --合成数量
    typeNum = 12,              --类型数量
}

--每个格子的宽高，图标高度是56/3=18 覆盖下层图标三分之和三分只二
NiuLeGeMaOBJ.widthUnit = 18
NiuLeGeMaOBJ.heightUnit = 18

--操作历史
NiuLeGeMaOBJ.opHistory = {}

--已消除块数
NiuLeGeMaOBJ.clearBlockNum = 0


function NiuLeGeMaOBJ:main(objcfg)
    self.objcfg = objcfg
    self.blocksDataTable = {}
    self.gameTime = 0
    self:OpenUI()
end

--开始统计游戏时间
function NiuLeGeMaOBJ:startGameTime()
    GUI:Button_setBrightEx(self.ui.Button_shuffle, true)
    GUI:Text_setString(self.ui.Text_1, "游戏时间：")
    GUI:Text_setString(self.ui.Text_2, "1秒")
    GUI:schedule(self.ui.Layout, function()
        self.gameTime = self.gameTime + 1
        local timeStr = secondsToVariedChineseHMS(self.gameTime)
        GUI:Text_setString(self.ui.Text_2, timeStr)
    end, 1)
end
--响应网络消息后开始第二关
function NiuLeGeMaOBJ:Response(arg1, arg2, arg3, data)
    if arg2 == 0 then
        self.blocksData = data[1]
        self.totalBlockNum = arg1
        self:StartGame()
        return
    end
    table.insert(self.blocksDataTable, data[1])
    self.blocksData = table.concat(self.blocksDataTable)
    if #self.blocksDataTable > 1 then
        self.totalBlockNum = arg1
        self:StartGame()
    end
end

function NiuLeGeMaOBJ:OpenUI()
    --开始游戏
    local parent = GUI:Win_Create(self.__cname, 0, 0, 0, 0, false, false, true, true, true)
    self._parent = parent
    GUI:LoadExport(parent, self.objcfg.UI_PATH)
    self.ui = GUI:ui_delegate(parent)
    ssrSetWidgetPosition(parent, self.ui.img_bg)
    GUI:addOnClickEvent(self.ui.CloseLayout, function()
        self:messagebox("确定退出？退出后将重新开始", function()
            GUI:Win_Close(self._parent)
        end)
    end)
    GUI:addOnClickEvent(self.ui.CloseButton, function()
        self:messagebox("确定退出？退出后将重新开始", function()
            GUI:Win_Close(self._parent)
        end)
    end)

    GUI:addOnClickEvent(self.ui.Button_exit, function()
        self:messagebox("确定退出？退出后将重新开始", function()
            GUI:Win_Close(self._parent)
        end)
    end)

    --移出
    GUI:addOnClickEvent(self.ui.Button_remove, function()
        self:messagebox("从下放移出三个道具，并且每局游戏只有一次机会，确定继续？", function()
            self:doRemove()
        end)
    end)

    --打乱
    GUI:addOnClickEvent(self.ui.Button_shuffle, function()
        self:messagebox("打乱所有道具，需要20W元宝，确定继续？", function()
            ssrMessage:sendmsg(ssrNetMsgCfg.NiuLeGeMa_RequestDoShuffle)
        end)
    end)

    GUI:addOnClickEvent(self.ui.Button_back, function()
        self:messagebox("撤回上一次操作，并且每局游戏只有一次机会，确定继续？", function()
            self:doRevert()
        end)
    end)
    --默认禁用
    GUI:Button_setBrightEx(self.ui.Button_remove, false)
    GUI:Button_setBrightEx(self.ui.Button_back, false)
    GUI:Button_setBrightEx(self.ui.Button_shuffle, false)

    self:StartGameLevel1()
end

function NiuLeGeMaOBJ:StartGameLevel1()
    --是否撤回过
    self.isRemove = false
    --是否撤撤回过
    self.isBack = false
    --飞入完了才可继续点击
    self.noClicks = true
    self.slotImageList = {}
    --游戏状态0未开始，1进行中，2失败，3胜利
    self.gameStatus = 0
    --当前占用槽位
    self.currSlotNum = 0
    --已经清除的块数
    self.clearBlockNum = 0
    self.totalBlockNum = 18
    local gameData = {}
    for i = 1, 18 do
        table.insert(gameData, (i - 1) % 3 + 1)
    end
    for i = #gameData, 2, -1 do
        local j = math.random(i)
        gameData[i], gameData[j] = gameData[j], gameData[i]
    end
    self.level = 1
    local level1AllBlocks = {}
    for i = 1, 18 do
        local newBlock = {
            id = i - 1,         --ID
            status = 0,         --状态
            level = 0,          --层级
            type = gameData[i], --类型
            H = {},             --上面的块
            L = {}              --下面的块
        }
        table.insert(level1AllBlocks, newBlock)
    end
    local level1BlockX = 70
    local level1BlockY = 50
    for i = 1, 9 do
        level1AllBlocks[i].x = level1BlockX
        level1AllBlocks[i].y = level1BlockY
        level1AllBlocks[i].level = 1
        level1BlockX = level1BlockX + 160

        table.insert(level1AllBlocks[i].L, level1AllBlocks[i + 9])
        if i % 3 == 0 then
            level1BlockX = 70
            level1BlockY = level1BlockY + 100
        end
    end
    level1BlockX = 70
    level1BlockY = 16
    for i = 10, 18 do
        level1AllBlocks[i].x = level1BlockX
        level1AllBlocks[i].y = level1BlockY
        level1AllBlocks[i].level = 1
        level1BlockX = level1BlockX + 160
        table.insert(level1AllBlocks[i].H, level1AllBlocks[i - 9])
        if i % 3 == 0 then
            level1BlockX = 70
            level1BlockY = level1BlockY + 100
        end
    end

    self.levelBlocksVallevel1 = level1AllBlocks
    self.randomBlocksVal = {}

    --初始化槽位置
    self.slotAreaVal = {}
    for i = 1, self.gameConfig.slotNum do
        self.slotAreaVal[i] = nil
    end
    --添加到界面显示
    self:addBlocksToUI()
end

--开始游戏
function NiuLeGeMaOBJ:StartGame()
    self:startGameTime()
    self.level = 2
    --飞入完了才可继续点击
    self.noClicks = true
    self.slotImageList = {}
    --游戏状态0未开始，1进行中，2失败，3胜利
    self.gameStatus = 0
    --当前占用槽位
    self.currSlotNum = 0
    --已经清除的块数
    self.clearBlockNum = 0
    --初始化棋盘
    local boxWidthNum = 32
    local boxHeightNum = 22
    --初始化一个28*28的棋盘
    self.chessBoard = self:initChessBoard(boxWidthNum, boxHeightNum)
    --初始化块
    local blocksDataArr = SL:JsonDecode(self.blocksData)
    local levelBlocks = blocksDataArr.levelBlocks
    local randomBlocks = blocksDataArr.randomBlocks
    for i, v in ipairs(levelBlocks) do
        v.status = 0
        v.level = 0
        v.H = {}
        v.L = {}
    end

    for i, v in ipairs(randomBlocks) do
        for j, k in ipairs(v) do
            k.status = 0
            k.level = 0
            k.H = {}
            k.L = {}
            k.random = i
        end
    end

    for i, v in ipairs(levelBlocks) do
        table.insert(self.chessBoard[v.x][v.y].blocks, v)
        self:genLevelRelation(v)
    end

    self.levelBlocksVal = levelBlocks
    self.randomBlocksVal = randomBlocks

    --初始化槽位置
    self.slotAreaVal = {}
    for i = 1, self.gameConfig.slotNum do
        self.slotAreaVal[i] = nil
    end
    --添加到界面显示
    self:addBlocksToUI()
end

function NiuLeGeMaOBJ:genLevelRelation(block)
    -- 确定该块附近的格子坐标范围
    local boxWidthNum = 32
    local boxHeightNum = 30
    local minX = math.max(block.x - 2, 1)
    local minY = math.max(block.y - 2, 1)
    local maxX = math.min(block.x + 3, boxWidthNum - 2)
    local maxY = math.min(block.y + 3, boxWidthNum - 2)
    -- 遍历该块附近的格子
    local maxLevel = 0
    for i = minX, maxX - 1 do
        for j = minY, maxY - 1 do
            --如果找到了块
            local relationBlocks = self.chessBoard[i][j].blocks
            if #relationBlocks > 0 then
                local maxLevelRelationBlock = relationBlocks[#relationBlocks]
                if maxLevelRelationBlock.id ~= block.id then
                    maxLevel = math.max(maxLevel, maxLevelRelationBlock.level)
                    table.insert(block.H, maxLevelRelationBlock)
                    table.insert(maxLevelRelationBlock.L, block)
                end
            end
        end
    end
    -- 比最高层的块再高一层（初始为 1）
    block.level = maxLevel + 1
end

--界面添加逻辑
function NiuLeGeMaOBJ:addBlocksToUI()
    GUI:removeAllChildren(self.ui.Layout)
    if self.level == 1 then
        for idx, block in ipairs(self.levelBlocksVallevel1) do
            if block.status == 0 then
                local ImageView = GUI:Image_Create(self.ui.Layout, "ImageView" .. idx, 0.00, 0.00,
                    self.blocks[block.type])
                GUI:setPosition(ImageView, block.x, block.y)
                GUI:setLocalZOrder(ImageView, 100 + block.level)
                GUI:setTouchEnabled(ImageView, true)
                GUI:addOnClickEvent(ImageView, function(widget)
                    self:doClickBlock(widget, block)
                end)
                local isDisabled = #block.L > 0
                if isDisabled then
                    ImageView:setColor(cc.c3b(100, 100, 100))
                    --GUI:setOpacity(ImageView, 128)
                    GUI:setTouchEnabled(ImageView, false)
                end
            end
        end
    else
        --添加到界面上方
        for idx, block in ipairs(self.levelBlocksVal) do
            if block.status == 0 then
                local ImageView = GUI:Image_Create(self.ui.Layout, "ImageView" .. idx, 0.00, 0.00,
                    self.blocks[block.type])
                if block.isMove then
                    GUI:setPosition(ImageView, block.x, block.y)
                else
                    GUI:setPosition(ImageView, block.x * self.widthUnit, block.y * self.heightUnit)
                end

                GUI:setLocalZOrder(ImageView, 100 + block.level)
                GUI:setTouchEnabled(ImageView, true)
                GUI:addOnClickEvent(ImageView, function(widget)
                    self:doClickBlock(widget, block)
                end)
                local isDisabled = #block.L > 0
                if isDisabled then
                    ImageView:setColor(cc.c3b(100, 100, 100))
                    --GUI:setOpacity(ImageView, 128)
                    GUI:setTouchEnabled(ImageView, false)
                end
            end
        end
        --添加到界面下方左边
        if self.randomBlocksVal[1] == nil then
            return
        end
        if self.randomBlocksVal[2] == nil then
            return
        end
        --添加左边区域
        local L_x = 10
        for i, doClickBlock in ipairs(self.randomBlocksVal[1]) do
            local ImageView = GUI:Image_Create(self.ui.Layout, "ImageView_f" .. i, L_x, -46.00,
                self.blocks[doClickBlock.type])
            if i == #self.randomBlocksVal[1] then
                GUI:setTouchEnabled(ImageView, true)
                ImageView:setColor(cc.c3b(255, 255, 255))
                GUI:addOnClickEvent(ImageView, function(widget)
                    self:doClickBlock(widget, doClickBlock, i, 1)
                end)
            else
                ImageView:setColor(cc.c3b(100, 100, 100))
            end
            L_x = L_x + 5
        end
        --添加到界面下方右边
        local R_x = 442
        for i, doClickBlock in ipairs(self.randomBlocksVal[2]) do
            local ImageView = GUI:Image_Create(self.ui.Layout, "ImageView_r" .. i, R_x, -46.00,
                self.blocks[doClickBlock.type])
            if i == #self.randomBlocksVal[2] then
                GUI:setTouchEnabled(ImageView, true)
                ImageView:setColor(cc.c3b(255, 255, 255))
                GUI:addOnClickEvent(ImageView, function(widget)
                    self:doClickBlock(widget, doClickBlock, i, 2)
                end)
            else
                ImageView:setColor(cc.c3b(100, 100, 100))
            end
            R_x = R_x - 5
        end
    end
end

--定义棋盘格子
function NiuLeGeMaOBJ:initChessBoard(width, height)
    local chessBoard = {}
    for i = 1, width do
        chessBoard[i] = {}
        for j = 1, height do
            chessBoard[i][j] = {
                blocks = {}
            }
        end
    end
    return chessBoard
end

-- 点击块事件
--- @param block 块
--- @param randomIdx 随机区域下标，>= 0 表示点击的是随机块
--- @param force 强制移出
function NiuLeGeMaOBJ:doClickBlock(widget, block, randomIdx, leftOrRight, force)
    --动画完成才可点击
    if not self.noClicks then
        return
    end
    randomIdx = randomIdx or -1
    force = force or false
    leftOrRight = leftOrRight or 1

    --拒绝放置
    if self.currSlotNum >= self.gameConfig.slotNum or block.status ~= 0 or (#block.L > 0 and not force) then
        return
    end
    block.status = 1
    if randomIdx >= 0 then
        -- 移出所点击的随机区域的最后一个元素
        table.remove(self.randomBlocksVal[leftOrRight], #self.randomBlocksVal[leftOrRight])
    else
        -- 移出覆盖关系
        for _, higherThanBlock in ipairs(block.H) do
            for i, lowerThanBlock in ipairs(higherThanBlock.L) do
                if lowerThanBlock.id == block.id then
                    table.remove(higherThanBlock.L, i)
                    break
                end
            end
        end
    end
    -- 非随机区才可撤回
    table.insert(self.opHistory, block)
    -- 新元素加入插槽
    local tempSlotNum = self.currSlotNum

    --相同类型排序
    local isBlockHave = false
    if #self.slotAreaVal == 0 then
        self.slotAreaVal[tempSlotNum + 1] = block
    else
        for i, v in ipairs(self.slotAreaVal) do
            if block.type == v.type then
                table.insert(self.slotAreaVal, i, block)
                isBlockHave = true
                break
            end
        end
        if not isBlockHave then
            self.slotAreaVal[tempSlotNum + 1] = block
        end
    end


    -- 检查是否有可消除的
    -- block => 出现次数
    local map = {}
    -- 去除空槽
    local tempSlotAreaVal = {}
    for _, slotBlock in ipairs(self.slotAreaVal) do
        if slotBlock then
            table.insert(tempSlotAreaVal, slotBlock)
            local type = slotBlock.type
            map[type] = (map[type] or 0) + 1
        end
    end
    -- 得到新数组
    local newSlotAreaVal = {}
    tempSlotNum = 0
    for _, slotBlock in ipairs(tempSlotAreaVal) do
        -- 成功消除（不添加到新数组中）
        if map[slotBlock.type] >= self.gameConfig.composeNum then
            -- 块状态改为已消除
            slotBlock.status = 2
            -- 已消除块数 +1
            self.clearBlockNum = self.clearBlockNum + 1
            -- 清除操作记录，防止撤回
            self.opHistory = {}
        else
            newSlotAreaVal[tempSlotNum + 1] = slotBlock
            tempSlotNum = tempSlotNum + 1
        end
    end
    self.slotAreaVal = newSlotAreaVal
    self.currSlotNum = tempSlotNum

    if self.currSlotNum == 0 or self.isRemove then
        GUI:Button_setBrightEx(self.ui.Button_remove, false)
    elseif self.currSlotNum > 0 and not self.isRemove then
        GUI:Button_setBrightEx(self.ui.Button_remove, true)
    end

    if #self.opHistory == 0 or self.isBack then
        GUI:Button_setBrightEx(self.ui.Button_back, false)
    elseif #self.opHistory > 0 and not self.isBack then
        GUI:Button_setBrightEx(self.ui.Button_back, true)
    end

    -- 游戏结束
    if tempSlotNum >= self.gameConfig.slotNum then
        self.gameStatus = 2
        SL:ScheduleOnce(function()
            self:messagebox("你输了，是否重新开始？", function()
                GUI:unSchedule(self.ui.Layout)
                GUI:Win_Close(self._parent)
                ssrUIManager:OPEN(ssrObjCfg.NiuLeGeMa)
            end)
            GUI:Button_setBrightEx(self.ui.Button_remove, false)
            GUI:Button_setBrightEx(self.ui.Button_back, false)
            GUI:Button_setBrightEx(self.ui.Button_shuffle, false)
        end, 0.5)
    end
    if self.clearBlockNum >= self.totalBlockNum then
        self.gameStatus = 3
        SL:ScheduleOnce(function()
            if self.level == 1 then
                ssrMessage:sendmsg(ssrNetMsgCfg.NiuLeGeMa_Request)
            else
                --通关游戏
                GUI:unSchedule(self.ui.Layout)
                ssrMessage:sendmsg(ssrNetMsgCfg.NiuLeGeMa_RequestFinish,0,0,0,{self.gameTime})
            end
        end, 0.5)
    end

    local widgetPos = GUI:getWorldPosition(widget)
    GUI:setLocalZOrder(widget, 1000)
    GUI:setTouchEnabled(widget, false)
    GUI:setTag(widget, block.type)
    local targetPos = GUI:getWorldPosition(self.ui.Layout_1)

    GUI:removeFromParent(widget)
    GUI:addChild(self.ui.Layout_1, widget)
    GUI:setPosition(widget, widgetPos.x - targetPos.x, widgetPos.y - targetPos.y)
    self.noClicks = false
    local SlotImageX = self:getSlotImageX(widget)
    local value = {
        x = targetPos.x - widgetPos.x + SlotImageX,
        y = targetPos.y - widgetPos.y
    }
    local x = 0
    self.slotImageList = {}
    GUI:Timeline_MoveBy(widget, value, 0.2, function()
        GUI:removeAllChildren(self.ui.Layout_1)
        for index, slotBlock in ipairs(self.slotAreaVal) do
            local ImageView = GUI:Image_Create(self.ui.Layout_1, "ImageView_c" .. index, x, 0,
                self.blocks[slotBlock.type])
            GUI:setTag(ImageView, slotBlock.type)
            table.insert(self.slotImageList, ImageView)
            x = x + 56
        end
        self.noClicks = true
    end)
    self:addBlocksToUI()
end

--更新槽位
function NiuLeGeMaOBJ:UpdateSlot()
    self.slotImageList = {}
    GUI:removeAllChildren(self.ui.Layout_1)
    local x = 0
    for index, slotBlock in ipairs(self.slotAreaVal) do
        local ImageView = GUI:Image_Create(self.ui.Layout_1, "ImageView_c" .. index, x, 0, self.blocks[slotBlock.type])
        GUI:setTag(ImageView, slotBlock.type)
        table.insert(self.slotImageList, ImageView)
        x = x + 56
    end
end

--获取槽位块的的x坐标
function NiuLeGeMaOBJ:getSlotImageX(widget)
    if self.slotImageList == nil then
        return 0
    end
    local totalX = #self.slotImageList
    for i = #self.slotImageList, 1, -1 do
        if GUI:getTag(self.slotImageList[i]) == GUI:getTag(widget) then
            return i * 56
        end
    end
    return totalX * 56
end

--移出格子
function NiuLeGeMaOBJ:doRemove()
    if #self.slotAreaVal == 0 then
        SL:ShowSystemTips("没有道具可以移出")
        return
    end
    local removeNum = 0
    local removeBlockX = 167
    for i = 1, 3 do
        local block = self.slotAreaVal[i]
        if block then
            
            block.x = removeBlockX
            block.y = -46
            block.level = 10000
            block.status = 0
            block.H = {}
            block.L = {}
            block.isMove = true
            if block.random then
                -- 改变新块的坐标
                if self.level == 1 then
                    table.insert(self.levelBlocksVallevel1, block)
                else
                    table.insert(self.levelBlocksVal, block)
                end
            end
            block.random = nil
            removeNum = removeNum + 1
            removeBlockX = removeBlockX + 59
        end
    end
    for i = 1, removeNum do
        table.remove(self.slotAreaVal, 1)
    end
    self.currSlotNum = self.currSlotNum - removeNum

    self.isRemove = true
    GUI:Button_setBrightEx(self.ui.Button_remove, false)
    --更新界面
    self:addBlocksToUI()
    --更新槽位
    self:UpdateSlot()
end

function NiuLeGeMaOBJ:ResponseDoShuffle()
    self:doShuffle()
end
--打乱
function NiuLeGeMaOBJ:doShuffle()
    -- 遍历所有未消除的块
    local originBlocks = {}
    for _, block in ipairs(self.levelBlocksVal) do
        if block.status == 0 then
            table.insert(originBlocks, block)
        end
    end
    -- 打乱块的类型
    local newBlockTypes = {}
    for _, block in ipairs(originBlocks) do
        table.insert(newBlockTypes, block.type)
    end
    newBlockTypes = self:shuffleArray(newBlockTypes)
    -- 更新块的类型
    local pos = 1
    for _, block in ipairs(originBlocks) do
        block.type = newBlockTypes[pos]
        pos = pos + 1
    end
    --是否被打乱过
    -- self.isShuffle = true
    --更新界面
    self:addBlocksToUI()
    --更新槽位
    --self:UpdateSlot()
end

function NiuLeGeMaOBJ:doRevert()
    if self.level == 1 then
        SL:ShowSystemTips("第一关不可撤回")
        return
    end
    if #self.opHistory < 1 then
        SL:ShowSystemTips("没有撤回的道具")
        return
    end
    GUI:Button_setBrightEx(self.ui.Button_back, false)
    local id = 0
    local getId = 0
    local block = self.opHistory[#self.opHistory]
    block.status = 0
    id = block.id
    getId = self:findSlotAreaValById(id)
    if getId == nil then
        return
    end

    if block.random then
        table.insert(self.randomBlocksVal[block.random], block)
    else
        self:genLevelRelation(self.slotAreaVal[getId])
    end

    table.remove(self.slotAreaVal, getId)
    self.currSlotNum = self.currSlotNum - 1

    self.isBack = true
    --更新界面
    self:addBlocksToUI()
    --更新槽位
    self:UpdateSlot()
end

function NiuLeGeMaOBJ:findSlotAreaValById(id)
    for i, v in ipairs(self.slotAreaVal) do
        if v.id == id then
            return i
        end
    end
    return nil
end

function NiuLeGeMaOBJ:shuffleArray(arr)
    local n = #arr
    for i = 1, n do
        local j = math.random(i, n)
        arr[i], arr[j] = arr[j], arr[i]
    end
    return arr
end

function NiuLeGeMaOBJ:messagebox(message, action)
    if GUI:GetWindow(self.ui.img_bg, "Layout_msg_bg") ~= nil then return end

    local Layout = GUI:Layout_Create(self.ui.img_bg, "Layout_msg_bg", -300, -300, ssrConstCfg.width + 500,
        ssrConstCfg.width + 500, false)
    GUI:Layout_setBackGroundColorType(Layout, 1)
    GUI:Layout_setBackGroundColor(Layout, "#100808")
    GUI:Layout_setBackGroundColorOpacity(Layout, 150)
    GUI:setTouchEnabled(Layout, true)
    GUI:addOnClickEvent(Layout, function()
        return
    end)
    -- Create ImageView
    local ImageView_msg_bg = GUI:Image_Create(Layout, "ImageView_msg_bg", 477.00, 573.00, "res/public/1900000600.png")
    GUI:Image_setScale9Slice(ImageView_msg_bg, 10, 10, 10, 10)
    GUI:setContentSize(ImageView_msg_bg, 550, 176)
    GUI:setIgnoreContentAdaptWithSize(ImageView_msg_bg, false)
    GUI:setTouchEnabled(ImageView_msg_bg, false)

    -- Create Text
    local Text = GUI:Text_Create(ImageView_msg_bg, "Text", 42.00, 131.00, 16, "#ffffff", [[]])
    GUI:setTouchEnabled(Text, false)
    GUI:Text_enableOutline(Text, "#000000", 1)
    GUI:Text_setString(Text, message)

    -- Create Button_msg1
    local Button_msg1 = GUI:Button_Create(ImageView_msg_bg, "Button_msg1", 103.00, 27.00, "res/public/1900001022.png")
    GUI:Button_loadTexturePressed(Button_msg1, "res/public/1900001023.png")
    GUI:Button_setTitleText(Button_msg1, "确定")
    GUI:Button_setTitleColor(Button_msg1, "#fffbf0")
    GUI:Button_setTitleFontSize(Button_msg1, 18)
    GUI:Button_titleEnableOutline(Button_msg1, "#000000", 1)
    GUI:Win_SetParam(Button_msg1, { grey = 1 }, "Button")
    GUI:setTouchEnabled(Button_msg1, true)

    -- Create Button_msg2
    local Button_msg2 = GUI:Button_Create(ImageView_msg_bg, "Button_msg2", 353.00, 28.00, "res/public/1900001022.png")
    GUI:Button_loadTexturePressed(Button_msg2, "res/public/1900001023.png")
    GUI:Button_setTitleText(Button_msg2, "取消")
    GUI:Button_setTitleColor(Button_msg2, "#fffbf0")
    GUI:Button_setTitleFontSize(Button_msg2, 18)
    GUI:Button_titleEnableOutline(Button_msg2, "#000000", 1)
    GUI:Win_SetParam(Button_msg2, { grey = 1 }, "Button")
    GUI:setTouchEnabled(Button_msg2, true)

    -- Create Layout_msg_close
    local Layout_msg_close = GUI:Layout_Create(ImageView_msg_bg, "Layout_msg_close", 520.00, 127.00, 80.00, 80.00, false)
    GUI:setTouchEnabled(Layout_msg_close, true)

    -- Create Button_msg_close
    local Button_msg_close = GUI:Button_Create(Layout_msg_close, "Button_msg_close", 29.00, 7.00,
        "res/public/1900000510.png")
    GUI:Button_loadTexturePressed(Button_msg_close, "res/public/1900000511.png")
    GUI:Button_loadTextureDisabled(Button_msg_close, "res/private/gui_edit/Button_Disable.png")
    GUI:Button_setTitleText(Button_msg_close, "")
    GUI:Button_setTitleColor(Button_msg_close, "#ffffff")
    GUI:Button_setTitleFontSize(Button_msg_close, 14)
    GUI:Button_titleEnableOutline(Button_msg_close, "#000000", 1)
    GUI:Win_SetParam(Button_msg_close, { grey = 1 }, "Button")
    GUI:setTouchEnabled(Button_msg_close, true)

    GUI:addOnClickEvent(Button_msg1, function()
        GUI:removeFromParent(Layout)
        if action then
            action()
        end
    end)
    GUI:addOnClickEvent(Button_msg2, function()
        GUI:removeFromParent(Layout)
    end)
    GUI:addOnClickEvent(Layout_msg_close, function()
        GUI:removeFromParent(Layout)
    end)
    GUI:addOnClickEvent(Button_msg_close, function()
        GUI:removeFromParent(Layout)
    end)
end

-------------------------网络消息---------------------------
return NiuLeGeMaOBJ
