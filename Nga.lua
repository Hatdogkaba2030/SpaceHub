-- Variables
local partSize = Vector3.new(4, 4, 4)  -- Size of the falling parts
local fallSpeed = 50  -- Speed at which parts fall
local spawnHeight = 100  -- Height from which parts fall

-- Function to create falling parts
local function createFallingPart()
    local part = Instance.new("Part")
    part.Size = partSize
    part.Position = Vector3.new(math.random(-50, 50), spawnHeight, math.random(-50, 50))  -- Random position
    part.Anchored = false
    part.CanCollide = true
    part.BrickColor = BrickColor.Red()  -- Red color
    part.Parent = game.Workspace

    -- Adding a BodyVelocity to make the part fall
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, -fallSpeed, 0)
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Parent = part

    -- Detect collision with players
    part.Touched:Connect(function(hit)
        local character = hit.Parent
        if character:IsA("Model") and character:FindFirstChild("Humanoid") then
            local humanoid = character:FindFirstChild("Humanoid")
            humanoid.Health = 0  -- Kill the player
        end
    end)

    -- Destroy part after some time
    game.Debris:AddItem(part, 5)  -- The part will be destroyed after 5 seconds
end

-- Function to set red sky
local function setRedSky()
    local lighting = game:GetService("Lighting")
    
    -- Set the skybox to red
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://6348280336"  -- Red Skybox
    sky.SkyboxDn = "rbxassetid://6348280336"
    sky.SkyboxFt = "rbxassetid://6348280336"
    sky.SkyboxLf = "rbxassetid://6348280336"
    sky.SkyboxRt = "rbxassetid://6348280336"
    sky.SkyboxUp = "rbxassetid://6348280336"
    sky.Parent = lighting
    
    -- Set the ambient light to a red tone for effect
    lighting.Ambient = Color3.fromRGB(100, 0, 0)  -- Dark red ambient light
    lighting.OutdoorAmbient = Color3.fromRGB(50, 0, 0)  -- Slightly darker outdoor light
end

-- Set the red sky when the game starts
setRedSky()

-- Create falling parts every 1 second
while true do
    wait(1)
    createFallingPart()
end
