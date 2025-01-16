-- Configuration --
local servermessagetext = "THIS GAME WAS DESTROYED BY THE REX VIRUS" -- Put your message here.
local textmessage = " you are an idiot hahahaha" -- Put your message here.
local SoundID = "rbxassetid://7266001792" -- The sound ID you will use.

-- Clear Lighting and display a global message
game.Lighting:ClearAllChildren()
local message = Instance.new("Hint")
message.Parent = workspace
message.Text = servermessagetext

-- Iterate through all BaseParts in Workspace
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") and v.Parent:IsA("Model") then
        -- Add a looping sound
        local sound = Instance.new("Sound")
        sound.SoundId = SoundID
        sound.RollOffMaxDistance = 1200
        sound.Looped = true
        sound.Volume = 10
        sound.Parent = v
        sound:Play()

        -- Add decals on all faces of the part
        local decalTexture = "http://www.roblox.com/asset/?id=103859191443110"
        for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
            local decal = Instance.new("Decal")
            decal.Texture = decalTexture
            decal.Face = face
            decal.Parent = v
        end

        -- Modify Part Properties
        v.Name = "Uh"
        v.Anchored = true
        v.Color = Color3.new(0.0588235, 0.380392, 0)
        v.Orientation = Vector3.new(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360))
        v.Position = Vector3.new(math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000))

        -- Add Billboard GUI
        local billboard = Instance.new("BillboardGui")
        billboard.Adornee = v
        billboard.Size = UDim2.new(0, 200, 0, 200)
        billboard.AlwaysOnTop = true
        billboard.Parent = v

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        text
