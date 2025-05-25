GUIDefine = {}

-- 属性类型
local attTypeTable = {
    HP                          = 1, -- 生命
    MP                          = 2, -- 魔法
    Min_ATK                     = 3, -- 物攻下限
    Max_ATK                     = 4, -- 物攻上限
    Min_MAT                     = 5, -- 魔攻下限
    Max_MAT                     = 6, -- 魔攻上限
    Min_Daoshu                  = 7, -- 道术下限
    Max_Daoshu                  = 8, -- 道术上限
    Min_DEF                     = 9, -- 物防下限
    Max_DEF                     = 10, -- 物防上限
    Min_MDF                     = 11, -- 魔防下限
    Max_MDF                     = 12, -- 魔防上限
    Hit_Point                   = 13, -- 准确
    Speed_Point                 = 14, -- 敏捷
    Anti_Magic                  = 15, -- 魔法躲避
    Anti_Posion                 = 16, -- 毒物躲避
    Posion_Recover              = 17, -- 中毒恢复
    Health_Recover              = 18, -- 体力恢复
    Spell_Recover               = 19, -- 魔法恢复
    Hit_Speed                   = 20, -- 攻速
    Double_Rate                 = 21, -- 暴击
    Double_Damage               = 22, -- 爆伤
    Defence                     = 23, -- 韧性
    Double_Defence              = 24, -- 暴击抵抗
    More_Damage                 = 25, -- 增加伤害
    ATK_Defence                 = 26, -- 物伤减免
    MAT_Defence                 = 27, -- 魔伤减免
    Ignore_Defence              = 28, -- 忽视防御
    Bounce_Damage               = 29, -- 反弹伤害
    Health_Add                  = 30, -- 体力增加
    Magice_Add                  = 31, -- 魔力增加
    More_Item                   = 32, -- 爆率增加
    Less_Item                   = 33, -- 爆率降低
    Vampire                     = 34, -- 吸血
    A_M_D_Add                   = 35, -- 攻魔道加成
    Defence_Add                 = 36, -- 防御加成
    MDefence_Add                = 37, -- 魔防加成
    God_Damage                  = 38, -- 神圣伤害
    Lucky                       = 39, -- 幸运
    Monster_Damage_Value        = 40, -- 对怪增伤 固定值
    Monster_Damage_Per          = 41, -- 对怪增伤
    Anger_Recover               = 42, -- 怒气恢复
    Combine_Skill_Damage        = 43, -- 合击伤害
    Monster_DropItem            = 44, -- 怪物爆率
    No_Palsy                    = 45, -- 防止麻痹
    No_Protect                  = 46, -- 防止护身
    No_Rebirth                  = 47, -- 防止复活
    No_ALL                      = 48, -- 防止全度
    No_Charm                    = 49, -- 防止诱惑
    No_Fire                     = 50, -- 防止火墙
    No_Ice                      = 51, -- 防止冰冻
    No_Web                      = 52, -- 防止蛛网

    Att_UnKonw                  = 53, -- 没配 未知

    More_A_Damage               = 54, -- 对战士伤害增加
    Less_A_Damage               = 55, -- 受到战士伤害减免
    More_M_Damage               = 56, -- 对法师伤害增加
    Less_M_Damage               = 57, -- 受到法师伤害减免
    More_D_Damage               = 58, -- 对伤道士害增加
    Less_D_Damage               = 59, -- 受到道士伤害减免
    More_Health_Per             = 60, -- 生命加成
    HP_Recover                  = 61, -- 生命恢复
    MP_Recover                  = 62, -- 魔法恢复
    Block_Rate                  = 63, -- 格挡概率
    Block_Value                 = 64, -- 格挡概率
    Drop_Rate                   = 65, -- 掉落概率
    Exp_Add_Rate                = 66, -- 经验倍率
    Damage_Rate_Add             = 67, -- 基础倍攻
    Damage_Human                = 68, -- 对人伤害
    Ice_Rate                    = 69, -- 冰冻概率
    Defen_Ice                   = 70, -- 防止冰冻
    Sec_Recovery_HP             = 71, -- 每秒回血,
    Mon_Bj_Power_Rate           = 72, -- 对怪爆率,
    DC_Add_Rate                 = 73, -- 击力倍数,
    Monster_Damage              = 74, -- 对怪伤害
    Monster_Damage_Percent      = 75, -- 对怪增伤
    PK_Damage_Add_Percent       = 76, -- PK增伤
    PK_Damage_Dec_Percent       = 77, -- PK减伤
    Penetrate                   = 78, -- 穿透
    Death_Hit_Percent           = 79, -- 致命一击
    Death_Hit_Value             = 80, -- 致命伤害
    Monster_Suck_HP_Rate        = 81, -- 吸血比例
    Monster_Vampire             = 82, -- 对怪物吸血
    Less_Monster_Damage         = 83, -- 减少来自怪物的伤害
    Drug_Recover                = 84, -- 药品恢复
    Ignore_Def_Dec              = 85, -- 忽视防御抵抗
    Fire_Hit_Dec_Rate           = 86, -- 烈火减免
    Ergum_Hit_Dec_Rate          = 87, -- 刺杀减免
    Hit_Plus_Dec_Rate           = 88, -- 攻杀减免
    Health_Add_WPer             = 89, -- 生命加成（万分比
    Death_Hit_Dec_Percent       = 90, -- 致命一击几率减
    Sec_Recovery_MP             = 91, -- 每秒回蓝
    Strength                    = 92, -- 强度
    Curse                       = 93, -- 诅咒
    Weight                      = 94, -- 当前重量
    Max_Weight                  = 95, -- 玩家最大负重
    Wear_Weight                 = 96, -- 穿戴负重
    Max_Wear_Weight             = 97, -- 最大穿戴负重
    Hand_Weight                 = 98, -- 腕力
    Max_Hand_Weight             = 99, -- 当前最大可穿戴腕力
                                      -- 内力值
    Internal_AddPower           = 101,-- 内功伤害增加
    Internal_DecPower           = 102,-- 内功伤害减少
    HJ_DecPower                 = 103,-- 合击伤害减少
    Internal_ForceRate          = 104,-- 内力恢复速率
    Internal_DZValue            = 105,-- 斗转星移值
    Min_Prick                   = 106,-- 刺术下限
    Max_Prick                   = 107,-- 刺术上限
    All_Du_ADD                  = 130,-- 全毒增加
    All_Du_Less                 = 131,-- 全毒减弱
    Magic_Hit                   = 132,-- 魔法命中
    -- 108 - 129 自定义职业(5-15)新增对应属性
    Min_CustJobAttr_5           = 108,
    Max_CustJobAttr_5           = 109,
    Min_CustJobAttr_6           = 110,
    Max_CustJobAttr_6           = 111,
    Min_CustJobAttr_7           = 112,
    Max_CustJobAttr_7           = 113,
    Min_CustJobAttr_8           = 114,
    Max_CustJobAttr_8           = 115,
    Min_CustJobAttr_9           = 116,
    Max_CustJobAttr_9           = 117,
    Min_CustJobAttr_10          = 118,
    Max_CustJobAttr_10          = 119,
    Min_CustJobAttr_11          = 120,
    Max_CustJobAttr_11          = 121,
    Min_CustJobAttr_12          = 122,
    Max_CustJobAttr_12          = 123,
    Min_CustJobAttr_13          = 124,
    Max_CustJobAttr_13          = 125,
    Min_CustJobAttr_14          = 126,
    Max_CustJobAttr_14          = 127,
    Min_CustJobAttr_15          = 128,
    Max_CustJobAttr_15          = 129,
}

GUIDefine.AttTypeTable = attTypeTable

-- 服务端下发的额外id对应的属性类型列表
GUIDefine.ExAttrList = {
    [0] = attTypeTable.Max_DEF,
    [1] = attTypeTable.Max_MDF,
    [2] = attTypeTable.Max_ATK,
    [3] = attTypeTable.Max_MAT,
    [4] = attTypeTable.Max_Daoshu,
    [5] = attTypeTable.Lucky,
    [6] = attTypeTable.Hit_Point,
    [7] = attTypeTable.Speed_Point,
    [8] = attTypeTable.Hit_Speed,
    [9] = attTypeTable.Anti_Magic,
    [10] = attTypeTable.Anti_Posion,
    [11] = attTypeTable.Health_Recover,
    [12] = attTypeTable.Spell_Recover,
    [13] = attTypeTable.Posion_Recover,
    [20] = attTypeTable.ATK_Defence,
    [21] = attTypeTable.MAT_Defence,
    [22] = attTypeTable.Ignore_Defence,
    [23] = attTypeTable.Bounce_Damage,
    [24] = attTypeTable.Health_Add,
    [25] = attTypeTable.Magice_Add,
    [26] = attTypeTable.More_Item,
    [27] = attTypeTable.God_Damage,
    [28] = attTypeTable.Strength,
    [29] = attTypeTable.Curse,
    [30] = attTypeTable.Double_Rate,
    [31] = attTypeTable.Double_Damage,
    [32] = attTypeTable.More_Damage,
    [33] = attTypeTable.Magic_Hit,
}

GUIDefine.EquipPosUI = {
    --普通装备
    Equip_Type_Dress       = 0,            --// 衣服
    Equip_Type_Weapon      = 1,            --// 武器
    Equip_Type_RightHand   = 2,            --// 勋章
    Equip_Type_Necklace    = 3,            --// 项链
    Equip_Type_Helmet      = 4,            --// 头盔
    Equip_Type_ArmRingL    = 5,            --// 左手镯
    Equip_Type_ArmRingR    = 6,            --// 右手镯      左右以人物内观内的左右为标准
    Equip_Type_RingL       = 7,            --// 左戒指
    Equip_Type_RingR       = 8,            --// 右戒指
    Equip_Type_Bujuk       = 9,            --// 护身符位置 玉佩 宝珠
    Equip_Type_Belt        = 10,           --// 腰带
    Equip_Type_Boots       = 11,           --// 鞋子
    Equip_Type_Charm       = 12,           --// 宝石        
    Equip_Type_Cap         = 13,           --// 斗笠
    Equip_Type_LeftBottom  = 14,           --// 左下 军鼓
    Equip_Type_RightBottom = 15,           --// 右下 马牌
    Equip_Type_Shield      = 16,           --// 盾牌
    Equip_Special_RingL    = 47,            -- 特戒左
    Equip_Special_RingR    = 48,            -- 特戒右
    Equip_Type_Veil        = 55,           --// 面纱
    -- 时装
    Equip_Type_Super_Dress = 17,           --// 神装衣服 --冰雪是神魔套装
    Equip_Type_Super_Weapon= 18,           --// 神装武器
    Equip_Type_Super_Cap   = 19,           --// 时装斗笠
    Equip_Type_Super_Necklace = 20,        --// 时装项链
    Equip_Type_Super_Helmet = 21,          --// 时装头盔
    Equip_Type_Super_ArmRingL = 22,        --// 时装左手镯
    Equip_Type_Super_ArmRingR = 23,        --// 时装右手镯
    Equip_Type_Super_RingL = 24,           --// 时装左戒指
    Equip_Type_Super_RingR = 25,           --// 时装右戒指
    Equip_Type_Super_RightHand = 26,       --// 时装勋章
    Equip_Type_Super_Belt = 27,            --// 时装腰带
    Equip_Type_Super_Boots = 28,           --// 时装靴子
    Equip_Type_Super_Charm = 29,           --// 时装宝石
    Equip_Type_Super_RightBottom = 42,     --// 时装马牌
    Equip_Type_Super_Bujuk = 43,           --// 时装符印
    Equip_Type_Super_LeftBottom = 44,      --// 时装军鼓
    Equip_Type_Super_Shield = 45,          --// 时装盾牌
    Equip_Type_Super_Veil = 46,            --// 时装面巾
}

GUIDefine.ExAttType = {
    Max_DEF         = 0,
    Max_MDF         = 1,
    Max_ATK         = 2,
    Max_MAT         = 3,
    Max_Daoshu      = 4,
    Lucky           = 5,
    Hit_Point       = 6,
    Speed_Point     = 7,
    Hit_Speed       = 8,
    Anti_Magic      = 9,
    Anti_Posion     = 10,
    Health_Recover  = 11,
    Spell_Recover   = 12,
    Posion_Recover  = 13,

    Star            = 16,
    Fail_Star       = 17,
    Lian_hun        = 18,
    Refining        = 19,
    ATK_Defence     = 20,
    MAT_Defence     = 21,
    Ignore_Defence  = 22,
    Bounce_Damage   = 23,
    Health_Add      = 24,
    Magice_Add      = 25,
    More_Item       = 26,
    God_Damage      = 27,
    Strength        = 28,
    Curse           = 29,
    Double_Rate     = 30,
    Double_Damage   = 31,
    More_Damage     = 32,
    Magic_Hit       = 33,
}

--需要转换血量单位的属性
GUIDefine.HPUnitAttrs = {
    [attTypeTable.HP] = true,
    [attTypeTable.MP] = true,
    [attTypeTable.Min_ATK] = true,
    [attTypeTable.Max_ATK] = true,
    [attTypeTable.Min_ATK] = true,
    [attTypeTable.Max_ATK] = true,
    [attTypeTable.Min_MAT] = true,
    [attTypeTable.Max_MAT] = true,
    [attTypeTable.Min_Daoshu] = true,
    [attTypeTable.Max_Daoshu] = true,
    [attTypeTable.Min_DEF] = true,
    [attTypeTable.Max_DEF] = true,
    [attTypeTable.Min_MDF] = true,
    [attTypeTable.Max_MDF] = true
}

-- 合并属性
GUIDefine.MergeAttrConfig = {
    [attTypeTable.Min_ATK]      = {attTypeTable.Min_ATK, attTypeTable.Max_ATK},
    [attTypeTable.Max_ATK]      = {attTypeTable.Min_ATK, attTypeTable.Max_ATK},
    [attTypeTable.Min_MAT]      = {attTypeTable.Min_MAT, attTypeTable.Max_MAT},
    [attTypeTable.Max_MAT]      = {attTypeTable.Min_MAT, attTypeTable.Max_MAT},
    [attTypeTable.Min_Daoshu]   = {attTypeTable.Min_Daoshu, attTypeTable.Max_Daoshu},
    [attTypeTable.Max_Daoshu]   = {attTypeTable.Min_Daoshu, attTypeTable.Max_Daoshu},
    [attTypeTable.Min_DEF]      = {attTypeTable.Min_DEF, attTypeTable.Max_DEF},
    [attTypeTable.Max_DEF]      = {attTypeTable.Min_DEF, attTypeTable.Max_DEF},
    [attTypeTable.Min_MDF]      = {attTypeTable.Min_MDF, attTypeTable.Max_MDF},
    [attTypeTable.Max_MDF]      = {attTypeTable.Min_MDF, attTypeTable.Max_MDF},
    [attTypeTable.Weight]       = {attTypeTable.Weight, attTypeTable.Max_Weight},
    [attTypeTable.Max_Weight]   = {attTypeTable.Weight, attTypeTable.Max_Weight},
    [attTypeTable.Wear_Weight]  = {attTypeTable.Wear_Weight, attTypeTable.Max_Wear_Weight},
    [attTypeTable.Max_Wear_Weight] = {attTypeTable.Wear_Weight, attTypeTable.Max_Wear_Weight},
    [attTypeTable.Hand_Weight]     = {attTypeTable.Hand_Weight, attTypeTable.Max_Hand_Weight},
    [attTypeTable.Max_Hand_Weight] = {attTypeTable.Hand_Weight, attTypeTable.Max_Hand_Weight},
}

for i = 5, 15 do
    local minKey = "Min_CustJobAttr_" .. i
    local maxKey = "Max_CustJobAttr_" .. i
    GUIDefine.MergeAttrConfig[attTypeTable[minKey]] = {attTypeTable[minKey], attTypeTable[maxKey]}
    GUIDefine.MergeAttrConfig[attTypeTable[maxKey]] = {attTypeTable[minKey], attTypeTable[maxKey]}
end

-- 物品来源
GUIDefine.ItemFrom = {
    BAG                 = 1,    -- 背包
    PALYER_EQUIP        = 2,    -- 玩家身上
    QUICK_USE           = 3,    -- 快捷栏
    STORAGE             = 4,    -- 仓库
    BAG_GOLD            = 5,    -- 背包金币
    SELL                = 6,    -- 摆摊
    REPAIRE             = 7,    -- npc商店
    TRADE               = 8,    -- 面对面交易
    TRADE_GOLD          = 10,   -- 交易
    BEST_RINGS          = 11,   -- 极品首饰
    AUTO_TRADE          = 12,   -- 摆摊
    ITEMBOX             = 13,   -- 自定义UI ITEMBOX
    NPC_DO_SOMETHING    = 14,   -- NPC自定义放入框
    NEWTYPE             = 15,
    HERO_BAG            = 66,   --英雄背包
    HERO_EQUIP          = 67,   -- 英雄装备
    HERO_BEST_RINGS     = 68,   -- 英雄极品首饰
    SSR_ITEM_BOX        = 77,   -- ssr 自定义ItemBox
    PETS_EQUIP          = 78,   -- 宠物装备
    SKILL_WIN           = 79,   -- PC 技能
    OTHER               = 99    -- 其他
}

GUIDefine.ItemGoTo = {
    BAG                 = 1,
    PALYER_EQUIP        = 2,
    QUICK_USE           = 3,
    STORAGE             = 4,
    SELL                = 5,
    DROP                = 6,
    REPAIRE             = 7,
    TRADE               = 8,
    TRADE_GOLD          = 10,
    BAG_GOLD            = 11,   --背包金币
    BEST_RINGS          = 12,   -- 极品首饰
    AUTO_TRADE          = 13,   -- 摆摊
    ITEMBOX             = 14,   -- 自定义UI ITEMBOX
    NPC_DO_SOMETHING    = 15,   -- NPC自定义放入框
    TreasureBox         = 16,
    NEWTYPE             = 17,
    HERO_BAG            = 66,   --英雄背包
    HERO_EQUIP          = 67,   -- 英雄装备
    HERO_BEST_RINGS     = 68,   -- 英雄极品首饰
    SSR_ITEM_BOX        = 77,   -- ssr 自定义ItemBox
    TOPUI               = 78,    
}


-- 聊天
GUIDefine.CHAT = {
    RICHTEXT_VSPACE     = nil,              -- 聊天富文本内行间间隔
    RICHTEXT_FONT_PATH  = nil,              -- 聊天默认字体路径
}

-- 寻路类型
GUIDefine.AUTO_MOVE_TYPE = {
    TARGET      = 1,                -- 寻找目标   
	MINIMAP     = 2,                -- 小地图       
	CHAT        = 3,                -- 聊天框   
	SERVER      = 4,                -- 服务器通知  
}

-- 物品归属
GUIDefine.ITEM_BELONG = {
    EQUIP           = 1,
    BAG             = 2,
    QUICKUSE        = 3,
    STALL           = 4,
    HEROBAG         = 66,
    HEROEQUIP       = 67,
}

-- 仓库单页可存数量
GUIDefine.STORAGE_PER_PAGE_MAX = 48
