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
local a = false
local b = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}
local c = {}
local d = {}
do
    function c:Create(e, f, g)
        local h = Instance.new(e)
        for i, j in pairs(f or {}) do
            h[i] = j
            if typeof(j) == "Color3" then
                local k = c:Find(b, j)
                if k then
                    d[k] = d[k] or {}
                    d[k][i] = d[k][i] or setmetatable({}, {_mode = "k"})
                    d[k][i][#d[k][i] + 1] = h
                end
            end
        end
        for i, l in pairs(g or {}) do
            l.Parent = h
        end
        return h
    end
    function c:Tween(e, f, m, ...)
        game:GetService("TweenService"):Create(e, TweenInfo.new(m, ...), f):Play()
    end
    function c:Wait()
        game:GetService("RunService").RenderStepped:Wait()
        return true
    end
    function c:Find(table, n)
        for i, j in pairs(table) do
            if j == n then
                return i
            end
        end
    end
    function c:Sort(o, p)
        local q = {}
        o = o:lower()
        if o == "" then
            return p
        end
        for i, n in pairs(p) do
            if tostring(n):lower():find(o) then
                q[#q + 1] = n
            end
        end
        return q
    end
    function c:Pop(h, r)
        local s = h:Clone()
        s.AnchorPoint = Vector2.new(0.5, 0.5)
        s.Size = s.Size - UDim2.new(0, r, 0, r)
        s.Position = UDim2.new(0.5, 0, 0.5, 0)
        s.Parent = h
        s:ClearAllChildren()
        h.ImageTransparency = 1
        c:Tween(s, {Size = h.Size}, 0.2)
        coroutine.wrap(
            function()
                wait(0.2)
                h.ImageTransparency = 0
                s:Destroy()
            end
        )()
        return s
    end
    function c:InitializeKeybind()
        self.keybinds = {}
        self.ended = {}
        game:GetService("UserInputService").InputBegan:Connect(
            function(t, u)
                if self.keybinds[t.KeyCode] then
                    for i, v in pairs(self.keybinds[t.KeyCode]) do
                        if v.gameProcessedEvent == u then
                            v.callback()
                        end
                    end
                end
            end
        )
        game:GetService("UserInputService").InputEnded:Connect(
            function(t)
                if t.UserInputType == Enum.UserInputType.MouseButton1 then
                    for i, w in pairs(self.ended) do
                        w()
                    end
                end
            end
        )
    end
    function c:BindToKey(t, w, u)
        self.keybinds[t] = self.keybinds[t] or {}
        self.keybinds[t][#self.keybinds[t] + 1] = {callback = w, gameProcessedEvent = u or false}
        return {UnBind = function()
                for i, v in pairs(self.keybinds[t]) do
                    if v == w then
                        table.remove(self.keybinds[t], i)
                    end
                end
            end}
    end
    function c:KeyPressed()
        local t = game:GetService("UserInputService").InputBegan:Wait()
        while t.UserInputType ~= Enum.UserInputType.Keyboard do
            t = game:GetService("UserInputService").InputBegan:Wait()
        end
        wait()
        return t
    end
    function c:DraggingEnabled(x, y)
        y = y or x
        local z = false
        local A, B, C
        x.InputBegan:Connect(
            function(D)
                if D.UserInputType == Enum.UserInputType.MouseButton1 then
                    z = true
                    B = D.Position
                    C = y.Position
                    D.Changed:Connect(
                        function()
                            if D.UserInputState == Enum.UserInputState.End then
                                z = false
                            end
                        end
                    )
                end
            end
        )
        x.InputChanged:Connect(
            function(D)
                if D.UserInputType == Enum.UserInputType.MouseMovement then
                    A = D
                end
            end
        )
        game:GetService("UserInputService").InputChanged:Connect(
            function(D)
                if D == A and z then
                    local E = D.Position - B
                    y.Position = UDim2.new(C.X.Scale, C.X.Offset + E.X, C.Y.Scale, C.Y.Offset + E.Y)
                end
            end
        )
    end
    function c:DraggingEnded(w)
        self.ended[#self.ended + 1] = w
    end
end
local F = {}
local G = {}
local function H(I)
    if a == true then
        return game:GetService("HttpService"):GenerateGUID()
    elseif a == false then
        if GetGuiName == nil then
            local J = {}
            for i = 1, I do
                J[i] = string.char(math.random(32, 126))
            end
            getgenv().GetGuiName = table.concat(J)
            return table.concat(J)
        else
            return getgenv().GetGuiName
        end
    else
        return tostring(a)
    end
end
local K = {}
do
    F.__index = F
    G.__index = G
    K.__index = K
    function F.new(L)
        local M = L[1] or "nil"
        local N =
            c:Create(
            "ScreenGui",
            {Name = H(math.random(10, 20)), Parent = game.CoreGui},
            {
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Main",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.25, 0, 0.052435593, 0),
                        Size = UDim2.new(0, 511, 0, 428),
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = b.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(4, 4, 296, 296)
                    },
                    {
                        c:Create(
                            "ImageLabel",
                            {
                                Name = "Glow",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, -15, 0, -15),
                                Size = UDim2.new(1, 30, 1, 30),
                                ZIndex = 0,
                                Image = "rbxassetid://5028857084",
                                ImageColor3 = b.Glow,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(24, 24, 276, 276)
                            }
                        ),
                        c:Create(
                            "ImageLabel",
                            {
                                Name = "Pages",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Position = UDim2.new(0, 0, 0, 38),
                                Size = UDim2.new(0, 126, 1, -38),
                                ZIndex = 3,
                                Image = "rbxassetid://5012534273",
                                ImageColor3 = b.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                c:Create(
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
                                        c:Create(
                                            "UIListLayout",
                                            {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)}
                                        )
                                    }
                                )
                            }
                        ),
                        c:Create(
                            "ImageLabel",
                            {
                                Name = "TopBar",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 0, 38),
                                ZIndex = 5,
                                Image = "rbxassetid://4595286933",
                                ImageColor3 = b.Accent,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(4, 4, 296, 296)
                            },
                            {
                                c:Create(
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
                                        TextColor3 = b.TextColor,
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
        c:InitializeKeybind()
        c:DraggingEnabled(N.Main.TopBar, N.Main)
        return setmetatable({container = N, pagesContainer = N.Main.Pages.Pages_Container, pages = {}}, F)
    end
    function G.new(F, M, O)
        local P =
            c:Create(
            "TextButton",
            {
                Name = M,
                Parent = F.pagesContainer,
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
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.65,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                O and
                    c:Create(
                        "ImageLabel",
                        {
                            Name = "Icon",
                            AnchorPoint = Vector2.new(0, 0.5),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 12, 0.5, 0),
                            Size = UDim2.new(0, 16, 0, 16),
                            ZIndex = 3,
                            Image = "http://www.roblox.com/asset/?id=" .. tostring(O),
                            ImageColor3 = b.TextColor,
                            ImageTransparency = 0.64
                        }
                    ) or
                    {}
            }
        )
        local N =
            c:Create(
            "ScrollingFrame",
            {
                Name = M,
                Parent = F.container.Main,
                Active = true,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 134, 0, 46),
                Size = UDim2.new(1, -142, 1, -56),
                CanvasSize = UDim2.new(0, 0, 0, 466),
                ScrollBarThickness = 3,
                ScrollBarImageColor3 = b.DarkContrast,
                Visible = false
            },
            {c:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)})}
        )
        return setmetatable({library = F, container = N, button = P, sections = {}}, G)
    end
    function K.new(G, M)
        local N =
            c:Create(
            "ImageLabel",
            {
                Name = M,
                Parent = G.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -10, 0, 28),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.LightContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ClipsDescendants = true
            },
            {
                c:Create(
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
                        c:Create(
                            "TextLabel",
                            {
                                Name = "Title",
                                BackgroundTransparency = 1,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Font = Enum.Font.GothamSemibold,
                                Text = M,
                                TextColor3 = b.TextColor,
                                TextSize = 12,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                TextTransparency = 1
                            }
                        ),
                        c:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)})
                    }
                )
            }
        )
        return setmetatable(
            {page = G, container = N.Container, colorpickers = {}, modules = {}, binds = {}, lists = {}},
            K
        )
    end
    function F:addPage(L)
        local M = L[1] or "nil"
        local O = tonumber(L[2])
        local Q = G.new(self, M, O)
        local P = Q.button
        self.pages[#self.pages + 1] = Q
        P.MouseButton1Click:Connect(
            function()
                self:SelectPage({Q, true})
            end
        )
        return Q
    end
    function G:addSection(L)
        local M = L[1] or "nil"
        local R = K.new(self, M)
        self.sections[#self.sections + 1] = R
        return R
    end
    function F:setTheme(L)
        local k = L[1]
        local S = L[2]
        b[k] = S
        for T, d in pairs(d[k]) do
            for i, h in pairs(d) do
                if not h.Parent or h.Name == "Button" and h.Parent.Name == "ColorPicker" then
                    d[i] = nil
                else
                    h[T] = S
                end
            end
        end
    end
    function F:toggle()
        if self.toggling then
            return
        end
        self.toggling = true
        local N = self.container.Main
        local U = N.TopBar
        if self.position then
            c:Tween(N, {Size = UDim2.new(0, 511, 0, 428), Position = self.position}, 0.2)
            wait(0.2)
            c:Tween(U, {Size = UDim2.new(1, 0, 0, 38)}, 0.2)
            wait(0.2)
            N.ClipsDescendants = false
            self.position = nil
        else
            self.position = N.Position
            N.ClipsDescendants = true
            c:Tween(U, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            c:Tween(N, {Size = UDim2.new(0, 511, 0, 0), Position = self.position + UDim2.new(0, 0, 0, 428)}, 0.2)
            wait(0.2)
        end
        self.toggling = false
    end
    function F:Notify(L)
        local M = L[1] or "nil"
        local V = L[2] or "nil"
        local w = L[3] or function()
            end
        if self.activeNotification then
            self.activeNotification = self.activeNotification()
        end
        local W =
            c:Create(
            "ImageLabel",
            {
                Name = "Notification",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 200, 0, 60),
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(4, 4, 296, 296),
                ZIndex = 3,
                ClipsDescendants = true
            },
            {
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Flash",
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://4641149554",
                        ImageColor3 = b.TextColor,
                        ZIndex = 5
                    }
                ),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = b.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(24, 24, 276, 276)
                    }
                ),
                c:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.GothamSemibold,
                        TextColor3 = b.TextColor,
                        TextSize = 14.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "TextLabel",
                    {
                        Name = "Text",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 1, -24),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 4,
                        Font = Enum.Font.Gotham,
                        TextColor3 = b.TextColor,
                        TextSize = 12.000,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "ImageButton",
                    {
                        Name = "Accept",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538259",
                        ImageColor3 = b.TextColor,
                        ZIndex = 4
                    }
                ),
                c:Create(
                    "ImageButton",
                    {
                        Name = "Decline",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 1, -24),
                        Size = UDim2.new(0, 16, 0, 16),
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = b.TextColor,
                        ZIndex = 4
                    }
                )
            }
        )
        c:DraggingEnabled(W)
        W.Title.Text = M
        W.Text.Text = V
        local X = 10
        local Y = game:GetService("TextService"):GetTextSize(V, 12, Enum.Font.Gotham, Vector2.new(math.huge, 16))
        W.Position = F.lastNotification or UDim2.new(0, X, 1, -(W.AbsoluteSize.Y + X))
        W.Size = UDim2.new(0, 0, 0, 60)
        c:Tween(W, {Size = UDim2.new(0, Y.X + 70, 0, 60)}, 0.2)
        wait(0.2)
        W.ClipsDescendants = false
        c:Tween(W.Flash, {Size = UDim2.new(0, 0, 0, 60), Position = UDim2.new(1, 0, 0, 0)}, 0.2)
        local Z = true
        local _ = function()
            if not Z then
                return
            end
            Z = false
            W.ClipsDescendants = true
            F.lastNotification = W.Position
            W.Flash.Position = UDim2.new(0, 0, 0, 0)
            c:Tween(W.Flash, {Size = UDim2.new(1, 0, 1, 0)}, 0.2)
            wait(0.2)
            c:Tween(W, {Size = UDim2.new(0, 0, 0, 60), Position = W.Position + UDim2.new(0, Y.X + 70, 0, 0)}, 0.2)
            wait(0.2)
            W:Destroy()
        end
        self.activeNotification = _
        W.Accept.MouseButton1Click:Connect(
            function()
                if not Z then
                    return
                end
                if w then
                    w(true)
                end
                _()
            end
        )
        W.Decline.MouseButton1Click:Connect(
            function()
                if not Z then
                    return
                end
                if w then
                    w(false)
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
            c:Create(
            "ImageButton",
            {
                Name = "Button",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = a0.title,
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012
                    }
                )
            }
        )
        local l = {Instance = P, Options = a0}
        self.modules[#self.modules + 1] = l
        local V = P.Title
        local a1
        P.MouseButton1Click:Connect(
            function()
                if a1 then
                    return
                end
                c:Pop(P, 10)
                a1 = true
                V.TextSize = 0
                c:Tween(P.Title, {TextSize = 14}, 0.2)
                wait(0.2)
                c:Tween(P.Title, {TextSize = 12}, 0.2)
                a0.callback()
                a1 = false
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateButton(l)
        end
        return l
    end
    function K:addToggle(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.toggled = L[2] or false
        a0.callback = L[3] or function()
            end
        local a3 =
            c:Create(
            "ImageButton",
            {
                Name = "Toggle",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(1, -50, 0.5, -8),
                        Size = UDim2.new(0, 40, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = b.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        c:Create(
                            "ImageLabel",
                            {
                                Name = "Frame",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 2, 0.5, -6),
                                Size = UDim2.new(1, -22, 1, -4),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = b.TextColor,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                )
            }
        )
        local l = {Instance = a3, Options = a0}
        self.modules[#self.modules + 1] = l
        self:updateToggle(l)
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateToggle(l)
        end
        a3.MouseButton1Click:Connect(
            function()
                a0.toggled = not a0.toggled
                self:updateToggle(l)
                a0.callback(a0.toggled)
            end
        )
        return l
    end
    function K:addTextbox(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.default = L[2] or "nil"
        a0.callback = L[3] or function()
            end
        local a4 =
            c:Create(
            "ImageButton",
            {
                Name = "Textbox",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = b.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        c:Create(
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
                                TextColor3 = b.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local l = {Instance = a4, Options = a0}
        self.modules[#self.modules + 1] = l
        local P = a4.Button
        local a5 = P.Textbox
        a4.MouseButton1Click:Connect(
            function()
                if a4.Button.Size ~= UDim2.new(0, 100, 0, 16) then
                    return
                end
                c:Tween(a4.Button, {Size = UDim2.new(0, 200, 0, 16), Position = UDim2.new(1, -210, 0.5, -8)}, 0.2)
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
                    c:Pop(P, 10)
                end
                a0.callback(a5.Text)
            end
        )
        a5.FocusLost:Connect(
            function()
                a5.TextXAlignment = Enum.TextXAlignment.Center
                c:Tween(a4.Button, {Size = UDim2.new(0, 100, 0, 16), Position = UDim2.new(1, -110, 0.5, -8)}, 0.2)
                a0.callback(a5.Text, true)
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateTextbox(l)
        end
        return l
    end
    function K:addKeybind(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.key = L[2] or Enum.KeyCode.Unknown
        a0.callback = L[3] or function()
            end
        a0.changedCallback = L[4] or function()
            end
        local a6 =
            c:Create(
            "ImageButton",
            {
                Name = "Keybind",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Button",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -110, 0.5, -8),
                        Size = UDim2.new(0, 100, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = b.LightContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        c:Create(
                            "TextLabel",
                            {
                                Name = "Text",
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                Size = UDim2.new(1, 0, 1, 0),
                                ZIndex = 3,
                                Font = Enum.Font.GothamSemibold,
                                Text = game:GetService("UserInputService"):GetStringForKeyCode(a0.key),
                                TextColor3 = b.TextColor,
                                TextSize = 11
                            }
                        )
                    }
                )
            }
        )
        local l = {Instance = a6, Options = a0}
        self.modules[#self.modules + 1] = l
        local V = a6.Button.Text
        local P = a6.Button
        local a7 = function()
            if P.ImageTransparency == 0 then
                c:Pop(P, 10)
            end
        end
        self.binds[a6] = {callback = function()
                a7()
                a0.callback()
            end}
        self:updateKeybind(l)
        a6.MouseButton1Click:Connect(
            function()
                a7()
                if self.binds[a6].connection then
                    a0.key = Enum.KeyCode.Unknown
                    return self:updateKeybind(l)
                end
                if V.Text == "Unknown" then
                    V.Text = "..."
                    a0.key = c:KeyPressed()
                    self:updateKeybind(l)
                    a7()
                    a0.changedCallback(a0.key)
                end
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateKeybind(l)
        end
        return l
    end
    function K:addColorPicker(L)
        local a0 = {}
        a0.title = L[1] or "nil"
        a0.default = L[2] or Color3.new(255, 150, 150)
        a0.callback = L[3] or function()
            end
        local a8 =
            c:Create(
            "ImageButton",
            {
                Name = "ColorPicker",
                Parent = self.container,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                ZIndex = 2,
                Image = "rbxassetid://5028857472",
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
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
            c:Create(
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
                ImageColor3 = b.Background,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298),
                Visible = false
            },
            {
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Glow",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, -15, 0, -15),
                        Size = UDim2.new(1, 30, 1, 30),
                        ZIndex = 0,
                        Image = "rbxassetid://5028857084",
                        ImageColor3 = b.Glow,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(22, 22, 278, 278)
                    }
                ),
                c:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 8),
                        Size = UDim2.new(1, -40, 0, 16),
                        ZIndex = 2,
                        Font = Enum.Font.GothamSemibold,
                        Text = a0.title,
                        TextColor3 = b.TextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
                    "ImageButton",
                    {
                        Name = "Close",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(1, -26, 0, 8),
                        Size = UDim2.new(0, 16, 0, 16),
                        ZIndex = 2,
                        Image = "rbxassetid://5012538583",
                        ImageColor3 = b.TextColor
                    }
                ),
                c:Create(
                    "Frame",
                    {
                        Name = "Container",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 8, 0, 32),
                        Size = UDim2.new(1, -18, 1, -40)
                    },
                    {
                        c:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}),
                        c:Create(
                            "ImageButton",
                            {
                                Name = "Canvas",
                                BackgroundTransparency = 1,
                                BorderColor3 = b.LightContrast,
                                Size = UDim2.new(1, 0, 0, 60),
                                AutoButtonColor = false,
                                Image = "rbxassetid://5108535320",
                                ImageColor3 = Color3.fromRGB(255, 0, 0),
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "White_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152351",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Black_Overlay",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 0, 60),
                                        Image = "rbxassetid://5107152095",
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    }
                                ),
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Cursor",
                                        BackgroundColor3 = b.TextColor,
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
                        c:Create(
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
                                c:Create(
                                    "Frame",
                                    {
                                        Name = "Select",
                                        BackgroundColor3 = b.TextColor,
                                        BorderSizePixel = 1,
                                        Position = UDim2.new(1, 0, 0, 0),
                                        Size = UDim2.new(0, 2, 1, 0),
                                        ZIndex = 2
                                    }
                                ),
                                c:Create(
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
                        c:Create(
                            "Frame",
                            {
                                Name = "Inputs",
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 10, 0, 158),
                                Size = UDim2.new(1, 0, 0, 16)
                            },
                            {
                                c:Create(
                                    "UIListLayout",
                                    {
                                        FillDirection = Enum.FillDirection.Horizontal,
                                        SortOrder = Enum.SortOrder.LayoutOrder,
                                        Padding = UDim.new(0, 6)
                                    }
                                ),
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "R",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = b.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        c:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "R:",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        c:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                PlaceholderColor3 = b.DarkContrast,
                                                Text = "255",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "G",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = b.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        c:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                ZIndex = 2,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                Font = Enum.Font.Gotham,
                                                Text = "G:",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        c:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                ),
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "B",
                                        BackgroundTransparency = 1,
                                        BorderSizePixel = 0,
                                        Size = UDim2.new(0.305, 0, 1, 0),
                                        ZIndex = 2,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = b.DarkContrast,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        c:Create(
                                            "TextLabel",
                                            {
                                                Name = "Text",
                                                BackgroundTransparency = 1,
                                                Size = UDim2.new(0.400000006, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "B:",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        ),
                                        c:Create(
                                            "TextBox",
                                            {
                                                Name = "Textbox",
                                                BackgroundTransparency = 1,
                                                Position = UDim2.new(0.300000012, 0, 0, 0),
                                                Size = UDim2.new(0.600000024, 0, 1, 0),
                                                ZIndex = 2,
                                                Font = Enum.Font.Gotham,
                                                Text = "255",
                                                TextColor3 = b.TextColor,
                                                TextSize = 10.000
                                            }
                                        )
                                    }
                                )
                            }
                        ),
                        c:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.new(1, 0, 0, 20),
                                ZIndex = 2,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = b.DarkContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                c:Create(
                                    "TextLabel",
                                    {
                                        Name = "Text",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(1, 0, 1, 0),
                                        ZIndex = 3,
                                        Font = Enum.Font.Gotham,
                                        Text = "Submit",
                                        TextColor3 = b.TextColor,
                                        TextSize = 11.000
                                    }
                                )
                            }
                        )
                    }
                )
            }
        )
        c:DraggingEnabled(a9)
        local l = {Instance = a8, Options = a0}
        self.modules[#self.modules + 1] = l
        local aa = {[""] = true}
        local ab = a9.Container.Canvas
        local ac = a9.Container.Color
        local ad, ae = ab.AbsoluteSize, ab.AbsolutePosition
        local af, ag = ac.AbsoluteSize, ac.AbsolutePosition
        local ah, ai
        local aj, ak, al = 0, 0, 1
        local am = {r = 255, g = 255, b = 255}
        self.colorpickers[a8] = {tab = a9, callback = function(an, n)
                am[an] = n
                aj, ak, al = Color3.toHSV(Color3.fromRGB(am.r, am.g, am.b))
            end}
        c:DraggingEnded(
            function()
                ah, ai = false, false
            end
        )
        self:updateColorPicker(l)
        aj, ak, al = Color3.toHSV(a0.default)
        a0.default = Color3.fromHSV(aj, ak, al)
        for i, an in pairs({"r", "g", "b"}) do
            am[an] = a0.default[an:upper()] * 255
        end
        for i, N in pairs(a9.Container.Inputs:GetChildren()) do
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
                            self:updateColorPicker(l)
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
                    for i, an in pairs({"r", "g", "b"}) do
                        am[an] = a0.color3[an:upper()] * 255
                    end
                    a0.default = Color3.fromHSV(aj, ak, al)
                    self:updateColorPicker(l)
                    c:Tween(ab.Cursor, {Position = UDim2.new(ak, 0, 1 - al, 0)}, 0.1)
                    a0.callback(a0.color3)
                    c:Wait()
                end
            end
        )
        ac.MouseButton1Down:Connect(
            function()
                ah = true
                while ah do
                    aj = 1 - math.clamp(1 - (game.Players.LocalPlayer:GetMouse().X - ag.X) / af.X, 0, 1)
                    a0.color3 = Color3.fromHSV(aj, ak, al)
                    for i, an in pairs({"r", "g", "b"}) do
                        am[an] = a0.color3[an:upper()] * 255
                    end
                    local ap = aj
                    a0.default = Color3.fromHSV(aj, ak, al)
                    self:updateColorPicker(l)
                    c:Tween(a9.Container.Color.Select, {Position = UDim2.new(ap, 0, 0, 0)}, 0.1)
                    a0.callback(a0.color3)
                    c:Wait()
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
                        c:Wait()
                    end
                end
            elseif not at then
                if a1 then
                    return
                end
                if P.ImageTransparency == 0 then
                    c:Pop(P, 10)
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
                c:Tween(a9, {Size = UDim2.new(0, 162, 0, 169)}, 0.2)
                wait(0.2)
                a9.ClipsDescendants = false
                ad, ae = ab.AbsoluteSize, ab.AbsolutePosition
                af, ag = ac.AbsoluteSize, ac.AbsolutePosition
            else
                c:Tween(a9, {Size = UDim2.new(0, 0, 0, 0)}, 0.2)
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
                self:updateColorPicker(l)
                a7()
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateColorPicker(l)
        end
        return l
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
        a0.value = nil
        local az =
            c:Create(
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
                ImageColor3 = b.DarkContrast,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(2, 2, 298, 298)
            },
            {
                c:Create(
                    "TextLabel",
                    {
                        Name = "Title",
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 6),
                        Size = UDim2.new(0.5, 0, 0, 16),
                        ZIndex = 3,
                        Font = Enum.Font.Gotham,
                        Text = L.title,
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextTransparency = 0.10000000149012,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                ),
                c:Create(
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
                        TextColor3 = b.TextColor,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Right
                    }
                ),
                c:Create(
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
                        c:Create(
                            "ImageLabel",
                            {
                                Name = "Bar",
                                AnchorPoint = Vector2.new(0, 0.5),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 0, 0.5, 0),
                                Size = UDim2.new(1, 0, 0, 4),
                                ZIndex = 3,
                                Image = "rbxassetid://5028857472",
                                ImageColor3 = b.LightContrast,
                                ScaleType = Enum.ScaleType.Slice,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            },
                            {
                                c:Create(
                                    "ImageLabel",
                                    {
                                        Name = "Fill",
                                        BackgroundTransparency = 1,
                                        Size = UDim2.new(0.8, 0, 1, 0),
                                        ZIndex = 3,
                                        Image = "rbxassetid://5028857472",
                                        ImageColor3 = b.TextColor,
                                        ScaleType = Enum.ScaleType.Slice,
                                        SliceCenter = Rect.new(2, 2, 298, 298)
                                    },
                                    {
                                        c:Create(
                                            "ImageLabel",
                                            {
                                                Name = "Circle",
                                                AnchorPoint = Vector2.new(0.5, 0.5),
                                                BackgroundTransparency = 1,
                                                ImageTransparency = 1.000,
                                                ImageColor3 = b.TextColor,
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
        local l = {Instance = az, Options = a0}
        self.modules[#self.modules + 1] = l
        local aa = {[""] = true, ["-"] = true}
        local a4 = az.TextBox
        local aA = az.Slider.Bar.Fill.Circle
        local z
        self:updateSlider(l)
        c:DraggingEnded(
            function()
                z = false
            end
        )
        az.MouseButton1Down:Connect(
            function()
                z = true
                while z do
                    c:Tween(aA, {ImageTransparency = 0}, 0.1)
                    a0.value = nil
                    a0.value = self:updateSlider(l)
                    a0.callback(a0.value)
                    c:Wait()
                end
                wait(0.5)
                c:Tween(aA, {ImageTransparency = 1}, 0.2)
            end
        )
        a4.FocusLost:Connect(
            function()
                if not tonumber(a4.Text) then
                    a0.value = nil
                    a0.value = self:updateSlider(l)
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
                    a0.value = self:updateSlider(l)
                    a0.callback(a0.value)
                end
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if l.Options[i] and i ~= "Update" then
                    l.Options[i] = tostring(j)
                end
            end
            return K:updateSlider(l)
        end
        return l
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
            c:Create(
            "Frame",
            {
                Name = "Dropdown",
                Parent = self.container,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 30),
                ClipsDescendants = true
            },
            {
                c:Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "Search",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = b.DarkContrast,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        c:Create(
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
                                TextColor3 = b.TextColor,
                                TextSize = 12,
                                TextTransparency = 0.10000000149012,
                                TextXAlignment = Enum.TextXAlignment.Left
                            }
                        ),
                        c:Create(
                            "ImageButton",
                            {
                                Name = "Button",
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Position = UDim2.new(1, -28, 0.5, -9),
                                Size = UDim2.new(0, 18, 0, 18),
                                ZIndex = 3,
                                Image = "rbxassetid://5012539403",
                                ImageColor3 = b.TextColor,
                                SliceCenter = Rect.new(2, 2, 298, 298)
                            }
                        )
                    }
                ),
                c:Create(
                    "ImageLabel",
                    {
                        Name = "List",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, -34),
                        ZIndex = 2,
                        Image = "rbxassetid://5028857472",
                        ImageColor3 = b.Background,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(2, 2, 298, 298)
                    },
                    {
                        c:Create(
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
                                ScrollBarImageColor3 = b.DarkContrast
                            },
                            {
                                c:Create(
                                    "UIListLayout",
                                    {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}
                                )
                            }
                        )
                    }
                )
            }
        )
        local l = {Instance = aB, Options = a0}
        self.modules[#self.modules + 1] = l
        local aC = aB.Search
        local ao
        for i, j in pairs(a0.list) do
            a0.list[i] = tostring(j)
        end
        aC.Button.MouseButton1Click:Connect(
            function()
                if aC.Button.Rotation == 0 then
                    a0.title = nil
                    self:updateDropdown(l)
                else
                    a0.title = nil
                    self:updateDropdown(l, {update = {}})
                end
            end
        )
        aC.TextBox.Focused:Connect(
            function()
                if aC.Button.Rotation == 0 then
                    a0.title = nil
                    self:updateDropdown(l, {update = {}})
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
                    local aD = c:Sort(aC.TextBox.Text, a0.list)
                    local aE = #aD ~= 0 and aD
                    a0.title = nil
                    self:updateDropdown(l, {update = aE})
                end
            end
        )
        aB:GetPropertyChangedSignal("Size"):Connect(
            function()
                self:Resize()
            end
        )
        function a0:Update(a2)
            for i, j in pairs(a2) do
                if i ~= "Update" and l.Options[i] then
                    if i == "list" then
                        for I, ap in pairs(j) do
                            j[I] = tostring(ap)
                        end
                    end
                    l.Options[i] = i == "list" and j or tostring(j)
                end
            end
            return K:updateDropdown(l, {noOpen = a2["list"]})
        end
        if a0.default then
            a0:Update({title = a0.default})
        end
        return l
    end
    function F:SelectPage(L)
        local aF = L[1]
        local a3 = L[2]
        if a3 and self.focusedPage == G then
            return
        end
        local P = aF.button
        if a3 then
            P.Title.TextTransparency = 0
            P.Title.Font = Enum.Font.GothamSemibold
            if P:FindFirstChild("Icon") then
                P.Icon.ImageTransparency = 0
            end
            local aG = self.focusedPage
            self.focusedPage = aF
            if aG then
                self:SelectPage({aG})
            end
            local aH = aG and #aG.sections or 0
            local aI = #aF.sections - aH
            aF:Resize()
            for i = 1, #aF.sections do
                local aJ = aF.sections[i]
                aJ.container.Parent.ImageTransparency = 0
            end
            if aI < 0 then
                for i = aH, #aF.sections + 1, -1 do
                    local aJ = aG.sections[i].container.Parent
                    c:Tween(aJ, {ImageTransparency = 1}, 0.1)
                end
            end
            wait(0.1)
            aF.container.Visible = true
            if aG then
                aG.container.Visible = false
            end
            if aI > 0 then
                for i = aH + 1, #aF.sections do
                    local aJ = aF.sections[i].container.Parent
                    aJ.ImageTransparency = 1
                    c:Tween(aJ, {ImageTransparency = 0}, 0.05)
                end
            end
            wait(0.05)
            for i = 1, #aF.sections do
                local aJ = aF.sections[i]
                c:Tween(aJ.container.Title, {TextTransparency = 0}, 0.1)
                aJ:Resize(true)
                wait(0.05)
            end
            wait(0.05)
            aF:Resize(true)
        else
            P.Title.Font = Enum.Font.Gotham
            P.Title.TextTransparency = 0.65
            if P:FindFirstChild("Icon") then
                P.Icon.ImageTransparency = 0.65
            end
            for i = 1, #aF.sections do
                local aJ = aF.sections[i]
                c:Tween(aJ.container.Parent, {Size = UDim2.new(1, -10, 0, 28)}, 0.1)
                c:Tween(aJ.container.Title, {TextTransparency = 1}, 0.1)
            end
            wait(0.1)
            aF.lastPosition = aF.container.CanvasPosition.Y
            aF:Resize()
        end
    end
    function G:Resize(aK)
        local X = 10
        local aL = 0
        for i = 1, #self.sections do
            local aJ = self.sections[i]
            aL = aL + aJ.container.Parent.AbsoluteSize.Y + X
        end
        self.container.CanvasSize = UDim2.new(0, 0, 0, aL)
        self.container.ScrollBarImageTransparency = aL > self.container.AbsoluteSize.Y
        if aK then
            c:Tween(self.container, {CanvasPosition = Vector2.new(0, self.lastPosition or 0)}, 0.2)
        end
    end
    function K:Resize(aM)
        if self.page.library.focusedPage ~= self.page then
            return
        end
        local X = 4
        local aL = 4 * X + self.container.Title.AbsoluteSize.Y
        for i, l in pairs(self.modules) do
            aL = aL + l.Instance.AbsoluteSize.Y + X
        end
        if aM then
            c:Tween(self.container.Parent, {Size = UDim2.new(1, -10, 0, aL)}, 0.05)
        else
            self.container.Parent.Size = UDim2.new(1, -10, 0, aL)
            self.page:Resize()
        end
    end
    function K:getModule(aN)
        for i = 1, #self.modules do
            local l = self.modules[i]
            local h = l.Instance
            if (h:FindFirstChild("Title") or h:FindFirstChild("TextBox", true)).Text == aN or h == aN then
                return l
            end
        end
        error("No module found under " .. tostring(aN.Instance))
    end
    function K:updateButton(l)
        l.Instance.Title.Text = l.Options.title
    end
    function K:updateToggle(l)
        local a3 = l.Instance
        local aO = l.Options
        local aP = {In = UDim2.new(0, 2, 0.5, -6), Out = UDim2.new(0, 20, 0.5, -6)}
        local x = a3.Button.Frame
        local aQ = aO.toggled and "Out" or "In"
        a3.Title.Text = l.Options.title
        c:Tween(x, {Size = UDim2.new(1, -22, 1, -9), Position = aP[aQ] + UDim2.new(0, 0, 0, 2.5)}, 0.2)
        wait(0.1)
        c:Tween(x, {Size = UDim2.new(1, -22, 1, -4), Position = aP[aQ]}, 0.1)
    end
    function K:updateTextbox(l)
        l.Instance.Title.Text = l.Options.title
        l.Instance.Button.Textbox.Text = l.Options.default
    end
    function K:updateKeybind(l)
        local a6 = l.Instance
        local aO = l.Options
        if typeof(aO.key) == "Instance" and aO.key:IsA("InputObject") then
            aO.key = aO.key.KeyCode
        end
        local V = a6.Button.Text
        local v = self.binds[a6]
        a6.Title.Text = l.Options.title
        if v.connection then
            v.connection = v.connection:UnBind()
        end
        if aO.key ~= Enum.KeyCode.Unknown then
            self.binds[a6].connection = c:BindToKey(aO.key, v.callback, aO.gameProcessedEvent)
            V.Text = game:GetService("UserInputService"):GetStringForKeyCode(aO.key)
        else
            V.Text = "Unknown"
        end
    end
    function K:updateColorPicker(l)
        local a8 = l.Instance
        local aO = l.Options
        local aR = self.colorpickers[a8]
        local a9 = aR.tab
        a8.Title.Text = aO.title
        a9.Title.Text = aO.title
        local S
        local aj, ak, al
        if typeof(aO.default) == "table" then
            aj, ak, al = unpack(aO.default)
            S = Color3.fromHSV(aj, ak, al)
        else
            S = aO.default
            aj, ak, al = Color3.toHSV(S)
        end
        c:Tween(a8.Button, {ImageColor3 = S}, 0.5)
        c:Tween(a9.Container.Color.Select, {Position = UDim2.new(aj, 0, 0, 0)}, 0.1)
        c:Tween(a9.Container.Canvas, {ImageColor3 = Color3.fromHSV(aj, 1, 1)}, 0.5)
        c:Tween(a9.Container.Canvas.Cursor, {Position = UDim2.new(ak, 0, 1 - al)}, 0.5)
        for i, N in pairs(a9.Container.Inputs:GetChildren()) do
            if N:IsA("ImageLabel") then
                local n = math.clamp(S[N.Name], 0, 1) * 255
                N.Textbox.Text = math.floor(n)
            end
        end
    end
    function K:updateSlider(l)
        local az = l.Instance
        local aO = l.Options
        az.Title.Text = aO.title
        local aS = az.Slider.Bar
        local aT = (game.Players.LocalPlayer:GetMouse().X - aS.AbsolutePosition.X) / aS.AbsoluteSize.X
        if aO.value then
            aT = (aO.value - aO.min) / (aO.max - aO.min)
        end
        local function aU(aV, aW)
            if aW == 0 then
                return math.floor(aV)
            elseif aW == -1 then
                return aV
            else
                return math.floor(aV * math.pow(10, aW) + 0.5) / math.pow(10, aW)
            end
        end
        aT = math.clamp(aT, 0, 1)
        aO.value = aO.value or aU(aO.min + (aO.max - aO.min) * aT, aO.precision)
        az.TextBox.Text = aO.value
        c:Tween(aS.Fill, {Size = UDim2.new(aT, 0, 1, 0)}, 0.1)
        if aO.value ~= aO.lvalue and az.ImageTransparency == 0 then
            c:Pop(az, 10)
        end
        return aO.value
    end
    function K:updateDropdown(l, aX)
        local aB = l.Instance
        local aO = l.Options
        aX = aX or {}
        if aO.title then
            aB.Search.TextBox.Text = aO.title
        end
        local aY = 0
        c:Pop(aB.Search, 10)
        for i, P in pairs(aB.List.Frame:GetChildren()) do
            if P:IsA("ImageButton") then
                P:Destroy()
            end
        end
        local aE = aX.update or aO.list
        for i, n in pairs(aE) do
            local P =
                c:Create(
                "ImageButton",
                {
                    Parent = aB.List.Frame,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                    ZIndex = 2,
                    Image = "rbxassetid://5028857472",
                    ImageColor3 = b.DarkContrast,
                    ScaleType = Enum.ScaleType.Slice,
                    SliceCenter = Rect.new(2, 2, 298, 298)
                },
                {
                    c:Create(
                        "TextLabel",
                        {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            ZIndex = 3,
                            Font = Enum.Font.Gotham,
                            Text = n,
                            TextColor3 = b.TextColor,
                            TextSize = 12,
                            TextXAlignment = "Left",
                            TextTransparency = 0.10000000149012
                        }
                    )
                }
            )
            P.MouseButton1Click:Connect(
                function()
                    aO.callback(n)
                    aO.title = n
                    self:updateDropdown(l, {update = n and {} or false})
                end
            )
            aY = aY + 1
        end
        local x = aB.List.Frame
        if not aX.noOpen then
            c:Tween(aB, {Size = UDim2.new(1, 0, 0, aY == 0 and 30 or math.clamp(aY, 0, 3) * 34 + 38)}, 0.3)
            c:Tween(aB.Search.Button, {Rotation = not aX.update and 180 or 0}, 0.3)
        end
        if aY > 3 then
            for i, P in pairs(aB.List.Frame:GetChildren()) do
                if P:IsA("ImageButton") then
                    P.Size = UDim2.new(1, -6, 0, 30)
                end
            end
            x.CanvasSize = UDim2.new(0, 0, 0, aY * 34 - 4)
            x.ScrollBarImageTransparency = 0
        else
            x.CanvasSize = UDim2.new(0, 0, 0, 0)
            x.ScrollBarImageTransparency = 1
        end
    end
end
return F
