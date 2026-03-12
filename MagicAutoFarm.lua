local s1=game:GetService("RunService")
local s2=game:GetService("Players")
local s3=game:GetService("Workspace")
local s4=game:GetService("ReplicatedStorage")
local s5=game:GetService("TweenService")
local s6=game:GetService("PathfindingService")
local s7=s2.LocalPlayer
local s8=game:GetService("VirtualInputManager")
local s9=game:GetService("UserInputService")
local s10=game:GetService("TeleportService")
local s11=game:GetService("HttpService")

local t1={
    a1=false,
    a2=false,
    a3={},
    a4={},
    a5={},
    a6=60,
    a7=true,
    a8=4.8,
    a9=22,
    a10=true,
    a11=3,
    a12=3,
    a13=8,
    a14=999999
}

local t2={b1={b2=false}}
local t3=tick()
local t4=nil
local t5=false
local t6=false
local t7=nil
local t8="Ожидание"
local t9=0
local t10=0
local t11=0
local t12=0
local t13=0
local t14=0
local t15={}
local t16={}
local t17=0
local t18=""
local t19=nil
local t20={}
local t21=0
local t22=nil
local t23=false
local t24={}
local t25=false

local function l1(t)if t1.a7 then print("[AutoFarm]",t)end end

local u1=game:GetService("VirtualUser")
local u2=true
local u3=nil

local function u4()
    if u3 then return end
    u3=s7.Idled:Connect(function()
        if u2 then u1:CaptureController() u1:ClickButton2(Vector2.new()) l1("Анти-АФК сработал") end
    end)
    l1("Анти-АФК запущен")
end
local function u5()if u3 then u3:Disconnect() u3=nil end l1("Анти-АФК остановлен")end
u4()

local v1=false
local v2=nil

local function v3()
    if v1 then return end
    v1=true
    if v2 then v2:Disconnect() v2=nil end
    v2=s1.RenderStepped:Connect(function()
        if not v1 or t1.a2 then return end
        local v4=s3:FindFirstChild("Filter")and s3.Filter:FindFirstChild("SpawnedBread")
        local v5=s4:FindFirstChild("Events")and s4.Events:FindFirstChild("CZDPZUS")
        if not v4 or not v5 then return end
        local v6=s7.Character
        local v7=v6 and v6:FindFirstChild("HumanoidRootPart")
        if not v7 then return end
        if t2.b1.b2 then return end
        local v8=v7.Position
        for _,v9 in ipairs(v4:GetChildren())do
            if(v8-v9.Position).Magnitude<=t1.a13 then
                if not t2.b1.b2 then
                    t2.b1.b2=true
                    pcall(function()v5:FireServer(v9)end)
                    task.wait(1.1)
                    t2.b1.b2=false
                    break
                end
            end
        end
    end)
end
local function v10()if not v1 then return end v1=false if v2 then v2:Disconnect() v2=nil end if t2 and t2.b1 then t2.b1.b2=false end end
v3()
l1("Авто-подбор денег активирован")

local w1=true
local w2=false
local w3=nil
local w4=Instance.new("Animation")
w4.AnimationId="rbxassetid://215384594"
local w5=nil

do
    repeat task.wait()until game:IsLoaded()
    local w6=cloneref or function(...)return...end
    local w7=setmetatable({},{__index=function(_,k)return w6(game:GetService(k))end})
    local w8=w7.Players.LocalPlayer
    local w9,w10,w11
    
    local function w12()
        w9=w8.Character
        if w9 then
            w11=w9:FindFirstChild("HumanoidRootPart")
            w10=w9:FindFirstChildOfClass("Humanoid")
        else w11=nil w10=nil end
    end
    w12()

    local w13=s1.Heartbeat
    local w14=s1.RenderStepped
    local w15=game:GetService("CoreGui")
    local w16=game:GetService("StarterGui")

    if w9 and not w9:FindFirstChild("Torso")then
        pcall(function()w16:SetCore("SendNotification",{Title="Невидимость НЕ РАБОТАЕТ",Text="Требуется R6 аватар",Duration=5})end)
        w1=false
    end

    local w17=Instance.new("ScreenGui")
    w17.Name="InvisWarningGUI"
    w17.Parent=w15
    w17.ResetOnSpawn=false
    w17.ZIndexBehavior=Enum.ZIndexBehavior.Sibling

    w5=Instance.new("TextLabel",w17)
    w5.Text="⚠️ВЫ ВИДИМЫ⚠️"
    w5.Visible=false
    w5.Size=UDim2.new(0,200,0,30)
    w5.Position=UDim2.new(0.5,-100,0.85,0)
    w5.BackgroundTransparency=1
    w5.Font=Enum.Font.GothamSemibold
    w5.TextSize=24
    w5.TextColor3=Color3.fromRGB(255,255,0)
    w5.TextStrokeTransparency=0.5
    w5.ZIndex=10

    local function w18()return w10 and w10:IsDescendantOf(workspace)and w10.FloorMaterial~=Enum.Material.Air end

    local function w19()
        if w3 then pcall(function()w3:Stop()end) w3=nil end
        if w10 then
            local w20,w21=pcall(function()return w10:LoadAnimation(w4)end)
            if w20 then w3=w21 w3.Priority=Enum.AnimationPriority.Action4 else w3=nil end
        else w3=nil end
    end

    local function w22()
        if not w2 then return end
        w2=false
        if w3 then pcall(function()w3:Stop()end)end
        if w10 then workspace.CurrentCamera.CameraSubject=w10 end
        if w9 then for _,w23 in pairs(w9:GetDescendants())do if w23:IsA("BasePart")and w23.Transparency==0.5 then w23.Transparency=0 end end end
        if w5 then w5.Visible=false end
    end

    local function w24()
        if w2 or not w1 then return end
        w12()
        if not w9 or not w10 or not w11 then return end
        if not w9:FindFirstChild("Torso")then
            pcall(function()w16:SetCore("SendNotification",{Title="Невидимость НЕ РАБОТАЕТ",Text="Требуется R6 аватар",Duration=5})end)
            return
        end
        w2=true
        workspace.CurrentCamera.CameraSubject=w11
        w19()
    end

    local function w25()if w2 then w22()else w24()end return w2 end

    _G.Invis_Enable=w24
    _G.Invis_Disable=w22
    _G.Invis_Toggle=w25
    _G.IsInvisEnabled=function()return w2 end

    w8.CharacterAdded:Connect(function(w26)
        if w3 then pcall(function()w3:Stop()end) w3=nil end
        task.wait()
        w12()
        if not w10 then
            task.wait(0.5)
            w12()
            if not w10 then
                w1=false
                if w2 then w22()end
                pcall(function()w16:SetCore("SendNotification",{Title="Ошибка невидимости",Text="Не удалось определить тип персонажа",Duration=5})end)
                return
            end
        end
        if w10.RigType~=Enum.HumanoidRigType.R6 then
            w1=false
            if w2 then w22()end
            pcall(function()w16:SetCore("SendNotification",{Title="Предупреждение",Text="Обнаружен не-R6 аватар. Невидимость отключена",Duration=5})end)
            return
        else w1=true end
        if w2 then if w11 then workspace.CurrentCamera.CameraSubject=w11 end w19()end
    end)

    w8.CharacterRemoving:Connect(function()if w3 then pcall(function()w3:Stop()end) w3=nil end if w5 then w5.Visible=false end end)

    w13:Connect(function(w27)
        if not w2 or not w1 then
            if not w2 and w9 then for _,w23 in pairs(w9:GetDescendants())do if w23:IsA("BasePart")and w23.Transparency==0.5 then w23.Transparency=0 end end end
            if w5 then w5.Visible=false end
            return
        end
        if not w9 or not w10 or not w11 or not w10:IsDescendantOf(workspace)or w10.Health<=0 then if w5 then w5.Visible=false end return end
        if w5 then w5.Visible=not w18()end

        local w28=12
        if w10.MoveDirection.Magnitude>0 then
            local w29=w10.MoveDirection*w28*w27
            w11.CFrame=w11.CFrame+w29
        end

        local w30=w11.CFrame
        local w31=w10.CameraOffset
        local _,w32=workspace.CurrentCamera.CFrame:ToOrientation()

        w11.CFrame=CFrame.new(w11.CFrame.Position)*CFrame.fromOrientation(0,w32,0)
        w11.CFrame=w11.CFrame*CFrame.Angles(math.rad(90),0,0)
        w10.CameraOffset=Vector3.new(0,1.44,0)

        if w3 then
            local w33=pcall(function()if not w3.IsPlaying then w3:Play()end w3:AdjustSpeed(0) w3.TimePosition=0.3 end)
            if not w33 then w19()end
        elseif w10 and w10.Health>0 then w19()end

        w14:Wait()

        if w10 and w10:IsDescendantOf(workspace)then w10.CameraOffset=w31 end
        if w11 and w11:IsDescendantOf(workspace)then w11.CFrame=w30 end
        if w3 then pcall(function()w3:Stop()end)end
        if w11 and w11:IsDescendantOf(workspace)then
            local w34=workspace.CurrentCamera.CFrame.LookVector
            local w35=Vector3.new(w34.X,0,w34.Z).Unit
            if w35.Magnitude>0.1 then w11.CFrame=CFrame.new(w11.Position,w11.Position+w35)end
        end
        if w9 then for _,w23 in pairs(w9:GetDescendants())do if(w23:IsA("BasePart")and w23.Transparency~=1)then w23.Transparency=0.5 end end end
    end)
end

s1.Stepped:Connect(function()
    if t1.a1 and s7.Character then
        pcall(function()for _,w36 in pairs(s7.Character:GetDescendants())do if w36:IsA("BasePart")then w36.CanCollide=false end end end)
    end
end)

local function x1()
    local x2=s3:FindFirstChild("Map")
    if x2 then
        local x3=x2:FindFirstChild("Doors")
        if x3 then for _,x4 in ipairs(x3:GetDescendants())do pcall(function()if x4:IsA("BasePart")then x4.CanCollide=false end end)end end
        l1("Коллизия дверей отключена")
    end
end
x1()

-- Функция подъёма по точкам (как маршрут)
local function x5()
    if t25 then return end
    local x6 = s7.Character
    local x7 = x6 and x6:FindFirstChild("HumanoidRootPart")
    local x8 = x6 and x6:FindFirstChildOfClass("Humanoid")
    if x7 and x8 and x8.Health>0 and x7.Position.Y < 4.7 and not t23 then
        l1("Персонаж ниже 4.7, поднимаю по точкам до 4.8...")
        t8 = "Подъём на 4.8"
        t23 = true

        -- Запоминаем начальную позицию и целевую
        local startPos = x7.Position
        local targetY = 4.8
        local startY = startPos.Y
        local deltaY = targetY - startY
        if deltaY <= 0 then t23 = false; t8 = "Ожидание"; return end

        -- Количество промежуточных точек (например, по 1 студийному шагу)
        local steps = math.max(3, math.floor(deltaY * 2)) -- примерно каждые 0.5 студии
        local waypoints = {}
        for i = 1, steps do
            local alpha = i / steps
            local y = startY + deltaY * alpha
            table.insert(waypoints, Vector3.new(startPos.X, y, startPos.Z))
        end

        -- Двигаемся по точкам с помощью Tween
        for i, wp in ipairs(waypoints) do
            if not t1.a1 then break end
            -- Сохраняем текущий поворот
            local currentRot = x7.CFrame - x7.CFrame.Position
            local targetCF = CFrame.new(wp) * currentRot
            local dist = (wp - x7.Position).Magnitude
            local duration = math.min(0.5, dist / 10) -- время на сегмент (не более 0.5 сек)

            local tween = s5:Create(x7, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = targetCF})
            tween:Play()
            tween.Completed:Wait()
        end

        -- Финальное позиционирование на 4.8 (на случай погрешности)
        x7.CFrame = CFrame.new(startPos.X, targetY, startPos.Z) * (x7.CFrame - x7.CFrame.Position)
        x7.AssemblyLinearVelocity = Vector3.zero
        x7.AssemblyAngularVelocity = Vector3.zero

        l1("Достиг 4.8, замираю на 3 секунды...")
        task.wait(3)
        l1("Замер завершён, продолжаю")

        t23 = false
        t25 = true
        t8 = "Ожидание"
    end
end

local y1=Instance.new("Folder")
y1.Name="PathVisuals"
y1.Parent=s3

local function y2()
    for _,y3 in ipairs(y1:GetChildren())do pcall(function()y3:Destroy()end)end
end

local function y4(y5,y6)
    y2()
    if not y5 or #y5==0 then return end
    for y7,y8 in ipairs(y5)do
        local y9=Instance.new("Part")
        y9.Name="Waypoint"..y7
        y9.Size=Vector3.new(2,2,2)
        y9.Position=y8.Position
        y9.Anchored=true
        y9.CanCollide=false
        y9.Material=Enum.Material.Neon
        y9.Color=Color3.fromHSV(y7/#y5,1,1)
        y9.Transparency=0.3
        y9.Parent=y1
    end
    local y10=y6
    for y11,y12 in ipairs(y5)do
        local y13=y10
        local y14=y12.Position
        local y15=(y14-y13).Magnitude
        if y15>0.5 then
            local y16=Instance.new("Part")
            y16.Name="PathLine"..y11
            y16.Anchored=true
            y16.CanCollide=false
            y16.Material=Enum.Material.Neon
            y16.Color=Color3.new(0,1,0)
            y16.Transparency=0.5
            y16.Size=Vector3.new(0.5,0.5,y15)
            y16.CFrame=CFrame.lookAt(y13+(y14-y13)/2,y14)
            y16.Parent=y1
        end
        y10=y14
    end
end

local function z1(z2,z3)
    local z4={
        {r=1,h=4,s=2},{r=1.2,h=4.5,s=2.5},{r=1.5,h=5,s=3},{r=2,h=5.5,s=4},
        {r=2.5,h=6,s=5},{r=3,h=6.5,s=5},{r=3.5,h=7,s=6},{r=4,h=7.5,s=6},
        {r=1,h=8,s=3},{r=5,h=5,s=5},{r=1.8,h=4.2,s=2.2},{r=2.2,h=5.8,s=4.5},
        {r=2.8,h=6.2,s=5.5},{r=3.2,h=6.8,s=5.8},{r=3.8,h=7.2,s=6.2}
    }
    for _,z5 in ipairs(z4)do
        local z6={
            AgentRadius=z5.r,
            AgentHeight=z5.h,
            AgentCanJump=true,
            AgentCanClimb=true,
            WaypointSpacing=z5.s,
            CostCalibration=true
        }
        local z7=s6:CreatePath(z6)
        local z8,z9=pcall(function()z7:ComputeAsync(z2,z3)end)
        if z8 and z7.Status==Enum.PathStatus.Success then
            local z10=z7:GetWaypoints()
            if not z10 or #z10<2 then return z10 end
            local z11={}
            local z12=t1.a11
            table.insert(z11,z10[1])
            for z13=2,#z10 do
                local z14=z10[z13-1].Position
                local z15=z10[z13].Position
                local z16=(z15-z14).Magnitude
                if z16<=z12 then
                    table.insert(z11,z10[z13])
                else
                    local z17=math.ceil(z16/z12)
                    for z18=1,z17 do
                        local z19=z18/z17
                        local z20=z14:Lerp(z15,z19)
                        local z21={Position=z20,Action=(z18==z17 and z10[z13].Action)or Enum.PathWaypointAction.Walk}
                        table.insert(z11,z21)
                    end
                end
            end
            return z11
        end
        task.wait(0.05)
    end
    return nil
end

local function aa1(aa2,aa3)
    if not aa2 then return nil end
    local aa4,aa5=pcall(function()return aa2.CFrame end)
    if not aa4 then return nil end
    local aa6=aa5.LookVector
    aa6=Vector3.new(aa6.X,0,aa6.Z).Unit
    if aa6.Magnitude<0.1 then
        aa6=(aa3-aa5.Position).Unit
        aa6=Vector3.new(aa6.X,0,aa6.Z).Unit
        if aa6.Magnitude<0.1 then aa6=Vector3.new(1,0,0)end
    end
    return aa5.Position+aa6*4
end

local function ab1()
    local ab2=s7.Character
    if not ab2 then return nil end
    local ab3=ab2:FindFirstChild("HumanoidRootPart")
    if not ab3 then return nil end
    return ab3.Position-Vector3.new(0,2.5,0)
end

local function ac1(ac2)
    x5()
    local ac3=s7.Character
    if not ac3 then l1("Нет персонажа")return false end
    local ac4=ac3:FindFirstChild("HumanoidRootPart")
    local ac5=ac3:FindFirstChild("Humanoid")
    if not ac4 or not ac5 then l1("Нет HRP или Humanoid")return false end
    if not ac2 or not ac2:IsA("BasePart")then l1("Неверная цель")return false end
    t4=ac2
    t5=true
    t6=false
    t8="Путь к цели"
    local ac6=ac4.Position
    local ac7=aa1(ac2,ac6)
    if not ac7 then l1("Не удалось вычислить позицию перед объектом")t5=false t8="Ожидание" return false end
    local ac8=ac7
    l1("Поиск пути к цели, расстояние "..math.floor((ac8-ac6).Magnitude))
    local ac9=z1(ac6,ac8)
    if not ac9 then
        l1("Путь не найден, временно игнорирую цель")
        t5=false
        t8="Ожидание"
        return false
    end
    l1("Путь найден, точек: "..#ac9)
    y4(ac9,ac6)
    for ad1,ad2 in ipairs(ac9)do
        if not t1.a1 then y2()t5=false t8="Ожидание" return false end
        local ad3=ab1()
        if not ad3 then continue end
        local ad4=ad2.Position
        local ad5=ad4+Vector3.new(0,2.5,0)
        local ad6=ac4.CFrame-ac4.CFrame.Position
        local ad7=CFrame.new(ad5)*ad6
        local ad8=(ad5-ac4.Position).Magnitude
        if ad8>0.2 then
            local ad9=s5:Create(ac4,TweenInfo.new(ad8/t1.a9,Enum.EasingStyle.Linear),{CFrame=ad7})
            ad9:Play()
            ad9.Completed:Wait()
            t3=tick()
        end
        if ad2.Action==Enum.PathWaypointAction.Jump then ac5.Jump=true task.wait(0.1)end
    end
    y2()
    local ad10=ac8
    local ad11=ad10+Vector3.new(0,2.5,0)
    ac4.CFrame=CFrame.new(ad11)*CFrame.Angles(0,math.rad(90),0)
    ac4.AssemblyLinearVelocity=Vector3.zero
    ac4.AssemblyAngularVelocity=Vector3.zero
    l1("Цель достигнута")
    t5=false
    t8="Ожидание"
    return true
end

local function ae1(ae2)
    local ae3=s7:FindFirstChild("Backpack")
    local ae4=s7.Character
    return(ae3 and ae3:FindFirstChild(ae2))or(ae4 and ae4:FindFirstChild(ae2))
end

local function af1(af2)
    local af3=s7:FindFirstChild("Backpack")and s7.Backpack:FindFirstChild(af2)
    if af3 and s7.Character and s7.Character:FindFirstChild("Humanoid")then
        pcall(function()s7.Character.Humanoid:EquipTool(af3)end)
        task.wait(1)
        return true
    end
    return false
end

local function ag1()
    local ag2=s3:FindFirstChild("Map")
    if not ag2 then l1("Карта не найдена")return nil end
    local ag3=ag2:FindFirstChild("Shopz")
    if not ag3 then l1("Магазины не найдены")return nil end
    local ag4=s7.Character
    if not ag4 then return nil end
    local ag5=ag4:FindFirstChild("HumanoidRootPart")
    if not ag5 then return nil end
    local ag6=nil
    local ag7=math.huge
    for _,ag8 in ipairs(ag3:GetChildren())do
        local ag9=ag8:FindFirstChild("CurrentStocks")
        if ag9 then
            local ag10=ag9:FindFirstChild("Crowbar")
            if ag10 and ag10.Value>0 then
                local ag11=ag8:FindFirstChild("MainPart")
                if ag11 then
                    local ag12=(ag5.Position-ag11.Position).Magnitude
                    if ag12<ag7 then ag7=ag12 ag6=ag8 end
                end
            end
        end
    end
    if ag6 then l1("Найден дилер с ломом, расстояние: "..math.floor(ag7))
    else l1("Дилер с ломом не найден")end
    return ag6
end

local function ah1()
    local ah2=ag1()
    if not ah2 then return false end
    local ah3=ah2:FindFirstChild("MainPart")
    if not ah3 then l1("У дилера нет MainPart")return false end
    t8="Путь к дилеру"
    l1("Иду к дилеру за ломом")
    
    t21=0
    t22=ah3
    local ah4=ac1(ah3)
    
    if not ah4 then
        t21=t21+1
        l1("Путь не найден, попытка "..t21.."/3")
        
        if t21>=3 then
            l1("Путь не найден 3 раза, поднимаюсь на высоту 4.8")
            local ah5=s7.Character
            local ah6=ah5 and ah5:FindFirstChild("HumanoidRootPart")
            if ah6 then
                local ah7=ah6.Position
                local ah8=s5:Create(ah6,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{CFrame=CFrame.new(ah7.X,4.8,ah7.Z)})
                ah8:Play()
                ah8.Completed:Wait()
                task.wait(1)
                l1("Повторная попытка найти путь к дилеру")
                t21=0
                ah4=ac1(ah3)
                if not ah4 then
                    l1("Путь к дилеру всё ещё не найден, временно игнорирую")
                    t8="Ожидание"
                    return false
                end
            end
        else
            t8="Ожидание"
            return false
        end
    end
    
    t8="Покупка лома"
    task.wait(1.5)
    local ah9=s4:FindFirstChild("Events")
    if ah9 then
        l1("Открываю магазин")
        pcall(function()ah9.BYZERSPROTEC:FireServer(true,"shop",ah3,"IllegalStore")end)
        task.wait(1)
        l1("Покупаю лом")
        pcall(function()ah9.SSHPRMTE1:InvokeServer("IllegalStore","Melees","Crowbar",ah3,nil,true)end)
        task.wait(20)
        l1("Закрываю магазин")
        pcall(function()ah9.BYZERSPROTEC:FireServer(false)end)
    end
    task.wait(2)
    local ah10=ae1("Crowbar")
    if ah10 then 
        l1("Лом куплен успешно")
    else
        l1("Не удалось купить лом")
    end
    t3=tick()
    t8="Ожидание"
    return ah10
end

local function ai1()
    local ai2=tick()
    for ai3,ai4 in pairs(t1.a5)do
        if ai2>ai4 then
            t1.a5[ai3]=nil
            for ai5,ai6 in ipairs(t1.a3)do if ai6==ai3 then table.remove(t1.a3,ai5)break end end
            l1("Игнорируемый объект разблокирован")
        end
    end
end

local function aj1()
    ai1()
    local aj2=nil
    local aj3=s3:FindFirstChild("Map")
    if aj3 then aj2=aj3:FindFirstChild("BredMakurz")end
    if not aj2 then
        local aj4=s3:FindFirstChild("Filter")
        if aj4 then aj2=aj4:FindFirstChild("BredMakurz")end
    end
    if not aj2 then
        for _,aj5 in ipairs(s3:GetDescendants())do
            if aj5.Name=="BredMakurz"and aj5:IsA("Folder")then aj2=aj5 break end
        end
    end
    if not aj2 then l1("Папка BredMakurz не найдена")return 0,0 end
    local aj6=s7.Character
    if not aj6 then return 0,0 end
    local aj7=aj6:FindFirstChild("HumanoidRootPart")
    if not aj7 then return 0,0 end
    local aj8={}
    local aj9={}
    t13=0
    t14=0
    t24={}
    for _,aj10 in ipairs(aj2:GetChildren())do
        local aj11=aj10.Name:lower()
        if aj11:find("safe")or aj11:find("register")then
            if aj11:find("safe")then t13=t13+1 else t14=t14+1 end
            if t1.a4[aj10]then continue end
            if t1.a5[aj10]then continue end
            local aj12=aj10:FindFirstChild("Values")
            if aj12 then
                local aj13=aj12:FindFirstChild("Broken")
                if aj13 and not aj13.Value then
                    local aj14=aj10:FindFirstChild("MainPart")or aj10.PrimaryPart
                    if aj14 and aj14.Position.Y>=4.8 then
                        local aj15={obj=aj10,part=aj14,pos=aj14.Position}
                        if aj11:find("safe")then table.insert(aj8,aj15)else table.insert(aj9,aj15)end
                        table.insert(t24,aj15)
                    end
                end
            end
        end
    end
    t15=aj8
    t16=aj9
    table.sort(t24,function(aj16,aj17)return(aj16.pos-aj7.Position).Magnitude<(aj17.pos-aj7.Position).Magnitude end)
    t9=#t15
    t10=#t16
    return t9+t10,t13+t14
end

local function ak1()
    local ak2,ak3=aj1()
    t17=ak2
    l1("Всего доступно: "..ak2.."/"..ak3.." целей")
    if ak2<20 then
        t18="Мало целей ("..ak2.."), много конкурентов. Смени сервер."
        l1("⚠️ "..t18)
        pcall(function()
            s11:SetCore("SendNotification",{
                Title="Рекомендация",
                Text=t18,
                Duration=10
            })
        end)
    else
        t18="Достаточно целей ("..ak2.."), можно фармить."
    end
end
ak1()

local function al1(al2)
    local al3=al2:FindFirstChild("MainPart")or al2.PrimaryPart
    if not al3 then return{}end
    local al4=s3:FindFirstChild("Filter")and s3.Filter:FindFirstChild("SpawnedBread")
    if not al4 then return{}end
    local al5={}
    for _,al6 in ipairs(al4:GetChildren())do
        pcall(function()
            if al6:IsA("Part")and al6.Transparency<1 then
                if(al6.Position-al3.Position).Magnitude<=25 then table.insert(al5,al6)end
            end
        end)
    end
    return al5
end

local function am1(am2)
    local am3=al1(am2)
    if #am3==0 then return false end
    l1("Собираю "..#am3.." пачек денег возле сейфа")
    t8="Сбор денег"
    for _,am4 in ipairs(am3)do
        if not t1.a1 then break end
        pcall(function()
            if am4 and am4.Parent and am4.Transparency<1 then
                ac1(am4)
                local am5=s4:FindFirstChild("Events")and s4.Events:FindFirstChild("CZDPZUS")
                if am5 then pcall(function()am5:FireServer(am4)end)end
                task.wait(0.3)
            end
        end)
    end
    t8="Ожидание"
    return #al1(am2)>0
end

local function an1(an2)
    if not ae1("Crowbar")then
        l1("Нет лома для открытия сейфа, пробую купить...")
        local an17=ah1()
        if not an17 then
            l1("Не удалось купить лом, пропускаю сейф")
            return false
        end
    end
    if not s7.Character:FindFirstChild("Crowbar")then
        l1("Лом в рюкзаке, экипирую...")
        af1("Crowbar")
        task.wait(1)
    end
    if not ae1("Crowbar")then
        l1("Лом так и не появился, пропускаю")
        return false
    end
    task.wait(1.5)
    local an3=s4:FindFirstChild("Events")
    if not an3 then l1("Папка Events не найдена")return false end
    local an4=an3:FindFirstChild("XMHH.2")
    local an5=an3:FindFirstChild("XMHH2.2")
    local an6=an2:FindFirstChild("MainPart")or an2.PrimaryPart
    if not an4 or not an5 then l1("Remote events для взлома не найдены")return false end
    if not an6 then l1("У сейфа нет основной части")return false end
    l1("Начинаю взлом сейфа")
    t8="Взлом сейфа"
    local an7=tick()
    local an8=0
    while t1.a1 and an2 and an2.Parent do
        local an9=an2:FindFirstChild("Values")
        if not an9 then break end
        local an10=an9:FindFirstChild("Broken")
        if an10 and an10.Value then l1("Сейф уже взломан")break end
        if tick()-an7>25 then l1("Таймаут взлома")break end
        task.wait(0.4)
        local an11=s7.Character and s7.Character:FindFirstChild("Crowbar")
        if not an11 then
            an11=s7.Backpack and s7.Backpack:FindFirstChild("Crowbar")
            if an11 then af1("Crowbar") end
        end
        if not an11 then break end
        local an12=s7.Character:FindFirstChild("Right Arm")or s7.Character:FindFirstChild("RightHand")
        if not an12 then break end
        local an13,an14=pcall(function()return an4:InvokeServer("🍞",tick(),an11,"DZDRRRKI",an2,"Register")end)
        if an13 and an14 then
            pcall(function()an5:FireServer("🍞",tick(),an11,"2389ZFX34",an14,false,an12,an6,an2,an6.Position,an6.Position)end)
            an8=an8+1
        end
        if an8%4==0 then task.wait(0.8)end
        t3=tick()
    end
    task.wait(2)
    l1("Взлом завершен, ударов: "..an8)
    t8="Ожидание"
    return true
end

local ao1=false
local ao2=nil

local function ap1()
    s8:SendKeyEvent(true,Enum.KeyCode.E,false,game)
    task.wait(0.1)
    s8:SendKeyEvent(false,Enum.KeyCode.E,false,game)
end

local function aq1()
    if ao1 then
        ao1=false
        if ao2 then ao2:Disconnect() ao2=nil end
    end
end

local function ar1()
    if ao1 then return end
    ao1=true
    l1("Смерть обнаружена - нажимаю E для возрождения")
    t8="Смерть"
    ao2=s1.Heartbeat:Connect(function()
        if not ao1 then if ao2 then ao2:Disconnect()ao2=nil end return end
        local as1=s7.Character
        local as2=as1 and as1:FindFirstChild("Humanoid")
        if as1 and as2 and as2.Health>0 then aq1() t8="Ожидание" return end
        pcall(ap1)
    end)
end

local function at1(au1)
    aq1()
    task.wait(3)
    t23=false
    t25=false
    if t1.a1 then 
        t1.a2=false 
        t3=tick() 
        x5()
        l1("Персонаж возродился, продолжаю") 
        t8="Ожидание" 
    end
    local au2=au1:WaitForChild("Humanoid",5)
    if au2 then au2.Died:Connect(ar1)end
end

s7.CharacterAdded:Connect(at1)
if s7.Character then at1(s7.Character)end

local au3=false
local au4=nil
local au5={}
local au6=20

local function au7(au8)
    au8=string.gsub(au8,"([a-z])([A-Z])","%1 %2")
    au8=string.gsub(au8,"_"," ")
    if au8:lower():find("safe")then
        return "🔒 "..au8
    elseif au8:lower():find("register")then
        return "💰 "..au8
    end
    return au8
end

local function au9(au10,au11)
    local au12=Instance.new("Highlight")
    au12.Name="au12"
    au12.Adornee=au10
    au12.FillColor=au11
    au12.FillTransparency=0.5
    au12.OutlineColor=Color3.new(1,1,1)
    au12.OutlineTransparency=0
    au12.Parent=au10
    return au12
end

local function au13()
    if not au3 then return end
    local au14=s3:FindFirstChild("Map")and s3.Map:FindFirstChild("BredMakurz")or s3:FindFirstChild("Filter")and s3.Filter:FindFirstChild("BredMakurz")
    if not au14 then
        for _,au15 in ipairs(s3:GetDescendants())do
            if au15.Name=="BredMakurz"and au15:IsA("Folder")then
                au14=au15
                break
            end
        end
    end
    if not au14 then return end
    local au16=s7.Character
    local au17=au16 and au16:FindFirstChild("HumanoidRootPart")
    if not au17 then return end
    for _,au18 in ipairs(au14:GetChildren())do
        local au19=au18.Name:lower()
        if au19:find("safe")or au19:find("register")then
            local au20=au18.PrimaryPart or au18:FindFirstChildOfClass("BasePart")
            if not au20 then continue end
            if au20.Position.Y<4.8 then continue end
            local au21=au18:FindFirstChild("Values")
            local au22=au21 and au21:FindFirstChild("Broken")
            local au23=au22 and au22.Value
            local au24=au23 and Color3.new(1,0,0)or Color3.new(0,1,0)
            local au25=au5[au18]
            if not au25 then
                local au26=Instance.new("BillboardGui")
                au26.Name="au26"
                au26.Adornee=au20
                au26.Size=UDim2.new(0,200,0,50)
                au26.StudsOffset=Vector3.new(0,4,0)
                au26.AlwaysOnTop=true
                au26.MaxDistance=1000
                au26.Parent=au18
                local au27=Instance.new("TextLabel")
                au27.Size=UDim2.new(1,0,1,0)
                au27.BackgroundTransparency=1
                au27.Font=Enum.Font.SourceSansBold
                au27.TextScaled=false
                au27.Text=au7(au18.Name)
                au27.TextColor3=au24
                au27.TextStrokeTransparency=0
                au27.TextStrokeColor3=Color3.new(0,0,0)
                au27.TextSize=au6
                au27.Parent=au26
                local au28=au9(au18,au24)
                au5[au18]={
                    au26=au26,
                    au28=au28,
                    au27=au27
                }
                if au22 then
                    au22:GetPropertyChangedSignal("Value"):Connect(function()
                        if not au3 or not au5[au18]then return end
                        local au29=au5[au18]
                        if au22.Value then
                            au29.au27.TextColor3=Color3.new(1,0,0)
                            if au29.au28 then
                                au29.au28.FillColor=Color3.new(1,0,0)
                            end
                        else
                            au29.au27.TextColor3=Color3.new(0,1,0)
                            if au29.au28 then
                                au29.au28.FillColor=Color3.new(0,1,0)
                            end
                        end
                    end)
                end
            else
                if au22 then
                    au25.au27.TextColor3=au23 and Color3.new(1,0,0)or Color3.new(0,1,0)
                    if au25.au28 then
                        au25.au28.FillColor=au23 and Color3.new(1,0,0)or Color3.new(0,1,0)
                    end
                end
                if au25.au27 then
                    au25.au27.TextSize=au6
                end
            end
        end
    end
    for au18,au30 in pairs(au5)do
        if not au18 or not au18.Parent then
            pcall(function()
                if au30.au26 then au30.au26:Destroy()end
                if au30.au28 then au30.au28:Destroy()end
            end)
            au5[au18]=nil
        end
    end
end

local function au31()
    if au3 then return end
    au3=true
    au4=s1.Heartbeat:Connect(au13)
    l1("ESP для всех сейфов/касс ВКЛЮЧЕН")
end

local function au32()
    if not au3 then return end
    au3=false
    if au4 then
        au4:Disconnect()
        au4=nil
    end
    for au18,au30 in pairs(au5)do
        pcall(function()
            if au30.au26 then au30.au26:Destroy()end
            if au30.au28 then au30.au28:Destroy()end
        end)
    end
    au5={}
    l1("ESP для всех сейфов/касс ВЫКЛЮЧЕН")
end

local function av1()
    l1("Запуск анализа целей...")
    t20={}
    local av2=nil
    local av3=s3:FindFirstChild("Map")
    if av3 then av2=av3:FindFirstChild("BredMakurz")end
    if not av2 then
        local av4=s3:FindFirstChild("Filter")
        if av4 then av2=av4:FindFirstChild("BredMakurz")end
    end
    if not av2 then
        for _,av5 in ipairs(s3:GetDescendants())do
            if av5.Name=="BredMakurz"and av5:IsA("Folder")then av2=av5 break end
        end
    end
    if av2 then
        for _,av6 in ipairs(av2:GetChildren())do
            local av7=av6:FindFirstChild("Values")
            if av7 then
                local av8=av7:FindFirstChild("Broken")
                if av8 then
                    t20[av6]=av8.Value
                    av8:GetPropertyChangedSignal("Value"):Connect(function()
                        if t1.a1 then
                            t20[av6]=av8.Value
                            aj1()
                            ak1()
                            l1("Статус цели изменен: "..av6.Name.." теперь "..tostring(av8.Value))
                        end
                    end)
                end
            end
        end
        l1("Анализ целей завершен, отслеживается "..#t20.." объектов")
    end
end
av1()

local function aw1()
    l1("Цикл автофермы запущен")
    x5()
    while true do
        task.wait(1)
        if not t1.a1 then task.wait(1)continue end
        l1("=== Цикл фермы ===")
        local ax1=s7.Character
        local ax2=ax1 and ax1:FindFirstChildOfClass("Humanoid")
        t1.a2=(not ax2)or(ax2.Health<=0)
        if t1.a2 then l1("Персонаж мертв, ожидание")task.wait(3)continue end
        x5()
        if not ae1("Crowbar")then
            l1("Нет лома, пробую купить")
            local ax3=ah1()
            if not ax3 then l1("Не удалось купить лом, жду 5 сек")task.wait(5)continue end
        else l1("Лом уже есть")end
        local ax4,ax5=aj1()
        t17=ax4
        if ax4<5 then
            l1("Осталось мало целей ("..ax4.."), рекомендую сменить сервер")
        end
        if ax4==0 then
            l1("Нет доступных целей, жду 5 сек")
            task.wait(5)
            continue
        end
        local ax6=nil
        local ax7=math.huge
        for _,ax8 in ipairs(t24)do
            if not t1.a5[ax8.obj]then
                local ax9=(ax8.pos-s7.Character.HumanoidRootPart.Position).Magnitude
                if ax9<ax7 then
                    ax7=ax9
                    ax6=ax8.obj
                end
            end
        end
        if not ax6 then
            l1("Нет доступных целей, жду 5 сек")
            task.wait(5)
            continue
        end
        local ax12=ax6:FindFirstChild("MainPart")or ax6.PrimaryPart
        if not ax12 then
            l1("У цели нет MainPart, пропускаю")
            t1.a4[ax6]=true
            continue
        end
        l1("Движение к цели: "..ax6.Name..", расстояние "..math.floor((ax12.Position-s7.Character.HumanoidRootPart.Position).Magnitude))
        local ax13=ac1(ax12)
        if ax13 then
            if not s7.Character:FindFirstChild("Crowbar")then af1("Crowbar")end
            l1("Открываю сейф")
            local ax14=an1(ax6)
            if ax14 then
                l1("Сейф открыт, собираю деньги")
                local ax15=am1(ax6)
                local ax16=5
                while ax15 and ax16>0 do
                    task.wait(2)
                    ax15=am1(ax6)
                    ax16=ax16-1
                end
                t1.a4[ax6]=true
                l1("Сейф полностью обработан")
            else
                l1("Не удалось открыть сейф, временно игнорирую")
                t1.a5[ax6]=tick()+t1.a6
                table.insert(t1.a3,ax6)
            end
        else
            l1("Не удалось достичь цели, временно игнорирую")
            t1.a5[ax6]=tick()+t1.a6
            table.insert(t1.a3,ax6)
        end
        task.wait(2)
    end
end

local ay1=loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local ay2=ay1:CreateWindow({
    Title="AutoFarm",
    SubTitle="",
    TabWidth=120,
    Size=UDim2.fromOffset(450,400),
    Acrylic=true,
    Theme="DarkPurple",
    MinimizeKey=Enum.KeyCode.RightControl
})

local ay3={
    Main=ay2:AddTab({Title="Farm",Icon="zap"}),
    Stats=ay2:AddTab({Title="Info",Icon="info"}),
    Visuals=ay2:AddTab({Title="Visuals",Icon="eye"})
}

ay3.Main:AddToggle("AutoFarmToggle",{
    Title="Start Farm",
    Description="",
    Default=false,
    Callback=function(az1)
        t1.a1=az1
        if az1 then
            t1.a3={}
            t1.a4={}
            t1.a5={}
            aj1()
            ak1()
            x5()
            l1("Автоферма ВКЛЮЧЕНА")
            ay1:Notify({Title="AutoFarm",Content="Запущено",Duration=2})
        else
            y2()
            t6=false
            t8="Ожидание"
            l1("Автоферма ВЫКЛЮЧЕНА")
            ay1:Notify({Title="AutoFarm",Content="Остановлено",Duration=2})
        end
    end
})

ay3.Main:AddToggle("AutoPickupMoneyToggle",{
    Title="Auto Money",
    Description="",
    Default=true,
    Callback=function(ba1)
        if ba1 then
            v3()
            l1("Авто-подбор денег ВКЛЮЧЕН")
        else
            v10()
            l1("Авто-подбор денег ВЫКЛЮЧЕН")
        end
    end
})

ay3.Main:AddToggle("InvisibilityToggle",{
    Title="Invis (R6)",
    Description="",
    Default=false,
    Callback=function(bb1)
        if bb1 then
            _G.Invis_Enable()
            l1("Невидимость ВКЛЮЧЕНА")
        else
            _G.Invis_Disable()
            l1("Невидимость ВЫКЛЮЧЕНА")
        end
    end
})

ay3.Main:AddToggle("AntiAfkToggle",{
    Title="Anti-AFK",
    Description="",
    Default=true,
    Callback=function(bc1)
        u2=bc1
        if bc1 then
            u4()
            l1("Анти-АФК ВКЛЮЧЕН")
        else
            u5()
            l1("Анти-АФК ВЫКЛЮЧЕН")
        end
    end
})

ay3.Main:AddSlider("SpeedSlider",{
    Title="Speed",
    Description="",
    Default=22,
    Min=10,
    Max=45,
    Rounding=1,
    Callback=function(bd1)
        t1.a9=bd1
        l1("Скорость "..bd1)
    end
})

ay3.Visuals:AddToggle("SafeESPToggle",{
    Title="Safe/Register ESP",
    Default=false,
    Callback=function(be1)
        if be1 then
            au31()
        else
            au32()
        end
    end
})

ay3.Visuals:AddSlider("TextSizeSlider",{
    Title="Text Size",
    Default=20,
    Min=10,
    Max=40,
    Rounding=0,
    Callback=function(bf1)
        au6=bf1
        for _,bf2 in pairs(au5)do
            if bf2.au27 then
                bf2.au27.TextSize=au6
            end
        end
    end
})

local bf3=ay3.Stats:AddParagraph({
    Title="Статус",
    Content="Загрузка..."
})

local bf4=ay3.Stats:AddParagraph({
    Title="Сейфы",
    Content="0/0"
})

local bf5=ay3.Stats:AddParagraph({
    Title="Кассы",
    Content="0/0"
})

local bf6=ay3.Stats:AddParagraph({
    Title="Осталось",
    Content="0/0"
})

local bf7=ay3.Stats:AddParagraph({
    Title="Совет",
    Content="Загрузка..."
})

task.spawn(function()
    while true do
        if t1.a1 then
            bf3:SetDesc(t8)
            bf4:SetDesc(t9.."/"..t13)
            bf5:SetDesc(t10.."/"..t14)
            bf6:SetDesc((t9+t10).."/"..(t13+t14))
            bf7:SetDesc(t18)
        else
            bf3:SetDesc("Ожидание")
            bf4:SetDesc("0/0")
            bf5:SetDesc("0/0")
            bf6:SetDesc("0/0")
            bf7:SetDesc("Запусти ферму")
        end
        task.wait(0.5)
    end
end)

ay1:Notify({Title="AutoFarm",Content="Загружено",Duration=2})

task.spawn(aw1)
