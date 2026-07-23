-- ============================================================
-- NOCLIP UI v2.0 - FULL VERSION
-- FIX: Float button drag + click, chống lặp UI, loadstring ready
-- ============================================================

-- ============================================================
-- MODULE WRAPPER
-- ============================================================
local Noclip = {
    Version = "2.0",
    Key = "NOCLIP2026",
    Discord = "https://discord.gg/noclip",
    _instance = nil,
    _loaded = false
}

-- ============================================================
-- UI CREATION FUNCTION
-- ============================================================
local function createNoclipUI()
    -- Kiểm tra đã tồn tại chưa
    if Noclip._loaded and Noclip._instance then
        return Noclip
    end

    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")

    local LocalPlayer = Players.LocalPlayer

    local IMG_CIRCLE = "rbxthumb://type=Asset&id=134280917319249&w=420&h=420"
    local IMG_SQUARE = "rbxthumb://type=Asset&id=137319250997858&w=420&h=420"

    local COLORS = {
        bg = Color3.fromRGB(8, 8, 18),
        bgLight = Color3.fromRGB(12, 12, 25),
        titleBar = Color3.fromRGB(15, 15, 32),
        accent = Color3.fromRGB(70, 130, 255),
        border = Color3.fromRGB(50, 50, 90),
        tabActive = Color3.fromRGB(40, 40, 75),
        textWhite = Color3.fromRGB(255, 255, 255),
        textGray = Color3.fromRGB(160, 160, 190),
        red = Color3.fromRGB(220, 60, 60),
        green = Color3.fromRGB(60, 200, 120),
        purple = Color3.fromRGB(130, 80, 220),
        inputBg = Color3.fromRGB(18, 18, 35),
    }

    local VALID_KEY = "NOCLIP2026"
    local DISCORD_LINK = "https://discord.gg/noclip"

    local ICONS = {
        ["search"] = "rbxassetid://5107220207",
        ["settings"] = "rbxassetid://7059346373",
        ["user"] = "rbxassetid://81489458260315",
        ["x"] = "rbxassetid://4458805208",
        ["check"] = "rbxassetid://5959696880",
        ["chevron-down"] = "rbxassetid://103256317191387",
        ["save"] = "rbxassetid://4458874645",
        ["download"] = "rbxassetid://78813928987436",
        ["play"] = "rbxassetid://87003065970333",
        ["discord"] = "rbxassetid://135550354937113",
        ["shield"] = "rbxassetid://98159911363596",
        ["info"] = "rbxassetid://76311199408449",
        ["clock"] = "rbxassetid://136442043483061",
        ["sliders"] = "rbxassetid://121867517528976",
        ["layers"] = "rbxassetid://13853348331",
        ["eye"] = "rbxassetid://15922050695",
        ["key"] = "rbxassetid://117047144730308",
        ["code"] = "rbxassetid://87667913110964",
        ["refresh"] = "rbxassetid://82235228007110",
        ["file"] = "rbxassetid://78388764182737",
        ["github"] = "rbxassetid://87667913110964",
        ["server"] = "rbxassetid://15567974330",
        ["send"] = "rbxassetid://98712755979169",
    }

    -- ============================================================
    -- ANIMATION DATA
    -- ============================================================
    local ANIMATIONS = {
        ["Idle"] = {
            ["[VOTE] Aura"] = "93382302369459",
            ["Vampire"] = "1083455352",
            ["Wicked (Popular)"] = "104325245285198",
            ["Toy"] = "10921308158",
            ["Default Retarget"] = "117150377950987",
            ["Princess"] = "941008832",
            ["[UGC] happy"] = "72388373557525"
        },
        ["Fall"] = {
            ["Robot"] = "616087089",
            ["Patrol"] = "1148863382",
            ["Adidas Community"] = "98600215928904",
            ["Levitation"] = "616005863",
            ["Catwalk Glam"] = "92294537340807",
            ["Knight"] = "10921122579",
            ["Pirate"] = "750780242",
            ["Bold"] = "16738333171",
            ["Sports (Adidas)"] = "18537367238",
            ["Zombie"] = "616157476",
            ["Astronaut"] = "891617961",
            ["Cartoony"] = "742637151",
            ["Ninja"] = "656115606",
            ["Confident"] = "1069973677",
            ["Wicked Dancing Through Life"] = "78147885297412",
            ["Unboxed By Amazon"] = "94788218468396",
            ["R6"] = "12520972571",
            ["[UGC] skydiving"] = "102674302534126",
            ["R15 Reanimated"] = "4211216152",
            ["Rthro"] = "10921262864",
            ["No Boundaries (Walmart)"] = "18747062535",
            ["Werewolf"] = "1083189019",
            ["[VOTE] TPose"] = "139027266704971",
            ["Mage"] = "707829716",
            ["[VOTE] Animal"] = "77069224396280",
            ["Popstar"] = "1212900995",
            ["NFL"] = "129773241321032",
            ["OldSchool"] = "10921241244",
            ["Sneaky"] = "1132469004",
            ["Elder"] = "10921105765",
            ["Bubbly"] = "910001910",
            ["Stylish"] = "616134815",
            ["Stylized Female"] = "4708186162",
            ["Vampire"] = "1083443587",
            ["Superhero"] = "10921293373",
            ["Toy"] = "782846423",
            ["Default Retarget"] = "110205622518029",
            ["Princess"] = "941000007",
            ["Cowboy"] = "1014384571"
        },
        ["SwimIdle"] = {
            ["Sneaky"] = "1132506407",
            ["SuperHero"] = "10921297391",
            ["Adidas Community"] = "109346520324160",
            ["Levitation"] = "10921139478",
            ["Catwalk Glam"] = "98854111361360",
            ["Knight"] = "10921125935",
            ["Pirate"] = "750785176",
            ["Bold"] = "16738339817",
            ["Sports (Adidas)"] = "18537387180",
            ["Stylized"] = "4708190607",
            ["Astronaut"] = "891663592",
            ["Cartoony"] = "10921079380",
            ["Wicked (Popular)"] = "113199415118199",
            ["Mage"] = "707894699",
            ["Wicked Dancing Through Life"] = "129183123083281",
            ["Unboxed By Amazon"] = "129126268464847",
            ["R6"] = "12518152696",
            ["Rthro"] = "10921265698",
            ["CowBoy"] = "1014411816",
            ["No Boundaries (Walmart)"] = "18747071682",
            ["Werewolf"] = "10921341319",
            ["NFL"] = "79090109939093",
            ["OldSchool"] = "10921244018",
            ["Robot"] = "10921253767",
            ["Elder"] = "10921110146",
            ["Bubbly"] = "910030921",
            ["Patrol"] = "1151221899",
            ["Vampire"] = "10921325443",
            ["Popstar"] = "1212998578",
            ["Ninja"] = "656118341",
            ["Toy"] = "10921310341",
            ["Confident"] = "1070012133",
            ["Princess"] = "941025398",
            ["Stylish"] = "10921281964"
        },
        ["Swim"] = {
            ["Sneaky"] = "1132500520",
            ["Patrol"] = "1151204998",
            ["Adidas Community"] = "133308483266208",
            ["Levitation"] = "10921138209",
            ["Catwalk Glam"] = "134591743181628",
            ["Knight"] = "10921125160",
            ["Pirate"] = "750784579",
            ["Bold"] = "16738339158",
            ["Sports (Adidas)"] = "18537389531",
            ["Zombie"] = "616165109",
            ["Astronaut"] = "891663592",
            ["Cartoony"] = "10921079380",
            ["Wicked (Popular)"] = "99384245425157",
            ["Mage"] = "707876443",
            ["PopStar"] = "1212998578",
            ["Unboxed By Amazon"] = "105962919001086",
            ["R6"] = "12518152696",
            ["[VOTE] Boat"] = "85689117221382",
            ["Rthro"] = "10921264784",
            ["CowBoy"] = "1014406523",
            ["No Boundaries (Walmart)"] = "18747073181",
            ["Werewolf"] = "10921340419",
            ["NFL"] = "132697394189921",
            ["OldSchool"] = "10921243048",
            ["Wicked Dancing Through Life"] = "110657013921774",
            ["Elder"] = "10921108971",
            ["Bubbly"] = "910028158",
            ["Robot"] = "10921253142",
            ["[VOTE] Aura"] = "80645586378736",
            ["Vampire"] = "10921324408",
            ["Stylish"] = "10921281000",
            ["Toy"] = "10921309319",
            ["SuperHero"] = "10921295495",
            ["Princess"] = "941018893",
            ["Confident"] = "1070009914"
        },
        ["Climb"] = {
            ["Robot"] = "616086039",
            ["Patrol"] = "1148811837",
            ["Adidas Community"] = "88763136693023",
            ["Levitation"] = "10921132092",
            ["Catwalk Glam"] = "119377220967554",
            ["Knight"] = "10921125160",
            ["[VOTE] Animal"] = "124810859712282",
            ["Bold"] = "16738332169",
            ["Sports (Adidas)"] = "18537363391",
            ["Zombie"] = "616156119",
            ["Astronaut"] = "10921032124",
            ["Cartoony"] = "742636889",
            ["Ninja"] = "656114359",
            ["Confident"] = "1069946257",
            ["Wicked Dancing Through Life"] = "129447497744818",
            ["Unboxed By Amazon"] = "121145883950231",
            ["R6"] = "12520982150",
            ["Ghost"] = "616003713",
            ["Rthro"] = "10921257536",
            ["CowBoy"] = "1014380606",
            ["No Boundaries (Walmart)"] = "18747060903",
            ["Mage"] = "707826056",
            ["[VOTE] sticky"] = "77520617871799",
            ["Reanimated R15"] = "4211214992",
            ["Popstar"] = "1213044953",
            ["(UGC) Retro"] = "121075390792786",
            ["NFL"] = "134630013742019",
            ["OldSchool"] = "10921229866",
            ["Sneaky"] = "1132461372",
            ["Elder"] = "845392038",
            ["Stylized Female"] = "4708184253",
            ["Stylish"] = "10921271391",
            ["SuperHero"] = "10921286911",
            ["WereWolf"] = "10921329322",
            ["Vampire"] = "1083439238",
            ["Toy"] = "10921300839",
            ["Wicked (Popular)"] = "131326830509784",
            ["Princess"] = "940996062",
            ["[VOTE] Rope"] = "134977367563514"
        }
    }

    local ANIMATION_CATEGORIES = {"Idle", "Fall", "SwimIdle", "Swim", "Climb"}

    -- ============================================================
    -- UTILITIES
    -- ============================================================
    local function tween(obj, props, dur, style, dir)
        if not obj then return end
        dur = dur or 0.2
        style = style or Enum.EasingStyle.Quad
        dir = dir or Enum.EasingDirection.Out
        local t = TweenService:Create(obj, TweenInfo.new(dur, style, dir), props)
        t:Play()
        return t
    end

    local function addCorner(inst, radius)
        if not inst then return end
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, radius)
        c.Parent = inst
        return c
    end

    local function addGlow(parent, color, thickness)
        if not parent then return end
        color = color or COLORS.accent
        thickness = thickness or 2
        for i, trans in ipairs({0, 0.55, 0.8}) do
            local s = Instance.new("UIStroke", parent)
            s.Color = color
            s.Thickness = thickness + (i - 1) * 2
            s.Transparency = trans
            s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        end
    end

    local function addIcon(parent, iconName, size, pos)
        if not parent or not iconName then return end
        if iconName and ICONS[iconName] then
            local img = Instance.new("ImageLabel")
            img.BackgroundTransparency = 1
            img.Size = size or UDim2.new(0, 16, 0, 16)
            img.Position = pos or UDim2.new(0, 8, 0.5, -8)
            img.Image = ICONS[iconName]
            img.ImageColor3 = Color3.fromRGB(220, 220, 245)
            img.ScaleType = Enum.ScaleType.Fit
            img.Active = false
            img.Parent = parent
            return img
        end
    end

    local function copyToClipboard(str)
        pcall(function()
            if setclipboard then setclipboard(str)
            elseif toclipboard then toclipboard(str) end
        end)
    end

    -- ============================================================
    -- SPACE THEME
    -- ============================================================
    local function addSpaceTheme(parent, starCount)
        if not parent then return end
        starCount = starCount or 50

        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 4, 15)),
            ColorSequenceKeypoint.new(0.3, Color3.fromRGB(10, 6, 28)),
            ColorSequenceKeypoint.new(0.55, Color3.fromRGB(6, 10, 32)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(12, 5, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 4, 15)),
        })
        grad.Rotation = 135
        grad.Parent = parent

        task.spawn(function()
            local rot = 135
            while grad.Parent do
                rot = (rot + 0.4) % 360
                grad.Rotation = rot
                task.wait(0.03)
            end
        end)

        local milky = Instance.new("Frame")
        milky.Size = UDim2.new(1.5, 0, 0, 35)
        milky.Position = UDim2.new(-0.25, 0, 0.3, 0)
        milky.BackgroundColor3 = Color3.fromRGB(180, 190, 220)
        milky.BackgroundTransparency = 0.88
        milky.BorderSizePixel = 0
        milky.Rotation = -25
        milky.ZIndex = 0
        milky.Active = false
        milky.Parent = parent
        addCorner(milky, 0)

        local milkyGrad = Instance.new("UIGradient")
        milkyGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 120, 200)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 210, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 120, 200)),
        })
        milkyGrad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.3, 0.7),
            NumberSequenceKeypoint.new(0.5, 0.5),
            NumberSequenceKeypoint.new(0.7, 0.7),
            NumberSequenceKeypoint.new(1, 1),
        })
        milkyGrad.Parent = milky

        task.spawn(function()
            while milky.Parent do
                tween(milky, {Position = UDim2.new(-0.2, 0, 0.35, 0)}, 6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(6)
                tween(milky, {Position = UDim2.new(-0.3, 0, 0.25, 0)}, 6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(6)
            end
        end)

        local nebulaColors = {
            Color3.fromRGB(40, 15, 70), Color3.fromRGB(10, 30, 65),
            Color3.fromRGB(50, 10, 45), Color3.fromRGB(8, 20, 55),
        }
        for i = 1, 4 do
            local nebula = Instance.new("Frame")
            nebula.Size = UDim2.new(0, math.random(50, 140), 0, math.random(35, 90))
            nebula.Position = UDim2.new(math.random(0, 75) / 100, 0, math.random(0, 65) / 100, 0)
            nebula.BackgroundColor3 = nebulaColors[i]
            nebula.BackgroundTransparency = 0.7
            nebula.BorderSizePixel = 0
            nebula.ZIndex = 0
            nebula.Active = false
            nebula.Parent = parent
            addCorner(nebula, math.random(20, 45))

            task.spawn(function()
                while nebula.Parent do
                    local t1 = math.random(8, 15) / 10
                    tween(nebula, {BackgroundTransparency = 0.55}, t1)
                    task.wait(t1)
                    tween(nebula, {BackgroundTransparency = 0.85}, math.random(8, 15) / 10)
                    task.wait(math.random(8, 15) / 10)
                end
            end)

            task.spawn(function()
                while nebula.Parent do
                    local cp = nebula.Position
                    tween(nebula, {
                        Position = UDim2.new(cp.X.Scale, cp.X.Offset + math.random(-20, 20), cp.Y.Scale, cp.Y.Offset + math.random(-15, 15))
                    }, math.random(20, 35) / 10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                    task.wait(math.random(20, 35) / 10)
                end
            end)
        end

        local starColors = {
            Color3.fromRGB(255, 255, 255), Color3.fromRGB(200, 220, 255),
            Color3.fromRGB(255, 240, 200), Color3.fromRGB(255, 200, 180),
            Color3.fromRGB(180, 200, 255),
        }

        for i = 1, starCount do
            local star = Instance.new("Frame")
            local size = math.random(1, 3)
            star.Size = UDim2.new(0, size, 0, size)
            star.Position = UDim2.new(math.random(0, 99) / 100, 0, math.random(0, 97) / 100, 0)
            star.BackgroundColor3 = starColors[math.random(1, #starColors)]
            star.BackgroundTransparency = math.random(15, 65) / 100
            star.BorderSizePixel = 0
            star.ZIndex = 0
            star.Active = false
            star.Parent = parent
            addCorner(star, size)

            task.spawn(function()
                while star.Parent do
                    local dt = math.random(15, 35) / 10
                    local cp = star.Position
                    tween(star, {Position = UDim2.new(cp.X.Scale, cp.X.Offset + math.random(-30, -10), cp.Y.Scale, cp.Y.Offset)}, dt, Enum.EasingStyle.Linear)
                    task.wait(dt)
                    if star.Position.X.Offset < -30 then
                        star.Position = UDim2.new(1.03, 0, star.Position.Y.Scale, star.Position.Y.Offset)
                    end
                end
            end)

            if math.random(1, 2) == 1 then
                task.spawn(function()
                    while star.Parent do
                        local bt = star.BackgroundTransparency
                        tween(star, {BackgroundTransparency = math.min(bt + 0.45, 0.95)}, math.random(3, 8) / 10)
                        task.wait(math.random(3, 8) / 10)
                        tween(star, {BackgroundTransparency = bt}, math.random(3, 8) / 10)
                        task.wait(math.random(3, 8) / 10)
                    end
                end)
            end
        end

        for i = 1, 7 do
            local bstar = Instance.new("Frame")
            bstar.Size = UDim2.new(0, 4, 0, 4)
            bstar.Position = UDim2.new(math.random(3, 92) / 100, 0, math.random(3, 92) / 100, 0)
            bstar.BackgroundColor3 = starColors[math.random(1, #starColors)]
            bstar.BackgroundTransparency = 0.05
            bstar.BorderSizePixel = 0
            bstar.ZIndex = 0
            bstar.Active = false
            bstar.Parent = parent
            addCorner(bstar, 2)

            task.spawn(function()
                while bstar.Parent do
                    tween(bstar, {BackgroundTransparency = 0.75, Size = UDim2.new(0, 2, 0, 2)}, math.random(4, 9) / 10)
                    task.wait(math.random(4, 9) / 10)
                    tween(bstar, {BackgroundTransparency = 0, Size = UDim2.new(0, 6, 0, 6)}, math.random(4, 9) / 10)
                    task.wait(math.random(4, 9) / 10)
                end
            end)
        end

        task.spawn(function()
            while parent.Parent do
                task.wait(math.random(2, 5))
                if not parent.Visible then continue end
                local shoot = Instance.new("Frame")
                shoot.Size = UDim2.new(0, math.random(25, 50), 0, 2)
                shoot.Position = UDim2.new(math.random(15, 95) / 100, 0, math.random(0, 35) / 100, 0)
                shoot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                shoot.BackgroundTransparency = 0.1
                shoot.BorderSizePixel = 0
                shoot.Rotation = math.random(20, 45)
                shoot.ZIndex = 1
                shoot.Active = false
                shoot.Parent = parent
                addCorner(shoot, 1)
                local trail = Instance.new("UIGradient")
                trail.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
                trail.Parent = shoot
                local sp = shoot.Position
                local speed = math.random(35, 55) / 100
                tween(shoot, {Position = UDim2.new(sp.X.Scale - speed, sp.X.Offset, sp.Y.Scale + speed * 0.6, sp.Y.Offset), BackgroundTransparency = 1}, 0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                task.delay(0.5, function() if shoot.Parent then shoot:Destroy() end end)
            end
        end)
    end

    -- ============================================================
    -- DRAG + RESIZE
    -- ============================================================
    local function makeDraggable(frame, dragHandle)
        if not frame then return end
        dragHandle = dragHandle or frame
        local dragging = false
        local dragInput, dragStart, startPos

        dragHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)

        dragHandle.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    local function makeResizable(frame, handle, minSize)
        if not frame then return end
        minSize = minSize or Vector2.new(350, 300)
        local resizing = false
        local resizeStart, startSize
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                resizing = true
                resizeStart = input.Position
                startSize = frame.Size
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then resizing = false end
                end)
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - resizeStart
                frame.Size = UDim2.new(startSize.X.Scale, math.max(minSize.X, startSize.X.Offset + delta.X), startSize.Y.Scale, math.max(minSize.Y, startSize.Y.Offset + delta.Y))
            end
        end)
    end

    local function fadeIn(frame, dur)
        if not frame then return end
        dur = dur or 0.3
        frame.Visible = true
        frame.BackgroundTransparency = 1
        for _, c in ipairs(frame:GetDescendants()) do
            if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then c.TextTransparency = 1
            elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then c.ImageTransparency = 1 end
        end
        tween(frame, {BackgroundTransparency = 0}, dur)
        for _, c in ipairs(frame:GetDescendants()) do
            if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then tween(c, {TextTransparency = 0}, dur)
            elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then tween(c, {ImageTransparency = 0}, dur) end
        end
    end

    local function fadeOut(frame, dur, cb)
        if not frame then 
            if cb then cb() end
            return 
        end
        dur = dur or 0.25
        tween(frame, {BackgroundTransparency = 1}, dur)
        for _, c in ipairs(frame:GetDescendants()) do
            if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then tween(c, {TextTransparency = 1}, dur)
            elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then tween(c, {ImageTransparency = 1}, dur) end
        end
        task.delay(dur + 0.05, function() 
            if frame then frame.Visible = false end
            if cb then cb() end 
        end)
    end

    -- ============================================================
    -- SCREEN GUI
    -- ============================================================
    -- Kiểm tra tồn tại trước khi tạo
    local function checkExisting()
        local found = nil
        pcall(function()
            for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
                if gui.Name == "NoclipUI" then
                    found = gui
                    break
                end
            end
            if not found then
                for _, gui in ipairs(LocalPlayer:WaitForChild("PlayerGui", 1):GetChildren()) do
                    if gui.Name == "NoclipUI" then
                        found = gui
                        break
                    end
                end
            end
        end)
        return found
    end

    local existing = checkExisting()
    if existing then
        pcall(function() existing:Destroy() end)
        task.wait(0.3)
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NoclipUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999

    local mounted = pcall(function()
        if gethui then ScreenGui.Parent = gethui()
        elseif syn and syn.protect_gui then syn.protect_gui(ScreenGui) ScreenGui.Parent = game:GetService("CoreGui")
        else ScreenGui.Parent = game:GetService("CoreGui") end
    end)
    if not mounted or not ScreenGui.Parent then
        pcall(function() ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui", 5) end)
    end

    -- ============================================================
    -- CONFIRM POPUP
    -- ============================================================
    local confirmOverlay = Instance.new("Frame")
    confirmOverlay.Size = UDim2.new(1, 0, 1, 0)
    confirmOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    confirmOverlay.BackgroundTransparency = 1
    confirmOverlay.Visible = false
    confirmOverlay.ZIndex = 100
    confirmOverlay.Active = false
    confirmOverlay.Parent = ScreenGui

    local confirmFrame = Instance.new("Frame")
    confirmFrame.Size = UDim2.new(0, 300, 0, 160)
    confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
    confirmFrame.BackgroundColor3 = COLORS.bg
    confirmFrame.BorderSizePixel = 0
    confirmFrame.ClipsDescendants = true
    confirmFrame.ZIndex = 101
    confirmFrame.Parent = confirmOverlay
    addCorner(confirmFrame, 12)
    addGlow(confirmFrame, COLORS.red, 2)
    addSpaceTheme(confirmFrame, 12)

    local confirmTitle = Instance.new("TextLabel")
    confirmTitle.Size = UDim2.new(1, -20, 0, 30) confirmTitle.Position = UDim2.new(0, 10, 0, 10)
    confirmTitle.BackgroundTransparency = 1 confirmTitle.Text = "Confirm Close"
    confirmTitle.TextColor3 = COLORS.red confirmTitle.TextSize = 15
    confirmTitle.Font = Enum.Font.GothamBold confirmTitle.ZIndex = 102
    confirmTitle.Parent = confirmFrame

    local confirmText = Instance.new("TextLabel")
    confirmText.Size = UDim2.new(1, -30, 0, 40) confirmText.Position = UDim2.new(0, 15, 0, 45)
    confirmText.BackgroundTransparency = 1
    confirmText.Text = "Are you sure you want to close NOCLIP UI?"
    confirmText.TextColor3 = COLORS.textWhite confirmText.TextSize = 13
    confirmText.Font = Enum.Font.GothamSemibold confirmText.TextWrapped = true
    confirmText.ZIndex = 102 confirmText.Parent = confirmFrame

    local confirmYes = Instance.new("TextButton")
    confirmYes.Size = UDim2.new(0, 120, 0, 36) confirmYes.Position = UDim2.new(0.5, -130, 0, 105)
    confirmYes.BackgroundColor3 = COLORS.red confirmYes.BorderSizePixel = 0
    confirmYes.Text = "Yes, Close" confirmYes.TextColor3 = COLORS.textWhite
    confirmYes.TextSize = 13 confirmYes.Font = Enum.Font.GothamBold
    confirmYes.AutoButtonColor = false confirmYes.ZIndex = 102
    confirmYes.Parent = confirmFrame
    addCorner(confirmYes, 8)

    local confirmNo = Instance.new("TextButton")
    confirmNo.Size = UDim2.new(0, 120, 0, 36) confirmNo.Position = UDim2.new(0.5, 10, 0, 105)
    confirmNo.BackgroundColor3 = COLORS.tabActive confirmNo.BorderSizePixel = 0
    confirmNo.Text = "Cancel" confirmNo.TextColor3 = COLORS.textWhite
    confirmNo.TextSize = 13 confirmNo.Font = Enum.Font.GothamBold
    confirmNo.AutoButtonColor = false confirmNo.ZIndex = 102
    confirmNo.Parent = confirmFrame
    addCorner(confirmNo, 8)

    local confirmCallback = nil
    local function showConfirm(cb)
        confirmCallback = cb
        confirmOverlay.Visible = true
        confirmOverlay.BackgroundTransparency = 1
        confirmFrame.Size = UDim2.new(0, 250, 0, 130)
        tween(confirmOverlay, {BackgroundTransparency = 0.5}, 0.2)
        tween(confirmFrame, {Size = UDim2.new(0, 300, 0, 160)}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end
    local function hideConfirm()
        tween(confirmOverlay, {BackgroundTransparency = 1}, 0.2)
        tween(confirmFrame, {Size = UDim2.new(0, 250, 0, 130)}, 0.2)
        task.delay(0.22, function() confirmOverlay.Visible = false confirmCallback = nil end)
    end
    confirmYes.MouseButton1Click:Connect(function()
        local cb = confirmCallback hideConfirm()
        task.delay(0.25, function() if cb then cb() end end)
    end)
    confirmNo.MouseButton1Click:Connect(function() hideConfirm() end)

    -- ============================================================
    -- KEY UI
    -- ============================================================
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Size = UDim2.new(0, 420, 0, 300)
    KeyFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
    KeyFrame.BackgroundColor3 = COLORS.bg KeyFrame.BorderSizePixel = 0
    KeyFrame.ClipsDescendants = true KeyFrame.Parent = ScreenGui
    addCorner(KeyFrame, 12)
    addGlow(KeyFrame, COLORS.accent, 2)
    addSpaceTheme(KeyFrame, 40)

    local keyTitleBar = Instance.new("Frame")
    keyTitleBar.Size = UDim2.new(1, 0, 0, 40)
    keyTitleBar.BackgroundColor3 = COLORS.titleBar keyTitleBar.BackgroundTransparency = 0.3
    keyTitleBar.BorderSizePixel = 0 keyTitleBar.ZIndex = 2 keyTitleBar.Parent = KeyFrame
    addCorner(keyTitleBar, 12)
    local ktf = Instance.new("Frame", keyTitleBar)
    ktf.Size = UDim2.new(1, 0, 0, 12) ktf.Position = UDim2.new(0, 0, 1, -12)
    ktf.BackgroundColor3 = COLORS.titleBar ktf.BackgroundTransparency = 0.3 ktf.BorderSizePixel = 0 ktf.ZIndex = 2 ktf.Active = false

    local ktl = Instance.new("TextLabel")
    ktl.Size = UDim2.new(1, -50, 1, 0) ktl.Position = UDim2.new(0, 15, 0, 0)
    ktl.BackgroundTransparency = 1 ktl.Text = "NOCLIP UI" ktl.ZIndex = 3
    ktl.TextColor3 = COLORS.textWhite ktl.TextSize = 16
    ktl.Font = Enum.Font.GothamBold ktl.TextXAlignment = Enum.TextXAlignment.Left
    ktl.Parent = keyTitleBar

    local keyCloseBtn = Instance.new("TextButton")
    keyCloseBtn.Size = UDim2.new(0, 30, 0, 30) keyCloseBtn.Position = UDim2.new(1, -38, 0, 5)
    keyCloseBtn.BackgroundColor3 = COLORS.red keyCloseBtn.BorderSizePixel = 0
    keyCloseBtn.Text = "X" keyCloseBtn.TextColor3 = COLORS.textWhite
    keyCloseBtn.TextSize = 14 keyCloseBtn.Font = Enum.Font.GothamBold
    keyCloseBtn.ZIndex = 3 keyCloseBtn.AutoButtonColor = false keyCloseBtn.Parent = keyTitleBar
    addCorner(keyCloseBtn, 6)

    keyCloseBtn.MouseButton1Click:Connect(function()
        showConfirm(function() 
            Noclip:Destroy()
        end)
    end)

    local keyAvatar = Instance.new("ImageLabel")
    keyAvatar.Size = UDim2.new(0, 80, 0, 80) keyAvatar.Position = UDim2.new(0.5, -40, 0, 55)
    keyAvatar.BackgroundColor3 = COLORS.inputBg keyAvatar.BorderSizePixel = 0
    keyAvatar.Image = IMG_CIRCLE keyAvatar.ZIndex = 2 keyAvatar.Active = false keyAvatar.Parent = KeyFrame
    addCorner(keyAvatar, 40)

    local wl = Instance.new("TextLabel")
    wl.Size = UDim2.new(1, 0, 0, 25) wl.Position = UDim2.new(0, 0, 0, 145)
    wl.BackgroundTransparency = 1 wl.Text = "Welcome to NOCLIP UI" wl.ZIndex = 2
    wl.TextColor3 = COLORS.textWhite wl.TextSize = 15
    wl.Font = Enum.Font.GothamSemibold wl.Parent = KeyFrame

    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(0, 300, 0, 38) keyInput.Position = UDim2.new(0.5, -150, 0, 180)
    keyInput.BackgroundColor3 = COLORS.inputBg keyInput.BackgroundTransparency = 0.2
    keyInput.BorderSizePixel = 0 keyInput.PlaceholderText = "Enter Key"
    keyInput.PlaceholderColor3 = COLORS.textGray keyInput.Text = ""
    keyInput.TextColor3 = COLORS.textWhite keyInput.TextSize = 14
    keyInput.Font = Enum.Font.Gotham keyInput.ClearTextOnFocus = false
    keyInput.ZIndex = 2 keyInput.Parent = KeyFrame
    addCorner(keyInput, 8)
    local kis = Instance.new("UIStroke", keyInput) kis.Color = COLORS.border kis.Thickness = 1

    local verifyBtn = Instance.new("TextButton")
    verifyBtn.Size = UDim2.new(0, 140, 0, 36) verifyBtn.Position = UDim2.new(0.5, -150, 0, 228)
    verifyBtn.BackgroundColor3 = COLORS.accent verifyBtn.BorderSizePixel = 0
    verifyBtn.Text = "Verify" verifyBtn.TextColor3 = COLORS.textWhite
    verifyBtn.TextSize = 14 verifyBtn.Font = Enum.Font.GothamBold
    verifyBtn.AutoButtonColor = false verifyBtn.ZIndex = 2 verifyBtn.Parent = KeyFrame
    addCorner(verifyBtn, 8)

    local discordBtn = Instance.new("TextButton")
    discordBtn.Size = UDim2.new(0, 140, 0, 36) discordBtn.Position = UDim2.new(0.5, 10, 0, 228)
    discordBtn.BackgroundColor3 = COLORS.purple discordBtn.BorderSizePixel = 0
    discordBtn.Text = "Join Discord" discordBtn.TextColor3 = COLORS.textWhite
    discordBtn.TextSize = 13 discordBtn.Font = Enum.Font.GothamBold
    discordBtn.AutoButtonColor = false discordBtn.ZIndex = 2 discordBtn.Parent = KeyFrame
    addCorner(discordBtn, 8)

    local keyStatus = Instance.new("TextLabel")
    keyStatus.Size = UDim2.new(1, 0, 0, 20) keyStatus.Position = UDim2.new(0, 0, 0, 272)
    keyStatus.BackgroundTransparency = 1 keyStatus.Text = "" keyStatus.ZIndex = 2
    keyStatus.TextColor3 = COLORS.red keyStatus.TextSize = 13
    keyStatus.Font = Enum.Font.GothamSemibold keyStatus.Parent = KeyFrame

    makeDraggable(KeyFrame, keyTitleBar)

    -- ============================================================
    -- MAIN UI
    -- ============================================================
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
    MainFrame.BackgroundColor3 = COLORS.bg MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    addCorner(MainFrame, 12)
    addGlow(MainFrame, COLORS.accent, 2)
    addSpaceTheme(MainFrame, 35)

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 45)
    titleBar.BackgroundColor3 = COLORS.titleBar titleBar.BackgroundTransparency = 0.3
    titleBar.BorderSizePixel = 0 titleBar.ClipsDescendants = false
    titleBar.ZIndex = 2 titleBar.Parent = MainFrame
    addCorner(titleBar, 12)
    local tbf = Instance.new("Frame", titleBar)
    tbf.Size = UDim2.new(1, 0, 0, 12) tbf.Position = UDim2.new(0, 0, 1, -12)
    tbf.BackgroundColor3 = COLORS.titleBar tbf.BackgroundTransparency = 0.3 tbf.BorderSizePixel = 0 tbf.ZIndex = 2 tbf.Active = false

    local titleAvatar = Instance.new("ImageLabel")
    titleAvatar.Size = UDim2.new(0, 32, 0, 32) titleAvatar.Position = UDim2.new(0, 10, 0, 6)
    titleAvatar.BackgroundColor3 = COLORS.inputBg titleAvatar.BorderSizePixel = 0
    titleAvatar.Image = IMG_CIRCLE titleAvatar.ZIndex = 3 titleAvatar.Active = false titleAvatar.Parent = titleBar
    addCorner(titleAvatar, 16)

    local dnl = Instance.new("TextLabel")
    dnl.Size = UDim2.new(0, 100, 0, 18) dnl.Position = UDim2.new(0, 48, 0, 5)
    dnl.BackgroundTransparency = 1 dnl.Text = LocalPlayer.DisplayName dnl.ZIndex = 3
    dnl.TextColor3 = COLORS.textWhite dnl.TextSize = 12
    dnl.Font = Enum.Font.GothamBold dnl.TextXAlignment = Enum.TextXAlignment.Left dnl.Parent = titleBar

    local unl = Instance.new("TextLabel")
    unl.Size = UDim2.new(0, 100, 0, 16) unl.Position = UDim2.new(0, 48, 0, 23)
    unl.BackgroundTransparency = 1 unl.Text = "@" .. LocalPlayer.Name unl.ZIndex = 3
    unl.TextColor3 = COLORS.textGray unl.TextSize = 10
    unl.Font = Enum.Font.Gotham unl.TextXAlignment = Enum.TextXAlignment.Left unl.Parent = titleBar

    local settingsBtn = Instance.new("TextButton")
    settingsBtn.Size = UDim2.new(0, 28, 0, 28) settingsBtn.Position = UDim2.new(1, -134, 0, 8)
    settingsBtn.BackgroundColor3 = COLORS.inputBg settingsBtn.BorderSizePixel = 0
    settingsBtn.Text = "" settingsBtn.AutoButtonColor = false settingsBtn.ZIndex = 3 settingsBtn.Parent = titleBar
    addCorner(settingsBtn, 6)
    addIcon(settingsBtn, "settings", UDim2.new(0, 16, 0, 16), UDim2.new(0.5, -8, 0.5, -8))

    local searchBtn = Instance.new("TextButton")
    searchBtn.Size = UDim2.new(0, 28, 0, 28) searchBtn.Position = UDim2.new(1, -100, 0, 8)
    searchBtn.BackgroundColor3 = COLORS.inputBg searchBtn.BorderSizePixel = 0
    searchBtn.Text = "" searchBtn.AutoButtonColor = false searchBtn.ZIndex = 3 searchBtn.Parent = titleBar
    addCorner(searchBtn, 6)
    addIcon(searchBtn, "search", UDim2.new(0, 16, 0, 16), UDim2.new(0.5, -8, 0.5, -8))

    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Size = UDim2.new(0, 28, 0, 28) minimizeBtn.Position = UDim2.new(1, -66, 0, 8)
    minimizeBtn.BackgroundColor3 = COLORS.inputBg minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = "_" minimizeBtn.TextColor3 = COLORS.textWhite
    minimizeBtn.TextSize = 16 minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.AutoButtonColor = false minimizeBtn.ZIndex = 3 minimizeBtn.Parent = titleBar
    addCorner(minimizeBtn, 6)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28) closeBtn.Position = UDim2.new(1, -34, 0, 8)
    closeBtn.BackgroundColor3 = COLORS.red closeBtn.BorderSizePixel = 0
    closeBtn.Text = "X" closeBtn.TextColor3 = COLORS.textWhite
    closeBtn.TextSize = 13 closeBtn.Font = Enum.Font.GothamBold
    closeBtn.AutoButtonColor = false closeBtn.ZIndex = 3 closeBtn.Parent = titleBar
    addCorner(closeBtn, 6)

    -- ============================================================
    -- FLOAT BUTTON (MINIMIZED)
    -- ============================================================
    local MinFrame = Instance.new("Frame")
    MinFrame.Name = "MinFrame"
    MinFrame.Size = UDim2.new(0, 50, 0, 50)
    MinFrame.Position = UDim2.new(1, -70, 0, 20)
    MinFrame.BackgroundColor3 = COLORS.bg
    MinFrame.BorderSizePixel = 0
    MinFrame.Visible = false
    MinFrame.ZIndex = 999
    MinFrame.Parent = ScreenGui
    addCorner(MinFrame, 8)
    addGlow(MinFrame, COLORS.accent, 2)

    local minImage = Instance.new("ImageLabel")
    minImage.Size = UDim2.new(1, 0, 1, 0)
    minImage.BackgroundTransparency = 1
    minImage.Image = IMG_SQUARE
    minImage.Active = false
    minImage.ScaleType = Enum.ScaleType.Crop
    minImage.Parent = MinFrame
    addCorner(minImage, 8)

    -- FIXED: Float button drag + click
    local minDragging = false
    local minDragStart = nil
    local minStartPos = nil
    local minMoved = false

    MinFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            minDragging = true
            minMoved = false
            minDragStart = input.Position
            minStartPos = MinFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    minDragging = false
                    if not minMoved and MinFrame and MinFrame.Visible then
                        -- Mở UI khi click (không drag)
                        MinFrame.Visible = false
                        if MainFrame then
                            fadeIn(MainFrame, 0.25)
                        end
                    end
                    minDragStart = nil
                end
            end)
        end
    end)

    MinFrame.InputChanged:Connect(function(input)
        if minDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - minDragStart
            if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
                minMoved = true
            end
            MinFrame.Position = UDim2.new(
                minStartPos.X.Scale, 
                minStartPos.X.Offset + delta.X, 
                minStartPos.Y.Scale, 
                minStartPos.Y.Offset + delta.Y
            )
        end
    end)

    -- ============================================================
    -- CONTENT FRAME
    -- ============================================================
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, -20, 1, -92) contentFrame.Position = UDim2.new(0, 10, 0, 86)
    contentFrame.BackgroundColor3 = COLORS.bgLight contentFrame.BorderSizePixel = 0
    contentFrame.ClipsDescendants = true contentFrame.ZIndex = 2 contentFrame.Parent = MainFrame
    addCorner(contentFrame, 8)
    local cs = Instance.new("UIStroke", contentFrame) cs.Color = COLORS.border cs.Thickness = 1
    addSpaceTheme(contentFrame, 30)

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -8, 1, -8) scrollFrame.Position = UDim2.new(0, 4, 0, 4)
    scrollFrame.BackgroundTransparency = 1 scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 4 scrollFrame.ScrollBarImageColor3 = COLORS.accent
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.ZIndex = 3 scrollFrame.Parent = contentFrame
    local sl = Instance.new("UIListLayout") sl.Padding = UDim.new(0, 3) sl.SortOrder = Enum.SortOrder.LayoutOrder sl.Parent = scrollFrame
    local sp = Instance.new("UIPadding")
    sp.PaddingTop = UDim.new(0, 4) sp.PaddingBottom = UDim.new(0, 4)
    sp.PaddingLeft = UDim.new(0, 4) sp.PaddingRight = UDim.new(0, 4) sp.Parent = scrollFrame

    local resizeHandle = Instance.new("Frame")
    resizeHandle.Size = UDim2.new(0, 14, 0, 14)
    resizeHandle.Position = UDim2.new(1, -14, 1, -14)
    resizeHandle.BackgroundColor3 = COLORS.accent resizeHandle.BorderSizePixel = 0
    resizeHandle.ZIndex = 50 resizeHandle.Parent = MainFrame
    addCorner(resizeHandle, 3)

    -- ============================================================
    -- TAB "test"
    -- ============================================================
    local tabScroll = Instance.new("ScrollingFrame")
    tabScroll.Size = UDim2.new(1, -20, 0, 32) tabScroll.Position = UDim2.new(0, 10, 0, 50)
    tabScroll.BackgroundTransparency = 1 tabScroll.BorderSizePixel = 0
    tabScroll.ScrollBarThickness = 0 tabScroll.CanvasSize = UDim2.new(0, 85, 0, 0)
    tabScroll.ScrollingDirection = Enum.ScrollingDirection.X tabScroll.ZIndex = 2 tabScroll.Parent = MainFrame
    local tabLayout = Instance.new("UIListLayout")
    tabLayout.FillDirection = Enum.FillDirection.Horizontal tabLayout.Padding = UDim.new(0, 4)
    tabLayout.Parent = tabScroll

    local testTab = Instance.new("TextButton")
    testTab.Name = "test"
    testTab.Size = UDim2.new(0, 85, 0, 28)
    testTab.BackgroundColor3 = COLORS.tabActive
    testTab.BackgroundTransparency = 0.2
    testTab.BorderSizePixel = 0
    testTab.Text = "test"
    testTab.TextColor3 = COLORS.textWhite
    testTab.TextSize = 11
    testTab.Font = Enum.Font.GothamSemibold
    testTab.AutoButtonColor = false
    testTab.ZIndex = 3
    testTab.Parent = tabScroll
    addCorner(testTab, 6)

    -- ============================================================
    -- SETTINGS POPUP
    -- ============================================================
    local SettingsFrame = Instance.new("Frame")
    SettingsFrame.Name = "SettingsFrame"
    SettingsFrame.Size = UDim2.new(0, 320, 0, 400)
    SettingsFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
    SettingsFrame.BackgroundColor3 = COLORS.bg
    SettingsFrame.BorderSizePixel = 0
    SettingsFrame.ClipsDescendants = true
    SettingsFrame.Visible = false
    SettingsFrame.ZIndex = 60
    SettingsFrame.Parent = ScreenGui
    addCorner(SettingsFrame, 12)
    addGlow(SettingsFrame, COLORS.accent, 2)
    addSpaceTheme(SettingsFrame, 20)

    local setTitle = Instance.new("TextLabel")
    setTitle.Size = UDim2.new(1, -40, 0, 35) setTitle.Position = UDim2.new(0, 12, 0, 5)
    setTitle.BackgroundTransparency = 1 setTitle.Text = "Settings"
    setTitle.TextColor3 = COLORS.textWhite setTitle.TextSize = 15
    setTitle.Font = Enum.Font.GothamBold setTitle.TextXAlignment = Enum.TextXAlignment.Left
    setTitle.ZIndex = 61 setTitle.Parent = SettingsFrame

    local setClose = Instance.new("TextButton")
    setClose.Size = UDim2.new(0, 26, 0, 26) setClose.Position = UDim2.new(1, -34, 0, 8)
    setClose.BackgroundColor3 = COLORS.red setClose.BorderSizePixel = 0
    setClose.Text = "X" setClose.TextColor3 = COLORS.textWhite
    setClose.TextSize = 12 setClose.Font = Enum.Font.GothamBold
    setClose.AutoButtonColor = false setClose.ZIndex = 61 setClose.Parent = SettingsFrame
    addCorner(setClose, 6)

    local setScroll = Instance.new("ScrollingFrame")
    setScroll.Size = UDim2.new(1, -16, 1, -50) setScroll.Position = UDim2.new(0, 8, 0, 44)
    setScroll.BackgroundTransparency = 1 setScroll.BorderSizePixel = 0
    setScroll.ScrollBarThickness = 3 setScroll.ScrollBarImageColor3 = COLORS.accent
    setScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    setScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    setScroll.ZIndex = 61 setScroll.Parent = SettingsFrame
    local setLayout = Instance.new("UIListLayout")
    setLayout.Padding = UDim.new(0, 4) setLayout.SortOrder = Enum.SortOrder.LayoutOrder
    setLayout.Parent = setScroll

    makeDraggable(SettingsFrame, setTitle)

    -- ============================================================
    -- SETTINGS HELPERS
    -- ============================================================
    local setOrder = 0
    local function setNext() setOrder = setOrder + 1 return setOrder end

    local function setSeparator(text)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 24) f.BackgroundTransparency = 1
        f.LayoutOrder = setNext() f.ZIndex = 61 f.Parent = setScroll
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, 0, 1, 0) l.BackgroundTransparency = 1
        l.Text = "  " .. text l.TextColor3 = COLORS.accent
        l.TextSize = 11 l.Font = Enum.Font.GothamBold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 61 l.Parent = f
        return f
    end

    local function setDropdown(text, options, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 44) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = setNext() f.ZIndex = 61 f.ClipsDescendants = false
        f.Parent = setScroll
        addCorner(f, 6)

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 130, 0, 16) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text l.TextColor3 = COLORS.textWhite
        l.TextSize = 10 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 62 l.Parent = f

        local selected = default or options[1]
        local dbtn = Instance.new("TextButton")
        dbtn.Size = UDim2.new(1, -16, 0, 20) dbtn.Position = UDim2.new(0, 8, 0, 21)
        dbtn.BackgroundColor3 = COLORS.inputBg dbtn.BorderSizePixel = 0
        dbtn.Text = "  " .. selected dbtn.TextColor3 = COLORS.textWhite
        dbtn.TextSize = 10 dbtn.Font = Enum.Font.Gotham
        dbtn.TextXAlignment = Enum.TextXAlignment.Left dbtn.AutoButtonColor = false
        dbtn.ZIndex = 62 dbtn.Parent = f
        addCorner(dbtn, 4)

        local dlist = Instance.new("Frame")
        dlist.Size = UDim2.new(1, -16, 0, 0) dlist.Position = UDim2.new(0, 8, 0, 43)
        dlist.BackgroundColor3 = COLORS.titleBar dlist.BorderSizePixel = 0
        dlist.Visible = false dlist.ZIndex = 70 dlist.ClipsDescendants = true
        dlist.Parent = f
        addCorner(dlist, 4)

        local dScrollF = Instance.new("ScrollingFrame")
        dScrollF.Size = UDim2.new(1, 0, 1, 0) dScrollF.BackgroundTransparency = 1
        dScrollF.BorderSizePixel = 0 dScrollF.ScrollBarThickness = 2
        dScrollF.ScrollBarImageColor3 = COLORS.accent
        dScrollF.CanvasSize = UDim2.new(0, 0, 0, #options * 22)
        dScrollF.ZIndex = 71 dScrollF.Parent = dlist
        local dl = Instance.new("UIListLayout") dl.SortOrder = Enum.SortOrder.LayoutOrder dl.Parent = dScrollF

        local isOpen = false
        for i, opt in ipairs(options) do
            local ob = Instance.new("TextButton")
            ob.Size = UDim2.new(1, 0, 0, 22) ob.BackgroundColor3 = COLORS.titleBar
            ob.BorderSizePixel = 0 ob.Text = "  " .. opt ob.TextColor3 = COLORS.textGray
            ob.TextSize = 10 ob.Font = Enum.Font.Gotham
            ob.TextXAlignment = Enum.TextXAlignment.Left ob.ZIndex = 72
            ob.LayoutOrder = i ob.AutoButtonColor = false ob.Parent = dScrollF
            ob.MouseEnter:Connect(function() ob.BackgroundColor3 = COLORS.tabActive ob.TextColor3 = COLORS.textWhite end)
            ob.MouseLeave:Connect(function() ob.BackgroundColor3 = COLORS.titleBar ob.TextColor3 = COLORS.textGray end)
            ob.MouseButton1Click:Connect(function()
                selected = opt dbtn.Text = "  " .. opt
                isOpen = false dlist.Visible = false
                tween(f, {Size = UDim2.new(1, -8, 0, 44)}, 0.2)
                tween(dlist, {Size = UDim2.new(1, -16, 0, 0)}, 0.2)
                if callback then pcall(callback, opt) end
            end)
        end

        dbtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                local maxH = math.min(#options * 22, 110)
                dlist.Visible = true
                tween(f, {Size = UDim2.new(1, -8, 0, 44 + maxH + 4)}, 0.2)
                tween(dlist, {Size = UDim2.new(1, -16, 0, maxH)}, 0.2)
            else
                tween(f, {Size = UDim2.new(1, -8, 0, 44)}, 0.2)
                tween(dlist, {Size = UDim2.new(1, -16, 0, 0)}, 0.2)
                task.delay(0.25, function() if not isOpen then dlist.Visible = false end end)
            end
        end)
        return f
    end

    local function setSlider(text, min, max, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 44) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = setNext() f.ZIndex = 61 f.Parent = setScroll
        addCorner(f, 6)

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 130, 0, 16) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text l.TextColor3 = COLORS.textWhite
        l.TextSize = 10 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 62 l.Parent = f

        local vl = Instance.new("TextLabel")
        vl.Size = UDim2.new(0, 40, 0, 16) vl.Position = UDim2.new(1, -48, 0, 3)
        vl.BackgroundTransparency = 1 vl.Text = tostring(default) vl.TextColor3 = COLORS.accent
        vl.TextSize = 10 vl.Font = Enum.Font.GothamBold
        vl.TextXAlignment = Enum.TextXAlignment.Right vl.ZIndex = 62 vl.Parent = f

        local track = Instance.new("TextButton")
        track.Size = UDim2.new(1, -16, 0, 6) track.Position = UDim2.new(0, 8, 0, 28)
        track.BackgroundColor3 = COLORS.inputBg track.BorderSizePixel = 0
        track.Text = "" track.AutoButtonColor = false track.ZIndex = 62 track.Parent = f
        addCorner(track, 3)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        fill.BackgroundColor3 = COLORS.accent fill.BorderSizePixel = 0
        fill.ZIndex = 63 fill.Parent = track
        addCorner(fill, 3)

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.Position = UDim2.new((default - min) / (max - min), -6, 0.5, -6)
        knob.BackgroundColor3 = COLORS.textWhite knob.BorderSizePixel = 0
        knob.ZIndex = 64 knob.Parent = track
        addCorner(knob, 6)

        track.MouseButton1Down:Connect(function()
            isSliderDragging = true
            curTrack = track curFill = fill curKnob = knob curVL = vl
            curMin = min curMax = max curCB = callback
            local mouse = LocalPlayer:GetMouse()
            local tx = track.AbsolutePosition.X
            local tw = track.AbsoluteSize.X
            if tw > 0 then
                local ratio = math.clamp((mouse.X - tx) / tw, 0, 1)
                local val = math.floor(min + ratio * (max - min))
                fill.Size = UDim2.new(ratio, 0, 1, 0)
                knob.Position = UDim2.new(ratio, -6, 0.5, -6)
                vl.Text = tostring(val)
                if callback then pcall(callback, val) end
            end
        end)
        return f
    end

    local function setButton(text, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 36) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = setNext() f.ZIndex = 61 f.Parent = setScroll
        addCorner(f, 6)

        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -16, 0, 26) btn.Position = UDim2.new(0, 8, 0.5, -13)
        btn.BackgroundColor3 = COLORS.accent btn.BorderSizePixel = 0
        btn.Text = text btn.TextColor3 = COLORS.textWhite
        btn.TextSize = 11 btn.Font = Enum.Font.GothamBold btn.AutoButtonColor = false
        btn.ZIndex = 62 btn.Parent = f
        addCorner(btn, 5)
        btn.MouseEnter:Connect(function() tween(btn, {BackgroundTransparency = 0.15}, 0.15) end)
        btn.MouseLeave:Connect(function() tween(btn, {BackgroundTransparency = 0}, 0.15) end)
        btn.MouseButton1Click:Connect(function() if callback then pcall(callback) end end)
        return f
    end

    local function setToggle(text, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 34) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = setNext() f.ZIndex = 61 f.Parent = setScroll
        addCorner(f, 6)

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 180, 0, 34) l.Position = UDim2.new(0, 8, 0, 0)
        l.BackgroundTransparency = 1 l.Text = text l.TextColor3 = COLORS.textWhite
        l.TextSize = 11 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 62 l.Parent = f

        local tbg = Instance.new("TextButton")
        tbg.Size = UDim2.new(0, 38, 0, 18) tbg.Position = UDim2.new(1, -46, 0.5, -9)
        tbg.BackgroundColor3 = default and COLORS.green or COLORS.inputBg
        tbg.BorderSizePixel = 0 tbg.Text = "" tbg.AutoButtonColor = false
        tbg.ZIndex = 62 tbg.Parent = f
        addCorner(tbg, 9)

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.Position = default and UDim2.new(0, 23, 0, 3) or UDim2.new(0, 3, 0, 3)
        knob.BackgroundColor3 = COLORS.textWhite knob.BorderSizePixel = 0
        knob.ZIndex = 63 knob.Parent = tbg
        addCorner(knob, 6)

        local state = default or false
        tbg.MouseButton1Click:Connect(function()
            state = not state
            if state then
                tween(tbg, {BackgroundColor3 = COLORS.green}, 0.2)
                tween(knob, {Position = UDim2.new(0, 23, 0, 3)}, 0.2)
            else
                tween(tbg, {BackgroundColor3 = COLORS.inputBg}, 0.2)
                tween(knob, {Position = UDim2.new(0, 3, 0, 3)}, 0.2)
            end
            if callback then pcall(callback, state) end
        end)
        return f
    end

    -- ============================================================
    -- SETTINGS DROPDOWN WITH SEARCH
    -- ============================================================
    local function setDropdownWithSearch(text, options, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 44) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = setNext() f.ZIndex = 61 f.ClipsDescendants = false
        f.Parent = setScroll
        addCorner(f, 6)

        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 130, 0, 16) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text l.TextColor3 = COLORS.textWhite
        l.TextSize = 10 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 62 l.Parent = f

        local selected = default or options[1]
        local dbtn = Instance.new("TextButton")
        dbtn.Size = UDim2.new(1, -16, 0, 20) dbtn.Position = UDim2.new(0, 8, 0, 21)
        dbtn.BackgroundColor3 = COLORS.inputBg dbtn.BorderSizePixel = 0
        dbtn.Text = "  " .. selected dbtn.TextColor3 = COLORS.textWhite
        dbtn.TextSize = 10 dbtn.Font = Enum.Font.Gotham
        dbtn.TextXAlignment = Enum.TextXAlignment.Left dbtn.AutoButtonColor = false
        dbtn.ZIndex = 62 dbtn.Parent = f
        addCorner(dbtn, 4)

        local searchBox = Instance.new("TextBox")
        searchBox.Size = UDim2.new(1, -16, 0, 20) searchBox.Position = UDim2.new(0, 8, 0, 43)
        searchBox.BackgroundColor3 = COLORS.inputBg searchBox.BackgroundTransparency = 0.3
        searchBox.BorderSizePixel = 0 searchBox.PlaceholderText = "Search..."
        searchBox.PlaceholderColor3 = COLORS.textGray searchBox.Text = ""
        searchBox.TextColor3 = COLORS.textWhite searchBox.TextSize = 10
        searchBox.Font = Enum.Font.Gotham searchBox.ClearTextOnFocus = true
        searchBox.Visible = false searchBox.ZIndex = 70 searchBox.Parent = f
        addCorner(searchBox, 4)

        local dlist = Instance.new("Frame")
        dlist.Size = UDim2.new(1, -16, 0, 0) dlist.Position = UDim2.new(0, 8, 0, 65)
        dlist.BackgroundColor3 = COLORS.titleBar dlist.BorderSizePixel = 0
        dlist.Visible = false dlist.ZIndex = 70 dlist.ClipsDescendants = true
        dlist.Parent = f
        addCorner(dlist, 4)

        local dScrollF = Instance.new("ScrollingFrame")
        dScrollF.Size = UDim2.new(1, 0, 1, 0) dScrollF.BackgroundTransparency = 1
        dScrollF.BorderSizePixel = 0 dScrollF.ScrollBarThickness = 2
        dScrollF.ScrollBarImageColor3 = COLORS.accent
        dScrollF.CanvasSize = UDim2.new(0, 0, 0, #options * 22)
        dScrollF.ZIndex = 71 dScrollF.Parent = dlist
        local dl = Instance.new("UIListLayout") dl.SortOrder = Enum.SortOrder.LayoutOrder dl.Parent = dScrollF

        local isOpen = false
        local currentOptions = options

        local function rebuildList(filter)
            for _, c in ipairs(dScrollF:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
            local filtered = {}
            if filter and filter ~= "" then
                local q = filter:lower()
                for _, opt in ipairs(options) do
                    if opt:lower():find(q, 1, true) then table.insert(filtered, opt) end
                end
            else
                filtered = options
            end
            dScrollF.CanvasSize = UDim2.new(0, 0, 0, #filtered * 22)
            for i, opt in ipairs(filtered) do
                local ob = Instance.new("TextButton")
                ob.Size = UDim2.new(1, 0, 0, 22) ob.BackgroundColor3 = COLORS.titleBar
                ob.BorderSizePixel = 0 ob.Text = "  " .. opt ob.TextColor3 = COLORS.textGray
                ob.TextSize = 10 ob.Font = Enum.Font.Gotham
                ob.TextXAlignment = Enum.TextXAlignment.Left ob.ZIndex = 72
                ob.LayoutOrder = i ob.AutoButtonColor = false ob.Parent = dScrollF
                ob.MouseEnter:Connect(function() ob.BackgroundColor3 = COLORS.tabActive ob.TextColor3 = COLORS.textWhite end)
                ob.MouseLeave:Connect(function() ob.BackgroundColor3 = COLORS.titleBar ob.TextColor3 = COLORS.textGray end)
                ob.MouseButton1Click:Connect(function()
                    selected = opt dbtn.Text = "  " .. opt
                    isOpen = false searchBox.Visible = false dlist.Visible = false
                    tween(f, {Size = UDim2.new(1, -8, 0, 44)}, 0.2)
                    tween(dlist, {Size = UDim2.new(1, -16, 0, 0)}, 0.2)
                    if callback then pcall(callback, opt) end
                end)
            end
        end

        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            rebuildList(searchBox.Text)
        end)

        dbtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                local maxH = math.min(#options * 22, 120)
                searchBox.Visible = true
                dlist.Visible = true
                searchBox.Text = ""
                rebuildList("")
                tween(f, {Size = UDim2.new(1, -8, 0, 44 + 24 + maxH + 4)}, 0.2)
                tween(dlist, {Size = UDim2.new(1, -16, 0, maxH)}, 0.2)
                task.delay(0.1, function() if isOpen then searchBox:CaptureFocus() end end)
            else
                searchBox.Visible = false
                tween(f, {Size = UDim2.new(1, -8, 0, 44)}, 0.2)
                tween(dlist, {Size = UDim2.new(1, -16, 0, 0)}, 0.2)
                task.delay(0.25, function() if not isOpen then dlist.Visible = false end end)
            end
        end)
        return f
    end

    -- ============================================================
    -- SETTINGS CONTENT
    -- ============================================================
    local function applyBorderColor(colorName)
        local colorMap = {
            ["Blue"] = Color3.fromRGB(70, 130, 255),
            ["Red"] = Color3.fromRGB(220, 60, 60),
            ["Green"] = Color3.fromRGB(60, 200, 120),
            ["Purple"] = Color3.fromRGB(150, 70, 220),
            ["Gold"] = Color3.fromRGB(255, 200, 50),
            ["White"] = Color3.fromRGB(240, 240, 255),
            ["Pink"] = Color3.fromRGB(255, 100, 180),
            ["Cyan"] = Color3.fromRGB(50, 220, 220),
        }
        local c = colorMap[colorName] or COLORS.accent
        for _, obj in ipairs(ScreenGui:GetDescendants()) do
            if obj:IsA("UIStroke") and obj.Thickness >= 2 then
                tween(obj, {Color = c}, 0.3)
            end
        end
    end

    local function applyFontSize(size)
        for _, obj in ipairs(MainFrame:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                if obj.ZIndex >= 3 then
                    obj.TextSize = size
                end
            end
        end
    end

    local function getAnimationId(category, name)
        if ANIMATIONS[category] and ANIMATIONS[category][name] then
            return ANIMATIONS[category][name]
        end
        return nil
    end

    setOrder = 0
    setSeparator("Appearance")
    setDropdown("Border Color", {"Blue", "Red", "Green", "Purple", "Gold", "White", "Pink", "Cyan"}, "Blue", applyBorderColor)
    setSlider("Font Size", 8, 20, 11, applyFontSize)

    setSeparator("Server")
    setButton("Rejoin Server", function()
        pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
    end)
    setButton("Server Hop", function()
        pcall(function()
            local servers = {}
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local res = HttpService:JSONDecode(game:HttpGet(url))
            if res and res.data then
                for _, s in ipairs(res.data) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then
                        table.insert(servers, s.id)
                    end
                end
            end
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], LocalPlayer)
            end
        end)
    end)

    setSeparator("Animations")
    for _, category in ipairs(ANIMATION_CATEGORIES) do
        local anims = {}
        for name, id in pairs(ANIMATIONS[category] or {}) do
            table.insert(anims, name)
        end
        table.sort(anims)
        setDropdownWithSearch(category, anims, anims[1] or "", function(selected)
            local id = getAnimationId(category, selected)
            print("[ANIMATION] " .. category .. " -> " .. selected .. " (ID: " .. (id or "nil") .. ")")
        end)
    end

    setSeparator("Other")
    setButton("Small Server", function()
        pcall(function()
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local res = HttpService:JSONDecode(game:HttpGet(url))
            if res and res.data then
                local best = nil
                for _, s in ipairs(res.data) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then
                        if not best or s.playing < best.playing then
                            best = s
                        end
                    end
                end
                if best then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, best.id, LocalPlayer)
                end
            end
        end)
    end)

    -- ============================================================
    -- SETTINGS OPEN/CLOSE
    -- ============================================================
    settingsBtn.MouseButton1Click:Connect(function()
        SettingsFrame.Visible = not SettingsFrame.Visible
        if SettingsFrame.Visible then
            SettingsFrame.BackgroundTransparency = 1
            tween(SettingsFrame, {BackgroundTransparency = 0}, 0.25)
        end
    end)

    setClose.MouseButton1Click:Connect(function()
        tween(SettingsFrame, {BackgroundTransparency = 1}, 0.2)
        task.delay(0.22, function() SettingsFrame.Visible = false end)
    end)

    -- ============================================================
    -- BUTTON EVENTS
    -- ============================================================
    closeBtn.MouseButton1Click:Connect(function()
        showConfirm(function() 
            Noclip:Destroy()
        end)
    end)

    minimizeBtn.MouseButton1Click:Connect(function()
        fadeOut(MainFrame, 0.2, function()
            if MinFrame then
                MinFrame.Visible = true
                MinFrame.BackgroundTransparency = 0
                -- Reset position if outside screen
                if MinFrame.Position.X.Offset < -100 or MinFrame.Position.Y.Offset < -100 then
                    MinFrame.Position = UDim2.new(1, -70, 0, 20)
                end
            end
        end)
    end)

    -- ============================================================
    -- VERIFY BUTTON
    -- ============================================================
    verifyBtn.MouseButton1Click:Connect(function()
        local inputKey = keyInput.Text
        if inputKey == VALID_KEY then
            keyStatus.Text = "✓ Valid!"
            keyStatus.TextColor3 = COLORS.green
            keyInput.BackgroundColor3 = COLORS.inputBg
            fadeOut(KeyFrame, 0.25, function()
                if MainFrame then
                    MainFrame.Visible = true
                    MainFrame.BackgroundTransparency = 0
                    fadeIn(MainFrame, 0.3)
                    loadTestTab()
                end
            end)
        else
            keyStatus.Text = "Invalid Key!"
            keyStatus.TextColor3 = COLORS.red
            keyInput.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
            task.delay(1.5, function()
                keyStatus.Text = ""
                keyInput.Text = ""
                keyInput.BackgroundColor3 = COLORS.inputBg
            end)
        end
    end)

    -- ============================================================
    -- DISCORD BUTTON
    -- ============================================================
    discordBtn.MouseButton1Click:Connect(function()
        copyToClipboard(DISCORD_LINK)
        discordBtn.Text = "Copied!"
        task.delay(1.5, function() discordBtn.Text = "Join Discord" end)
    end)

    -- ============================================================
    -- SEARCH INLINE
    -- ============================================================
    local searchBar = Instance.new("Frame")
    searchBar.Size = UDim2.new(0, 0, 0, 28) searchBar.Position = UDim2.new(1, -100, 0, 8)
    searchBar.BackgroundColor3 = COLORS.inputBg searchBar.BorderSizePixel = 0
    searchBar.Visible = false searchBar.ZIndex = 5 searchBar.Parent = titleBar
    addCorner(searchBar, 6)
    local searchTextBox = Instance.new("TextBox")
    searchTextBox.Size = UDim2.new(1, -8, 1, -4) searchTextBox.Position = UDim2.new(0, 4, 0, 2)
    searchTextBox.BackgroundTransparency = 1 searchTextBox.PlaceholderText = "Search..."
    searchTextBox.PlaceholderColor3 = COLORS.textGray searchTextBox.Text = ""
    searchTextBox.TextColor3 = COLORS.textWhite searchTextBox.TextSize = 12
    searchTextBox.Font = Enum.Font.Gotham searchTextBox.ClearTextOnFocus = true
    searchTextBox.ZIndex = 6 searchTextBox.Parent = searchBar

    local searchOpen = false
    local function toggleSearch()
        searchOpen = not searchOpen
        if searchOpen then
            searchBar.Visible = true
            searchBar.Position = UDim2.new(1, -100, 0, 8)
            searchBar.Size = UDim2.new(0, 0, 0, 28)
            tween(searchBar, {Size = UDim2.new(0, 160, 0, 28), Position = UDim2.new(1, -264, 0, 8)}, 0.25)
            task.delay(0.26, function() if searchOpen then searchTextBox:CaptureFocus() end end)
        else
            tween(searchBar, {Size = UDim2.new(0, 0, 0, 28), Position = UDim2.new(1, -100, 0, 8)}, 0.2)
            task.delay(0.22, function() if not searchOpen then searchBar.Visible = false searchTextBox.Text = "" clearSuggestions() end end)
        end
    end
    searchBtn.MouseButton1Click:Connect(function() toggleSearch() end)

    local suggestFrame = Instance.new("Frame")
    suggestFrame.Size = UDim2.new(0, 200, 0, 0) suggestFrame.Position = UDim2.new(1, -210, 0, 48)
    suggestFrame.BackgroundColor3 = COLORS.titleBar suggestFrame.BorderSizePixel = 0
    suggestFrame.Visible = false suggestFrame.ZIndex = 30 suggestFrame.Parent = MainFrame
    addCorner(suggestFrame, 8)
    local sfStroke = Instance.new("UIStroke", suggestFrame) sfStroke.Color = COLORS.border sfStroke.Thickness = 1
    local suggestLayout = Instance.new("UIListLayout")
    suggestLayout.SortOrder = Enum.SortOrder.LayoutOrder suggestLayout.Padding = UDim.new(0, 1)
    suggestLayout.Parent = suggestFrame

    local allFeatures = {
        "Load Module", "Reset UI", "Export Config",
        "Show Debug Info", "Compact Mode", "UI Scale",
        "Refresh Rate", "Render Mode",
        "Module URL", "Import Module", "Run Module",
        "Module 1", "Module 2", "Module 3",
        "Dark Mode", "Show Avatar", "Show Username", "Opacity",
        "Open UI Key", "Reload Key", "Save Keybinds", "Discord", "GitHub",
    }

    function clearSuggestions()
        for _, c in ipairs(suggestFrame:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        suggestFrame.Visible = false suggestFrame.Size = UDim2.new(0, 200, 0, 0)
    end

    local function updateSuggestions(query)
        for _, c in ipairs(suggestFrame:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        if query == "" then suggestFrame.Visible = false suggestFrame.Size = UDim2.new(0, 200, 0, 0) return end
        local matches = {}
        local q = query:lower()
        for _, feat in ipairs(allFeatures) do if feat:lower():find(q, 1, true) then table.insert(matches, feat) end end
        if #matches == 0 then suggestFrame.Visible = false suggestFrame.Size = UDim2.new(0, 200, 0, 0) return end
        local count = math.min(#matches, 6)
        suggestFrame.Visible = true suggestFrame.Size = UDim2.new(0, 200, 0, count * 26 + 4)
        for i = 1, count do
            local sb = Instance.new("TextButton")
            sb.Size = UDim2.new(1, -4, 0, 24) sb.BackgroundColor3 = COLORS.titleBar
            sb.BorderSizePixel = 0 sb.Text = "  " .. matches[i]
            sb.TextColor3 = COLORS.textGray sb.TextSize = 11 sb.Font = Enum.Font.Gotham
            sb.TextXAlignment = Enum.TextXAlignment.Left sb.ZIndex = 31 sb.LayoutOrder = i
            sb.AutoButtonColor = false sb.Parent = suggestFrame
            addCorner(sb, 4)
            sb.MouseEnter:Connect(function() sb.BackgroundColor3 = COLORS.tabActive sb.TextColor3 = COLORS.textWhite end)
            sb.MouseLeave:Connect(function() sb.BackgroundColor3 = COLORS.titleBar sb.TextColor3 = COLORS.textGray end)
            sb.MouseButton1Click:Connect(function() searchTextBox.Text = matches[i] clearSuggestions() end)
        end
    end
    searchTextBox:GetPropertyChangedSignal("Text"):Connect(function() updateSuggestions(searchTextBox.Text) end)

    -- ============================================================
    -- DRAG + RESIZE
    -- ============================================================
    makeDraggable(MainFrame, titleBar)
    makeDraggable(KeyFrame, keyTitleBar)
    makeResizable(MainFrame, resizeHandle, Vector2.new(350, 300))

    -- ============================================================
    -- SLIDER GLOBAL
    -- ============================================================
    local isSliderDragging = false
    local curTrack, curFill, curKnob, curVL, curMin, curMax, curCB

    RunService.RenderStepped:Connect(function()
        if not isSliderDragging then return end
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            isSliderDragging = false return
        end
        if not curTrack then return end
        local mouse = LocalPlayer:GetMouse()
        local tx = curTrack.AbsolutePosition.X
        local tw = curTrack.AbsoluteSize.X
        if tw <= 0 then return end
        local ratio = math.clamp((mouse.X - tx) / tw, 0, 1)
        local val = math.floor(curMin + ratio * (curMax - curMin))
        curFill.Size = UDim2.new(ratio, 0, 1, 0)
        curKnob.Position = UDim2.new(ratio, -6, 0.5, -6)
        curVL.Text = tostring(val)
        if curCB then pcall(curCB, val) end
    end)

    -- ============================================================
    -- TAB HELPERS
    -- ============================================================
    local layoutOrder = 0
    local function nextOrder() layoutOrder = layoutOrder + 1 return layoutOrder end

    local function createSeparator(text)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 26) f.BackgroundTransparency = 1
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, 0, 0, 26) l.BackgroundTransparency = 1
        l.Text = "  " .. (text or "") l.TextColor3 = COLORS.accent
        l.TextSize = 11 l.Font = Enum.Font.GothamBold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 3 l.Parent = f
        return f
    end

    local function createButton(text, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 40) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        addCorner(f, 6)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 130, 0, 40) l.Position = UDim2.new(0, 8, 0, 0)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = COLORS.textWhite
        l.TextSize = 11 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 4 l.Parent = f
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 120, 0, 28) btn.Position = UDim2.new(1, -128, 0.5, -14)
        btn.BackgroundColor3 = COLORS.accent btn.BorderSizePixel = 0
        btn.Text = text or "" btn.TextColor3 = COLORS.textWhite
        btn.TextSize = 10 btn.Font = Enum.Font.GothamBold btn.AutoButtonColor = false
        btn.ZIndex = 4 btn.Parent = f
        addCorner(btn, 6)
        btn.MouseEnter:Connect(function() tween(btn, {BackgroundTransparency = 0.15}, 0.15) end)
        btn.MouseLeave:Connect(function() tween(btn, {BackgroundTransparency = 0}, 0.15) end)
        btn.MouseButton1Click:Connect(function() if callback then pcall(callback) end end)
        return f
    end

    local function createToggle(text, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 36) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        addCorner(f, 6)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 180, 0, 36) l.Position = UDim2.new(0, 8, 0, 0)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = COLORS.textWhite
        l.TextSize = 11 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 4 l.Parent = f
        local tbg = Instance.new("TextButton")
        tbg.Size = UDim2.new(0, 40, 0, 20) tbg.Position = UDim2.new(1, -50, 0.5, -10)
        tbg.BackgroundColor3 = default and COLORS.green or COLORS.inputBg
        tbg.BorderSizePixel = 0 tbg.Text = "" tbg.AutoButtonColor = false
        tbg.ZIndex = 4 tbg.Parent = f
        addCorner(tbg, 10)
        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 14, 0, 14)
        knob.Position = default and UDim2.new(0, 23, 0, 3) or UDim2.new(0, 3, 0, 3)
        knob.BackgroundColor3 = COLORS.textWhite knob.BorderSizePixel = 0
        knob.ZIndex = 5 knob.Parent = tbg
        addCorner(knob, 7)
        local state = default or false
        tbg.MouseButton1Click:Connect(function()
            state = not state
            if state then
                tween(tbg, {BackgroundColor3 = COLORS.green}, 0.2)
                tween(knob, {Position = UDim2.new(0, 23, 0, 3)}, 0.2)
            else
                tween(tbg, {BackgroundColor3 = COLORS.inputBg}, 0.2)
                tween(knob, {Position = UDim2.new(0, 3, 0, 3)}, 0.2)
            end
            if callback then pcall(callback, state) end
        end)
        return f
    end

    local function createSlider(text, min, max, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 46) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        addCorner(f, 6)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 150, 0, 18) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = COLORS.textWhite
        l.TextSize = 11 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 4 l.Parent = f
        local vl = Instance.new("TextLabel")
        vl.Size = UDim2.new(0, 45, 0, 18) vl.Position = UDim2.new(1, -52, 0, 3)
        vl.BackgroundTransparency = 1 vl.Text = tostring(default) vl.TextColor3 = COLORS.accent
        vl.TextSize = 11 vl.Font = Enum.Font.GothamBold
        vl.TextXAlignment = Enum.TextXAlignment.Right vl.ZIndex = 4 vl.Parent = f
        local track = Instance.new("TextButton")
        track.Size = UDim2.new(1, -20, 0, 6) track.Position = UDim2.new(0, 10, 0, 30)
        track.BackgroundColor3 = COLORS.inputBg track.BorderSizePixel = 0
        track.Text = "" track.AutoButtonColor = false track.ZIndex = 4 track.Parent = f
        addCorner(track, 3)
        local fill = Instance.new("Frame")
        local ratio = (default - min) / (max - min)
        fill.Size = UDim2.new(ratio, 0, 1, 0)
        fill.BackgroundColor3 = COLORS.accent fill.BorderSizePixel = 0
        fill.ZIndex = 5 fill.Parent = track
        addCorner(fill, 3)
        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.Position = UDim2.new(ratio, -6, 0.5, -6)
        knob.BackgroundColor3 = COLORS.textWhite knob.BorderSizePixel = 0
        knob.ZIndex = 6 knob.Parent = track
        addCorner(knob, 6)
        track.MouseButton1Down:Connect(function()
            isSliderDragging = true
            curTrack = track curFill = fill curKnob = knob curVL = vl
            curMin = min curMax = max curCB = callback
            local mouse = LocalPlayer:GetMouse()
            local tx = track.AbsolutePosition.X
            local tw = track.AbsoluteSize.X
            if tw > 0 then
                local r = math.clamp((mouse.X - tx) / tw, 0, 1)
                local val = math.floor(min + r * (max - min))
                fill.Size = UDim2.new(r, 0, 1, 0)
                knob.Position = UDim2.new(r, -6, 0.5, -6)
                vl.Text = tostring(val)
                if callback then pcall(callback, val) end
            end
        end)
        return f
    end

    local function createInput(text, placeholder, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 46) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        addCorner(f, 6)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 150, 0, 16) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = COLORS.textWhite
        l.TextSize = 10 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 4 l.Parent = f
        local inp = Instance.new("TextBox")
        inp.Size = UDim2.new(1, -20, 0, 22) inp.Position = UDim2.new(0, 10, 0, 21)
        inp.BackgroundColor3 = COLORS.inputBg inp.BackgroundTransparency = 0.2
        inp.BorderSizePixel = 0 inp.PlaceholderText = placeholder or ""
        inp.PlaceholderColor3 = COLORS.textGray inp.Text = ""
        inp.TextColor3 = COLORS.textWhite inp.TextSize = 11
        inp.Font = Enum.Font.Gotham inp.ClearTextOnFocus = false
        inp.ZIndex = 4 inp.Parent = f
        addCorner(inp, 5)
        inp.FocusLost:Connect(function(ep) if callback then pcall(callback, inp.Text, ep) end end)
        return f
    end

    local function createDropdown(text, options, default, callback)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 46) f.BackgroundColor3 = COLORS.bg
        f.BackgroundTransparency = 0.3 f.BorderSizePixel = 0
        f.LayoutOrder = nextOrder() f.ClipsDescendants = false
        f.ZIndex = 3 f.Parent = scrollFrame
        addCorner(f, 6)
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(0, 150, 0, 16) l.Position = UDim2.new(0, 8, 0, 3)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = COLORS.textWhite
        l.TextSize = 10 l.Font = Enum.Font.GothamSemibold
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 4 l.Parent = f
        local selected = default or (options and options[1]) or ""
        local dbtn = Instance.new("TextButton")
        dbtn.Size = UDim2.new(1, -20, 0, 22) dbtn.Position = UDim2.new(0, 10, 0, 21)
        dbtn.BackgroundColor3 = COLORS.inputBg dbtn.BorderSizePixel = 0
        dbtn.Text = "  " .. selected dbtn.TextColor3 = COLORS.textWhite
        dbtn.TextSize = 11 dbtn.Font = Enum.Font.Gotham
        dbtn.TextXAlignment = Enum.TextXAlignment.Left dbtn.AutoButtonColor = false
        dbtn.ZIndex = 4 dbtn.Parent = f
        addCorner(dbtn, 5)
        local dlistOuter = Instance.new("Frame")
        dlistOuter.Size = UDim2.new(1, -20, 0, 0) dlistOuter.Position = UDim2.new(0, 10, 0, 45)
        dlistOuter.BackgroundColor3 = COLORS.titleBar dlistOuter.BorderSizePixel = 0
        dlistOuter.Visible = false dlistOuter.ZIndex = 10 dlistOuter.ClipsDescendants = true
        dlistOuter.Parent = f
        addCorner(dlistOuter, 5)
        local dScroll = Instance.new("ScrollingFrame")
        dScroll.Size = UDim2.new(1, 0, 1, 0) dScroll.BackgroundTransparency = 1
        dScroll.BorderSizePixel = 0 dScroll.ScrollBarThickness = 3
        dScroll.ScrollBarImageColor3 = COLORS.accent
        dScroll.CanvasSize = UDim2.new(0, 0, 0, #(options or {}) * 24)
        dScroll.ZIndex = 11 dScroll.Parent = dlistOuter
        local dll = Instance.new("UIListLayout") dll.SortOrder = Enum.SortOrder.LayoutOrder dll.Parent = dScroll
        local isOpen = false
        for i, opt in ipairs(options or {}) do
            local ob = Instance.new("TextButton")
            ob.Size = UDim2.new(1, 0, 0, 24) ob.BackgroundColor3 = COLORS.titleBar
            ob.BorderSizePixel = 0 ob.Text = "  " .. opt ob.TextColor3 = COLORS.textGray
            ob.TextSize = 11 ob.Font = Enum.Font.Gotham
            ob.TextXAlignment = Enum.TextXAlignment.Left ob.ZIndex = 12
            ob.LayoutOrder = i ob.AutoButtonColor = false ob.Parent = dScroll
            ob.MouseEnter:Connect(function() ob.BackgroundColor3 = COLORS.tabActive ob.TextColor3 = COLORS.textWhite end)
            ob.MouseLeave:Connect(function() ob.BackgroundColor3 = COLORS.titleBar ob.TextColor3 = COLORS.textGray end)
            ob.MouseButton1Click:Connect(function()
                selected = opt dbtn.Text = "  " .. opt
                isOpen = false dlistOuter.Visible = false
                tween(f, {Size = UDim2.new(1, -8, 0, 46)}, 0.2)
                tween(dlistOuter, {Size = UDim2.new(1, -20, 0, 0)}, 0.2)
                if callback then pcall(callback, opt) end
            end)
        end
        dbtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                local maxH = math.min(#(options or {}) * 24, 120)
                dlistOuter.Visible = true
                tween(f, {Size = UDim2.new(1, -8, 0, 46 + maxH + 4)}, 0.2)
                tween(dlistOuter, {Size = UDim2.new(1, -20, 0, maxH)}, 0.2)
            else
                tween(f, {Size = UDim2.new(1, -8, 0, 46)}, 0.2)
                tween(dlistOuter, {Size = UDim2.new(1, -20, 0, 0)}, 0.2)
                task.delay(0.25, function() if not isOpen then dlistOuter.Visible = false end end)
            end
        end)
        return f
    end

    local function createLabel(text, color)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(1, -8, 0, 26) f.BackgroundTransparency = 1
        f.LayoutOrder = nextOrder() f.ZIndex = 3 f.Parent = scrollFrame
        local l = Instance.new("TextLabel")
        l.Size = UDim2.new(1, -8, 0, 26) l.Position = UDim2.new(0, 8, 0, 0)
        l.BackgroundTransparency = 1 l.Text = text or "" l.TextColor3 = color or COLORS.textGray
        l.TextSize = 11 l.Font = Enum.Font.Gotham
        l.TextXAlignment = Enum.TextXAlignment.Left l.ZIndex = 3 l.Parent = f
        return f
    end

    -- ============================================================
    -- LOAD TAB "test"
    -- ============================================================
    local function loadTestTab()
        layoutOrder = 0
        for _, c in ipairs(scrollFrame:GetChildren()) do
            if c:IsA("Frame") then c:Destroy() end
        end
        
        createSeparator("=== TEST ALL HELPERS ===")
        createLabel("📌 Button Helper")
        createButton("Test Button", function() print("[TEST] Button clicked!") end)
        
        createSeparator("")
        createLabel("📌 Toggle Helper")
        createToggle("Enable Feature", false, function(v) print("[TEST] Toggle:", v) end)
        
        createSeparator("")
        createLabel("📌 Slider Helper")
        createSlider("Volume", 0, 100, 50, function(v) print("[TEST] Slider:", v) end)
        
        createSeparator("")
        createLabel("📌 Input Helper")
        createInput("Username", "Enter name...", function(t) print("[TEST] Input:", t) end)
        
        createSeparator("")
        createLabel("📌 Dropdown Helper")
        createDropdown("Select Option", {"Option 1", "Option 2", "Option 3", "Option 4"}, "Option 1", function(v) print("[TEST] Dropdown:", v) end)
        
        createSeparator("=== END TEST ===")
    end

    testTab.MouseButton1Click:Connect(function()
        loadTestTab()
    end)

    loadTestTab()

    -- ============================================================
    -- SET NOCLIP INSTANCE
    -- ============================================================
    Noclip._instance = ScreenGui
    Noclip._loaded = true

    print("[NOCLIP UI] Loaded successfully!")
    print("[NOCLIP] Version: " .. Noclip.Version)
    print("[NOCLIP] Key: " .. Noclip.Key)
    print("[NOCLIP] Discord: " .. Noclip.Discord)
    print("[NOCLIP] Use Noclip:Load() to show UI")

    return Noclip
end

-- ============================================================
-- PUBLIC METHODS
-- ============================================================
function Noclip:Load()
    if self._loaded and self._instance then
        print("[NOCLIP] Already loaded, showing UI...")
        self._instance.Visible = true
        self._instance.ZIndex = 999
        return self
    end
    
    -- Destroy old UI if exists
    local old = nil
    pcall(function()
        for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
            if gui.Name == "NoclipUI" then old = gui end
        end
        if not old then
            for _, gui in ipairs(LocalPlayer:WaitForChild("PlayerGui", 1):GetChildren()) do
                if gui.Name == "NoclipUI" then old = gui end
            end
        end
    end)
    
    if old then
        pcall(function() old:Destroy() end)
        task.wait(0.3)
    end
    
    return createNoclipUI()
end

function Noclip:Destroy()
    if self._instance then
        pcall(function() self._instance:Destroy() end)
        self._instance = nil
        self._loaded = false
        print("[NOCLIP] UI destroyed")
    end
    return self
end

function Noclip:Toggle()
    if self._loaded and self._instance then
        self._instance.Visible = not self._instance.Visible
        if self._instance.Visible then
            print("[NOCLIP] UI shown")
        else
            print("[NOCLIP] UI hidden")
        end
    else
        self:Load()
    end
    return self
end

function Noclip:GetStatus()
    return {
        Loaded = self._loaded,
        Version = self.Version,
        Instance = self._instance ~= nil
    }
end

-- ============================================================
-- RETURN MODULE
-- ============================================================
return Noclip
