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
        return {UnBind = function()
                for h, u in pairs(self.keybinds[s]) do
                    if u == v then
                        table.remove(self.keybinds[s], h)
                    end
                end
            end}
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
        if getgenv().GetGuiName and L[3] ~= true then
            wait(9e9)
            print("104 166,667 days later...")
        end
        local N =
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
        b:DraggingEnabled(N.Main.TopBar, N.Main)
        return setmetatable({container = N, pagesContainer = N.Main.Pages.Pages_Container, pages = {}}, E)
    end
    function F.new(E, M, O)
        local P =
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
                O and
                    b:Create(
                        "ImageLabel",
                        {
                            Name = "Icon",
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 12, 0.5, 0),
                            Size = UDim2.new(0, 16, 0, 16),
                            ZIndex = 3,
                            Image = "http://www.roblox.com/asset/?id=" .. tostring(O),
                            ImageColor3 = a.TextColor,
                            ImageTransparency = 0.64
                        }
                    ) or
                    {}
            }
        )
        local N =
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
        return setmetatable({library = E, container = N, button = P, sections = {}}, F)
    end
    function K.new(F, M)
        local N =
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
            {page = F, container = N.Container, colorpickers = {}, modules = {}, binds = {}, lists = {}},
            K
        )
    end
    function E:addPage(L)
        local M = L[1] or "nil"
        local O = tonumber(L[2])
        local Q = F.new(self, M, O)
        local P = Q.button
        self.pages[#self.pages + 1] = Q
        P.MouseButton1Click:Connect(
            function()
                self:SelectPage({Q, true})
            end
        )
        return Q
    end
    function F:addSection(L)
        local M = L[1] or "nil"
        local R = K.new(self, M)
        self.sections[#self.sections + 1] = R
        return R
    end
    function E:setTheme(L)
        local j = L[1]
        local S = L[2]
        a[j] = S
        for T, c in pairs(c[j]) do
            for h, g in pairs(c) do
                if not g.Parent or g.Name == "Button" and g.Parent.Name == "ColorPicker" then
                    c[h] = nil
                else
                    g[T] = S
                end
            end
        end
    end
    function E:toggle()
        if self.toggling then
            return
        end
        self.toggling = true
        local N = self.container.Main
        local U = N.TopBar
        if self.position then
            b:Tween(N, {Size = UDim2.new(0, 511, 0, 428), Position = self.position}, 0.2)
            wait(0.2)
            b:Tween(U, {Size = UDim2.new(1, 0, 0, 38)}, 0.2)
            wait(0.2)
            N.ClipsDescendants = false
            self.position = nil
        else
            self.position = N.Position
            N.ClipsDescendants = true
            b:Tween(U, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            b:Tween(N, {Size = UDim2.new(0, 511, 0, 0), Position = self.position + UDim2.new(0, 0, 0, 428)}, 0.2)
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
        local V = L[2] or "nil"
        local v = L[3] or function()
            end
        if self.activeNotification then
            self.activeNotification = self.activeNotification()
        end
        local W =
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
        b:DraggingEnabled(W)
        W.Title.Text = M
        W.Text.Text = V
        local X = 10
        local Y = game:GetService("TextService"):GetTextSize(V, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))
        W.Position = E.lastNotification or UDim2.new(0, X, 1, -(W.AbsoluteSize.Y + X))
        W.Size = UDim2.new(0, 0, 0, 60)
        b:Tween(W, {Size = UDim2.new(0, Y.X + 70, 0, 60)}, 0.2)
        wait(0.2)
        W.ClipsDescendants = false
        b:Tween(W.Flash, {Size = UDim2.new(0, 0, 0, 60), Position = UDim2.new(1, 0, 0, 0)}, 0.2)
        local Z = true
        local _ = function()
            if not Z then
                return
            end
            Z = false
            W.ClipsDescendants = true
            E.lastNotification = W.Position
            W.Flash.Position = UDim2.new(0, 0, 0, 0)
            b:Tween(W.Flash, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            b:Tween(W, {Size = UDim2.new(0, 0, 0, 60), Position = W.Position + UDim2.new(0, Y.X + 70, 0, 0)}, 0.2)
            wait(0.2)
            W:Destroy()
        end
        self.activeNotification = _
        W.Accept.MouseButton1Click:Connect(
            function()
                if not Z then
                    return
                end
                if v then
                    v(true)
                end
                _()
            end
        )
        W.Decline.MouseButton1Click:Connect(
            function()
                if not Z then
                    return
                end
                if v then
                    v(false)
                end
                _()
            end
        )
    end
    function K:addButton(L)
        local a0 = {}
        a0.title = L[1] or "nil text"
        a0.callback = L[2] or function()
            end
        local P =
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
                        Text = a0.title,
                        TextColor3 = a.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012
                    }
                )
            }
        )
        local k = {Instance = P, Options = a0}
        self.modules[#self.modules + 1] = k
        local V = P.Title
        local a1
        P.MouseButton1Click:Connect(
            function()
                if a1 then
                    return
                end
                b:Pop(P, 10)
                a1 = true
                V.TextSize = 0
                b:Tween(P.Title, {TextSize = 14}, 0.2)
                wait(0.2)
                b:Tween(P.Title, {TextSize = 12}, 0.2)
                a0.callback()
                a1 = false
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
                if k.Options and typeof(h) == "number" then
                    k.Options[h] = tostring(i)
                end
            end
            return K:updateButton(k)
        end
        return k
    end
    function K:addToggle(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.toggled = L[2] or false
        a0.callback = L[3] or function()
            end
        local a3 =
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
                        Text = a0.title,
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
        local k = {Instance = a3, Options = a0}
        self.modules[#self.modules + 1] = k
        self:updateToggle(k)
        function a0:Update(a2)
            for h, i in pairs(a2) do
                if k.Options and typeof(h) == "number" then
                    if tonumber(h) == 1 then
                        k.Options.title = tostring(i)
                    end
                    if tonumber(h) == 2 then
                        k.Options.toggled = i
                    end
                end
            end
            a0.callback(k.Options.toggled)
            return K:updateToggle(k)
        end
        a3.MouseButton1Click:Connect(
            function()
                a0.toggled = not a0.toggled
                self:updateToggle(k)
                a0.callback(a0.toggled)
            end
        )
        return k
    end
    function K:addTextbox(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.default = L[2] or "nil"
        a0.callback = L[3] or function()
            end
        local a4 =
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
                        Text = a0.title,
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
                                Text = a0.default,
                                TextColor3 = a.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = a4, Options = a0}
        self.modules[#self.modules + 1] = k
        local P = a4.Button
        local a5 = P.Textbox
        a4.MouseButton1Click:Connect(
            function()
                if a4.Button.Size ~= UDim2.new(0, 100, 0, 16) then
                    return
                end
                b:Tween(a4.Button, {Size = UDim2.new(0, 200, 0, 16), Position = UDim2.new(1, -210, 0.5, -8)}, 0.2)
                wait()
                a5.TextXAlignment = Enum.TextXAlignment.Left
                a5:CaptureFocus()
            end
        )
        a5:GetPropertyChangedSignal("Text"):Connect(
            function()
                if
                    P.ImageTransparency == 0 and
                        (P.Size == UDim2.new(0, 200, 0, 16) or P.Size == UDim2.new(0, 100, 0, 16))
                 then
                    b:Pop(P, 10)
                end
                a0.callback(a5.Text)
            end
        )
        a5.FocusLost:Connect(
            function()
                a5.TextXAlignment = Enum.TextXAlignment.Center
                b:Tween(a4.Button, {Size = UDim2.new(0, 100, 0, 16), Position = UDim2.new(1, -110, 0.5, -8)}, 0.2)
                a0.callback(a5.Text, true)
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
                if k.Options and typeof(h) == "number" then
                    k.Options[h] = tostring(i)
                end
            end
            return K:updateTextbox(k)
        end
        return k
    end
    function K:addKeybind(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.key = L[2] or Enum.KeyCode.Unknown
        a0.callback = L[3] or function()
            end
        a0.changedCallback = L[4] or function()
            end
        a0.gameProcessedEvent = false
        local a6 =
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
                        Text = a0.title,
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
                                Text = game:GetService("UserInputService"):GetStringForKeyCode(a0.key),
                                TextColor3 = a.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local k = {Instance = a6, Options = a0}
        self.modules[#self.modules + 1] = k
        local V = a6.Button.Text
        local P = a6.Button
        local a7 = function()
            if P.ImageTransparency == 0 then
                b:Pop(P, 10)
            end
        end
        self.binds[a6] = {callback = function()
                a7()
                a0.callback()
            end}
        self:updateKeybind(k)
        a6.MouseButton1Click:Connect(
            function()
                a7()
                if self.binds[a6].connection then
                    a0.key = Enum.KeyCode.Unknown
                    return self:updateKeybind(k)
                end
                if V.Text == "Unknown" then
                    V.Text = "..."
                    a0.key = b:KeyPressed()
                    self:updateKeybind(k)
                    a7()
                    a0.changedCallback(a0.key)
                end
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
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
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.default = L[2] or Color3.new(255, 150, 150)
        a0.callback = L[3] or function()
            end
        local a8 =
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
                        Text = a0.title,
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
        local a9 =
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
                        Text = a0.title,
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
        b:DraggingEnabled(a9)
        local k = {Instance = a8, Options = a0}
        self.modules[#self.modules + 1] = k
        local aa = {[""] = true}
        local ab = a9.Container.Canvas
        local ac = a9.Container.Color
        local ad, ae = ab.AbsoluteSize, ab.AbsolutePosition
        local af, ag = ac.AbsoluteSize, ac.AbsolutePosition
        local ah, ai
        local aj, ak, al = 0, 0, 1
        local am = {r = 255, g = 255, b = 255}
        self.colorpickers[a8] = {tab = a9, callback = function(an, m)
                am[an] = m
                aj, ak, al = Color3.toHSV(Color3.fromRGB(am.r, am.g, am.b))
            end}
        b:DraggingEnded(
            function()
                ah, ai = false, false
            end
        )
        self:updateColorPicker(k)
        aj, ak, al = Color3.toHSV(a0.default)
        a0.default = Color3.fromHSV(aj, ak, al)
        for h, an in pairs({"r", "g", "b"}) do
            am[an] = a0.default[an:upper()] * 255
        end
        for h, N in pairs(a9.Container.Inputs:GetChildren()) do
            if N:IsA("ImageLabel") then
                local a4 = N.Textbox
                local ao
                a4.Focused:Connect(
                    function()
                        ao = true
                    end
                )
                a4.FocusLost:Connect(
                    function()
                        ao = false
                        if not tonumber(a4.Text) then
                            a4.Text = math.floor(am[N.Name:lower()])
                        end
                    end
                )
                a4:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        local V = a4.Text
                        if not aa[V] and not tonumber(V) then
                            a4.Text = V:sub(1, #V - 1)
                        elseif ao and not aa[V] then
                            am[N.Name:lower()] = math.clamp(tonumber(a4.Text), 0, 255)
                            a0.default = Color3.fromRGB(am.r, am.g, am.b)
                            aj, ak, al = Color3.toHSV(a0.color3)
                            self:updateColorPicker(k)
                            a0.callback(a0.color3)
                        end
                    end
                )
            end
        end
        ab.MouseButton1Down:Connect(
            function()
                ai = true
                while ai do
                    local ap, aq = game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y
                    ak = math.clamp((ap - ae.X) / ad.X, 0, 1)
                    al = 1 - math.clamp((aq - ae.Y) / ad.Y, 0, 1)
                    a0.color3 = Color3.fromHSV(aj, ak, al)
                    for h, an in pairs({"r", "g", "b"}) do
                        am[an] = a0.color3[an:upper()] * 255
                    end
                    a0.default = Color3.fromHSV(aj, ak, al)
                    self:updateColorPicker(k)
                    b:Tween(ab.Cursor, {Position = UDim2.new(ak, 0, 1 - al, 0)}, 0.1)
                    a0.callback(a0.color3)
                    b:Wait()
                end
            end
        )
        ac.MouseButton1Down:Connect(
            function()
                ah = true
                while ah do
                    aj = 1 - math.clamp(1 - (game.Players.LocalPlayer:GetMouse().X - ag.X) / af.X, 0, 1)
                    a0.color3 = Color3.fromHSV(aj, ak, al)
                    for h, an in pairs({"r", "g", "b"}) do
                        am[an] = a0.color3[an:upper()] * 255
                    end
                    local ap = aj
                    a0.default = Color3.fromHSV(aj, ak, al)
                    self:updateColorPicker(k)
                    b:Tween(a9.Container.Color.Select, {Position = UDim2.new(ap, 0, 0, 0)}, 0.1)
                    a0.callback(a0.color3)
                    b:Wait()
                end
            end
        )
        local P = a8.Button
        local a3, a1, a7
        local ar = Color3.fromHSV(aj, ak, al)
        a7 = function(as, at)
            if at then
                if not a3 then
                    return
                end
                if a1 then
                    while a1 do
                        b:Wait()
                    end
                end
            elseif not at then
                if a1 then
                    return
                end
                if P.ImageTransparency == 0 then
                    b:Pop(P, 10)
                end
            end
            a3 = as
            a1 = true
            if as then
                if self.page.library.activePicker and self.page.library.activePicker ~= a7 then
                    self.page.library.activePicker(nil, true)
                end
                self.page.library.activePicker = a7
                ar = Color3.fromHSV(aj, ak, al)
                local au, av = P.AbsoluteSize.X / 2, 162
                local aw, ax = P.AbsolutePosition.X, P.AbsolutePosition.Y
                a9.ClipsDescendants = true
                a9.Visible = true
                a9.Size = UDim2.new(0, 0, 0, 0)
                a9.Position = UDim2.new(0, au + av + aw, 0, ax)
                b:Tween(a9, {Size = UDim2.new(0, 162, 0, 169)}, 0.2)
                wait(0.2)
                a9.ClipsDescendants = false
                ad, ae = ab.AbsoluteSize, ab.AbsolutePosition
                af, ag = ac.AbsoluteSize, ac.AbsolutePosition
            else
                b:Tween(a9, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
                a9.ClipsDescendants = true
                wait(0.2)
                a9.Visible = false
            end
            a1 = false
        end
        local ay = function()
            a7(not a3)
        end
        P.MouseButton1Click:Connect(ay)
        a8.MouseButton1Click:Connect(ay)
        a9.Container.Button.MouseButton1Click:Connect(
            function()
                a7()
            end
        )
        a9.Close.MouseButton1Click:Connect(
            function()
                a0.default = ar
                self:updateColorPicker(k)
                a7()
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
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
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.default = tonumber(L[2]) or 0
        a0.min = tonumber(L[3]) or -50
        a0.max = tonumber(L[4]) or 50
        a0.callback = L[5] or function()
            end
        a0.precision = 0
        a0.value = a0.default
        local az =
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
                        Text = a0.title,
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
                        Text = a0.default,
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
        local k = {Instance = az, Options = a0}
        self.modules[#self.modules + 1] = k
        local aa = {[""] = true, ["-"] = true}
        local a4 = az.TextBox
        local aA = az.Slider.Bar.Fill.Circle
        local y
        self:updateSlider(k)
        b:DraggingEnded(
            function()
                y = false
            end
        )
        az.MouseButton1Down:Connect(
            function()
                y = true
                while y do
                    b:Tween(aA, {ImageTransparency = 0}, 0.1)
                    a0.value = nil
                    a0.value = self:updateSlider(k)
                    a0.callback(a0.value)
                    b:Wait()
                end
                wait(0.5)
                b:Tween(aA, {ImageTransparency = 1}, 0.2)
            end
        )
        a4.FocusLost:Connect(
            function()
                if not tonumber(a4.Text) then
                    a0.value = nil
                    a0.value = self:updateSlider(k)
                    a0.callback(a0.value)
                end
            end
        )
        a4:GetPropertyChangedSignal("Text"):Connect(
            function()
                local V = a4.Text
                if not aa[V] and not tonumber(V) then
                    a4.Text = V:sub(1, #V - 1)
                elseif not aa[V] then
                    a0.value = nil
                    a0.value = self:updateSlider(k)
                    a0.callback(a0.value)
                end
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
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
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.list = L[2] or {}
        a0.callback = L[3] or function()
            end
        a0.default = nil
        a0.backuplist = nil
        local aB =
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
                                Text = a0.title,
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
        local k = {Instance = aB, Options = a0}
        self.modules[#self.modules + 1] = k
        local aC = aB.Search
        local ao
        for h, i in pairs(a0.list) do
            a0.list[h] = tostring(i)
        end
        aC.Button.MouseButton1Click:Connect(
            function()
                if aC.Button.Rotation == 0 then
                    a0.title = nil
                    self:updateDropdown(k)
                else
                    a0.title = nil
                    self:updateDropdown(k, {update = {}})
                end
            end
        )
        aC.TextBox.Focused:Connect(
            function()
                if aC.Button.Rotation == 0 then
                    a0.title = nil
                    self:updateDropdown(k, {update = {}})
                end
                ao = true
            end
        )
        aC.TextBox.FocusLost:Connect(
            function()
                ao = false
            end
        )
        aC.TextBox:GetPropertyChangedSignal("Text"):Connect(
            function()
                if ao then
                    local aD = b:Sort(aC.TextBox.Text, a0.list)
                    local aE = #aD ~= 0 and aD
                    a0.title = nil
                    self:updateDropdown(k, {update = aE})
                end
            end
        )
        aB:GetPropertyChangedSignal("Size"):Connect(
            function()
                self:Resize()
            end
        )
        function a0:Update(a2)
            for h, i in pairs(a2) do
                if h ~= "Update" and k.Options[h] then
                    if h == "list" then
                        for aF, ap in pairs(i) do
                            i[aF] = tostring(ap)
                        end
                    end
                    k.Options[h] = h == "list" and i or tostring(i)
                end
            end
            return K:updateDropdown(k, {noOpen = a2["list"]})
        end
        return k
    end
    function E:SelectPage(L)
        local aG = L[1]
        local a3 = L[2]
        if a3 and self.focusedPage == F then
            return
        end
        local P = aG.button
        if a3 then
            P.Title.TextTransparency = 0
            P.Title.Font = Enum.Font.GothamSemibold
            if P:FindFirstChild("Icon") then
                P.Icon.ImageTransparency = 0
            end
            local aH = self.focusedPage
            self.focusedPage = aG
            if aH then
                self:SelectPage({aH})
            end
            local aI = aH and #aH.sections or 0
            local aJ = #aG.sections - aI
            aG:Resize()
            for h = 1, #aG.sections do
                local aK = aG.sections[h]
                aK.container.Parent.ImageTransparency = 0
            end
            if aJ < 0 then
                for h = aI, #aG.sections + 1, -1 do
                    local aK = aH.sections[h].container.Parent
                    b:Tween(aK, {ImageTransparency = 1}, 0.1)
                end
            end
            wait(0.1)
            aG.container.Visible = true
            if aH then
                aH.container.Visible = false
            end
            if aJ > 0 then
                for h = aI + 1, #aG.sections do
                    local aK = aG.sections[h].container.Parent
                    aK.ImageTransparency = 1
                    b:Tween(aK, {ImageTransparency = 0}, 0.05)
                end
            end
            wait(0.05)
            for h = 1, #aG.sections do
                local aK = aG.sections[h]
                b:Tween(aK.container.Title, {TextTransparency = 0}, 0.1)
                aK:Resize(true)
                wait(0.05)
            end
            wait(0.05)
            aG:Resize(true)
        else
            P.Title.Font = Enum.Font.Gotham
            P.Title.TextTransparency = 0.65
            if P:FindFirstChild("Icon") then
                P.Icon.ImageTransparency = 0.65
            end
            for h = 1, #aG.sections do
                local aK = aG.sections[h]
                b:Tween(aK.container.Parent, {Size = UDim2.new(1, -10, 0, 28)}, 0.1)
                b:Tween(aK.container.Title, {TextTransparency = 1}, 0.1)
            end
            wait(0.1)
            aG.lastPosition = aG.container.CanvasPosition.Y
            aG:Resize()
        end
    end
    function F:Resize(aL)
        local X = 10
        local aM = 0
        for h = 1, #self.sections do
            local aK = self.sections[h]
            aM = aM + aK.container.Parent.AbsoluteSize.Y + X
        end
        self.container.CanvasSize = UDim2.new(0, 0, 0, aM)
        self.container.ScrollBarImageTransparency = aM > self.container.AbsoluteSize.Y
        if aL then
            b:Tween(self.container, {CanvasPosition = Vector2.new(0, self.lastPosition or 0)}, 0.2)
        end
    end
    function K:Resize(aN)
        if self.page.library.focusedPage ~= self.page then
            return
        end
        local X = 4
        local aM = 4 * X + self.container.Title.AbsoluteSize.Y
        for h, k in pairs(self.modules) do
            aM = aM + k.Instance.AbsoluteSize.Y + X
        end
        if aN then
            b:Tween(self.container.Parent, {Size = UDim2.new(1, -10, 0, aM)}, 0.05)
        else
            self.container.Parent.Size = UDim2.new(1, -10, 0, aM)
            self.page:Resize()
        end
    end
    function K:getModule(aO)
        for h = 1, #self.modules do
            local k = self.modules[h]
            local g = k.Instance
            if (g:FindFirstChild("Title") or g:FindFirstChild("TextBox", true)).Text == aO or g == aO then
                return k
            end
        end
        error("No module found under " .. tostring(aO.Instance))
    end
    function K:updateButton(k)
        k.Instance.Title.Text = k.Options[1]
    end
    function K:updateToggle(k)
        local a3 = k.Instance
        local aP = k.Options
        local aQ = {In = UDim2.new(0, 2, 0.5, -6), Out = UDim2.new(0, 20, 0.5, -6)}
        local w = a3.Button.Frame
        local aR
        local aR = aP.toggled and "Out" or "In"
        a3.Title.Text = aP.title
        b:Tween(w, {Size = UDim2.new(1, -22, 1, -9), Position = aQ[aR] + UDim2.new(0, 0, 0, 2.5)}, 0.2)
        wait(0.1)
        b:Tween(w, {Size = UDim2.new(1, -22, 1, -4), Position = aQ[aR]}, 0.1)
    end
    function K:updateTextbox(k)
        k.Instance.Title.Text = k.Options[1]
        k.Instance.Button.Textbox.Text = k.Options[2]
    end
    function K:updateKeybind(k)
        local a6 = k.Instance
        local aP = k.Options
        if typeof(aP.key) == "Instance" and aP.key:IsA("InputObject") then
            aP.key = aP.key.KeyCode
        end
        local V = a6.Button.Text
        local u = self.binds[a6]
        a6.Title.Text = k.Options.title
        if u.connection then
            u.connection = u.connection:UnBind()
        end
        if aP.key ~= Enum.KeyCode.Unknown then
            self.binds[a6].connection = b:BindToKey(aP.key, u.callback, aP.gameProcessedEvent)
            V.Text = game:GetService("UserInputService"):GetStringForKeyCode(aP.key)
        else
            V.Text = "Unknown"
        end
    end
    function K:updateColorPicker(k)
        local a8 = k.Instance
        local aP = k.Options
        local aS = self.colorpickers[a8]
        local a9 = aS.tab
        a8.Title.Text = aP.title
        a9.Title.Text = aP.title
        local S
        local aj, ak, al
        if typeof(aP.default) == "table" then
            aj, ak, al = unpack(aP.default)
            S = Color3.fromHSV(aj, ak, al)
        else
            S = aP.default
            aj, ak, al = Color3.toHSV(S)
        end
        b:Tween(a8.Button, {ImageColor3 = S}, 0.5)
        b:Tween(a9.Container.Color.Select, {Position = UDim2.new(aj, 0, 0, 0)}, 0.1)
        b:Tween(a9.Container.Canvas, {ImageColor3 = Color3.fromHSV(aj, 1, 1)}, 0.5)
        b:Tween(a9.Container.Canvas.Cursor, {Position = UDim2.new(ak, 0, 1 - al)}, 0.5)
        for h, N in pairs(a9.Container.Inputs:GetChildren()) do
            if N:IsA("ImageLabel") then
                local m = math.clamp(S[N.Name], 0, 1) * 255
                N.Textbox.Text = math.floor(m)
            end
        end
    end
    function K:updateSlider(k)
        local az = k.Instance
        local aP = k.Options
        az.Title.Text = aP.title
        local aT = az.Slider.Bar
        local aU = (game.Players.LocalPlayer:GetMouse().X - aT.AbsolutePosition.X) / aT.AbsoluteSize.X
        if aP.value then
            aU = (aP.value - aP.min) / (aP.max - aP.min)
        end
        local function aV(aW, aX)
            if aX == 0 then
                return math.floor(aW)
            elseif aX == -1 then
                return aW
            else
                return math.floor(aW * math.pow(10, aX) + 0.5) / math.pow(10, aX)
            end
        end
        aU = math.clamp(aU, 0, 1)
        aP.value = aP.value or aV(aP.min + (aP.max - aP.min) * aU, aP.precision)
        az.TextBox.Text = aP.value
        b:Tween(aT.Fill, {Size = UDim2.new(aU, 0, 1, 0)}, 0.1)
        if aP.value ~= aP.lvalue and az.ImageTransparency == 0 then
            b:Pop(az, 10)
        end
        return aP.value
    end
    function K:updateDropdown(k, aY)
        local aB = k.Instance
        local aP = k.Options
        aY = aY or {}
        if aP[1] then
            aB.Search.TextBox.Text = aP[1]
        end
        local aZ = 0
        b:Pop(aB.Search, 10)
        for h, P in pairs(aB.List.Frame:GetChildren()) do
            if P:IsA("ImageButton") then
                P:Destroy()
            end
        end
        local aE = aY.update or aP.list
        for h, m in pairs(aE) do
            local P =
                b:Create(
                "ImageButton",
                {
                    Parent = aB.List.Frame,
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
            P.MouseButton1Click:Connect(
                function()
                    aP.callback(m)
                    aP[1] = m
                    self:updateDropdown(k, {update = m and {} or false})
                end
            )
            aZ = aZ + 1
        end
        local w = aB.List.Frame
        if not aY.noOpen then
            b:Tween(aB, {Size = UDim2.new(1, 0, 0, aZ == 0 and 30 or math.clamp(aZ, 0, 3) * 34 + 38)}, 0.3)
            b:Tween(aB.Search.Button, {Rotation = not aY.update and 180 or 0}, 0.3)
        end
        if aZ > 3 then
            for h, P in pairs(aB.List.Frame:GetChildren()) do
                if P:IsA("ImageButton") then
                    P.Size = UDim2.new(1, -6, 0, 30)
                end
            end
            w.CanvasSize = UDim2.new(0, 0, 0, aZ * 34 - 4)
            w.ScrollBarImageTransparency = 0
        else
            w.CanvasSize = UDim2.new(0, 0, 0, 0)
            w.ScrollBarImageTransparency = 1
        end
    end
end
return E
