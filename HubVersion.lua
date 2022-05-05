local ScriptVersion = {}

function ScriptVersion.GetScriptVersion(scriptVersion)
    local Version = "1.0.5"
    local scriptVersion = scriptVersion
    
    if scriptVersion == Version then
        return Version
    else
        game:GetService("Players")["LocalPlayer"]:kick("You are using outdated version of this scripts") -- Method 1
        --[[
        Method 2:
        You can make a feature to kill your old Gui and this will open you a Updated version of your script.                
        How to use this feature?
        
        First we need to get loadstring of this:
        local Version = loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/HubVersion.lua"))() -- You can change it to your own File
        Next we need to call the function
        local GetTrueVersion = Version.GetScriptVersion(1.0.5) 
        
        The version that we gave to the function is the same as version here. That's mean that nothing will happend. I mean your script is up to date!
        If your wrote something like this:
        local GetTrueVersion = Version.GetScriptVersion(1.0.4)
        Then you would get kicked
        
        Also when player execute older version of this script. You can give him up to date version. To be honest you can remove scriptVersion ( GetScriptVersion(scriptVersion) )
        And just get Version of the script. You can make that in script. And use this to get the Version of the hub
        
        Also you can make Update Log. After Hub will be re-opened with new Version. The gui will pop up with update log. You can get update log by doing this:
        
        local UpdateLog = "BugFixes, Lag Fixes, New Feature"
        return UpdateLog
        
        This will give you full updateLog
        Thanks for using I hope that i helped!
        
        also you can return in "else" segment False
        
        else
        return "False"
        
        And kick player or re-inject it in main script
        
        Main Script wold look like that
        local Version = loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/HubVersion.lua"))()
        local scriptVersionAAAAA = "1.0.4"
        
        local GetVersion = Version.GetScriptVersion(scriptVersionAAAAA)
        
        if GetVersion == false then
            player:kick()
        end
        
        or second Method:
        local Version = loadstring(game:HttpGet("https://raw.githubusercontent.com/358x33/JustAHub/main/HubVersion.lua"))()
        local scriptVersionAAAAA = "1.0.4"
        Version.GetScriptVersion(scriptVersionAAAAA)
        
        if Version.GetScriptVersion(scriptVersionAAAAA) == false then
            player:kick()
        end
        
        --]]
    end
end

return ScriptVersion
