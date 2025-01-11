-- Script Made By: 'iRealbots'
-- Create fire effect, display message automatically, and play sound.

-- Get the part where the fire and smoke will appear
local part = workspace:WaitForChild("FirePart")

-- Setup Fire effect
local fire = Instance.new("Fire", part)
fire.Heat = 25
fire.Size = 50

-- Setup Smoke effect (optional for added effect)
local smoke = Instance.new("Smoke", part)
smoke.Opacity = 0.5
smoke.Size = 50

-- Function to change sky to red (without skybox)
local function setRedSky()
    -- Adjust Lighting to create red hue
    game.Lighting.Ambient = Color3.fromRGB(255, 0, 0)  -- Red ambient light
    game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 0, 0)  -- Red outdoor ambient light
    game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 0, 0)  -- Red bottom color
    game.Lighting.ColorShift_Top = Color3.fromRGB(255, 0, 0)  -- Red top color
end

-- Function to display message on the screen (permanently)
local function displayMessage()
    -- Create a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MessageGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create a TextLabel
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Text = "You blasphemers are fit for death, you worthless trash."
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red color
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
end

-- Function to change player's skin to black and eyes to red
local function changePlayerAppearance(player)
    -- Gamitin ang BodyColors para gawing itim ang skin
    local bodyColors = player.Character:FindFirstChild("BodyColors")
    if bodyColors then
        bodyColors.HeadColor = Color3.fromRGB(0, 0, 0)  -- Itim ang balat ng ulo
        bodyColors.TorsoColor = Color3.fromRGB(0, 0, 0)  -- Itim ang katawan
        bodyColors.LeftLegColor = Color3.fromRGB(0, 0, 0)  -- Itim ang kaliwang binti
        bodyColors.RightLegColor = Color3.fromRGB(0, 0, 0)  -- Itim ang kanang binti
        bodyColors.LeftArmColor = Color3.fromRGB(0, 0, 0)  -- Itim ang kaliwang braso
        bodyColors.RightArmColor = Color3.fromRGB(0, 0, 0)  -- Itim ang kanang braso
    end

    -- Gawin ang mata ng player na pula (using accessory or body part textures)
    local head = player.Character:FindFirstChild("Head")
    if head then
        -- Attempt to change eye color using accessories or textures
        local face = head:FindFirstChild("face")
        if face then
            face.TextureID = "http://www.roblox.com/asset/?id=3086725754"  -- Replace with red eye texture if needed
        end
    end
end

-- Main loop to create effects and play sound
while true do
    wait(5)

    -- Display the message if it's not already displayed
    if not game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("MessageGui") then
        displayMessage()
    end

    -- Create and play evil laugh sound
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = "rbxassetid://4810729995" -- Replace with the correct asset ID
    sound.Volume = 10
    sound.Looped = true  -- Make the sound loop indefinitely
    sound:Play()

    -- Optional: Stop the sound after a long time (if desired)
    -- wait(60)  -- Looping sound for a minute before stopping
    -- sound:Stop()
    -- sound:Destroy()

    -- Log to output for debugging
    print("Worthless")

    -- Change sky to red
    setRedSky()
end

-- Main loop to change appearance of players when they join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        -- Tawagin ang function kapag may bagong player na sumali at magkaroon ng bagong character
        changePlayerAppearance(player)
    end)
end)
