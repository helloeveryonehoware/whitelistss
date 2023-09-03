local LocalPlayer = game:GetService("Players").LocalPlayer

function IsAlive(Player)
    Player = Player or LocalPlayer
    if not Player.Character then return false end
    if not Player.Character:FindFirstChild("Head") then return false end
    if not Player.Character:FindFirstChild("Humanoid") then return false end
    if Player.Character:FindFirstChild("Humanoid").Health < 0.11 then return false end
    return true
end

local function SetCollisions(Value)
    for i, v in pairs(LocalPlayer:GetDescendants()) do
        if v:IsA("BasePart") and v ~= LocalPlayer.Character.PrimaryPart and v.CanCollide then
            if Value == true then
                v.CanCollide = false
            end

            if Value == false then
                v.CanCollide = true
            end
        end
    end
end

task.spawn(function()
    if IsAlive(LocalPlayer) then 
        local Animation = Instance.new("Animation")
        local Id = 11335949902
        Animation.AnimationId = "rbxassetid://".. Id

        local PlayerAnimation = LocalPlayer.Character.Humanoid.Animator:LoadAnimation(Animation)
        if PlayerAnimation then
            LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 3 / -2, 0)
            LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(2, 3, 1.1)

            PlayerAnimation.Priority = Enum.AnimationPriority.Action4
            PlayerAnimation.Looped = true
            PlayerAnimation:Play()
            PlayerAnimation:AdjustSpeed(0 / 10)
            SetCollisions(true)
        end
    end
end)
