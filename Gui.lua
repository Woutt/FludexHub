local a=game:GetService("Players").LocalPlayer:GetMouse()local b=game:GetService("UserInputService")local c=TweenInfo.new;local d={}local e={}local f={Background=Color3.fromRGB(24,24,24),Glow=Color3.fromRGB(0,0,0),Accent=Color3.fromRGB(10,10,10),LightContrast=Color3.fromRGB(20,20,20),DarkContrast=Color3.fromRGB(14,14,14),TextColor=Color3.fromRGB(255,255,255)}if GetGuiName==nil then local g={}for h=1,math.random(10,20)do g[h]=string.char(math.random(32,126))end;getgenv().GetGuiName=table.concat(g)end;do function d:Create(i,j,k)local l=Instance.new(i)for h,m in pairs(j or{})do l[h]=m;if typeof(m)=="Color3"then local n=d:Find(f,m)if n then e[n]=e[n]or{}e[n][h]=e[n][h]or setmetatable({},{_mode="k"})table.insert(e[n][h],l)end end end;for h,o in pairs(k or{})do o.Parent=l end;return l end;function d:Tween(i,j,p,...)game:GetService("TweenService"):Create(i,c(p,...),j):Play()end;function d:Wait()game:GetService("RunService").RenderStepped:Wait()return true end;function d:Find(table,q)for h,m in pairs(table)do if m==q then return h end end end;function d:Sort(r,s)local t={}r=r:lower()if r==""then return s end;for h,q in pairs(s)do if tostring(q):lower():find(r)then table.insert(t,q)end end;return t end;function d:Pop(l,u)local v=l:Clone()v.AnchorPoint=Vector2.new(0.5,0.5)v.Size=v.Size-UDim2.new(0,u,0,u)v.Position=UDim2.new(0.5,0,0.5,0)v.Parent=l;v:ClearAllChildren()l.ImageTransparency=1;d:Tween(v,{Size=l.Size},0.2)coroutine.wrap(function()wait(0.2)l.ImageTransparency=0;v:Destroy()end)()return v end;function d:InitializeKeybind()self.keybinds={}self.ended={}b.InputBegan:Connect(function(w)if self.keybinds[w.KeyCode]then for h,x in pairs(self.keybinds[w.KeyCode])do x()end end end)b.InputEnded:Connect(function(w)if w.UserInputType==Enum.UserInputType.MouseButton1 then for h,y in pairs(self.ended)do y()end end end)end;function d:BindToKey(w,y)self.keybinds[w]=self.keybinds[w]or{}table.insert(self.keybinds[w],y)return{UnBind=function()for h,x in pairs(self.keybinds[w])do if x==y then table.remove(self.keybinds[w],h)end end end}end;function d:KeyPressed()local w=b.InputBegan:Wait()while w.UserInputType~=Enum.UserInputType.Keyboard do w=b.InputBegan:Wait()end;wait()return w end;function d:DraggingEnabled(z,A)A=A or z;local B=false;local C,D,E;z.InputBegan:Connect(function(b)if b.UserInputType==Enum.UserInputType.MouseButton1 then B=true;D=b.Position;E=A.Position;b.Changed:Connect(function()if b.UserInputState==Enum.UserInputState.End then B=false end end)end end)z.InputChanged:Connect(function(b)if b.UserInputType==Enum.UserInputType.MouseMovement then C=b end end)b.InputChanged:Connect(function(b)if b==C and B then local F=b.Position-D;A.Position=UDim2.new(E.X.Scale,E.X.Offset+F.X,E.Y.Scale,E.Y.Offset+F.Y)end end)end;function d:DraggingEnded(y)table.insert(self.ended,y)end end;local G={}local H={}local I={}do G.__index=G;H.__index=H;I.__index=I;function G.new(J)local K=d:Create("ScreenGui",{Name=GetGuiName,Parent=game:GetService("CoreGui")},{d:Create("ImageLabel",{Name="Main",BackgroundTransparency=1,Position=UDim2.new(0.25,0,0.052435593,0),Size=UDim2.new(0,511,0,428),Image="rbxassetid://4641149554",ImageColor3=f.Background,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(4,4,296,296)},{d:Create("ImageLabel",{Name="Glow",BackgroundTransparency=1,Position=UDim2.new(0,-15,0,-15),Size=UDim2.new(1,30,1,30),ZIndex=0,Image="rbxassetid://5028857084",ImageColor3=f.Glow,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(24,24,276,276)}),d:Create("ImageLabel",{Name="Pages",BackgroundTransparency=1,ClipsDescendants=true,Position=UDim2.new(0,0,0,38),Size=UDim2.new(0,126,1,-38),ZIndex=3,Image="rbxassetid://5012534273",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(4,4,296,296)},{d:Create("ScrollingFrame",{Name="Pages_Container",Active=true,BackgroundTransparency=1,Position=UDim2.new(0,0,0,10),Size=UDim2.new(1,0,1,-20),CanvasSize=UDim2.new(0,0,0,314),ScrollBarThickness=0},{d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,10)})})}),d:Create("ImageLabel",{Name="TopBar",BackgroundTransparency=1,ClipsDescendants=true,Size=UDim2.new(1,0,0,38),ZIndex=5,Image="rbxassetid://4595286933",ImageColor3=f.Accent,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(4,4,296,296)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,12,0,19),Size=UDim2.new(1,-46,0,16),ZIndex=5,Font=Enum.Font.GothamBold,Text=J,TextColor3=f.TextColor,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left})})})})d:InitializeKeybind()d:DraggingEnabled(K.Main.TopBar,K.Main)return setmetatable({container=K,pagesContainer=K.Main.Pages.Pages_Container,pages={}},G)end;function H.new(G,J,L)local M=d:Create("TextButton",{Name=J,Parent=G.pagesContainer,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,26),ZIndex=3,AutoButtonColor=false,Font=Enum.Font.Gotham,Text="",TextSize=14},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(0,76,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.65,TextXAlignment=Enum.TextXAlignment.Left}),L and d:Create("ImageLabel",{Name="Icon",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,12,0.5,0),Size=UDim2.new(0,16,0,16),ZIndex=3,Image="rbxassetid://"..tostring(L),ImageColor3=f.TextColor,ImageTransparency=0.64})or{}})local K=d:Create("ScrollingFrame",{Name=J,Parent=G.container.Main,Active=true,BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,134,0,46),Size=UDim2.new(1,-142,1,-56),CanvasSize=UDim2.new(0,0,0,466),ScrollBarThickness=3,ScrollBarImageColor3=f.DarkContrast,Visible=false},{d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,10)})})return setmetatable({library=G,container=K,button=M,sections={}},H)end;function I.new(H,J)local K=d:Create("ImageLabel",{Name=J,Parent=H.container,BackgroundTransparency=1,Size=UDim2.new(1,-10,0,28),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.LightContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(4,4,296,296),ClipsDescendants=true},{d:Create("Frame",{Name="Container",Active=true,BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,8,0,8),Size=UDim2.new(1,-16,1,-16)},{d:Create("TextLabel",{Name="Title",BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),ZIndex=2,Font=Enum.Font.GothamSemibold,Text=J,TextColor3=f.TextColor,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1}),d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)})})})return setmetatable({page=H,container=K.Container,colorpickers={},modules={},binds={},lists={}},I)end;function G:addPage(...)local H=H.new(self,...)local M=H.button;table.insert(self.pages,H)M.MouseButton1Click:Connect(function()self:SelectPage(H,true)end)return H end;function H:addSection(...)local I=I.new(self,...)table.insert(self.sections,I)return I end;function G:setTheme(n,N)f[n]=N;for O,e in pairs(e[n])do for h,l in pairs(e)do if not l.Parent or l.Name=="Button"and l.Parent.Name=="ColorPicker"then e[h]=nil else l[O]=N end end end end;function G:getTheme(n)if e[n]then for O,e in pairs(e[n])do for h,l in pairs(e)do if not l.Parent or l.Name=="Button"and l.Parent.Name=="ColorPicker"then e[h]=nil else return l[O]end end end end end;function G:toggle()if self.toggling then return end;self.toggling=true;local K=self.container.Main;local P=K.TopBar;if self.position then d:Tween(K,{Size=UDim2.new(0,511,0,428),Position=self.position},0.2)wait(0.2)d:Tween(P,{Size=UDim2.new(1,0,0,38)},0.2)wait(0.2)K.ClipsDescendants=false;self.position=nil else self.position=K.Position;K.ClipsDescendants=true;d:Tween(P,{Size=UDim2.new(1,0,1,0)},0.2)wait(0.2)d:Tween(K,{Size=UDim2.new(0,511,0,0),Position=self.position+UDim2.new(0,0,0,428)},0.2)wait(0.2)end;self.toggling=false end;function G:Notify(J,Q,y)if self.activeNotification then self.activeNotification=self.activeNotification()end;local R=d:Create("ImageLabel",{Name="Notification",Parent=self.container,BackgroundTransparency=1,Size=UDim2.new(0,200,0,60),Image="rbxassetid://5028857472",ImageColor3=f.Background,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(4,4,296,296),ZIndex=3,ClipsDescendants=true},{d:Create("ImageLabel",{Name="Flash",Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://4641149554",ImageColor3=f.TextColor,ZIndex=5}),d:Create("ImageLabel",{Name="Glow",BackgroundTransparency=1,Position=UDim2.new(0,-15,0,-15),Size=UDim2.new(1,30,1,30),ZIndex=2,Image="rbxassetid://5028857084",ImageColor3=f.Glow,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(24,24,276,276)}),d:Create("TextLabel",{Name="Title",BackgroundTransparency=1,Position=UDim2.new(0,10,0,8),Size=UDim2.new(1,-40,0,16),ZIndex=4,Font=Enum.Font.GothamSemibold,TextColor3=f.TextColor,TextSize=14.000,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,Position=UDim2.new(0,10,1,-24),Size=UDim2.new(1,-40,0,16),ZIndex=4,Font=Enum.Font.Gotham,TextColor3=f.TextColor,TextSize=12.000,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageButton",{Name="Accept",BackgroundTransparency=1,Position=UDim2.new(1,-26,0,8),Size=UDim2.new(0,16,0,16),Image="rbxassetid://5012538259",ImageColor3=f.TextColor,ZIndex=4}),d:Create("ImageButton",{Name="Decline",BackgroundTransparency=1,Position=UDim2.new(1,-26,1,-24),Size=UDim2.new(0,16,0,16),Image="rbxassetid://5012538583",ImageColor3=f.TextColor,ZIndex=4})})d:DraggingEnabled(R)J=J or"Notification"Q=Q or""R.Title.Text=J;R.Text.Text=Q;local S=10;local T=game:GetService("TextService"):GetTextSize(Q,12,Enum.Font.Gotham,Vector2.new(math.huge,16))R.Position=G.lastNotification or UDim2.new(0,S,1,-(R.AbsoluteSize.Y+S))R.Size=UDim2.new(0,0,0,60)d:Tween(R,{Size=UDim2.new(0,T.X+70,0,60)},0.2)wait(0.2)R.ClipsDescendants=false;d:Tween(R.Flash,{Size=UDim2.new(0,0,0,60),Position=UDim2.new(1,0,0,0)},0.2)local U=true;local V=function()if not U then return end;U=false;R.ClipsDescendants=true;G.lastNotification=R.Position;R.Flash.Position=UDim2.new(0,0,0,0)d:Tween(R.Flash,{Size=UDim2.new(1,0,1,0)},0.2)wait(0.2)d:Tween(R,{Size=UDim2.new(0,0,0,60),Position=R.Position+UDim2.new(0,T.X+70,0,0)},0.2)wait(0.2)R:Destroy()end;self.activeNotification=V;R.Accept.MouseButton1Click:Connect(function()if not U then return end;if y then y(true)end;V()end)R.Decline.MouseButton1Click:Connect(function()if not U then return end;if y then y(false)end;V()end)end;function I:addLabel(J,W,y)local X=d:Create("ImageButton",{Name="Textbox",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(0.5,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left})})table.insert(self.modules,X)return X end;function I:addButton(J,y)local M=d:Create("ImageButton",{Name="Button",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012})})table.insert(self.modules,M)local Q=M.Title;local Y;M.MouseButton1Click:Connect(function()if Y then return end;d:Pop(M,10)Y=true;Q.TextSize=0;d:Tween(M.Title,{TextSize=14},0.2)wait(0.2)d:Tween(M.Title,{TextSize=12},0.2)if y then y(function(...)self:updateButton(M,...)end)end;Y=false end)return M end;function I:addToggle(J,W,y)local Z=d:Create("ImageButton",{Name="Toggle",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(0.5,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageLabel",{Name="Button",BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(1,-50,0.5,-8),Size=UDim2.new(0,40,0,16),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.LightContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("ImageLabel",{Name="Frame",BackgroundTransparency=1,Position=UDim2.new(0,2,0.5,-6),Size=UDim2.new(1,-22,1,-4),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.TextColor,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)})})})table.insert(self.modules,Z)local U=W;local _={}self:updateToggle(Z,nil,U)function _:Get()return U end;function _:updateToggle(J,q)return self:updateToggle(Z,J,q)end;_.Set=function(a0)U=a0;if y then y(U,function(...)self:updateToggle(Z,...)end)end end;Z.MouseButton1Click:Connect(function()U=not U;self:updateToggle(Z,nil,U)if y then y(U,function(...)self:updateToggle(Z,...)end)end end)return setmetatable({},{__index=function(a1,a2)return _[a2]or Z[a2]end})end;function I:addTextbox(J,W,y)local X=d:Create("ImageButton",{Name="Textbox",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(0.5,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageLabel",{Name="Button",BackgroundTransparency=1,Position=UDim2.new(1,-110,0.5,-8),Size=UDim2.new(0,100,0,16),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.LightContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextBox",{Name="Textbox",BackgroundTransparency=1,TextTruncate=Enum.TextTruncate.AtEnd,Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,1,0),ZIndex=3,Font=Enum.Font.GothamSemibold,Text=W or"",TextColor3=f.TextColor,TextSize=11})})})table.insert(self.modules,X)local M=X.Button;local b=M.Textbox;X.MouseButton1Click:Connect(function()if X.Button.Size~=UDim2.new(0,100,0,16)then return end;d:Tween(X.Button,{Size=UDim2.new(0,200,0,16),Position=UDim2.new(1,-210,0.5,-8)},0.2)wait()b.TextXAlignment=Enum.TextXAlignment.Left;b:CaptureFocus()end)b:GetPropertyChangedSignal("Text"):Connect(function()if M.ImageTransparency==0 and(M.Size==UDim2.new(0,200,0,16)or M.Size==UDim2.new(0,100,0,16))then d:Pop(M,10)end;if y then y(b.Text,nil,function(...)self:updateTextbox(X,...)end)end end)b.FocusLost:Connect(function()b.TextXAlignment=Enum.TextXAlignment.Center;d:Tween(X.Button,{Size=UDim2.new(0,100,0,16),Position=UDim2.new(1,-110,0.5,-8)},0.2)if y then y(b.Text,true,function(...)self:updateTextbox(X,...)end)end end)return X end;function I:addKeybind(J,W,y,a3)local a4=d:Create("ImageButton",{Name="Keybind",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(1,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageLabel",{Name="Button",BackgroundTransparency=1,Position=UDim2.new(1,-110,0.5,-8),Size=UDim2.new(0,100,0,16),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.LightContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,ClipsDescendants=true,Size=UDim2.new(1,0,1,0),ZIndex=3,Font=Enum.Font.GothamSemibold,Text=W and W.Name or"None",TextColor3=f.TextColor,TextSize=11})})})table.insert(self.modules,a4)local Q=a4.Button.Text;local M=a4.Button;local a5=function()if M.ImageTransparency==0 then d:Pop(M,10)end end;self.binds[a4]={callback=function()a5()if y then y(function(...)self:updateKeybind(a4,...)end)end end}if W and y then self:updateKeybind(a4,nil,W)end;a4.MouseButton1Click:Connect(function()a5()if self.binds[a4].connection then return self:updateKeybind(a4)end;if Q.Text=="None"then Q.Text="..."local w=d:KeyPressed()self:updateKeybind(a4,nil,w.KeyCode)a5()if a3 then a3(w,function(...)self:updateKeybind(a4,...)end)end end end)return a4 end;function I:addColorPicker(J,W,y)local a6=d:Create("ImageButton",{Name="ColorPicker",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(0.5,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageButton",{Name="Button",BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(1,-50,0.5,-7),Size=UDim2.new(0,40,0,14),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=Color3.fromRGB(255,255,255),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)})})local a7=d:Create("ImageLabel",{Name="ColorPicker",Parent=self.page.library.container,BackgroundTransparency=1,Position=UDim2.new(0.75,0,0.400000006,0),Selectable=true,AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.new(0,162,0,169),Image="rbxassetid://5028857472",ImageColor3=f.Background,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298),Visible=false},{d:Create("ImageLabel",{Name="Glow",BackgroundTransparency=1,Position=UDim2.new(0,-15,0,-15),Size=UDim2.new(1,30,1,30),ZIndex=0,Image="rbxassetid://5028857084",ImageColor3=f.Glow,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(22,22,278,278)}),d:Create("TextLabel",{Name="Title",BackgroundTransparency=1,Position=UDim2.new(0,10,0,8),Size=UDim2.new(1,-40,0,16),ZIndex=2,Font=Enum.Font.GothamSemibold,Text=J,TextColor3=f.TextColor,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageButton",{Name="Close",BackgroundTransparency=1,Position=UDim2.new(1,-26,0,8),Size=UDim2.new(0,16,0,16),ZIndex=2,Image="rbxassetid://5012538583",ImageColor3=f.TextColor}),d:Create("Frame",{Name="Container",BackgroundTransparency=1,Position=UDim2.new(0,8,0,32),Size=UDim2.new(1,-18,1,-40)},{d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,6)}),d:Create("ImageButton",{Name="Canvas",BackgroundTransparency=1,BorderColor3=f.LightContrast,Size=UDim2.new(1,0,0,60),AutoButtonColor=false,Image="rbxassetid://5108535320",ImageColor3=Color3.fromRGB(255,0,0),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("ImageLabel",{Name="White_Overlay",BackgroundTransparency=1,Size=UDim2.new(1,0,0,60),Image="rbxassetid://5107152351",SliceCenter=Rect.new(2,2,298,298)}),d:Create("ImageLabel",{Name="Black_Overlay",BackgroundTransparency=1,Size=UDim2.new(1,0,0,60),Image="rbxassetid://5107152095",SliceCenter=Rect.new(2,2,298,298)}),d:Create("ImageLabel",{Name="Cursor",BackgroundColor3=f.TextColor,AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1.000,Size=UDim2.new(0,10,0,10),Position=UDim2.new(0,0,0,0),Image="rbxassetid://5100115962",SliceCenter=Rect.new(2,2,298,298)})}),d:Create("ImageButton",{Name="Color",BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,0,0,4),Selectable=false,Size=UDim2.new(1,0,0,16),ZIndex=2,AutoButtonColor=false,Image="rbxassetid://5028857472",ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("Frame",{Name="Select",BackgroundColor3=f.TextColor,BorderSizePixel=1,Position=UDim2.new(1,0,0,0),Size=UDim2.new(0,2,1,0),ZIndex=2}),d:Create("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0.00,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.50,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.66,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.82,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1.00,Color3.fromRGB(255,0,0))})})}),d:Create("Frame",{Name="Inputs",BackgroundTransparency=1,Position=UDim2.new(0,10,0,158),Size=UDim2.new(1,0,0,16)},{d:Create("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,6)}),d:Create("ImageLabel",{Name="R",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(0.305,0,1,0),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,Size=UDim2.new(0.400000006,0,1,0),ZIndex=2,Font=Enum.Font.Gotham,Text="R:",TextColor3=f.TextColor,TextSize=10.000}),d:Create("TextBox",{Name="Textbox",BackgroundTransparency=1,Position=UDim2.new(0.300000012,0,0,0),Size=UDim2.new(0.600000024,0,1,0),ZIndex=2,Font=Enum.Font.Gotham,PlaceholderColor3=f.DarkContrast,Text="255",TextColor3=f.TextColor,TextSize=10.000})}),d:Create("ImageLabel",{Name="G",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(0.305,0,1,0),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,ZIndex=2,Size=UDim2.new(0.400000006,0,1,0),Font=Enum.Font.Gotham,Text="G:",TextColor3=f.TextColor,TextSize=10.000}),d:Create("TextBox",{Name="Textbox",BackgroundTransparency=1,Position=UDim2.new(0.300000012,0,0,0),Size=UDim2.new(0.600000024,0,1,0),ZIndex=2,Font=Enum.Font.Gotham,Text="255",TextColor3=f.TextColor,TextSize=10.000})}),d:Create("ImageLabel",{Name="B",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(0.305,0,1,0),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,Size=UDim2.new(0.400000006,0,1,0),ZIndex=2,Font=Enum.Font.Gotham,Text="B:",TextColor3=f.TextColor,TextSize=10.000}),d:Create("TextBox",{Name="Textbox",BackgroundTransparency=1,Position=UDim2.new(0.300000012,0,0,0),Size=UDim2.new(0.600000024,0,1,0),ZIndex=2,Font=Enum.Font.Gotham,Text="255",TextColor3=f.TextColor,TextSize=10.000})})}),d:Create("ImageButton",{Name="Button",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,20),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Text",BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text="Submit",TextColor3=f.TextColor,TextSize=11.000})})})})d:DraggingEnabled(a7)table.insert(self.modules,a6)local a8={[""]=true}local a9=a7.Container.Canvas;local aa=a7.Container.Color;local ab,ac=a9.AbsoluteSize,a9.AbsolutePosition;local ad,ae=aa.AbsoluteSize,aa.AbsolutePosition;local af,ag;local N=W or Color3.fromRGB(255,255,255)local ah,ai,aj=0,0,1;local ak={r=255,g=255,b=255}self.colorpickers[a6]={tab=a7,callback=function(al,q)ak[al]=q;ah,ai,aj=Color3.toHSV(Color3.fromRGB(ak.r,ak.g,ak.b))end}local y=function(q)if y then y(q,function(...)self:updateColorPicker(a6,...)end)end end;d:DraggingEnded(function()af,ag=false,false end)if W then self:updateColorPicker(a6,nil,W)ah,ai,aj=Color3.toHSV(W)W=Color3.fromHSV(ah,ai,aj)for h,al in pairs({"r","g","b"})do ak[al]=W[al:upper()]*255 end end;for h,K in pairs(a7.Container.Inputs:GetChildren())do if K:IsA("ImageLabel")then local X=K.Textbox;local am;X.Focused:Connect(function()am=true end)X.FocusLost:Connect(function()am=false;if not tonumber(X.Text)then X.Text=math.floor(ak[K.Name:lower()])end end)X:GetPropertyChangedSignal("Text"):Connect(function()local Q=X.Text;if not a8[Q]and not tonumber(Q)then X.Text=Q:sub(1,#Q-1)elseif am and not a8[Q]then ak[K.Name:lower()]=math.clamp(tonumber(X.Text),0,255)local N=Color3.fromRGB(ak.r,ak.g,ak.b)ah,ai,aj=Color3.toHSV(N)self:updateColorPicker(a6,nil,N)y(N)end end)end end;a9.MouseButton1Down:Connect(function()ag=true;while ag do local an,ao=a.X,a.Y;ai=math.clamp((an-ac.X)/ab.X,0,1)aj=1-math.clamp((ao-ac.Y)/ab.Y,0,1)N=Color3.fromHSV(ah,ai,aj)for h,al in pairs({"r","g","b"})do ak[al]=N[al:upper()]*255 end;self:updateColorPicker(a6,nil,{ah,ai,aj})d:Tween(a9.Cursor,{Position=UDim2.new(ai,0,1-aj,0)},0.1)y(N)d:Wait()end end)aa.MouseButton1Down:Connect(function()af=true;while af do ah=1-math.clamp(1-(a.X-ae.X)/ad.X,0,1)N=Color3.fromHSV(ah,ai,aj)for h,al in pairs({"r","g","b"})do ak[al]=N[al:upper()]*255 end;local an=ah;self:updateColorPicker(a6,nil,{ah,ai,aj})d:Tween(a7.Container.Color.Select,{Position=UDim2.new(an,0,0,0)},0.1)y(N)d:Wait()end end)local M=a6.Button;local Z,Y,a5;lastColor=Color3.fromHSV(ah,ai,aj)a5=function(ap,aq)if aq then if not Z then return end;if Y then while Y do d:Wait()end end elseif not aq then if Y then return end;if M.ImageTransparency==0 then d:Pop(M,10)end end;Z=ap;Y=true;if ap then if self.page.library.activePicker and self.page.library.activePicker~=a5 then self.page.library.activePicker(nil,true)end;self.page.library.activePicker=a5;lastColor=Color3.fromHSV(ah,ai,aj)local ar,as=M.AbsoluteSize.X/2,162;local at,au=M.AbsolutePosition.X,M.AbsolutePosition.Y;a7.ClipsDescendants=true;a7.Visible=true;a7.Size=UDim2.new(0,0,0,0)a7.Position=UDim2.new(0,ar+as+at,0,au)d:Tween(a7,{Size=UDim2.new(0,162,0,169)},0.2)wait(0.2)a7.ClipsDescendants=false;ab,ac=a9.AbsoluteSize,a9.AbsolutePosition;ad,ae=aa.AbsoluteSize,aa.AbsolutePosition else d:Tween(a7,{Size=UDim2.new(0,0,0,0)},0.2)a7.ClipsDescendants=true;wait(0.2)a7.Visible=false end;Y=false end;local av=function()a5(not Z)end;M.MouseButton1Click:Connect(av)a6.MouseButton1Click:Connect(av)a7.Container.Button.MouseButton1Click:Connect(function()a5()end)a7.Close.MouseButton1Click:Connect(function()self:updateColorPicker(a6,nil,lastColor)a5()end)return a6 end;function I:addSlider(J,W,aw,ax,y)local ay=d:Create("ImageButton",{Name="Slider",Parent=self.container,BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0.292817682,0,0.299145311,0),Size=UDim2.new(1,0,0,50),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{Name="Title",BackgroundTransparency=1,Position=UDim2.new(0,10,0,6),Size=UDim2.new(0.5,0,0,16),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("TextBox",{Name="TextBox",BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(1,-30,0,6),Size=UDim2.new(0,20,0,16),ZIndex=3,Font=Enum.Font.GothamSemibold,Text=W or aw,TextColor3=f.TextColor,TextSize=12,TextXAlignment=Enum.TextXAlignment.Right}),d:Create("TextLabel",{Name="Slider",BackgroundTransparency=1,Position=UDim2.new(0,10,0,28),Size=UDim2.new(1,-20,0,16),ZIndex=3,Text=""},{d:Create("ImageLabel",{Name="Bar",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0,4),ZIndex=3,Image="rbxassetid://5028857472",ImageColor3=f.LightContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("ImageLabel",{Name="Fill",BackgroundTransparency=1,Size=UDim2.new(0.8,0,1,0),ZIndex=3,Image="rbxassetid://5028857472",ImageColor3=f.TextColor,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("ImageLabel",{Name="Circle",AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1.000,ImageColor3=f.TextColor,Position=UDim2.new(1,0,0.5,0),Size=UDim2.new(0,10,0,10),ZIndex=3,Image="rbxassetid://4608020054"})})})})})table.insert(self.modules,ay)local a8={[""]=true,["-"]=true}local X=ay.TextBox;local az=ay.Slider.Bar.Fill.Circle;local q=W or aw;local B,aA;local y=function(q)if y then y(q,function(...)self:updateSlider(ay,...)end)end end;self:updateSlider(ay,nil,q,aw,ax)d:DraggingEnded(function()B=false end)ay.MouseButton1Down:Connect(function(b)B=true;while B do d:Tween(az,{ImageTransparency=0},0.1)q=self:updateSlider(ay,nil,nil,aw,ax,q)y(q)d:Wait()end;wait(0.5)d:Tween(az,{ImageTransparency=1},0.2)end)X.FocusLost:Connect(function()if not tonumber(X.Text)then q=self:updateSlider(ay,nil,W or aw,aw,ax)y(q)end end)X:GetPropertyChangedSignal("Text"):Connect(function()local Q=X.Text;if not a8[Q]and not tonumber(Q)then X.Text=Q:sub(1,#Q-1)elseif not a8[Q]then q=self:updateSlider(ay,nil,tonumber(Q)or q,aw,ax)y(q)end end)return ay end;function I:addDropdown(J,aB,y)local aC=d:Create("Frame",{Name="Dropdown",Parent=self.container,BackgroundTransparency=1,Size=UDim2.new(1,0,0,30),ClipsDescendants=true},{d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)}),d:Create("ImageLabel",{Name="Search",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextBox",{Name="TextBox",AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,TextTruncate=Enum.TextTruncate.AtEnd,Position=UDim2.new(0,10,0.5,1),Size=UDim2.new(1,-42,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=J,TextColor3=f.TextColor,TextSize=12,TextTransparency=0.10000000149012,TextXAlignment=Enum.TextXAlignment.Left}),d:Create("ImageButton",{Name="Button",BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(1,-28,0.5,-9),Size=UDim2.new(0,18,0,18),ZIndex=3,Image="rbxassetid://5012539403",ImageColor3=f.TextColor,SliceCenter=Rect.new(2,2,298,298)})}),d:Create("ImageLabel",{Name="List",BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,1,-34),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.Background,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("ScrollingFrame",{Name="Frame",Active=true,BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,4,0,4),Size=UDim2.new(1,-8,1,-8),CanvasPosition=Vector2.new(0,28),CanvasSize=UDim2.new(0,0,0,120),ZIndex=2,ScrollBarThickness=3,ScrollBarImageColor3=f.DarkContrast},{d:Create("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)})})})})table.insert(self.modules,aC)local _={}local aD=aC.Search;local am;aB=aB or{}aD.Button.MouseButton1Click:Connect(function()if aD.Button.Rotation==0 then self:updateDropdown(aC,nil,aB,y)else self:updateDropdown(aC,nil,nil,y)end end)aD.TextBox.Focused:Connect(function()if aD.Button.Rotation==0 then self:updateDropdown(aC,nil,aB,y)end;am=true end)aD.TextBox.FocusLost:Connect(function()am=false end)aD.TextBox:GetPropertyChangedSignal("Text"):Connect(function()if am then local aB=d:Sort(aD.TextBox.Text,aB)aB=#aB~=0 and aB;self:updateDropdown(aC,nil,aB,y)end end)aC:GetPropertyChangedSignal("Size"):Connect(function()self:Resize()end)function _:Get()return aD.TextBox.Text end;local aE=self;function _:updateDropdown(J,aB,y)return aE:updateDropdown(aC,J,aB,y)end;return aC end;function G:SelectPage(H,Z)if Z and self.focusedPage==H then return end;local M=H.button;if Z then M.Title.TextTransparency=0;M.Title.Font=Enum.Font.GothamSemibold;if M:FindFirstChild("Icon")then M.Icon.ImageTransparency=0 end;local aF=self.focusedPage;self.focusedPage=H;if aF then self:SelectPage(aF)end;local aG=aF and#aF.sections or 0;local aH=#H.sections-aG;H:Resize()for h,I in pairs(H.sections)do I.container.Parent.ImageTransparency=0 end;if aH<0 then for h=aG,#H.sections+1,-1 do local I=aF.sections[h].container.Parent;d:Tween(I,{ImageTransparency=1},0.1)end end;wait(0.1)H.container.Visible=true;if aF then aF.container.Visible=false end;if aH>0 then for h=aG+1,#H.sections do local I=H.sections[h].container.Parent;I.ImageTransparency=1;d:Tween(I,{ImageTransparency=0},0.05)end end;wait(0.05)for h,I in pairs(H.sections)do d:Tween(I.container.Title,{TextTransparency=0},0.1)I:Resize(true)wait(0.05)end;wait(0.05)H:Resize(true)else M.Title.Font=Enum.Font.Gotham;M.Title.TextTransparency=0.65;if M:FindFirstChild("Icon")then M.Icon.ImageTransparency=0.65 end;for h,I in pairs(H.sections)do d:Tween(I.container.Parent,{Size=UDim2.new(1,-10,0,28)},0.1)d:Tween(I.container.Title,{TextTransparency=1},0.1)end;wait(0.1)H.lastPosition=H.container.CanvasPosition.Y;H:Resize()end end;function H:Resize(aI)local S=10;local aJ=0;for h,I in pairs(self.sections)do aJ=aJ+I.container.Parent.AbsoluteSize.Y+S end;self.container.CanvasSize=UDim2.new(0,0,0,aJ)self.container.ScrollBarImageTransparency=aJ>self.container.AbsoluteSize.Y;if aI then d:Tween(self.container,{CanvasPosition=Vector2.new(0,self.lastPosition or 0)},0.2)end end;function I:Resize(aK)if self.page.library.focusedPage~=self.page then return end;local S=4;local aJ=4*S+self.container.Title.AbsoluteSize.Y;for h,o in pairs(self.modules)do aJ=aJ+o.AbsoluteSize.Y+S end;if aK then d:Tween(self.container.Parent,{Size=UDim2.new(1,-10,0,aJ)},0.05)else self.container.Parent.Size=UDim2.new(1,-10,0,aJ)self.page:Resize()end end;function I:getModule(aL)if table.find(self.modules,aL)then return aL end;for h,o in pairs(self.modules)do if(o:FindFirstChild("Title")or o:FindFirstChild("TextBox",true)).Text==aL then return o end end;error("No module found under "..tostring(aL))end;function I:updateButton(M,J)M=self:getModule(M)M.Title.Text=J end;function I:updateToggle(Z,J,q)Z=self:getModule(Z)local aM={In=UDim2.new(0,2,0.5,-6),Out=UDim2.new(0,20,0.5,-6)}local z=Z.Button.Frame;q=q and"Out"or"In"if J then Z.Title.Text=J end;d:Tween(z,{Size=UDim2.new(1,-22,1,-9),Position=aM[q]+UDim2.new(0,0,0,2.5)},0.2)wait(0.1)d:Tween(z,{Size=UDim2.new(1,-22,1,-4),Position=aM[q]},0.1)end;function I:updateTextbox(X,J,q)X=self:getModule(X)if J then X.Title.Text=J end;if q then X.Button.Textbox.Text=q end end;function I:updateKeybind(a4,J,w)a4=self:getModule(a4)local Q=a4.Button.Text;local x=self.binds[a4]if J then a4.Title.Text=J end;if x.connection then x.connection=x.connection:UnBind()end;if w then self.binds[a4].connection=d:BindToKey(w,x.callback)Q.Text=w.Name else Q.Text="None"end end;function I:updateColorPicker(a6,J,aa)a6=self:getModule(a6)local aN=self.colorpickers[a6]local a7=aN.tab;local y=aN.callback;if J then a6.Title.Text=J;a7.Title.Text=J end;local N;local ah,ai,aj;if type(aa)=="table"then ah,ai,aj=unpack(aa)N=Color3.fromHSV(ah,ai,aj)else N=aa;ah,ai,aj=Color3.toHSV(N)end;d:Tween(a6.Button,{ImageColor3=N},0.5)d:Tween(a7.Container.Color.Select,{Position=UDim2.new(ah,0,0,0)},0.1)d:Tween(a7.Container.Canvas,{ImageColor3=Color3.fromHSV(ah,1,1)},0.5)d:Tween(a7.Container.Canvas.Cursor,{Position=UDim2.new(ai,0,1-aj)},0.5)for h,K in pairs(a7.Container.Inputs:GetChildren())do if K:IsA("ImageLabel")then local q=math.clamp(N[K.Name],0,1)*255;K.Textbox.Text=math.floor(q)end end end;function I:updateSlider(ay,J,q,aw,ax,aO)ay=self:getModule(ay)if J then ay.Title.Text=J end;local aP=ay.Slider.Bar;local aQ=(a.X-aP.AbsolutePosition.X)/aP.AbsoluteSize.X;if q then aQ=(q-aw)/(ax-aw)end;aQ=math.clamp(aQ,0,1)q=q or math.floor(aw+(ax-aw)*aQ)ay.TextBox.Text=q;d:Tween(aP.Fill,{Size=UDim2.new(aQ,0,1,0)},0.1)if q~=aO and ay.ImageTransparency==0 then d:Pop(ay,10)end;return q end;function I:updateDropdown(aC,J,aB,y)aC=self:getModule(aC)if J then aC.Search.TextBox.Text=J end;local aR=0;d:Pop(aC.Search,10)for h,M in pairs(aC.List.Frame:GetChildren())do if M:IsA("ImageButton")then M:Destroy()end end;for h,q in pairs(aB or{})do local M=d:Create("ImageButton",{Parent=aC.List.Frame,BackgroundTransparency=1,BorderSizePixel=0,Size=UDim2.new(1,0,0,30),ZIndex=2,Image="rbxassetid://5028857472",ImageColor3=f.DarkContrast,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,298,298)},{d:Create("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,10,0,0),Size=UDim2.new(1,-10,1,0),ZIndex=3,Font=Enum.Font.Gotham,Text=q,TextColor3=f.TextColor,TextSize=12,TextXAlignment="Left",TextTransparency=0.10000000149012})})M.MouseButton1Click:Connect(function()if y then y(q,function(...)self:updateDropdown(aC,...)end)end;self:updateDropdown(aC,q,nil,y)end)aR=aR+1 end;local z=aC.List.Frame;d:Tween(aC,{Size=UDim2.new(1,0,0,aR==0 and 30 or math.clamp(aR,0,3)*34+38)},0.3)d:Tween(aC.Search.Button,{Rotation=aB and 180 or 0},0.3)if aR>3 then for h,M in pairs(aC.List.Frame:GetChildren())do if M:IsA("ImageButton")then M.Size=UDim2.new(1,-6,0,30)end end;z.CanvasSize=UDim2.new(0,0,0,aR*34-4)z.ScrollBarImageTransparency=0 else z.CanvasSize=UDim2.new(0,0,0,0)z.ScrollBarImageTransparency=1 end end end;return G
