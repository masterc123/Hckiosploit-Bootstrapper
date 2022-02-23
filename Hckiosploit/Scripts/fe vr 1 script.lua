local cam = workspace.Camera
local p
local headObject
local events = {}

local controls = {
	[Enum.UserInputType.MouseButton1] = {"move", "leftHand"},
	[Enum.UserInputType.MouseMovement] = {"updateTarget"}, -- do not change
	[Enum.UserInputType.MouseWheel] = {"adjustOffset"},
	[Enum.UserInputType.MouseButton2] = {"move", "rightHand"},
	[Enum.KeyCode.W] = {"move", "head", Vector3.new(0, 1, 0)},
	[Enum.KeyCode.A] = {"move", "head", Vector3.new(-1, 0, 0)},
	[Enum.KeyCode.S] = {"move", "head", Vector3.new(0, -1, 0)},
	[Enum.KeyCode.D] = {"move", "head", Vector3.new(1, 0, 0)},
	[Enum.KeyCode.Q] = {"move", "head", Vector3.new(0, 0, -1)},
	[Enum.KeyCode.E] = {"move", "head", Vector3.new(0, 0, 1)},
	[Enum.KeyCode.LeftShift] = {"gesture", "Fist"},
	[Enum.KeyCode.LeftControl] = {"gesture", "Index"},
	[Enum.KeyCode.LeftAlt] = {"gesture", "Thumb"},
	[Enum.KeyCode.Z] = {"toggle", "canOffset"},
	[Enum.KeyCode.R] = {"toggle", "rotationManager"},
	[Enum.KeyCode.Tab] = {"selectAxis", "rotationManager"},
	[Enum.KeyCode.Left] = {"updateAxisMover", "rotationManager", -1},
	[Enum.KeyCode.Right] = {"updateAxisMover", "rotationManager", 1}
}

local services = {}

setmetatable(services, {
	__index = function(t, k)
		services[k] = rawget(services, k) or game:GetService(k)
		return services[k]
	end
})

local function angleBetween(vecx, vecy)
	return math.acos(vecx:Dot(vecy))
end

local hand = {}
hand.__index = hand

function hand:gesture(gestureName, keyState)
	if keyState ~= 1 then
		return
	end

	headObject.realHeadset[self.id .. gestureName] = 1 - headObject.realHeadset[self.id .. gestureName]
end

function hand:getMouseRay()
	local mousePos = services.UserInputService:GetMouseLocation()
	return CFrame.new(cam:ViewportPointToRay(mousePos.x, mousePos.y).Direction * (1.5 + headObject.handOffset))
end

function hand:calculateEndRotation()
	return CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()) * CFrame.Angles(self.rotation[1] * (math.pi/6), self.rotation[2] * (math.pi/6), self.rotation[3] * (math.pi/6))
end

function hand:updateTarget()

	local camLook = (cam.CFrame.lookVector * Vector3.new(1,0,1)).unit
	
	local theta = angleBetween(Vector3.new(-1, 0, 0), camLook)
	theta = camLook.z > 0 and (2 * math.pi) - theta or theta

	local relativeAngle = (self.id == "l" and -headObject.handAngle or headObject.handAngle)
	local startPosition = CFrame.new(-math.cos(theta + relativeAngle), -0.5, -math.sin(theta + relativeAngle)) + (camLook * headObject.handOffset)

	self.targetPosition = startPosition:Lerp(self:getMouseRay(), self.alpha) * self:calculateEndRotation()
	
	self.replicatePosition:Fire()
end

function hand:beginMove(minAlpha, maxAlpha)
	local distAlpha = (maxAlpha - minAlpha) / 2

	self.moving = true
	repeat
		services.RunService.RenderStepped:wait()
		self:updateTarget()
		self.alpha += self.alphaMultiplier
	until math.abs(self.alpha - minAlpha) < 0.05 or math.abs(maxAlpha - self.alpha) < 0.05 or self.alpha ~= self.alpha
	
	if self.alpha ~= self.alpha then
		self.alpha = 0
	end
	
	self.moving = false
end

function hand:move(keyState)

	if headObject.rotationManager.active then
		if self.id == "l" then
			headObject.rotationManager.held = keyState == 1
			
			headObject.rotationManager.selectedAxis = 0
		end
		return
	end

	self.alphaMultiplier = keyState == 1 and 0.05 or -0.05
	
	if not self.moving and not (keyState == 1 and self.alpha >= 1) then
		if keyState == 1 then
			headObject.recentHand = self
		end
	
		self:beginMove(0, 1)
	end
end

function hand:new(direction, realHand)
	local newHand = setmetatable({direction = direction, realHand = realHand}, hand)
	newHand.alpha = 0
	newHand.alphaMultiplier = 0.05
	newHand.id = direction and "r" or "l"
	newHand.targetPosition = CFrame.new()
	newHand.moving = false
	newHand.rotation = {0, 0, 0}
	newHand.replicatePosition = Instance.new("BindableEvent")
	newHand.replicatePosition.Event:connect(function()
		events.UserCFrameChanged:Fire(newHand.direction and Enum.UserCFrame.RightHand or Enum.UserCFrame.LeftHand, newHand.targetPosition)
	end)
	
	return newHand
end

local head = {}
head.__index = head

function head:handleInput(input, keyState)
	local bind = controls[input.KeyCode] or controls[input.UserInputType]
	
	if bind then
		if bind[1] == "updateTarget" and not self.rotationManager.active then
			self.leftHand:updateTarget()
			self.rightHand:updateTarget()
		elseif bind[2] and type(self[bind[2]]) == "table" then
			self[bind[2]][bind[1]](self[bind[2]], keyState, bind[3])
		elseif bind[3] then
			self[bind[1]](self, bind[3], keyState)
		elseif bind[2] and self.recentHand[bind[1]] then
			self.recentHand[bind[1]](self.recentHand, bind[2], keyState)
		else
			self[bind[1]](self, bind[2], keyState)
		end
	end
end

function head:adjustOffset(_, keyState)
	if self.canOffset then		
		self.handOffset += keyState * 0.04
		self.leftHand:updateTarget()
		self.rightHand:updateTarget()
	end
end

function head:move(vec, keyState)
	if vec.z ~= 0 then
		self.realHeadset.Stick2 = math.clamp(self.realHeadset.Stick2 + (vec.z * keyState), -1, 1)
	else
		self.realHeadset.StickPosition += Vector3.new(vec.x, vec.y, 0) * keyState
	end
end

function head:freezeCam(b)
	local dist = (self.realHeadset.Head.PrimaryPart.Position - cam.CFrame.p).magnitude
		
	p.CameraMinZoomDistance = b and dist or 0.5
	p.CameraMaxZoomDistance = b and dist or 128
end

function head:toggle(stat, keyState)
	if keyState ~= 1 then
		return
	end

	self[stat] = not self[stat]
	
	if stat == "canOffset" then
		self:freezeCam(self[stat])
	end
end

local rotation = {}
rotation.__index = rotation

function rotation:new()
	local newRotation = setmetatable({}, rotation)
	
	newRotation.rotationLookup = {{}, {}, {}}
	newRotation.lineLookup = {{}, {}, {}}
	newRotation.active = false
	newRotation.held = false
	newRotation.selectedAxis = 0
	newRotation.angleLookup = {1, 1, 1}
	
	for i=1,3 do
		local ref = {}
		ref[i] = function() return 0 end
		ref[i + 1 > 3 and ((i + 1) % 4) + 1 or i + 1] = math.cos
		ref[i + 2 > 3 and ((i + 2) % 4) + 1 or i + 2] = math.sin
		
		local color = Color3.fromRGB(i == 1 and 255 or 0, i == 2 and 255 or 0, i == 3 and 255 or 0)
		
		for j=1,13 do
			if j < 13 then
				local step = math.pi * (j/6)
				newRotation.rotationLookup[i][j] = Vector3.new(ref[1](step), ref[2](step), ref[3](step))
			end
			
			local line = Drawing.new("Line")
			line.Visible = true
			line.Thickness = 5
			line.Color = color
			newRotation.lineLookup[i][j] = line
		end
		
		local circle = Drawing.new("Circle")
		circle.Visible = true
		circle.Color = color
		circle.Filled = true
		circle.Radius = 10
		circle.Position = Vector2.new(-2000, -2000)
		newRotation.lineLookup[i][14] = circle
		
		local text = Drawing.new("Text")
		text.Visible = true
		text.Font = Drawing.Fonts.System
		text.Size = 18
		text.Color = Color3.new():lerp(color, 0.3)
		text.Outline = false
		newRotation.lineLookup[i][15] = text
	end
	
	return newRotation
end

function rotation:selectAxis(keyState)
	self.tabActivated = keyState == 1
	if self.tabActivated then
		self.selectedAxis = math.clamp((self.selectedAxis + 1) % 4, 1, 3)
	end
end 

function rotation:toggle(keyState)
	if keyState == 1 and headObject.recentHand.alpha < 0.05 and not self.held then
		self.active = not self.active
		
		if not self.active then
			self:updateAxes(0)
			self.selectedAxis = 0
			self.held = false
			headObject.recentHand:updateTarget()
		end
	end
end

function rotation:updateAxes(visibleOverride)
	local basePos = headObject.recentHand.realHand.Base.Position
	local basePoint = cam:WorldToViewportPoint(basePos)

	for i=1,3 do
		for j=1,12 do
			local vec, visible = cam:WorldToViewportPoint(basePos + (self.rotationLookup[i][j] * 10))
			local vec2, visible2 = cam:WorldToViewportPoint(basePos + ((self.rotationLookup[i][j + 1] or self.rotationLookup[i][1]) * 10))
			
			local line = self.lineLookup[i][j]
			
			line.Transparency = visibleOverride or ((visible and visible2) and 1 or 0)
			line.From = Vector2.new(vec.x, vec.y)
			line.To = Vector2.new(vec2.x, vec2.y)
		end
		local axisRotation = headObject.recentHand.rotation[i]
		
		local axisMover = self.lineLookup[i][13]
		local axisCircle = self.lineLookup[i][14]
		local axisText = self.lineLookup[i][15]
		
		axisMover.From = Vector2.new(basePoint.x, basePoint.y)
		axisMover.To = self.lineLookup[i][math.clamp(axisRotation < 1 and 12 or axisRotation, 1, 12)].From -- sorry, lazy
		axisMover.Transparency = visibleOverride or 1
		
		axisCircle.Position = self.lineLookup[i][13].To
		axisCircle.Transparency = visibleOverride or 1
		
		
		
		axisText.Position = self.lineLookup[2][3].From + axisText.TextBounds
		axisText.Text = string.char(87 + self.selectedAxis) .. ": " .. math.deg(axisRotation * (math.pi / 6))
		axisText.Transparency = visibleOverride or ((self.held or self.tabActivated) and self.selectedAxis == i and 1 or 0)
		
		local mousePos = services.UserInputService:GetMouseLocation()
		if self.held and (self.lineLookup[i][14].Position - mousePos).magnitude < 10 and self.selectedAxis == 0 then
			self.selectedAxis = i
		end
	end
end

function rotation:updateAxisMover(keyState, direction)
	if keyState and direction then
		if self.tabActivated and keyState == 1 then
			headObject.recentHand.rotation[self.selectedAxis] = (headObject.recentHand.rotation[self.selectedAxis] + direction) % 12
			headObject.recentHand:updateTarget()
		end
		return
	end

	if self.selectedAxis ~= 0 then
		local mousePos = services.UserInputService:GetMouseLocation()
		
		local circlePos = self.lineLookup[self.selectedAxis][12].From
		
		local handPos = self.lineLookup[self.selectedAxis][13].From
		
		local mouseDir = self.selectedAxis == 1 and headObject.recentHand.id == "r" and (Vector2.new(-mousePos.x + (handPos.x * 2), mousePos.y) - handPos).unit or (mousePos - handPos).unit
		-- mouse angle relating to the red circle is reflected on the right hand, so i "re-reflect" it. bad practice
		
		local circleDir = (circlePos - handPos).unit
		
		local rotationTheta = angleBetween(mouseDir, circleDir)
		
		local direction = mouseDir:Cross(circleDir)
		
		rotationTheta = direction > 0 and rotationTheta or (2 * math.pi) - rotationTheta
		
		if rotationTheta == rotationTheta then
			headObject.recentHand.rotation[self.selectedAxis] = math.floor(6 * rotationTheta / math.pi)
			
			local hand = headObject.recentHand
			
			hand.targetPosition *= CFrame.Angles(hand.targetPosition:inverse():ToEulerAnglesXYZ()) * hand:calculateEndRotation()
			hand.replicatePosition:Fire()
		end
	end
end

function head:new(realHeadset)
	local newHead = setmetatable({realHeadset = realHeadset}, head)
	
	newHead.leftHand = hand:new(false, realHeadset.lHand)
	newHead.rightHand = hand:new(true, realHeadset.rHand)
	newHead.canOffset = false
	newHead.recentHand = newHead.leftHand
	newHead.handOffset = 0
	newHead.handAngle = math.pi / 4
	
	newHead.rotationManager = rotation:new()
	
	newHead.chatRemote = debug.getupvalue(realHeadset.ButtonPressed, 3)
	
	cam:GetPropertyChangedSignal("CameraSubject"):connect(function()
		if cam.CameraSubject ~= headObject.realHeadset.Head then
			cam.CameraType = Enum.CameraType.Custom
		end
	end)
	
	services.UserInputService.WindowFocused:connect(function()
		newHead.realHeadset.StickPosition = Vector3.new(0, 0, 0)
		newHead.realHeadset.Stick2 = 0
	end)
	
	return newHead
end

local ind, nc, nind

local realVrService = game:GetService("VRService")

local fakeVrService = setmetatable({
	VREnabled = true,
	SetTouchpadMode = function()
	end,
	RecenterUserHeadCFrame = function()
	end,
	GetUserCFrameEnabled = function(cf)
		return true
	end,
	GetUserCFrame = function(cf)
		return CFrame.new()
	end

}, {
	__index = function(t, k)
		local real = ind(realVrService, k)
		if typeof(real) == "RBXScriptSignal" then
			events[k] = events[k] or {
				Name = k,
				Connect = function(t, f)
					t.Function = f

					if t.Name == "UserCFrameChanged" then
						headObject = head:new(debug.getupvalue(t.Function, 1))
						
						services.UserInputService.InputBegan:connect(function(i)
							headObject:handleInput(i, 1)
						end)

						services.UserInputService.InputChanged:connect(function(i)
							headObject:handleInput(i, i.UserInputType == Enum.UserInputType.MouseWheel and i.Position.z or 0)
						end)

						services.UserInputService.InputEnded:connect(function(i)
							headObject:handleInput(i, -1)
						end)
					end

				end, 
				Fire = function(t, ...)
					return t.Function(...)
				end
			}

			return events[k]
		end

		return real
	end,
	__call = function(t, method, vr, ...)
		return t[method](...)
	end
})

ind = hookmetamethod(game, "__index", function(...)
	local t, k = ...

	local scr = getcallingscript()

	if t == realVrService and not (scr and ind(scr, "Name") == "CameraModule") then
		return fakeVrService[k]
	end

	return ind(...)
end)

nc = hookmetamethod(game, "__namecall", function(...)
	local t = ...

	if t == realVrService then
		local method = getnamecallmethod()
		return fakeVrService(method, ...)
	elseif t == game.GetService(game, "StarterGui") and game.IsLoaded(game) then
		return
	end

	return nc(...)
end)

nind = hookmetamethod(game, "__newindex", function(...)
	local t, k, v = ...
	
	local scr = getcallingscript()
	
	if t == cam and headObject then	
		if k == "CFrame" and events.UserCFrameChanged then
		
			events.UserCFrameChanged:Fire(Enum.UserCFrame.Head, CFrame.Angles(cam.CFrame:ToEulerAnglesXYZ()))
			
			if headObject.rotationManager.active then
			
				headObject.rotationManager:updateAxes()
				
				if headObject.rotationManager.held then
					headObject.rotationManager:updateAxisMover()
				end
			end
			
			if headObject.rotationManager.tabActivated and services.UserInputService:IsKeyDown(Enum.KeyCode.Left) or services.UserInputService:IsKeyDown(Enum.KeyCode.Right) then -- prevent controls from messing with camera
				return
			end
		elseif k == "CameraType" then
			nind(t, k, Enum.CameraType.Custom)
			nind(t, "CameraSubject", headObject.realHeadset.Head)
			headObject.leftHand:updateTarget()
			headObject.rightHand:updateTarget()
		end
		if not (scr and scr.Name == "CameraModule") and not checkcaller() then
			return
		end
	end
	
	nind(t, k, v)
end)

p = services.Players.LocalPlayer or (function()
	services.Players:GetPropertyChangedSignal("LocalPlayer"):wait() -- this doesnt return anything for some reason??
	return services.Players.LocalPlayer
end)()

p.Chatted:connect(function(c)
	services.ReplicatedStorage.COM.Chat:FireServer("Chat", c)
end)