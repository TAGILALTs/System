local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local scriptName = "LocalScript" 


script.Name = scriptName


local function antiCheatCheck()

	for _, child in ipairs(playerGui:GetChildren()) do
		if child:IsA("ScreenGui") and string.lower(child.Name) == "dex" then
			player:Kick("Вы были кикнуты за использование читов")
			return
		end
	end

	if not script:IsDescendantOf(player.PlayerScripts) or not script.Parent then
		player:Kick("Вы были кикнуты за использование читов")
		return
	end


	for _, obj in ipairs(player:GetDescendants()) do
		if string.lower(obj.Name) == "dex" then
			player:Kick("Вы были кикнуты за использование читов")
			return
		end
	end
end


antiCheatCheck()


playerGui.ChildAdded:Connect(function(child)
	if child:IsA("ScreenGui") and string.lower(child.Name) == "dex" then
		player:Kick("Вы были кикнуты за использование читов")
	end
end)


coroutine.wrap(function()
	while wait(5) do

		local found = false
		for _, scr in ipairs(player.PlayerScripts:GetChildren()) do
			if scr.Name == scriptName then
				found = true
				break
			end
		end

		if not found then
			player:Kick("Вы были кикнуты за использование читов")
			return
		end


		antiCheatCheck()
	end
end)()
