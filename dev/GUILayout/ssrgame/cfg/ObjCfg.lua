--[[
    ObjCfg字段说明：
    ID                              界面唯一ID
    UI_ORIGIN                       界面原点

    OBJ_PATH                        xxOBJ文件路径
    UI_PATH                         xxUI文件路径
]]

local ssrObjCfg = {}


--装备外框特效
ssrObjCfg.ItemTipsShow = {
    ID                              = 3000,
	OBJ_PATH                        = "GUILayout/ItemTipsShow",
	NET_MESSAGE                     = ssrNetMsgCfg.ItemTipsShow,
}
 
--记录石
ssrObjCfg.JiLuShi = {
    ID                              = 4000,

    OBJ_PATH                        = "GUILayout/A/JiLuShiOBJ",
    UI_PATH                         = "A/JiLuShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiLuShi,
}

--罗盘占卜
ssrObjCfg.LuoPanZhanBu = {
    ID                              = 4100,

    OBJ_PATH                        = "GUILayout/F/LuoPanZhanBuOBJ",
    UI_PATH                         = "F/LuoPanZhanBuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LuoPanZhanBu,
}

 ssrObjCfg.GMBox = {
     ID                              = 6000,

     OBJ_PATH                        = "GUILayout/A/GMBoxOBJ",
     --UI_PATH                         = "A/GMBoxUI",

     NET_MESSAGE                     = ssrNetMsgCfg.GMBox,
 }

-------头部图标管理
 ssrObjCfg.TopIcon = {
     ID                              = 9000,

     OBJ_PATH                        = "GUILayout/A/TopIconOBJ",
     --UI_PATH                         = "A/TopIconUI",

     NET_MESSAGE                     = ssrNetMsgCfg.TopIcon,
 }

-----左侧属性显示
ssrObjCfg.LeftAttr = {
     ID                              = 9100,

     OBJ_PATH                        = "GUILayout/A/LeftAttrOBJ",

     NET_MESSAGE                     = ssrNetMsgCfg.LeftAttr,
}

--头部buff
ssrObjCfg.LeftTop = {
     ID                              = 9110,

     OBJ_PATH                        = "GUILayout/A/LeftTopOBJ",

     NET_MESSAGE                     = ssrNetMsgCfg.LeftTop,
}

--巡航挂机
ssrObjCfg.XunHangGuaJi = {
    ID                              = 9200,

    OBJ_PATH                           = "GUILayout/A/XunHangGuaJiOBJ",
    UI_PATH                         = "A/XunHangGuaJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XunHangGuaJi,
}

--测试使用
ssrObjCfg.test = {
    ID                              = 9500,
    OBJ_PATH                        = "GUILayout/A/testOBJ",
    UI_PATH                         = "A/testUI",
    NET_MESSAGE                     = ssrNetMsgCfg.test,
}

--切换地图特效
ssrObjCfg.SwitchMap = {
    ID                              = 9600,
    OBJ_PATH                        = "GUILayout/A/SwitchMapOBJ",
    NET_MESSAGE                     = ssrNetMsgCfg.SwitchMap,
}

--新人上线
ssrObjCfg.XinRenShangXian = {
    ID                              = 9700,

    OBJ_PATH                        = "GUILayout/A/XinRenShangXianOBJ",
    UI_PATH                         = "A/XinRenShangXianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinRenShangXian,
}

--综合服务
ssrObjCfg.ZongHeFuWu = {
    ID                              = 10000,
    -- RP_EVENT                        = ssrEventCfg.ZongHeFuWu,

    OBJ_PATH                        = "GUILayout/A/ZongHeFuWuOBJ",
    UI_PATH                         = "A/ZongHeFuWuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZongHeFuWu,
}

--牛马赞助
ssrObjCfg.NiuMaZanZhu = {
    ID                              = 10100,

    OBJ_PATH                        = "GUILayout/A/NiuMaZanZhuOBJ",
    UI_PATH                         = "A/NiuMaZanZhuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuMaZanZhu,
}

--充值中心
ssrObjCfg.ChongZhiZhongXin = {
    ID                              = 10200,

    OBJ_PATH                        = "GUILayout/A/ChongZhiZhongXinOBJ",

    UI_PATH                         = "A/ChongZhiZhongXinUI",
    NET_MESSAGE                     = ssrNetMsgCfg.ChongZhiZhongXin,
}


--世界地图
ssrObjCfg.ShiJieDiTu = {
    ID                              = 10300,

    OBJ_PATH                        = "GUILayout/A/ShiJieDiTuOBJ",
    UI_PATH                         = "A/ShiJieDiTuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiJieDiTu,
}


--牛马逆袭
ssrObjCfg.NiuMaNiXi = {
    ID                              = 10400,

    OBJ_PATH                        = "GUILayout/A/NiuMaNiXiOBJ",
    UI_PATH                         = "A/NiuMaNiXiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuMaNiXi,
}


--福利大厅
ssrObjCfg.FuLiDaTing = {
    ID                              = 10500,

    OBJ_PATH                        = "GUILayout/A/FuLiDaTingOBJ",
    UI_PATH                         = "A/FuLiDaTingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FuLiDaTing,
}

--游戏攻略
ssrObjCfg.YouXiGongLve = {
    ID                              = 10600,

    OBJ_PATH                        = "GUILayout/A/YouXiGongLveOBJ",
    UI_PATH                         = "A/YouXiGongLveUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YouXiGongLve,
}

--冠名
ssrObjCfg.GuanMing = {
    ID                              = 10700,

    OBJ_PATH                        = "GUILayout/A/GuanMingOBJ",
    UI_PATH                         = "A/GuanMingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuanMing,
}

--每日充值
ssrObjCfg.MeiRiChongZhi = {
    ID                              = 10800,

    OBJ_PATH                        = "GUILayout/A/MeiRiChongZhiOBJ",
    UI_PATH                         = "A/MeiRiChongZhiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MeiRiChongZhi,
}

------装备回收
ssrObjCfg.HuiShou = {
    ID                              = 11000,

    OBJ_PATH                        = "GUILayout/A/HuiShouOBJ",
    UI_PATH                         = "A/HuiShouUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuiShou,
}

------物品销毁
ssrObjCfg.WuPinXiaoHui = {
    ID                              = 11100,

    OBJ_PATH                           = "GUILayout/A/WuPinXiaoHuiOBJ",
    UI_PATH                         = "A/WuPinXiaoHuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WuPinXiaoHui,
}

--货币兑换
ssrObjCfg.HuoBiDuiHuan = {
    ID                              = 11150,

    OBJ_PATH                           = "GUILayout/A/HuoBiDuiHuanOBJ",
    UI_PATH                         = "A/HuoBiDuiHuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuoBiDuiHuan,
}

--感恩回馈
ssrObjCfg.GanEnHuiKui = {
    ID                              = 11160,

    OBJ_PATH                        = "GUILayout/A/GanEnHuiKuiOBJ",
    UI_PATH                         = "A/GanEnHuiKuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GanEnHuiKui,
}

------装备分解
--ssrObjCfg.FenJie = {
--    ID                              = 11100,
--
--    OBJ_PATH                        = "GUILayout/A/FenJieOBJ",
--    UI_PATH                         = "A/FenJieUI",
--
--    NET_MESSAGE                     = ssrNetMsgCfg.FenJie,
--}

--下地图
--ssrObjCfg.MapNpc = {
--    ID                              = 12000,

--    OBJ_PATH                        = "GUILayout/A/MapNpcOBJ",
--    UI_PATH                         = "A/MapNpcUI",

--    NET_MESSAGE                     = ssrNetMsgCfg.MapNpc,
--}
--野兽之森
ssrObjCfg.YeShouZhiSen = {
    ID                              = 12000,

    OBJ_PATH                           = "GUILayout/A/YeShouZhiSenOBJ",
    UI_PATH                         = "A/YeShouZhiSenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YeShouZhiSen,
}
--桃花林
ssrObjCfg.TaoHuaLin = {
    ID                              = 12010,

    OBJ_PATH                           = "GUILayout/A/TaoHuaLinOBJ",
    UI_PATH                         = "A/TaoHuaLinUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TaoHuaLin,
}
--琉璃矿洞
ssrObjCfg.LiuLiKuangDong = {
    ID                              = 12020,

    OBJ_PATH                           = "GUILayout/A/LiuLiKuangDongOBJ",
    UI_PATH                         = "A/LiuLiKuangDongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LiuLiKuangDong,
}
--天元边关
ssrObjCfg.TianYuanBianGuan = {
    ID                              = 12030,

    OBJ_PATH                           = "GUILayout/A/TianYuanBianGuanOBJ",
    UI_PATH                         = "A/TianYuanBianGuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TianYuanBianGuan,
}
--遗忘古迹
ssrObjCfg.YiWangGuJi = {
    ID                              = 12040,

    OBJ_PATH                           = "GUILayout/A/YiWangGuJiOBJ",
    UI_PATH                         = "A/YiWangGuJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YiWangGuJi,
}
--域外战场
ssrObjCfg.YuWaiZhanChang = {
    ID                              = 12050,

    OBJ_PATH                           = "GUILayout/A/YuWaiZhanChangOBJ",
    UI_PATH                         = "A/YuWaiZhanChangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YuWaiZhanChang,
}

--失落鬼域
ssrObjCfg.ShiLuoGuiYu = {
    ID                              = 12060,

    OBJ_PATH                           = "GUILayout/F/ShiLuoGuiYuOBJ",
    UI_PATH                         = "F/ShiLuoGuiYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiLuoGuiYu,
}

--邪恶山谷
ssrObjCfg.XieEShanGu = {
    ID                              = 12070,

    OBJ_PATH                           = "GUILayout/F/XieEShanGuOBJ",
    UI_PATH                         = "F/XieEShanGuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XieEShanGu,
}

--火之域
ssrObjCfg.HuoZhiYu = {
    ID                              = 12080,

    OBJ_PATH                           = "GUILayout/F/HuoZhiYuOBJ",
    UI_PATH                         = "F/HuoZhiYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuoZhiYu,
}
--暗黑之地
ssrObjCfg.AnHeiZhiDi = {
    ID                              = 12090,

    OBJ_PATH                           = "GUILayout/F/AnHeiZhiDiOBJ",
    UI_PATH                         = "F/AnHeiZhiDiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.AnHeiZhiDi,
}
--enter大陆
ssrObjCfg.EnterDaLu = {
    ID                              = 12500,

    OBJ_PATH                           = "GUILayout/A/EnterDaLuOBJ",
    UI_PATH                         = "A/EnterDaLuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.EnterDaLu,
}

--首充
ssrObjCfg.ShouChong = {
    ID                              = 13000,

    OBJ_PATH                           = "GUILayout/A/ShouChongOBJ",
    UI_PATH                         = "A/ShouChongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShouChong,
}

--特权
ssrObjCfg.TeQuan = {
    ID                              = 13100,

    OBJ_PATH                           = "GUILayout/A/TeQuanOBJ",
    UI_PATH                         = "A/TeQuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TeQuan,
}

--天命
ssrObjCfg.TianMing = {
    ID                              = 13200,

    OBJ_PATH                           = "GUILayout/A/TianMingOBJ",
    UI_PATH                         = "A/TianMingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TianMing,
}
--修仙
ssrObjCfg.XiuXian = {
    ID                              = 13400,

    OBJ_PATH                           = "GUILayout/A/XiuXianOBJ",
    UI_PATH                         = "A/XiuXianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XiuXian,
}
--装扮
ssrObjCfg.ZhuangBan = {
    ID                              = 13500,

    OBJ_PATH                           = "GUILayout/A/ZhuangBanOBJ",
    UI_PATH                         = "A/ZhuangBanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuangBan,
}
--任务
ssrObjCfg.Task = {
    ID                              = 16000,

    OBJ_PATH                           = "GUILayout/A/TaskOBJ",
    --UI_PATH                         = "A/RenWuNpcUI",

    NET_MESSAGE                     = ssrNetMsgCfg.Task,
}
--超级剧情
ssrObjCfg.ChaoJiJuQing = {
    ID                              = 17000,

    OBJ_PATH                           = "GUILayout/R/ChaoJiJuQingOBJ",
    UI_PATH                         = "R/ChaoJiJuQingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChaoJiJuQing,
}
--主线任务
ssrObjCfg.ZhuXianRenWu = {
    ID                              = 18000,

    OBJ_PATH                           = "GUILayout/R/ZhuXianRenWuOBJ",
    UI_PATH                         = "R/ZhuXianRenWuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuXianRenWu,
}

--通关文牒
ssrObjCfg.TongGuanWenDie = {
    ID                              = 19000,

    OBJ_PATH                           = "GUILayout/R/TongGuanWenDieOBJ",
    UI_PATH                         = "R/TongGuanWenDieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TongGuanWenDie,
}
-------------------------------------活动相关---------------------------------------
--天选之人
ssrObjCfg.TianXuanZhiRen = {
    ID                              = 20000,

    OBJ_PATH                           = "GUILayout/A/TianXuanZhiRenOBJ",
    UI_PATH                         = "A/TianXuanZhiRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TianXuanZhiRen,
}

--福星棋盘
ssrObjCfg.FuXingQiPan = {
    ID                              = 20100,

    OBJ_PATH                           = "GUILayout/A/FuXingQiPanOBJ",
    UI_PATH                         = "A/FuXingQiPanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FuXingQiPan,
}
--全民划水
ssrObjCfg.QuanMinHuaShui = {
    ID                              = 20200,

    OBJ_PATH                           = "GUILayout/A/QuanMinHuaShuiOBJ",
    UI_PATH                         = "A/QuanMinHuaShuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QuanMinHuaShui,
}
--摸鱼之王
ssrObjCfg.MoYuZhiWang = {
    ID                              = 20300,

    OBJ_PATH                           = "GUILayout/A/MoYuZhiWangOBJ",
    UI_PATH                         = "A/MoYuZhiWangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoYuZhiWang,
}
--激情泡点
ssrObjCfg.JiQingPaoDian = {
    ID                              = 20400,

    OBJ_PATH                           = "GUILayout/A/JiQingPaoDianOBJ",
    UI_PATH                         = "A/JiQingPaoDianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiQingPaoDian,
}
--活动大厅
ssrObjCfg.HuoDongDaTing = {
    ID                              = 21000,

    OBJ_PATH                           = "GUILayout/A/HuoDongDaTingOBJ",
    UI_PATH                         = "A/HuoDongDaTingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuoDongDaTing,
}

--巅峰等级
ssrObjCfg.DianFengDengJi1 = {
    ID                              = 22000,

    OBJ_PATH                           = "GUILayout/F/DianFengDengJi1OBJ",
    UI_PATH                         = "F/DianFengDengJi1UI",

    NET_MESSAGE                     = ssrNetMsgCfg.DianFengDengJi1,
}
--巅峰等级
ssrObjCfg.DianFengDengJi2 = {
    ID                              = 22100,

    OBJ_PATH                           = "GUILayout/F/DianFengDengJi2OBJ",
    UI_PATH                         = "F/DianFengDengJi2UI",

    NET_MESSAGE                     = ssrNetMsgCfg.DianFengDengJi2,
}
--巅峰等级
ssrObjCfg.DianFengDengJi3 = {
    ID                              = 22200,

    OBJ_PATH                           = "GUILayout/F/DianFengDengJi3OBJ",
    UI_PATH                         = "F/DianFengDengJi3UI",

    NET_MESSAGE                     = ssrNetMsgCfg.DianFengDengJi3,
}
-------------------------------------活动相关end---------------------------------------
--攻杀传送
ssrObjCfg.GongShaChuanSong = {
    ID                              = 49000,

    OBJ_PATH                        = "GUILayout/A/GongShaChuanSongOBJ",
    UI_PATH                         = "A/GongShaChuanSongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GongShaChuanSong,
}

--攻杀传送跨服
ssrObjCfg.KFGongShaChuanSong = {
    ID                              = 49100,

    OBJ_PATH                        = "GUILayout/A/KFGongShaChuanSongOBJ",
    UI_PATH                         = "A/KFGongShaChuanSongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KFGongShaChuanSong,
}

--沙城战神榜
ssrObjCfg.ShaChengZhanShenBang = {
    ID                              = 49500,

    OBJ_PATH                           = "GUILayout/A/ShaChengZhanShenBangOBJ",
    UI_PATH                         = "A/ShaChengZhanShenBangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShaChengZhanShenBang,
}

--首饰盒
ssrObjCfg.ShouShiHe = {
    ID                              = 50000,

    OBJ_PATH                        = "GUILayout/A/ShouShiHeOBJ",
    UI_PATH                         = "A/ShouShiHeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShouShiHe,
}

--他人首饰盒
ssrObjCfg.TaRenShouShiHe = {
    ID                              = 50100,

    OBJ_PATH                        = "GUILayout/A/TaRenShouShiHeOBJ",
    UI_PATH                         = "A/TaRenShouShiHeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TaRenShouShiHe,
} 


--魂装界面
ssrObjCfg.HunZhuangJieMian = {
    ID                              = 51000,

    OBJ_PATH                        = "GUILayout/A/HunZhuangJieMianOBJ",
    UI_PATH                         = "A/HunZhuangJieMianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunZhuangJieMian,
}

--他人魂装
ssrObjCfg.TaRenHunZhuang = {
    ID                              = 52000,

    OBJ_PATH                           = "GUILayout/A/TaRenHunZhuangOBJ",
    UI_PATH                         = "A/TaRenHunZhuangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TaRenHunZhuang,
}

--材料货栈
ssrObjCfg.CaiLiaoHuoZhan = {
    ID                              = 59000,

    OBJ_PATH                           = "GUILayout/A/CaiLiaoHuoZhanOBJ",
    UI_PATH                         = "A/CaiLiaoHuoZhanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.CaiLiaoHuoZhan,
}

--体质修炼
ssrObjCfg.TiZhiXiuLian = {
    ID                              = 60000,

    OBJ_PATH                        = "GUILayout/A/TiZhiXiuLianOBJ",
    UI_PATH                         = "A/TiZhiXiuLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TiZhiXiuLian,
}

--狂暴之力
ssrObjCfg.KuangBao = {
    ID                              = 61000,

    OBJ_PATH                        = "GUILayout/A/KuangBaoOBJ",
    UI_PATH                         = "A/KuangBaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuangBao,
}

--牛马奇遇录
ssrObjCfg.NiuMaQiYuLu = {
    ID                              = 61100,

    OBJ_PATH                           = "GUILayout/A/NiuMaQiYuLuOBJ",
    UI_PATH                         = "A/NiuMaQiYuLuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuMaQiYuLu,
}

--酒仙李白
ssrObjCfg.JiuXianLiBai = {
    ID                              = 62000,

    OBJ_PATH                        = "GUILayout/A/JiuXianLiBaiOBJ",
    UI_PATH                         = "A/JiuXianLiBaiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiuXianLiBai,
}

--时装合成
ssrObjCfg.ShiZhuangHeCheng = {
    ID                              = 63000,

    OBJ_PATH                        = "GUILayout/A/ShiZhuangHeChengOBJ",
    UI_PATH                         = "A/ShiZhuangHeChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiZhuangHeCheng,
}


--暴风之力
ssrObjCfg.BaoFengZhiLi = {
    ID                              = 64000,
                                          
    OBJ_PATH                        = "GUILayout/A/BaoFengZhiLiOBJ",
    UI_PATH                         = "A/BaoFengZhiLiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BaoFengZhiLi,
}
--特殊合成
ssrObjCfg.TeShuHeCheng = {
    ID                              = 65100,

    OBJ_PATH                           = "GUILayout/A/TeShuHeChengOBJ",
    UI_PATH                         = "A/TeShuHeChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TeShuHeCheng,
}

--杀戮刻印
ssrObjCfg.ShaLuYinJi = {
    ID                              = 65000,

    OBJ_PATH                        = "GUILayout/A/ShaLuYinJiOBJ",
    UI_PATH                         = "A/ShaLuYinJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShaLuYinJi,
}

--空间法师
ssrObjCfg.KongJianFaShi = {
    ID                              = 66000,

    OBJ_PATH                        = "GUILayout/A/KongJianFaShiOBJ",
    UI_PATH                         = "A/KongJianFaShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KongJianFaShi,
}

--边境村长
ssrObjCfg.BianJingCunZhang = {
    ID                              = 67000,

    OBJ_PATH                        = "GUILayout/B/BianJingCunZhangOBJ",
    UI_PATH                         = "B/BianJingCunZhangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BianJingCunZhang,
}

--边境称号
ssrObjCfg.BianGuanTitle = {
    ID                              = 68000,

    OBJ_PATH                        = "GUILayout/B/BianGuanTitleOBJ",
    UI_PATH                         = "B/BianGuanTitleUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BianGuanTitle,
}

--卦象占卜
ssrObjCfg.GuaXiangZhanBu = {
    ID                              = 68100,

    OBJ_PATH                           = "GUILayout/A/GuaXiangZhanBuOBJ",
    UI_PATH                         = "A/GuaXiangZhanBuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuaXiangZhanBu,
}

--幸运项链
ssrObjCfg.XingYunXiangLian = {
    ID                              = 69000,

    OBJ_PATH                        = "GUILayout/B/XingYunXiangLianOBJ",
    UI_PATH                         = "B/XingYunXiangLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XingYunXiangLian,
}

--狂风洗练
ssrObjCfg.KuangFengXiLian = {
    ID                              = 70000,

    OBJ_PATH                           = "GUILayout/B/KuangFengXiLianOBJ",
    UI_PATH                         = "B/KuangFengXiLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuangFengXiLian,
}

--装备唤醒
ssrObjCfg.ZhuangBeiHuanXing = {
    ID                              = 71000,

    OBJ_PATH                           = "GUILayout/B/ZhuangBeiHuanXingOBJ",
    UI_PATH                         = "B/ZhuangBeiHuanXingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuangBeiHuanXing,
}

--装备洗练
ssrObjCfg.ZhuangBeiXiLian = {
    ID                              = 72000,

    OBJ_PATH                           = "GUILayout/B/ZhuangBeiXiLianOBJ",
    UI_PATH                         = "B/ZhuangBeiXiLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuangBeiXiLian,
}

--装备锻造
ssrObjCfg.ZhuangBeiDuanZao = {
    ID                              = 73000,

    OBJ_PATH                           = "GUILayout/B/ZhuangBeiDuanZaoOBJ",
    UI_PATH                         = "B/ZhuangBeiDuanZaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuangBeiDuanZao,
}

--神魔之体
ssrObjCfg.ShenMoZhiTi = {
    ID                              = 74000,

    OBJ_PATH                        = "GUILayout/B/ShenMoZhiTiOBJ",
    UI_PATH                         = "B/ShenMoZhiTiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenMoZhiTi,
}


--神龙幻境
ssrObjCfg.ShenLongHuanJing = {
    ID                              = 75000,

    OBJ_PATH                        = "GUILayout/B/ShenLongHuanJingOBJ",
    UI_PATH                         = "B/ShenLongHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenLongHuanJing,
}


--江湖称号
ssrObjCfg.JiangHuChengHao = {
    ID                              = 76000,

    OBJ_PATH                        = "GUILayout/B/JiangHuChengHaoOBJ",
    UI_PATH                         = "B/JiangHuChengHaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiangHuChengHao,
}

--技能强化
ssrObjCfg.JiNengQiangHua = {
    ID                              = 77000,

    OBJ_PATH                           = "GUILayout/B/JiNengQiangHuaOBJ",
    UI_PATH                         = "B/JiNengQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiNengQiangHua,
}

--创世之火
ssrObjCfg.ChuangShiZhiHuo = {
    ID                              = 78000,

    OBJ_PATH                        = "GUILayout/B/ChuangShiZhiHuoOBJ",
    UI_PATH                         = "B/ChuangShiZhiHuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChuangShiZhiHuo,
}

--禁忌之门
ssrObjCfg.JinJiZhiMen = {
    ID                              = 79000,

    OBJ_PATH                           = "GUILayout/B/JinJiZhiMenOBJ",
    UI_PATH                         = "B/JinJiZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JinJiZhiMen,
}

--经验老人
ssrObjCfg.JingYanLaoRen = {
    ID                              = 80000,

    OBJ_PATH                        = "GUILayout/C/JingYanLaoRenOBJ",
    UI_PATH                         = "C/JingYanLaoRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JingYanLaoRen,
}

--巨龙觉醒
ssrObjCfg.JuLongJueXing = {
    ID                              = 81000,

    OBJ_PATH                           = "GUILayout/C/JuLongJueXingOBJ",
    UI_PATH                         = "C/JuLongJueXingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JuLongJueXing,
}

--空间魔法
ssrObjCfg.KongJianMoFa = {
    ID                              = 82000,

    OBJ_PATH                           = "GUILayout/C/KongJianMoFaOBJ",
    UI_PATH                         = "C/KongJianMoFaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KongJianMoFa,
}

--流光神器
ssrObjCfg.LiuGuangShenQi = {
    ID                              = 83000,

    OBJ_PATH                           = "GUILayout/C/LiuGuangShenQiOBJ",
    UI_PATH                         = "C/LiuGuangShenQiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LiuGuangShenQi,
}

--盾牌锻造
ssrObjCfg.DunPaiDuanZao = {
    ID                              = 84000,

    OBJ_PATH                           = "GUILayout/C/DunPaiDuanZaoOBJ",
    UI_PATH                         = "C/DunPaiDuanZaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.DunPaiDuanZao,
}

--境界修炼
ssrObjCfg.JingJieXiuLian = {
    ID                              = 85000,

    OBJ_PATH                           = "GUILayout/C/JingJieXiuLianOBJ",
    UI_PATH                         = "C/JingJieXiuLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JingJieXiuLian,
}

--修仙之路
ssrObjCfg.XiuXianZhiLu = {
    ID                              = 86000,

    OBJ_PATH                           = "GUILayout/C/XiuXianZhiLuOBJ",
    UI_PATH                         = "C/XiuXianZhiLuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XiuXianZhiLu,
}

--守夜人
ssrObjCfg.ShouYeRen = {
    ID                              = 87000,

    OBJ_PATH                           = "GUILayout/C/ShouYeRenOBJ",
    UI_PATH                         = "C/ShouYeRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShouYeRen,
}

--龙神之力
ssrObjCfg.LongShenZhiLi = {
    ID                              = 88000,

    OBJ_PATH                           = "GUILayout/C/LongShenZhiLiOBJ",
    UI_PATH                         = "C/LongShenZhiLiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LongShenZhiLi,
}

--觉醒神装
ssrObjCfg.JueXingShenZhuang = {
    ID                              = 89000,

    OBJ_PATH                           = "GUILayout/C/JueXingShenZhuangOBJ",
    UI_PATH                         = "C/JueXingShenZhuangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JueXingShenZhuang,
}

--人物转生
ssrObjCfg.RenWuZhuanSheng2 = {
    ID                              = 90000,

    OBJ_PATH                           = "GUILayout/B/RenWuZhuanShengOBJ",
    UI_PATH                         = "B/RenWuZhuanShengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.RenWuZhuanSheng,
}

--装备强化
ssrObjCfg.ZhuangBeiQiangHua = {
    ID                              = 91000,

    OBJ_PATH                           = "GUILayout/C/ZhuangBeiQiangHuaOBJ",
    UI_PATH                         = "C/ZhuangBeiQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhuangBeiQiangHua,
}

--混元功法
ssrObjCfg.HunYuanGongFa = {
    ID                              = 92000,

    OBJ_PATH                           = "GUILayout/C/HunYuanGongFaOBJ",
    UI_PATH                         = "C/HunYuanGongFaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunYuanGongFa,
}


--魔化天使A
ssrObjCfg.MoHuaTianShiA = {
    ID                              = 93000,

    OBJ_PATH                        = "GUILayout/A/MoHuaTianShiAOBJ",
    UI_PATH                         = "A/MoHuaTianShiAUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoHuaTianShiA,
}

--魔化天使B
ssrObjCfg.MoHuaTianShiB = {
    ID                              = 94000,

    OBJ_PATH                        = "GUILayout/B/MoHuaTianShiBOBJ",
    UI_PATH                         = "B/MoHuaTianShiBUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoHuaTianShiB,
}

--魔化天使C
ssrObjCfg.MoHuaTianShiC = {
    ID                              = 95000,

    OBJ_PATH                        = "GUILayout/C/MoHuaTianShiCOBJ",
    UI_PATH                         = "C/MoHuaTianShiCUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoHuaTianShiC,
}

--魔化天使D
ssrObjCfg.MoHuaTianShiD = {
    ID                              = 96000,

    OBJ_PATH                        = "GUILayout/C/MoHuaTianShiDOBJ",
    UI_PATH                         = "C/MoHuaTianShiDUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoHuaTianShiD,
}

--地藏王的试炼
ssrObjCfg.DiZangWangDeShiLian = {
    ID                              = 97000,

    OBJ_PATH                        = "GUILayout/D/DiZangWangDeShiLianOBJ",
    UI_PATH                         = "D/DiZangWangDeShiLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.DiZangWangDeShiLian,
}

--献祭试炼
ssrObjCfg.XianJiShiLian = {
    ID                              = 97100,

    OBJ_PATH                           = "GUILayout/D/XianJiShiLianOBJ",
    UI_PATH                         = "D/XianJiShiLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XianJiShiLian,
}

--亡魂塔
ssrObjCfg.WangHunTa = {
    ID                              = 98000,

    OBJ_PATH                        = "GUILayout/D/WangHunTaOBJ",
    UI_PATH                         = "D/WangHunTaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WangHunTa,
}

--时空穿梭
ssrObjCfg.ShiKongChuanSuo = {
    ID                              = 99000,

    OBJ_PATH                        = "GUILayout/F/ShiKongChuanSuoOBJ",
    UI_PATH                         = "F/ShiKongChuanSuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiKongChuanSuo,
}
--点灯人01
ssrObjCfg.DianDengRen = {
    ID                              = 100000,

    OBJ_PATH                        = "GUILayout/D/DianDengRenOBJ",
    UI_PATH                         = "D/DianDengRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.DianDengRen,
}

--孤魂点灯人
ssrObjCfg.GuHunDianDengRen = {
    ID                              = 100999,

    OBJ_PATH                        = "GUILayout/D/GuHunDianDengRenOBJ",
    UI_PATH                         = "D/GuHunDianDengRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuHunDianDengRen,
}

--心魔老人
ssrObjCfg.XinMoLaoRen = {
    ID                              = 101000,

    OBJ_PATH                        = "GUILayout/C/XinMoLaoRenOBJ",
    UI_PATH                         = "C/XinMoLaoRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinMoLaoRen,
}

--阴阳魂石
ssrObjCfg.YinYangHunShi = {
    ID                              = 102000,

    OBJ_PATH                        = "GUILayout/D/YinYangHunShiOBJ",
    UI_PATH                         = "D/YinYangHunShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YinYangHunShi,
}

----复活
--ssrObjCfg.Die = {
--    ID                               = 20000,
--    UI_TYPE                          = ssrConstCfg.UI_NORMAL,
--
--    OBJ_PATH                         = "GUILayout/B/DieOBJ",
--    UI_PATH                          = "B/DieUI",
--
--    NET_MESSAGE                      = ssrNetMsgCfg.Die,
--}

--禁墟之门
ssrObjCfg.JinXuZhiMen = {
    ID                              = 103000,

    OBJ_PATH                        = "GUILayout/D/JinXuZhiMenOBJ",
    UI_PATH                         = "D/JinXuZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JinXuZhiMen,
}

--净土之门
ssrObjCfg.JingTuZhiMen = {
    ID                              = 104000,

    OBJ_PATH                        = "GUILayout/D/JingTuZhiMenOBJ",
    UI_PATH                         = "D/JingTuZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JingTuZhiMen,
}

--审判之门
ssrObjCfg.ShenPanZhiMen = {
    ID                              = 105000,

    OBJ_PATH                        = "GUILayout/D/ShenPanZhiMenOBJ",
    UI_PATH                         = "D/ShenPanZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenPanZhiMen,
}

--秩序之门
ssrObjCfg.ZhiXuZhiMen = {
    ID                              = 106000,

    OBJ_PATH                        = "GUILayout/D/ZhiXuZhiMenOBJ",
    UI_PATH                         = "D/ZhiXuZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhiXuZhiMen,
}
--哈法西斯之墓
ssrObjCfg.HaFaXiSiZhiMu = {
    ID                              = 107000,

    OBJ_PATH                        = "GUILayout/D/HaFaXiSiZhiMuOBJ",
    UI_PATH                         = "D/HaFaXiSiZhiMuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HaFaXiSiZhiMu,
}

--哈法西斯祭坛
ssrObjCfg.HaFaXiSiJiTan = {
    ID                              = 107100,

    OBJ_PATH                           = "GUILayout/D/HaFaXiSiJiTanOBJ",
    UI_PATH                         = "D/HaFaXiSiJiTanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HaFaXiSiJiTan,
}

--异界地下城
ssrObjCfg.YiJieDiXiaCheng = {
    ID                              = 107200,

    OBJ_PATH                           = "GUILayout/B/YiJieDiXiaChengOBJ",
    UI_PATH                         = "B/YiJieDiXiaChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YiJieDiXiaCheng,
}

--生命神柱
ssrObjCfg.ShengMingShenZhu = {
    ID                              = 107250,

    OBJ_PATH                           = "GUILayout/A/ShengMingShenZhuOBJ",
    UI_PATH                         = "A/ShengMingShenZhuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengMingShenZhu,
}

--仙王宝藏
ssrObjCfg.XianWangBaoZang = {
    ID                              = 107300,

    OBJ_PATH                           = "GUILayout/A/XianWangBaoZangOBJ",
    UI_PATH                         = "A/XianWangBaoZangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XianWangBaoZang,
}

--牛马旷工
ssrObjCfg.NiuMaKuangGong = {
    ID                              = 107400,

    OBJ_PATH                           = "GUILayout/A/NiuMaKuangGongOBJ",
    UI_PATH                         = "A/NiuMaKuangGongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuMaKuangGong,
}

--仙王悬赏
ssrObjCfg.XianWangXuanShang = {
    ID                              = 107500,

    OBJ_PATH                           = "GUILayout/A/XianWangXuanShangOBJ",
    UI_PATH                         = "A/XianWangXuanShangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XianWangXuanShang,
}

--异界迷城
ssrObjCfg.YiJieMiCheng = {
    ID                              = 107600,

    OBJ_PATH                           = "GUILayout/A/YiJieMiChengOBJ",
    UI_PATH                         = "A/YiJieMiChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YiJieMiCheng,
}

--酆都幻境
ssrObjCfg.FengDouHuanJing = {
    ID                              = 107700,

    OBJ_PATH                        = "GUILayout/D/FengDouHuanJingOBJ",
    UI_PATH                         = "D/FengDouHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengDouHuanJing,
}

--极恶幻境
ssrObjCfg.JiEHuanJing = {
    ID                              = 107800,

    OBJ_PATH                        = "GUILayout/D/JiEHuanJingOBJ",
    UI_PATH                         = "D/JiEHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiEHuanJing,
}


--混沌本源
ssrObjCfg.HunDunBenYuan = {
    ID                              = 107900,

    OBJ_PATH                        = "GUILayout/F/HunDunBenYuanOBJ",
    UI_PATH                         = "F/HunDunBenYuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunDunBenYuan,
}


--圣城幻境
ssrObjCfg.ShengChengHuanJing = {
    ID                              = 108000,

    OBJ_PATH                        = "GUILayout/F/ShengChengHuanJingOBJ",
    UI_PATH                         = "F/ShengChengHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengChengHuanJing,
}

--破晓幻境
ssrObjCfg.PoXiaoHuanJing = {
    ID                              = 108100,

    OBJ_PATH                        = "GUILayout/F/PoXiaoHuanJingOBJ",
    UI_PATH                         = "F/PoXiaoHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.PoXiaoHuanJing,
}


--圣城秘宝阁A
ssrObjCfg.ShengChengMiBaoGeA = {
    ID                              = 108200,

    OBJ_PATH                        = "GUILayout/F/ShengChengMiBaoGeAOBJ",
    UI_PATH                         = "F/ShengChengMiBaoGeAUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengChengMiBaoGeA,
}

--圣城秘宝阁B
ssrObjCfg.ShengChengMiBaoGeB = {
    ID                              = 108300,

    OBJ_PATH                        = "GUILayout/F/ShengChengMiBaoGeBOBJ",
    UI_PATH                         = "F/ShengChengMiBaoGeBUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengChengMiBaoGeB,
}

--破晓秘宝阁A
ssrObjCfg.PoXiaoMiBaoGeA = {
    ID                              = 108400,

    OBJ_PATH                        = "GUILayout/F/PoXiaoMiBaoGeAOBJ",
    UI_PATH                         = "F/PoXiaoMiBaoGeAUI",

    NET_MESSAGE                     = ssrNetMsgCfg.PoXiaoMiBaoGeA,
}

--破晓秘宝阁B
ssrObjCfg.PoXiaoMiBaoGeB = {
    ID                              = 108500,

    OBJ_PATH                        = "GUILayout/F/PoXiaoMiBaoGeBOBJ",
    UI_PATH                         = "F/PoXiaoMiBaoGeBUI",

    NET_MESSAGE                     = ssrNetMsgCfg.PoXiaoMiBaoGeB,
}


--受惊的村民
ssrObjCfg.ShouJingDeCunMin = {
    ID                              = 200000,

    OBJ_PATH                        = "GUILayout/R/ShouJingDeCunMinOBJ",
    UI_PATH                         = "R/ShouJingDeCunMinUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShouJingDeCunMin,
}

--起源村村长
ssrObjCfg.QiYuanCunCunZhang = {
    ID                              = 200100,

    OBJ_PATH                        = "GUILayout/R/QiYuanCunCunZhangOBJ",
    UI_PATH                         = "R/QiYuanCunCunZhangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuanCunCunZhang,
}

--疯癫的守村人
ssrObjCfg.FengDianDeShouCunRen = {
    ID                              = 200200,

    OBJ_PATH                        = "GUILayout/R/FengDianDeShouCunRenOBJ",
    UI_PATH                         = "R/FengDianDeShouCunRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengDianDeShouCunRen,
}

--疾风隐士
ssrObjCfg.JiFengYinShi = {
    ID                              = 200300,

    OBJ_PATH                        = "GUILayout/R/JiFengYinShiOBJ",
    UI_PATH                         = "R/JiFengYinShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiFengYinShi,
}

--古风祭坛
ssrObjCfg.GuFengJiTan = {
    ID                              = 200400,

    OBJ_PATH                        = "GUILayout/R/GuFengJiTanOBJ",
    UI_PATH                         = "R/GuFengJiTanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuFengJiTan,
}

--玄天老人
ssrObjCfg.XuanTianLaoRen = {
    ID                              = 200500,

    OBJ_PATH                        = "GUILayout/R/XuanTianLaoRenOBJ",
    UI_PATH                         = "R/XuanTianLaoRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XuanTianLaoRen,
}

--奇遇盒子
ssrObjCfg.QiYuHeZi = {
    ID                              = 300000,

    OBJ_PATH                        = "GUILayout/Q/QiYuHeZiOBJ",
    UI_PATH                         = "Q/QiYuHeZiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuHeZi,
}

--奇遇事件01
ssrObjCfg.QiYuShiJian01 = {
    ID                              = 300100,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian01OBJ",
    UI_PATH                         = "Q/QiYuShiJian01UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian01,
}

--奇遇事件02
ssrObjCfg.QiYuShiJian02 = {
    ID                              = 300200,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian02OBJ",
    UI_PATH                         = "Q/QiYuShiJian02UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian02,
}

--奇遇事件03
ssrObjCfg.QiYuShiJian03 = {
    ID                              = 300300,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian03OBJ",
    UI_PATH                         = "Q/QiYuShiJian03UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian03,
}

--奇遇事件04
ssrObjCfg.QiYuShiJian04 = {
    ID                              = 300400,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian04OBJ",
    UI_PATH                         = "Q/QiYuShiJian04UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian04,
}

--奇遇事件05
ssrObjCfg.QiYuShiJian05 = {
    ID                              = 300500,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian05OBJ",
    UI_PATH                         = "Q/QiYuShiJian05UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian05,
}

--奇遇事件06
ssrObjCfg.QiYuShiJian06 = {
    ID                              = 300600,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian06OBJ",
    UI_PATH                         = "Q/QiYuShiJian06UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian06,
}

--奇遇事件07
ssrObjCfg.QiYuShiJian07 = {
    ID                              = 300700,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian07OBJ",
    UI_PATH                         = "Q/QiYuShiJian07UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian07,
}

--奇遇事件08
ssrObjCfg.QiYuShiJian08 = {
    ID                              = 300800,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian08OBJ",
    UI_PATH                         = "Q/QiYuShiJian08UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian08,
}

--奇遇事件09
ssrObjCfg.QiYuShiJian09 = {
    ID                              = 300900,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian09OBJ",
    UI_PATH                         = "Q/QiYuShiJian09UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian09,
}

--奇遇事件10
ssrObjCfg.QiYuShiJian10 = {
    ID                              = 301000,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian10OBJ",
    UI_PATH                         = "Q/QiYuShiJian10UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian10,
}

--奇遇事件11
ssrObjCfg.QiYuShiJian11 = {
    ID                              = 301100,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian11OBJ",
    UI_PATH                         = "Q/QiYuShiJian11UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian11,
}

--奇遇事件12
ssrObjCfg.QiYuShiJian12 = {
    ID                              = 301200,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian12OBJ",
    UI_PATH                         = "Q/QiYuShiJian12UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian12,
}

--奇遇事件13
ssrObjCfg.QiYuShiJian13 = {
    ID                              = 301300,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian13OBJ",
    UI_PATH                         = "Q/QiYuShiJian13UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian13,
}

--奇遇事件14
ssrObjCfg.QiYuShiJian14 = {
    ID                              = 301400,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian14OBJ",
    UI_PATH                         = "Q/QiYuShiJian14UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian14,
}

--奇遇事件15
ssrObjCfg.QiYuShiJian15 = {
    ID                              = 301500,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian15OBJ",
    UI_PATH                         = "Q/QiYuShiJian15UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian15,
}

--奇遇事件16
ssrObjCfg.QiYuShiJian16 = {
    ID                              = 301600,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian16OBJ",
    UI_PATH                         = "Q/QiYuShiJian16UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian16,
}

--奇遇事件17
ssrObjCfg.QiYuShiJian17 = {
    ID                              = 301700,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian17OBJ",
    UI_PATH                         = "Q/QiYuShiJian17UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian17,
}

--奇遇事件18
ssrObjCfg.QiYuShiJian18 = {
    ID                              = 301800,

    OBJ_PATH                        = "GUILayout/Q/QiYuShiJian18OBJ",
    UI_PATH                         = "Q/QiYuShiJian18UI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuShiJian18,
}

--奇遇召唤
ssrObjCfg.QiYuZhaoHuan = {
    ID                              = 310000,

    OBJ_PATH                        = "GUILayout/Q/QiYuZhaoHuanOBJ",
    UI_PATH                         = "Q/QiYuZhaoHuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuZhaoHuan,
}

--奇遇副本
ssrObjCfg.QiYuFuBen = {
    ID                              = 320000,

    OBJ_PATH                        = "GUILayout/Q/QiYuFuBenOBJ",
    UI_PATH                         = "Q/QiYuFuBenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiYuFuBen,
}


--玄幽
ssrObjCfg.XuanYou = {
    ID                              = 400000,

    OBJ_PATH                           = "GUILayout/R/XuanYouOBJ",
    UI_PATH                         = "R/XuanYouUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XuanYou,
}
--元素之隙
ssrObjCfg.YuanSuZhiXi = {
    ID                              = 400100,

    OBJ_PATH                           = "GUILayout/R/YuanSuZhiXiOBJ",
    UI_PATH                         = "R/YuanSuZhiXiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YuanSuZhiXi,
}
--湿婆神像
ssrObjCfg.ShiPoShenXiang = {
    ID                              = 400200,

    OBJ_PATH                           = "GUILayout/R/ShiPoShenXiangOBJ",
    UI_PATH                         = "R/ShiPoShenXiangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiPoShenXiang,
}
--暗域裂隙
ssrObjCfg.AnYuLieXi = {
    ID                              = 400300,

    OBJ_PATH                           = "GUILayout/R/AnYuLieXiOBJ",
    UI_PATH                         = "R/AnYuLieXiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.AnYuLieXi,
}
--黑齿宝藏
ssrObjCfg.HeiChiBaoZang = {
    ID                              = 400400,

    OBJ_PATH                           = "GUILayout/R/HeiChiBaoZangOBJ",
    UI_PATH                         = "R/HeiChiBaoZangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HeiChiBaoZang,
}
--封印祭坛
ssrObjCfg.FengYinJiTan = {
    ID                              = 400500,

    OBJ_PATH                           = "GUILayout/R/FengYinJiTanOBJ",
    UI_PATH                         = "R/FengYinJiTanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengYinJiTan,
}
--新月宝珠
ssrObjCfg.XinYueBaoZhu = {
    ID                              = 400600,

    OBJ_PATH                           = "GUILayout/R/XinYueBaoZhuOBJ",
    UI_PATH                         = "R/XinYueBaoZhuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinYueBaoZhu,
}
--被封印的封印棺椁
ssrObjCfg.BeiFengYinDeFengYinGuanGuo = {
    ID                              = 400700,

    OBJ_PATH                           = "GUILayout/R/BeiFengYinDeFengYinGuanGuoOBJ",
    UI_PATH                         = "R/BeiFengYinDeFengYinGuanGuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BeiFengYinDeFengYinGuanGuo,
}
--英灵祭坛
ssrObjCfg.YingLingJiTan = {
    ID                              = 400800,

    OBJ_PATH                           = "GUILayout/R/YingLingJiTanOBJ",
    UI_PATH                         = "R/YingLingJiTanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YingLingJiTan,
}
--剑灵传说
ssrObjCfg.JianLingChuanShuo = {
    ID                              = 400900,

    OBJ_PATH                           = "GUILayout/R/JianLingChuanShuoOBJ",
    UI_PATH                         = "R/JianLingChuanShuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JianLingChuanShuo,
}
--古龙的传承
ssrObjCfg.GuLongDeChuanCheng = {
    ID                              = 401000,

    OBJ_PATH                           = "GUILayout/R/GuLongDeChuanChengOBJ",
    UI_PATH                         = "R/GuLongDeChuanChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuLongDeChuanCheng,
}
--灭世领域
ssrObjCfg.MieShiLingYu = {
    ID                              = 401100,

    OBJ_PATH                           = "GUILayout/R/MieShiLingYuOBJ",
    UI_PATH                         = "R/MieShiLingYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MieShiLingYu,
}
--云烈
ssrObjCfg.YunLie = {
    ID                              = 401200,

    OBJ_PATH                           = "GUILayout/R/YunLieOBJ",
    UI_PATH                         = "R/YunLieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YunLie,
}
--神龙侍卫
ssrObjCfg.ShenLongShiWei = {
    ID                              = 401300,

    OBJ_PATH                           = "GUILayout/R/ShenLongShiWeiOBJ",
    UI_PATH                         = "R/ShenLongShiWeiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenLongShiWei,
}
--蛮荒血脉
ssrObjCfg.ManHuangXueMai = {
    ID                              = 401400,

    OBJ_PATH                           = "GUILayout/R/ManHuangXueMaiOBJ",
    UI_PATH                         = "R/ManHuangXueMaiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ManHuangXueMai,
}
--黄沙之灵
ssrObjCfg.HuangShaZhiLing = {
    ID                              = 401500,

    OBJ_PATH                           = "GUILayout/R/HuangShaZhiLingOBJ",
    UI_PATH                         = "R/HuangShaZhiLingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuangShaZhiLing,
}
--雷鸣之力
ssrObjCfg.LeiMingZhiLi = {
    ID                              = 401600,

    OBJ_PATH                           = "GUILayout/R/LeiMingZhiLiOBJ",
    UI_PATH                         = "R/LeiMingZhiLiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LeiMingZhiLi,
}
--灵魂牢笼
ssrObjCfg.LingHunLaoLong = {
    ID                              = 401700,

    OBJ_PATH                           = "GUILayout/R/LingHunLaoLongOBJ",
    UI_PATH                         = "R/LingHunLaoLongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LingHunLaoLong,
}
--生死境界
ssrObjCfg.ShengSiJingJie = {
    ID                              = 401800,

    OBJ_PATH                           = "GUILayout/R/ShengSiJingJieOBJ",
    UI_PATH                         = "R/ShengSiJingJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengSiJingJie,
}
--一将功成万古枯
ssrObjCfg.YiJiangGongChengWanGuKu = {
    ID                              = 401900,

    OBJ_PATH                           = "GUILayout/R/YiJiangGongChengWanGuKuOBJ",
    UI_PATH                         = "R/YiJiangGongChengWanGuKuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YiJiangGongChengWanGuKu,
}
--归灵仪式
ssrObjCfg.GuiLingYiShi = {
    ID                              = 402000,

    OBJ_PATH                           = "GUILayout/R/GuiLingYiShiOBJ",
    UI_PATH                         = "R/GuiLingYiShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuiLingYiShi,
}
--祖龙秘宝
ssrObjCfg.ZuLongMiBao = {
    ID                              = 402100,

    OBJ_PATH                           = "GUILayout/R/ZuLongMiBaoOBJ",
    UI_PATH                         = "R/ZuLongMiBaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZuLongMiBao,
}
--祖龙之地
ssrObjCfg.ZuLongZhiDi = {
    ID                              = 402150,

    OBJ_PATH                           = "GUILayout/R/ZuLongZhiDiOBJ",
    UI_PATH                         = "R/ZuLongZhiDiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZuLongZhiDi,
}
--前线先锋
ssrObjCfg.QianXianXianFeng = {
    ID                              = 402200,

    OBJ_PATH                           = "GUILayout/R/QianXianXianFengOBJ",
    UI_PATH                         = "R/QianXianXianFengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QianXianXianFeng,
}
--悲鸣哨塔
ssrObjCfg.BeiMingShaoTa = {
    ID                              = 402300,

    OBJ_PATH                           = "GUILayout/R/BeiMingShaoTaOBJ",
    UI_PATH                         = "R/BeiMingShaoTaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BeiMingShaoTa,
}
--平叛将领
ssrObjCfg.PingPanJiangLing = {
    ID                              = 402400,

    OBJ_PATH                           = "GUILayout/R/PingPanJiangLingOBJ",
    UI_PATH                         = "R/PingPanJiangLingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.PingPanJiangLing,
}
--探测Panel
ssrObjCfg.TanCePanel = {
    ID                              = 402450,

    OBJ_PATH                           = "GUILayout/A/TanCePanelOBJ",
    UI_PATH                         = "A/TanCePanelUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TanCePanel,
}
--永恒徽记
ssrObjCfg.YongHengHuiJi = {
    ID                              = 402500,

    OBJ_PATH                           = "GUILayout/R/YongHengHuiJiOBJ",
    UI_PATH                         = "R/YongHengHuiJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YongHengHuiJi,
}
--幽冥鬼使
ssrObjCfg.YouMingGuiShi = {
    ID                              = 402600,

    OBJ_PATH                           = "GUILayout/R/YouMingGuiShiOBJ",
    UI_PATH                         = "R/YouMingGuiShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YouMingGuiShi,
}
--炼魂炉
ssrObjCfg.LianHunLu = {
    ID                              = 402700,

    OBJ_PATH                           = "GUILayout/R/LianHunLuOBJ",
    UI_PATH                         = "R/LianHunLuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LianHunLu,
}

--阴阳八卦盘
ssrObjCfg.YinYangBaGuaPan = {
    ID                              = 402800,

    OBJ_PATH                           = "GUILayout/R/YinYangBaGuaPanOBJ",
    UI_PATH                         = "R/YinYangBaGuaPanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YinYangBaGuaPan,
}
--酆都鬼器
ssrObjCfg.FengDouGuiQi = {
    ID                              = 402900,

    OBJ_PATH                           = "GUILayout/R/FengDouGuiQiOBJ",
    UI_PATH                         = "R/FengDouGuiQiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengDouGuiQi,
}
--鬼域灵器
ssrObjCfg.GuiYuLingQi = {
    ID                              = 403000,

    OBJ_PATH                           = "GUILayout/R/GuiYuLingQiOBJ",
    UI_PATH                         = "R/GuiYuLingQiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuiYuLingQi,
}
--阎王大殿
ssrObjCfg.YanWangDaDian = {
    ID                              = 403100,

    OBJ_PATH                           = "GUILayout/R/YanWangDaDianOBJ",
    UI_PATH                         = "R/YanWangDaDianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YanWangDaDian,
}
--崔判官
ssrObjCfg.CuiPanGuan = {
    ID                              = 403200,

    OBJ_PATH                           = "GUILayout/R/CuiPanGuanOBJ",
    UI_PATH                         = "R/CuiPanGuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.CuiPanGuan,
}
--蛇巢禁地
ssrObjCfg.SheChaoJinDi = {
    ID                              = 403300,

    OBJ_PATH                           = "GUILayout/R/SheChaoJinDiOBJ",
    UI_PATH                         = "R/SheChaoJinDiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.SheChaoJinDi,
}
--亡灵之书
ssrObjCfg.WangLingZhiShu = {
    ID                              = 403400,

    OBJ_PATH                           = "GUILayout/R/WangLingZhiShuOBJ",
    UI_PATH                         = "R/WangLingZhiShuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WangLingZhiShu,
}
--黑水秘技
ssrObjCfg.HeiShuiMiJi = {
    ID                              = 403500,

    OBJ_PATH                           = "GUILayout/R/HeiShuiMiJiOBJ",
    UI_PATH                         = "R/HeiShuiMiJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HeiShuiMiJi,
}
--魔焰炼狱
ssrObjCfg.MoYanLianYu = {
    ID                              = 403600,

    OBJ_PATH                           = "GUILayout/R/MoYanLianYuOBJ",
    UI_PATH                         = "R/MoYanLianYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoYanLianYu,
}
--六道轮回盘
ssrObjCfg.LiuDaoLunHuiPan = {
    ID                              = 403700,

    OBJ_PATH                           = "GUILayout/R/LiuDaoLunHuiPanOBJ",
    UI_PATH                         = "R/LiuDaoLunHuiPanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LiuDaoLunHuiPan,
}
--洪荒之门
ssrObjCfg.HongHuangZhiMen = {
    ID                              = 403800,

    OBJ_PATH                           = "GUILayout/R/HongHuangZhiMenOBJ",
    UI_PATH                         = "R/HongHuangZhiMenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HongHuangZhiMen,
}
--五行灵体
ssrObjCfg.WuXingLingTi = {
    ID                              = 403900,

    OBJ_PATH                           = "GUILayout/R/WuXingLingTiOBJ",
    UI_PATH                         = "R/WuXingLingTiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WuXingLingTi,
}
--天劫之路
ssrObjCfg.TianJieZhiLu = {
    ID                              = 404000,

    OBJ_PATH                           = "GUILayout/R/TianJieZhiLuOBJ",
    UI_PATH                         = "R/TianJieZhiLuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TianJieZhiLu,
}
--丹尘
ssrObjCfg.DanChen = {
    ID                              = 404100,

    OBJ_PATH                           = "GUILayout/R/DanChenOBJ",
    UI_PATH                         = "R/DanChenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.DanChen,
}
--贪欲不止
ssrObjCfg.TanYuBuZhi = {
    ID                              = 404200,

    OBJ_PATH                           = "GUILayout/R/TanYuBuZhiOBJ",
    UI_PATH                         = "R/TanYuBuZhiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TanYuBuZhi,
}
--佛法无边
ssrObjCfg.FoFaWuBian = {
    ID                              = 404300,

    OBJ_PATH                           = "GUILayout/R/FoFaWuBianOBJ",
    UI_PATH                         = "R/FoFaWuBianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FoFaWuBian,
}
--风行者
ssrObjCfg.FengXingZhe = {
    ID                              = 404400,

    OBJ_PATH                           = "GUILayout/R/FengXingZheOBJ",
    UI_PATH                         = "R/FengXingZheUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengXingZhe,
}
--灭世牢笼
ssrObjCfg.MieShiLaoLong = {
    ID                              = 404500,

    OBJ_PATH                           = "GUILayout/R/MieShiLaoLongOBJ",
    UI_PATH                         = "R/MieShiLaoLongUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MieShiLaoLong,
}
--龙器灭世骸骨
ssrObjCfg.LongQiMieShiHaiGu = {
    ID                              = 404600,

    OBJ_PATH                           = "GUILayout/R/LongQiMieShiHaiGuOBJ",
    UI_PATH                         = "R/LongQiMieShiHaiGuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LongQiMieShiHaiGu,
}
--寒霜王座
ssrObjCfg.HanShuangWangZuo = {
    ID                              = 404700,

    OBJ_PATH                           = "GUILayout/R/HanShuangWangZuoOBJ",
    UI_PATH                         = "R/HanShuangWangZuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HanShuangWangZuo,
}
--洪荒之力
ssrObjCfg.HongHuangZhiLi = {
    ID                              = 404800,

    OBJ_PATH                           = "GUILayout/R/HongHuangZhiLiOBJ",
    UI_PATH                         = "R/HongHuangZhiLiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HongHuangZhiLi,
}
--哥布林的弱点
ssrObjCfg.GeBuLinDeRuoDian = {
    ID                              = 404900,

    OBJ_PATH                           = "GUILayout/R/GeBuLinDeRuoDianOBJ",
    UI_PATH                         = "R/GeBuLinDeRuoDianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GeBuLinDeRuoDian,
}
--解救少女
ssrObjCfg.JieJiuShaoNv = {
    ID                              = 405000,

    OBJ_PATH                           = "GUILayout/R/JieJiuShaoNvOBJ",
    UI_PATH                         = "R/JieJiuShaoNvUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JieJiuShaoNv,
}
--一叶一菩提
ssrObjCfg.YiYeYiPuTi = {
    ID                              = 405100,

    OBJ_PATH                           = "GUILayout/R/YiYeYiPuTiOBJ",
    UI_PATH                         = "R/YiYeYiPuTiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YiYeYiPuTi,
}
--月光余晖
ssrObjCfg.YueGuangYuHui = {
    ID                              = 405200,

    OBJ_PATH                        = "GUILayout/R/YueGuangYuHuiOBJ",
    UI_PATH                         = "R/YueGuangYuHuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YueGuangYuHui,
}
--六道魔域
ssrObjCfg.LiuDaoMoYu = {
    ID                              = 420000,

    OBJ_PATH                        = "GUILayout/F/LiuDaoMoYuOBJ",
    UI_PATH                         = "F/LiuDaoMoYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LiuDaoMoYu,
}

--六道仙人
ssrObjCfg.LiuDaoXianRen = {
    ID                              = 421000,

    OBJ_PATH                        = "GUILayout/F/LiuDaoXianRenOBJ",
    UI_PATH                         = "F/LiuDaoXianRenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LiuDaoXianRen,

}

--日耀结界
ssrObjCfg.RiYaoJieJie = {
    ID                              = 422000,

    OBJ_PATH                        = "GUILayout/F/RiYaoJieJieOBJ",
    UI_PATH                         = "F/RiYaoJieJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.RiYaoJieJie,
}

--魔法的试炼
ssrObjCfg.MoFaDeShiLian = {
    ID                              = 423000,

    OBJ_PATH                        = "GUILayout/F/MoFaDeShiLianOBJ",
    UI_PATH                         = "F/MoFaDeShiLianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MoFaDeShiLian,
}

--焰祭师赫达尔
ssrObjCfg.YanJiShiHeDaEr = {
    ID                              = 424000,

    OBJ_PATH                        = "GUILayout/F/YanJiShiHeDaErOBJ",
    UI_PATH                         = "F/YanJiShiHeDaErUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YanJiShiHeDaEr,
}

--海湾渔夫
ssrObjCfg.HaiWanYuFu = {
    ID                              = 425000,

    OBJ_PATH                        = "GUILayout/F/HaiWanYuFuOBJ",
    UI_PATH                         = "F/HaiWanYuFuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HaiWanYuFu,
}

--幽灵沉船
ssrObjCfg.YouLingChenChuan = {
    ID                              = 426000,

    OBJ_PATH                        = "GUILayout/F/YouLingChenChuanOBJ",
    UI_PATH                         = "F/YouLingChenChuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YouLingChenChuan,
}

--命运罗盘
ssrObjCfg.MingYunLuoPan = {
    ID                              = 427000,

    OBJ_PATH                        = "GUILayout/F/MingYunLuoPanOBJ",
    UI_PATH                         = "F/MingYunLuoPanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MingYunLuoPan,
}

--极寒之心
ssrObjCfg.JiHanZhiXin = {
    ID                              = 428000,

    OBJ_PATH                        = "GUILayout/F/JiHanZhiXinOBJ",
    UI_PATH                         = "F/JiHanZhiXinUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiHanZhiXin,
}

--破晓之眼
ssrObjCfg.PoXiaoZhiYan = {
    ID                              = 429000,

    OBJ_PATH                        = "GUILayout/F/PoXiaoZhiYanOBJ",
    UI_PATH                         = "F/PoXiaoZhiYanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.PoXiaoZhiYan,
}

--悲魂圣火
ssrObjCfg.BeiHunShengHuo = {
    ID                              = 430000,

    OBJ_PATH                        = "GUILayout/F/BeiHunShengHuoOBJ",
    UI_PATH                         = "F/BeiHunShengHuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BeiHunShengHuo,
}

--图腾圣火
ssrObjCfg.TuTengShengHuo = {
    ID                              = 431000,

    OBJ_PATH                        = "GUILayout/F/TuTengShengHuoOBJ",
    UI_PATH                         = "F/TuTengShengHuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TuTengShengHuo,
}

--禁忌圣火
ssrObjCfg.JinJiShengHuo = {
    ID                              = 432000,

    OBJ_PATH                        = "GUILayout/F/JinJiShengHuoOBJ",
    UI_PATH                         = "F/JinJiShengHuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JinJiShengHuo,
}

--迷失圣火
ssrObjCfg.MiShiShengHuo = {
    ID                              = 433000,

    OBJ_PATH                        = "GUILayout/F/MiShiShengHuoOBJ",
    UI_PATH                         = "F/MiShiShengHuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MiShiShengHuo,
}

--圣火遗灰
ssrObjCfg.ShengHuoYiHui = {
    ID                              = 434000,

    OBJ_PATH                        = "GUILayout/F/ShengHuoYiHuiOBJ",
    UI_PATH                         = "F/ShengHuoYiHuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengHuoYiHui,
}

--迷途者
ssrObjCfg.MiTuZhe = {
    ID                              = 435000,

    OBJ_PATH                        = "GUILayout/F/MiTuZheOBJ",
    UI_PATH                         = "F/MiTuZheUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MiTuZhe,
}

--永恒终点
ssrObjCfg.YongHengZhongDian = {
    ID                              = 439000,

    OBJ_PATH                        = "GUILayout/F/YongHengZhongDianOBJ",
    UI_PATH                         = "F/YongHengZhongDianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YongHengZhongDian,
}

--死神祭坛
ssrObjCfg.SiShenJiTan = {
    ID                              = 440000,

    OBJ_PATH                        = "GUILayout/F/SiShenJiTanOBJ",
    UI_PATH                         = "F/SiShenJiTanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.SiShenJiTan,
}

--古地下遗迹
ssrObjCfg.GuDiXiaYiJi = {
    ID                              = 441000,

    OBJ_PATH                        = "GUILayout/F/GuDiXiaYiJiOBJ",
    UI_PATH                         = "F/GuDiXiaYiJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.GuDiXiaYiJi,

}

--造化结晶
ssrObjCfg.ZaoHuaJieJing = {
    ID                              = 442000,

    OBJ_PATH                        = "GUILayout/D/ZaoHuaJieJingOBJ",
    UI_PATH                         = "D/ZaoHuaJieJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZaoHuaJieJing,
}

--哈法西斯称号
ssrObjCfg.HaFaXiSiChengHao = {
    ID                              = 443000,

    OBJ_PATH                           = "GUILayout/D/HaFaXiSiChengHaoOBJ",
    UI_PATH                         = "D/HaFaXiSiChengHaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HaFaXiSiChengHao,
}


--七星拱月阵
ssrObjCfg.QiXingGongYueZhen = {
    ID                              = 444000,

    OBJ_PATH                        = "GUILayout/F/QiXingGongYueZhenOBJ",
    UI_PATH                         = "F/QiXingGongYueZhenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiXingGongYueZhen,
}

--星辰变
ssrObjCfg.XingChenBian = {
    ID                              = 445000,

    OBJ_PATH                        = "GUILayout/F/XingChenBianOBJ",
    UI_PATH                         = "F/XingChenBianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XingChenBian,
}


--血色狂怒
ssrObjCfg.XueSeKuangNu = {
    ID                              = 446000,

    OBJ_PATH                        = "GUILayout/F/XueSeKuangNuOBJ",
    UI_PATH                         = "F/XueSeKuangNuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XueSeKuangNu,
}

--时空轮盘
ssrObjCfg.ShiKongLunPan = {
    ID                              = 447000,

    OBJ_PATH                        = "GUILayout/F/ShiKongLunPanOBJ",
    UI_PATH                         = "F/ShiKongLunPanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShiKongLunPan,
}

--重塑轮回
ssrObjCfg.ZhongSuLunHui = {
    ID                              = 448000,

    OBJ_PATH                        = "GUILayout/F/ZhongSuLunHuiOBJ",
    UI_PATH                         = "F/ZhongSuLunHuiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhongSuLunHui,
}


--龙魂烙印
ssrObjCfg.LongHunLaoYin = {
    ID                              = 449000,

    OBJ_PATH                        = "GUILayout/F/LongHunLaoYinOBJ",
    UI_PATH                         = "F/LongHunLaoYinUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LongHunLaoYin,
}



--死亡之堡底层
ssrObjCfg.SiWangZhiBaoDiCeng = {
    ID                              = 450000,

    OBJ_PATH                        = "GUILayout/F/SiWangZhiBaoDiCengOBJ",
    UI_PATH                         = "F/SiWangZhiBaoDiCengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.SiWangZhiBaoDiCeng,
}


--腐化花圃
ssrObjCfg.FuHuaHuaPu = {
    ID                              = 451000,

    OBJ_PATH                        = "GUILayout/F/FuHuaHuaPuOBJ",
    UI_PATH                         = "F/FuHuaHuaPuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FuHuaHuaPu,
}

--寂灭归墟
ssrObjCfg.JiMieGuiXu = {
    ID                              = 452000,

    OBJ_PATH                        = "GUILayout/F/JiMieGuiXuOBJ",
    UI_PATH                         = "F/JiMieGuiXuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiMieGuiXu,
}

--黑度通道
ssrObjCfg.HeiDuTongDao = {
    ID                              = 453000,

    OBJ_PATH                           = "GUILayout/F/HeiDuTongDaoOBJ",
    UI_PATH                         = "F/HeiDuTongDaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HeiDuTongDao,
}

--基因改造
ssrObjCfg.JiYinGaiZao = {
    ID                              = 454000,

    OBJ_PATH                        = "GUILayout/F/JiYinGaiZaoOBJ",
    UI_PATH                         = "F/JiYinGaiZaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiYinGaiZao,
}

--珍宝鉴定
ssrObjCfg.ZhenBaoJianDing = {
    ID                              = 455000,

    OBJ_PATH                        = "GUILayout/F/ZhenBaoJianDingOBJ",
    UI_PATH                         = "F/ZhenBaoJianDingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhenBaoJianDing,
}

--超神器飞升
ssrObjCfg.ChaoShenQiFeiSheng = {
    ID                              = 456000,

    OBJ_PATH                        = "GUILayout/F/ChaoShenQiFeiShengOBJ",
    UI_PATH                         = "F/ChaoShenQiFeiShengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChaoShenQiFeiSheng,
}
----------------------------------------跨服相关
ssrObjCfg.KuaFuBuff = {
    ID                              = 500000,

    OBJ_PATH                           = "GUILayout/A/KuaFuBuffOBJ",
    --UI_PATH                         = "D/HaFaXiSiChengHaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuaFuBuff,
}

--战将夺旗
ssrObjCfg.ZhanJiangDuoQi = {
    ID                              = 510000,

    OBJ_PATH                           = "GUILayout/KuaFu/ZhanJiangDuoQiOBJ",
    UI_PATH                         = "KuaFu/ZhanJiangDuoQiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ZhanJiangDuoQi,
}

--天下第一
ssrObjCfg.TianXiaDiYi = {
    ID                              = 520000,

    OBJ_PATH                           = "GUILayout/KuaFu/TianXiaDiYiOBJ",
    UI_PATH                         = "KuaFu/TianXiaDiYiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TianXiaDiYi,
}

--矿石大亨
ssrObjCfg.KuangShiDaHeng = {
    ID                              = 530000,

    OBJ_PATH                           = "GUILayout/KuaFu/KuangShiDaHengOBJ",
    UI_PATH                         = "KuaFu/KuangShiDaHengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuangShiDaHeng,
}
--跨服战神榜
ssrObjCfg.KuaFuZhanShenBang = {
    ID                              = 540000,

    OBJ_PATH                           = "GUILayout/KuaFu/KuaFuZhanShenBangOBJ",
    UI_PATH                         = "KuaFu/KuaFuZhanShenBangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuaFuZhanShenBang,
}

--富甲天下
ssrObjCfg.FuJiaTianXia = {
    ID                              = 550000,

    OBJ_PATH                        = "GUILayout/KuaFu/FuJiaTianXiaOBJ",
    UI_PATH                         = "KuaFu/FuJiaTianXiaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FuJiaTianXia,
}

--混装合成
ssrObjCfg.HunZhuangHeCheng = {
    ID                              = 560000,

    OBJ_PATH                           = "GUILayout/KuaFu/HunZhuangHeChengOBJ",
    UI_PATH                         = "KuaFu/HunZhuangHeChengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunZhuangHeCheng,
}

--积分兑换
ssrObjCfg.JiFenDuiHuan = {
    ID                              = 570000,

    OBJ_PATH                           = "GUILayout/KuaFu/JiFenDuiHuanOBJ",
    UI_PATH                         = "KuaFu/JiFenDuiHuanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.JiFenDuiHuan,
}

--神魂之地
ssrObjCfg.ShenHunZhiDi = {
    ID                              = 580000,

    OBJ_PATH                        = "GUILayout/KuaFu/ShenHunZhiDiOBJ",
    UI_PATH                         = "KuaFu/ShenHunZhiDiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenHunZhiDi,
}

--神魂炼狱
ssrObjCfg.ShenHunLianYu = {
    ID                              = 590000,

    OBJ_PATH                           = "GUILayout/KuaFu/ShenHunLianYuOBJ",
    UI_PATH                         = "KuaFu/ShenHunLianYuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenHunLianYu,
}

-------------------------------------------------------八大陆-----------------------------------------------------------

--混沌剑甲
ssrObjCfg.ShenHunJianJia = {
    ID                              = 600000,

    OBJ_PATH                           = "GUILayout/G/ShenHunJianJiaOBJ",
    UI_PATH                         = "G/ShenHunJianJiaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenHunJianJia,
}

--圣人法相
ssrObjCfg.ShengRenFaXiang = {
    ID                              = 610000,

    OBJ_PATH                           = "GUILayout/G/ShengRenFaXiangOBJ",
    UI_PATH                         = "G/ShengRenFaXiangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengRenFaXiang,
}

--圣人阁
ssrObjCfg.ShengRenGe = {
    ID                              = 620000,

    OBJ_PATH                           = "GUILayout/G/ShengRenGeOBJ",
    UI_PATH                         = "G/ShengRenGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengRenGe,
}

--轮回永劫
ssrObjCfg.LunHuiYongJie = {
    ID                              = 630000,

    OBJ_PATH                           = "GUILayout/G/LunHuiYongJieOBJ",
    UI_PATH                         = "G/LunHuiYongJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LunHuiYongJie,
}

--新月幻境
ssrObjCfg.XinYueHuanJing = {
    ID                              = 640000,

    OBJ_PATH                           = "GUILayout/G/XinYueHuanJingOBJ",
    UI_PATH                         = "G/XinYueHuanJingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinYueHuanJing,
}

--风隙劫
ssrObjCfg.FengXiJie = {
    ID                              = 650000,

    OBJ_PATH                           = "GUILayout/G/FengXiJieOBJ",
    UI_PATH                         = "G/FengXiJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FengXiJie,
}

--火焰劫
ssrObjCfg.HuoYanJie = {
    ID                              = 660000,

    OBJ_PATH                           = "GUILayout/G/HuoYanJieOBJ",
    UI_PATH                         = "G/HuoYanJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HuoYanJie,
}

--水镜劫
ssrObjCfg.ShuiJingJie = {
    ID                              = 670000,

    OBJ_PATH                           = "GUILayout/G/ShuiJingJieOBJ",
    UI_PATH                         = "G/ShuiJingJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShuiJingJie,
}

--土缚劫
ssrObjCfg.TuFuJie = {
    ID                              = 680000,

    OBJ_PATH                           = "GUILayout/G/TuFuJieOBJ",
    UI_PATH                         = "G/TuFuJieUI",

    NET_MESSAGE                     = ssrNetMsgCfg.TuFuJie,
}

--雷隐天尊阁
ssrObjCfg.LeiYinTianZunGe = {
    ID                              = 690000,

    OBJ_PATH                           = "GUILayout/G/LeiYinTianZunGeOBJ",
    UI_PATH                         = "G/LeiYinTianZunGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LeiYinTianZunGe,
}

--炽焰天尊阁
ssrObjCfg.ChiYanTianZunGe = {
    ID                              = 700000,

    OBJ_PATH                           = "GUILayout/G/ChiYanTianZunGeOBJ",
    UI_PATH                         = "G/ChiYanTianZunGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChiYanTianZunGe,
}

--碧波天尊阁
ssrObjCfg.BiBoTianZunGe = {
    ID                              = 710000,

    OBJ_PATH                           = "GUILayout/G/BiBoTianZunGeOBJ",
    UI_PATH                         = "G/BiBoTianZunGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BiBoTianZunGe,
}

--落岩天尊阁
ssrObjCfg.LuoYanTianZunGe = {
    ID                              = 720000,

    OBJ_PATH                           = "GUILayout/G/LuoYanTianZunGeOBJ",
    UI_PATH                         = "G/LuoYanTianZunGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LuoYanTianZunGe,
}

--雷隐强化
ssrObjCfg.LeiYinQiangHua = {
    ID                              = 721000,

    OBJ_PATH                           = "GUILayout/G/LeiYinQiangHuaOBJ",
    UI_PATH                         = "G/LeiYinQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LeiYinQiangHua,
}

--炽热强化
ssrObjCfg.ChiReQiangHua = {
    ID                              = 722000,

    OBJ_PATH                           = "GUILayout/G/ChiReQiangHuaOBJ",
    UI_PATH                         = "G/ChiReQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChiReQiangHua,
}
--碧波强化
ssrObjCfg.BiBoQiangHua = {
    ID                              = 723000,

    OBJ_PATH                           = "GUILayout/G/BiBoQiangHuaOBJ",
    UI_PATH                         = "G/BiBoQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BiBoQiangHua,
}

--落岩强化
ssrObjCfg.LuoYanQiangHua = {
    ID                              = 724000,

    OBJ_PATH                           = "GUILayout/G/LuoYanQiangHuaOBJ",
    UI_PATH                         = "G/LuoYanQiangHuaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LuoYanQiangHua,
}

--混元法相
ssrObjCfg.HunYuanFaXiang = {
    ID                              = 725000,

    OBJ_PATH                           = "GUILayout/G/HunYuanFaXiangOBJ",
    UI_PATH                         = "G/HunYuanFaXiangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunYuanFaXiang,
}

--超神阁
ssrObjCfg.ChaoShenGe = {
    ID                              = 726000,

    OBJ_PATH                           = "GUILayout/G/ChaoShenGeOBJ",
    UI_PATH                         = "G/ChaoShenGeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChaoShenGe,
}
--千门八将
ssrObjCfg.QianMenBaJiang = {
    ID                              = 727000,

    OBJ_PATH                           = "GUILayout/G/QianMenBaJiangOBJ",
    UI_PATH                         = "G/QianMenBaJiangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QianMenBaJiang,
}
--夜幕将领
ssrObjCfg.YeMuJiangLing = {
    ID                              = 728000,

    OBJ_PATH                           = "GUILayout/G/YeMuJiangLingOBJ",
    UI_PATH                         = "G/YeMuJiangLingUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YeMuJiangLing,
}
--溶血之池
ssrObjCfg.RongXueZhiChi = {
    ID                              = 729000,

    OBJ_PATH                           = "GUILayout/G/RongXueZhiChiOBJ",
    UI_PATH                         = "G/RongXueZhiChiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.RongXueZhiChi,
}
--星璀璨
ssrObjCfg.XingCuiCan = {
    ID                              = 730000,

    OBJ_PATH                           = "GUILayout/G/XingCuiCanOBJ",
    UI_PATH                         = "G/XingCuiCanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XingCuiCan,
}
--御神机
ssrObjCfg.YuShenJi = {
    ID                              = 731000,

    OBJ_PATH                           = "GUILayout/G/YuShenJiOBJ",
    UI_PATH                         = "G/YuShenJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YuShenJi,
}
--月夜密室
ssrObjCfg.YueYeMiShi = {
    ID                              = 732000,

    OBJ_PATH                           = "GUILayout/G/YueYeMiShiOBJ",
    UI_PATH                         = "G/YueYeMiShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YueYeMiShi,
}
--月辉庇护
ssrObjCfg.YueHuiBiHu = {
    ID                              = 733000,

    OBJ_PATH                           = "GUILayout/G/YueHuiBiHuOBJ",
    UI_PATH                         = "G/YueHuiBiHuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YueHuiBiHu,
}
--无序空间
ssrObjCfg.WuXuKongJian = {
    ID                              = 734000,

    OBJ_PATH                           = "GUILayout/G/WuXuKongJianOBJ",
    UI_PATH                         = "G/WuXuKongJianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WuXuKongJian,
}

--新月秘宝阁1
ssrObjCfg.XinYueMiBaoGe1 = {
    ID                              = 735000,

    OBJ_PATH                           = "GUILayout/G/XinYueMiBaoGe1OBJ",
    UI_PATH                         = "G/XinYueMiBaoGe1UI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinYueMiBaoGe1,
}

--新月秘宝阁2
ssrObjCfg.XinYueMiBaoGe2 = {
    ID                              = 736000,

    OBJ_PATH                           = "GUILayout/G/XinYueMiBaoGe2OBJ",
    UI_PATH                         = "G/XinYueMiBaoGe2UI",

    NET_MESSAGE                     = ssrNetMsgCfg.XinYueMiBaoGe2,
}

--夜风王座
ssrObjCfg.YeFengWangZuo = {
    ID                              = 737000,

    OBJ_PATH                           = "GUILayout/G/YeFengWangZuoOBJ",
    UI_PATH                         = "G/YeFengWangZuoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.YeFengWangZuo,
}
--不起眼的乞丐
ssrObjCfg.BuQiYanDeQiGai = {
    ID                              = 738000,

    OBJ_PATH                           = "GUILayout/G/BuQiYanDeQiGaiOBJ",
    UI_PATH                         = "G/BuQiYanDeQiGaiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.BuQiYanDeQiGai,
}
--混乱赌徒
ssrObjCfg.HunLuanDuTu = {
    ID                              = 739000,

    OBJ_PATH                           = "GUILayout/G/HunLuanDuTuOBJ",
    UI_PATH                         = "G/HunLuanDuTuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.HunLuanDuTu,
}
--神器格扩展
ssrObjCfg.ShenQiGeKuoZhan = {
    ID                              = 740000,

    OBJ_PATH                           = "GUILayout/KuaFu/ShenQiGeKuoZhanOBJ",
    UI_PATH                         = "KuaFu/ShenQiGeKuoZhanUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenQiGeKuoZhan,
}
--超神器投保
ssrObjCfg.ChaoShenQiTouBao = {
    ID                              = 741000,

    OBJ_PATH                           = "GUILayout/KuaFu/ChaoShenQiTouBaoOBJ",
    UI_PATH                         = "KuaFu/ChaoShenQiTouBaoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChaoShenQiTouBao,
}

--奋进时装盒
ssrObjCfg.FenJinShiZhuangHe = {
    ID                              = 743000,

    OBJ_PATH                        = "GUILayout/A/FenJinShiZhuangHeOBJ",
    UI_PATH                         = "A/FenJinShiZhuangHeUI",

    NET_MESSAGE                     = ssrNetMsgCfg.FenJinShiZhuangHe,
}

--万魂殿
ssrObjCfg.WanHunDian = {
    ID                              = 744000,

    OBJ_PATH                        = "GUILayout/D/WanHunDianOBJ",
    UI_PATH                         = "D/WanHunDianUI",

    NET_MESSAGE                     = ssrNetMsgCfg.WanHunDian,
}

--七混归魄
ssrObjCfg.QiHunGuiPo = {
    ID                              = 745000,

    OBJ_PATH                           = "GUILayout/D/QiHunGuiPoOBJ",
    UI_PATH                         = "D/QiHunGuiPoUI",

    NET_MESSAGE                     = ssrNetMsgCfg.QiHunGuiPo,
}

--查看他人气运
ssrObjCfg.ChaKanTaRenQiYun = {
    ID                              = 746000,

    OBJ_PATH                           = "GUILayout/A/ChaKanTaRenQiYunOBJ",
    UI_PATH                         = "A/ChaKanTaRenQiYunUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ChaKanTaRenQiYun,
}
--神魂古墓
ssrObjCfg.ShenHunGuMu = {
    ID                              = 747000,

    OBJ_PATH                           = "GUILayout/KuaFu/ShenHunGuMuOBJ",
    UI_PATH                         = "KuaFu/ShenHunGuMuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShenHunGuMu,
}
--龙骸遗迹
ssrObjCfg.LongHaiYiJi = {
    ID                              = 748000,

    OBJ_PATH                           = "GUILayout/KuaFu/LongHaiYiJiOBJ",
    UI_PATH                         = "KuaFu/LongHaiYiJiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.LongHaiYiJi,
}
--双节活动Main
ssrObjCfg.ShuangJieHuoDongMain = {
    ID                              = 749000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/ShuangJieHuoDongMainOBJ",
    UI_PATH                         = "ShuangJieHuoDong/ShuangJieHuoDongMainUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShuangJieHuoDongMain,
}
--牛了个马
ssrObjCfg.NiuLeGeMa = {
    ID                              = 750000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/NiuLeGeMaOBJ",
    UI_PATH                         = "ShuangJieHuoDong/NiuLeGeMaUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuLeGeMa,
}

--麋鹿宝藏
ssrObjCfg.MiLuBaoZang = {
    ID                              = 751000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/MiLuBaoZangOBJ",
    UI_PATH                         = "ShuangJieHuoDong/MiLuBaoZangUI",

    NET_MESSAGE                     = ssrNetMsgCfg.MiLuBaoZang,
}
--幸运大富翁
ssrObjCfg.XingYunDaFuWeng = {
    ID                              = 752000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/XingYunDaFuWengOBJ",
    UI_PATH                         = "ShuangJieHuoDong/XingYunDaFuWengUI",

    NET_MESSAGE                     = ssrNetMsgCfg.XingYunDaFuWeng,
}
--圣诞树
ssrObjCfg.ShengDanShu = {
    ID                              = 753000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/ShengDanShuOBJ",
    UI_PATH                         = "ShuangJieHuoDong/ShengDanShuUI",

    NET_MESSAGE                     = ssrNetMsgCfg.ShengDanShu,
}
--钓鱼大师
ssrObjCfg.DiaoYuDaShi = {
    ID                              = 754000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/DiaoYuDaShiOBJ",
    UI_PATH                         = "ShuangJieHuoDong/DiaoYuDaShiUI",

    NET_MESSAGE                     = ssrNetMsgCfg.DiaoYuDaShi,
}
--牛了个马NPC
ssrObjCfg.NiuLeGeMaNpc = {
    ID                              = 755000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/NiuLeGeMaNpcOBJ",
    UI_PATH                         = "ShuangJieHuoDong/NiuLeGeMaNpcUI",

    NET_MESSAGE                     = ssrNetMsgCfg.NiuLeGeMaNpc,
}
--狂欢小镇
ssrObjCfg.KuangHuanXiaoZhen = {
    ID                              = 756000,

    OBJ_PATH                           = "GUILayout/ShuangJieHuoDong/KuangHuanXiaoZhenOBJ",
    UI_PATH                         = "ShuangJieHuoDong/KuangHuanXiaoZhenUI",

    NET_MESSAGE                     = ssrNetMsgCfg.KuangHuanXiaoZhen,
}
------------------------------------------------分页配置都要放在最下面------------------------------------------------
----宝石分页界面
--ssrObjCfg.DemoPagingGemstoneObj = {
--    ID                              = 90000,
--    OBJ_ORDER                       = {ssrObjCfg.GemInlay, ssrObjCfg.GemFuse},
--    OBJ_DESCRIBE                    = {"镶\n嵌", "合\n成"},
--    OBJ_TITLE                       = {"宝石系统"},
--    RP_EVENT                        = ssrEventCfg.RpPagingGemstone,
--
--    OBJ_PATH                        = "GUILayout/A/PagingOBJ",
--    UI_PATH                         = "A/PagingGemUI",
--}
--
----开服活动分页界面
-- ssrObjCfg.SYHDPagingGemstoneObj = {
--     ID                              = 90100,
--     OBJ_ORDER                       = {ssrObjCfg.FuLi1, ssrObjCfg.FuLi2,ssrObjCfg.FuLi3, ssrObjCfg.FuLi4, ssrObjCfg.FuLi5, ssrObjCfg.FuLi6,},
--     OBJ_DESCRIBE                    = {"每日福利","击杀福利", "福利礼包", "实物兑换", "微信礼包", "限时0元购"},
--     OBJ_TITLE                       = {"福利大厅"},
--     RP_EVENT                        = ssrEventCfg.RpPagingGemstone,

--     OBJ_PATH                        = "GUILayout/A/PagingOBJ",
--     UI_PATH                         = "A/PagingUI",
-- }

-- ----装备打造
-- ssrObjCfg.HeChengFrameObj = {
--     ID                              = 90200,
--     OBJ_ORDER                       = {ssrObjCfg.EquipMake1, ssrObjCfg.EquipMake2, ssrObjCfg.EquipMake3, ssrObjCfg.EquipMake4, ssrObjCfg.EquipMake5},
--     OBJ_DESCRIBE                    = {"血石打造","神印打造", "战鼓合成", "护符打造", "宝石打造"},
--     OBJ_TITLE                       = {"特殊打造"},
--     RP_EVENT                        = ssrEventCfg.HeChengFrameObj,

--     OBJ_PATH                        = "GUILayout/A/HeChengFrameOBJ",
--     UI_PATH                         = "A/HeChengFrameUI",
-- }

--赋值 PAGING_OBJ 字段
for _,objcfg in pairs(ssrObjCfg) do
    if objcfg.OBJ_ORDER then
        for _,module_objcfg in ipairs(objcfg.OBJ_ORDER) do
            module_objcfg.PAGING_OBJ = objcfg
        end
    end
end


return ssrObjCfg