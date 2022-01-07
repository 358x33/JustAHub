repeat wait() until game:IsLoaded()
local PlaceId = game.PlaceId
local PlayerService = game:GetService("Players")
local plr = PlayerService.LocalPlayer

if PlaceId == 8438695556 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/FarmUi.lua"))()
else
    plr:kick("Wrong game")
end
