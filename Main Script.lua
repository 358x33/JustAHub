local PlaceId = game.PlaceId
local PlayerService = game:GetService("Players")
local plr = PlayerService.LocalPlayer

if PlaceId == 8438695556 then
    if not game:IsLoaded() then
        game.Loaded:Wait()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/FarmUi.lua"))()
    end
else
    plr:kick("Wrong game")
end
