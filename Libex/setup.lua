local tbl = {
    "10475785213", -- // circel
    "10475787657", -- // square
    "10475788806"  -- // shadow
}

for i,v in pairs(tbl) do
    if getasset ~= nil and writefile ~= nil then
        local url = "https://raw.githubusercontent.com/Woutt/FludexHub/main/Libex/Assets/10475785213.png"
        writefile("FludexHub/Assets/"..v..".png", game:HttpGet(url))
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
