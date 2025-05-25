local HotUpdateGMAssets = class('HotUpdateGMAssets')
HotUpdateGMAssets.NAME = "HotUpdateGMAssets"
local AssetsManager = requireLauncher( "res_check/assets_manager" )

local Tags = "HotUpdateGMAssets"

function HotUpdateGMAssets:ctor()
    self._downloader = nil
end

function HotUpdateGMAssets:CleanupDownloader()
    if self._downloader then
        self._downloader:Cleanup()
        self._downloader = nil
    end
end

function HotUpdateGMAssets:handleAlreadyUpToDate()
    if self._downloader and global.L_ModuleManager:GetCurrentModule() and global.L_ModuleManager:GetCurrentModule():GetCurrentSubMod() then
        local currentSubMod = global.L_ModuleManager:GetCurrentModule():GetCurrentSubMod()
        local version = self._downloader:GetRemoteManifestVer()
        currentSubMod:SetRemoteVersion( version )
    end
    
    global.L_LoadingManager:CloseLayer()

    self:CleanupDownloader()

    global.L_ModuleManager:RunCurrentModule()
end

function HotUpdateGMAssets:CheckUpdate()
    if global.L_GameEnvManager:IsReview() then
        self:handleAlreadyUpToDate()
        return
    end

    if not global.L_ModuleManager and not global.L_ModuleManager:GetCurrentModule() then
        releasePrint("can not find current module!!")
        return
    end

    -- GM Init Res URL
    local module            = global.L_ModuleManager:GetCurrentModule()
    local moduleGameEnv     = module:GetGameEnv()
    if not moduleGameEnv:GetGMResURL() or string.len(moduleGameEnv:GetGMResURL()) == 0 then
        releasePrint("can not find GMResURL !!")
        self:handleAlreadyUpToDate()
        return
    end
    if not moduleGameEnv:GetGMResVer() or string.len(moduleGameEnv:GetGMResVer()) == 0 then
        releasePrint("can not find GMResVer !!")
        self:handleAlreadyUpToDate()
        return
    end

    -- new downloader
    local function versionCompare(str1, str2)
        if str1 == "999.1.1" then
            -- 内网测试版本
            return 1
        end
        if str1 ~= str2 then
            return -1
        end
        return 1
    end
    local downloader = AssetsManager:new()
    downloader:SetEventDelegate(self)
    downloader:SetVersionCompareHandle(versionCompare)

    local fileUtil          = cc.FileUtils:getInstance()
    local writablePath      = fileUtil:getWritablePath()
    local module            = global.L_ModuleManager:GetCurrentModule()
    local modulePath        = module:GetSubModPath()
    local moduleGameEnv     = module:GetGameEnv()
    local storagePath       = writablePath .. modulePath

    local localManifestName = "gm_assets_project.manifest"
    local localVersionName  = "gm_assets_version.manifest"

    local tempManifestName  = "gm_assets_project.manifest.temp"
    local tempDirName       = "/_gm_assets_temp"
    local resUrl            = string.format("%s", moduleGameEnv:GetGMResURL())

    local gmurlsuffix       = moduleGameEnv:GetSelectedServerGmurlsuffix()
    if gmurlsuffix and gmurlsuffix ~= "" then
        resUrl = resUrl  .. gmurlsuffix .. "/"
    end
    local resVersionOri     = moduleGameEnv:GetGMInitResVer()
    local manifestUrl       = resUrl .. localManifestName
    local versionUrl        = resUrl .. localVersionName
    local jobs              = 1
    local ignoreLocal       = true

    local subMod        = module:GetCurrentSubMod()
    local subModInfo    = subMod:GetSubModInfo()
    local gameid        = subMod:GetOperID()
    local xk            = subMod:GetXK()
    local channelID     = global.L_GameEnvManager:GetChannelID() or 1

    local sign  = GetCdnSign(gameid, global.modListSrvTime, xk or "")
    local param = string.format("gameId=%s&time=%s&sign=%s&channelID=%s", gameid, global.modListSrvTime, sign, channelID)
    local resVersion  = string.format("%s&%s", resVersionOri, param)

    -- verbose
    releasePrint( "-------------------------------------------------------------" )
    releasePrint( "pull gm_assets:" )
    releasePrint( manifestUrl )
    releasePrint( versionUrl )
    releasePrint( resVersion )
    releasePrint( "ignore local:" .. tostring(ignoreLocal) )
    releasePrint( "local storage path:" .. tostring(storagePath) )
    releasePrint( "-------------------------------------------------------------" )

    -- request download
    local ret = downloader:DownLoadRequest( "gm_assets", localManifestName, storagePath, tempManifestName, tempDirName,
                                            resUrl, manifestUrl, versionUrl, resVersion, jobs, ignoreLocal)

    if not ret then
        downloader:Cleanup()
        releasePrint("GMRES Hotupdate ERR DownLoadRequest failed!!")
        self:handleAlreadyUpToDate()
        return
    end

    self._downloader = downloader
end

function HotUpdateGMAssets:onLocalManifestError()
    releasePrint(Tags, "Local Manifest Error!")

    -- skip
    self:handleAlreadyUpToDate()
end

function HotUpdateGMAssets:onRemoteManifestError()
    releasePrint(Tags, "Remote Manifest Error!")

    -- skip
    self:handleAlreadyUpToDate()
end

function HotUpdateGMAssets:onCheckVersionInfo()
    releasePrint(Tags, "onCheckVersionInfo")
end

function HotUpdateGMAssets:onNewVersion(versionSize)
    local sizeInMB = versionSize / (1024 * 1024)
    releasePrint(Tags, "New Version Found:" .. tostring(sizeInMB))

    global.L_LoadingManager:CloseLayer()
    global.L_LoadingManager:OpenLayer({loadingType=2})

    local scheduler = cc.Director:getInstance():getScheduler()
    local handle = nil
    handle = scheduler:scheduleScriptFunc(
        function()
            scheduler:unscheduleScriptEntry(handle)

            if self._downloader then
                self._downloader:StartUpdate()
            end
        end,
        1/60,
        false
    )

    local moduleGameEnv = global.L_ModuleManager:GetCurrentModule():GetGameEnv()
    local selSerInfo    = moduleGameEnv:GetSelectedServer()
    local server_id     = selSerInfo and selSerInfo.serverId
    local server_name   = selSerInfo and selSerInfo.serverName

    local dataParam = {
        event = {
            time = os.time(), name = "startLoading2", type = "track"
        },
        properities = {
            servid = tostring(server_id), server_name = tostring(server_name)
        }
    }
    global.L_DataRePort:SendRePortData( dataParam )
end

function HotUpdateGMAssets:onAlreadyUpToDate()
    releasePrint(Tags, "Already Up To Date")

    self:handleAlreadyUpToDate()
end

function HotUpdateGMAssets:onUpdatePercent(percentFile)
    releasePrint(Tags, "onUpdatePercent", percentFile)
    
    -- global.L_LoadingManager:UpdatePercent(percentFile)
end

function HotUpdateGMAssets:onUpdatePercentSize(percentSize)
    releasePrint(Tags, "onUpdatePercentSize", percentSize)

    global.L_LoadingManager:UpdatePercent(percentSize)
end

function HotUpdateGMAssets:onAssetError(assetID, msg)
    releasePrint(Tags, "Asset Error! " .. tostring(assetID))
    global.L_SystemTipsManager:ShowTips("ASSET ERROR " .. tostring(assetID))
end

function HotUpdateGMAssets:onDownloadFinished()
    releasePrint(Tags, "DownloadFinished!")
    
    local moduleGameEnv = global.L_ModuleManager:GetCurrentModule():GetGameEnv()
    local selSerInfo    = moduleGameEnv:GetSelectedServer()
    local server_id     = selSerInfo and selSerInfo.serverId
    local server_name   = selSerInfo and selSerInfo.serverName

    local dataParam = {
        event = {
            time = os.time(), name = "finishLoading2", type = "track"
        },
        properities = {
            servid = tostring(server_id), server_name = tostring(server_name)
        }
    }
    global.L_DataRePort:SendRePortData( dataParam )

    self:handleAlreadyUpToDate()
end

function HotUpdateGMAssets:onDownloadFailed()
    releasePrint(Tags, "DownloadFailed!")

    if self._downloader then
        self._downloader:Retry()
    end
end

return HotUpdateGMAssets