--[[
 __          __  _                               _                        _          __      __  _____  
 \ \        / / | |                             (_)                      ( )         \ \    / / |  __ \  
  \ \  /\  / /  | |__     ___     ___     __ _   _  __   __   ___   ___  |/   ___     \ \  / /  | |__) |
   \ \/  \/ /   | '_ \   / _ \   / _ \   / _` | | | \ \ / /  / _ \ / __|     / __|     \ \/ /   |  _  / 
    \  /\  /    | | | | | (_) | | (_) | | (_| | | |  \ V /  |  __/ \__ \     \__ \      \  /    | | \ \ 
     \/  \/     |_| |_|  \___/   \___/   \__, | |_|   \_/    \___| |___/     |___/       \/     |_|  \_\
                                          __/ |                                                         
                                         |___/   
  !! Some parts are from Skeds VR !!    
  !! The V3rm post on how to use it: https://v3rmillion.net/showthread.php?tid=1114886
  
--]]

local options = {}

-- Options:
options.NetBypassOption = 1								-- [1] Stable, [2] Stable

options.VRChat = true                                   -- Set this to true if you want to chat in VR (Make sure the CoreGui is showing)
options.headscale = 3                                   -- How big you are in VR, This does not make your character any bigger (3 is recommended)
options.forcebubblechat = true                          -- Force bubblechat so you can see people chatting
options.BetterType = true								-- Makes you big when you open on chat gui

options.HandsRotationOffset = Vector3.new(90,0,0)       -- Rotation offset (90 is recommended) 
options.HandTransparency = 0.4                          -- Transparency for your VR hands, Dont worry this is client sided (0.4 is recommended)
options.HideAllHats = true                              -- Set this to true if you want your hats to not get in the way, (This is client sided)
options.BlockCharacter = false							-- Makes your character look like a roblox studio dummy (Fun)

options.BadCoputer = false								-- Set this to true if you have a bad/low-end computer
options.ShowVRControllerOutline = true					-- Shows a outline of where your VR controllers are
options.ConOutlineColor = Color3.fromRGB(13, 105, 172)  --Outline colour of where your VR controllers are
--

-- Main:
local cam = workspace.CurrentCamera
local R1down = false
local VR = game:GetService("VRService")
local runservice = game:service("RunService")
local input = game:GetService("UserInputService")
local keysPressed = input:GetKeysPressed()
local PlayerReset = false
local plr = game:GetService("Players").LocalPlayer
local character = plr["Character"]
local removeuseless = game:GetService("Debris")
local Blur = Instance.new("BlurEffect",game.Lighting)
Blur.Size = 0
-- Net:
local function AlignParts(Part1,Part0,CFrameOffset)
	local AlignPos = Instance.new('AlignPosition', Part1);
	AlignPos.Parent.CanCollide = false;
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1);
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 67752;
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1);
	local AttachmentB=Instance.new('Attachment',Part0);
	AttachmentB.CFrame = AttachmentB.CFrame * CFrameOffset
	AlignPos.Attachment0 = AttachmentA;
	AlignPos.Attachment1 = AttachmentB;
	AlignOri.Attachment0 = AttachmentA;
	AlignOri.Attachment1 = AttachmentB;
end

local hum = character.Humanoid 
local LeftArm=character["Left Arm"]
local LeftLeg=character["Left Leg"]
local RightArm=character["Right Arm"]
local RightLeg=character["Right Leg"]
local Root=character["HumanoidRootPart"]
local Head=character["Head"]
local Torso=character["Torso"]

local function LoadNet() -- You can remove the script belown and the options.NetBypassOption but keep the function

	if not game:IsLoaded() then game.Loaded:Wait() end -- Wait for game

	if options.NetBypassOption == 2 then
		for i,v in pairs(character:GetDescendants()) do
			if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then 
				game:GetService("RunService").Heartbeat:connect(function()
					v.Velocity = Vector3.new(-30,0,0)
				end)
			end
		end
		character["Torso"].Transparency = 0.8
		character["Head"].Transparency = 1
	end
	if options.NetBypassOption == 1 then
		character["Torso"].Transparency = 0.8
		character["Head"].Transparency = 1
		settings().Physics.AllowSleep = false
		settings().Physics.DisableCSGv2 = true
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenGamerTips/Roblox-Scripts/main/NetworkScripts/ownership.lua"))()
	end
end
--

-- Check status of script:
if not _G.DidVR == true then -- If the value is nil
	_G.DidVR = false
end
if _G.DidVR == true then -- If the script is running already
	game:GetService("Players").LocalPlayer.MaximumSimulationRadius = 9e9
end
--
local function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end
local function createpart(size, name) -- Part create function
	local Part = Instance.new("Part", workspace)
	Part.CFrame = character.HumanoidRootPart.CFrame
	Part.Size = size
	Part.Transparency = 1
	Part.CanCollide = false
	Part.Anchored = true
	Part.Name = name
	return Part
end
local moveHandL = createpart(LeftArm.Size, "moveRH")
local moveHandR = createpart(RightArm.Size, "moveLH")
local moveHead = createpart(Torso.Size, "moveH")

input.UserCFrameChanged:connect(function(Input,Move) --If the user input has changed
	if Input == Enum.UserCFrame.Head then
		moveHead.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move - Vector3.new(0,2,0))
	elseif Input == Enum.UserCFrame.LeftHand then
		moveHandL.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move*CFrame.Angles(math.rad(options.righthandrotoffset.X),math.rad(options.righthandrotoffset.Y),math.rad(options.righthandrotoffset.Z)))
	elseif Input == Enum.UserCFrame.RightHand then
		moveHandR.CFrame = cam.CFrame*(CFrame.new(Move.p*(cam.HeadScale-1))*Move*CFrame.Angles(math.rad(options.righthandrotoffset.X),math.rad(options.righthandrotoffset.Y),math.rad(options.righthandrotoffset.Z)))
	end
end)

-- Chat Part:
local function LoadKeybord()
	if options.VRChat == true then
		local VRchat = Instance.new("ScreenGui")
		local Keyboard = Instance.new("Frame")
		local Q = Instance.new("TextButton")
		local W = Instance.new("TextButton")
		local E = Instance.new("TextButton")
		local R = Instance.new("TextButton")
		local T = Instance.new("TextButton")
		local Y = Instance.new("TextButton")
		local U = Instance.new("TextButton")
		local I = Instance.new("TextButton")
		local O = Instance.new("TextButton")
		local P = Instance.new("TextButton")
		local F = Instance.new("TextButton")
		local D = Instance.new("TextButton")
		local G = Instance.new("TextButton")
		local L = Instance.new("TextButton")
		local H = Instance.new("TextButton")
		local S = Instance.new("TextButton")
		local A = Instance.new("TextButton")
		local J = Instance.new("TextButton")
		local K = Instance.new("TextButton")
		local X = Instance.new("TextButton")
		local Z = Instance.new("TextButton")
		local M = Instance.new("TextButton")
		local N = Instance.new("TextButton")
		local B = Instance.new("TextButton")
		local V = Instance.new("TextButton")
		local C = Instance.new("TextButton")
		local TypeTextBox = Instance.new("TextLabel")
		local UICorner = Instance.new("UICorner")
		local WhoosVR = Instance.new("TextButton")
		local UICorner_2 = Instance.new("UICorner")
		local ENTER = Instance.new("TextButton")
		local UICorner_3 = Instance.new("UICorner")
		local SpaceBar = Instance.new("TextButton")
		local UICorner_4 = Instance.new("UICorner")
		local Backspace = Instance.new("TextButton")
		local UICorner_5 = Instance.new("UICorner")
		local Wordlist = Instance.new("TextButton")
		local UICorner_6 = Instance.new("UICorner")
		local PredoneWords = Instance.new("Frame")
		local Hello = Instance.new("TextButton")
		local UICorner_7 = Instance.new("UICorner")
		local BackHome = Instance.new("TextButton")
		local UICorner_8 = Instance.new("UICorner")
		local Sup = Instance.new("TextButton")
		local UICorner_9 = Instance.new("UICorner")
		local Hi = Instance.new("TextButton")
		local UICorner_10 = Instance.new("UICorner")
		local Thanks = Instance.new("TextButton")
		local UICorner_11 = Instance.new("UICorner")
		local Omg = Instance.new("TextButton")
		local UICorner_12 = Instance.new("UICorner")
		local Lol = Instance.new("TextButton")
		local UICorner_13 = Instance.new("UICorner")
		local You = Instance.new("TextButton")
		local UICorner_14 = Instance.new("UICorner")
		local Him = Instance.new("TextButton")
		local UICorner_15 = Instance.new("UICorner")
		local Her = Instance.new("TextButton")
		local UICorner_16 = Instance.new("UICorner")
		local And = Instance.new("TextButton")
		local UICorner_17 = Instance.new("UICorner")
		local Yes = Instance.new("TextButton")
		local UICorner_18 = Instance.new("UICorner")
		local No = Instance.new("TextButton")
		local UICorner_19 = Instance.new("UICorner")
		local Stop = Instance.new("TextButton")
		local UICorner_20 = Instance.new("UICorner")
		local Start = Instance.new("TextButton")
		local UICorner_21 = Instance.new("UICorner")
		local What = Instance.new("TextButton")
		local UICorner_22 = Instance.new("UICorner")
		local Sad = Instance.new("TextButton")
		local UICorner_23 = Instance.new("UICorner")
		local Happy = Instance.new("TextButton")
		local UICorner_24 = Instance.new("UICorner")
		local Suprise = Instance.new("TextButton")
		local UICorner_25 = Instance.new("UICorner")
		local Wut = Instance.new("TextButton")
		local UICorner_26 = Instance.new("UICorner")
		local Its = Instance.new("TextButton")
		local UICorner_27 = Instance.new("UICorner")
		local Me = Instance.new("TextButton")
		local UICorner_28 = Instance.new("UICorner")

		--Properties:

		VRchat.Name = "VR chat"
		VRchat.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		VRchat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		Keyboard.Name = "Keyboard"
		Keyboard.Parent = VRchat
		Keyboard.BackgroundColor3 = Color3.fromRGB(109, 109, 109)
		Keyboard.BackgroundTransparency = 0.300
		Keyboard.Position = UDim2.new(-0.00080871582, 0, -0.00193678541, 0)
		Keyboard.Size = UDim2.new(1, 0, 1, 0)

		Q.Name = "Q"
		Q.Parent = Keyboard
		Q.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Q.Position = UDim2.new(0.0117462156, 0, 0.252441317, 0)
		Q.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		Q.Font = Enum.Font.SourceSans
		Q.Text = "Q"
		Q.TextColor3 = Color3.fromRGB(0, 0, 0)
		Q.TextScaled = true
		Q.TextSize = 25.000
		Q.TextWrapped = true

		W.Name = "W"
		W.Parent = Keyboard
		W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		W.Position = UDim2.new(0.111448169, 0, 0.252441317, 0)
		W.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		W.Font = Enum.Font.SourceSans
		W.Text = "W"
		W.TextColor3 = Color3.fromRGB(0, 0, 0)
		W.TextScaled = true
		W.TextSize = 25.000
		W.TextWrapped = true

		E.Name = "E"
		E.Parent = Keyboard
		E.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		E.Position = UDim2.new(0.212396309, 0, 0.252441317, 0)
		E.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		E.Font = Enum.Font.SourceSans
		E.Text = "E"
		E.TextColor3 = Color3.fromRGB(0, 0, 0)
		E.TextScaled = true
		E.TextSize = 25.000
		E.TextWrapped = true

		R.Name = "R"
		R.Parent = Keyboard
		R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		R.Position = UDim2.new(0.307621926, 0, 0.252441317, 0)
		R.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		R.Font = Enum.Font.SourceSans
		R.Text = "R"
		R.TextColor3 = Color3.fromRGB(0, 0, 0)
		R.TextScaled = true
		R.TextSize = 25.000
		R.TextWrapped = true

		T.Name = "T"
		T.Parent = Keyboard
		T.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		T.Position = UDim2.new(0.408570051, 0, 0.252441317, 0)
		T.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		T.Font = Enum.Font.SourceSans
		T.Text = "T"
		T.TextColor3 = Color3.fromRGB(0, 0, 0)
		T.TextScaled = true
		T.TextSize = 25.000
		T.TextWrapped = true

		Y.Name = "Y"
		Y.Parent = Keyboard
		Y.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Y.Position = UDim2.new(0.508271873, 0, 0.252441317, 0)
		Y.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		Y.Font = Enum.Font.SourceSans
		Y.Text = "Y"
		Y.TextColor3 = Color3.fromRGB(0, 0, 0)
		Y.TextScaled = true
		Y.TextSize = 25.000
		Y.TextWrapped = true

		U.Name = "U"
		U.Parent = Keyboard
		U.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		U.Position = UDim2.new(0.607973874, 0, 0.252441317, 0)
		U.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		U.Font = Enum.Font.SourceSans
		U.Text = "U"
		U.TextColor3 = Color3.fromRGB(0, 0, 0)
		U.TextScaled = true
		U.TextSize = 25.000
		U.TextWrapped = true

		I.Name = "I"
		I.Parent = Keyboard
		I.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		I.Position = UDim2.new(0.706081927, 0, 0.252441317, 0)
		I.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		I.Font = Enum.Font.SourceSans
		I.Text = "I"
		I.TextColor3 = Color3.fromRGB(0, 0, 0)
		I.TextScaled = true
		I.TextSize = 25.000
		I.TextWrapped = true

		O.Name = "O"
		O.Parent = Keyboard
		O.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		O.Position = UDim2.new(0.803423941, 0, 0.252441317, 0)
		O.Size = UDim2.new(0.0859585702, 0, 0.158975735, 0)
		O.Font = Enum.Font.SourceSans
		O.Text = "O"
		O.TextColor3 = Color3.fromRGB(0, 0, 0)
		O.TextScaled = true
		O.TextSize = 25.000
		O.TextWrapped = true

		P.Name = "P"
		P.Parent = Keyboard
		P.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		P.Position = UDim2.new(0.898479164, 0, 0.252441317, 0)
		P.Size = UDim2.new(0.0880587846, 0, 0.158975735, 0)
		P.Font = Enum.Font.SourceSans
		P.Text = "P"
		P.TextColor3 = Color3.fromRGB(0, 0, 0)
		P.TextScaled = true
		P.TextSize = 25.000
		P.TextWrapped = true

		F.Name = "F"
		F.Parent = Keyboard
		F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		F.Position = UDim2.new(0.300759614, 0, 0.436759293, 0)
		F.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		F.Font = Enum.Font.SourceSans
		F.Text = "F"
		F.TextColor3 = Color3.fromRGB(0, 0, 0)
		F.TextScaled = true
		F.TextSize = 25.000
		F.TextWrapped = true

		D.Name = "D"
		D.Parent = Keyboard
		D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		D.Position = UDim2.new(0.206816316, 0, 0.436759293, 0)
		D.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		D.Font = Enum.Font.SourceSans
		D.Text = "D"
		D.TextColor3 = Color3.fromRGB(0, 0, 0)
		D.TextScaled = true
		D.TextSize = 25.000
		D.TextWrapped = true

		G.Name = "G"
		G.Parent = Keyboard
		G.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		G.Position = UDim2.new(0.400043011, 0, 0.436759293, 0)
		G.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		G.Font = Enum.Font.SourceSans
		G.Text = "G"
		G.TextColor3 = Color3.fromRGB(0, 0, 0)
		G.TextScaled = true
		G.TextSize = 25.000
		G.TextWrapped = true

		L.Name = "L"
		L.Parent = Keyboard
		L.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		L.Position = UDim2.new(0.788203597, 0, 0.436759293, 0)
		L.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		L.Font = Enum.Font.SourceSans
		L.Text = "L"
		L.TextColor3 = Color3.fromRGB(0, 0, 0)
		L.TextScaled = true
		L.TextSize = 25.000
		L.TextWrapped = true

		H.Name = "H"
		H.Parent = Keyboard
		H.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		H.Position = UDim2.new(0.498100758, 0, 0.436759293, 0)
		H.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		H.Font = Enum.Font.SourceSans
		H.Text = "H"
		H.TextColor3 = Color3.fromRGB(0, 0, 0)
		H.TextScaled = true
		H.TextSize = 25.000
		H.TextWrapped = true

		S.Name = "S"
		S.Parent = Keyboard
		S.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		S.Position = UDim2.new(0.107532814, 0, 0.436759293, 0)
		S.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		S.Font = Enum.Font.SourceSans
		S.Text = "S"
		S.TextColor3 = Color3.fromRGB(0, 0, 0)
		S.TextScaled = true
		S.TextSize = 25.000
		S.TextWrapped = true

		A.Name = "A"
		A.Parent = Keyboard
		A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		A.Position = UDim2.new(0.00947504677, 0, 0.436759293, 0)
		A.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		A.Font = Enum.Font.SourceSans
		A.Text = "A"
		A.TextColor3 = Color3.fromRGB(0, 0, 0)
		A.TextScaled = true
		A.TextSize = 25.000
		A.TextWrapped = true

		J.Name = "J"
		J.Parent = Keyboard
		J.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		J.Position = UDim2.new(0.596158445, 0, 0.436759293, 0)
		J.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		J.Font = Enum.Font.SourceSans
		J.Text = "J"
		J.TextColor3 = Color3.fromRGB(0, 0, 0)
		J.TextScaled = true
		J.TextSize = 25.000
		J.TextWrapped = true

		K.Name = "K"
		K.Parent = Keyboard
		K.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		K.Position = UDim2.new(0.692648768, 0, 0.436759293, 0)
		K.Size = UDim2.new(0.0845410228, 0, 0.158975735, 0)
		K.Font = Enum.Font.SourceSans
		K.Text = "K"
		K.TextColor3 = Color3.fromRGB(0, 0, 0)
		K.TextScaled = true
		K.TextSize = 25.000
		K.TextWrapped = true

		X.Name = "X"
		X.Parent = Keyboard
		X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		X.Position = UDim2.new(0.153487474, 0, 0.615810692, 0)
		X.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		X.Font = Enum.Font.SourceSans
		X.Text = "X"
		X.TextColor3 = Color3.fromRGB(0, 0, 0)
		X.TextScaled = true
		X.TextSize = 25.000
		X.TextWrapped = true

		Z.Name = "Z"
		Z.Parent = Keyboard
		Z.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Z.Position = UDim2.new(0.0333947465, 0, 0.615810692, 0)
		Z.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		Z.Font = Enum.Font.SourceSans
		Z.Text = "Z"
		Z.TextColor3 = Color3.fromRGB(0, 0, 0)
		Z.TextScaled = true
		Z.TextSize = 25.000
		Z.TextWrapped = true

		M.Name = "M"
		M.Parent = Keyboard
		M.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		M.Position = UDim2.new(0.765749037, 0, 0.615810692, 0)
		M.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		M.Font = Enum.Font.SourceSans
		M.Text = "M"
		M.TextColor3 = Color3.fromRGB(0, 0, 0)
		M.TextScaled = true
		M.TextSize = 25.000
		M.TextWrapped = true

		N.Name = "N"
		N.Parent = Keyboard
		N.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		N.Position = UDim2.new(0.642091811, 0, 0.615810692, 0)
		N.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		N.Font = Enum.Font.SourceSans
		N.Text = "N"
		N.TextColor3 = Color3.fromRGB(0, 0, 0)
		N.TextScaled = true
		N.TextSize = 25.000
		N.TextWrapped = true

		B.Name = "B"
		B.Parent = Keyboard
		B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		B.Position = UDim2.new(0.520311058, 0, 0.615810692, 0)
		B.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		B.Font = Enum.Font.SourceSans
		B.Text = "B"
		B.TextColor3 = Color3.fromRGB(0, 0, 0)
		B.TextScaled = true
		B.TextSize = 25.000
		B.TextWrapped = true

		V.Name = "V"
		V.Parent = Keyboard
		V.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		V.Position = UDim2.new(0.398611486, 0, 0.615810692, 0)
		V.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		V.Font = Enum.Font.SourceSans
		V.Text = "V"
		V.TextColor3 = Color3.fromRGB(0, 0, 0)
		V.TextScaled = true
		V.TextSize = 25.000
		V.TextWrapped = true

		C.Name = "C"
		C.Parent = Keyboard
		C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		C.Position = UDim2.new(0.282874316, 0, 0.615810692, 0)
		C.Size = UDim2.new(0.102191411, 0, 0.162968799, 0)
		C.Font = Enum.Font.SourceSans
		C.Text = "C"
		C.TextColor3 = Color3.fromRGB(0, 0, 0)
		C.TextScaled = true
		C.TextSize = 25.000
		C.TextWrapped = true

		TypeTextBox.Name = "TypeTextBox"
		TypeTextBox.Parent = Keyboard
		TypeTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TypeTextBox.Position = UDim2.new(0.0448157042, 0, 0.0517003872, 0)
		TypeTextBox.Size = UDim2.new(0.910251737, 0, 0.157194391, 0)
		TypeTextBox.Font = Enum.Font.SourceSans
		TypeTextBox.Text = ""
		TypeTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
		TypeTextBox.TextScaled = true
		TypeTextBox.TextSize = 14.000
		TypeTextBox.TextWrapped = true

		UICorner.Parent = TypeTextBox

		WhoosVR.Name = "WhoosVR"
		WhoosVR.Parent = Keyboard
		WhoosVR.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		WhoosVR.Position = UDim2.new(0.520310998, 0, 0.912941813, 0)
		WhoosVR.Size = UDim2.new(0.339041591, 0, 0.0640936419, 0)
		WhoosVR.Font = Enum.Font.SourceSans
		WhoosVR.Text = "Whoogives's VR"
		WhoosVR.TextColor3 = Color3.fromRGB(0, 0, 0)
		WhoosVR.TextScaled = true
		WhoosVR.TextSize = 25.000
		WhoosVR.TextWrapped = true

		UICorner_2.Parent = WhoosVR

		ENTER.Name = "ENTER"
		ENTER.Parent = Keyboard
		ENTER.BackgroundColor3 = Color3.fromRGB(97, 255, 163)
		ENTER.Position = UDim2.new(0.887289643, 0, 0.683890104, 0)
		ENTER.Size = UDim2.new(0.108888887, 0, 0.211250007, 0)
		ENTER.Font = Enum.Font.SourceSans
		ENTER.Text = "ENTER"
		ENTER.TextColor3 = Color3.fromRGB(0, 0, 0)
		ENTER.TextScaled = true
		ENTER.TextSize = 14.000
		ENTER.TextWrapped = true

		UICorner_3.Parent = ENTER

		SpaceBar.Name = "SpaceBar"
		SpaceBar.Parent = Keyboard
		SpaceBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SpaceBar.Position = UDim2.new(0.057130333, 0, 0.793944001, 0)
		SpaceBar.Size = UDim2.new(0.802222252, 0, 0.10125, 0)
		SpaceBar.Font = Enum.Font.SourceSans
		SpaceBar.Text = "Space"
		SpaceBar.TextColor3 = Color3.fromRGB(0, 0, 0)
		SpaceBar.TextScaled = true
		SpaceBar.TextSize = 14.000
		SpaceBar.TextWrapped = true

		UICorner_4.Parent = SpaceBar

		Backspace.Name = "Backspace"
		Backspace.Parent = Keyboard
		Backspace.BackgroundColor3 = Color3.fromRGB(255, 160, 162)
		Backspace.Position = UDim2.new(0.890622973, 0, 0.427806616, 0)
		Backspace.Size = UDim2.new(0.109376945, 0, 0.236188814, 0)
		Backspace.Font = Enum.Font.SourceSans
		Backspace.Text = "<--"
		Backspace.TextColor3 = Color3.fromRGB(0, 0, 0)
		Backspace.TextScaled = true
		Backspace.TextSize = 25.000
		Backspace.TextWrapped = true

		UICorner_5.Parent = Backspace

		Wordlist.Name = "Wordlist"
		Wordlist.Parent = Keyboard
		Wordlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Wordlist.Position = UDim2.new(0.0571303293, 0, 0.912941813, 0)
		Wordlist.Size = UDim2.new(0.351439774, 0, 0.0640936419, 0)
		Wordlist.Font = Enum.Font.SourceSans
		Wordlist.Text = "Predone words"
		Wordlist.TextColor3 = Color3.fromRGB(0, 0, 0)
		Wordlist.TextScaled = true
		Wordlist.TextSize = 25.000
		Wordlist.TextWrapped = true

		UICorner_6.Parent = Wordlist

		PredoneWords.Name = "PredoneWords"
		PredoneWords.Parent = VRchat
		PredoneWords.BackgroundColor3 = Color3.fromRGB(109, 109, 109)
		PredoneWords.BackgroundTransparency = 0.300
		PredoneWords.Position = UDim2.new(-0.00080871582, 0, -0.00193678541, 0)
		PredoneWords.Size = UDim2.new(1, 0, 1, 0)
		PredoneWords.Visible = false

		Hello.Name = "Hello"
		Hello.Parent = PredoneWords
		Hello.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hello.Position = UDim2.new(0.0423965231, 0, 0.0486875065, 0)
		Hello.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Hello.Font = Enum.Font.SourceSans
		Hello.Text = "Hello!"
		Hello.TextColor3 = Color3.fromRGB(0, 0, 0)
		Hello.TextScaled = true
		Hello.TextSize = 25.000
		Hello.TextWrapped = true

		UICorner_7.Parent = Hello

		BackHome.Name = "BackHome"
		BackHome.Parent = PredoneWords
		BackHome.BackgroundColor3 = Color3.fromRGB(255, 138, 140)
		BackHome.Position = UDim2.new(0.236331716, 0, 0.918789923, 0)
		BackHome.Size = UDim2.new(0.522150397, 0, 0.0720085353, 0)
		BackHome.Font = Enum.Font.SourceSans
		BackHome.Text = "Back"
		BackHome.TextColor3 = Color3.fromRGB(255, 255, 255)
		BackHome.TextScaled = true
		BackHome.TextSize = 25.000
		BackHome.TextWrapped = true

		UICorner_8.Parent = BackHome

		Sup.Name = "Sup"
		Sup.Parent = PredoneWords
		Sup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sup.Position = UDim2.new(0.359584004, 0, 0.0486875065, 0)
		Sup.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Sup.Font = Enum.Font.SourceSans
		Sup.Text = "Sup"
		Sup.TextColor3 = Color3.fromRGB(0, 0, 0)
		Sup.TextScaled = true
		Sup.TextSize = 25.000
		Sup.TextWrapped = true

		UICorner_9.Parent = Sup

		Hi.Name = "Hi"
		Hi.Parent = PredoneWords
		Hi.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Hi.Position = UDim2.new(0.686146557, 0, 0.0468976386, 0)
		Hi.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Hi.Font = Enum.Font.SourceSans
		Hi.Text = "Hi"
		Hi.TextColor3 = Color3.fromRGB(0, 0, 0)
		Hi.TextScaled = true
		Hi.TextSize = 25.000
		Hi.TextWrapped = true

		UICorner_10.Parent = Hi

		Thanks.Name = "Thanks"
		Thanks.Parent = PredoneWords
		Thanks.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Thanks.Position = UDim2.new(0.0423965082, 0, 0.166818872, 0)
		Thanks.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Thanks.Font = Enum.Font.SourceSans
		Thanks.Text = "Thank you!"
		Thanks.TextColor3 = Color3.fromRGB(0, 0, 0)
		Thanks.TextScaled = true
		Thanks.TextSize = 25.000
		Thanks.TextWrapped = true

		UICorner_11.Parent = Thanks

		Omg.Name = "Omg"
		Omg.Parent = PredoneWords
		Omg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Omg.Position = UDim2.new(0.359584004, 0, 0.166818872, 0)
		Omg.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Omg.Font = Enum.Font.SourceSans
		Omg.Text = "Omg"
		Omg.TextColor3 = Color3.fromRGB(0, 0, 0)
		Omg.TextScaled = true
		Omg.TextSize = 25.000
		Omg.TextWrapped = true

		UICorner_12.Parent = Omg

		Lol.Name = "Lol"
		Lol.Parent = PredoneWords
		Lol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Lol.Position = UDim2.new(0.686146557, 0, 0.166818872, 0)
		Lol.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Lol.Font = Enum.Font.SourceSans
		Lol.Text = "Lol"
		Lol.TextColor3 = Color3.fromRGB(0, 0, 0)
		Lol.TextScaled = true
		Lol.TextSize = 25.000
		Lol.TextWrapped = true

		UICorner_13.Parent = Lol

		You.Name = "You"
		You.Parent = PredoneWords
		You.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		You.Position = UDim2.new(0.0408340096, 0, 0.29031983, 0)
		You.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		You.Font = Enum.Font.SourceSans
		You.Text = "You"
		You.TextColor3 = Color3.fromRGB(0, 0, 0)
		You.TextScaled = true
		You.TextSize = 25.000
		You.TextWrapped = true

		UICorner_14.Parent = You

		Him.Name = "Him"
		Him.Parent = PredoneWords
		Him.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Him.Position = UDim2.new(0.359584004, 0, 0.29031983, 0)
		Him.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Him.Font = Enum.Font.SourceSans
		Him.Text = "Him"
		Him.TextColor3 = Color3.fromRGB(0, 0, 0)
		Him.TextScaled = true
		Him.TextSize = 25.000
		Him.TextWrapped = true

		UICorner_15.Parent = Him

		Her.Name = "Her"
		Her.Parent = PredoneWords
		Her.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Her.Position = UDim2.new(0.686146557, 0, 0.29031983, 0)
		Her.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Her.Font = Enum.Font.SourceSans
		Her.Text = "Her"
		Her.TextColor3 = Color3.fromRGB(0, 0, 0)
		Her.TextScaled = true
		Her.TextSize = 25.000
		Her.TextWrapped = true

		UICorner_16.Parent = Her

		And.Name = "And"
		And.Parent = PredoneWords
		And.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		And.Position = UDim2.new(0.0408340096, 0, 0.412030935, 0)
		And.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		And.Font = Enum.Font.SourceSans
		And.Text = "And"
		And.TextColor3 = Color3.fromRGB(0, 0, 0)
		And.TextScaled = true
		And.TextSize = 25.000
		And.TextWrapped = true

		UICorner_17.Parent = And

		Yes.Name = "Yes"
		Yes.Parent = PredoneWords
		Yes.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Yes.Position = UDim2.new(0.358021468, 0, 0.800339937, 0)
		Yes.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Yes.Font = Enum.Font.SourceSans
		Yes.Text = "Yes"
		Yes.TextColor3 = Color3.fromRGB(0, 0, 0)
		Yes.TextScaled = true
		Yes.TextSize = 25.000
		Yes.TextWrapped = true

		UICorner_18.Parent = Yes

		No.Name = "No"
		No.Parent = PredoneWords
		No.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		No.Position = UDim2.new(0.684584081, 0, 0.800339937, 0)
		No.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		No.Font = Enum.Font.SourceSans
		No.Text = "No"
		No.TextColor3 = Color3.fromRGB(0, 0, 0)
		No.TextScaled = true
		No.TextSize = 25.000
		No.TextWrapped = true

		UICorner_19.Parent = No

		Stop.Name = "Stop"
		Stop.Parent = PredoneWords
		Stop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Stop.Position = UDim2.new(0.0408339724, 0, 0.544481277, 0)
		Stop.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Stop.Font = Enum.Font.SourceSans
		Stop.Text = "Stop"
		Stop.TextColor3 = Color3.fromRGB(0, 0, 0)
		Stop.TextScaled = true
		Stop.TextSize = 25.000
		Stop.TextWrapped = true

		UICorner_20.Parent = Stop

		Start.Name = "Start"
		Start.Parent = PredoneWords
		Start.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Start.Position = UDim2.new(0.359584004, 0, 0.544481277, 0)
		Start.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Start.Font = Enum.Font.SourceSans
		Start.Text = "Start"
		Start.TextColor3 = Color3.fromRGB(0, 0, 0)
		Start.TextScaled = true
		Start.TextSize = 25.000
		Start.TextWrapped = true

		UICorner_21.Parent = Start

		What.Name = "What"
		What.Parent = PredoneWords
		What.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		What.Position = UDim2.new(0.686146557, 0, 0.544481277, 0)
		What.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		What.Font = Enum.Font.SourceSans
		What.Text = "What?"
		What.TextColor3 = Color3.fromRGB(0, 0, 0)
		What.TextScaled = true
		What.TextSize = 25.000
		What.TextWrapped = true

		UICorner_22.Parent = What

		Sad.Name = "Sad"
		Sad.Parent = PredoneWords
		Sad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sad.Position = UDim2.new(0.0392714739, 0, 0.6769315, 0)
		Sad.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Sad.Font = Enum.Font.SourceSans
		Sad.Text = ":C"
		Sad.TextColor3 = Color3.fromRGB(0, 0, 0)
		Sad.TextScaled = true
		Sad.TextSize = 25.000
		Sad.TextWrapped = true

		UICorner_23.Parent = Sad

		Happy.Name = "Happy"
		Happy.Parent = PredoneWords
		Happy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Happy.Position = UDim2.new(0.359584004, 0, 0.6769315, 0)
		Happy.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Happy.Font = Enum.Font.SourceSans
		Happy.Text = ":D"
		Happy.TextColor3 = Color3.fromRGB(0, 0, 0)
		Happy.TextScaled = true
		Happy.TextSize = 25.000
		Happy.TextWrapped = true

		UICorner_24.Parent = Happy

		Suprise.Name = "Suprise"
		Suprise.Parent = PredoneWords
		Suprise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Suprise.Position = UDim2.new(0.686146557, 0, 0.6769315, 0)
		Suprise.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Suprise.Font = Enum.Font.SourceSans
		Suprise.Text = ":O"
		Suprise.TextColor3 = Color3.fromRGB(0, 0, 0)
		Suprise.TextScaled = true
		Suprise.TextSize = 25.000
		Suprise.TextWrapped = true

		UICorner_25.Parent = Suprise

		Wut.Name = "Wut"
		Wut.Parent = PredoneWords
		Wut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Wut.Position = UDim2.new(0.0377090573, 0, 0.80219245, 0)
		Wut.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Wut.Font = Enum.Font.SourceSans
		Wut.Text = "?"
		Wut.TextColor3 = Color3.fromRGB(0, 0, 0)
		Wut.TextScaled = true
		Wut.TextSize = 25.000
		Wut.TextWrapped = true

		UICorner_26.Parent = Wut

		Its.Name = "Its"
		Its.Parent = PredoneWords
		Its.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Its.Position = UDim2.new(0.686146557, 0, 0.411795795, 0)
		Its.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Its.Font = Enum.Font.SourceSans
		Its.Text = "It's"
		Its.TextColor3 = Color3.fromRGB(0, 0, 0)
		Its.TextScaled = true
		Its.TextSize = 25.000
		Its.TextWrapped = true

		UICorner_27.Parent = Its

		Me.Name = "Me"
		Me.Parent = PredoneWords
		Me.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Me.Position = UDim2.new(0.359584033, 0, 0.411795795, 0)
		Me.Size = UDim2.new(0.279525012, 0, 0.0947997048, 0)
		Me.Font = Enum.Font.SourceSans
		Me.Text = "Me"
		Me.TextColor3 = Color3.fromRGB(0, 0, 0)
		Me.TextScaled = true
		Me.TextSize = 25.000
		Me.TextWrapped = true

		UICorner_28.Parent = Me
		--
		local TypeText = ""       --Keep this
		local Gui = Keyboard      -- The Gui you want to use (Must be a frame)
		local Gui2 = PredoneWords -- Word list Gui

		Gui.Visible = false
		Gui2.Visible = false
		TypeTextBox.Text = TypeText

		-- Keyboard stuff:

		local function DoCam(CamSizer)
			if options.BetterType == true then
				if CamSizer == 1 then
					cam.HeadScale = options.headscale
					repeat
						cam.HeadScale = cam.HeadScale - 0.1
						wait()
					until cam.HeadScale < 1.1
					
					repeat
						Blur.Size = Blur.Size + 4.5
						wait()
					until Blur.Size > 50
					Blur.Size = 58
					cam.HeadScale = 1
					game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 1)
					game:GetService("StarterGui"):SetCore("VREnableControllerModels", true)
				end
				if CamSizer == 2 then
					repeat
						cam.HeadScale = cam.HeadScale + 0.1
						wait()
					until cam.HeadScale > options.headscale - 0.1
					repeat
						Blur.Size = Blur.Size - 4.5
						wait()
					until Blur.Size < 1
					Blur.Size = 0
					game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
					game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)
					cam.HeadScale = options.headscale
				end
			end
		end
		game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
			if inputObject.KeyCode == Enum.KeyCode.ButtonB or inputObject.KeyCode == Enum.KeyCode.ButtonL1 then
				if Gui.Visible == false and Gui2.Visible == false then
					Gui.Visible = true
					Gui2.Visible = false
					TypeText = ""
					TypeTextBox.Text = TypeText
					DoCam(1)
					wait(.2)
				elseif Gui.Visible == true or Gui2.Visible == true then
					Gui2.Visible = false
					Gui.Visible = false
					DoCam(2)
					wait(.2)
				end
			end 
		end)
		BackHome.Activated:Connect(function()
			Gui2.Visible = false
			Gui.Visible = true
		end)
		Wordlist.Activated:Connect(function()
			Gui2.Visible = true
			Gui.Visible = false
		end)
		ENTER.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(TypeText, "All")
			Gui.Visible = false
			DoCam(2)
		end)
		SpaceBar.Activated:Connect(function()
			TypeText = TypeText.." "
			TypeTextBox.Text = TypeText
		end)
		WhoosVR.Activated:Connect(function()
			TypeText = TypeText.."whoogives vr"
			TypeTextBox.Text = TypeText
		end)
		Backspace.Activated:Connect(function()
			TypeText = TypeText:sub(1, -2)
			TypeTextBox.Text = TypeText
		end)

		-- Letters:
		Q.Activated:Connect(function()
			TypeText = TypeText.."q"
			TypeTextBox.Text = TypeText
		end)
		W.Activated:Connect(function()
			TypeText = TypeText.."w"
			TypeTextBox.Text = TypeText
		end)
		E.Activated:Connect(function()
			TypeText = TypeText.."e"
			TypeTextBox.Text = TypeText
		end)
		R.Activated:Connect(function()
			TypeText = TypeText.."r"
			TypeTextBox.Text = TypeText
		end)
		T.Activated:Connect(function()
			TypeText = TypeText.."t"
			TypeTextBox.Text = TypeText
		end)
		Y.Activated:Connect(function()
			TypeText = TypeText.."y"
			TypeTextBox.Text = TypeText
		end)
		U.Activated:Connect(function()
			TypeText = TypeText.."u"
			TypeTextBox.Text = TypeText
		end)
		I.Activated:Connect(function()
			TypeText = TypeText.."i"
			TypeTextBox.Text = TypeText
		end)
		O.Activated:Connect(function()
			TypeText = TypeText.."o"
			TypeTextBox.Text = TypeText
		end)
		P.Activated:Connect(function()
			TypeText = TypeText.."p"
			TypeTextBox.Text = TypeText
		end)

		A.Activated:Connect(function()
			TypeText = TypeText.."a"
			TypeTextBox.Text = TypeText
		end)
		S.Activated:Connect(function()
			TypeText = TypeText.."s"
			TypeTextBox.Text = TypeText
		end)
		D.Activated:Connect(function()
			TypeText = TypeText.."d"
			TypeTextBox.Text = TypeText
		end)
		F.Activated:Connect(function()
			TypeText = TypeText.."f"
			TypeTextBox.Text = TypeText
		end)
		G.Activated:Connect(function()
			TypeText = TypeText.."g"
			TypeTextBox.Text = TypeText
		end)
		H.Activated:Connect(function()
			TypeText = TypeText.."h"
			TypeTextBox.Text = TypeText
		end)
		J.Activated:Connect(function()
			TypeText = TypeText.."j"
			TypeTextBox.Text = TypeText
		end)
		K.Activated:Connect(function()
			TypeText = TypeText.."k"
			TypeTextBox.Text = TypeText
		end)
		L.Activated:Connect(function()
			TypeText = TypeText.."l"
			TypeTextBox.Text = TypeText
		end)

		Z.Activated:Connect(function()
			TypeText = TypeText.."z"
			TypeTextBox.Text = TypeText
		end)
		X.Activated:Connect(function()
			TypeText = TypeText.."x"
			TypeTextBox.Text = TypeText
		end)
		C.Activated:Connect(function()
			TypeText = TypeText.."c"
			TypeTextBox.Text = TypeText
		end)
		V.Activated:Connect(function()
			TypeText = TypeText.."v"
			TypeTextBox.Text = TypeText
		end)
		B.Activated:Connect(function()
			TypeText = TypeText.."b"
			TypeTextBox.Text = TypeText
		end)
		N.Activated:Connect(function()
			TypeText = TypeText.."n"
			TypeTextBox.Text = TypeText
		end)
		M.Activated:Connect(function()
			TypeText = TypeText.."m"
			TypeTextBox.Text = TypeText
		end)
		-- Predone words:
		Hello.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hello!", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Sup.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Sup", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Hi.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Hi", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Thanks.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Thank you!", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Omg.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Omg", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Lol.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("lol", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		You.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Him.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Him", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Her.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Her", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		And.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("And", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Me.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Me", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Its.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("It's", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Stop.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Stop", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Start.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Start", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		What.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("What?", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Sad.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(":C", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Happy.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(":D", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Suprise.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(":O", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Wut.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("?", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		Yes.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yes", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
		No.Activated:Connect(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("No", "All")
			Gui2.Visible = false
			Gui.Visible = false
			DoCam(2)
		end)
	end
end

if _G.DidVR == false then --If the script has not been executed before hand
	_G.DidVR = true
	
	local moveHandLSBox = Instance.new("SelectionBox",moveHandL)
	moveHandLSBox.Adornee = moveHandL
	moveHandLSBox.LineThickness = 0.02
	moveHandLSBox.Color3 = options.ConOutlineColor
	local moveHandRSBox = Instance.new("SelectionBox",moveHandL)
	moveHandRSBox.Adornee = moveHandR
	moveHandRSBox.LineThickness = 0.02
	moveHandRSBox.Color3 = options.ConOutlineColor
	local moveHeadSBox = Instance.new("SelectionBox",moveHead)
	moveHeadSBox.Adornee = moveHead
	moveHeadSBox.LineThickness = 0.02
	moveHeadSBox.Color3 = options.ConOutlineColor
	moveHeadSBox.Transparency = 0.9
	
	input.InputChanged:connect(function(key)
		if key.KeyCode == Enum.KeyCode.ButtonR1 then
			if key.Position.Z > 0.9 then
				R1down = true
			else
				R1down = false
			end
		end
	end)
	input.InputBegan:connect(function(key)
		if key.KeyCode == Enum.KeyCode.ButtonR1 then
			R1down = true
		end
	end)
	input.InputEnded:connect(function(key)
		if key.KeyCode == Enum.KeyCode.ButtonR1 then
			R1down = false
		end
	end)
	local ArtificialHB = Instance.new("BindableEvent", script)
	ArtificialHB.Name = "Heartbeat"
	script:WaitForChild("Heartbeat")
	local frame = 1 / 60
	local tf = 0
	local allowframeloss = false
	local tossremainder = false
	local lastframe = tick()
	script.Heartbeat:Fire()

	game:GetService("RunService").Heartbeat:connect(function(s, p)
		if character.Humanoid.Sit then -- Anti-sit
			character.Humanoid.Sit = false
		end
		local plr = game:GetService("Players").LocalPlayer
		if R1down then
			cam.CFrame = cam.CFrame:Lerp(cam.CoordinateFrame + (moveHandR.CFrame*CFrame.Angles(-math.rad(options.righthandrotoffset.X),-math.rad(options.righthandrotoffset.Y),math.rad(180-options.righthandrotoffset.X))).LookVector * cam.HeadScale/2, 0.5)
		end
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				script.Heartbeat:Fire()
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					script.Heartbeat:Fire()
				end
				lastframe = tick()
			end
			if tossremainder then
				tf = 0
			else
				tf = tf - frame * math.floor(tf / frame)
			end
		end
	end)

	local function bubble(plr,msg)
		game:GetService("Chat"):Chat(plr.Character.Head,msg,Enum.ChatColor.White)
	end

	if options.forcebubblechat == true then
		game.Players.PlayerAdded:connect(function(plr)
			plr.Chatted:connect(function(msg)
				game:GetService("Chat"):Chat(plr.Character.Head,msg,Enum.ChatColor.White)
			end)
		end)

		for i,v in pairs(game.Players:GetPlayers()) do
			v.Chatted:connect(function(msg)
				game:GetService("Chat"):Chat(v.Character.Head,msg,Enum.ChatColor.White)
			end)
		end
	end
	--
end

-- The main script:
local function MainScript()
	PlayerReset = false
	LoadNet() --Loads the neybypass
	LoadKeybord() --Loads the chat gui

	if options.BlockCharacter == true then
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("Accessory") then
				v.Handle:BreakJoints()
			end
		end
		for i,v in pairs(character:GetDescendants()) do
			if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
				v:Destroy()
			end
		end
		character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
	end
	wait()
	local plr = game:GetService("Players").LocalPlayer
	local cam = workspace.CurrentCamera
	local Root = character:FindFirstChild("HumanoidRootPart")
	if options.BadCoputer == true then
		local a = game
		local b = a.Workspace
		local c = a.Lighting
		local d = b.Terrain
		d.WaterWaveSize = 0
		d.WaterWaveSpeed = 0
		d.WaterReflectance = 0
		d.WaterTransparency = 0
		c.GlobalShadows = false
		c.FogEnd = 9e9
		c.Brightness = 1
		settings().Rendering.QualityLevel = "Level01"
		for e, f in pairs(a:GetDescendants()) do
			if f:IsA("Part") or f:IsA("BasePart") or f:IsA("UnionOperation") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
				f.Material = "Plastic"
			elseif f:IsA("Decal") or f:IsA("Texture") then
				f:Destroy()
			elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
				f:Remove()
			elseif f:IsA("Explosion") then
				f:Remove()
			elseif f:IsA("Fire") or f:IsA("Smoke") or f:IsA("Sparkles") then
				f:Remove()
			elseif f:IsA("MeshPart") then
				f.Material = "Plastic"
				f.Reflectance = 0
				f.TextureID = 10385902758728957
			end
		end
		for e, g in pairs(c:GetChildren()) do
			if g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect") then
				g:Remove()
			end
		end
		sethiddenproperty(game.Lighting, "Technology", "Compatibility")
	end
	repeat wait()
		local a = pcall(function()
			game:WaitForChild("Players").LocalPlayer:WaitForChild("PlayerScripts").ChildAdded:Connect(function(c)
				if c.Name == "PlayerScriptsLoader"then
					c.Disabled = true
				end
			end)
		end)
		if a == true then break end
	until true == false
	game:WaitForChild("Players").LocalPlayer:WaitForChild("PlayerScripts").ChildAdded:Connect(function(c)
		if c.Name == "PlayerScriptsLoader"then
			c.Disabled = true
		end
	end)
	options.righthandrotoffset = options.HandsRotationOffset
	options.lefthandrotoffset = options.HandsRotationOffset
	character.Humanoid.AnimationPlayed:connect(function(anime)
		anime:Stop()
	end)
	for i,v in pairs(character.Humanoid:GetPlayingAnimationTracks()) do
		v:AdjustSpeed(0)
	end
	cam.CameraType = "Scriptable" -- Keep this
	cam.HeadScale = options.headscale
	game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
	game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)
	print("Whoogive's VR by Whoogivesashit#2751")
	workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position)

	-- Setup:

	character["Left Arm"].Transparency = options.HandTransparency
	character["Right Arm"].Transparency = options.HandTransparency
	
	character["Right Arm"].CanCollide = false
	character["Left Arm"].CanCollide = false
	character["Left Arm"]:BreakJoints()
	character["Right Arm"]:BreakJoints()

	character["Left Leg"]:BreakJoints()
	character["Right Leg"]:BreakJoints()
	--
	if options.HideAllHats == true then -- Hides hats
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("Accessory") then
				v.Handle.Transparency = 1
			end
		end
	end
	wait() --Main Part:
	while runservice["Heartbeat"]:Wait() do
		character["Left Arm"].CFrame = moveHandL.CFrame -- Moves the parts to your VR controlls
		character["Right Arm"].CFrame = moveHandR.CFrame
		character["HumanoidRootPart"].CFrame = moveHead.CFrame

		settings().Physics.AllowSleep = false --This some what works:
		settings().Physics.DisableCSGv2 = true
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		swait()
	end
end
local function Resetstuff() -- Remove it if you want
	character.DescendantRemoving:Connect(function(Part) -- Respawns you if you lose your parts
		if options.NetBypassOption == 1 then
			if Part.Name == "Right Arm" or Part.Name == "Left Arm" or Part.Name == "HumanoidRootPart" or Part.Name == "Head" or Part.Name == "Torso" and PlayerReset == false then
				PlayerReset = true
				character:BreakJoints() -- Kill the player
				wait(1)
				
				local plr = game:GetService("Players").LocalPlayer
				plr.CharacterAdded:Wait():WaitForChild("Humanoid")

				game:GetService("RunService").Stepped:wait()
				game:GetService("RunService").Stepped:wait(3)

				PlayerReset = false

				-- Return the script:
				Resetstuff()
				MainScript()
				--
				wait()
				return
			end
		end
	end)
end
Resetstuff() -- Do not remove or else the script wont work
MainScript() -- Same here dont remove