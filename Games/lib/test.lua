if not game:IsLoaded() then
    repeat
        wait()
    until game:IsLoaded()
end
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait("0." .. math.random(1, 9))
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)
local a = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}
local b = {}
local c = {}
do
    function b:Create(d, e, f)
        local g = Instance.new(d)
        for h, i in pairs(e or {}) do
            g[h] = i
            if typeof(i) == "Color3" then
                local j = b:Find(a, i)
                if j then
                    c[j] = c[j] or {}
                    c[j][h] = c[j][h] or setmetatable({}, {_mode = "k"})
                    c[j][h][#c[j][h] + 1] = g
                end
            end
        end
        for h, k in pairs(f or {}) do
            k.Parent = g
        end
        return g
    end
    function b:Tween(d, e, l, ...)
        game:GetService("TweenService"):Create(d, TweenInfo.new(l, ...), e):Play()
    end
    function b:Wait()
        game:GetService("RunService").RenderStepped:Wait()
        return true
    end
    function b:Find(table, m)
        for h, i in pairs(table) do
            if i == m then
                return h
            end
        end
    end
    function b:Sort(n, o)
        local p = {}
        n = n:lower()
        if n == "" then
            return o
        end
        for h, m in pairs(o) do
            if tostring(m):lower():find(n) then
                p[#p + 1] = m
            end
        end
        return p
    end
    function b:Pop(g, q)
        local r = g:Clone()
        r.AnchorPoint = Vector2.new(0.5, 0.5)
        r.Size = r.Size - UDim2.new(0, q, 0, q)
        r.Position = UDim2.new(0.5, 0, 0.5, 0)
        r.Parent = g
        r:ClearAllChildren()
        g.ImageTransparency = 1
        b:Tween(r, {Size = g.Size}, 0.2)
        coroutine.wrap(
            function()
                wait(0.2)
                g.ImageTransparency = 0
                r:Destroy()
            end
        )()
        return r
    end
    function b:InitializeKeybind()
        self.keybinds = {}
        self.ended = {}
        game:GetService("UserInputService").InputBegan:Connect(
            function(s, t)
                if self.keybinds[s.KeyCode] then
                    for h, u in pairs(self.keybinds[s.KeyCode]) do
                        if u.gameProcessedEvent == t then
                            u.callback()
                        end
                    end
                end
            end
        )
        game:GetService("UserInputService").InputEnded:Connect(
            function(s)
                if s.UserInputType == Enum.UserInputType.MouseButton1 then
                    for h, v in pairs(self.ended) do
                        v()
                    end
                end
            end
        )
    end
    function b:BindToKey(s, v, t)
        self.keybinds[s] = self.keybinds[s] or {}
        self.keybinds[s][#self.keybinds[s] + 1] = {callback = v, gameProcessedEvent = t or false}
        return {
            UnBind = function()
                for h, u in pairs(self.keybinds[s]) do
                    if u == v then
                        table.remove(self.keybinds[s], h)
                    end
                end
            end
        }
    end
    function b:KeyPressed()
        local s = game:GetService("UserInputService").InputBegan:Wait()
        while s.UserInputType ~= Enum.UserInputType.Keyboard do
            s = game:GetService("UserInputService").InputBegan:Wait()
        end
        wait()
        return s
    end
    function b:DraggingEnabled(w, x)
        x = x or w
        local y = false
        local z, A, B
        w.InputBegan:Connect(
            function(C)
                if C.UserInputType == Enum.UserInputType.MouseButton1 then
                    y = true
                    A = C.Position
                    B = x.Position
                    C.Changed:Connect(
                        function()
                            if C.UserInputState == Enum.UserInputState.End then
                                y = false
                            end
                        end
                    )
                end
            end
        )
        w.InputChanged:Connect(
            function(C)
                if C.UserInputType == Enum.UserInputType.MouseMovement then
                    z = C
                end
            end
        )
        game:GetService("UserInputService").InputChanged:Connect(
            function(C)
                if C == z and y then
                    local D = C.Position - A
                    x.Position = UDim2.new(B.X.Scale, B.X.Offset + D.X, B.Y.Scale, B.Y.Offset + D.Y)
                end
            end
        )
    end
    function b:DraggingEnded(v)
        self.ended[#self.ended + 1] = v
    end
end
local E = {}
local F = {}
local function G(H, I)
    if H == true then
        getgenv().GetGuiName = game:GetService("HttpService"):GenerateGUID()
        return GetGuiName
    elseif H == false then
        local J = {}
        for h = 1, I do
            J[h] = string.char(math.random(32, 126))
        end
        getgenv().GetGuiName = table.concat(J)
        return GetGuiName
    end
end
local K = {}
do
    E.__index = E
    F.__index = F
    K.__index = K
    function E.new(L)
        local M = L[1] or "nil"
        local H = L[2] or false
        local N = L[3]
        if N ~= true and getgenv().GetGuiName ~= nil then
            wait(9e9)
            print("104 166,667 days later")
            return "ik am lazy, it works so why not lol"
        end
        local O =
            b:Create(
            "ScreenGui",
            {Name = G(H, math.random(10, 20)), Parent = game.CoreGui},
            {
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Main",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.25, 0, 0.052435593, 0),
                        Size = UDim2.new(0, 520, 0, 440),
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = a.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(4, 4, 296, 296)
                    },
                    {
                        b:Create(
                            "ImageLabel",
                            {
                                Name = "Glow",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, -15, 0, -15),
                                Size = UDim2.new(1, 30, 1, 30),
                                ZIndex = 0,
                                Image = "rbxassetid://5028857084",
                                ImageColor3 = a.Glow,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(24, 24, 276, 276)
                            }
                        ),
                        b:Create(
                            "ImageLabel",
                            {
                                Name = "Pages",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Position = UDim2.new(0, 0, 0, 38),
                                Size = UDim2.new(0, 126, 1, -38),
                                ZIndex = 3,
                                Image = "rbxassetid://5012534273",
                                ImageColor3 = a.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                b:Create(
                                    "ScrollingFrame",
                                    {
                                        Name = "Pages_Container",
                                        Active = true,
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0, 0, 0, 10),
                                        Size = UDim2.new(1, 0, 1, -20),
                                        CanvasSize = UDim2.new(0, 0, 0, 314),
                                        ScrollBarThickness = 0
                                    },
                                    {
                                        b:Create(
                                            "UIListLayout",
                                            {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)}
                                        )
                                    }
                                )
                            }
                        ),
                        b:Create(
                            "ImageLabel",
                            {
                                Name = "TopBar",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 0, 38),
                                ZIndex = 5,
                                Image = "rbxassetid://4595286933",
                                ImageColor3 = a.Accent,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                b:Create(
                                    "TextLabel",
                                    {
                                        Name = "Title",
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0, 12, 0, 19),
                                        Size = UDim2.new(1, -46, 0, 16),
                                        ZIndex = 5,
                                        Font = Enum.Font.GothamBold,
                                        Text = M,
                                        TextColor3 = a.TextColor,
                                        TextSize = 14,
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    }
                                )
                            }
                        )
                    }
                )
            }
        )
        b:InitializeKeybind()
        b:DraggingEnabled(O.Main.TopBar, O.Main)
        return setmetatable({container = O, pagesContainer = O.Main.Pages.Pages_Container, pages = {}}, E)
    end
    function F.new(E, M, P)
        local Q =
            b:Create(
            "TextButton",
            {
                Name = M,
                Parent = E.pagesContainer,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 26),
                ZIndex = 3,
                AutoButtonColor = false,
                Font = Enum.Font.Gotham,
                Text = "",
                TextSize = 14
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 40, 0.5, 0),
                        Size = UDim2.new(0, 76, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = M,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.65,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                P and
                    b:Create(
                        "ImageLabel",
                        {
                            Name = "Icon",
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 12, 0.5, 0),
                            Size = UDim2.new(0, 16, 0, 16),
                            ZIndex = 3,
                            Image = "http://www.roblox.com/asset/?id=" .. tostring(P),
                            ImageColor3 = a.TextColor,
                            ImageTransparency = 0.64
                        }
                    ) or
                    {}
            }
        )
        local O =
            b:Create(
            "ScrollingFrame",
            {
                Name = M,
                Parent = E.container.Main,
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 134, 0, 46),
                Size = UDim2.new(1, -142, 1, -56),
                CanvasSize = UDim2.new(0, 0, 0, 466),
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = a.DarkContrast,
                Visible = false
            },
            {b:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)})}
        )
        return setmetatable({library = E, container = O, button = Q, sections = {}}, F)
    end
    function K.new(F, M)
        local O =
            b:Create(
            "ImageLabel",
            {
                Name = M,
                Parent = F.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -10, 0, 28),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.LightContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ClipsDescendants = true
            },
            {
                b:Create(
                    "Frame",
                    {
                        Name = "Container",
                        Active = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 8, 0, 8),
                        Size = UDim2.new(1, -16, 1, -16)
                    },
                    {
                        b:Create(
                            "TextLabel",
                            {
                                Name = "Title",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Font = Enum.Font.GothamSemibold,
                                Text = M,
                                TextColor3 = a.TextColor,
                                TextSize = 12,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextTransparency = 1
                            }
                        ),
                        b:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)})
                    }
                )
            }
        )
        return setmetatable(
            {page = F, container = O.Container, colorpickers = {}, modules = {}, binds = {}, lists = {}},
            K
        )
    end
    function E:addPage(L)
        local M = L[1] or "nil"
        local P = tonumber(L[2])
        local R = F.new(self, M, P)
        local Q = R.button
        self.pages[#self.pages + 1] = R
        Q.MouseButton1Click:Connect(
            function()
                self:SelectPage({R, true})
            end
        )
        return R
    end
    function F:addSection(L)
        local M = L[1] or "nil"
        local S = K.new(self, M)
        self.sections[#self.sections + 1] = S
        return S
    end
    function E:setTheme(L)
        local j = L[1]
        local T = L[2]
        a[j] = T
        for U, c in pairs(c[j]) do
            for h, g in pairs(c) do
                if not g.Parent or g.Name == "Button" and g.Parent.Name == "ColorPicker" then
                    c[h] = nil
                else
                    g[U] = T
                end
            end
        end
    end
    function E:toggle()
        if self.toggling then
            return
        end
        self.toggling = true
        local O = self.container.Main
        local V = O.TopBar
        if self.position then
            b:Tween(O, {Size = UDim2.new(0, 511, 0, 428), Position = self.position}, 0.2)
            wait(0.2)
            b:Tween(V, {Size = UDim2.new(1, 0, 0, 38)}, 0.2)
            wait(0.2)
            O.ClipsDescendants = false
            self.position = nil
        else
            self.position = O.Position
            O.ClipsDescendants = true
            b:Tween(V, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            b:Tween(O, {Size = UDim2.new(0, 511, 0, 0), Position = self.position + UDim2.new(0, 0, 0, 428)}, 0.2)
            wait(0.2)
        end
        self.toggling = false
    end
    function E:Remove()
        self.container:Destroy()
        getgenv().GetGuiName = nil
    end
    function E:Notify(L)
        local M = L[1] or "nil"
        local W = L[2] or "nil"
        local v = L[3] or function()
            end
        if self.activeNotification then
            self.activeNotification = self.activeNotification()
        end
        local X =
            b:Create(
            "ImageLabel",
            {
                Name = "Notification",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 200, 0, 60),
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ZIndex = 3,
                ClipsDescendants = true
            },
            {
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Flash",
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = a.TextColor,
                        ZIndex = 5
                    }
                ),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = a.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(24, 24, 276, 276)
                    }
                ),
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.GothamSemibold,
                        TextColor3 = a.TextColor,
                        TextSize = 14.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "TextLabel",
                    {
                        Name = "Text",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 1, -24),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.Gotham,
                        TextColor3 = a.TextColor,
                        TextSize = 12.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageButton",
                    {
                        Name = "Accept",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538259",
                        ImageColor3 = a.TextColor,
                        ZIndex = 4
                    }
                ),
                b:Create(
                    "ImageButton",
                    {
                        Name = "Decline",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 1, -24),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = a.TextColor,
                        ZIndex = 4
                    }
                )
            }
        )
        b:DraggingEnabled(X)
        X.Title.Text = M
        X.Text.Text = W
        local Y = 10
        local Z = game:GetService("TextService"):GetTextSize(W, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))
        X.Position = E.lastNotification or UDim2.new(0, Y, 1, -(X.AbsoluteSize.Y + Y))
        X.Size = UDim2.new(0, 0, 0, 60)
        b:Tween(X, {Size = UDim2.new(0, Z.X + 70, 0, 60)}, 0.2)
        wait(0.2)
        X.ClipsDescendants = false
        b:Tween(X.Flash, {Size = UDim2.new(0, 0, 0, 60), Position = UDim2.new(1, 0, 0, 0)}, 0.2)
        local _ = true
        local a0 = function()
            if not _ then
                return
            end
            _ = false
            X.ClipsDescendants = true
            E.lastNotification = X.Position
            X.Flash.Position = UDim2.new(0, 0, 0, 0)
            b:Tween(X.Flash, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            b:Tween(X, {Size = UDim2.new(0, 0, 0, 60), Position = X.Position + UDim2.new(0, Z.X + 70, 0, 0)}, 0.2)
            wait(0.2)
            X:Destroy()
        end
        self.activeNotification = a0
        X.Accept.MouseButton1Click:Connect(
            function()
                if not _ then
                    return
                end
                if v then
                    v(true)
                end
                a0()
            end
        )
        X.Decline.MouseButton1Click:Connect(
            function()
                if not _ then
                    return
                end
                if v then
                    v(false)
                end
                a0()
            end
        )
    end
    function K:addButton(L)
        local a1 = {}
        a1.title = L[1] or "nil text"
        a1.callback = L[2] or function()
            end
        local Q =
            b:Create(
            "ImageButton",
            {
                Name = "Button",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012
                    }
                )
            }
        )
        local k = {Instance = Q, Options = a1}
        self.modules[#self.modules + 1] = k
        local W = Q.Title
        local a2
        Q.MouseButton1Click:Connect(
            function()
                if a2 then
                    return
                end
                b:Pop(Q, 10)
                a2 = true
                W.TextSize = 0
                b:Tween(Q.Title, {TextSize = 14}, 0.2)
                wait(0.2)
                b:Tween(Q.Title, {TextSize = 12}, 0.2)
                a1.callback()
                a2 = false
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if k.Options and typeof(h) == "number" then
                    k.Options[h] = tostring(i)
                end
            end
            return K:updateButton(k)
        end
        return k
    end
    function K:addToggle(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.toggled = L[2] or false
        a1.callback = L[3] or function()
            end
        local a4 =
            b:Create(
            "ImageButton",
            {
                Name = "Toggle",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -50, 0.5, -8),
                        Size = UDim2.new(0, 40, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = a.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        b:Create(
                            "ImageLabel",
                            {
                                Name = "Frame",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 2, 0.5, -6),
                                Size = UDim2.new(1, -22, 1, -4),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = a.TextColor,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = a4, Options = a1}
        self.modules[#self.modules + 1] = k
        self:updateToggle(k)
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if k.Options and typeof(h) == "number" then
                    if tonumber(h) == 1 then
                        k.Options.title = tostring(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.toggled = i
                    end
                end
            end
            a1.callback(k.Options.toggled)
            return K:updateToggle(k)
        end
        a4.MouseButton1Click:Connect(
            function()
                a1.toggled = not a1.toggled
                self:updateToggle(k)
                a1.callback(a1.toggled)
            end
        )
        return k
    end
    function K:addTextbox(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.default = L[2] or "nil"
        a1.callback = L[3] or function()
            end
        local a5 =
            b:Create(
            "ImageButton",
            {
                Name = "Textbox",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = a.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        b:Create(
                            "TextBox",
                            {
                                Name = "Textbox",
                                BackgroundTransparency = 1,
                                TextTruncate = Enum.TextTruncate.AtEnd,
                                Position = UDim2.new(0, 5, 0, 0),
                                Size = UDim2.new(1, -10, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.GothamSemibold,
                                Text = a1.default,
                                TextColor3 = a.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = a5, Options = a1}
        self.modules[#self.modules + 1] = k
        local Q = a5.Button
        local a6 = Q.Textbox
        a5.MouseButton1Click:Connect(
            function()
                if a5.Button.Size ~= UDim2.new(0, 100, 0, 16) then
                    return
                end
                b:Tween(a5.Button, {Size = UDim2.new(0, 200, 0, 16), Position = UDim2.new(1, -210, 0.5, -8)}, 0.2)
                wait()
                a6.TextXAlignment = Enum.TextXAlignment.Left
                a6:CaptureFocus()
            end
        )
        a6:GetPropertyChangedSignal("Text"):Connect(
            function()
                if
                    Q.ImageTransparency == 0 and
                        (Q.Size == UDim2.new(0, 200, 0, 16) or Q.Size == UDim2.new(0, 100, 0, 16))
                 then
                    b:Pop(Q, 10)
                end
                a1.callback(a6.Text)
            end
        )
        a6.FocusLost:Connect(
            function()
                a6.TextXAlignment = Enum.TextXAlignment.Center
                b:Tween(a5.Button, {Size = UDim2.new(0, 100, 0, 16), Position = UDim2.new(1, -110, 0.5, -8)}, 0.2)
                a1.callback(a6.Text, true)
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if k.Options and typeof(h) == "number" then
                    k.Options[h] = tostring(i)
                end
            end
            return K:updateTextbox(k)
        end
        return k
    end
    function K:addKeybind(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.key = L[2] or Enum.KeyCode.Unknown
        a1.callback = L[3] or function()
            end
        a1.changedCallback = L[4] or function()
            end
        a1.gameProcessedEvent = false
        local a7 =
            b:Create(
            "ImageButton",
            {
                Name = "Keybind",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = a.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        b:Create(
                            "TextLabel",
                            {
                                Name = "Text",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.GothamSemibold,
                                Text = game:GetService("UserInputService"):GetStringForKeyCode(a1.key),
                                TextColor3 = a.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = a7, Options = a1}
        self.modules[#self.modules + 1] = k
        local W = a7.Button.Text
        local Q = a7.Button
        local a8 = function()
            if Q.ImageTransparency == 0 then
                b:Pop(Q, 10)
            end
        end
        self.binds[a7] = {
            callback = function()
                a8()
                a1.callback()
            end
        }
        self:updateKeybind(k)
        a7.MouseButton1Click:Connect(
            function()
                a8()
                if self.binds[a7].connection then
                    a1.key = Enum.KeyCode.Unknown
                    return self:updateKeybind(k)
                end
                if W.Text == "Unknown" then
                    W.Text = "..."
                    a1.key = b:KeyPressed()
                    self:updateKeybind(k)
                    a8()
                    a1.changedCallback(a1.key)
                end
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if k.Options and typeof(h) == "number" then
                    if tonumber(h) == 1 then
                        k.Options.title = tostring(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.key = i
                    end
                end
            end
            return K:updateKeybind(k)
        end
        return k
    end
    function K:addColorPicker(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.default = L[2] or Color3.new(255, 150, 150)
        a1.callback = L[3] or function()
            end
        local a9 =
            b:Create(
            "ImageButton",
            {
                Name = "ColorPicker",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageButton",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -50, 0.5, -7),
                        Size = UDim2.new(0, 40, 0, 14),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = Color3.fromRGB(255, 255, 255),
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    }
                )
            }
        )
        local aa =
            b:Create(
            "ImageLabel",
            {
                Name = "ColorPicker",
                Parent = self.page.library.container,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.75, 0, 0.400000006, 0),
                Selectable = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.new(0, 162, 0, 169),
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298),
                Visible = false
            },
            {
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 0,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = a.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(22, 22, 278, 278)
                    }
                ),
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 2,
                        Font = Enum.Font.GothamSemibold,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "ImageButton",
                    {
                        Name = "Close",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = a.TextColor
                    }
                ),
                b:Create(
                    "Frame",
                    {
                        Name = "Container",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 8, 0, 32),
                        Size = UDim2.new(1, -18, 1, -40)
                    },
                    {
                        b:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}),
                        b:Create(
                            "ImageButton",
                            {
                                Name = "Canvas",
                                BackgroundTransparency = 1,
                                BorderColor3 = a.LightContrast,
                                Size = UDim2.new(1, 0, 0, 60),
                                AutoButtonColor = false,
                                Image = "rbxassetid://5108535320",
                                ImageColor3 = Color3.fromRGB(255, 0, 0),
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "White_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152351",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Black_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152095",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Cursor",
                                        BackgroundColor3 = a.TextColor,
                                        AnchorPoint = Vector2.new(0.5, 0.5),
                                        BackgroundTransparency = 1.000,
                                        Size = UDim2.new(0, 10, 0, 10),
                                        Position = UDim2.new(0, 0, 0, 0),
                                        Image = "rbxassetid://5100115962",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                )
                            }
                        ),
                        b:Create(
                            "ImageButton",
                            {
                                Name = "Color",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 0, 0, 4),
                                Selectable = false,
                                Size = UDim2.new(1, 0, 0, 16),
                                ZIndex = 2,
                                AutoButtonColor = false,
                                Image = "rbxassetid://5028857472",
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                b:Create(
                                    "Frame",
                                    {
                                        Name = "Select",
                                        BackgroundColor3 = a.TextColor,
                                        BorderSizePixel = 1,
                                        Position = UDim2.new(1, 0, 0, 0),
                                        Size = UDim2.new(0, 2, 1, 0),
                                        ZIndex = 2
                                    }
                                ),
                                b:Create(
                                    "UIGradient",
                                    {
                                        Color = ColorSequence.new(
                                            {
                                                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                                                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                                                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                                                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
                                                ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
                                                ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 255)),
                                                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
                                            }
                                        )
                                    }
                                )
                            }
                        ),
                        b:Create(
                            "Frame",
                            {
                                Name = "Inputs",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 10, 0, 158),
                                Size = UDim2.new(1, 0, 0, 16)
                            },
                            {
                                b:Create(
                                    "UIListLayout",
                                    {
                                        FillDirection = Enum.FillDirection.Horizontal,
                                        SortOrder = Enum.SortOrder.LayoutOrder,
                                        Padding = UDim.new(0, 6)
                                    }
                                ),
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "R",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = a.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        b:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "R:",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        b:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                PlaceholderColor3 = a.DarkContrast,
                                                Text = "255",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "G",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = a.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        b:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                ZIndex = 2,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                Font = Enum.Font.Gotham,
                                                Text = "G:",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        b:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "B",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = a.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        b:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "B:",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        b:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = a.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                )
                            }
                        ),
                        b:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = a.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                b:Create(
                                    "TextLabel",
                                    {
                                        Name = "Text",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 1, 0),
                                        ZIndex = 3,
                                        Font = Enum.Font.Gotham,
                                        Text = "Submit",
                                        TextColor3 = a.TextColor,
                                        TextSize = 11.000
                                    }
                                )
                            }
                        )
                    }
                )
            }
        )
        b:DraggingEnabled(aa)
        local k = {Instance = a9, Options = a1}
        self.modules[#self.modules + 1] = k
        local ab = {[""] = true}
        local ac = aa.Container.Canvas
        local ad = aa.Container.Color
        local ae, af = ac.AbsoluteSize, ac.AbsolutePosition
        local ag, ah = ad.AbsoluteSize, ad.AbsolutePosition
        local ai, aj
        local ak, al, am = 0, 0, 1
        local an = {r = 255, g = 255, b = 255}
        self.colorpickers[a9] = {
            tab = aa,
            callback = function(ao, m)
                an[ao] = m
                ak, al, am = Color3.toHSV(Color3.fromRGB(an.r, an.g, an.b))
            end
        }
        b:DraggingEnded(
            function()
                ai, aj = false, false
            end
        )
        self:updateColorPicker(k)
        ak, al, am = Color3.toHSV(a1.default)
        a1.default = Color3.fromHSV(ak, al, am)
        for h, ao in pairs({"r", "g", "b"}) do
            an[ao] = a1.default[ao:upper()] * 255
        end
        for h, O in pairs(aa.Container.Inputs:GetChildren()) do
            if O:IsA("ImageLabel") then
                local a5 = O.Textbox
                local ap
                a5.Focused:Connect(
                    function()
                        ap = true
                    end
                )
                a5.FocusLost:Connect(
                    function()
                        ap = false
                        if not tonumber(a5.Text) then
                            a5.Text = math.floor(an[O.Name:lower()])
                        end
                    end
                )
                a5:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        local W = a5.Text
                        if not ab[W] and not tonumber(W) then
                            a5.Text = W:sub(1, #W - 1)
                        elseif ap and not ab[W] then
                            an[O.Name:lower()] = math.clamp(tonumber(a5.Text), 0, 255)
                            a1.default = Color3.fromRGB(an.r, an.g, an.b)
                            ak, al, am = Color3.toHSV(a1.color3)
                            self:updateColorPicker(k)
                            a1.callback(a1.color3)
                        end
                    end
                )
            end
        end
        ac.MouseButton1Down:Connect(
            function()
                aj = true
                while aj do
                    local aq, ar = game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y
                    al = math.clamp((aq - af.X) / ae.X, 0, 1)
                    am = 1 - math.clamp((ar - af.Y) / ae.Y, 0, 1)
                    a1.color3 = Color3.fromHSV(ak, al, am)
                    for h, ao in pairs({"r", "g", "b"}) do
                        an[ao] = a1.color3[ao:upper()] * 255
                    end
                    a1.default = Color3.fromHSV(ak, al, am)
                    self:updateColorPicker(k)
                    b:Tween(ac.Cursor, {Position = UDim2.new(al, 0, 1 - am, 0)}, 0.1)
                    a1.callback(a1.color3)
                    b:Wait()
                end
            end
        )
        ad.MouseButton1Down:Connect(
            function()
                ai = true
                while ai do
                    ak = 1 - math.clamp(1 - (game.Players.LocalPlayer:GetMouse().X - ah.X) / ag.X, 0, 1)
                    a1.color3 = Color3.fromHSV(ak, al, am)
                    for h, ao in pairs({"r", "g", "b"}) do
                        an[ao] = a1.color3[ao:upper()] * 255
                    end
                    local aq = ak
                    a1.default = Color3.fromHSV(ak, al, am)
                    self:updateColorPicker(k)
                    b:Tween(aa.Container.Color.Select, {Position = UDim2.new(aq, 0, 0, 0)}, 0.1)
                    a1.callback(a1.color3)
                    b:Wait()
                end
            end
        )
        local Q = a9.Button
        local a4, a2, a8
        local as = Color3.fromHSV(ak, al, am)
        a8 = function(at, au)
            if au then
                if not a4 then
                    return
                end
                if a2 then
                    while a2 do
                        b:Wait()
                    end
                end
            elseif not au then
                if a2 then
                    return
                end
                if Q.ImageTransparency == 0 then
                    b:Pop(Q, 10)
                end
            end
            a4 = at
            a2 = true
            if at then
                if self.page.library.activePicker and self.page.library.activePicker ~= a8 then
                    self.page.library.activePicker(nil, true)
                end
                self.page.library.activePicker = a8
                as = Color3.fromHSV(ak, al, am)
                local av, aw = Q.AbsoluteSize.X / 2, 162
                local ax, ay = Q.AbsolutePosition.X, Q.AbsolutePosition.Y
                aa.ClipsDescendants = true
                aa.Visible = true
                aa.Size = UDim2.new(0, 0, 0, 0)
                aa.Position = UDim2.new(0, av + aw + ax, 0, ay)
                b:Tween(aa, {Size = UDim2.new(0, 162, 0, 169)}, 0.2)
                wait(0.2)
                aa.ClipsDescendants = false
                ae, af = ac.AbsoluteSize, ac.AbsolutePosition
                ag, ah = ad.AbsoluteSize, ad.AbsolutePosition
            else
                b:Tween(aa, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
                aa.ClipsDescendants = true
                wait(0.2)
                aa.Visible = false
            end
            a2 = false
        end
        local az = function()
            a8(not a4)
        end
        Q.MouseButton1Click:Connect(az)
        a9.MouseButton1Click:Connect(az)
        aa.Container.Button.MouseButton1Click:Connect(
            function()
                a8()
            end
        )
        aa.Close.MouseButton1Click:Connect(
            function()
                a1.default = as
                self:updateColorPicker(k)
                a8()
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if k.Options and typeof(h) == "number" then
                    if tonumber(h) == 1 then
                        k.Options.title = tostring(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.default = i
                    end
                end
            end
            return K:updateKeybind(k)
        end
        return k
    end
    function K:addSlider(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.default = tonumber(L[2]) or 0
        a1.min = tonumber(L[3]) or -50
        a1.max = tonumber(L[4]) or 50
        a1.callback = L[5] or function()
            end
        a1.precision = 0
        a1.value = a1.default
        local aA =
            b:Create(
            "ImageButton",
            {
                Name = "Slider",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0.292817682, 0, 0.299145311, 0),
                Size = UDim2.new(1, 0, 0, 50),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = a.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                b:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 6),
                        Size = UDim2.new(0.5, 0, 0, 16),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a1.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                b:Create(
                    "TextBox",
                    {
                        Name = "TextBox",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -30, 0, 6),
                        Size = UDim2.new(0, 20, 0, 16),
                        ZIndex = 3,
                        Font = Enum.Font.GothamSemibold,
                        Text = a1.default,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Right
                    }
                ),
                b:Create(
                    "TextLabel",
                    {
                        Name = "Slider",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 28),
                        Size = UDim2.new(1, -20, 0, 16),
                        ZIndex = 3,
                        Text = ""
                    },
                    {
                        b:Create(
                            "ImageLabel",
                            {
                                Name = "Bar",
                                AnchorPoint = Vector2.new(0, 0.5),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 0, 0.5, 0),
                                Size = UDim2.new(1, 0, 0, 4),
                                ZIndex = 3,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = a.LightContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                b:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Fill",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(0.8, 0, 1, 0),
                                        ZIndex = 3,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = a.TextColor,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        b:Create(
                                            "ImageLabel",
                                            {
                                                Name = "Circle",
                                                AnchorPoint = Vector2.new(0.5, 0.5),
                                                BackgroundTransparency = 1,
                                                ImageTransparency = 1.000,
                                                ImageColor3 = a.TextColor,
                                                Position = UDim2.new(1, 0, 0.5, 0),
                                                Size = UDim2.new(0, 10, 0, 10),
                                                ZIndex = 3,
                                                Image = "rbxassetid://4608020054"
                                            }
                                        )
                                    }
                                )
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = aA, Options = a1}
        self.modules[#self.modules + 1] = k
        local ab = {[""] = true, ["-"] = true}
        local a5 = aA.TextBox
        local aB = aA.Slider.Bar.Fill.Circle
        local y
        self:updateSlider(k)
        b:DraggingEnded(
            function()
                y = false
            end
        )
        aA.MouseButton1Down:Connect(
            function()
                y = true
                while y do
                    b:Tween(aB, {ImageTransparency = 0}, 0.1)
                    a1.value = nil
                    a1.value = self:updateSlider(k)
                    a1.callback(a1.value)
                    b:Wait()
                end
                wait(0.5)
                b:Tween(aB, {ImageTransparency = 1}, 0.2)
            end
        )
        a5.FocusLost:Connect(
            function()
                if not tonumber(a5.Text) then
                    a1.value = nil
                    a1.value = self:updateSlider(k)
                    a1.callback(a1.value)
                end
            end
        )
        a5:GetPropertyChangedSignal("Text"):Connect(
            function()
                local W = a5.Text
                if not ab[W] and not tonumber(W) then
                    a5.Text = W:sub(1, #W - 1)
                elseif not ab[W] then
                    a1.value = nil
                    a1.value = self:updateSlider(k)
                    a1.callback(a1.value)
                end
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                print(h, typeof(h))
                print(i, typeof(i))
                if k.Options and typeof(h) == "number" then
                    if tonumber(h) == 1 then
                        k.Options.title = tostring(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.default = tonumber(i)
                        k.Options.value = k.Options.default
                    end
                    if tonumber(h) == 2 then
                        k.Options.min = tonumber(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.max = tonumber(i)
                    end
                end
            end
            return K:updateKeybind(k)
        end
        return k
    end
    function K:addDropdown(L)
        local a1 = {}
        a1.title = L[1] or "nil"
        a1.list = L[2] or {}
        a1.callback = L[3] or function()
            end
        a1.default = nil
        a1.backuplist = nil
        local aC =
            b:Create(
            "Frame",
            {
                Name = "Dropdown",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                ClipsDescendants = true
            },
            {
                b:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "Search",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = a.DarkContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        b:Create(
                            "TextBox",
                            {
                                Name = "TextBox",
                                AnchorPoint = Vector2.new(0, 0.5),
                                BackgroundTransparency = 1,
                                TextTruncate = Enum.TextTruncate.AtEnd,
                                Position = UDim2.new(0, 10, 0.5, 1),
                                Size = UDim2.new(1, -42, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.Gotham,
                                Text = a1.title,
                                TextColor3 = a.TextColor,
                                TextSize = 12,
                                TextTransparency = 0.10000000149012,
                                TextXAlignment = Enum.TextXAlignment.Left
                            }
                        ),
                        b:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(1, -28, 0.5, -9),
                                Size = UDim2.new(0, 18, 0, 18),
                                ZIndex = 3,
                                Image = "rbxassetid://5012539403",
                                ImageColor3 = a.TextColor,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                ),
                b:Create(
                    "ImageLabel",
                    {
                        Name = "List",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, -34),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = a.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        b:Create(
                            "ScrollingFrame",
                            {
                                Name = "Frame",
                                Active = true,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(0, 4, 0, 4),
                                Size = UDim2.new(1, -8, 1, -8),
                                CanvasPosition = Vector2.new(0, 28),
                                CanvasSize = UDim2.new(0, 0, 0, 120),
                                ZIndex = 2,
                                ScrollBarThickness = 3,
                                ScrollBarImageColor3 = a.DarkContrast
                            },
                            {
                                b:Create(
                                    "UIListLayout",
                                    {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}
                                )
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = aC, Options = a1}
        self.modules[#self.modules + 1] = k
        local aD = aC.Search
        local ap
        for h, i in pairs(a1.list) do
            a1.list[h] = tostring(i)
        end
        aD.Button.MouseButton1Click:Connect(
            function()
                if aD.Button.Rotation == 0 then
                    a1.title = nil
                    self:updateDropdown(k)
                else
                    a1.title = nil
                    self:updateDropdown(k, {update = {}})
                end
            end
        )
        aD.TextBox.Focused:Connect(
            function()
                if aD.Button.Rotation == 0 then
                    a1.title = nil
                    self:updateDropdown(k, {update = {}})
                end
                ap = true
            end
        )
        aD.TextBox.FocusLost:Connect(
            function()
                ap = false
            end
        )
        aD.TextBox:GetPropertyChangedSignal("Text"):Connect(
            function()
                if ap then
                    local aE = b:Sort(aD.TextBox.Text, a1.list)
                    local aF = #aE ~= 0 and aE
                    a1.title = nil
                    self:updateDropdown(k, {update = aF})
                end
            end
        )
        aC:GetPropertyChangedSignal("Size"):Connect(
            function()
                self:Resize()
            end
        )
        function a1:Update(a3)
            for h, i in pairs(a3) do
                if h ~= "Update" and k.Options[h] then
                    if h == "list" then
                        for aG, aq in pairs(i) do
                            i[aG] = tostring(aq)
                        end
                    end
                    k.Options[h] = h == "list" and i or tostring(i)
                end
            end
            return K:updateDropdown(k, {noOpen = a3["list"]})
        end
        return k
    end
    function E:SelectPage(L)
        local aH = L[1]
        local a4 = L[2]
        if a4 and self.focusedPage == F then
            return
        end
        local Q = aH.button
        if a4 then
            Q.Title.TextTransparency = 0
            Q.Title.Font = Enum.Font.GothamSemibold
            if Q:FindFirstChild("Icon") then
                Q.Icon.ImageTransparency = 0
            end
            local aI = self.focusedPage
            self.focusedPage = aH
            if aI then
                self:SelectPage({aI})
            end
            local aJ = aI and #aI.sections or 0
            local aK = #aH.sections - aJ
            aH:Resize()
            for h = 1, #aH.sections do
                local aL = aH.sections[h]
                aL.container.Parent.ImageTransparency = 0
            end
            if aK < 0 then
                for h = aJ, #aH.sections + 1, -1 do
                    local aL = aI.sections[h].container.Parent
                    b:Tween(aL, {ImageTransparency = 1}, 0.1)
                end
            end
            wait(0.1)
            aH.container.Visible = true
            if aI then
                aI.container.Visible = false
            end
            if aK > 0 then
                for h = aJ + 1, #aH.sections do
                    local aL = aH.sections[h].container.Parent
                    aL.ImageTransparency = 1
                    b:Tween(aL, {ImageTransparency = 0}, 0.05)
                end
            end
            wait(0.05)
            for h = 1, #aH.sections do
                local aL = aH.sections[h]
                b:Tween(aL.container.Title, {TextTransparency = 0}, 0.1)
                aL:Resize(true)
                wait(0.05)
            end
            wait(0.05)
            aH:Resize(true)
        else
            Q.Title.Font = Enum.Font.Gotham
            Q.Title.TextTransparency = 0.65
            if Q:FindFirstChild("Icon") then
                Q.Icon.ImageTransparency = 0.65
            end
            for h = 1, #aH.sections do
                local aL = aH.sections[h]
                b:Tween(aL.container.Parent, {Size = UDim2.new(1, -10, 0, 28)}, 0.1)
                b:Tween(aL.container.Title, {TextTransparency = 1}, 0.1)
            end
            wait(0.1)
            aH.lastPosition = aH.container.CanvasPosition.Y
            aH:Resize()
        end
    end
    function F:Resize(aM)
        local Y = 10
        local aN = 0
        for h = 1, #self.sections do
            local aL = self.sections[h]
            aN = aN + aL.container.Parent.AbsoluteSize.Y + Y
        end
        self.container.CanvasSize = UDim2.new(0, 0, 0, aN)
        self.container.ScrollBarImageTransparency = aN > self.container.AbsoluteSize.Y
        if aM then
            b:Tween(self.container, {CanvasPosition = Vector2.new(0, self.lastPosition or 0)}, 0.2)
        end
    end
    function K:Resize(aO)
        if self.page.library.focusedPage ~= self.page then
            return
        end
        local Y = 4
        local aN = 4 * Y + self.container.Title.AbsoluteSize.Y
        for h, k in pairs(self.modules) do
            aN = aN + k.Instance.AbsoluteSize.Y + Y
        end
        if aO then
            b:Tween(self.container.Parent, {Size = UDim2.new(1, -10, 0, aN)}, 0.05)
        else
            self.container.Parent.Size = UDim2.new(1, -10, 0, aN)
            self.page:Resize()
        end
    end
    function K:getModule(aP)
        for h = 1, #self.modules do
            local k = self.modules[h]
            local g = k.Instance
            if (g:FindFirstChild("Title") or g:FindFirstChild("TextBox", true)).Text == aP or g == aP then
                return k
            end
        end
        error("No module found under " .. tostring(aP.Instance))
    end
    function K:updateButton(k)
        k.Instance.Title.Text = k.Options[1]
    end
    function K:updateToggle(k)
        local a4 = k.Instance
        local aQ = k.Options
        local aR = {In = UDim2.new(0, 2, 0.5, -6), Out = UDim2.new(0, 20, 0.5, -6)}
        local w = a4.Button.Frame
        local aS
        local aS = aQ.toggled and "Out" or "In"
        a4.Title.Text = aQ.title
        b:Tween(w, {Size = UDim2.new(1, -22, 1, -9), Position = aR[aS] + UDim2.new(0, 0, 0, 2.5)}, 0.2)
        wait(0.1)
        b:Tween(w, {Size = UDim2.new(1, -22, 1, -4), Position = aR[aS]}, 0.1)
    end
    function K:updateTextbox(k)
        k.Instance.Title.Text = k.Options[1]
        k.Instance.Button.Textbox.Text = k.Options[2]
    end
    function K:updateKeybind(k)
        local a7 = k.Instance
        local aQ = k.Options
        if typeof(aQ.key) == "Instance" and aQ.key:IsA("InputObject") then
            aQ.key = aQ.key.KeyCode
        end
        local W = a7.Button.Text
        local u = self.binds[a7]
        a7.Title.Text = k.Options.title
        if u.connection then
            u.connection = u.connection:UnBind()
        end
        if aQ.key ~= Enum.KeyCode.Unknown then
            self.binds[a7].connection = b:BindToKey(aQ.key, u.callback, aQ.gameProcessedEvent)
            W.Text = game:GetService("UserInputService"):GetStringForKeyCode(aQ.key)
        else
            W.Text = "Unknown"
        end
    end
    function K:updateColorPicker(k)
        local a9 = k.Instance
        local aQ = k.Options
        local aT = self.colorpickers[a9]
        local aa = aT.tab
        a9.Title.Text = aQ.title
        aa.Title.Text = aQ.title
        local T
        local ak, al, am
        if typeof(aQ.default) == "table" then
            ak, al, am = unpack(aQ.default)
            T = Color3.fromHSV(ak, al, am)
        else
            T = aQ.default
            ak, al, am = Color3.toHSV(T)
        end
        b:Tween(a9.Button, {ImageColor3 = T}, 0.5)
        b:Tween(aa.Container.Color.Select, {Position = UDim2.new(ak, 0, 0, 0)}, 0.1)
        b:Tween(aa.Container.Canvas, {ImageColor3 = Color3.fromHSV(ak, 1, 1)}, 0.5)
        b:Tween(aa.Container.Canvas.Cursor, {Position = UDim2.new(al, 0, 1 - am)}, 0.5)
        for h, O in pairs(aa.Container.Inputs:GetChildren()) do
            if O:IsA("ImageLabel") then
                local m = math.clamp(T[O.Name], 0, 1) * 255
                O.Textbox.Text = math.floor(m)
            end
        end
    end
    function K:updateSlider(k)
        local aA = k.Instance
        local aQ = k.Options
        aA.Title.Text = aQ.title
        local aU = aA.Slider.Bar
        local aV = (game.Players.LocalPlayer:GetMouse().X - aU.AbsolutePosition.X) / aU.AbsoluteSize.X
        if aQ.value then
            aV = (aQ.value - aQ.min) / (aQ.max - aQ.min)
        end
        local function aW(aX, aY)
            if aY == 0 then
                return math.floor(aX)
            elseif aY == -1 then
                return aX
            else
                return math.floor(aX * math.pow(10, aY) + 0.5) / math.pow(10, aY)
            end
        end
        aV = math.clamp(aV, 0, 1)
        aQ.value = aQ.value or aW(aQ.min + (aQ.max - aQ.min) * aV, aQ.precision)
        aA.TextBox.Text = aQ.value
        b:Tween(aU.Fill, {Size = UDim2.new(aV, 0, 1, 0)}, 0.1)
        if aQ.value ~= aQ.lvalue and aA.ImageTransparency == 0 then
            b:Pop(aA, 10)
        end
        return aQ.value
    end
    function K:updateDropdown(k, aZ)
        local aC = k.Instance
        local aQ = k.Options
        aZ = aZ or {}
        if aQ[1] then
            aC.Search.TextBox.Text = aQ[1]
        end
        local a_ = 0
        b:Pop(aC.Search, 10)
        for h, Q in pairs(aC.List.Frame:GetChildren()) do
            if Q:IsA("ImageButton") then
                Q:Destroy()
            end
        end
        local aF = aZ.update or aQ.list
        for h, m in pairs(aF) do
            local Q =
                b:Create(
                "ImageButton",
                {
                    Parent = aC.List.Frame,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                    ZIndex = 2,
                    Image = "rbxassetid://5028857472",
                    ImageColor3 = a.DarkContrast,
                    ScaleType = Enum.ScaleType.Slice,
                    SliceCenter = Rect.new(2, 2, 298, 298)
                },
                {
                    b:Create(
                        "TextLabel",
                        {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            ZIndex = 3,
                            Font = Enum.Font.Gotham,
                            Text = m,
                            TextColor3 = a.TextColor,
                            TextSize = 12,
                            TextXAlignment = "Left",
                            TextTransparency = 0.10000000149012
                        }
                    )
                }
            )
            Q.MouseButton1Click:Connect(
                function()
                    aQ.callback(m)
                    aQ[1] = m
                    self:updateDropdown(k, {update = m and {} or false})
                end
            )
            a_ = a_ + 1
        end
        local w = aC.List.Frame
        if not aZ.noOpen then
            b:Tween(aC, {Size = UDim2.new(1, 0, 0, a_ == 0 and 30 or math.clamp(a_, 0, 3) * 34 + 38)}, 0.3)
            b:Tween(aC.Search.Button, {Rotation = not aZ.update and 180 or 0}, 0.3)
        end
        if a_ > 3 then
            for h, Q in pairs(aC.List.Frame:GetChildren()) do
                if Q:IsA("ImageButton") then
                    Q.Size = UDim2.new(1, -6, 0, 30)
                end
            end
            w.CanvasSize = UDim2.new(0, 0, 0, a_ * 34 - 4)
            w.ScrollBarImageTransparency = 0
        else
            w.CanvasSize = UDim2.new(0, 0, 0, 0)
            w.ScrollBarImageTransparency = 1
        end
    end
end
return E
