local config = { 
	[1] = { 
		id=1,
		group=1,
		level=1,
		ids="101#55#77#11#12",
		levelCondition="U10=0",
		VarCondition="U11<100",
		currencyCondition="2>=10",
		offset="0-5#5|0-5#5",
	},
	[2] = { 
		id=2,
		group=1,
		level=2,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=1",
		VarCondition="U11>=1&U12>=1|U13=4",
		currencyCondition="2>=10&1>=10001",
		offset="0-5#5|0-5#5",
	},
	[3] = { 
		id=3,
		group=1,
		level=3,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=2",
		VarCondition="U11>=1&U12>=1|U13=5",
		currencyCondition="2>=10&1>=10002",
		offset="0-5#5|0-5#5",
	},
	[4] = { 
		id=4,
		group=1,
		level=4,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=3",
		VarCondition="U11>=1&U12>=1|U13=6",
		currencyCondition="2>=10&1>=10003",
		offset="0-5#5|0-5#5",
	},
	[5] = { 
		id=5,
		group=1,
		level=5,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=4",
		VarCondition="U11>=1&U12>=1|U13=7",
		currencyCondition="2>=10&1>=10004",
		offset="0-5#5|0-5#5",
	},
	[6] = { 
		id=6,
		group=1,
		level=6,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=5",
		VarCondition="U11>=1&U12>=1|U13=8",
		currencyCondition="2>=10&1>=10005",
		offset="0-5#5|0-5#5",
	},
	[7] = { 
		id=7,
		group=1,
		level=7,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=6",
		VarCondition="U11>=1&U12>=1|U13=9",
		currencyCondition="2>=10&1>=10006",
		offset="0-5#5|0-5#5",
	},
	[8] = { 
		id=8,
		group=1,
		level=8,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=7",
		VarCondition="U11>=1&U12>=1|U13=10",
		currencyCondition="2>=10&1>=10007",
		offset="0-5#5|0-5#5",
	},
	[9] = { 
		id=9,
		group=1,
		level=9,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=8",
		VarCondition="U11>=1&U12>=1|U13=11",
		currencyCondition="2>=10&1>=10008",
		offset="0-5#5|0-5#5",
	},
	[10] = { 
		id=10,
		group=1,
		level=10,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=9",
		VarCondition="U11>=1&U12>=1|U13=12",
		currencyCondition="2>=10&1>=10009",
		offset="0-5#5|0-5#5",
	},
	[11] = { 
		id=11,
		group=1,
		level=11,
		ids="104#10000#10#1000#1001",
		levelCondition="U10=10",
		VarCondition="U11>=1&U12>=1|U13=13",
		currencyCondition="2>=10&1>=10010",
		offset="0-5#5|0-5#5",
	},
	[12] = { 
		id=12,
		group=2,
		level=1,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=1",
		VarCondition="<$human(红点测试)>>=10",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[13] = { 
		id=13,
		group=2,
		level=2,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=2",
		VarCondition="<$human(红点测试)>>=11",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[14] = { 
		id=14,
		group=2,
		level=3,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=3",
		VarCondition="<$human(红点测试)>>=12",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[15] = { 
		id=15,
		group=2,
		level=4,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=4",
		VarCondition="<$human(红点测试)>>=13",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[16] = { 
		id=16,
		group=2,
		level=5,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=5",
		VarCondition="<$human(红点测试)>>=14",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[17] = { 
		id=17,
		group=2,
		level=6,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=6",
		VarCondition="<$human(红点测试)>>=15",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[18] = { 
		id=18,
		group=2,
		level=7,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=7",
		VarCondition="<$human(红点测试)>>=16",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[19] = { 
		id=19,
		group=2,
		level=8,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=8",
		VarCondition="<$human(红点测试)>>=17",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[20] = { 
		id=20,
		group=2,
		level=9,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=9",
		VarCondition="<$human(红点测试)>>=18",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[21] = { 
		id=21,
		group=2,
		level=10,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=10",
		VarCondition="<$human(红点测试)>>=19",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[22] = { 
		id=22,
		group=2,
		level=11,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=11",
		VarCondition="<$human(红点测试)>>=20",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[23] = { 
		id=23,
		group=2,
		level=12,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=12",
		VarCondition="<$human(红点测试)>>=21",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
	[24] = { 
		id=24,
		group=2,
		level=13,
		ids="104#10002#101#1000#1001",
		levelCondition="<$renewlevel>=13",
		VarCondition="<$human(红点测试)>>=22",
		currencyCondition="3>=100",
		offset="0-5#5|0-5#5",
	},
}
return config
