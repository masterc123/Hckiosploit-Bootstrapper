loadstring(game:HttpGet("https://pastebin.com/raw/hwNz1yVW"))()


--[[

local yah = Instance.new("ScreenGui")
local yeet = Instance.new("Frame")
local lego = Instance.new("TextLabel")
local r = Instance.new("TextButton")
local credits = Instance.new("TextLabel")
local i = Instance.new("TextButton")
local gn = Instance.new("TextButton")
local w = Instance.new("TextButton")
local box = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local sh = Instance.new("TextButton")
local me = Instance.new("TextButton")
local bi = Instance.new("TextButton")
local g = Instance.new("TextButton")
local pgo = Instance.new("TextButton")
local ggo = Instance.new("TextButton")
local c = Instance.new("TextButton")

yah.Name = "yah"
yah.Parent = game.CoreGui
yah.ResetOnSpawn = false

yeet.Name = "yeet"
yeet.Parent = yah
yeet.Active = true
yeet.BackgroundColor3 = Color3.new(0, 0, 0)
yeet.BackgroundTransparency = 0.5
yeet.BorderColor3 = Color3.new(0, 0, 0)
yeet.BorderSizePixel = 0
yeet.Position = UDim2.new(0.695012271, 0, 0.497543007, 0)
yeet.Size = UDim2.new(0, 322, 0, 386)
yeet.Draggable = true

lego.Name = "lego"
lego.Parent = yeet
lego.BackgroundColor3 = Color3.new(1, 1, 1)
lego.BackgroundTransparency = 1
lego.BorderColor3 = Color3.new(0, 0, 0)
lego.BorderSizePixel = 12
lego.Position = UDim2.new(0.189440995, 0, -0.0207253881, 0)
lego.Size = UDim2.new(0, 200, 0, 50)
lego.Font = Enum.Font.SourceSansLight
lego.Text = "Paw's Fencing GUI"
lego.TextColor3 = Color3.new(1, 1, 1)
lego.TextScaled = true
lego.TextSize = 14
lego.TextWrapped = true

r.Name = "r"
r.Parent = yeet
r.BackgroundColor3 = Color3.new(1, 1, 1)
r.BackgroundTransparency = 0.40000000596046
r.Position = UDim2.new(0.0186335407, 0, 0.194300517, 0)
r.Size = UDim2.new(0, 150, 0, 33)
r.Font = Enum.Font.SourceSansLight
r.Text = "Reach"
r.TextColor3 = Color3.new(0, 0, 0)
r.TextScaled = true
r.TextSize = 14
r.TextWrapped = true

credits.Name = "credits"
credits.Parent = yeet
credits.BackgroundColor3 = Color3.new(1, 1, 1)
credits.BackgroundTransparency = 1
credits.Position = UDim2.new(0, 0, 0.0932642445, 0)
credits.Size = UDim2.new(0, 322, 0, 33)
credits.Font = Enum.Font.SourceSansLight
credits.Text = "Credits go to pawtrailsss, CyclicaIIy, and TheExploiter18."
credits.TextColor3 = Color3.new(1, 1, 1)
credits.TextScaled = true
credits.TextSize = 16
credits.TextWrapped = true

i.Name = "i"
i.Parent = yeet
i.BackgroundColor3 = Color3.new(1, 1, 1)
i.BackgroundTransparency = 0.40000000596046
i.Position = UDim2.new(0.0186335407, 0, 0.300518125, 0)
i.Size = UDim2.new(0, 150, 0, 33)
i.Font = Enum.Font.SourceSansLight
i.Text = "Invisible"
i.TextColor3 = Color3.new(0, 0, 0)
i.TextScaled = true
i.TextSize = 14
i.TextWrapped = true

gn.Name = "gn"
gn.Parent = yeet
gn.BackgroundColor3 = Color3.new(1, 1, 1)
gn.BackgroundTransparency = 0.40000000596046
gn.Position = UDim2.new(0.515527964, 0, 0.194300517, 0)
gn.Size = UDim2.new(0, 150, 0, 33)
gn.Font = Enum.Font.SourceSansLight
gn.Text = "Giraffe Neck"
gn.TextColor3 = Color3.new(0, 0, 0)
gn.TextScaled = true
gn.TextSize = 14
gn.TextWrapped = true

w.Name = "w"
w.Parent = yeet
w.BackgroundColor3 = Color3.new(1, 1, 1)
w.BackgroundTransparency = 0.40000000596046
w.Position = UDim2.new(0.515527964, 0, 0.300518125, 0)
w.Size = UDim2.new(0, 150, 0, 33)
w.Font = Enum.Font.SourceSansLight
w.Text = "Wings"
w.TextColor3 = Color3.new(0, 0, 0)
w.TextScaled = true
w.TextSize = 14
w.TextWrapped = true

box.Name = "box"
box.Parent = yeet
box.BackgroundColor3 = Color3.new(0, 0, 0)
box.BackgroundTransparency = 0.5
box.BorderSizePixel = 0
box.Position = UDim2.new(-1.19254661, 0, -0.0673575103, 0)
box.Size = UDim2.new(0, 199, 0, 93)
box.Visible = false

TextLabel.Parent = box
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, -0.376344085, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 35)
TextLabel.Font = Enum.Font.SourceSansLight
TextLabel.Text = "Select which reach you want."
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true

sh.Name = "sh"
sh.Parent = box
sh.BackgroundColor3 = Color3.new(0, 0, 0)
sh.BorderSizePixel = 0
sh.Position = UDim2.new(0.0502512567, 0, 0.193548381, 0)
sh.Size = UDim2.new(0, 54, 0, 28)
sh.Font = Enum.Font.SourceSans
sh.Text = "short"
sh.TextColor3 = Color3.new(1, 1, 1)
sh.TextSize = 14

me.Name = "me"
me.Parent = box
me.BackgroundColor3 = Color3.new(0, 0, 0)
me.BorderSizePixel = 0
me.Position = UDim2.new(0.366834164, 0, 0.193548381, 0)
me.Size = UDim2.new(0, 53, 0, 28)
me.Font = Enum.Font.SourceSans
me.Text = "medium"
me.TextColor3 = Color3.new(1, 1, 1)
me.TextSize = 14

bi.Name = "bi"
bi.Parent = box
bi.BackgroundColor3 = Color3.new(0, 0, 0)
bi.BorderSizePixel = 0
bi.Position = UDim2.new(0.673366785, 0, 0.193548381, 0)
bi.Size = UDim2.new(0, 53, 0, 28)
bi.Font = Enum.Font.SourceSans
bi.Text = "big"
bi.TextColor3 = Color3.new(1, 1, 1)
bi.TextSize = 14

g.Name = "g"
g.Parent = yeet
g.BackgroundColor3 = Color3.new(1, 1, 1)
g.BackgroundTransparency = 0.40000000596046
g.Position = UDim2.new(0.515527964, 0, 0.409326404, 0)
g.Size = UDim2.new(0, 150, 0, 33)
g.Font = Enum.Font.SourceSansLight
g.Text = "Gun"
g.TextColor3 = Color3.new(0, 0, 0)
g.TextScaled = true
g.TextSize = 14
g.TextWrapped = true

pgo.Name = "pgo"
pgo.Parent = yeet
pgo.BackgroundColor3 = Color3.new(1, 1, 1)
pgo.BackgroundTransparency = 0.40000000596046
pgo.Position = UDim2.new(0.0186335444, 0, 0.409326404, 0)
pgo.Size = UDim2.new(0, 150, 0, 33)
pgo.Font = Enum.Font.SourceSansLight
pgo.Text = "Permanent God"
pgo.TextColor3 = Color3.new(0, 0, 0)
pgo.TextScaled = true
pgo.TextSize = 14
pgo.TextWrapped = true

ggo.Name = "ggo"
ggo.Parent = yeet
ggo.BackgroundColor3 = Color3.new(1, 1, 1)
ggo.BackgroundTransparency = 0.40000000596046
ggo.Position = UDim2.new(0.0186335444, 0, 0.518134713, 0)
ggo.Size = UDim2.new(0, 150, 0, 33)
ggo.Font = Enum.Font.SourceSansLight
ggo.Text = "Glitchy God"
ggo.TextColor3 = Color3.new(0, 0, 0)
ggo.TextScaled = true
ggo.TextSize = 14
ggo.TextWrapped = true

c.Name = "c"
c.Parent = yeet
c.BackgroundColor3 = Color3.new(1, 1, 1)
c.BackgroundTransparency = 0.40000000596046
c.Position = UDim2.new(0.515527964, 0, 0.518134713, 0)
c.Size = UDim2.new(0, 150, 0, 33)
c.Font = Enum.Font.SourceSansLight
c.Text = "Cum"
c.TextColor3 = Color3.new(0, 0, 0)
c.TextScaled = true
c.TextSize = 14
c.TextWrapped = true

---

gn.MouseButton1Down:connect(function()
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Spray" then
v:Destroy()
end
end
wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") and v.Name == "Spray" then
v:Destroy()
end
end

wait()

workspace.Handle.CanCollide = false
workspace.Handle.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame
wait(0.1)
workspace.Handle.Position = Vector3.new(187.619995, 0.690000057, 106.145004)
workspace.Handle.CanCollide = false

game.Players.LocalPlayer.Character:WaitForChild("Spray")

game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait(0.1)
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer
wait()
workspace.Handle.CanCollide = false
workspace.Handle.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame
wait(0.1)
workspace.Handle.Position = Vector3.new(187.619995, 0.690000057, 106.145004)
workspace.Handle.CanCollide = false

game.Players.LocalPlayer.Character:WaitForChild("Spray")

game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer
wait(0.1)
game.Players.LocalPlayer.Spray.Parent = game.Players.LocalPlayer.Backpack
game.Players.LocalPlayer.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Backpack.Spray.GripForward = Vector3.new(-1, -0.014, 0.011)
game.Players.LocalPlayer.Backpack.Spray.GripPos     = Vector3.new(-1.551, -0.989, -1.486)
game.Players.LocalPlayer.Backpack.Spray.GripRight   = Vector3.new(-0.011, 0.004, -1)
game.Players.LocalPlayer.Backpack.Spray.GripUp      = Vector3.new(-0.014, 1, 0.004)
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Backpack.Spray.GripForward = Vector3.new(-1, -0.014, 0.011)
game.Players.LocalPlayer.Backpack.Spray.GripPos     = Vector3.new(-1.551, -2.325, -1.486)
game.Players.LocalPlayer.Backpack.Spray.GripRight   = Vector3.new(-0.011, 0.004, -1)
game.Players.LocalPlayer.Backpack.Spray.GripUp      = Vector3.new(-0.014, 1, 0.004)
wait(0.1)

game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait(0.1)
AnimationId = "121572214"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play(0)
k:AdjustSpeed(1)
end)

---

r.MouseButton1Down:connect(function()
 box.Visible = true
end)

---

i.MouseButton1Down:connect(function()
Local = game:GetService('Players').LocalPlayer
Char  = Local.Character
touched,tpdback = false, false
Local.CharacterAdded:connect(function(char)
   if script.Disabled ~= true then
       wait(.25)
       loc = Char.HumanoidRootPart.Position
       Char:MoveTo(okk.Position + Vector3.new(0,.5,0))
   end
end)
game:GetService('UserInputService').InputBegan:connect(function(key)
   if key.KeyCode == Enum.KeyCode.Equals then
       if script.Disabled ~= true then
           script.Disabled = true
           print'you may re-execute'
       end
   end
end)
okk = Instance.new('Part',workspace)
okk.Anchored = true
okk.CanCollide = true
okk.Size = Vector3.new(10,1,10)
okk.Position = Vector3.new(0,10000,0)
okk.Touched:connect(function(part)
   if (part.Parent.Name == Local.Name) then
       if touched == false then
           touched = true
           function apply()
               if script.Disabled ~= true then
                   no = Char.HumanoidRootPart:Clone()
                   wait(.25)
                   Char.HumanoidRootPart:Destroy()
                   no.Parent = Char
                   Char:MoveTo(loc)
                   touched = false
               end end
           if Char then
               apply()
           end
       end
   end
end)
repeat wait() until Char
loc = Char.HumanoidRootPart.Position
Char:MoveTo(okk.Position + Vector3.new(0,.5,0))
end)

---

w.MouseButton1Down:connect(function()
 local savepos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savepos
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
for i = 1, 50 do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savepos
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
end
for _,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer.Backpack
end
end
wait()
---------------MAIN SCRIPT---------------
local LocalPlayer = game:GetService("Players").LocalPlayer
for index, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
if index == 1 then
tool.Grip = CFrame.new(-0.25, 0.256342292, 1.88046515, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 2 then
tool.Grip = CFrame.new(-0.25, -0.743657649, 1.88046503, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 3 then
tool.Grip = CFrame.new(-0.25, -1.74365747, 1.88046527, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 4 then
tool.Grip = CFrame.new(-1.24999988, -0.74365747, 1.88046491, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 5 then
tool.Grip = CFrame.new(-1.24999988, -1.74365735, 1.88046503, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 6 then
tool.Grip = CFrame.new(-1.24999988, -2.74365711, 1.88046503, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 7 then
tool.Grip = CFrame.new(-2.25, -1.74365711, 1.88046467, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 8 then
tool.Grip = CFrame.new(-2.25, -2.74365687, 1.88046467, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 9 then
tool.Grip = CFrame.new(-2.25, -3.74365616, 1.8804642, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 10 then
tool.Grip = CFrame.new(-0.249999925, 2.25634313, 1.88046384, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 11 then
tool.Grip = CFrame.new(-0.249999911, 3.25634241, 1.88046372, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 12 then
tool.Grip = CFrame.new(-0.249999881, 4.25634146, 1.8804636, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 13 then
tool.Grip = CFrame.new(-1.24999988, 3.25633979, 1.88046324, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 14 then
tool.Grip = CFrame.new(-1.24999988, 4.25633955, 1.88046312, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 15 then
tool.Grip = CFrame.new(-1.24999988, 5.2563386, 1.880463, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 16 then
tool.Grip = CFrame.new(-2.25, 4.25633383, 1.88046229, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 17 then
tool.Grip = CFrame.new(-2.25, 5.25633287, 1.88046217, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
elseif index == 18 then
tool.Grip = CFrame.new(-2.25, 6.25633192, 1.88046205, -4.2013224e-09, 1, -4.35090151e-08, 0.996938467, 7.5903932e-09, 0.0781891644, 0.078189142, -4.3047315e-08, -0.996938527)
end
if tool.Handle.Mesh then
tool.Handle.Mesh:Destroy()
end
if index <= 18 then
tool.Parent = LocalPlayer.Character
end
wait()
end
AnimationId = "313762630"
Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
k = LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end)

---

sh.MouseButton1Down:connect(function()
local foil=game.Players.LocalPlayer.Backpack.Foil
a=Instance.new("SelectionBox",foil.Handle)
a.Adornee=foil.Handle
foil.Handle.Size=Vector3.new(0.2,0.2,6)
foil.Equipped:connect(function()
while wait() do
game.Workspace[game.Players.LocalPlayer.Name].Foil.GripPos=Vector3.new(0,0,-3)
end
end)
box.Visible = false
end)

---

me.MouseButton1Down:connect(function()
local foil=game.Players.LocalPlayer.Backpack.Foil
a=Instance.new("SelectionBox",foil.Handle)
a.Adornee=foil.Handle
foil.Handle.Size=Vector3.new(0.2,0.2,10)
foil.Equipped:connect(function()
while wait() do
game.Workspace[game.Players.LocalPlayer.Name].Foil.GripPos=Vector3.new(0,0,-5)
end
end)
box.Visible = false
end)

---

bi.MouseButton1Down:connect(function()
local foil=game.Players.LocalPlayer.Backpack.Foil
a=Instance.new("SelectionBox",foil.Handle)
a.Adornee=foil.Handle
foil.Handle.Size=Vector3.new(0.2,0.2,40)
foil.Equipped:connect(function()
while wait() do
game.Workspace[game.Players.LocalPlayer.Name].Foil.GripPos=Vector3.new(0,0,-20)
end
end)
box.Visible = false
end)

---

g.MouseButton1Down:connect(function()
for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") and v.Name == "Spray" then
v:Destroy()
end
end
wait()
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
if v:IsA("Tool") and v.Name == "Spray" then
v:Destroy()
end
end

wait()

workspace.Handle.CanCollide = false
workspace.Handle.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame
wait(0.1)
workspace.Handle.Position = Vector3.new(187.619995, 0.690000057, 106.145004)
workspace.Handle.CanCollide = false

game.Players.LocalPlayer.Character:WaitForChild("Spray")

game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait(0.1)
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer
wait()
workspace.Handle.CanCollide = false
workspace.Handle.CFrame = game.Players.LocalPlayer.Character.Torso.CFrame
wait(0.1)
workspace.Handle.Position = Vector3.new(187.619995, 0.690000057, 106.145004)
workspace.Handle.CanCollide = false

game.Players.LocalPlayer.Character:WaitForChild("Spray")

game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer
wait(0.1)
game.Players.LocalPlayer.Spray.Parent = game.Players.LocalPlayer.Backpack
game.Players.LocalPlayer.Spray.Parent = game.Players.LocalPlayer.Backpack
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Backpack.Spray.GripForward = Vector3.new(-1, -0, 0.017) -- gun handle
game.Players.LocalPlayer.Backpack.Spray.GripPos = Vector3.new(0.135, -0.25, -0.134)
game.Players.LocalPlayer.Backpack.Spray.GripRight = Vector3.new(-0.017, -0, -1)
game.Players.LocalPlayer.Backpack.Spray.GripUp = Vector3.new(-0, 1, -0) -- gun handle
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait(0.1)
game.Players.LocalPlayer.Backpack.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Backpack.Spray.GripForward = Vector3.new(-0.013, 1, 0.017) -- gun barrel
game.Players.LocalPlayer.Backpack.Spray.GripPos = Vector3.new(-0.702, -0.791, -0.134)
game.Players.LocalPlayer.Backpack.Spray.GripRight = Vector3.new(-0, 0.017, -1)
game.Players.LocalPlayer.Backpack.Spray.GripUp = Vector3.new(1, 0.013, -0) -- gun barrel
wait(0.1)

game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
end)

---

pgo.MouseButton1Down:connect(function()
button              = workspace.Button
button.CanCollide   = false
button.Transparency = 1

game:GetService("RunService").Heartbeat:connect(function(step)
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character.Head.Position)
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(1,5))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Right Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character.Torso.Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Arm"].Position)
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
wait()
button.Size=Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame=CFrame.new(game.Players.LocalPlayer.Character["Left Leg"].Position)
wait()
button.Size   = Vector3.new(math.random(0,0), math.random(0,0), math.random(0,0))
button.CFrame = CFrame.new(game.Players.LocalPlayer.Character["Right Leg"].Position)
end)
end)

---

ggo.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
wait()
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
wait()
end)

---

c.MouseButton1Down:connect(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(188,3.5,106)
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,0)
wait()
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
wait()
for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
end
wait()
for _,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer.Backpack
end
end
wait()
for i,v in pairs(game:GetService'Players'.LocalPlayer.Backpack:GetChildren())do
game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
end
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.026, 0.013, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-1.735, -1.963, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(0.061, -0.998, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(0.998, 0.061, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(-0.011, 0.026, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(0.796, -1.18, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(1, -0.021, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(0.021, 0.999, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(-0.011, 0.026, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(0.796, 0.067, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(1, -0.021, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(0.021, 0.999, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(-0.026, -0.011, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-0.387, 1.546, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(0.026, 1, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.999, 0.021, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(-0.026, -0.011, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-0.387, 3.499, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(0.021, 1, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.999, 0.021, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.011, -0.026, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-2.758, 0.163, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-1, 0.021, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.021, -0.999, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.011, -0.026, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-4.08, 0.163, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-1, 0.021, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.021, -0.999, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.011, -0.026, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-5.558, 0.163, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-1, 0.021, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.021, -0.999, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.027, -0.009, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-4.298, -4.594, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-0.663, -0.749, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(0.748, -0.663, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(-0.009, -0.027, -1) -- 1st L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-5.295, 4.808, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-0.749, 0.663, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.663, -0.748, 0.026) -- 1st L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character.Spray.GripForward = Vector3.new(0.011, -0.026, -1) -- 2nd L part
game.Players.LocalPlayer.Character.Spray.GripPos = Vector3.new(-7.708, 0.12, 4.86)
game.Players.LocalPlayer.Character.Spray.GripRight = Vector3.new(-1, 0.019, -0.011)
game.Players.LocalPlayer.Character.Spray.GripUp = Vector3.new(-0.02, -0.999, 0.026) -- 2nd L part
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
game.Players.LocalPlayer.Backpack.Spray.Parent = game.Players.LocalPlayer.Character
wait()
game.Players.LocalPlayer.Character.Spray.Parent = game.Players.LocalPlayer.Backpack
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
v.Parent = game.Players.LocalPlayer.Character
end
end
wait()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
v.Parent = game.Players.LocalPlayer.Character
end
end
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3.5,40)
end)

---


]]