local AllowedAssetsInQueue = {0}  -- Add all allowed asset IDs here
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

local function checkAssetsInQueue()
    return ContentProvider.RequestQueueSize
end

local function getAssetFetchStatus(asset)
    return ContentProvider:GetAssetFetchStatus(tostring(asset))
end

local function areAllowedAssetsLoaded()
    for _, asset in ipairs(AllowedAssetsInQueue) do
        if getAssetFetchStatus(asset) ~= Enum.AssetFetchStatus.Success then
            return false
        end
    end
    return true
end

local function isExploitDetected()
    local queueSize = checkAssetsInQueue()
    if queueSize == 0 then
        return false
    end

    local allLoaded = areAllowedAssetsLoaded()
    if allLoaded and queueSize > 0 then
        return true
    end

    for _, asset in ipairs(AllowedAssetsInQueue) do
        if getAssetFetchStatus(asset) == Enum.AssetFetchStatus.None then
            return true
        end
    end

    return false
end

local function kickPlayer(reason)
    local player = Players.LocalPlayer
    if player then
        player:Kick(reason)
    end
end

task.spawn(function()
    task.wait(3)  -- Initial delay from loading everything
    while true do
        if isExploitDetected() then
            print("Potential exploit detected!")
            kickPlayer("Exploit detected. Please don't use unauthorized software.")
        end
        task.wait()  -- Check every second
    end
end)
