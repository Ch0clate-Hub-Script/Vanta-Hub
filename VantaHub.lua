local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Vanta Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading Vanta Hub Scripts",
   LoadingSubtitle = "by Ch0clate",
   ShowText = "Welcome to Vanta Hub User!", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "VantaHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Stop Right There please enter the key to continue",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "VantaKEy", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Vanta"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Movement Scripts", 4483362458) -- Title, Image

local FlySection = MainTab:CreateSection("Op Fly Stuff")

local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/xuSMWfDu"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "God Mode",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Noclip [Enable Fly First]",
   Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/2JZWpiKn"))()

   end,
})

local MovementSection = MainTab:CreateSection("Actual Movement")

---------------------------------------------------------
-- RESET CHARACTER BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end,
})


---------------------------------------------------------
-- SPIN BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Spin (1 second)",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        for i = 1, 50 do
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(20), 0)
            task.wait(0.02)
        end
    end,
})


---------------------------------------------------------
-- SIT BUTTON
---------------------------------------------------------
MainTab:CreateButton({
    Name = "Sit",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.Sit = true end
    end,
})



local Section = MainTab:CreateSection("Sliders")




---------------------------------------------------------
-- CAMERA MAX ZOOM SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Max Camera Zoom",
    Range = {10, 200},
    Increment = 5,
    Suffix = "",
    CurrentValue = 50,
    Flag = "Zoom_Save",
    Callback = function(v)
        local p = game.Players.LocalPlayer
        p.CameraMaxZoomDistance = v
        p.CameraMinZoomDistance = 0.5
    end,
})


---------------------------------------------------------
-- CHARACTER TRANSPARENCY SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Character Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 0,
    Flag = "Transparency_Save",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = v
            end
        end
    end,
})



---------------------------------------------------------
-- FIELD OF VIEW SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Field of View",
    Range = {60, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 70,
    Flag = "FOV_Save",
    Callback = function(v)
        workspace.CurrentCamera.FieldOfView = v
    end,
})




---------------------------------------------------------
-- WALKSPEED SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkspeedValueSave",
    Callback = function(v)
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v end
    end,
})


---------------------------------------------------------
-- JUMPPOWER SLIDER
---------------------------------------------------------
MainTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 10,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpPowerValueSave",
    Callback = function(v)
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end,
})

local Section = MainTab:CreateSection("Toggles")


---------------------------------------------------------
-- FIRST PERSON LOCK
---------------------------------------------------------
local fpLock = false

MainTab:CreateToggle({
    Name = "Force First Person",
    CurrentValue = false,
    Flag = "FP_Save",
    Callback = function(v)
        fpLock = v
        local p = game.Players.LocalPlayer
        if v then
            p.CameraMode = Enum.CameraMode.LockFirstPerson
        else
            p.CameraMode = Enum.CameraMode.Classic
        end
    end,
})


---------------------------------------------------------
-- INFINITE JUMP (SAFE VERSION)
---------------------------------------------------------
local UIS = game:GetService("UserInputService")
local InfiniteJumpEnabled = false

UIS.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local hum = game.Players.LocalPlayer.Character and
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump_Toggle",
    Callback = function(v)
        InfiniteJumpEnabled = v
    end,
})



---------------------------------------------------------
-- AUTO RESPAWN TOGGLE
---------------------------------------------------------
local autoRespawn = false

MainTab:CreateToggle({
    Name = "Auto Respawn",
    CurrentValue = false,
    Flag = "AutoRespawn_Save",
    Callback = function(v)
        autoRespawn = v
    end,
})

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if autoRespawn then
        task.wait(1)
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
end)
