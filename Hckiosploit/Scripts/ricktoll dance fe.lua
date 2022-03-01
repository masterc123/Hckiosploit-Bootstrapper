wait(2)
local player = game.Players.LocalPlayer.Character
 
game:GetService("RunService").Heartbeat:Connect(function()
  player["Head"].Velocity = Vector3.new(0,27.95,0)
end)
game:GetService("RunService").Heartbeat:Connect(function()
  player["Torso"].Velocity = Vector3.new(0,27.95,0)
end)
game:GetService("RunService").Heartbeat:Connect(function()
  player["Left Arm"].Velocity = Vector3.new(0,28.95,0)
end)
game:GetService("RunService").Heartbeat:Connect(function()
  player["Right Arm"].Velocity = Vector3.new(0,28.95,0)
end)
game:GetService("RunService").Heartbeat:Connect(function()
  player["Left Leg"].Velocity = Vector3.new(0,28.95,0)
end)
game:GetService("RunService").Heartbeat:Connect(function()
  player["Right Leg"].Velocity = Vector3.new(0,28.95,0)
end)
 
game:GetService("RunService").Heartbeat:Connect(function()
  player["HumanoidRootPart"].Velocity = Vector3.new(0,28.95,0)
end)
 
 
game:GetService("RunService").Heartbeat:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetAccessories()) do 
if not v.Handle:FindFirstChild("AccessoryWeld") then 
v.Handle.Velocity = Vector3.new(30,0,0)
end
end
end)