-- anti_cheat_client.lua
local AllowedAssetsInQueue = {0}  -- Добавьте все разрешенные ID ассетов здесь
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

-- Проверяем, выполняется ли скрипт в правильном месте
if not script:IsDescendantOf(game:GetService("Players").LocalPlayer.Character) then
    script:Destroy()
    return
end

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

-- Защита от удаления скрипта
script.AncestryChanged:Connect(function(_, parent)
    if not parent then
        -- Попытка удаления скрипта - кикаем игрока
        kickPlayer("Anti-Cheat protection violated")
    end
end)

-- Основной цикл проверки
task.spawn(function()
    task.wait(3)  -- Начальная задержка для загрузки всего
    while true do
        if isExploitDetected() then
            warn("Potential exploit detected!")
            kickPlayer("Exploit detected. Please don't use unauthorized software.")
        end
        task.wait(1)  -- Проверка каждую секунду
    end
end)
