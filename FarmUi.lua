-- Services
local playerService = game:GetService("Players")
local plr = playerService.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Player Info
local StatsFolder = ReplicatedStorage:WaitForChild("PlayerData")[plr.UserId]
local MainStats1 = StatsFolder:WaitForChild("Main")
local PlayerMainFolder = MainStats1:WaitForChild("MainStats")
local Money = PlayerMainFolder:WaitForChild("Money")
local Lucks = MainStats1:WaitForChild("Lucks")

-- Remotes
local RemoteFunctionsFolder = ReplicatedStorage:WaitForChild("RemoteFunctions")
local BasicUpgrade = RemoteFunctionsFolder:WaitForChild("BasicUpgrade")
local PrestigeEvent = RemoteFunctionsFolder:WaitForChild("Prestige")

-- Version
local Version = loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/ScriptVersion"))()
print(Version.GetScriptVersion())

-- Tables 
local AutoFarm = {
    automaticlyBasic = false;
    autoPrestigE = false;
    autoPrestigeLuck = false;
    autoFasterLuck = false;
}
local Prestige = {
    LuckNeed = 1;
}
-- Ui Setup
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("JustAHub", "BloodTheme")
local Tab = Window:NewTab("Auto Farm")
local Section = Tab:NewSection("Auto Basic Upgrade")
Section:NewToggle("Auto Better Luck", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.automaticlyBasic = state
        AutoBasicUpgrade()
        wait ()
    else
        AutoFarm.automaticlyBasic = state
        wait ()
    end
end)
Section:NewToggle("Auto Faster Luck", "This will buy automaticly Faster \n luck Upgrade \n when you enough money", function(state)
    if state then
        AutoFarm.autoFasterLuck = state
        AutoFasterLuckN()
        wait ()
    else
        AutoFarm.automaticlautoFasterLuckyBasic = state
        wait ()
    end
end)
Section:NewToggle("Auto Better Luck", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.automaticlyBasic = state
        AutoBasicUpgrade()
        wait ()
    else
        AutoFarm.automaticlyBasic = state
        wait ()
    end
end)
local Section1 = Tab:NewSection("Auto Prestige")
Section1:NewToggle("Auto Prestige Normal", "This will buy automaticly Auto Prestige \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoPrestigE = state
        AutoPrestige()
        wait ()
    else
        AutoFarm.autoPrestigE = state
        wait ()
    end
end)
local PrestigeToggle = Section1:NewToggle("Auto Prestige When you will get:" .. (Prestige.LuckNeed), "This will do auto prestige \n when you will get needed Luck that u selected", function(state)
    if state then
        AutoFarm.autoPrestigeLuck = state
        AutoPrestigeLuckReq()
        wait ()
    else
        AutoFarm.autoPrestigeLuck = state
        wait ()
    end
end)

local LuckList = {
    "1";
    "2";
    "3";
    "4";
    "5";
    "6";
    "7";
    "8";
    "9";
    "10";
    "11";
    "12";
    "13";
    "14";
    "15";
}

local dropdown = Section1:NewDropdown("Select Luck","Select luck that you \n need for prestige", LuckList, function(currentOption)
    Prestige.LuckNeed = currentOption
    PrestigeToggle:UpdateToggle("Auto Prestige When you will get:" .. (Prestige.LuckNeed))
    wait ()
end)
function AutoBasicUpgrade()
while AutoFarm.automaticlyBasic do
    if AutoFarm.automaticlyBasic == true then
    BasicUpgrade:InvokeServer("BetterLuck")
    wait ()
    end
end
end
function AutoPrestige()
    while AutoFarm.autoPrestigE do
        if AutoFarm.autoPrestigE == true then
        PrestigeEvent:InvokeServer()
        wait()
        end
    end
end
function AutoPrestigeLuckReq()
while AutoFarm.autoPrestigeLuck do
    if AutoFarm.autoPrestigeLuck == true then
    for i,v in pairs(Lucks:GetChildren()) do
     if v.Name == Prestige.LuckNeed then
        for i2,v2 in pairs(v:GetChildren()) do
          if v2:IsA("NumberValue") and v2.Name == "Amount" then
            local LuckId = v2.Parent.Amount
                 if LuckId.Value >= 1 then
                     PrestigeEvent:InvokeServer()
                     wait ()
                else
                     wait()
                     -- nothing will happend but i can make Update Toggle or something
                end
            end
        end
    end
end
end
end
end
function AutoFasterLuckN()
    while AutoFarm.autoFasterLuck do
        if AutoFarm.autoFasterLuck == true then
        BasicUpgrade:InvokeServer("FasterLuck")
        wait()
        end
    end
end
