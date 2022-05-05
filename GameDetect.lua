repeat wait() until game:IsLoaded()
local PlayerService = game:GetService("Players")
local plr = PlayerService.LocalPlayer
local CoreGui = game:GetService("StarterGui")

local function getexploit()
    local exploit =
        (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
        (secure_load and "Sentinel") or
        (is_sirhurt_closure and "Sirhurt") or
        (pebc_execute and "ProtoSmasher") or
        (KRNL_LOADED and "Krnl") or
        (WrapGlobal and "WeAreDevs") or
        (isvm and "Proxo") or
        (shadow_env and "Shadow") or
        (jit and "EasyExploits") or
        (getreg()['CalamariLuaEnv'] and "Calamari") or
        (unit and "") or
        (IS_VIVA_LOADED and "VIVA") or
        (IS_COCO_LOADED and "Coco") or
        ("Undetectable")
 
    return exploit
end

if getexploit() then
CoreGui:SetCore("SendNotification", {
	Title = "Welcome ".. (plr.Name) .. "!";
	Text = "to JustAHub. Your exploit:" .. (getexploit()) .. "is supported";
	Duration = 5;
})
local gamesSupported = {
    [8438695556] = {
        ["name"] = "Luck Simulator - Better";
        ["function"] = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/LuckSimulatorBetter.lua"))()
        end
    },
}
if gamesSupported[game.PlaceId] then
    pcall(gamesSupported[game.PlaceId]["function"])
    CoreGui:SetCore("SendNotification", {
        Title = (gamesSupported[game.PlaceId]["name"]) .. "\n is supported";
        Text = "Executing script to it!";
        Duration = 5;
    })
    pcall(gamesSupported[game.PlaceId]["function"])
else
    pcall(gamesSupported[game.PlaceId]["function"])
    CoreGui:SetCore("SendNotification", {
        Title = "Your game is not supported";
        Text = "executing Universal script";
        Duration = 5;
    })
end
else
    warn("Your Exploit is not supported")
    warn("Your Exploit is not supported")
end
