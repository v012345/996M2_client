local config = {
	[10100] = {
		desc = "<font colorStyleID='1039'>赞助说明：</font><br/><font colorStyleID='1038'>1.赞助升级时立即获得对应属性和特权</font><br/><font colorStyleID='1038'>2.升级赞助等级奖励的道具需要手动领取</font>",
	},
	[40000] = {
		desc = "<font colorStyleID='1040'>宝石镶嵌：</font><br/><font colorStyleID='1038'>1.镶嵌宝石可以提升大量属性。</font><br/><font colorStyleID='1038'>2.每种类型的宝石在同一个部位只能镶嵌一颗。</font>",
	},
	[3] = {
		desc = "<font colorStyleID='16101'>1.多倍爆率每次只会触发其中一个倍数；</font><br/><font colorStyleID='16101'>2.双倍：总爆率小于或等于</font><font colorStyleID='16202'>100%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>双倍爆率</font><br/><font colorStyleID='16101'>3.三倍：总爆率大于或等于</font><font colorStyleID='16202'>200%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>三倍爆率</font><br/><font colorStyleID='16101'>4.四倍：总爆率大于或等于</font><font colorStyleID='16202'>300%</font><font colorStyleID='16101'>时，可触发</font><font colorStyleID='16202'>四倍爆率</font><br/><font colorStyleID='16101'>5.五倍：总爆率大于300%时，可触发五倍爆率</font>",
	},
	[4] = {
		desc = "<font colorStyleID='1040'>强化说明：</font><br/><font colorStyleID='1038'>1.强化的对象是装备部位，当更换装备的时候，强化属性不会消失</font><br/><font colorStyleID='1038'>2.强化获得的属性只有在装备穿戴后才会获得属性加成</font><br/><font colorStyleID='1038'>3.强化成功率随着强化等级降低，强化消耗随着等级提升而提升</font>",
	},
	[5] = {
		desc = "<font colorStyleID='1038'>玄武可增加角色的</font><font colorStyleID='1040'>生命</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>玄武精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>玄武精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>击败BOSS</font><font colorStyleID='1038'>掉落</font>",
	},
	[6] = {
		desc = "<font colorStyleID='1038'>白虎可增加角色的</font><font colorStyleID='1040'>攻击，百分比攻击，对怪增伤</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>白虎精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>白虎精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>击败BOSS</font><font colorStyleID='1038'>掉落</font>",
	},
	[7] = {
		desc = "<font colorStyleID='1038'>朱雀翼可增加角色的</font><font colorStyleID='1040'>防御，受怪减伤</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>朱雀精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>朱雀精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>日常任务和活动</font><font colorStyleID='1038'>获得</font>",
	},
	[8] = {
		desc = "<font colorStyleID='1038'>青龙胆可增加角色的</font><font colorStyleID='1040'>攻击，暴击率，对怪暴击率</font><br/><font colorStyleID='1038'>消耗</font><font colorStyleID='1039'>青龙精魂</font><font colorStyleID='1038'>可升级四象等级获得更高属性</font><br/><font colorStyleID='1039'>青龙精魂</font><font colorStyleID='1038'>通过</font><font colorStyleID='1039'>活动</font><font colorStyleID='1038'>获得</font>",
	},
	[9] = {
		desc = "<font colorStyleID='1038'>宝玉说明</font><br/><font colorStyleID='1038'>1.</font><font colorStyleID='1038'>消耗一定数量的玉髓可升级宝玉</font><br/><font colorStyleID='1038'>2.集齐</font><font colorStyleID='1039'>12件</font><font colorStyleID='1038'>宝玉可以进入宝玉地图</font><br/><font colorStyleID='1038'>3.宝玉的套装效果可以向下兼容</font>",
	},
	[10] = {
		desc = "<font colorStyleID='1039'>无双装备说明：</font><br/><font colorStyleID='1038'>1.无双装备通过击杀神将一定概率掉落获取</font><br/><font colorStyleID='1038'>2.无双装备分解后获得对应等级数量的无双神石</font>",
	},
	[11] = {
		desc = "<font colorStyleID='16202'>侍女说明：</font><br/><font colorStyleID='16101'>1.打BOSS就能爆侍女石。</font><br/><font colorStyleID='16101'>2.侍女石可召集侍女助战</font><br/><font colorStyleID='16101'>3.最多可同时出场三名侍女。</font>",
	},
	[12] = {
		desc = "<font colorStyleID='16101'>充值玉币：&<ITEMCOUNT/2>&</font><br/><font colorStyleID='16101'>玉币：&<ITEMCOUNT/4>&</font><br/><font colorStyleID='16101'>特别说明：玉币可以通过玉币红包等游戏内途径获得。充值玉币可通过充值获得。</font>",
	},
	[13] = {
		desc = "<font colorStyleID='16101'>金条：&<ITEMCOUNT/3>&</font><br/><font colorStyleID='16101'>获取方式：BOSS掉落，活动奖励等方式获得</font>",
	},
	[14] = {
		desc = "<font colorStyleID='16202'>合成说明：</font><br/><font colorStyleID='16101'>1.部分合成物品随等级解锁。</font><br/><font colorStyleID='16101'>2.合成物品消耗元宝以及其它道具。</font>",
	},
	[15] = {
		desc = "<font colorStyleID='1040'>升星说明：</font><br/><font colorStyleID='1038'>1.升星的对象是装备部位，当更换装备的时候，升星属性不会消失</font><br/><font colorStyleID='1038'>2.升星获得的属性只有在装备穿戴后才会获得属性加成</font><br/><font colorStyleID='1038'>3.升星成功率随着升星等级降低，升星消耗随着等级提升而提升</font>",
	},
	[16] = {
		desc = "<font colorStyleID='1040'>升阶说明：</font><br/><font colorStyleID='1038'>1.升阶后该装备可以被用于激活同阶套装上</font><br/><font colorStyleID='1038'>2.装备锻造升阶后将不可回溯</font>",
	},
	[17] = {
		desc = "<font colorStyleID='1040'>升阶说明：</font><br/><font colorStyleID='1038'>1.升阶后将会获得永久属性加成</font><br/><font colorStyleID='1038'>2.升阶后将谱会额外提升名将图鉴内已获得的武将的属性</font>",
	},
	[20400] = {
		desc = "<font colorStyleID='1040'>分解说明：</font><br/><font colorStyleID='1038'>11阶以上神装可分解，分解后可随机获得世界币</font>",
	},
	[18] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：800</font><br><font color='#FFFF00'>对怪增伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[19] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：1600</font><br><font color='#FFFF00'>对怪增伤：2%</font><br><font color='#FFFF00'>爆率加成：2%</font>",
	},
	[20] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：2400</font><br><font color='#FFFF00'>对怪增伤：3%</font><br><font color='#FFFF00'>爆率加成：3%</font>",
	},
	[21] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：3200</font><br><font color='#FFFF00'>对怪增伤：4%</font><br><font color='#FFFF00'>爆率加成：4%</font>",
	},
	[22] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：4000</font><br><font color='#FFFF00'>对怪增伤：5%</font><br><font color='#FFFF00'>爆率加成：5%</font>",
	},
	[23] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：4800</font><br><font color='#FFFF00'>对怪增伤：6%</font><br><font color='#FFFF00'>爆率加成：6%</font>",
	},
	[24] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：5600</font><br><font color='#FFFF00'>对怪增伤：7%</font><br><font color='#FFFF00'>爆率加成：7%</font>",
	},
	[25] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：6400</font><br><font color='#FFFF00'>对怪增伤：8%</font><br><font color='#FFFF00'>爆率加成：8%</font>",
	},
	[26] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：8000</font><br><font color='#FFFF00'>对怪增伤：9%</font><br><font color='#FFFF00'>爆率加成：9%</font>",
	},
	[27] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：9600</font><br><font color='#FFFF00'>对怪增伤：10%</font><br><font color='#FFFF00'>爆率加成：10%</font>",
	},
	[28] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：11200</font><br><font color='#FFFF00'>对怪增伤：11%</font><br><font color='#FFFF00'>爆率加成：11%</font>",
	},
	[29] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：12800</font><br><font color='#FFFF00'>对怪增伤：12%</font><br><font color='#FFFF00'>爆率加成：12%</font>",
	},
	[30] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：14400</font><br><font color='#FFFF00'>对怪增伤：13%</font><br><font color='#FFFF00'>爆率加成：14%</font>",
	},
	[31] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：16000</font><br><font color='#FFFF00'>对怪增伤：15%</font><br><font color='#FFFF00'>爆率加成：16%</font>",
	},
	[32] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：18400</font><br><font color='#FFFF00'>对怪增伤：17%</font><br><font color='#FFFF00'>爆率加成：18%</font>",
	},
	[33] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：20800</font><br><font color='#FFFF00'>对怪增伤：19%</font><br><font color='#FFFF00'>爆率加成：20%</font>",
	},
	[34] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：23200</font><br><font color='#FFFF00'>对怪增伤：21%</font><br><font color='#FFFF00'>爆率加成：22%</font>",
	},
	[35] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：25600</font><br><font color='#FFFF00'>对怪增伤：23%</font><br><font color='#FFFF00'>爆率加成：24%</font>",
	},
	[36] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：28000</font><br><font color='#FFFF00'>对怪增伤：25%</font><br><font color='#FFFF00'>爆率加成：26%</font>",
	},
	[37] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：30400</font><br><font color='#FFFF00'>对怪增伤：28%</font><br><font color='#FFFF00'>爆率加成：28%</font>",
	},
	[38] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：32800</font><br><font color='#FFFF00'>对怪增伤：31%</font><br><font color='#FFFF00'>爆率加成：30%</font>",
	},
	[39] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：35200</font><br><font color='#FFFF00'>对怪增伤：34%</font><br><font color='#FFFF00'>爆率加成：32%</font>",
	},
	[40] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：37600</font><br><font color='#FFFF00'>对怪增伤：37%</font><br><font color='#FFFF00'>爆率加成：34%</font>",
	},
	[41] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>对怪固伤加成：40000</font><br><font color='#FFFF00'>对怪增伤：40%</font><br><font color='#FFFF00'>爆率加成：36%</font>",
	},
	[42] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[43] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[44] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[45] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[46] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[47] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[48] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[49] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[50] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[51] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[52] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[53] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[54] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[55] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[56] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[57] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[58] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[59] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[60] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[61] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[62] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[63] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[64] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[65] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>受怪伤害减少：800</font><br><font color='#FFFF00'>受怪减伤：1%</font><br><font color='#FFFF00'>爆率加成：1%</font>",
	},
	[66] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[67] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[68] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[69] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[70] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[71] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[72] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[73] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[74] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[75] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[76] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[77] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[78] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[79] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[80] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[81] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[82] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[83] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[84] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[85] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[86] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[87] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[88] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[89] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[90] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[91] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[92] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[93] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[94] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[95] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[96] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[97] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[98] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[99] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[100] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[101] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[102] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[103] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[104] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[105] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[106] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[107] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[108] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[109] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[110] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[111] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[112] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[113] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[114] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>防御力：400-400</font><br><font color='#FFFF00'>防御加成：2%</font><br><font color='#FFFF00'>闪避：1%</font>",
	},
	[115] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[116] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[117] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[118] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[119] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[120] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[121] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[122] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[123] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[124] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[125] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[126] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[127] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[128] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[129] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[130] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[131] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[132] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[133] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[134] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[135] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[136] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[137] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[138] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[139] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[140] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[141] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[142] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[143] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[144] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[145] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[146] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[147] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[148] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[149] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[150] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[151] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[152] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[153] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[154] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[155] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[156] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[157] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[158] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[159] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[160] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[161] = {
		desc = "<br/><font color='#00FFFF'>[属性加成]:</font><br><font color='#FFFF00'>最大生命：16000</font><br><font color='#FFFF00'>生命加成：4%</font><br><font color='#FFFF00'>格挡率：6%</font><br><font color='#FFFF00'>格挡免伤：6%</font>",
	},
	[162] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[163] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[164] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[165] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[166] = {
		desc = "<font color='#66FF99'>攻击加成：6%      防御加成：12%<br>生命加成：12%    对怪增伤：6%</font>",
	},
	[21200] = {
		desc = "<font colorStyleID='1040'>熔炼说明：</font><br/><font colorStyleID='1038'>熔炼装备几率获得强化石！！！</font>",
	},
	[20200] = {
		desc = "若融合失败辅材会破损消失！！",
	},
	[21300] = {
		desc = "若进阶失败会破损一个装备！！",
	},
	[21400] = {
		desc = "若融合失败辅材会破损消失！！",
	},
	[21500] = {
		desc = "<font colorStyleID='1040'>装备强星：</font><br/><font colorStyleID='1038'>1.装备强星可以提升大量属性。</font><br/><font colorStyleID='1038'>2.强星失败装备将降一个星级</font><br/><font colorStyleID='1038'>3.商城购买幸运石可保护装备强星失败不降星。</font>",
	},
	[167] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[168] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[169] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[170] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[171] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[172] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[173] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[174] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[175] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[176] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[177] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[178] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[179] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[180] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[181] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[182] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[183] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
	[184] = {
		desc = "<font color='0x01d1ff'>打宝概率提升 2%<br>装备回收比例提升5%<br>对怪每秒伤害提升960</font>",
	},
}
return config