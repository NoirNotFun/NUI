-- ============================================
-- NoirUI - Components Module
-- Version: 3.0
-- ============================================
local Components = {}
local Effects = require(script.Parent.Effects)

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function ResolveIcon(icon)
    if type(icon) == "string" then
        if icon:match("^rbxassetid://") or icon:match("^http") then
            return icon
        end
    end
    return icon
end

-- ============================================
-- 1. ICON BUTTON
-- ============================================
function Components.CreateIconButton(parent, iconName, pos, size, color, iconSize, iconColor, callback, settings)
    settings = settings or {}
    size = size or 36
    iconSize = iconSize or 16
    color = color or Color3.fromRGB(30, 30, 40)
    iconColor = iconColor or Color3.fromRGB(255, 255, 255)
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0, size, 0, size)
    container.Position = pos or UDim2.new(0, 0, 0, 0)
    container.BackgroundTransparency = 1
    container.ZIndex = 2
    container.Name = "IconContainer"
    
    local btn = Instance.new("TextButton", container)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundColor3 = color
    btn.Text = ""
    btn.BackgroundTransparency = 0.2
    btn.AutoButtonColor = false
    btn.ZIndex = 3
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = ACCENT
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(btn, ACCENT, 0.3)
    end
    
    local iconImg
    local resolvedIcon = ResolveIcon(iconName)
    if resolvedIcon then
        iconImg = Instance.new("ImageLabel", btn)
        iconImg.Size = UDim2.new(0, iconSize, 0, iconSize)
        iconImg.Position = UDim2.new(0.5, -iconSize/2, 0.5, -iconSize/2)
        iconImg.BackgroundTransparency = 1
        iconImg.Image = resolvedIcon
        iconImg.ImageColor3 = iconColor
        iconImg.ScaleType = Enum.ScaleType.Fit
        iconImg.ZIndex = 4
    elseif iconName and iconName ~= "" then
        iconImg = Instance.new("TextLabel", btn)
        iconImg.Size = UDim2.new(1, 0, 1, 0)
        iconImg.BackgroundTransparency = 1
        iconImg.Text = iconName
        iconImg.TextColor3 = iconColor
        iconImg.TextTransparency = 0
        iconImg.TextSize = math.min(iconSize + 8, size * 0.6)
        iconImg.Font = Enum.Font.GothamMedium
        iconImg.ZIndex = 4
        iconImg.TextScaled = true
    end
    
    local origColor = color
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(
                math.min(origColor.R * 255 + 40, 255),
                math.min(origColor.G * 255 + 40, 255),
                math.min(origColor.B * 255 + 40, 255)
            ),
            Size = UDim2.new(1.05, 0, 1.05, 0)
        }):Play()
    end)
    
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = origColor,
            Size = UDim2.new(1, 0, 1, 0)
        }):Play()
    end)
    
    btn.MouseButton1Click:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.06), {
            Size = UDim2.new(0.9, 0, 0.9, 0)
        }):Play()
        task.wait(0.06)
        TweenService:Create(btn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 1, 0)
        }):Play()
        
        if settings.UsePop then
            Effects.Pop(container, 1.1)
        end
        if settings.UseConfetti then
            Effects.CreateConfetti(container, 10)
        end
        if callback then callback() end
    end)
    
    return container, btn, iconImg
end

-- ============================================
-- 2. TOGGLE
-- ============================================
function Components.CreateToggle(parent, opt, settings)
    settings = settings or {}
    local hasSubtitle = opt.Subtitle and opt.Subtitle ~= ""
    local s = opt.Default or false
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local t = Instance.new("TextButton", parent)
    t.Size = UDim2.new(0.95, 0, 0, hasSubtitle and 55 or 35)
    t.BackgroundColor3 = settings.ElementBg or Color3.fromRGB(25, 25, 25)
    t.BackgroundTransparency = 0.6
    t.Text = "  " .. opt.Name
    t.TextColor3 = s and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
    t.TextTransparency = 0
    t.TextXAlignment = "Left"
    t.TextSize = 12
    t.Font = "GothamMedium"
    Instance.new("UICorner", t).CornerRadius = UDim.new(0, 8)
    t.LayoutOrder = layoutOrder
    t.Name = opt.Name
    t.AutoButtonColor = false
    
    local bx = Instance.new("Frame", t)
    bx.Size = UDim2.new(0, 30, 0, 16)
    bx.Position = UDim2.new(1, -40, 0.5, hasSubtitle and -15 or -8)
    bx.BackgroundColor3 = s and ACCENT or Color3.fromRGB(40, 40, 40)
    bx.BackgroundTransparency = 0.3
    Instance.new("UICorner", bx).CornerRadius = UDim.new(1, 0)
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(bx, s and ACCENT or Color3.fromRGB(40, 40, 40), 0.3)
    end
    
    t.MouseButton1Click:Connect(function()
        s = not s
        t.TextColor3 = s and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
        TweenService:Create(bx, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            BackgroundColor3 = s and ACCENT or Color3.fromRGB(40, 40, 40)
        }):Play()
        if opt.Callback then opt.Callback(s) end
    end)
    
    return t
end

-- ============================================
-- 3. SLIDER
-- ============================================
function Components.CreateSlider(parent, opt, settings)
    settings = settings or {}
    local hasSubtitle = opt.Subtitle and opt.Subtitle ~= ""
    local range = opt.range or {0, 100}
    local min = range[1]
    local max = range[2]
    local increment = opt.increment or 1
    local defaultValue = opt.Default or min
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(0.95, 0, 0, hasSubtitle and 70 or 50)
    f.BackgroundColor3 = settings.ElementBg or Color3.fromRGB(22, 22, 22)
    f.BackgroundTransparency = 0.7
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    f.LayoutOrder = layoutOrder
    f.Name = opt.Name or ""
    
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, 0, 0, 20)
    l.Position = UDim2.new(0, 12, 0, hasSubtitle and 5 or 5)
    l.BackgroundTransparency = 1
    l.Text = opt.Name .. ": " .. defaultValue
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.TextTransparency = 0
    l.TextXAlignment = "Left"
    l.TextSize = 11
    l.Font = "GothamMedium"
    
    local sbg = Instance.new("Frame", f)
    sbg.Size = UDim2.new(0.9, 0, 0, 8)
    sbg.Position = UDim2.new(0.05, 0, hasSubtitle and 0.55 or 0.7, 0)
    sbg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sbg.BackgroundTransparency = 0.5
    Instance.new("UICorner", sbg)
    
    local fill = Instance.new("Frame", sbg)
    local percent = (defaultValue - min) / (max - min)
    fill.Size = UDim2.new(percent, 0, 1, 0)
    fill.BackgroundColor3 = ACCENT
    Instance.new("UICorner", fill)
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(fill, ACCENT, 0.3)
    end
    
    local isHeld = false
    local function UpdateSlider(input)
        local p = math.clamp((input.Position.X - sbg.AbsolutePosition.X) / sbg.AbsoluteSize.X, 0, 1)
        local rawValue = min + (max - min) * p
        local v = math.floor((rawValue - min) / increment) * increment + min
        v = math.clamp(v, min, max)
        local newPercent = (v - min) / (max - min)
        TweenService:Create(fill, TweenInfo.new(0.1), {
            Size = UDim2.new(newPercent, 0, 1, 0)
        }):Play()
        l.Text = opt.Name .. ": " .. v
        if opt.Callback then opt.Callback(v) end
    end
    
    sbg.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            isHeld = true
            UpdateSlider(i)
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            isHeld = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if isHeld and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(i)
        end
    end)
    
    return f
end

-- ============================================
-- 4. DROPDOWN (Modal + Multi-select)
-- ============================================
function Components.CreateDropdown(parent, opt, settings)
    settings = settings or {}
    local hasSubtitle = opt.Subtitle and opt.Subtitle ~= ""
    local multiSelect = opt.MultiSelect or false
    local selectedItems = {}
    local allOptions = {}
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0.95, 0, 0, hasSubtitle and 55 or 35)
    container.BackgroundColor3 = settings.ElementBg or Color3.fromRGB(22, 22, 22)
    container.BackgroundTransparency = 0.7
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)
    container.LayoutOrder = layoutOrder
    container.ClipsDescendants = true
    container.Name = opt.Name or "Dropdown"
    
    local triggerBtn = Instance.new("TextButton", container)
    triggerBtn.Size = UDim2.new(1, 0, 0, 35)
    triggerBtn.BackgroundTransparency = 1
    triggerBtn.Text = "  " .. opt.Name
    triggerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    triggerBtn.TextTransparency = 0
    triggerBtn.Font = "GothamMedium"
    triggerBtn.TextSize = 12
    triggerBtn.TextXAlignment = "Left"
    triggerBtn.AutoButtonColor = false
    
    if settings.UseRipple then
        Effects.CreateRipple(triggerBtn, ACCENT, 0.3)
    end
    
    local selectedText = Instance.new("TextLabel", triggerBtn)
    selectedText.Size = UDim2.new(0.7, 0, 1, 0)
    selectedText.Position = UDim2.new(0, 35, 0, 0)
    selectedText.BackgroundTransparency = 1
    selectedText.Text = ""
    selectedText.TextColor3 = Color3.fromRGB(180, 180, 180)
    selectedText.TextTransparency = 0
    selectedText.Font = "Gotham"
    selectedText.TextSize = 11
    selectedText.TextXAlignment = "Left"
    selectedText.TextTruncate = Enum.TextTruncate.AtEnd
    
    local countBadge = Instance.new("Frame", triggerBtn)
    countBadge.Size = UDim2.new(0, 0, 0, 18)
    countBadge.Position = UDim2.new(0.5, 0, 0.5, -9)
    countBadge.BackgroundColor3 = ACCENT
    countBadge.BackgroundTransparency = 0.8
    countBadge.Visible = false
    countBadge.ZIndex = 5
    Instance.new("UICorner", countBadge).CornerRadius = UDim.new(1, 0)
    
    local countLabel = Instance.new("TextLabel", countBadge)
    countLabel.Size = UDim2.new(1, 0, 1, 0)
    countLabel.BackgroundTransparency = 1
    countLabel.Text = "0"
    countLabel.TextColor3 = Color3.new(1,1,1)
    countLabel.TextSize = 10
    countLabel.Font = "GothamBold"
    countLabel.TextXAlignment = "Center"
    countLabel.TextYAlignment = "Center"
    
    local arrow = Instance.new("TextLabel", triggerBtn)
    arrow.Size = UDim2.new(0, 30, 1, 0)
    arrow.Position = UDim2.new(1, -35, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▼"
    arrow.TextColor3 = Color3.fromRGB(180, 180, 180)
    arrow.TextTransparency = 0
    arrow.Font = "GothamMedium"
    arrow.TextSize = 14
    arrow.TextXAlignment = "Center"
    
    -- Modal
    local modalFrame = Instance.new("Frame", container)
    modalFrame.Size = UDim2.new(1.2, 0, 0, 0)
    modalFrame.Position = UDim2.new(-0.1, 0, 0, 40)
    modalFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    modalFrame.BackgroundTransparency = 1
    modalFrame.Visible = false
    modalFrame.ClipsDescendants = true
    modalFrame.ZIndex = 100
    Instance.new("UICorner", modalFrame).CornerRadius = UDim.new(0, 12)
    
    local modalStroke = Instance.new("UIStroke", modalFrame)
    modalStroke.Color = ACCENT
    modalStroke.Thickness = 1
    modalStroke.Transparency = 0.5
    
    if settings.UseGlow then
        Effects.CreateUIGlow(modalFrame, ACCENT, 0.2, container)
    end
    
    -- Search
    local searchFrame = Instance.new("Frame", modalFrame)
    searchFrame.Size = UDim2.new(1, -20, 0, 30)
    searchFrame.Position = UDim2.new(0, 10, 0, 8)
    searchFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    searchFrame.BackgroundTransparency = 0.5
    searchFrame.ZIndex = 101
    Instance.new("UICorner", searchFrame).CornerRadius = UDim.new(0, 6)
    
    local searchIcon = Instance.new("TextLabel", searchFrame)
    searchIcon.Size = UDim2.new(0, 25, 1, 0)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Text = "🔍"
    searchIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    searchIcon.TextSize = 12
    searchIcon.Font = "GothamMedium"
    searchIcon.TextXAlignment = "Center"
    searchIcon.ZIndex = 102
    
    local searchBox = Instance.new("TextBox", searchFrame)
    searchBox.Size = UDim2.new(1, -30, 1, 0)
    searchBox.Position = UDim2.new(0, 30, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.PlaceholderText = "Tìm kiếm..."
    searchBox.Text = ""
    searchBox.TextColor3 = Color3.new(1,1,1)
    searchBox.TextTransparency = 0
    searchBox.Font = "Gotham"
    searchBox.TextSize = 12
    searchBox.ClearTextOnFocus = false
    searchBox.ZIndex = 102
    
    -- Options
    local optionsScroll = Instance.new("ScrollingFrame", modalFrame)
    optionsScroll.Size = UDim2.new(1, 0, 0, 0)
    optionsScroll.Position = UDim2.new(0, 0, 0, 48)
    optionsScroll.BackgroundTransparency = 1
    optionsScroll.ScrollBarThickness = 3
    optionsScroll.ScrollBarImageColor3 = ACCENT
    optionsScroll.ScrollBarImageTransparency = 0.5
    optionsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    optionsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    optionsScroll.ZIndex = 101
    
    local optionsLayout = Instance.new("UIListLayout", optionsScroll)
    optionsLayout.Padding = UDim.new(0, 2)
    optionsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- Actions
    local actionFrame = Instance.new("Frame", modalFrame)
    actionFrame.Size = UDim2.new(1, -20, 0, 35)
    actionFrame.Position = UDim2.new(0, 10, 1, -45)
    actionFrame.BackgroundTransparency = 1
    actionFrame.ZIndex = 101
    
    local actionLayout = Instance.new("UIListLayout", actionFrame)
    actionLayout.FillDirection = "Horizontal"
    actionLayout.HorizontalAlignment = "Center"
    actionLayout.Padding = UDim.new(0, 8)
    actionLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local selectAllBtn = Instance.new("TextButton", actionFrame)
    selectAllBtn.Size = UDim2.new(0, 80, 1, 0)
    selectAllBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    selectAllBtn.Text = "Chọn tất cả"
    selectAllBtn.TextColor3 = Color3.new(1,1,1)
    selectAllBtn.TextSize = 10
    selectAllBtn.Font = "GothamMedium"
    selectAllBtn.AutoButtonColor = false
    Instance.new("UICorner", selectAllBtn).CornerRadius = UDim.new(0, 6)
    
    local clearBtn = Instance.new("TextButton", actionFrame)
    clearBtn.Size = UDim2.new(0, 60, 1, 0)
    clearBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
    clearBtn.Text = "Xóa"
    clearBtn.TextColor3 = Color3.fromRGB(255, 150, 150)
    clearBtn.TextSize = 10
    clearBtn.Font = "GothamMedium"
    clearBtn.AutoButtonColor = false
    Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 6)
    
    local confirmBtn = Instance.new("TextButton", actionFrame)
    confirmBtn.Size = UDim2.new(0, 80, 1, 0)
    confirmBtn.BackgroundColor3 = ACCENT
    confirmBtn.Text = "Xác nhận"
    confirmBtn.TextColor3 = Color3.new(1,1,1)
    confirmBtn.TextSize = 10
    confirmBtn.Font = "GothamBold"
    confirmBtn.AutoButtonColor = false
    Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)
    
    local function updateCountBadge()
        if multiSelect and #selectedItems > 0 then
            countBadge.Visible = true
            countLabel.Text = tostring(#selectedItems)
            local textWidth = #selectedItems * 8 + 16
            countBadge.Size = UDim2.new(0, math.max(textWidth, 20), 0, 18)
            countBadge.Position = UDim2.new(0.5, 0, 0.5, -9)
            if #selectedItems <= 2 then
                selectedText.Text = table.concat(selectedItems, ", ")
            else
                selectedText.Text = #selectedItems .. " items selected"
            end
        else
            countBadge.Visible = false
            selectedText.Text = ""
        end
    end
    
    local function renderOptions(options)
        for _, child in pairs(optionsScroll:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        local optionsToShow = options or allOptions
        for _, option in ipairs(optionsToShow) do
            local isSelected = false
            for _, item in ipairs(selectedItems) do
                if item == option then isSelected = true; break end
            end
            
            local btn = Instance.new("TextButton", optionsScroll)
            btn.Size = UDim2.new(1, -16, 0, 32)
            btn.Position = UDim2.new(0, 8, 0, 0)
            btn.BackgroundColor3 = isSelected and Color3.fromRGB(40, 40, 60) or Color3.fromRGB(22, 22, 30)
            btn.BackgroundTransparency = 0.3
            btn.Text = ""
            btn.AutoButtonColor = false
            btn.ZIndex = 102
            btn.Name = option
            
            btn.MouseEnter:Connect(function()
                if not btn.BackgroundColor3 == Color3.fromRGB(40, 40, 60) then
                    TweenService:Create(btn, TweenInfo.new(0.1), {
                        BackgroundColor3 = Color3.fromRGB(35, 35, 45)
                    }):Play()
                end
            end)
            btn.MouseLeave:Connect(function()
                if not btn.BackgroundColor3 == Color3.fromRGB(40, 40, 60) then
                    TweenService:Create(btn, TweenInfo.new(0.1), {
                        BackgroundColor3 = Color3.fromRGB(22, 22, 30)
                    }):Play()
                end
            end)
            
            local checkBox = Instance.new("Frame", btn)
            checkBox.Size = UDim2.new(0, 18, 0, 18)
            checkBox.Position = UDim2.new(0, 10, 0.5, -9)
            checkBox.BackgroundColor3 = isSelected and ACCENT or Color3.fromRGB(35, 35, 45)
            checkBox.BackgroundTransparency = 0
            checkBox.ZIndex = 103
            Instance.new("UICorner", checkBox).CornerRadius = UDim.new(0, 4)
            
            local checkMark = Instance.new("TextLabel", checkBox)
            checkMark.Size = UDim2.new(1, 0, 1, 0)
            checkMark.BackgroundTransparency = 1
            checkMark.Text = isSelected and "✓" or ""
            checkMark.TextColor3 = Color3.new(1,1,1)
            checkMark.TextSize = 12
            checkMark.Font = "GothamBold"
            checkMark.TextXAlignment = "Center"
            checkMark.TextYAlignment = "Center"
            checkMark.ZIndex = 104
            
            local label = Instance.new("TextLabel", btn)
            label.Size = UDim2.new(1, -50, 1, 0)
            label.Position = UDim2.new(0, 35, 0, 0)
            label.BackgroundTransparency = 1
            label.Text = option
            label.TextColor3 = isSelected and ACCENT or Color3.fromRGB(200, 200, 200)
            label.TextSize = 12
            label.Font = "Gotham"
            label.TextXAlignment = "Left"
            label.ZIndex = 103
            
            btn.MouseButton1Click:Connect(function()
                if settings.UsePop then
                    Effects.Pop(btn, 1.1)
                end
                if multiSelect then
                    local found = false
                    for i, item in ipairs(selectedItems) do
                        if item == option then
                            table.remove(selectedItems, i)
                            found = true
                            break
                        end
                    end
                    if not found then
                        table.insert(selectedItems, option)
                    end
                    renderOptions(optionsToShow)
                    updateCountBadge()
                    if opt.OnChange then opt.OnChange(selectedItems) end
                else
                    selectedItems = {option}
                    renderOptions(optionsToShow)
                    updateCountBadge()
                    if opt.Callback then opt.Callback(option) end
                    closeModal()
                end
            end)
        end
        
        task.wait()
        local contentHeight = optionsLayout.AbsoluteContentSize.Y + 10
        optionsScroll.Size = UDim2.new(1, 0, 0, math.min(contentHeight + 10, 200))
        optionsScroll.CanvasSize = UDim2.new(0, 0, 0, contentHeight + 10)
        local totalHeight = 48 + optionsScroll.Size.Y.Offset + 50
        modalFrame.Size = UDim2.new(1.2, 0, 0, math.min(totalHeight, 300))
    end
    
    local function openModal()
        modalFrame.Visible = true
        modalFrame.BackgroundTransparency = 0.95
        modalFrame.Size = UDim2.new(1.2, 0, 0, 0)
        TweenService:Create(modalFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(1.2, 0, 0, 250),
            BackgroundTransparency = 0.95
        }):Play()
        arrow.Text = "▲"
        searchBox.Text = ""
        searchBox:CaptureFocus()
        if opt.GetOptions then allOptions = opt.GetOptions() end
        renderOptions(allOptions)
    end
    
    local function closeModal()
        TweenService:Create(modalFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(1.2, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        arrow.Text = "▼"
        task.wait(0.2)
        modalFrame.Visible = false
    end
    
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local search = searchBox.Text:lower()
        if search == "" then
            renderOptions(allOptions)
        else
            local filtered = {}
            for _, option in ipairs(allOptions) do
                if option:lower():find(search) then
                    table.insert(filtered, option)
                end
            end
            renderOptions(filtered)
        end
    end)
    
    triggerBtn.MouseButton1Click:Connect(function()
        if modalFrame.Visible then
            closeModal()
        else
            openModal()
        end
    end)
    
    selectAllBtn.MouseButton1Click:Connect(function()
        if multiSelect then
            selectedItems = {}
            for _, option in ipairs(allOptions) do
                table.insert(selectedItems, option)
            end
            renderOptions(allOptions)
            updateCountBadge()
            if opt.OnChange then opt.OnChange(selectedItems) end
        end
    end)
    
    clearBtn.MouseButton1Click:Connect(function()
        if multiSelect then
            selectedItems = {}
            renderOptions(allOptions)
            updateCountBadge()
            if opt.OnChange then opt.OnChange(selectedItems) end
        end
    end)
    
    confirmBtn.MouseButton1Click:Connect(function()
        if multiSelect and opt.Callback then
            opt.Callback(selectedItems)
        end
        closeModal()
    end)
    
    if opt.GetOptions then allOptions = opt.GetOptions() elseif opt.Options then allOptions = opt.Options end
    if opt.Default then
        if multiSelect and type(opt.Default) == "table" then
            selectedItems = opt.Default
        elseif not multiSelect then
            selectedItems = {opt.Default}
        end
        updateCountBadge()
    end
    
    return container
end

-- ============================================
-- 5. CARD
-- ============================================
function Components.CreateCard(parent, opt, settings)
    settings = settings or {}
    opt = opt or {}
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local cardType = opt.Type or "default"
    local hasSubtitle = opt.Subtitle and opt.Subtitle ~= ""
    local hasImage = opt.Image and opt.Image ~= ""
    local hasIcon = opt.Icon and opt.Icon ~= ""
    local isClickable = opt.Clickable or false
    local isCompact = cardType == "compact"
    local layoutOrder = #parent:GetChildren() + 1
    
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(0.95, 0, 0, isCompact and 80 or 120)
    card.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    card.BackgroundTransparency = 0.3
    card.LayoutOrder = layoutOrder
    card.ClipsDescendants = true
    card.Name = opt.Name or "Card"
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)
    
    local cardStroke = Instance.new("UIStroke", card)
    cardStroke.Thickness = 1
    cardStroke.Transparency = 0.5
    
    if cardType == "elevated" then
        card.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
        card.BackgroundTransparency = 0.2
        cardStroke.Color = ACCENT
        cardStroke.Transparency = 0.3
        cardStroke.Thickness = 2
        if settings.UseGlow then
            Effects.CreateUIGlow(card, ACCENT, 0.3, parent)
        end
    elseif cardType == "featured" then
        card.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
        card.BackgroundTransparency = 0.2
        cardStroke.Color = ACCENT
        cardStroke.Transparency = 0
        cardStroke.Thickness = 2
        if settings.UseGlow then
            Effects.CreateUIGlow(card, ACCENT, 0.5, parent)
        end
        if settings.UseNeon then
            Effects.CreateNeonPulse(card, ACCENT, 0.3)
        end
    elseif cardType == "glass" then
        card.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        card.BackgroundTransparency = 0.9
        cardStroke.Color = Color3.fromRGB(255, 255, 255)
        cardStroke.Transparency = 0.8
        cardStroke.Thickness = 1
        local glassBlur = Instance.new("Frame", card)
        glassBlur.Size = UDim2.new(1, 0, 1, 0)
        glassBlur.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        glassBlur.BackgroundTransparency = 0.8
        glassBlur.ZIndex = 0
        Instance.new("UICorner", glassBlur).CornerRadius = UDim.new(0, 12)
        local blur = Instance.new("BlurEffect", glassBlur)
        blur.Size = 10
    end
    
    local contentFrame = Instance.new("Frame", card)
    contentFrame.Size = UDim2.new(1, -20, 1, -16)
    contentFrame.Position = UDim2.new(0, 10, 0, 8)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ClipsDescendants = true
    
    local headerFrame = Instance.new("Frame", contentFrame)
    headerFrame.Size = UDim2.new(1, 0, 0, isCompact and 25 or 30)
    headerFrame.BackgroundTransparency = 1
    
    if hasIcon then
        local iconSize = isCompact and 16 or 20
        local iconLabel = Instance.new("ImageLabel", headerFrame)
        iconLabel.Size = UDim2.new(0, iconSize, 0, iconSize)
        iconLabel.Position = UDim2.new(0, 0, 0.5, -iconSize/2)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Image = ResolveIcon(opt.Icon)
        iconLabel.ImageColor3 = ACCENT
    end
    
    local titleLabel = Instance.new("TextLabel", headerFrame)
    titleLabel.Size = UDim2.new(0.7, -10, 1, 0)
    titleLabel.Position = UDim2.new(hasIcon and 0.06 or 0, hasIcon and 0 or 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = opt.Title or "Card Title"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextTransparency = 0
    titleLabel.Font = "GothamBold"
    titleLabel.TextSize = isCompact and 12 or 14
    titleLabel.TextXAlignment = "Left"
    titleLabel.TextYAlignment = "Center"
    
    if opt.Badge then
        local badge = Instance.new("Frame", headerFrame)
        local badgeText = opt.Badge
        local badgeWidth = #badgeText * 7 + 16
        badge.Size = UDim2.new(0, math.max(badgeWidth, 20), 0, 18)
        badge.Position = UDim2.new(1, -badgeWidth - 5, 0.5, -9)
        badge.BackgroundColor3 = opt.BadgeColor or ACCENT
        badge.BackgroundTransparency = 0.3
        badge.ZIndex = 5
        Instance.new("UICorner", badge).CornerRadius = UDim.new(1, 0)
        local badgeLabel = Instance.new("TextLabel", badge)
        badgeLabel.Size = UDim2.new(1, -6, 1, 0)
        badgeLabel.Position = UDim2.new(0, 3, 0, 0)
        badgeLabel.BackgroundTransparency = 1
        badgeLabel.Text = badgeText
        badgeLabel.TextColor3 = Color3.new(1,1,1)
        badgeLabel.TextSize = 9
        badgeLabel.Font = "GothamBold"
        badgeLabel.TextXAlignment = "Center"
        badgeLabel.TextYAlignment = "Center"
    end
    
    local bodyFrame = Instance.new("Frame", contentFrame)
    bodyFrame.Size = UDim2.new(1, 0, 0, isCompact and 35 or 55)
    bodyFrame.Position = UDim2.new(0, 0, 0, isCompact and 28 or 35)
    bodyFrame.BackgroundTransparency = 1
    
    local contentLabel = Instance.new("TextLabel", bodyFrame)
    contentLabel.Size = UDim2.new(1, 0, 0.7, 0)
    contentLabel.Position = UDim2.new(0, 0, 0, 0)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = opt.Description or "Card content goes here..."
    contentLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
    contentLabel.TextTransparency = 0
    contentLabel.Font = "Gotham"
    contentLabel.TextSize = isCompact and 10 or 12
    contentLabel.TextXAlignment = "Left"
    contentLabel.TextYAlignment = "Top"
    contentLabel.TextWrapped = true
    contentLabel.LineHeight = 1.2
    
    if hasSubtitle then
        local subtitleLabel = Instance.new("TextLabel", bodyFrame)
        subtitleLabel.Size = UDim2.new(1, 0, 0.3, 0)
        subtitleLabel.Position = UDim2.new(0, 0, 0.7, 0)
        subtitleLabel.BackgroundTransparency = 1
        subtitleLabel.Text = opt.Subtitle
        subtitleLabel.TextColor3 = Color3.fromRGB(130, 130, 150)
        subtitleLabel.TextTransparency = 0
        subtitleLabel.Font = "Gotham"
        subtitleLabel.TextSize = 10
        subtitleLabel.TextXAlignment = "Left"
        subtitleLabel.TextYAlignment = "Bottom"
    end
    
    local footerFrame = Instance.new("Frame", contentFrame)
    footerFrame.Size = UDim2.new(1, 0, 0, isCompact and 25 or 30)
    footerFrame.Position = UDim2.new(0, 0, 1, -(isCompact and 25 or 30))
    footerFrame.BackgroundTransparency = 1
    
    local divider = Instance.new("Frame", footerFrame)
    divider.Size = UDim2.new(1, 0, 0, 1)
    divider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    divider.BackgroundTransparency = 0.5
    divider.Position = UDim2.new(0, 0, 0, 0)
    
    local actionsFrame = Instance.new("Frame", footerFrame)
    actionsFrame.Size = UDim2.new(1, 0, 0.8, 0)
    actionsFrame.Position = UDim2.new(0, 0, 0.1, 0)
    actionsFrame.BackgroundTransparency = 1
    
    local actionsLayout = Instance.new("UIListLayout", actionsFrame)
    actionsLayout.FillDirection = "Horizontal"
    actionsLayout.HorizontalAlignment = "Right"
    actionsLayout.VerticalAlignment = "Center"
    actionsLayout.Padding = UDim.new(0, 6)
    
    if opt.Actions and type(opt.Actions) == "table" then
        for _, action in ipairs(opt.Actions) do
            local btn = Instance.new("TextButton", actionsFrame)
            btn.Size = UDim2.new(0, action.Width or 60, 0.8, 0)
            btn.BackgroundColor3 = action.Color or Color3.fromRGB(35, 35, 45)
            btn.Text = action.Label or "Action"
            btn.TextColor3 = Color3.new(1,1,1)
            btn.TextSize = 10
            btn.Font = "GothamMedium"
            btn.AutoButtonColor = false
            btn.ZIndex = 2
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
            
            btn.MouseButton1Click:Connect(function()
                if action.Callback then action.Callback() end
            end)
        end
    end
    
    if hasImage then
        card.Size = UDim2.new(0.95, 0, 0, isCompact and 120 or 180)
        local imageContainer = Instance.new("Frame", contentFrame)
        imageContainer.Size = UDim2.new(1, 0, 0, isCompact and 50 or 80)
        imageContainer.Position = UDim2.new(0, 0, 0, 0)
        imageContainer.BackgroundTransparency = 1
        imageContainer.ClipsDescendants = true
        imageContainer.ZIndex = 1
        Instance.new("UICorner", imageContainer).CornerRadius = UDim.new(0, 8)
        
        local image = Instance.new("ImageLabel", imageContainer)
        image.Size = UDim2.new(1, 0, 1, 0)
        image.BackgroundTransparency = 1
        image.ScaleType = Enum.ScaleType.Crop
        image.Image = opt.Image
        
        local overlay = Instance.new("Frame", imageContainer)
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        overlay.BackgroundTransparency = 0.3
        overlay.ZIndex = 2
        
        headerFrame.Parent = imageContainer
        headerFrame.Position = UDim2.new(0, 10, 0, 8)
        headerFrame.Size = UDim2.new(1, -20, 0, 30)
        headerFrame.BackgroundTransparency = 0.7
        headerFrame.ZIndex = 3
        
        bodyFrame.Position = UDim2.new(0, 0, 0, (isCompact and 50 or 80) + 5)
        bodyFrame.Size = UDim2.new(1, 0, 0, isCompact and 30 or 50)
        footerFrame.Position = UDim2.new(0, 0, 1, -(isCompact and 25 or 30))
    end
    
    if isClickable then
        local clickButton = Instance.new("TextButton", card)
        clickButton.Size = UDim2.new(1, 0, 1, 0)
        clickButton.BackgroundTransparency = 1
        clickButton.Text = ""
        clickButton.ZIndex = 10
        clickButton.AutoButtonColor = false
        
        clickButton.MouseButton1Click:Connect(function()
            if opt.OnClick then opt.OnClick() end
        end)
    end
    
    return card
end

-- ============================================
-- 6. GRID
-- ============================================
function Components.CreateGrid(parent, columns, cellSize, cellPadding, position, size)
    columns = columns or 4
    cellSize = cellSize or UDim2.new(0, 60, 0, 60)
    cellPadding = cellPadding or UDim2.new(0, 5, 0, 5)
    position = position or UDim2.new(0, 0, 0, 0)
    
    local gridFrame = Instance.new("Frame", parent)
    gridFrame.Size = size or UDim2.new(1, 0, 0, 0)
    gridFrame.Position = position
    gridFrame.BackgroundTransparency = 1
    gridFrame.AutomaticSize = Enum.AutomaticSize.Y
    gridFrame.ClipsDescendants = true
    gridFrame.LayoutOrder = #parent:GetChildren() + 1
    
    local function updateCellSize()
        local containerWidth = parent.AbsoluteSize.X - 20
        if containerWidth > 0 and columns > 0 then
            local paddingX = cellPadding.X.Offset or 5
            local totalPadding = paddingX * (columns - 1)
            local cellWidth = math.floor((containerWidth - totalPadding) / columns)
            gridLayout.CellSize = UDim2.new(0, math.max(cellWidth, 30), 0, cellSize.Y.Offset or 60)
        end
    end
    
    local gridLayout = Instance.new("UIGridLayout", gridFrame)
    gridLayout.CellSize = cellSize
    gridLayout.CellPadding = cellPadding
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    gridLayout.MaxColumns = columns
    
    task.defer(updateCellSize)
    parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCellSize)
    
    return gridFrame, gridLayout
end

-- ============================================
-- 7. BADGE
-- ============================================
function Components.CreateBadge(parent, text, color, settings)
    settings = settings or {}
    color = color or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local textLen = #(text or "")
    local width = math.max(textLen * 8 + 20, 20)
    
    local badge = Instance.new("Frame", parent)
    badge.Size = UDim2.new(0, width, 0, 20)
    badge.BackgroundColor3 = color
    badge.BackgroundTransparency = 0.3
    badge.LayoutOrder = layoutOrder
    
    Instance.new("UICorner", badge).CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", badge)
    stroke.Color = color
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    
    local label = Instance.new("TextLabel", badge)
    label.Size = UDim2.new(1, -6, 1, 0)
    label.Position = UDim2.new(0, 3, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text or ""
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 11
    label.Font = "GothamBold"
    label.TextXAlignment = "Center"
    label.TextYAlignment = "Center"
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(badge, color, 0.5)
    end
    
    return badge
end

-- ============================================
-- 8. SEGMENTED CONTROL
-- ============================================
function Components.CreateSegmentedControl(parent, options, default, callback, settings)
    settings = settings or {}
    if not options or #options < 2 then return nil end
    
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0.95, 0, 0, 32)
    container.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    container.BackgroundTransparency = 0.5
    container.LayoutOrder = layoutOrder
    container.ClipsDescendants = true
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)
    
    local selectedIndex = 1
    for i, opt in ipairs(options) do
        if opt == default then selectedIndex = i; break end
    end
    
    local buttons = {}
    local btnWidth = math.floor(90 / #options * 100) / 100
    
    for i, opt in ipairs(options) do
        local btn = Instance.new("TextButton", container)
        btn.Size = UDim2.new(btnWidth, -4, 1, -4)
        btn.Position = UDim2.new((i-1) * btnWidth + 0.02, 2, 0, 2)
        btn.Text = opt
        btn.TextColor3 = (i == selectedIndex) and Color3.new(1,1,1) or Color3.fromRGB(180, 180, 180)
        btn.TextSize = 11
        btn.Font = "GothamMedium"
        btn.BackgroundColor3 = (i == selectedIndex) and ACCENT or Color3.fromRGB(35, 35, 45)
        btn.BackgroundTransparency = 0
        btn.AutoButtonColor = false
        btn.ZIndex = 2
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        
        if settings.UseRipple then
            Effects.CreateRipple(btn, ACCENT, 0.3)
        end
        
        table.insert(buttons, btn)
        
        btn.MouseButton1Click:Connect(function()
            selectedIndex = i
            for idx, b in ipairs(buttons) do
                local isSelected = (idx == i)
                TweenService:Create(b, TweenInfo.new(0.2), {
                    BackgroundColor3 = isSelected and ACCENT or Color3.fromRGB(35, 35, 45),
                    TextColor3 = isSelected and Color3.new(1,1,1) or Color3.fromRGB(180, 180, 180)
                }):Play()
            end
            if settings.UsePop then
                Effects.Pop(btn, 1.1)
            end
            if callback then callback(opt) end
        end)
    end
    
    return container, buttons
end

-- ============================================
-- 9. PROGRESS BAR
-- ============================================
function Components.CreateProgressBar(parent, value, max, color, settings)
    settings = settings or {}
    value = value or 0
    max = max or 100
    color = color or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0.95, 0, 0, 22)
    container.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    container.BackgroundTransparency = 0.5
    container.LayoutOrder = layoutOrder
    container.ClipsDescendants = true
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 4)
    
    local fill = Instance.new("Frame", container)
    local percent = math.clamp(value/max, 0, 1)
    fill.Size = UDim2.new(percent, 0, 1, 0)
    fill.BackgroundColor3 = color
    fill.BackgroundTransparency = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(fill, color, 0.3)
    end
    
    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = math.floor(percent * 100) .. "%"
    label.TextColor3 = Color3.new(1,1,1)
    label.TextSize = 10
    label.Font = "GothamBold"
    label.TextXAlignment = "Center"
    label.ZIndex = 2
    
    local function update(newValue, newMax)
        local v = newValue or value
        local m = newMax or max
        local newPercent = math.clamp(v/m, 0, 1)
        TweenService:Create(fill, TweenInfo.new(0.3), {
            Size = UDim2.new(newPercent, 0, 1, 0)
        }):Play()
        label.Text = math.floor(newPercent * 100) .. "%"
    end
    
    return container, update
end

-- ============================================
-- 10. RADIO GROUP
-- ============================================
function Components.CreateRadioGroup(parent, options, default, callback, settings)
    settings = settings or {}
    if not options or #options < 2 then return nil end
    
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0.95, 0, 0, #options * 30 + 10)
    container.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    container.BackgroundTransparency = 0.5
    container.LayoutOrder = layoutOrder
    container.ClipsDescendants = true
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 8)
    
    local selected = default or options[1]
    local btns = {}
    local dots = {}
    local inners = {}
    
    local layout = Instance.new("UIListLayout", container)
    layout.Padding = UDim.new(0, 2)
    layout.SortOrder = "LayoutOrder"
    
    for i, opt in ipairs(options) do
        local isSelected = (opt == selected)
        
        local btn = Instance.new("TextButton", container)
        btn.Size = UDim2.new(1, -20, 0, 28)
        btn.Position = UDim2.new(0, 10, 0, 0)
        btn.BackgroundTransparency = 1
        btn.Text = "  " .. opt
        btn.TextColor3 = isSelected and ACCENT or Color3.fromRGB(200, 200, 200)
        btn.TextSize = 12
        btn.Font = "GothamMedium"
        btn.TextXAlignment = "Left"
        btn.AutoButtonColor = false
        btn.LayoutOrder = i
        
        if settings.UseRipple then
            Effects.CreateRipple(btn, ACCENT, 0.3)
        end
        
        local dot = Instance.new("Frame", btn)
        dot.Size = UDim2.new(0, 16, 0, 16)
        dot.Position = UDim2.new(1, -26, 0.5, -8)
        dot.BackgroundColor3 = isSelected and ACCENT or Color3.fromRGB(50, 50, 60)
        dot.BackgroundTransparency = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        
        local inner = Instance.new("Frame", dot)
        inner.Size = UDim2.new(0, 8, 0, 8)
        inner.Position = UDim2.new(0.25, 0, 0.25, 0)
        inner.BackgroundColor3 = Color3.new(1,1,1)
        inner.BackgroundTransparency = 0
        Instance.new("UICorner", inner).CornerRadius = UDim.new(1, 0)
        inner.Visible = isSelected
        
        table.insert(btns, btn)
        table.insert(dots, dot)
        table.insert(inners, inner)
        
        btn.MouseButton1Click:Connect(function()
            selected = opt
            for idx, b in ipairs(btns) do
                local isSel = (b == btn)
                b.TextColor3 = isSel and ACCENT or Color3.fromRGB(200, 200, 200)
                if dots[idx] then
                    dots[idx].BackgroundColor3 = isSel and ACCENT or Color3.fromRGB(50, 50, 60)
                end
                if inners[idx] then
                    inners[idx].Visible = isSel
                end
            end
            if settings.UsePop then
                Effects.Pop(btn, 1.1)
            end
            if callback then callback(opt) end
        end)
    end
    
    return container, btns
end

-- ============================================
-- 11. LOADING SPINNER
-- ============================================
function Components.CreateLoadingSpinner(parent, size, settings)
    settings = settings or {}
    size = size or 32
    local ACCENT = settings.Accent or Color3.fromRGB(170, 85, 255)
    local layoutOrder = #parent:GetChildren() + 1
    
    local spinner = Instance.new("Frame", parent)
    spinner.Size = UDim2.new(0, size, 0, size)
    spinner.BackgroundTransparency = 1
    spinner.LayoutOrder = layoutOrder
    spinner.Visible = true
    
    local image = Instance.new("ImageLabel", spinner)
    image.Size = UDim2.new(1, 0, 1, 0)
    image.BackgroundTransparency = 1
    image.Image = "rbxassetid://6031094700"
    image.ImageColor3 = ACCENT
    image.ScaleType = "Fit"
    
    if settings.UseNeon then
        Effects.CreateNeonPulse(image, ACCENT, 0.5)
    end
    
    local rotation = 0
    local conn = RunService.RenderStepped:Connect(function()
        if not spinner.Parent then conn:Disconnect() return end
        rotation = (rotation + 3) % 360
        image.Rotation = rotation
    end)
    
    local api = {
        Show = function() spinner.Visible = true end,
        Hide = function() spinner.Visible = false end,
        Destroy = function() conn:Disconnect(); spinner:Destroy() end,
        SetColor = function(color) image.ImageColor3 = color or ACCENT end
    }
    
    return api
end

return Components
