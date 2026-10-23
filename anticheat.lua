local GuiModule = {}

local Players = game:GetService("Players")

-- ═══════════════ КОНФИГ ═══════════════
local CONFIG = {
    Text = "дедуля не поможет",
    TextColor = Color3.fromRGB(255, 255, 255),
    BackgroundColor = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.4,
    TextSize = 24,
    Font = Enum.Font.GothamBold,

    Position = UDim2.new(0.5, 0, 0, 20),
    Size = UDim2.new(0, 300, 0, 60),
    AnchorPoint = Vector2.new(0.5, 0),

    GuiName = "CustomGui",
    LabelName = "CustomLabel",
    ResetOnSpawn = false,
}

-- ═══════════════ ВНУТРЕННИЕ ФУНКЦИИ ═══════════════
local connections = {}

local function createGui(player)
    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        playerGui = player:WaitForChild("PlayerGui", 10)
    end
    if not playerGui then return end

    -- Удаляем старый
    local old = playerGui:FindFirstChild(CONFIG.GuiName)
    if old then old:Destroy() end

    -- ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = CONFIG.GuiName
    screenGui.ResetOnSpawn = CONFIG.ResetOnSpawn
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = playerGui

    -- TextLabel
    local label = Instance.new("TextLabel")
    label.Name = CONFIG.LabelName
    label.Text = CONFIG.Text
    label.TextColor3 = CONFIG.TextColor
    label.BackgroundColor3 = CONFIG.BackgroundColor
    label.BackgroundTransparency = CONFIG.BackgroundTransparency
    label.TextSize = CONFIG.TextSize
    label.Font = CONFIG.Font
    label.Position = CONFIG.Position
    label.Size = CONFIG.Size
    label.AnchorPoint = CONFIG.AnchorPoint
    label.Parent = screenGui

    -- Закругление
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = label

    return screenGui
end

local function setupPlayer(player)
    createGui(player)

    -- Пересоздаём при респавне
    local conn = player.CharacterAdded:Connect(function()
        task.wait(0.5)
        createGui(player)
    end)

    connections[player] = conn
end

local function cleanupPlayer(player)
    if connections[player] then
        connections[player]:Disconnect()
        connections[player] = nil
    end
end

-- ═══════════════ ПУБЛИЧНЫЕ ФУНКЦИИ ═══════════════

-- Запустить систему (вызывать 1 раз)
function GuiModule.Start()
    -- Уже в игре
    for _, player in ipairs(Players:GetPlayers()) do
        setupPlayer(player)
    end

    -- Новые игроки
    Players.PlayerAdded:Connect(setupPlayer)
    Players.PlayerRemoving:Connect(cleanupPlayer)
end

-- Поменять текст у всех сразу
function GuiModule.SetText(newText)
    CONFIG.Text = newText
    for _, player in ipairs(Players:GetPlayers()) do
        createGui(player)
    end
end

-- Получить конфиг (на случай если надо изменить поля)
function GuiModule.GetConfig()
    return CONFIG
end

return GuiModule
