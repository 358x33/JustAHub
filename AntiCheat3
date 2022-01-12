local Bypass_Count = 0
if game:GetService("ReplicatedStorage").RemoteFunctions:FindFirstChild("Action") then
    for _, v in next, getconnections(game:GetService("ReplicatedStorage").RemoteFunctions.Action.AncestryChanged) do
        if pcall(function()
            v:Disable()
        end) then
            Bypass_Count += 1
        end
    end
end
if pcall(function()
    if Bypass_Count == 0 then return end
    game:GetService("ReplicatedStorage").RemoteFunctions.Action:Destroy()
end) then
    Bypass_Count += 1
end
local Anticheat_Env = require(game:GetService("ReplicatedStorage").Main)
hookfunction(Anticheat_Env.BanPlayer, function(...)
    wait(9e9)
end)
local __namecall
__namecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    if tostring(...) == 'AddLog' then
        wait(9e9)
    end
    if getnamecallmethod() == 'Kick' then
        wait(9e9)
    end
    if tostring(...) == 'Ban' then
        wait(9e9)
    end
    return __namecall(...)
end))
