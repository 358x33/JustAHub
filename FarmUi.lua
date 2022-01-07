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
        wait (0.1)
    else
        AutoFarm.automaticlyBasic = state
        wait (0.1)
    end
end)
Section:NewToggle("Auto Faster Luck", "This will buy automaticly Faster \n luck Upgrade \n when you enough money", function(state)
    if state then
        AutoFarm.autoFasterLuck = state
        AutoFasterLuckN()
        wait (0.1)
    else
        AutoFarm.automaticlautoFasterLuckyBasic = state
        wait (0.1)
    end
end)
Section:NewToggle("Auto Better Luck", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.automaticlyBasic = state
        AutoBasicUpgrade()
        wait (0.1)
    else
        AutoFarm.automaticlyBasic = state
        wait (0.1)
    end
end)
local Section1 = Tab:NewSection("Auto Prestige")
Section1:NewToggle("Auto Prestige Normal", "This will buy automaticly Auto Prestige \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoPrestigE = state
        AutoPrestige()
        wait (0.1)
    else
        AutoFarm.autoPrestigE = state
        wait (0.1)
    end
end)
local PrestigeToggle = Section1:NewToggle("Auto Prestige When you will get:" .. (Prestige.LuckNeed), "This will do auto prestige \n when you will get needed Luck that u selected", function(state)
    if state then
        AutoFarm.autoPrestigeLuck = state
        AutoPrestigeLuckReq()
        wait (0.1)
    else
        AutoFarm.autoPrestigeLuck = state
        wait (0.1)
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
    wait (0.1)
end)
function AutoBasicUpgrade()
while AutoFarm.automaticlyBasic do
    if AutoFarm.automaticlyBasic == true then
    BasicUpgrade:InvokeServer("BetterLuck")
    wait (0.1)
    end
end
end
function AutoPrestige()
    while AutoFarm.autoPrestigE do
        if AutoFarm.autoPrestigE == true then
        PrestigeEvent:InvokeServer()
        wait(0.1)
        end
    end
end
function AutoPrestigeLuckReq()
wait (0.1)
while AutoFarm.autoPrestigeLuck do
    if AutoFarm.autoPrestigeLuck == true then
    for i,v in pairs(Lucks:GetChildren()) do
     if v.Name == Prestige.LuckNeed then
        for i2,v2 in pairs(v:GetChildren()) do
          if v2:IsA("NumberValue") and v2.Name == "Amount" then
            local LuckId = v2.Parent.Amount
                 if LuckId.Value >= 1 then
                     PrestigeEvent:InvokeServer()
                     wait (0.1)
                else
                     wait(0.1)
                end
            end
        end
    end
end
end
end
wait (0.1)
end
function AutoFasterLuckN()
    while AutoFarm.autoFasterLuck do
        if AutoFarm.autoFasterLuck == true then
        BasicUpgrade:InvokeServer("FasterLuck")
        wait(0.1)
        end
    end
end