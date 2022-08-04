local tbl = {
    "10475785213", -- // Circel
    "10475787657", -- // Square
    "10475788806", -- // Shadow
    "10477330253", -- // Full Circel
    "10477389259", -- // Gradient Plate
    "10477426603"  -- // Scroll Square
}

for i,v in pairs(tbl) do
    if getasset ~= nil and writefile ~= nil then
        if isfile("FludexHub/Assets/"..v..".png") then
            local url = "https://raw.githubusercontent.com/Woutt/FludexHub/main/Libex/Assets/"..v..".png"
            writefile("FludexHub/Assets/"..v..".png", game:HttpGet(url))
        end
    end
end

local GetAsset = function(x)
    local id = tbl[x]
    local AssetFunc = getsynasset or getcustomasset
    if AssetFunc ~= nil then
        return AssetFunc("FludexHub/Assets/"..id..".png")
    else
        return "rbxasset://"..id
    end
end
return GetAsset
