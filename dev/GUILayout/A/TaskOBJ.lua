TaskOBJ = {}
TaskOBJ.__cname = "TaskOBJ"
-------------------------------↓↓↓ UI操作 ↓↓↓---------------------------------------
function TaskOBJ:main(objcfg)

end
--[LUA-print] -         "curTaskProgress1" = 0
--[LUA-print] -         "curTaskProgress2" = 0
--[LUA-print] -         "curTaskProgress3" = 0
--[LUA-print] -         "curTaskProgress4" = 0
--[LUA-print] -         "finishCount"      = 0
--[LUA-print] -         "mainTaskProgress" = 0
--[LUA-print] -         "sideTaskProgress" = 0
--[LUA-print] -         "taskStatus"
--获取主线任务进度
function TaskOBJ:GetMainTaskProgress()
    return self.data.taskInfo.mainTaskProgress
end

--获取支线任务进度
function TaskOBJ:GetSideTaskProgress()
    return self.data.taskInfo.sideTaskProgress
end

--获取剧情完成次数
function TaskOBJ:GetFinishCount()
    return self.data.taskInfo.finishCount
end

--获取当前任务1
function TaskOBJ:GetCurTaskProgress1()
    return self.data.taskInfo.curTaskProgress1
end

--获取当前任务2
function TaskOBJ:GetCurTaskProgress2()
    return self.data.taskInfo.curTaskProgress2
end

--获取当前任务3
function TaskOBJ:GetCurTaskProgress3()
    return self.data.taskInfo.curTaskProgress3
end

--获取当前任务4
function TaskOBJ:GetCurTaskProgress4()
    return self.data.taskInfo.curTaskProgress4
end

--获取任务状态
function TaskOBJ:GetCurTaskProgress4()
    return self.data.taskInfo.curTaskProgress4
end

--获取主线任务状态
function TaskOBJ:GetMainTaskStatus()
    return self.data.taskInfo.mainTaskStatus
end

--获取主线任务状态
function TaskOBJ:GetSideTaskStatus()
    return self.data.taskInfo.sideTaskStatus
end

--获取任务列表
function TaskOBJ:GetAllTask()
    return self.data.allTask
end

--执行操作
function TaskOBJ:TaskAction()
    ssrGameEvent:push(ssrEventCfg.OnTaskRefresh)
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--登录同步消息
function TaskOBJ:SyncResponse(arg1, arg2, arg3, data)
    self.data = data
    self:TaskAction()
end
return TaskOBJ
