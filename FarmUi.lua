repeat wait() until game:IsLoaded()
--// Services \\--
local playerService = game:GetService("Players")
local plr = playerService.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Player Info
local StatsFolder = ReplicatedStorage:WaitForChild("PlayerData")[plr.UserId]
local MainStats1 = StatsFolder:WaitForChild("Main")
local PlayerMainFolder = MainStats1:WaitForChild("MainStats")
local Lucks = MainStats1:WaitForChild("Lucks")
local GamepassFolder = MainStats1:WaitForChild("GamePasses")
-- Remotes
local RemoteFunctionsFolder = ReplicatedStorage:WaitForChild("RemoteFunctions")
local BasicUpgrade = RemoteFunctionsFolder:WaitForChild("BasicUpgrade")
local PrestigeEvent = RemoteFunctionsFolder:WaitForChild("Prestige")
local AutoTokenEvent = RemoteFunctionsFolder:WaitForChild("TokenUpgrade")
local BrickUpgrade = RemoteFunctionsFolder:WaitForChild("BrickUpgrade")
local BrickProduction = RemoteFunctionsFolder:WaitForChild("BrickProduction")
-- Version
local Version = loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/ScriptVersion"))()
print(Version.GetScriptVersion())
-- Tables 
local AutoFarm = {
    automaticlyBasic = false;
    autoPrestigE = false;
    autoPrestigeLuck = false;
    autoFasterLuck = false;
    autoRedLuck = false;
    autoRedMoreLuckGain = false;
    autoRedMoreMoneyProductionFromLucks = false;
    autoYellowLuck = false;
    autoYellowMoreLuckGain = false;
    autoYellowMoreMoneyProductionFromLucks = false;
    autoCollectMagnets = false;
    autoBrickLuck = false;
    autoBrickMagnet = false;
    autoMTBM = false;
    autoMTBMMagnetVersion = false;
    autoFasterMoney = false;
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
        AutoFarm.autoFasterLuck = state
        wait ()
    end
end)
Section:NewToggle("Auto Faster Money", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoFasterMoney = state
        AutoFasterMoney()
        wait ()
    else
        AutoFarm.autoFasterMoney = state
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
local Section2 = Tab:NewSection("Auto Red Token Upgrade")
Section2:NewToggle("[Red] Auto More Luck Chance", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoRedLuck = state
        AutoRedLuck()
        wait ()
    else
        AutoFarm.autoRedLuck = state
        wait ()
    end
end)
Section2:NewToggle("[Red] Auto More Luck Gain", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoRedMoreLuckGain = state
        AutoRedLuckGain()
        wait ()
    else
        AutoFarm.autoRedMoreLuckGain = state
        wait ()
    end
end)
Section2:NewToggle("[Red] Auto Money Production", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoRedMoreMoneyProductionFromLucks = state
        AutoRedMoneyProduction()
        wait ()
    else
        AutoFarm.autoRedMoreMoneyProductionFromLucks = state
        wait ()
    end
end)
local Section3 = Tab:NewSection("Auto Yellow Token Upgrade")
Section3:NewToggle("[Yellow] Auto More Luck Chance", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoYellowLuck = state
        AutoYellowLuck()
        wait ()
    else
        AutoFarm.autoYellowLuck = state
        wait ()
    end
end)
Section3:NewToggle("[Yellow] Auto More Luck Gain", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoYellowMoreLuckGain = state
        AutoYellowLuckGain()
        wait ()
    else
        AutoFarm.autoYellowMoreLuckGain = state
        wait ()
    end
end)
Section3:NewToggle("[Yellow] Auto Money Production", "This will buy automaticly Upgrade \n when you have needed amout of cash", function(state)
    if state then
        AutoFarm.autoYellowMoreMoneyProductionFromLucks = state
        AutoYellowMoneyProduction()
        wait ()
    else
        AutoFarm.autoYellowMoreMoneyProductionFromLucks = state
        wait ()
    end
end)
local Section4 = Tab:NewSection("Auto Collect Magnets")
Section4:NewToggle("Auto Collect magnets", "This will automaticly \n collect magnets for u", function(state)
    if state then
        AutoFarm.autoCollectMagnets = state
        AutoCollectMagnets()
        wait ()
    else
        AutoFarm.autoCollectMagnets = state
        wait ()
    end
end)
local Section5 = Tab:NewSection("Auto Bricks")
Section5:NewToggle("[Bricks] Auto Better Luck", "This will automaticly \n collect magnets for u", function(state)
    if state then
        AutoFarm.autoBrickLuck = state
        AutoBrickLuck()
        wait ()
    else
        AutoFarm.autoBrickLuck = state
        wait ()
    end
end)
Section5:NewToggle("[Bricks] Auto More Magnet", "This will automaticly \n collect magnets for u", function(state)
    if state then
        AutoFarm.autoBrickMagnet = state
        AutoBrickMoreMagnets()
        wait ()
    else
        AutoFarm.autoBrickMagnet = state
        wait ()
    end
end)
Section5:NewToggle("[Bricks] Monet to Brick Multi", "This will automaticly \n collect magnets for u", function(state)
    if state then
        AutoFarm.autoMTBM = state
        AutoMTBM()
        wait ()
    else
        AutoFarm.autoMTBM = state
        wait ()
    end
end)
Section5:NewToggle("[Bricks] Magnet to Brick Multi", "This will automaticly \n collect magnets for u", function(state)
    if state then
        AutoFarm.autoMTBMMagnetVersion = state
        AutoMTBMMagnetVersion()
        wait ()
    else
        AutoFarm.autoMTBMMagnetVersion = state
        wait ()
    end
end)
local Tab2 = Window:NewTab("Teleports")
local SectionV = Tab2:NewSection("Teleport to selected item")
local TPList = {
    "Leaderboard";
    "Shop";
    "Donate";
    "ServerMulti";
}
local Teleport = {
    SelectedWayPoint = Leaderboard;
}
local TeleporShow = SectionV:NewDropdown("Select Where to teleport","Select where u want to tp", TPList, function(currentOption)
    Teleport.SelectedWayPoint = currentOption
    TeleportToSelected()
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
function AutoFasterMoney()
    while AutoFarm.autoFasterMoney do
        if AutoFarm.autoFasterMoney == true then
        BasicUpgrade:InvokeServer("FasterMoney")
        wait()
        end
    end
end
function AutoRedLuck()
    while AutoFarm.autoRedLuck do
        if AutoFarm.autoRedLuck == true then
        AutoTokenEvent:InvokeServer("Red",1)
        wait ()
    end
end
end
function AutoRedLuckGain()
    while AutoFarm.autoRedMoreLuckGain do
        if AutoFarm.autoRedMoreLuckGain == true then
        AutoTokenEvent:InvokeServer("Red",2)
        wait ()
    end
end
end
function AutoRedMoneyProduction()
    while AutoFarm.autoRedMoreMoneyProductionFromLucks do
        if AutoFarm.autoRedMoreMoneyProductionFromLucks == true then
        AutoTokenEvent:InvokeServer("Red",3)
        wait ()
    end
end
end
function AutoYellowLuck()
    while AutoFarm.autoYellowLuck do
        if AutoFarm.autoYellowLuck == true then
        AutoTokenEvent:InvokeServer("Yellow",1)
        wait ()
    end
end
end
function AutoYellowLuckGain()
    while AutoFarm.autoYellowMoreLuckGain do
        if AutoFarm.autoYellowMoreLuckGain == true then
        AutoTokenEvent:InvokeServer("Yellow",2)
        wait ()
    end
end
end
function AutoYellowMoneyProduction()
    while AutoFarm.autoYellowMoreMoneyProductionFromLucks do
        if AutoFarm.autoYellowMoreMoneyProductionFromLucks == true then
        AutoTokenEvent:InvokeServer("Yellow",3)
        wait ()
    end
end
end
function TeleportToSelected()
   local TpToPart = Teleport.SelectedWayPoint
   local PlayerCframe = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

    if Teleport.SelectedWayPoint == "Leaderboard" then
        PlayerCframe.CFrame = CFrame.new(0.240956, 5.29937, 108.671)
    elseif Teleport.SelectedWayPoint == "Shop" then
        PlayerCframe.CFrame = CFrame.new(82.5545, 5.29937, 2.04031)
    elseif Teleport.SelectedWayPoint == "ServerMulti" then
        PlayerCframe.CFrame = CFrame.new(1.51779, 5.29937, -112.158)
    elseif Teleport.SelectedWayPoint == "Donate" then
        PlayerCframe.CFrame = CFrame.new(-104.272, 5.29937, -4.5429)
wait ()
end
end
function AutoCollectMagnets()
    while AutoFarm.autoCollectMagnets do
        if AutoFarm.autoCollectMagnets == true then
            game:GetService("ReplicatedStorage").RemoteFunctions.CollectGuiItem:InvokeServer(math.random(1, 240))
            wait (0.0001)
            -- credits to DCS
        end
     end
end
function AutoBrickLuck()
    while AutoFarm.autoBrickLuck do
        if AutoFarm.autoBrickLuck == true then
        BrickUpgrade:InvokeServer("BetterLuck")
        wait ()
    end
end
end
function AutoBrickMoreMagnets()
    while AutoFarm.autoBrickMagnet do
        if AutoFarm.autoBrickMagnet == true then
        BrickUpgrade:InvokeServer("MoreMagnets")
        wait ()
    end
end
end
function AutoMTBM()
    while AutoFarm.autoMTBM do
        if AutoFarm.autoMTBM == true then
        BrickProduction:InvokeServer("Money")
        wait ()
    end
end
end
function AutoMTBMMagnetVersion()
    while AutoFarm.autoMTBMMagnetVersion do
        if AutoFarm.autoMTBMMagnetVersion == true then
        BrickProduction:InvokeServer("Magnet")
        wait ()
    end
end
end
local Tab3 = Window:NewTab("Settings")
local SectionV3 = Tab3:NewSection("Settings")
SectionV3:NewKeybind("Toogle Ui", "Toggle ur Ui Visible", Enum.KeyCode.Z, function()
	Library:ToggleUI()
end)
SectionV3:NewButton("Infinite Yield", "Op Admin Commands", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
SectionV3:NewButton("CMD-X", "Op Admin Commands", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)
SectionV3:NewButton("Anti afk", "Just a anti afk", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
SectionV3:NewButton("Free Gamepasses I think", "Idk if it works", function()
    for i,v in pairs(GamepassFolder:GetChildren()) do
        v.Value = true
    end
end)
local Tab4 = Window:NewTab("Credits")
local SectionV2 = Tab4:NewSection("Credits")
SectionV2:NewLabel("Credits for 358x33 for all scripts")
SectionV2:NewLabel("Credits for DCS for collect magnet script")
SectionV2:NewLabel("Credits for xHeptc for Ui Libray")
SectionV2:NewLabel("Credits for kuds for helping")
SectionV2:NewLabel("Credits for Sigmarillion for anti afk script")
