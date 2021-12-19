if library == nil then
    local a = {}
    for b = 1, math.random(10, 20) do
        a[b] = string.char(math.random(32, 126))
    end
    getgenv().GetGuiName = table.concat(a)
end
local c = game:GetService("Players").LocalPlayer:GetMouse()
local d = game:GetService("UserInputService")
local e = game:GetService("RunService")
local f = game:GetService("TweenService")
local g = TweenInfo.new
local h = {}
local i = {}
local j = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}
do
    function h:Create(k, l, m)
        local n = Instance.new(k)
        for b, o in pairs(l or {}) do
            n[b] = o
            if typeof(o) == "Color3" then
                local p = h:Find(j, o)
                if p then
                    i[p] = i[p] or {}
                    i[p][b] = i[p][b] or setmetatable({}, {_mode = "k"})
                    table.insert(i[p][b], n)
                end
            end
        end
        for b, q in pairs(m or {}) do
            q.Parent = n
        end
        return n
    end
    function h:Tween(k, l, r, ...)
        f:Create(k, g(r, ...), l):Play()
    end
    function h:Wait()
        e.RenderStepped:Wait()
        return true
    end
    function h:Find(table, s)
        for b, o in pairs(table) do
            if o == s then
                return b
            end
        end
    end
    function h:Sort(t, u)
        local v = {}
        t = t:lower()
        if t == "" then
            return u
        end
        for b, s in pairs(u) do
            if tostring(s):lower():find(t) then
                table.insert(v, s)
            end
        end
        return v
    end
    function h:Pop(n, w)
        local x = n:Clone()
        x.AnchorPoint = Vector2.new(0.5, 0.5)
        x.Size = x.Size - UDim2.new(0, w, 0, w)
        x.Position = UDim2.new(0.5, 0, 0.5, 0)
        x.Parent = n
        x:ClearAllChildren()
        n.ImageTransparency = 1
        h:Tween(x, {Size = n.Size}, 0.2)
        coroutine.wrap(
            function()
                wait(0.2)
                n.ImageTransparency = 0
                x:Destroy()
            end
        )()
        return x
    end
    function h:InitializeKeybind()
        self.keybinds = {}
        self.ended = {}
        d.InputBegan:Connect(
            function(y)
                if self.keybinds[y.KeyCode] then
                    for b, z in pairs(self.keybinds[y.KeyCode]) do
                        z()
                    end
                end
            end
        )
        d.InputEnded:Connect(
            function(y)
                if y.UserInputType == Enum.UserInputType.MouseButton1 then
                    for b, A in pairs(self.ended) do
                        A()
                    end
                end
            end
        )
    end
    function h:BindToKey(y, A)
        self.keybinds[y] = self.keybinds[y] or {}
        table.insert(self.keybinds[y], A)
        return {UnBind = function()
                for b, z in pairs(self.keybinds[y]) do
                    if z == A then
                        table.remove(self.keybinds[y], b)
                    end
                end
            end}
    end
    function h:KeyPressed()
        local y = d.InputBegan:Wait()
        while y.UserInputType ~= Enum.UserInputType.Keyboard do
            y = d.InputBegan:Wait()
        end
        wait()
        return y
    end
    function h:DraggingEnabled(B, C)
        C = C or B
        local D = false
        local E, F, G
        B.InputBegan:Connect(
            function(d)
                if d.UserInputType == Enum.UserInputType.MouseButton1 then
                    D = true
                    F = d.Position
                    G = C.Position
                    d.Changed:Connect(
                        function()
                            if d.UserInputState == Enum.UserInputState.End then
                                D = false
                            end
                        end
                    )
                end
            end
        )
        B.InputChanged:Connect(
            function(d)
                if d.UserInputType == Enum.UserInputType.MouseMovement then
                    E = d
                end
            end
        )
        d.InputChanged:Connect(
            function(d)
                if d == E and D then
                    local H = d.Position - F
                    C.Position = UDim2.new(G.X.Scale, G.X.Offset + H.X, G.Y.Scale, G.Y.Offset + H.Y)
                end
            end
        )
    end
    function h:DraggingEnded(A)
        table.insert(self.ended, A)
    end
end
local library = {}
local I = {}
local J = {}
do
    library.__index = library
    I.__index = I
    J.__index = J
    function library.new(K)
        local L =
            h:Create(
            "ScreenGui",
            {Name = GetGuiName, Parent = game:GetService("CoreGui")},
            {
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Main",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 600, 0, -700),
                        Size = UDim2.new(0, 511, 0, 428),
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = j.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(4, 4, 296, 296)
                    },
                    {
                        h:Create(
                            "ImageLabel",
                            {
                                Name = "Glow",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, -15, 0, -15),
                                Size = UDim2.new(1, 30, 1, 30),
                                ZIndex = 0,
                                Image = "rbxassetid://5028857084",
                                ImageColor3 = j.Glow,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(24, 24, 276, 276)
                            }
                        ),
                        h:Create(
                            "ImageLabel",
                            {
                                Name = "Pages",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Position = UDim2.new(0, 0, 0, 38),
                                Size = UDim2.new(0, 126, 1, -38),
                                ZIndex = 3,
                                Image = "rbxassetid://5012534273",
                                ImageColor3 = j.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                h:Create(
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
                                        h:Create(
                                            "UIListLayout",
                                            {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)}
                                        )
                                    }
                                )
                            }
                        ),
                        h:Create(
                            "ImageLabel",
                            {
                                Name = "TopBar",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 0, 38),
                                ZIndex = 5,
                                Image = "rbxassetid://4595286933",
                                ImageColor3 = j.Accent,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                h:Create(
                                    "TextLabel",
                                    {
                                        Name = "Title",
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        BackgroundTransparency = 1,
                                        Position = UDim2.new(0, 12, 0, 19),
                                        Size = UDim2.new(1, -46, 0, 16),
                                        ZIndex = 5,
                                        Font = Enum.Font.GothamBold,
                                        Text = K,
                                        TextColor3 = j.TextColor,
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
        h:InitializeKeybind()
        h:DraggingEnabled(L.Main.TopBar, L.Main)
        return setmetatable({container = L, pagesContainer = L.Main.Pages.Pages_Container, pages = {}}, library)
    end
    function I.new(library, K, M)
        local N =
            h:Create(
            "TextButton",
            {
                Name = K,
                Parent = library.pagesContainer,
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
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 40, 0.5, 0),
                        Size = UDim2.new(0, 76, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.65,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                M and
                    h:Create(
                        "ImageLabel",
                        {
                            Name = "Icon",
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 12, 0.5, 0),
                            Size = UDim2.new(0, 16, 0, 16),
                            ZIndex = 3,
                            Image = "rbxassetid://" .. tostring(M),
                            ImageColor3 = j.TextColor,
                            ImageTransparency = 0.64
                        }
                    ) or
                    {}
            }
        )
        local L =
            h:Create(
            "ScrollingFrame",
            {
                Name = K,
                Parent = library.container.Main,
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 134, 0, 46),
                Size = UDim2.new(1, -142, 1, -56),
                CanvasSize = UDim2.new(0, 0, 0, 466),
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = j.DarkContrast,
                Visible = false
            },
            {h:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)})}
        )
        return setmetatable({library = library, container = L, button = N, sections = {}}, I)
    end
    function J.new(I, K)
        local L =
            h:Create(
            "ImageLabel",
            {
                Name = K,
                Parent = I.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -10, 0, 28),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.LightContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ClipsDescendants = true
            },
            {
                h:Create(
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
                        h:Create(
                            "TextLabel",
                            {
                                Name = "Title",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Font = Enum.Font.GothamSemibold,
                                Text = K,
                                TextColor3 = j.TextColor,
                                TextSize = 12,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextTransparency = 1
                            }
                        ),
                        h:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)})
                    }
                )
            }
        )
        return setmetatable(
            {page = I, container = L.Container, colorpickers = {}, modules = {}, binds = {}, lists = {}},
            J
        )
    end
    function library:addPage(...)
        local I = I.new(self, ...)
        local N = I.button
        table.insert(self.pages, I)
        N.MouseButton1Click:Connect(
            function()
                self:SelectPage(I, true)
            end
        )
        return I
    end
    function I:addSection(...)
        local J = J.new(self, ...)
        table.insert(self.sections, J)
        return J
    end
    function library:setTheme(p, O)
        j[p] = O
        for P, i in pairs(i[p]) do
            for b, n in pairs(i) do
                if not n.Parent or n.Name == "Button" and n.Parent.Name == "ColorPicker" then
                    i[b] = nil
                else
                    n[P] = O
                end
            end
        end
    end
    function library:getTheme(p)
        if i[p] then
            for P, i in pairs(i[p]) do
                for b, n in pairs(i) do
                    if not n.Parent or n.Name == "Button" and n.Parent.Name == "ColorPicker" then
                        i[b] = nil
                    else
                        return n[P]
                    end
                end
            end
        end
    end
    function library:toggle()
        if self.toggling then
            return
        end
        self.toggling = true
        local L = self.container.Main
        local Q = L.TopBar
        if self.position then
            h:Tween(L, {Size = UDim2.new(0, 511, 0, 428), Position = self.position}, 0.2)
            wait(0.2)
            h:Tween(Q, {Size = UDim2.new(1, 0, 0, 38)}, 0.2)
            wait(0.2)
            L.ClipsDescendants = false
            self.position = nil
        else
            self.position = L.Position
            L.ClipsDescendants = true
            h:Tween(Q, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            h:Tween(L, {Size = UDim2.new(0, 511, 0, 0), Position = self.position + UDim2.new(0, 0, 0, 428)}, 0.2)
            wait(0.2)
        end
        self.toggling = false
    end
    function library:Notify(K, R, A)
        if self.activeNotification then
            self.activeNotification = self.activeNotification()
        end
        local S =
            h:Create(
            "ImageLabel",
            {
                Name = "Notification",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 200, 0, 60),
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ZIndex = 3,
                ClipsDescendants = true
            },
            {
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Flash",
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = j.TextColor,
                        ZIndex = 5
                    }
                ),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = j.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(24, 24, 276, 276)
                    }
                ),
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.GothamSemibold,
                        TextColor3 = j.TextColor,
                        TextSize = 14.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "TextLabel",
                    {
                        Name = "Text",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 1, -24),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.Gotham,
                        TextColor3 = j.TextColor,
                        TextSize = 12.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "ImageButton",
                    {
                        Name = "Accept",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538259",
                        ImageColor3 = j.TextColor,
                        ZIndex = 4
                    }
                ),
                h:Create(
                    "ImageButton",
                    {
                        Name = "Decline",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 1, -24),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = j.TextColor,
                        ZIndex = 4
                    }
                )
            }
        )
        h:DraggingEnabled(S)
        K = K or "Notification"
        R = R or ""
        S.Title.Text = K
        S.Text.Text = R
        local T = 10
        local U = game:GetService("TextService"):GetTextSize(R, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))
        S.Position = library.lastNotification or UDim2.new(0, T, 1, -(S.AbsoluteSize.Y + T))
        S.Size = UDim2.new(0, 0, 0, 60)
        h:Tween(S, {Size = UDim2.new(0, U.X + 70, 0, 60)}, 0.2)
        wait(0.2)
        S.ClipsDescendants = false
        h:Tween(S.Flash, {Size = UDim2.new(0, 0, 0, 60), Position = UDim2.new(1, 0, 0, 0)}, 0.2)
        local V = true
        local W = function()
            if not V then
                return
            end
            V = false
            S.ClipsDescendants = true
            library.lastNotification = S.Position
            S.Flash.Position = UDim2.new(0, 0, 0, 0)
            h:Tween(S.Flash, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            h:Tween(S, {Size = UDim2.new(0, 0, 0, 60), Position = S.Position + UDim2.new(0, U.X + 70, 0, 0)}, 0.2)
            wait(0.2)
            S:Destroy()
        end
        self.activeNotification = W
        S.Accept.MouseButton1Click:Connect(
            function()
                if not V then
                    return
                end
                if A then
                    A(true)
                end
                W()
            end
        )
        S.Decline.MouseButton1Click:Connect(
            function()
                if not V then
                    return
                end
                if A then
                    A(false)
                end
                W()
            end
        )
    end
    function J:addLabel(K, X, A)
        local Y =
            h:Create(
            "ImageButton",
            {
                Name = "Textbox",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                )
            }
        )
        table.insert(self.modules, Y)
        return Y
    end
    function J:addButton(K, A)
        local N =
            h:Create(
            "ImageButton",
            {
                Name = "Button",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012
                    }
                )
            }
        )
        table.insert(self.modules, N)
        local R = N.Title
        local Z
        N.MouseButton1Click:Connect(
            function()
                if Z then
                    return
                end
                h:Pop(N, 10)
                Z = true
                R.TextSize = 0
                h:Tween(N.Title, {TextSize = 14}, 0.2)
                wait(0.2)
                h:Tween(N.Title, {TextSize = 12}, 0.2)
                if A then
                    A(
                        function(...)
                            self:updateButton(N, ...)
                        end
                    )
                end
                Z = false
            end
        )
        return N
    end
    function J:addToggle(K, X, A)
        local _ =
            h:Create(
            "ImageButton",
            {
                Name = "Toggle",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -50, 0.5, -8),
                        Size = UDim2.new(0, 40, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = j.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        h:Create(
                            "ImageLabel",
                            {
                                Name = "Frame",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 2, 0.5, -6),
                                Size = UDim2.new(1, -22, 1, -4),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = j.TextColor,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                )
            }
        )
        table.insert(self.modules, _)
        local V = X
        local a0 = {}
        self:updateToggle(_, nil, V)
        function a0:Get()
            return V
        end
        function a0:updateToggle(K, s)
            return self:updateToggle(_, K, s)
        end
        a0.Set = function(a1)
            V = a1
            if A then
                A(
                    V,
                    function(...)
                        self:updateToggle(_, ...)
                    end
                )
            end
        end
        _.MouseButton1Click:Connect(
            function()
                V = not V
                self:updateToggle(_, nil, V)
                if A then
                    A(
                        V,
                        function(...)
                            self:updateToggle(_, ...)
                        end
                    )
                end
            end
        )
        return setmetatable(
            {},
            {__index = function(a2, a3)
                    return a0[a3] or _[a3]
                end}
        )
    end
    function J:addTextbox(K, X, A)
        local Y =
            h:Create(
            "ImageButton",
            {
                Name = "Textbox",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = j.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        h:Create(
                            "TextBox",
                            {
                                Name = "Textbox",
                                BackgroundTransparency = 1,
                                TextTruncate = Enum.TextTruncate.AtEnd,
                                Position = UDim2.new(0, 5, 0, 0),
                                Size = UDim2.new(1, -10, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.GothamSemibold,
                                Text = X or "",
                                TextColor3 = j.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        table.insert(self.modules, Y)
        local N = Y.Button
        local d = N.Textbox
        Y.MouseButton1Click:Connect(
            function()
                if Y.Button.Size ~= UDim2.new(0, 100, 0, 16) then
                    return
                end
                h:Tween(Y.Button, {Size = UDim2.new(0, 200, 0, 16), Position = UDim2.new(1, -210, 0.5, -8)}, 0.2)
                wait()
                d.TextXAlignment = Enum.TextXAlignment.Left
                d:CaptureFocus()
            end
        )
        d:GetPropertyChangedSignal("Text"):Connect(
            function()
                if
                    N.ImageTransparency == 0 and
                        (N.Size == UDim2.new(0, 200, 0, 16) or N.Size == UDim2.new(0, 100, 0, 16))
                 then
                    h:Pop(N, 10)
                end
                if A then
                    A(
                        d.Text,
                        nil,
                        function(...)
                            self:updateTextbox(Y, ...)
                        end
                    )
                end
            end
        )
        d.FocusLost:Connect(
            function()
                d.TextXAlignment = Enum.TextXAlignment.Center
                h:Tween(Y.Button, {Size = UDim2.new(0, 100, 0, 16), Position = UDim2.new(1, -110, 0.5, -8)}, 0.2)
                if A then
                    A(
                        d.Text,
                        true,
                        function(...)
                            self:updateTextbox(Y, ...)
                        end
                    )
                end
            end
        )
        return Y
    end
    function J:addKeybind(K, X, A, a4)
        local a5 =
            h:Create(
            "ImageButton",
            {
                Name = "Keybind",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = j.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        h:Create(
                            "TextLabel",
                            {
                                Name = "Text",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.GothamSemibold,
                                Text = X and X.Name or "None",
                                TextColor3 = j.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        table.insert(self.modules, a5)
        local R = a5.Button.Text
        local N = a5.Button
        local a6 = function()
            if N.ImageTransparency == 0 then
                h:Pop(N, 10)
            end
        end
        self.binds[a5] = {
            callback = function()
                a6()
                if A then
                    A(
                        function(...)
                            self:updateKeybind(a5, ...)
                        end
                    )
                end
            end
        }
        if X and A then
            self:updateKeybind(a5, nil, X)
        end
        a5.MouseButton1Click:Connect(
            function()
                a6()
                if self.binds[a5].connection then
                    return self:updateKeybind(a5)
                end
                if R.Text == "None" then
                    R.Text = "..."
                    local y = h:KeyPressed()
                    self:updateKeybind(a5, nil, y.KeyCode)
                    a6()
                    if a4 then
                        a4(
                            y.KeyCode,
                            function(...)
                                self:updateKeybind(a5, ...)
                            end
                        )
                    end
                end
            end
        )
        return a5
    end
    function J:addColorPicker(K, X, A)
        local a7 =
            h:Create(
            "ImageButton",
            {
                Name = "ColorPicker",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        AnchorPoint = Vector2.new(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0.5, 1),
                        Size = UDim2.new(0.5, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
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
        local a8 =
            h:Create(
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
                ImageColor3 = j.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298),
                Visible = false
            },
            {
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 0,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = j.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(22, 22, 278, 278)
                    }
                ),
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 2,
                        Font = Enum.Font.GothamSemibold,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "ImageButton",
                    {
                        Name = "Close",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = j.TextColor
                    }
                ),
                h:Create(
                    "Frame",
                    {
                        Name = "Container",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 8, 0, 32),
                        Size = UDim2.new(1, -18, 1, -40)
                    },
                    {
                        h:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}),
                        h:Create(
                            "ImageButton",
                            {
                                Name = "Canvas",
                                BackgroundTransparency = 1,
                                BorderColor3 = j.LightContrast,
                                Size = UDim2.new(1, 0, 0, 60),
                                AutoButtonColor = false,
                                Image = "rbxassetid://5108535320",
                                ImageColor3 = Color3.fromRGB(255, 0, 0),
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "White_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152351",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Black_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152095",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Cursor",
                                        BackgroundColor3 = j.TextColor,
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
                        h:Create(
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
                                h:Create(
                                    "Frame",
                                    {
                                        Name = "Select",
                                        BackgroundColor3 = j.TextColor,
                                        BorderSizePixel = 1,
                                        Position = UDim2.new(1, 0, 0, 0),
                                        Size = UDim2.new(0, 2, 1, 0),
                                        ZIndex = 2
                                    }
                                ),
                                h:Create(
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
                        h:Create(
                            "Frame",
                            {
                                Name = "Inputs",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 10, 0, 158),
                                Size = UDim2.new(1, 0, 0, 16)
                            },
                            {
                                h:Create(
                                    "UIListLayout",
                                    {
                                        FillDirection = Enum.FillDirection.Horizontal,
                                        SortOrder = Enum.SortOrder.LayoutOrder,
                                        Padding = UDim.new(0, 6)
                                    }
                                ),
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "R",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = j.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        h:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "R:",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        h:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                PlaceholderColor3 = j.DarkContrast,
                                                Text = "255",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "G",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = j.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        h:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                ZIndex = 2,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                Font = Enum.Font.Gotham,
                                                Text = "G:",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        h:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "B",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = j.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        h:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "B:",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        h:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = j.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                )
                            }
                        ),
                        h:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = j.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                h:Create(
                                    "TextLabel",
                                    {
                                        Name = "Text",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 1, 0),
                                        ZIndex = 3,
                                        Font = Enum.Font.Gotham,
                                        Text = "Submit",
                                        TextColor3 = j.TextColor,
                                        TextSize = 11.000
                                    }
                                )
                            }
                        )
                    }
                )
            }
        )
        h:DraggingEnabled(a8)
        table.insert(self.modules, a7)
        local a9 = {[""] = true}
        local aa = a8.Container.Canvas
        local ab = a8.Container.Color
        local ac, ad = aa.AbsoluteSize, aa.AbsolutePosition
        local ae, af = ab.AbsoluteSize, ab.AbsolutePosition
        local ag, ah
        local O = X or Color3.fromRGB(255, 255, 255)
        local ai, aj, ak = 0, 0, 1
        local al = {r = 255, g = 255, b = 255}
        self.colorpickers[a7] = {tab = a8, callback = function(am, s)
                al[am] = s
                ai, aj, ak = Color3.toHSV(Color3.fromRGB(al.r, al.g, al.b))
            end}
        local A = function(s)
            if A then
                A(
                    s,
                    function(...)
                        self:updateColorPicker(a7, ...)
                    end
                )
            end
        end
        h:DraggingEnded(
            function()
                ag, ah = false, false
            end
        )
        if X then
            self:updateColorPicker(a7, nil, X)
            ai, aj, ak = Color3.toHSV(X)
            X = Color3.fromHSV(ai, aj, ak)
            for b, am in pairs({"r", "g", "b"}) do
                al[am] = X[am:upper()] * 255
            end
        end
        for b, L in pairs(a8.Container.Inputs:GetChildren()) do
            if L:IsA("ImageLabel") then
                local Y = L.Textbox
                local an
                Y.Focused:Connect(
                    function()
                        an = true
                    end
                )
                Y.FocusLost:Connect(
                    function()
                        an = false
                        if not tonumber(Y.Text) then
                            Y.Text = math.floor(al[L.Name:lower()])
                        end
                    end
                )
                Y:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        local R = Y.Text
                        if not a9[R] and not tonumber(R) then
                            Y.Text = R:sub(1, #R - 1)
                        elseif an and not a9[R] then
                            al[L.Name:lower()] = math.clamp(tonumber(Y.Text), 0, 255)
                            local O = Color3.fromRGB(al.r, al.g, al.b)
                            ai, aj, ak = Color3.toHSV(O)
                            self:updateColorPicker(a7, nil, O)
                            A(O)
                        end
                    end
                )
            end
        end
        aa.MouseButton1Down:Connect(
            function()
                ah = true
                while ah do
                    local ao, ap = c.X, c.Y
                    aj = math.clamp((ao - ad.X) / ac.X, 0, 1)
                    ak = 1 - math.clamp((ap - ad.Y) / ac.Y, 0, 1)
                    O = Color3.fromHSV(ai, aj, ak)
                    for b, am in pairs({"r", "g", "b"}) do
                        al[am] = O[am:upper()] * 255
                    end
                    self:updateColorPicker(a7, nil, {ai, aj, ak})
                    h:Tween(aa.Cursor, {Position = UDim2.new(aj, 0, 1 - ak, 0)}, 0.1)
                    A(O)
                    h:Wait()
                end
            end
        )
        ab.MouseButton1Down:Connect(
            function()
                ag = true
                while ag do
                    ai = 1 - math.clamp(1 - (c.X - af.X) / ae.X, 0, 1)
                    O = Color3.fromHSV(ai, aj, ak)
                    for b, am in pairs({"r", "g", "b"}) do
                        al[am] = O[am:upper()] * 255
                    end
                    local ao = ai
                    self:updateColorPicker(a7, nil, {ai, aj, ak})
                    h:Tween(a8.Container.Color.Select, {Position = UDim2.new(ao, 0, 0, 0)}, 0.1)
                    A(O)
                    h:Wait()
                end
            end
        )
        local N = a7.Button
        local _, Z, a6
        lastColor = Color3.fromHSV(ai, aj, ak)
        a6 = function(aq, ar)
            if ar then
                if not _ then
                    return
                end
                if Z then
                    while Z do
                        h:Wait()
                    end
                end
            elseif not ar then
                if Z then
                    return
                end
                if N.ImageTransparency == 0 then
                    h:Pop(N, 10)
                end
            end
            _ = aq
            Z = true
            if aq then
                if self.page.library.activePicker and self.page.library.activePicker ~= a6 then
                    self.page.library.activePicker(nil, true)
                end
                self.page.library.activePicker = a6
                lastColor = Color3.fromHSV(ai, aj, ak)
                local as, at = N.AbsoluteSize.X / 2, 162
                local au, av = N.AbsolutePosition.X, N.AbsolutePosition.Y
                a8.ClipsDescendants = true
                a8.Visible = true
                a8.Size = UDim2.new(0, 0, 0, 0)
                a8.Position = UDim2.new(0, as + at + au, 0, av)
                h:Tween(a8, {Size = UDim2.new(0, 162, 0, 169)}, 0.2)
                wait(0.2)
                a8.ClipsDescendants = false
                ac, ad = aa.AbsoluteSize, aa.AbsolutePosition
                ae, af = ab.AbsoluteSize, ab.AbsolutePosition
            else
                h:Tween(a8, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
                a8.ClipsDescendants = true
                wait(0.2)
                a8.Visible = false
            end
            Z = false
        end
        local aw = function()
            a6(not _)
        end
        N.MouseButton1Click:Connect(aw)
        a7.MouseButton1Click:Connect(aw)
        a8.Container.Button.MouseButton1Click:Connect(
            function()
                a6()
            end
        )
        a8.Close.MouseButton1Click:Connect(
            function()
                self:updateColorPicker(a7, nil, lastColor)
                a6()
            end
        )
        return a7
    end
    function J:addSlider(K, X, ax, ay, A)
        local az =
            h:Create(
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
                ImageColor3 = j.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                h:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 6),
                        Size = UDim2.new(0.5, 0, 0, 16),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = K,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                h:Create(
                    "TextBox",
                    {
                        Name = "TextBox",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -30, 0, 6),
                        Size = UDim2.new(0, 20, 0, 16),
                        ZIndex = 3,
                        Font = Enum.Font.GothamSemibold,
                        Text = X or ax,
                        TextColor3 = j.TextColor,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Right
                    }
                ),
                h:Create(
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
                        h:Create(
                            "ImageLabel",
                            {
                                Name = "Bar",
                                AnchorPoint = Vector2.new(0, 0.5),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 0, 0.5, 0),
                                Size = UDim2.new(1, 0, 0, 4),
                                ZIndex = 3,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = j.LightContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                h:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Fill",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(0.8, 0, 1, 0),
                                        ZIndex = 3,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = j.TextColor,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        h:Create(
                                            "ImageLabel",
                                            {
                                                Name = "Circle",
                                                AnchorPoint = Vector2.new(0.5, 0.5),
                                                BackgroundTransparency = 1,
                                                ImageTransparency = 1.000,
                                                ImageColor3 = j.TextColor,
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
        table.insert(self.modules, az)
        local a9 = {[""] = true, ["-"] = true}
        local Y = az.TextBox
        local aA = az.Slider.Bar.Fill.Circle
        local s = X or ax
        local D, aB
        local A = function(s)
            if A then
                A(
                    s,
                    function(...)
                        self:updateSlider(az, ...)
                    end
                )
            end
        end
        self:updateSlider(az, nil, s, ax, ay)
        h:DraggingEnded(
            function()
                D = false
            end
        )
        az.MouseButton1Down:Connect(
            function(d)
                D = true
                while D do
                    h:Tween(aA, {ImageTransparency = 0}, 0.1)
                    s = self:updateSlider(az, nil, nil, ax, ay, s)
                    A(s)
                    h:Wait()
                end
                wait(0.5)
                h:Tween(aA, {ImageTransparency = 1}, 0.2)
            end
        )
        Y.FocusLost:Connect(
            function()
                if not tonumber(Y.Text) then
                    s = self:updateSlider(az, nil, X or ax, ax, ay)
                    A(s)
                end
            end
        )
        Y:GetPropertyChangedSignal("Text"):Connect(
            function()
                local R = Y.Text
                if not a9[R] and not tonumber(R) then
                    Y.Text = R:sub(1, #R - 1)
                elseif not a9[R] then
                    s = self:updateSlider(az, nil, tonumber(R) or s, ax, ay)
                    A(s)
                end
            end
        )
        return az
    end
    function J:addDropdown(K, aC, A)
        local aD =
            h:Create(
            "Frame",
            {
                Name = "Dropdown",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                ClipsDescendants = true
            },
            {
                h:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "Search",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = j.DarkContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        h:Create(
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
                                Text = K,
                                TextColor3 = j.TextColor,
                                TextSize = 12,
                                TextTransparency = 0.10000000149012,
                                TextXAlignment = Enum.TextXAlignment.Left
                            }
                        ),
                        h:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(1, -28, 0.5, -9),
                                Size = UDim2.new(0, 18, 0, 18),
                                ZIndex = 3,
                                Image = "rbxassetid://5012539403",
                                ImageColor3 = j.TextColor,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                ),
                h:Create(
                    "ImageLabel",
                    {
                        Name = "List",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, -34),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = j.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        h:Create(
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
                                ScrollBarImageColor3 = j.DarkContrast
                            },
                            {
                                h:Create(
                                    "UIListLayout",
                                    {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}
                                )
                            }
                        )
                    }
                )
            }
        )
        table.insert(self.modules, aD)
        local a0 = {}
        local aE = aD.Search
        local an
        aC = aC or {}
        aE.Button.MouseButton1Click:Connect(
            function()
                if aE.Button.Rotation == 0 then
                    self:updateDropdown(aD, nil, aC, A)
                else
                    self:updateDropdown(aD, nil, nil, A)
                end
            end
        )
        aE.TextBox.Focused:Connect(
            function()
                if aE.Button.Rotation == 0 then
                    self:updateDropdown(aD, nil, aC, A)
                end
                an = true
            end
        )
        aE.TextBox.FocusLost:Connect(
            function()
                an = false
            end
        )
        aE.TextBox:GetPropertyChangedSignal("Text"):Connect(
            function()
                if an then
                    local aC = h:Sort(aE.TextBox.Text, aC)
                    aC = #aC ~= 0 and aC
                    self:updateDropdown(aD, nil, aC, A)
                end
            end
        )
        aD:GetPropertyChangedSignal("Size"):Connect(
            function()
                self:Resize()
            end
        )
        function a0:Get()
            return aE.TextBox.Text
        end
        local aF = self
        function a0:updateDropdown(K, aC, A)
            return aF:updateDropdown(aD, K, aC, A)
        end
        return aD
    end
    function library:SelectPage(I, _)
        if _ and self.focusedPage == I then
            return
        end
        local N = I.button
        if _ then
            N.Title.TextTransparency = 0
            N.Title.Font = Enum.Font.GothamSemibold
            if N:FindFirstChild("Icon") then
                N.Icon.ImageTransparency = 0
            end
            local aG = self.focusedPage
            self.focusedPage = I
            if aG then
                self:SelectPage(aG)
            end
            local aH = aG and #aG.sections or 0
            local aI = #I.sections - aH
            I:Resize()
            for b, J in pairs(I.sections) do
                J.container.Parent.ImageTransparency = 0
            end
            if aI < 0 then
                for b = aH, #I.sections + 1, -1 do
                    local J = aG.sections[b].container.Parent
                    h:Tween(J, {ImageTransparency = 1}, 0.1)
                end
            end
            wait(0.1)
            I.container.Visible = true
            if aG then
                aG.container.Visible = false
            end
            if aI > 0 then
                for b = aH + 1, #I.sections do
                    local J = I.sections[b].container.Parent
                    J.ImageTransparency = 1
                    h:Tween(J, {ImageTransparency = 0}, 0.05)
                end
            end
            wait(0.05)
            for b, J in pairs(I.sections) do
                h:Tween(J.container.Title, {TextTransparency = 0}, 0.1)
                J:Resize(true)
                wait(0.05)
            end
            wait(0.05)
            I:Resize(true)
        else
            N.Title.Font = Enum.Font.Gotham
            N.Title.TextTransparency = 0.65
            if N:FindFirstChild("Icon") then
                N.Icon.ImageTransparency = 0.65
            end
            for b, J in pairs(I.sections) do
                h:Tween(J.container.Parent, {Size = UDim2.new(1, -10, 0, 28)}, 0.1)
                h:Tween(J.container.Title, {TextTransparency = 1}, 0.1)
            end
            wait(0.1)
            I.lastPosition = I.container.CanvasPosition.Y
            I:Resize()
        end
        for b, o in pairs(game:GetService("CoreGui"):GetDescendants()) do
            if o.Parent.Name == GetGuiName and o.Parent.ClassName == "ScreenGui" and o.Name == "Main" then
                o:TweenPosition(UDim2.new(0, 600, 0, 300), "Out", "Quart", 1.5)
            end
        end
    end
    function I:Resize(aJ)
        local T = 10
        local aK = 0
        for b, J in pairs(self.sections) do
            aK = aK + J.container.Parent.AbsoluteSize.Y + T
        end
        self.container.CanvasSize = UDim2.new(0, 0, 0, aK)
        self.container.ScrollBarImageTransparency = aK > self.container.AbsoluteSize.Y
        if aJ then
            h:Tween(self.container, {CanvasPosition = Vector2.new(0, self.lastPosition or 0)}, 0.2)
        end
    end
    function J:Resize(aL)
        if self.page.library.focusedPage ~= self.page then
            return
        end
        local T = 4
        local aK = 4 * T + self.container.Title.AbsoluteSize.Y
        for b, q in pairs(self.modules) do
            aK = aK + q.AbsoluteSize.Y + T
        end
        if aL then
            h:Tween(self.container.Parent, {Size = UDim2.new(1, -10, 0, aK)}, 0.05)
        else
            self.container.Parent.Size = UDim2.new(1, -10, 0, aK)
            self.page:Resize()
        end
    end
    function J:getModule(aM)
        if table.find(self.modules, aM) then
            return aM
        end
        for b, q in pairs(self.modules) do
            if (q:FindFirstChild("Title") or q:FindFirstChild("TextBox", true)).Text == aM then
                return q
            end
        end
        error("No module found under " .. tostring(aM))
    end
    function J:updateButton(N, K)
        N = self:getModule(N)
        N.Title.Text = K
    end
    function J:updateToggle(_, K, s)
        _ = self:getModule(_)
        local aN = {In = UDim2.new(0, 2, 0.5, -6), Out = UDim2.new(0, 20, 0.5, -6)}
        local B = _.Button.Frame
        s = s and "Out" or "In"
        if K then
            _.Title.Text = K
        end
        h:Tween(B, {Size = UDim2.new(1, -22, 1, -9), Position = aN[s] + UDim2.new(0, 0, 0, 2.5)}, 0.2)
        wait(0.1)
        h:Tween(B, {Size = UDim2.new(1, -22, 1, -4), Position = aN[s]}, 0.1)
    end
    function J:updateTextbox(Y, K, s)
        Y = self:getModule(Y)
        if K then
            Y.Title.Text = K
        end
        if s then
            Y.Button.Textbox.Text = s
        end
    end
    function J:updateKeybind(a5, K, y)
        a5 = self:getModule(a5)
        local R = a5.Button.Text
        local z = self.binds[a5]
        if K then
            a5.Title.Text = K
        end
        if z.connection then
            z.connection = z.connection:UnBind()
        end
        if y then
            self.binds[a5].connection = h:BindToKey(y, z.callback)
            R.Text = y.Name
        else
            R.Text = "None"
        end
    end
    function J:updateColorPicker(a7, K, ab)
        a7 = self:getModule(a7)
        local aO = self.colorpickers[a7]
        local a8 = aO.tab
        local A = aO.callback
        if K then
            a7.Title.Text = K
            a8.Title.Text = K
        end
        local O
        local ai, aj, ak
        if type(ab) == "table" then
            ai, aj, ak = unpack(ab)
            O = Color3.fromHSV(ai, aj, ak)
        else
            O = ab
            ai, aj, ak = Color3.toHSV(O)
        end
        h:Tween(a7.Button, {ImageColor3 = O}, 0.5)
        h:Tween(a8.Container.Color.Select, {Position = UDim2.new(ai, 0, 0, 0)}, 0.1)
        h:Tween(a8.Container.Canvas, {ImageColor3 = Color3.fromHSV(ai, 1, 1)}, 0.5)
        h:Tween(a8.Container.Canvas.Cursor, {Position = UDim2.new(aj, 0, 1 - ak)}, 0.5)
        for b, L in pairs(a8.Container.Inputs:GetChildren()) do
            if L:IsA("ImageLabel") then
                local s = math.clamp(O[L.Name], 0, 1) * 255
                L.Textbox.Text = math.floor(s)
            end
        end
    end
    function J:updateSlider(az, K, s, ax, ay, aP)
        az = self:getModule(az)
        if K then
            az.Title.Text = K
        end
        local aQ = az.Slider.Bar
        local aR = (c.X - aQ.AbsolutePosition.X) / aQ.AbsoluteSize.X
        if s then
            aR = (s - ax) / (ay - ax)
        end
        aR = math.clamp(aR, 0, 1)
        s = s or math.floor(ax + (ay - ax) * aR)
        az.TextBox.Text = s
        h:Tween(aQ.Fill, {Size = UDim2.new(aR, 0, 1, 0)}, 0.1)
        if s ~= aP and az.ImageTransparency == 0 then
            h:Pop(az, 10)
        end
        return s
    end
    function J:updateDropdown(aD, K, aC, A)
        aD = self:getModule(aD)
        if K then
            aD.Search.TextBox.Text = K
        end
        local aS = 0
        h:Pop(aD.Search, 10)
        for b, N in pairs(aD.List.Frame:GetChildren()) do
            if N:IsA("ImageButton") then
                N:Destroy()
            end
        end
        for b, s in pairs(aC or {}) do
            local N =
                h:Create(
                "ImageButton",
                {
                    Parent = aD.List.Frame,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                    ZIndex = 2,
                    Image = "rbxassetid://5028857472",
                    ImageColor3 = j.DarkContrast,
                    ScaleType = Enum.ScaleType.Slice,
                    SliceCenter = Rect.new(2, 2, 298, 298)
                },
                {
                    h:Create(
                        "TextLabel",
                        {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            ZIndex = 3,
                            Font = Enum.Font.Gotham,
                            Text = s,
                            TextColor3 = j.TextColor,
                            TextSize = 12,
                            TextXAlignment = "Left",
                            TextTransparency = 0.10000000149012
                        }
                    )
                }
            )
            N.MouseButton1Click:Connect(
                function()
                    if A then
                        A(
                            s,
                            function(...)
                                self:updateDropdown(aD, ...)
                            end
                        )
                    end
                    self:updateDropdown(aD, s, nil, A)
                end
            )
            aS = aS + 1
        end
        local B = aD.List.Frame
        h:Tween(aD, {Size = UDim2.new(1, 0, 0, aS == 0 and 30 or math.clamp(aS, 0, 3) * 34 + 38)}, 0.3)
        h:Tween(aD.Search.Button, {Rotation = aC and 180 or 0}, 0.3)
        if aS > 3 then
            for b, N in pairs(aD.List.Frame:GetChildren()) do
                if N:IsA("ImageButton") then
                    N.Size = UDim2.new(1, -6, 0, 30)
                end
            end
            B.CanvasSize = UDim2.new(0, 0, 0, aS * 34 - 4)
            B.ScrollBarImageTransparency = 0
        else
            B.CanvasSize = UDim2.new(0, 0, 0, 0)
            B.ScrollBarImageTransparency = 1
        end
    end
end
return library
