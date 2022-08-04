local x = 
(syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
(KRNL_LOADED and "Krnl") or
(secure_load and issentinelclosure and "Sentinel") or
(getexecutorname and identifyexecutor and "Script-Ware") or

(isvm and "Proxo") or
(pebc_execute and pebc_create and "ProtoSmasher") or
(IsElectron and "Electron") or
(shadow_env and "Shadow") or
(OXYGEN_LOADED and "oxygen") or
(identifyexecutor and setfflag and getspecialinfo and not syn and dumpstring and "Temple") or 

(WrapGlobal and "WeAreDevs") or
(jit and "EasyExploits") or
(unit and "unit") or
(IS_VIVA_LOADED and "VIVA") or
(IS_COCO_LOADED and "Coco") or
(SONA_LOADED and "Sona") or
(is_sirhurt_closure and "Sirhurt") or
("Unknown")

local x = {["exploit"] = x,["function"] = nil}
if not (setclipboard) then table.insert(x["function"],"Misc Functions") end
if not (readfile and writefile and isfile, makefolder) then table.insert(x["function"],"Filesystem Functions") end
if not (hookfunction and hookmetamethod and newcclosure) then table.insert(x["function"],"Hooking Functions") end
if not (getgc and getinfo and getreg and getgenv and fireclickdetector and fireproximityprompt and getconnections) then table.insert(x["function"],"Environment Functions") end
if not (debug.setupvalue and debug.getregistry and debug.setmetatable and debug.setconstant and debug.setproto and debug.setstack) then table.insert(x["function"],"Debug Library") end
return x
