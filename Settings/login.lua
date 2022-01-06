local table = {
    [1] = "u1t0h3y2b9s9l9o5b2g1b5b5o7m0t9i4y3n8h4y5s2y1i1s3z2", --//test
    [2] = "o[tVTzrSQq]", --//op-slan in exploit
    [3] = "1865734982258", --//allen numbers
    [4] = "controlc.com/1046025f", --//key website
    ["Get_Script"] = function() 
        if game.PlaceId == 5445504800 or game.PlaceId == 4042427666 or game.PlaceId == 5113678354 or game.PlaceId == 5113680396 or game.PlaceId == 5445525505 or game.PlaceId == 6479720355 then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Games/Anime_Fighting_Sim.lua"))()
        elseif game.PlaceId == 2202352383 then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Games/Super_Power_Training_Sim.lua"))()
        elseif game.PlaceId == 1 then
            loadstring(game:HttpGet(""))()
        else
            print("no game found")
        end
    end,
    ["image"] = {
    	["background"] = "http://www.roblox.com/asset/?id=8211657640",
    	["glow"] = "http://www.roblox.com/asset/?id=8198465912",
    	["copy"] = "http://www.roblox.com/asset/?id=8211721462",
    	["load"] = "http://www.roblox.com/asset/?id=8197932333",
    	["lock"] = "http://www.roblox.com/asset/?id=8198617824",
    },
    ["discord"] = {
    	["inv"] = "tg9uymesSZ",
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
