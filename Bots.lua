-- Script Made By: 'iRealbots'
-- Create fire effect, display message automatically, and play sound.

-- Get the part where the fire and smoke will appear
local part = workspace:WaitForChild("FirePart")

-- Setup Fire effect
local fire = Instance.new("Fire")
fire.Heat = 25
fire.Size = 50
fire.Parent = part  -- Parent to the part directly

-- Setup Smoke effect (optional for added effect)
local smoke = Instance.new("Smoke")
smoke.Opacity = 0.5
smoke.Size = 50
smoke.Parent = part  -- Parent to the part directly

-- Function to change sky to red
local function setRedSky()
    -- Create or get existing Sky instance
    local sky = game.Lighting:FindFirstChildOfClass("Sky")
    if not sky then
        sky = Instance.new("Sky")
        sky.Parent = game.Lighting
    end

    -- Update the skybox textures if valid URLs are available
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=60229903" 
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=60229904"
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=60229905"
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=60229906"
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=60229907"
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=60229908"

    game.Lighting.Ambient = Color3.fromRGB(255, 0, 0)  -- Red ambient light
end

-- Function to display message on the screen for a specific player
local function displayMessage(player)
    -- Create a ScreenGui for the player
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MessageGui"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    -- Create a TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Text = "You blasphemers are fit for death, you worthless trash."
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red color
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold

    -- Remove the GUI after 5 seconds
    wait(5)
    screenGui:Destroy()
end

-- Function to change player's skin to black and eyes to red
local function changePlayerAppearance(player)
    -- Check if the player has BodyColors (for R6 avatars)
    local bodyColors = player.Character:FindFirstChild("BodyColors")
    if bodyColors then
        bodyColors.HeadColor = Color3.fromRGB(0, 0, 0)
        bodyColors.TorsoColor = Color3.fromRGB(0, 0, 0)
        bodyColors.LeftLegColor = Color3.fromRGB(0, 0, 0)
        bodyColors.RightLegColor = Color3.fromRGB(0, 0, 0)
        bodyColors.LeftArmColor = Color3.fromRGB(0, 0, 0)
        bodyColors.RightArmColor = Color3.fromRGB(0, 0, 0)
    end

    -- Check if player has eyes and change to red
    local head = player.Character:FindFirstChild("Head")
    if head then
        local eyes = head:FindFirstChild("LeftEye") or head:FindFirstChild("RightEye")
        if eyes then
            eyes.BrickColor = BrickColor.new("Bright red")
        end
    end
end

-- Main loop to play sound and create effects
local function playEvilEffects()
    -- Create and play evil laugh sound
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://4810729995"  -- Ensure this is a valid sound ID
    sound.Volume = 10
    sound.Parent = workspace
    sound:LoadAsync()  -- Ensure the sound is fully loaded before playing
    sound:Play()

    -- Optional: Stop the sound after 5 seconds
    wait(5)
    sound:Stop()
    sound:Destroy()

    -- Log to output for debugging
    print("Worthless")

    -- Change sky to red
    setRedSky()
end

-- Main loop to change appearance of players when they join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Change player appearance when a new character spawns
        changePlayerAppearance(player)

        -- Display the message on the player's screen
        displayMessage(player)

        -- Play effects
        playEvilEffects()
    end)
end)
