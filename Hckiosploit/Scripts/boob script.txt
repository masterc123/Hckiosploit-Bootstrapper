--[[
https://www.roblox.com/catalog/11679229/Motocross-62-Fire
https://www.roblox.com/catalog/14463468/Motocross-77-The-Sting
https://www.roblox.com/catalog/5945909830/Pink-Ornament-Earrings
]]

--[[
-gh 11679229,14463468,5945909830
]]

game.Players.LocalPlayer.Character.Stinger77.Handle.Mesh:Remove()
game.Players.LocalPlayer.Character:WaitForChild("Racing Helmet Flames").Handle.Mesh:Remove()

local unanchoredparts = {}
		local movers = {}
		local tog = true
		local move = false
		local Player = game:GetService("Players").LocalPlayer
		local Character = Player.Character
		local mov = {};
		local mov2 = {};

		local Hats = {Hat1  = Character:WaitForChild("Stinger77"), -- u can add multiple hats
        Hat2  = Character:WaitForChild("Racing Helmet Flames"), -- and do the same it cant have the same name thats common sense
        Hat3  = Character:WaitForChild("MeshPartAccessory"),
      -- u can make more hats and repeat the same thing
		}


		--Dont touch below

		for i,v in next, Hats do
			v.Handle.AccessoryWeld:Remove()
			for _,mesh in next, v:GetDescendants() do
				if mesh:IsA("Mesh") or mesh:IsA("Mesh") then -- change mesh to Specialmesh if u want to destroy the mesh
					mesh:Remove()
				end
			end
		end

		function ftp(str)
			local pt = {};
			if str ~= 'me' and str ~= 'random' then
				for i, v in pairs(game.Players:GetPlayers()) do
					if v.Name:lower():find(str:lower()) then
						table.insert(pt, v);
					end
				end
			elseif str == 'me' then
				table.insert(pt, plr);
			elseif str == 'random' then
				table.insert(pt, game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]);
			end
			return pt;
		end

		local function align(i,v)
			local att0 = Instance.new("Attachment", i)
			att0.Position = Vector3.new(0,0,0)
			local att1 = Instance.new("Attachment", v)
			att1.Position = Vector3.new(0,0,0)
			local AP = Instance.new("AlignPosition", i)
			AP.Attachment0 = att0
			AP.Attachment1 = att1
			AP.RigidityEnabled = false
			AP.ReactionForceEnabled = false
			AP.ApplyAtCenterOfMass = false
			AP.MaxForce = 9999999
			AP.MaxVelocity = math.huge
			AP.Responsiveness = 65
			local AO = Instance.new("AlignOrientation", i)
			AO.Attachment0 = att0
			AO.Attachment1 = att1
			AO.ReactionTorqueEnabled = false
			AO.PrimaryAxisOnly = false
			AO.MaxTorque = 9999999
			AO.MaxAngularVelocity = math.huge
			AO.Responsiveness = 50
		end


		--Dont touch above

		align(Hats.Hat1.Handle, Character["Torso"])-- copy this and make a new Hat2 or what u named it
	    align(Hats.Hat2.Handle, Character["Torso"])
        align(Hats.Hat3.Handle, Character["Torso"])


		Hats.Hat1.Handle.Attachment.Rotation = Vector3.new(250,170,183) -- rotation of the hat if u want to add a hat u need to make a new rotation to
        Hats.Hat2.Handle.Attachment.Rotation = Vector3.new(250,170,183) --  Hat2 rotation always change the name to the u added to the Hat2
        Hats.Hat3.Handle.Attachment.Rotation = Vector3.new(240,0,0)

		--Attachmment1 is the 1st hat u put in Hats at the top. it goes in order

		Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment1" -- make a new attachment to
	    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment2"
        Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment3" 
        Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5, 0.5, -0.5) -- normal value -- position of the hat
        Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.5, 0.5, -0.5)
        Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0, 0.5, -.9)