

getgenv().settings = {
    TweenSpeed = 0.05,
}

getgenv().teleport = function(...)
    local TP, info = CFrame.new(...), TweenInfo.new(settings.TweenSpeed, Enum.EasingStyle.Linear)
    pcall(function()
        game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = TP}):Play()
        wait(settings.TweenSpeed)
    end)
end

getgenv().script_error = function(v)
    local datum = os.date("%Y/%m/%d")
    local time = os.date("%I:%M")
    local path = tostring("FludexHub/errors/"..datum)

    if not isfile(path) then 
        writefile(path, "") 
    end
    appendfile(path, "["..time.."] "..v)
end

getgenv().generate_string = function(v)
    local x = {}
    if v == nil then v = math.random(10,20) end
    for i = 1, v do
        x[i] = string.char(math.random(32, 126))
    end
    return table.concat(x)
end

getgenv().rejoin_server = function()
    if #game:GetService("Players"):GetPlayers() <= 1 then
        game:GetService("Players").LocalPlayer:Kick("\n\n\nRejoining server please wait :)\n\n\n") wait()
        game:GetService('TeleportService'):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    else
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
    end
end

getgenv().empty_server = function(x)
    local pageLimit = tonumber(x) or math.huge
    local minimum = math.huge
    local Page,nextCursor,serverId = 0,nil,nil
    repeat game:FindService("RunService").Heartbeat:Wait()
        local Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        if (nextCursor) then 
            Url = Url .. "&cursor=" .. nextCursor 
        end
        local Servers = game:GetService('HttpService'):JSONDecode(game:HttpGet(Url))
        if (Servers) then
            nextCursor = Servers.nextPageCursor or nil
            Page = Page + 1
            for _,v in pairs(Servers.data) do
                v.playing = v.playing or math.huge
                v.id = v.id or ''
                if v.id ~= game.JobId and v.playing <= minimum then 
                    minimum = v.playing
                    serverId = v.id
                end
            end
        end
    until (not nextCursor) or (Page >= pageLimit)
    if (serverId) then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverId)
    end
end

getgenv().discord_invite = function()
    local x = loadstring(game:HttpGet("https://raw.githubusercontent.com/Woutt/FludexHub/main/Misc/Settings.lua"))()["discord"]
    if (setclipboard) then
        local clipboard = write_clipboard or writeclipboard or setclipboard or set_clipboard
        clipboard("https://discord.gg/"..x["inv"])
    else
        return "https://discord.gg/"..x["inv"]
    end
    task.spawn(function()
        local req = syn.request or http_request or request or http.request or HttpPost or httprequest or nil
        if req ~= nil then
            for port=6463, 6472, 1 do
                local inv = "http://127.0.0.1:"..tostring(port).."/rpc?v=1"
                local http = game:GetService("HttpService")
                local t = {cmd = "INVITE_BROWSER", args = {["code"] = x["inv"]}, nonce = string.lower(http:GenerateGUID(false))}
                local post = http:JSONEncode(t)
                req({Url = inv, Method = "POST", Body = post, Headers = {["Content-Type"] = "application/json", ["Origin"] = "https://discord.com"}})
            end
        end
    end)
    return true
end
