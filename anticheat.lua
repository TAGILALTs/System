-- Клиентский скрипт (LocalScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

-- Список обязательных Remote-объектов
local REQUIRED_REMOTES = {
    ["Check"] = "RemoteFunction",
    ["CheckChildExists"] = "RemoteFunction",
    ["GetKey"] = "RemoteFunction",
    ["AntiCheat"] = "RemoteEvent",
    ["PlayerAdded"] = "RemoteEvent"
}

-- Запрещенные сервисы (должны совпадать с серверными)
local RESTRICTED_SERVICES = {
    "Workspace",
    "ServerScriptService",
    "ServerStorage",
    "ReplicatedStorage",
    "StarterPack",
    "StarterPlayer",
    "StarterGui",
    "Lighting",
    "Players",
    "Teams"
}

-- Проверка, является ли объект запрещенным сервисом
local function isRestrictedService(instance)
    for _, serviceName in ipairs(RESTRICTED_SERVICES) do
        if instance.Name == serviceName then
            return true
        end
    end
    return false
end

-- Функция восстановления Remote-объектов с Key
local function ensureRemotes()
    for remoteName, remoteType in pairs(REQUIRED_REMOTES) do
        local remote = ReplicatedStorage:FindFirstChild(remoteName)
        
        -- Восстановление Remote
        if not remote or not remote:IsA(remoteType) then
            if remote then remote:Destroy() end
            
            remote = Instance.new(remoteType)
            remote.Name = remoteName
            remote.Parent = ReplicatedStorage
            
            -- Добавляем Key (будет обновлен при следующей синхронизации)
            local key = Instance.new("StringValue")
            key.Name = "Key"
            key.Value = "TEMP_KEY"
            key.Parent = remote
            
            if remoteName == "Check" then
                remote.OnClientInvoke = function()
                    return true
                end
            end
        end
        
        -- Проверка Key для существующих Remote
        if remote then
            local key = remote:FindFirstChild("Key")
            if not key then
                key = Instance.new("StringValue")
                key.Name = "Key"
                key.Value = "TEMP_KEY"
                key.Parent = remote
            end
        end
    end
end

-- Инициализация Remote-объектов
ensureRemotes()

-- Фоновая проверка Remote-объектов
task.spawn(function()
    while true do
        ensureRemotes()
        task.wait(5)
    end
end)

-- Получение текущего ключа с сервера
local function getServerKey()
    local success, key = pcall(function()
        return ReplicatedStorage.GetKey:InvokeServer()
    end)
    return success and key or nil
end

-- Проверка цепочки родителей
local function getParentChain(instance)
    local chain = {}
    local parent = instance.Parent
    while parent do
        table.insert(chain, parent)
        parent = parent.Parent
    end
    return chain
end

-- Проверка имени объекта
local IGNORED_OBJECTS = {
    -- ... (ваш список игнорируемых объектов)
}

local function isIgnoredObject(name)
    for _, objName in ipairs(IGNORED_OBJECTS) do
        if name == objName then
            return true
        end
    end
    return false
end

-- Основной мониторинг
task.wait(1)

game.DescendantAdded:Connect(function(descendant)
    -- Пропускаем системные объекты
    if isIgnoredObject(descendant.Name) or isRestrictedService(descendant) then
        return
    end

    -- Проверка Remote-объектов
    if (descendant:IsA("RemoteEvent") or (descendant:IsA("RemoteFunction")) then
        if not REQUIRED_REMOTES[descendant.Name] then
            ReplicatedStorage.AntiCheat:FireServer(
                "REMOTE_TAMPERING", 
                "Неавторизованный Remote объект: "..descendant.Name
            )
            return
        end
    end

    -- Проверка Key
    local serverKey = getServerKey()
    if not serverKey then return end

    local instanceKey = descendant:FindFirstChild("Key")
    
    -- Если это сам Key
    if descendant.Name == "Key" then
        if descendant.Value ~= serverKey then
            ReplicatedStorage.AntiCheat:FireServer(
                descendant.Parent.Name,
                "Неверный Key: "..descendant.Value
            )
        end
    -- Если Key отсутствует у объекта
    elseif not instanceKey and not isRestrictedService(descendant) then
        ReplicatedStorage.AntiCheat:FireServer(
            descendant.Name,
            "Отсутствует Key"
        )
    end
end)

-- Проверка существующих объектов при загрузке
task.spawn(function()
    task.wait(3) -- Даем время на инициализацию
    
    local serverKey = getServerKey()
    if not serverKey then return end

    for _, instance in ipairs(game:GetDescendants()) do
        if not isIgnoredObject(instance.Name) and not isRestrictedService(instance) then
            local key = instance:FindFirstChild("Key")
            
            -- Проверка для Remote-объектов
            if (instance:IsA("RemoteEvent") or instance:IsA("RemoteFunction")) then
                if not REQUIRED_REMOTES[instance.Name] then
                    ReplicatedStorage.AntiCheat:FireServer(
                        "REMOTE_TAMPERING", 
                        "Обнаружен неавторизованный Remote: "..instance.Name
                    )
                end
            end
            
            -- Проверка Key
            if instance.Name == "Key" then
                if instance.Value ~= serverKey then
                    ReplicatedStorage.AntiCheat:FireServer(
                        instance.Parent.Name,
                        "Неверный Key при загрузке: "..instance.Value
                    )
                end
            elseif not key and not isRestrictedService(instance) then
                ReplicatedStorage.AntiCheat:FireServer(
                    instance.Name,
                    "Отсутствует Key при загрузке"
                )
            end
        end
    end
end)
