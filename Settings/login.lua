local table = {
    [1] = "", --//test
    [2] = "o[tVTzrSQq]", --//op-slan in exploit
    [3] = "1865734982258", --//allen numbers
    [4] = "https://linktr.ee/Woutt",

    ["Get_Script"] = function() 
        local afs = {
            ["basic"] = {
                5445504800, --Tournament-Dimension
                4042427666, --Dimension-1
                5113678354, --Dimension-2
                5113680396, --Dimension-3
                5445525505, --Dimension-4
                6479720355, --Dimension-5
            },

            ["dungeons"] = {
                7220975160, --Dungeon-1
                7220986579, --Dungeon-2
            },

            ["bosses"] = {
                6479693773, --Inferno
                7220992373, --Akaza
                8436368941, --Rimumu-Boss
                6138035804, --Christmas-Boss
            },
        }

        if table.find(afs["basic"], game.PlaceId) then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Games/AFS_basic.lua"))()
        elseif table.find(afs["dungeons"], game.PlaceId) then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Games/AFS_dungeons.lua"))()
        elseif table.find(afs["bosses"], game.PlaceId) then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Games/AFS_bosses.lua"))()
        elseif 2202352383 == game.PlaceId then 
            loadstring(game:HttpGet(""))() --super power trainign sim
        end
    end,

    ["image"] = {
    	["background"] =    "http://www.roblox.com/asset/?id=8211657640",
    	["glow"] =          "http://www.roblox.com/asset/?id=8198465912",
    	["copy"] =          "http://www.roblox.com/asset/?id=8211721462",
    	["load"] =          "http://www.roblox.com/asset/?id=8197932333",
    	["lock"] =          "http://www.roblox.com/asset/?id=8198617824",
    },

    ["discord"] = {
    	["inv"] =   "tg9uymesSZ",
    	["owner"] = "Woutt#4106",
    },

    ["get_exploit"] = function()
        local checker =
    	--god exploits
            (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
            (KRNL_LOADED and "Krnl") or
            (secure_load and "Sentinel") or
    		(getexecutorname and identifyexecutor and "Script-Ware") or
    	--good exploits
    		(isvm and "Proxo") or
    		(pebc_execute and "ProtoSmasher") or
    		(IsElectron and "Electron") or
            (shadow_env and "Shadow") or
    		(OXYGEN_LOADED and "oxygen") or
    		(identifyexecutor and setfflag and getspecialinfo and not syn and dumpstring and "Temple") or 
    	--bad exploits lol
    		(WrapGlobal and "WeAreDevs") or
            (jit and "EasyExploits") or
            (unit and "unit") or
            (IS_VIVA_LOADED and "VIVA") or
            (IS_COCO_LOADED and "Coco") or
            (SONA_LOADED and "Sona") or
    		(is_sirhurt_closure and "Sirhurt") or
    	--didnt find
            ("Unknown")
        return checker
    end
}

return table
