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

-- Function to change sky to red
local function setRedSky()
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=60229903" -- Optional, not needed for just a red sky
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=60229904"
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=60229905"
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=60229906"
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=60229907"
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=60229908"
    
    -- You can adjust the color of the sky without textures:
    game.Lighting.Ambient = Color3.fromRGB(255, 0, 0)  -- Red ambient light
    game.Lighting.Sky = sky
end

-- Function to display message on the screen
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

    -- Remove the GUI after 5 seconds
    wait(5)
    screenGui:Destroy()
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

    -- Gawin ang mata ng player na pula
    local head = player.Character:FindFirstChild("Head")
    if head then
        local eyes = head:FindFirstChild("LeftEye") or head:FindFirstChild("RightEye")
        if eyes then
            eyes.BrickColor = BrickColor.new("Bright red")  -- Pula ang mata
        end
    end
end

-- Main loop to create effects and play sound
while true do
    wait(5)

    -- Display the message
    displayMessage()

    -- Create and play evil laugh sound
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = "rbxassetid://4810729995" -- Replace with the correct asset ID
    sound.Volume = 1
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
        -- Tawagin ang function kapag may bagong player na sumali at magkaroon ng bagong character
        changePlayerAppearance(player)
    end)
end)
