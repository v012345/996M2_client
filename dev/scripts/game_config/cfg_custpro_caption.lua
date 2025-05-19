local config = { 
	[1] = { 
		id=1,
		value="<怪物爆率：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[2] = { 
		id=2,
		value="<鞭尸概率：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/CusomAttIcon/bianshigailv.png#res/custom/CusomAttIcon/bianshigailv.png",
	},
	[3] = { 
		id=3,
		value="<防止暴击：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[4] = { 
		id=4,
		value="<最大攻击力：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[5] = { 
		id=5,
		value="<最大生命值：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[6] = { 
		id=6,
		value="<经验倍数：/FCOLOR=249><+%s/FCOLOR=95>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[7] = { 
		id=7,
		value="<打怪修仙值：/FCOLOR=249><+%s/FCOLOR=95>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[8] = { 
		id=8,
		value="<每轮仙术可免费重置/FCOLOR=215><[%s]/FCOLOR=253><次/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[9] = { 
		id=9,
		value="<对怪伤害:/FCOLOR=215><+%s/FCOLOR=70>",
		icon="1=res/custom/CusomAttIcon/duiguaishanghai.png#res/custom/CusomAttIcon/duiguaishanghai.png",
	},
	[10] = { 
		id=10,
		value="<暴击几率:/FCOLOR=215><+%s/FCOLOR=70>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[11] = { 
		id=11,
		value="<体力:/FCOLOR=215><+%s/FCOLOR=70>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[12] = { 
		id=12,
		value="<暴击伤害:/FCOLOR=253><+%s/FCOLOR=215>",
		icon="1=res/custom/CusomAttIcon/baojishanghai.png#res/custom/CusomAttIcon/baojishanghai.png",
	},
	[13] = { 
		id=13,
		value="<对怪切割:/FCOLOR=254><+%s/FCOLOR=90>",
		icon="1=res/custom/CusomAttIcon/qiege.png#res/custom/CusomAttIcon/qiege.png",
	},
	[14] = { 
		id=14,
		value="<当前装备攻击:/FCOLOR=249><+%s/FCOLOR=254>",
		icon="1=res/custom/CusomAttIcon/dangqiangongji.png#res/custom/CusomAttIcon/dangqiangongji.png",
	},
	[15] = { 
		id=15,
		value="<PK增伤:/FCOLOR=254><+%s/FCOLOR=252>",
		icon="1=res/custom/CusomAttIcon/pkzengshang.png#res/custom/CusomAttIcon/pkzengshang.png",
	},
	[16] = { 
		id=16,
		value="<半月技能威力:/FCOLOR=92><+%s/FCOLOR=252>",
		icon="1=res/custom/CusomAttIcon/banyueweili.png#res/custom/CusomAttIcon/banyueweili.png",
	},
	[17] = { 
		id=17,
		value="<烈火技能威力:/FCOLOR=249><+%s/FCOLOR=252>",
		icon="1=res/custom/CusomAttIcon/liehuoweili.png#res/custom/CusomAttIcon/liehuoweili.png",
	},
	[18] = { 
		id=18,
		value="<开天技能威力:/FCOLOR=252><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/kaitianweili.png#res/custom/CusomAttIcon/kaitianweili.png",
	},
	[19] = { 
		id=19,
		value="<逐日技能威力:/FCOLOR=252><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/zhuriweili.png#res/custom/CusomAttIcon/zhuriweili.png",
	},
	[20] = { 
		id=20,
		value="<物理伤害减少:/FCOLOR=249><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/wulishanghaijianshao.png#res/custom/CusomAttIcon/wulishanghaijianshao.png",
	},
	[21] = { 
		id=21,
		value="<当前装备防御:/FCOLOR=249><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/dangqianfangyu.png#res/custom/CusomAttIcon/dangqianfangyu.png",
	},
	[22] = { 
		id=22,
		value="<PK减伤:/FCOLOR=249><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/pkjianshang.png#res/custom/CusomAttIcon/pkjianshang.png",
	},
	[23] = { 
		id=23,
		value="<鞭尸概率:/FCOLOR=251><+%s/FCOLOR=253>",
		icon="1=res/custom/CusomAttIcon/bianshigailv.png#res/custom/CusomAttIcon/bianshigailv.png",
	},
	[24] = { 
		id=24,
		value="<当前装备生命:/FCOLOR=254><+%s/FCOLOR=253>",
		icon="1=res/custom/CusomAttIcon/dangqianshengming.png#res/custom/CusomAttIcon/dangqianshengming.png",
	},
	[25] = { 
		id=25,
		value="<半月技能抵抗:/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/CusomAttIcon/banyuedikang.png#res/custom/CusomAttIcon/banyuedikang.png",
	},
	[26] = { 
		id=26,
		value="<烈火技能抵抗:/FCOLOR=249><+%s/FCOLOR=215>",
		icon="1=res/custom/CusomAttIcon/liehuodikang.png#res/custom/CusomAttIcon/liehuodikang.png",
	},
	[27] = { 
		id=27,
		value="<开天技能抵抗:/FCOLOR=247><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/kaitiandikang.png#res/custom/CusomAttIcon/kaitiandikang.png",
	},
	[28] = { 
		id=28,
		value="<逐日技能抵抗:/FCOLOR=247><+%s/FCOLOR=251>",
		icon="1=res/custom/CusomAttIcon/zhuridikang.png#res/custom/CusomAttIcon/zhuridikang.png",
	},
	[29] = { 
		id=29,
		value="<鞭尸次数:/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/CusomAttIcon/bianshicishu.png#res/custom/CusomAttIcon/bianshicishu.png",
	},
	[30] = { 
		id=30,
		value="<武力值9：%s/FCOLOR=254>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[31] = { 
		id=31,
		value="<吞噬攻击力：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[32] = { 
		id=32,
		value="<吞噬生命值：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[33] = { 
		id=33,
		value="<攻击速度：/FCOLOR=250><+%s/FCOLOR=250>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[34] = { 
		id=34,
		value="<混沌之心：/FCOLOR=250><基础生命+%s/FCOLOR=250>",
		icon="1=res/custom/CusomAttIcon/hundunzhixin.png#res/custom/CusomAttIcon/hundunzhixin.png",
	},
	[35] = { 
		id=35,
		value="<破灭之核：/FCOLOR=250><基础攻击+%s/FCOLOR=250>",
		icon="1=res/custom/CusomAttIcon/pomiezhihe.png#res/custom/CusomAttIcon/pomiezhihe.png",
	},
	[36] = { 
		id=36,
		value="<轮回之魂：/FCOLOR=250><人物等级+%s/FCOLOR=250>",
		icon="1=res/custom/CusomAttIcon/lunhunzhihun.png#res/custom/CusomAttIcon/lunhunzhihun.png",
	},
	[37] = { 
		id=37,
		value="<龙魂烙印：/FCOLOR=251><龙裂/FCOLOR=250>\\<攻击怪物附带/FCOLOR=255><25555点/FCOLOR=250><切割伤害!/FCOLOR=255>\\",
	},
	[38] = { 
		id=38,
		value="<龙魂烙印：/FCOLOR=251><龙灭/FCOLOR=250>\\<攻击时有概率/FCOLOR=255><清空/FCOLOR=253><目标所有防御力/FCOLOR=255>\\<[2秒]/FCOLOR=253><并且斩杀目标/FCOLOR=255><10%/FCOLOR=249><的最大生/FCOLOR=255>\\<命值!/FCOLOR=255>",
	},
	[39] = { 
		id=39,
		value="<龙魂烙印：/FCOLOR=251><龙噬/FCOLOR=250>\\<攻击吸血:/FCOLOR=250><+5%/FCOLOR=250>\\<攻击伤害:/FCOLOR=250><+10%/FCOLOR=250>\\",
	},
	[40] = { 
		id=40,
		value="<[攻击]/FCOLOR=249><转化为/FCOLOR=251><[道术]/FCOLOR=249><：/FCOLOR=255><50属性x基因等级/FCOLOR=250>\\",
	},
	[41] = { 
		id=41,
		value="<[攻击]/FCOLOR=249><转化为/FCOLOR=251><[魔法]/FCOLOR=249><：/FCOLOR=255><50属性x基因等级/FCOLOR=250>\\",
	},
	[42] = { 
		id=42,
		value="<[道术]/FCOLOR=249><转化为/FCOLOR=251><[攻击]/FCOLOR=249><：/FCOLOR=255><50属性x基因等级/FCOLOR=250>\\",
	},
	[43] = { 
		id=43,
		value="<[道术]/FCOLOR=249><转化为/FCOLOR=251><[魔法]/FCOLOR=249><：/FCOLOR=255><50属性x基因等级/FCOLOR=250>\\",
	},
	[44] = { 
		id=44,
		value="<[魔法]/FCOLOR=249><转化为/FCOLOR=251><[攻击]/FCOLOR=249><：/FCOLOR=2559><50属性x基因等级/FCOLOR=250>\\",
	},
	[45] = { 
		id=45,
		value="<[魔法]/FCOLOR=249><转化为/FCOLOR=251><[道术]/FCOLOR=249><：/FCOLOR=255><50属性x基因等级/FCOLOR=250>\\",
	},
	[46] = { 
		id=46,
		value="<[生命]/FCOLOR=249><转化为/FCOLOR=251><[蓝量]/FCOLOR=249><：/FCOLOR=255><2000属性x基因等级/FCOLOR=250>\\",
	},
	[47] = { 
		id=47,
		value="<[蓝量]/FCOLOR=249><转化为/FCOLOR=251><[生命]/FCOLOR=249><：/FCOLOR=255><2000属性x基因等级/FCOLOR=250>\\",
	},
	[48] = { 
		id=48,
		value="<[攻击元素]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[49] = { 
		id=49,
		value="<[魔法元素]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[50] = { 
		id=50,
		value="<[道术元素]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[51] = { 
		id=51,
		value="<[物防加成]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[52] = { 
		id=52,
		value="<[魔防加成]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[53] = { 
		id=53,
		value="<[血量加成]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[54] = { 
		id=54,
		value="<[蓝量加成]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[55] = { 
		id=55,
		value="<[攻击伤害]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[56] = { 
		id=56,
		value="<[物伤减免]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[57] = { 
		id=57,
		value="<[魔法减免]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[58] = { 
		id=58,
		value="<[连爆概率]/FCOLOR=249><增加/FCOLOR=251><+5%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[59] = { 
		id=59,
		value="<[打怪増伤]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[60] = { 
		id=60,
		value="<[受怪减伤]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[61] = { 
		id=61,
		value="<[暴击概率]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[62] = { 
		id=62,
		value="<[暴击抵抗]/FCOLOR=249><增加/FCOLOR=251><+15%/FCOLOR=250><上限/FCOLOR=251>\\",
	},
	[63] = { 
		id=63,
		value="<攻击上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[64] = { 
		id=64,
		value="<魔法上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[65] = { 
		id=65,
		value="<道术上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[66] = { 
		id=66,
		value="<血量上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[67] = { 
		id=67,
		value="<蓝量上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[68] = { 
		id=68,
		value="<物防上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[69] = { 
		id=69,
		value="<魔防上限：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[70] = { 
		id=70,
		value="<攻速增加：/FCOLOR=251><+%s%/FCOLOR=250>",
		icon=0,
	},
	[71] = { 
		id=71,
		value="<鞭尸概率：/FCOLOR=251><%s%/FCOLOR=250>",
		icon=0,
	},
	[72] = { 
		id=72,
		value="<奇遇概率：/FCOLOR=251><%s%/FCOLOR=250>",
		icon=0,
	},
	[73] = { 
		id=73,
		value="<攻击加成：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[74] = { 
		id=74,
		value="<魔法加成：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[75] = { 
		id=75,
		value="<道术加成：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[76] = { 
		id=76,
		value="<血量加成：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[77] = { 
		id=77,
		value="<蓝量加成：/FCOLOR=251><%s/FCOLOR=250>",
		icon=0,
	},
	[78] = { 
		id=78,
		value="<全 属 性：/FCOLOR=251><+%s%/FCOLOR=250>",
		icon=0,
	},
	[79] = { 
		id=79,
		value="<攻 击 力：/FCOLOR=251><+%s%/FCOLOR=250>",
		icon=0,
	},
	[80] = { 
		id=80,
		value="<生 命 值：/FCOLOR=251><+%s%/FCOLOR=250>",
		icon=0,
	},
	[81] = { 
		id=81,
		value="<神魂攻击：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/1.png#res/custom/tips/1.png",
	},
	[82] = { 
		id=82,
		value="<神魂生命：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[83] = { 
		id=83,
		value="<攻击速度：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[84] = { 
		id=84,
		value="<忽视防御：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[85] = { 
		id=85,
		value="<攻击伤害：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[86] = { 
		id=86,
		value="<最大攻击：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[87] = { 
		id=87,
		value="<最大生命：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[88] = { 
		id=88,
		value="<最大魔法值：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[89] = { 
		id=89,
		value="<伤害吸收：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[90] = { 
		id=90,
		value="<防御加成：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[91] = { 
		id=91,
		value="<永久无视战斗状态,随时脱离战场/FCOLOR=251>",
	},
	[92] = { 
		id=92,
		value="<生 命 值：/FCOLOR=251><+%s/FCOLOR=250>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[93] = { 
		id=93,
		value="<攻 击 力：/FCOLOR=251><+%s/FCOLOR=250>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
	[94] = { 
		id=94,
		value="<致命一击：/FCOLOR=251><+%s/FCOLOR=215>",
		icon="1=res/custom/tips/3.png#res/custom/tips/3.png",
	},
}
return config
