local DebugProxy        = requireProxy( "DebugProxy" )
local ColorStyleProxy   = class( "ColorStyleProxy", DebugProxy )
ColorStyleProxy.NAME    = global.ProxyTable.ColorStyleProxy

local ssplit = string.split
local tnum   = tonumber

local COLOR_CONFIG = {
    [0] = { 
		id=0,
		style_color="#111111",
		size=18,
		colour="#000000",
	},
	[1] = { 
		id=1,
		style_color="#111111",
		size=18,
		colour="#800000",
	},
	[2] = { 
		id=2,
		style_color="#111111",
		size=18,
		colour="#008000",
	},
	[3] = { 
		id=3,
		style_color="#111111",
		size=18,
		colour="#808000",
	},
	[4] = { 
		id=4,
		style_color="#111111",
		size=18,
		colour="#000080",
	},
	[5] = { 
		id=5,
		style_color="#111111",
		size=18,
		colour="#800080",
	},
	[6] = { 
		id=6,
		style_color="#111111",
		size=18,
		colour="#008080",
	},
	[7] = { 
		id=7,
		style_color="#111111",
		size=18,
		colour="#c0c0c0",
	},
	[8] = { 
		id=8,
		style_color="#111111",
		size=18,
		colour="#558097",
	},
	[9] = { 
		id=9,
		style_color="#111111",
		size=18,
		colour="#9db9c8",
	},
	[10] = { 
		id=10,
		style_color="#111111",
		size=18,
		colour="#7b7373",
	},
	[11] = { 
		id=11,
		style_color="#111111",
		size=18,
		colour="#2d2929",
	},
	[12] = { 
		id=12,
		style_color="#111111",
		size=18,
		colour="#5a5252",
	},
	[13] = { 
		id=13,
		style_color="#111111",
		size=18,
		colour="#635a5a",
	},
	[14] = { 
		id=14,
		style_color="#111111",
		size=18,
		colour="#423939",
	},
	[15] = { 
		id=15,
		style_color="#111111",
		size=18,
		colour="#1d1818",
	},
	[16] = { 
		id=16,
		style_color="#111111",
		size=18,
		colour="#181010",
	},
	[17] = { 
		id=17,
		style_color="#111111",
		size=18,
		colour="#291818",
	},
	[18] = { 
		id=18,
		style_color="#111111",
		size=18,
		colour="#100808",
	},
	[19] = { 
		id=19,
		style_color="#111111",
		size=18,
		colour="#f27971",
	},
	[20] = { 
		id=20,
		style_color="#111111",
		size=18,
		colour="#e1675f",
	},
	[21] = { 
		id=21,
		style_color="#111111",
		size=18,
		colour="#ff5a5a",
	},
	[22] = { 
		id=22,
		style_color="#111111",
		size=18,
		colour="#ff3131",
	},
	[23] = { 
		id=23,
		style_color="#111111",
		size=18,
		colour="#d65a52",
	},
	[24] = { 
		id=24,
		style_color="#111111",
		size=18,
		colour="#941000",
	},
	[25] = { 
		id=25,
		style_color="#111111",
		size=18,
		colour="#942918",
	},
	[26] = { 
		id=26,
		style_color="#111111",
		size=18,
		colour="#390800",
	},
	[27] = { 
		id=27,
		style_color="#111111",
		size=18,
		colour="#731000",
	},
	[28] = { 
		id=28,
		style_color="#111111",
		size=18,
		colour="#b51800",
	},
	[29] = { 
		id=29,
		style_color="#111111",
		size=18,
		colour="#bd6352",
	},
	[30] = { 
		id=30,
		style_color="#111111",
		size=18,
		colour="#421810",
	},
	[31] = { 
		id=31,
		style_color="#111111",
		size=18,
		colour="#ffaa99",
	},
	[32] = { 
		id=32,
		style_color="#111111",
		size=18,
		colour="#5a1000",
	},
	[33] = { 
		id=33,
		style_color="#111111",
		size=18,
		colour="#733929",
	},
	[34] = { 
		id=34,
		style_color="#111111",
		size=18,
		colour="#a54a31",
	},
	[35] = { 
		id=35,
		style_color="#111111",
		size=18,
		colour="#947b73",
	},
	[36] = { 
		id=36,
		style_color="#111111",
		size=18,
		colour="#bd5231",
	},
	[37] = { 
		id=37,
		style_color="#111111",
		size=18,
		colour="#522110",
	},
	[38] = { 
		id=38,
		style_color="#111111",
		size=18,
		colour="#7b3118",
	},
	[39] = { 
		id=39,
		style_color="#111111",
		size=18,
		colour="#2d1810",
	},
	[40] = { 
		id=40,
		style_color="#111111",
		size=18,
		colour="#8c4a31",
	},
	[41] = { 
		id=41,
		style_color="#111111",
		size=18,
		colour="#942900",
	},
	[42] = { 
		id=42,
		style_color="#111111",
		size=18,
		colour="#bd3100",
	},
	[43] = { 
		id=43,
		style_color="#111111",
		size=18,
		colour="#c67352",
	},
	[44] = { 
		id=44,
		style_color="#111111",
		size=18,
		colour="#6b3118",
	},
	[45] = { 
		id=45,
		style_color="#111111",
		size=18,
		colour="#c66b42",
	},
	[46] = { 
		id=46,
		style_color="#111111",
		size=18,
		colour="#ce4a00",
	},
	[47] = { 
		id=47,
		style_color="#111111",
		size=18,
		colour="#a56339",
	},
	[48] = { 
		id=48,
		style_color="#111111",
		size=18,
		colour="#5a3118",
	},
	[49] = { 
		id=49,
		style_color="#111111",
		size=18,
		colour="#2a1000",
	},
	[50] = { 
		id=50,
		style_color="#111111",
		size=18,
		colour="#150800",
	},
	[51] = { 
		id=51,
		style_color="#111111",
		size=18,
		colour="#3a1800",
	},
	[52] = { 
		id=52,
		style_color="#111111",
		size=18,
		colour="#080000",
	},
	[53] = { 
		id=53,
		style_color="#111111",
		size=18,
		colour="#290000",
	},
	[54] = { 
		id=54,
		style_color="#111111",
		size=18,
		colour="#4a0000",
	},
	[55] = { 
		id=55,
		style_color="#111111",
		size=18,
		colour="#9d0000",
	},
	[56] = { 
		id=56,
		style_color="#111111",
		size=18,
		colour="#dc0000",
	},
	[57] = { 
		id=57,
		style_color="#111111",
		size=18,
		colour="#de0000",
	},
	[58] = { 
		id=58,
		style_color="#111111",
		size=18,
		colour="#fb0000",
	},
	[59] = { 
		id=59,
		style_color="#111111",
		size=18,
		colour="#9c7352",
	},
	[60] = { 
		id=60,
		style_color="#111111",
		size=18,
		colour="#946b4a",
	},
	[61] = { 
		id=61,
		style_color="#111111",
		size=18,
		colour="#734a29",
	},
	[62] = { 
		id=62,
		style_color="#111111",
		size=18,
		colour="#523118",
	},
	[63] = { 
		id=63,
		style_color="#111111",
		size=18,
		colour="#8c4a18",
	},
	[64] = { 
		id=64,
		style_color="#111111",
		size=18,
		colour="#884411",
	},
	[65] = { 
		id=65,
		style_color="#111111",
		size=18,
		colour="#4a2100",
	},
	[66] = { 
		id=66,
		style_color="#111111",
		size=18,
		colour="#211810",
	},
	[67] = { 
		id=67,
		style_color="#111111",
		size=18,
		colour="#d6945a",
	},
	[68] = { 
		id=68,
		style_color="#111111",
		size=18,
		colour="#c66b21",
	},
	[69] = { 
		id=69,
		style_color="#111111",
		size=18,
		colour="#ef6b00",
	},
	[70] = { 
		id=70,
		style_color="#111111",
		size=18,
		colour="#ff7700",
	},
	[71] = { 
		id=71,
		style_color="#111111",
		size=18,
		colour="#a59484",
	},
	[72] = { 
		id=72,
		style_color="#111111",
		size=18,
		colour="#423121",
	},
	[73] = { 
		id=73,
		style_color="#111111",
		size=18,
		colour="#181008",
	},
	[74] = { 
		id=74,
		style_color="#111111",
		size=18,
		colour="#291808",
	},
	[75] = { 
		id=75,
		style_color="#111111",
		size=18,
		colour="#211000",
	},
	[76] = { 
		id=76,
		style_color="#111111",
		size=18,
		colour="#392918",
	},
	[77] = { 
		id=77,
		style_color="#111111",
		size=18,
		colour="#8c6339",
	},
	[78] = { 
		id=78,
		style_color="#111111",
		size=18,
		colour="#422910",
	},
	[79] = { 
		id=79,
		style_color="#111111",
		size=18,
		colour="#6b4218",
	},
	[80] = { 
		id=80,
		style_color="#111111",
		size=18,
		colour="#7b4a18",
	},
	[81] = { 
		id=81,
		style_color="#111111",
		size=18,
		colour="#944a00",
	},
	[82] = { 
		id=82,
		style_color="#111111",
		size=18,
		colour="#8c847b",
	},
	[83] = { 
		id=83,
		style_color="#111111",
		size=18,
		colour="#6b635a",
	},
	[84] = { 
		id=84,
		style_color="#111111",
		size=18,
		colour="#4a4239",
	},
	[85] = { 
		id=85,
		style_color="#111111",
		size=18,
		colour="#292118",
	},
	[86] = { 
		id=86,
		style_color="#111111",
		size=18,
		colour="#463929",
	},
	[87] = { 
		id=87,
		style_color="#111111",
		size=18,
		colour="#b5a594",
	},
	[88] = { 
		id=88,
		style_color="#111111",
		size=18,
		colour="#7b6b5a",
	},
	[89] = { 
		id=89,
		style_color="#111111",
		size=18,
		colour="#ceb194",
	},
	[90] = { 
		id=90,
		style_color="#111111",
		size=18,
		colour="#a58c73",
	},
	[91] = { 
		id=91,
		style_color="#111111",
		size=18,
		colour="#8c735a",
	},
	[92] = { 
		id=92,
		style_color="#111111",
		size=18,
		colour="#b59473",
	},
	[93] = { 
		id=93,
		style_color="#111111",
		size=18,
		colour="#d6a573",
	},
	[94] = { 
		id=94,
		style_color="#111111",
		size=18,
		colour="#efa54a",
	},
	[95] = { 
		id=95,
		style_color="#111111",
		size=18,
		colour="#efc68c",
	},
	[96] = { 
		id=96,
		style_color="#111111",
		size=18,
		colour="#7b6342",
	},
	[97] = { 
		id=97,
		style_color="#111111",
		size=18,
		colour="#6b5639",
	},
	[98] = { 
		id=98,
		style_color="#111111",
		size=18,
		colour="#bd945a",
	},
	[99] = { 
		id=99,
		style_color="#111111",
		size=18,
		colour="#633900",
	},
	[100] = { 
		id=100,
		style_color="#111111",
		size=18,
		colour="#d6c6ad",
	},
	[101] = { 
		id=101,
		style_color="#111111",
		size=18,
		colour="#524229",
	},
	[102] = { 
		id=102,
		style_color="#111111",
		size=18,
		colour="#946318",
	},
	[103] = { 
		id=103,
		style_color="#111111",
		size=18,
		colour="#efd6ad",
	},
	[104] = { 
		id=104,
		style_color="#111111",
		size=18,
		colour="#a58c63",
	},
	[105] = { 
		id=105,
		style_color="#111111",
		size=18,
		colour="#635a4a",
	},
	[106] = { 
		id=106,
		style_color="#111111",
		size=18,
		colour="#bda57b",
	},
	[107] = { 
		id=107,
		style_color="#111111",
		size=18,
		colour="#5a4218",
	},
	[108] = { 
		id=108,
		style_color="#111111",
		size=18,
		colour="#bd8c31",
	},
	[109] = { 
		id=109,
		style_color="#111111",
		size=18,
		colour="#353129",
	},
	[110] = { 
		id=110,
		style_color="#111111",
		size=18,
		colour="#948463",
	},
	[111] = { 
		id=111,
		style_color="#111111",
		size=18,
		colour="#7b6b4a",
	},
	[112] = { 
		id=112,
		style_color="#111111",
		size=18,
		colour="#a58c5a",
	},
	[113] = { 
		id=113,
		style_color="#111111",
		size=18,
		colour="#5a4a29",
	},
	[114] = { 
		id=114,
		style_color="#111111",
		size=18,
		colour="#9c7b39",
	},
	[115] = { 
		id=115,
		style_color="#111111",
		size=18,
		colour="#423110",
	},
	[116] = { 
		id=116,
		style_color="#111111",
		size=18,
		colour="#efad21",
	},
	[117] = { 
		id=117,
		style_color="#111111",
		size=18,
		colour="#181000",
	},
	[118] = { 
		id=118,
		style_color="#111111",
		size=18,
		colour="#292100",
	},
	[119] = { 
		id=119,
		style_color="#111111",
		size=18,
		colour="#9c6b00",
	},
	[120] = { 
		id=120,
		style_color="#111111",
		size=18,
		colour="#94845a",
	},
	[121] = { 
		id=121,
		style_color="#111111",
		size=18,
		colour="#524218",
	},
	[122] = { 
		id=122,
		style_color="#111111",
		size=18,
		colour="#6b5a29",
	},
	[123] = { 
		id=123,
		style_color="#111111",
		size=18,
		colour="#7b6321",
	},
	[124] = { 
		id=124,
		style_color="#111111",
		size=18,
		colour="#9c7b21",
	},
	[125] = { 
		id=125,
		style_color="#111111",
		size=18,
		colour="#dea500",
	},
	[126] = { 
		id=126,
		style_color="#111111",
		size=18,
		colour="#5a5239",
	},
	[127] = { 
		id=127,
		style_color="#111111",
		size=18,
		colour="#312910",
	},
	[128] = { 
		id=128,
		style_color="#111111",
		size=18,
		colour="#cebd7b",
	},
	[129] = { 
		id=129,
		style_color="#111111",
		size=18,
		colour="#635a39",
	},
	[130] = { 
		id=130,
		style_color="#111111",
		size=18,
		colour="#94844a",
	},
	[131] = { 
		id=131,
		style_color="#111111",
		size=18,
		colour="#c6a529",
	},
	[132] = { 
		id=132,
		style_color="#111111",
		size=18,
		colour="#109c18",
	},
	[133] = { 
		id=133,
		style_color="#111111",
		size=18,
		colour="#428c4a",
	},
	[134] = { 
		id=134,
		style_color="#111111",
		size=18,
		colour="#318c42",
	},
	[135] = { 
		id=135,
		style_color="#111111",
		size=18,
		colour="#109429",
	},
	[136] = { 
		id=136,
		style_color="#111111",
		size=18,
		colour="#081810",
	},
	[137] = { 
		id=137,
		style_color="#111111",
		size=18,
		colour="#081818",
	},
	[138] = { 
		id=138,
		style_color="#111111",
		size=18,
		colour="#082910",
	},
	[139] = { 
		id=139,
		style_color="#111111",
		size=18,
		colour="#184229",
	},
	[140] = { 
		id=140,
		style_color="#111111",
		size=18,
		colour="#a5b5ad",
	},
	[141] = { 
		id=141,
		style_color="#111111",
		size=18,
		colour="#6b7373",
	},
	[142] = { 
		id=142,
		style_color="#111111",
		size=18,
		colour="#182929",
	},
	[143] = { 
		id=143,
		style_color="#111111",
		size=18,
		colour="#18424a",
	},
	[144] = { 
		id=144,
		style_color="#111111",
		size=18,
		colour="#31424a",
	},
	[145] = { 
		id=145,
		style_color="#111111",
		size=18,
		colour="#63c6de",
	},
	[146] = { 
		id=146,
		style_color="#111111",
		size=18,
		colour="#44ddff",
	},
	[147] = { 
		id=147,
		style_color="#111111",
		size=18,
		colour="#8cd6ef",
	},
	[148] = { 
		id=148,
		style_color="#111111",
		size=18,
		colour="#736b39",
	},
	[149] = { 
		id=149,
		style_color="#111111",
		size=18,
		colour="#f7de39",
	},
	[150] = { 
		id=150,
		style_color="#111111",
		size=18,
		colour="#f7ef8c",
	},
	[151] = { 
		id=151,
		style_color="#111111",
		size=18,
		colour="#f7e700",
	},
	[152] = { 
		id=152,
		style_color="#111111",
		size=18,
		colour="#6b6b5a",
	},
	[153] = { 
		id=153,
		style_color="#111111",
		size=18,
		colour="#5a8ca5",
	},
	[154] = { 
		id=154,
		style_color="#111111",
		size=18,
		colour="#39b5ef",
	},
	[155] = { 
		id=155,
		style_color="#111111",
		size=18,
		colour="#4a9cce",
	},
	[156] = { 
		id=156,
		style_color="#111111",
		size=18,
		colour="#3184b5",
	},
	[157] = { 
		id=157,
		style_color="#111111",
		size=18,
		colour="#31526b",
	},
	[158] = { 
		id=158,
		style_color="#111111",
		size=18,
		colour="#deded6",
	},
	[159] = { 
		id=159,
		style_color="#111111",
		size=18,
		colour="#bdbdb5",
	},
	[160] = { 
		id=160,
		style_color="#111111",
		size=18,
		colour="#8c8c84",
	},
	[161] = { 
		id=161,
		style_color="#111111",
		size=18,
		colour="#f7f7de",
	},
	[162] = { 
		id=162,
		style_color="#111111",
		size=18,
		colour="#000818",
	},
	[163] = { 
		id=163,
		style_color="#111111",
		size=18,
		colour="#081839",
	},
	[164] = { 
		id=164,
		style_color="#111111",
		size=18,
		colour="#081029",
	},
	[165] = { 
		id=165,
		style_color="#111111",
		size=18,
		colour="#081800",
	},
	[166] = { 
		id=166,
		style_color="#111111",
		size=18,
		colour="#082900",
	},
	[167] = { 
		id=167,
		style_color="#111111",
		size=18,
		colour="#0052a5",
	},
	[168] = { 
		id=168,
		style_color="#111111",
		size=18,
		colour="#007bde",
	},
	[169] = { 
		id=169,
		style_color="#111111",
		size=18,
		colour="#10294a",
	},
	[170] = { 
		id=170,
		style_color="#111111",
		size=18,
		colour="#10396b",
	},
	[171] = { 
		id=171,
		style_color="#111111",
		size=18,
		colour="#10528c",
	},
	[172] = { 
		id=172,
		style_color="#111111",
		size=18,
		colour="#215aa5",
	},
	[173] = { 
		id=173,
		style_color="#111111",
		size=18,
		colour="#10315a",
	},
	[174] = { 
		id=174,
		style_color="#111111",
		size=18,
		colour="#104284",
	},
	[175] = { 
		id=175,
		style_color="#111111",
		size=18,
		colour="#315284",
	},
	[176] = { 
		id=176,
		style_color="#111111",
		size=18,
		colour="#182131",
	},
	[177] = { 
		id=177,
		style_color="#111111",
		size=18,
		colour="#4a5a7b",
	},
	[178] = { 
		id=178,
		style_color="#111111",
		size=18,
		colour="#526ba5",
	},
	[179] = { 
		id=179,
		style_color="#111111",
		size=18,
		colour="#293963",
	},
	[180] = { 
		id=180,
		style_color="#111111",
		size=18,
		colour="#4169E1",
	},
	[181] = { 
		id=181,
		style_color="#111111",
		size=18,
		colour="#292921",
	},
	[182] = { 
		id=182,
		style_color="#111111",
		size=18,
		colour="#4a4a39",
	},
	[183] = { 
		id=183,
		style_color="#111111",
		size=18,
		colour="#292918",
	},
	[184] = { 
		id=184,
		style_color="#111111",
		size=18,
		colour="#4a4a29",
	},
	[185] = { 
		id=185,
		style_color="#111111",
		size=18,
		colour="#7b7b42",
	},
	[186] = { 
		id=186,
		style_color="#111111",
		size=18,
		colour="#9c9c4a",
	},
	[187] = { 
		id=187,
		style_color="#111111",
		size=18,
		colour="#5a5a29",
	},
	[188] = { 
		id=188,
		style_color="#111111",
		size=18,
		colour="#424214",
	},
	[189] = { 
		id=189,
		style_color="#111111",
		size=18,
		colour="#393900",
	},
	[190] = { 
		id=190,
		style_color="#111111",
		size=18,
		colour="#595900",
	},
	[191] = { 
		id=191,
		style_color="#111111",
		size=18,
		colour="#ca352c",
	},
	[192] = { 
		id=192,
		style_color="#111111",
		size=18,
		colour="#6b7321",
	},
	[193] = { 
		id=193,
		style_color="#111111",
		size=18,
		colour="#293100",
	},
	[194] = { 
		id=194,
		style_color="#111111",
		size=18,
		colour="#313910",
	},
	[195] = { 
		id=195,
		style_color="#111111",
		size=18,
		colour="#313918",
	},
	[196] = { 
		id=196,
		style_color="#111111",
		size=18,
		colour="#424a00",
	},
	[197] = { 
		id=197,
		style_color="#111111",
		size=18,
		colour="#526318",
	},
	[198] = { 
		id=198,
		style_color="#111111",
		size=18,
		colour="#5a7329",
	},
	[199] = { 
		id=199,
		style_color="#111111",
		size=18,
		colour="#314a18",
	},
	[200] = { 
		id=200,
		style_color="#111111",
		size=18,
		colour="#182100",
	},
	[201] = { 
		id=201,
		style_color="#111111",
		size=18,
		colour="#183100",
	},
	[202] = { 
		id=202,
		style_color="#111111",
		size=18,
		colour="#183910",
	},
	[203] = { 
		id=203,
		style_color="#111111",
		size=18,
		colour="#63844a",
	},
	[204] = { 
		id=204,
		style_color="#111111",
		size=18,
		colour="#6bbd4a",
	},
	[205] = { 
		id=205,
		style_color="#111111",
		size=18,
		colour="#63b54a",
	},
	[206] = { 
		id=206,
		style_color="#111111",
		size=18,
		colour="#63bd4a",
	},
	[207] = { 
		id=207,
		style_color="#111111",
		size=18,
		colour="#5a9c4a",
	},
	[208] = { 
		id=208,
		style_color="#111111",
		size=18,
		colour="#4a8c39",
	},
	[209] = { 
		id=209,
		style_color="#111111",
		size=18,
		colour="#63c64a",
	},
	[210] = { 
		id=210,
		style_color="#111111",
		size=18,
		colour="#63d64a",
	},
	[211] = { 
		id=211,
		style_color="#111111",
		size=18,
		colour="#52844a",
	},
	[212] = { 
		id=212,
		style_color="#111111",
		size=18,
		colour="#317329",
	},
	[213] = { 
		id=213,
		style_color="#111111",
		size=18,
		colour="#63c65a",
	},
	[214] = { 
		id=214,
		style_color="#111111",
		size=18,
		colour="#52bd4a",
	},
	[215] = { 
		id=215,
		style_color="#111111",
		size=18,
		colour="#10ff00",
	},
	[216] = { 
		id=216,
		style_color="#111111",
		size=18,
		colour="#182918",
	},
	[217] = { 
		id=217,
		style_color="#111111",
		size=18,
		colour="#4a884a",
	},
	[218] = { 
		id=218,
		style_color="#111111",
		size=18,
		colour="#4ae74a",
	},
	[219] = { 
		id=219,
		style_color="#111111",
		size=18,
		colour="#005a00",
	},
	[220] = { 
		id=220,
		style_color="#111111",
		size=18,
		colour="#008800",
	},
	[221] = { 
		id=221,
		style_color="#111111",
		size=18,
		colour="#009400",
	},
	[222] = { 
		id=222,
		style_color="#111111",
		size=18,
		colour="#00de00",
	},
	[223] = { 
		id=223,
		style_color="#111111",
		size=18,
		colour="#00ee00",
	},
	[224] = { 
		id=224,
		style_color="#111111",
		size=18,
		colour="#00fb00",
	},
	[225] = { 
		id=225,
		style_color="#111111",
		size=18,
		colour="#4a5a94",
	},
	[226] = { 
		id=226,
		style_color="#111111",
		size=18,
		colour="#6373b5",
	},
	[227] = { 
		id=227,
		style_color="#111111",
		size=18,
		colour="#7b8cd6",
	},
	[228] = { 
		id=228,
		style_color="#111111",
		size=18,
		colour="#6b7bd6",
	},
	[229] = { 
		id=229,
		style_color="#111111",
		size=18,
		colour="#7788ff",
	},
	[230] = { 
		id=230,
		style_color="#111111",
		size=18,
		colour="#c6c6ce",
	},
	[231] = { 
		id=231,
		style_color="#111111",
		size=18,
		colour="#94949c",
	},
	[232] = { 
		id=232,
		style_color="#111111",
		size=18,
		colour="#9c94c6",
	},
	[233] = { 
		id=233,
		style_color="#111111",
		size=18,
		colour="#313139",
	},
	[234] = { 
		id=234,
		style_color="#111111",
		size=18,
		colour="#291884",
	},
	[235] = { 
		id=235,
		style_color="#111111",
		size=18,
		colour="#180084",
	},
	[236] = { 
		id=236,
		style_color="#111111",
		size=18,
		colour="#4a4252",
	},
	[237] = { 
		id=237,
		style_color="#111111",
		size=18,
		colour="#52427b",
	},
	[238] = { 
		id=238,
		style_color="#111111",
		size=18,
		colour="#635a73",
	},
	[239] = { 
		id=239,
		style_color="#111111",
		size=18,
		colour="#ceb5f7",
	},
	[240] = { 
		id=240,
		style_color="#111111",
		size=18,
		colour="#8c7b9c",
	},
	[241] = { 
		id=241,
		style_color="#111111",
		size=18,
		colour="#7722cc",
	},
	[242] = { 
		id=242,
		style_color="#111111",
		size=18,
		colour="#ddaaff",
	},
	[243] = { 
		id=243,
		style_color="#111111",
		size=18,
		colour="#f0b42a",
	},
	[244] = { 
		id=244,
		style_color="#111111",
		size=18,
		colour="#df009f",
	},
	[245] = { 
		id=245,
		style_color="#111111",
		size=18,
		colour="#e317b3",
	},
	[246] = { 
		id=246,
		style_color="#111111",
		size=18,
		colour="#fffbf0",
	},
	[247] = { 
		id=247,
		style_color="#111111",
		size=18,
		colour="#a0a0a4",
	},
	[248] = { 
		id=248,
		style_color="#111111",
		size=18,
		colour="#808080",
	},
	[249] = { 
		id=249,
		style_color="#111111",
		size=18,
		colour="#ff0000",
	},
	[250] = { 
		id=250,
		style_color="#111111",
		size=18,
		colour="#00ff00",
	},
	[251] = { 
		id=251,
		style_color="#111111",
		size=18,
		colour="#ffff00",
	},
	[252] = { 
		id=252,
		style_color="#111111",
		size=18,
		colour="#4169E1",
	},
	[253] = { 
		id=253,
		style_color="#111111",
		size=18,
		colour="#ff00ff",
	},
	[254] = { 
		id=254,
		style_color="#111111",
		size=18,
		colour="#00ffff",
	},
	[255] = { 
		id=255,
		style_color="#111111",
		size=18,
		colour="#ffffff",
	},
}

function ColorStyleProxy:ctor()
    ColorStyleProxy.super.ctor( self )

    self._oriConfig = COLOR_CONFIG
	self._config = COLOR_CONFIG
end

function ColorStyleProxy:onRegister()
    ColorStyleProxy.super.onRegister( self )
end

function ColorStyleProxy:LoadConfig()
	local config = {}
    if SL:IsFileExist("scripts/game_config/cfg_extra_color.lua") then
		config = SL:RequireFile("game_config/cfg_extra_color")
	end
	for id, data in pairs(config) do
		if id > 255 then
			self._config[id] = data
		end
	end
end

function ColorStyleProxy:GetOriConfig()
    return self._oriConfig
end

function ColorStyleProxy:GetConfig()
    return self._config
end

function ColorStyleProxy:GetStyleById(id)
    local config = self._config[id]
	if config and global.isWinPlayMode then
		config.size = 12
	end
	local PCFontConfig = SL:GetMetaValue("GAME_DATA","PCFontConfig")
    if config and PCFontConfig and PCFontConfig[2]  then 
        config.fontSize = PCFontConfig[2]
    end
    return config
end

function ColorStyleProxy:GetTTFConfigById(id)
    local style = self:GetStyleById(id)
    if not style then
        return nil
    end
	local PCFontConfig = SL:GetMetaValue("GAME_DATA","PCFontConfig")
    local config =
    {
        outlineSize     = style.style or 1,
        outlineColor    = GetColorFromHexString( style.style_color or "#000000" ),
        fontSize        = (PCFontConfig and PCFontConfig[2]) or style.size or 12,
        underline       = style.underline == 1,
        color           = GetColorFromHexString( style.colour or "#FFFFFF" ),
        shadow_color    = style.shadow_color and GetRGBAFromHexString( style.shadow_color ) or nil,
        shadow_offset   = style.shadow_offset and cc.size( tnum(ssplit( style.shadow_offset, "&" )[1]), tnum(ssplit( style.shadow_offset, "&" )[2]) ) or cc.size( 2, -2 )
    }

    return config
end

function ColorStyleProxy:SetStyleById( sender, id )
    if (not sender) or (not id) then
        print( "error : ColorStyleProxy step 1: error sender or id" )
        return sender
    end

    local config = self:GetTTFConfigById(id)
    if (not config) then
        -- print( "error : ColorStyleProxy step 2, config is empty, id:  " .. id )
        return sender
    end

    local labelRenderer = nil
    if sender:getDescription() == "Label" then
        labelRenderer = sender:getVirtualRenderer()
        sender:setFontSize(config.fontSize)
    elseif sender:getDescription() == "Button" then
        labelRenderer = sender:getTitleRenderer()
        
        -- 设置按钮字体大小
        sender:setTitleFontSize( config.fontSize )
        
    end
    
    -- 填充
    if labelRenderer then
        labelRenderer:setTextColor( config.color )

        if global.isWinPlayMode then 
        else
            -- 描边颜色和大小
            labelRenderer:enableOutline(config.outlineColor, config.outlineSize)
            -- 字体大小
            local lastTTFConfig         = labelRenderer:getTTFConfig()
            lastTTFConfig.fontSize      = config.fontSize
            labelRenderer:setTTFConfig( lastTTFConfig )
        end
        

        -- 阴影
        if config.shadow_color then
            labelRenderer:enableShadow( config.shadow_color, config.shadow_offset, 0 )
        end

        -- 下划线
        if labelRenderer.underline and ( not tolua.isnull( labelRenderer.underline ) ) then
            labelRenderer.underline:removeFromParent()
            labelRenderer.underline = nil
        end
        if config.underline then
            local underline = UnderLineComponent:create()
            underline:attachToNode( labelRenderer, labelRenderer:getTextColor() )
            labelRenderer.underline = underline
        end
    else
        print( "error : ColorStyleProxy step 3: error renderer" )
    end

    return sender
end

function GET_COLOR_CONFIG( id )
    local proxy = global.Facade:retrieveProxy( global.ProxyTable.ColorStyleProxy )
    return proxy:GetStyleById( id )
end

function GET_COLOR_TTFCONFIG( id )
    local proxy = global.Facade:retrieveProxy( global.ProxyTable.ColorStyleProxy )
    return proxy:GetTTFConfigById( id )
end

function GET_COLOR_BYID( id )
    local proxy = global.Facade:retrieveProxy( global.ProxyTable.ColorStyleProxy )
    local config = proxy:GetStyleById( id )
    if config then
        return config.colour
    end
    
    return "#ffffff"
end

function GET_COLOR_BYID_C3B( id )
    return GetColorFromHexString( GET_COLOR_BYID(id) )
end

function GET_SIZE_BYID( id )
    local proxy = global.Facade:retrieveProxy( global.ProxyTable.ColorStyleProxy )
    local config = proxy:GetStyleById( id )
    if config then
        return config.size
    end
    
    return 16
end

-- 设置颜色 param sender
function SET_COLOR_STYLE( sender, id )
    id = tonumber(id)
    local proxy = global.Facade:retrieveProxy( global.ProxyTable.ColorStyleProxy )
    return proxy:SetStyleById( sender, id )
end

return ColorStyleProxy