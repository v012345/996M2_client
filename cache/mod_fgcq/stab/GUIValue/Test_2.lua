return 
{ 
	["TFunc"] = function ()
		return SL:GetMetaValue("LEVEL") + SL:GetMetaValue("RELEVEL") + 100
	end,
	["TData"] = function (i)
		return ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15})[i] or 0
	end,
	["LNum"] = 5,
	["Index"] = 1,
	["<T_D1>"] = 
	{
		[1] = function () return VALUE("<H>", "测试私人1") end,
		[2] = function () return VALUE("<H>", "测试私人2") end,
		[3] = function () return VALUE("<H>", "测试私人3") end,
		[4] = function () return VALUE("<H>", "测试私人4") end,
		[5] = function () return VALUE("<H>", "测试私人5") end
	}
}
