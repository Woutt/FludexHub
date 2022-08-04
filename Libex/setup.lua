local tbl = {
    10475785213, -- // circel
    10475787657, -- // square
    10475788806  -- // shadow
}

local getasset = getsynasset or getcustomasset 
for i,v in pairs(tbl) do
    if getasset ~= nil and writefile ~= nil then
        local url = "https://raw.githubusercontent.com/Woutt/FludexHub/main/Libex/Assets/10475785213.png"
        writefile(tostring(v)..".png", game:HttpGet(url))
    end
end

return tbl
