local HotUpdateGMInitAssets = class('HotUpdateGMInitAssets')
HotUpdateGMInitAssets.NAME = "HotUpdateGMInitAssets"
local AssetsManager = requireLauncher( "res_check/assets_manager" )

local Tags = "HotUpdateGMInitAssets"

function HotUpdateGMInitAssets:ctor()
    self._downloader = nil
end

function HotUpdateGMInitAssets:CleanupDownloader()
    if self._downloader then
        self._downloader:Cleanup()
        self._downloader = nil
    end
end

function HotUpdateGMInitAssets:handleAlreadyUpToDate()
    self:CleanupDownloader()

    global.L_HotUpdateGMAssets:CheckUpdate()
end

function HotUpdateGMInitAssets:CheckUpdate()
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
    if not moduleGameEnv:GetGMInitResURL() or string.len(moduleGameEnv:GetGMInitResURL()) == 0 then
        releasePrint("can not find GMInitResURL !!")
        self:handleAlreadyUpToDate()
        return
    end
    if not moduleGameEnv:GetGMInitResVer() or string.len(moduleGameEnv:GetGMInitResVer()) == 0 then
        releasePrint("can not find GMInitResVer !!")
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

    local localManifestName = "gm_init_assets_project.manifest"
    local localVersionName  = "gm_init_assets_version.manifest"

    local tempManifestName  = "gm_init_assets_project.manifest.temp"
    local tempDirName       = "/_gm_init_assets_temp"
    local resUrl            = string.format("%s", moduleGameEnv:GetGMInitResURL())
    
    local gmurlsuffix       = moduleGameEnv:GetSelectedServerGmurlsuffix()
    if gmurlsuffix and gmurlsuffix ~= "" then
        resUrl = resUrl  .. gmurlsuffix .. "/"
    end
    local resVersionOri     = moduleGameEnv:GetGMInitResVer()
    local manifestUrl       = resUrl .. localManifestName
    local versionUrl        = resUrl .. localVersionName
    local jobs              = 1
    local ignoreLocal       = true

    ------------
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
    releasePrint( "pull gm_init_assets:" )
    releasePrint( manifestUrl )
    releasePrint( versionUrl )
    releasePrint( resVersion )
    releasePrint( resUrl )
    releasePrint( "ignore local:" .. tostring(ignoreLocal) )
    releasePrint( "local storage path:" .. tostring(storagePath) )
    releasePrint( "-------------------------------------------------------------" )

    -- request download
    local ret = downloader:DownLoadRequest( "gm_init_assets", localManifestName, storagePath, tempManifestName, tempDirName,
                                            resUrl, manifestUrl, versionUrl, resVersion, jobs, ignoreLocal)

    if not ret then
        downloader:Cleanup()
        releasePrint("GMInitRES Hotupdate ERR DownLoadRequest failed!!")
        self:handleAlreadyUpToDate()
        return
    end

    self._downloader = downloader
end

function HotUpdateGMInitAssets:onLocalManifestError()
    releasePrint(Tags, "Local Manifest Error!")

    -- skip
    self:handleAlreadyUpToDate()
end

function HotUpdateGMInitAssets:onRemoteManifestError()
    releasePrint(Tags, "Remote Manifest Error!")

    -- skip
    self:handleAlreadyUpToDate()
end

function HotUpdateGMInitAssets:onCheckVersionInfo()
    releasePrint(Tags, "onCheckVersionInfo")
end

function HotUpdateGMInitAssets:onNewVersion(versionSize)
    local sizeInMB = versionSize / (1024 * 1024)
    releasePrint(Tags, "New Version Found:" .. tostring(sizeInMB))

    global.L_LoadingManager:CloseLayer()
    global.L_LoadingManager:OpenLayer({loadingType=1})

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
end

function HotUpdateGMInitAssets:onAlreadyUpToDate()
    releasePrint(Tags, "Already Up To Date")

    self:handleAlreadyUpToDate()
end

function HotUpdateGMInitAssets:onUpdatePercent(percentFile)
    releasePrint(Tags, "onUpdatePercent", percentFile)
end

function HotUpdateGMInitAssets:onUpdatePercentSize(percentSize)
    releasePrint(Tags, "onUpdatePercentSize", percentSize)

    global.L_LoadingManager:UpdatePercent(percentSize)
end

function HotUpdateGMInitAssets:onAssetError(assetID, msg)
    releasePrint(Tags, "Asset Error! " .. tostring(assetID))
    global.L_SystemTipsManager:ShowTips("ASSET ERROR " .. tostring(assetID))
end

function HotUpdateGMInitAssets:onDownloadFinished()
    releasePrint(Tags, "DownloadFinished!")
    
    self:handleAlreadyUpToDate()
end

function HotUpdateGMInitAssets:onDownloadFailed()
    releasePrint(Tags, "DownloadFailed!")

    if self._downloader then
        self._downloader:Retry()
    end
end

return HotUpdateGMInitAssets