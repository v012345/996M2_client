local config = { 
	[11] = { 
		ID=11,
		name="魔法盾",
		front_sfx="49#49",
		front_sfx_stuck="50#50",
		no_skill=-2,
		icon=11,
		tips="降低受到的伤害",
		offsetGroup=1,
	},
	[12] = { 
		ID=12,
		name="强化魔法盾",
		front_sfx="149#149",
		front_sfx_stuck="150#150",
		no_skill=-2,
		icon=11,
		tips="降低受到的伤害",
		offsetGroup=1,
	},
	[5] = { 
		ID=5,
		name="麻痹",
		no_skill=-1,
		dis_action=7,
		icon=5,
		tips="无法移动，无法攻击",
		offsetGroup=1,
		bufftitle="你被麻痹了",
	},
	[0] = { 
		ID=0,
		name="绿毒",
		no_skill=-2,
		icon=1,
		tips="每秒受到一定的伤害",
		offsetGroup=1,
	},
	[1] = { 
		ID=1,
		name="红毒",
		no_skill=-2,
		icon=1,
		tips="降低一定防御能力",
		offsetGroup=1,
	},
	[8] = { 
		ID=8,
		name="隐身",
		no_skill=-2,
		icon=8,
		tips="不会被怪物发现，移动破除隐身状态",
		offsetGroup=1,
	},
	[9] = { 
		ID=9,
		name="神圣战甲术",
		no_skill=-2,
		icon=15,
		tips="提高防御能力",
		offsetGroup=1,
	},
	[10] = { 
		ID=10,
		name="幽灵盾",
		no_skill=-2,
		icon=14,
		tips="提高魔防能力",
		offsetGroup=1,
	},
	[6] = { 
		ID=6,
		name="无极真气",
		no_skill=-2,
		icon=11,
		tips="大幅度提高自身伤害",
		offsetGroup=1,
	},
	[7] = { 
		ID=7,
		name="护体神盾",
		no_skill=-2,
		icon=11,
		tips="提高格挡概率和格挡伤害",
		offsetGroup=1,
	},
	[13] = { 
		ID=13,
		name="禁锢",
		front_sfx="2950#2950",
		no_skill=-2,
		dis_action=2,
		icon=1113,
		tips="无法进行跑步操作",
		time="2#3000",
		group=0,
		Priority=1,
		overlap=0,
		uniqueType=25,
		replaceGroup=0,
		offsetGroup=1,
	},
	[14] = { 
		ID=14,
		name="蛛网",
		front_sfx="2951#2951",
		front_sfx_stuck="2951#2951",
		no_skill=-2,
		dis_action=2,
		replaceGroup=1,
	},
	[1113] = { 
		ID=1113,
		name="冰冻",
		no_skill=-1,
		dis_action=7,
		icon=5,
		tips="无法移动，无法攻击",
		offsetGroup=1,
	},
	[69] = { 
		ID=69,
		name="锁定",
		no_skill=-1,
		dis_action=31,
		tips="无法移动，无法攻击",
		offsetGroup=1,
	},
	[71] = { 
		ID=71,
		name="禁止攻击",
		no_skill=-1,
		tips="无法释放攻击",
		offsetGroup=1,
	},
	[21] = { 
		ID=21,
		name="雷霆剑法_BUFF",
		front_sfx="145#145",
		front_sfx_stuck="145#145",
		no_skill=-1,
		tips="雷霆剑法BUFF，目标变色",
		offsetGroup=1,
	},
	[22] = { 
		ID=22,
		name="战士连击技能锁定",
		dis_action=11,
		tips="战技封锁，不能移动，不能施法",
		offsetGroup=1,
		color=9,
	},
	[23] = { 
		ID=23,
		name="道士连击万剑归宗",
		front_sfx="432#432",
		front_sfx_stuck="432#432",
		tips="万剑归宗的BUFF特效",
		offsetGroup=1,
	},
	[77] = { 
		ID=77,
		name="唯我独尊_自身触发",
		front_sfx="442#442",
		front_sfx_stuck="442#442",
		no_skill=-2,
		tips="时间生效内-无视一切麻痹",
		offsetGroup=1,
	},
	[78] = { 
		ID=78,
		name="唯我独尊_他人触发",
		no_skill=-2,
		tips="周围其他人降低防御",
		offsetGroup=1,
		color=13,
	},
	[2008] = { 
		ID=2008,
		name="摆摊BUFF",
		behind_sfx="5005#5005",
		no_item=527,
		dis_action=-1,
		icon=5,
		tips="摆摊BUFF",
		time="2#7200",
		group=0,
		Priority=1,
		overlap=0,
		offsetGroup=1,
	},
	[80] = { 
		ID=80,
		name="潜行术",
		front_sfx="518#518",
		front_sfx_stuck="518#518",
		tips="潜行特效",
	},
}
return config
