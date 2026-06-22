📘 NoirUI V3 Ultimate - Hướng Dẫn Nhanh

---

🚀 Cài Đặt

```lua
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/ui.lua"))()
```

---

⚙️ Tạo Window

```lua
local Window = NoirUI:CreateWindow({
    Name = "Tiêu đề",
    Accent = Color3.fromRGB(255, 100, 100),
    UseGlow = true,
    AutoContrast = true
})
```

---

📌 Các Tham Số CreateWindow (Dạng Gọn)

```lua
{
    -- CORE
    Name = "NOIR HUB",                              -- string: Tiêu đề
    Accent = Color3.fromRGB(170, 85, 255),         -- Color3: Màu chủ đạo
    AutoContrast = false,                          -- bool: Tự động tương phản chữ
    UseGlow = false,                               -- bool: Bật glow viền
    Icon = nil,                                    -- string/number: Icon float
    LogoID = nil,                                  -- string/number: Logo header
    DefaultPosition = UDim2.new(0.5, -210, 0.5, -150),
    FloatDefaultPosition = UDim2.new(0, 15, 0.5, -22),
    FloatSize = 45,
    FloatIconSize = 24,
    FloatCornerRadius = 12,

    -- MÀU NỀN & BLUR
    MainBgColor = Color3.fromRGB(10, 10, 10),
    MainBgTransparency = 0,
    MainBlur = 0,                                   -- 0-1: Lớp tối
    LoadingBlur = 0,
    KeyBlur = 0,
    NotificationBlur = 0,
    ConfirmBlur = 0,
    ElementBackgroundColor = nil,                   -- Màu nền element
    SidebarBackgroundColor = nil,                   -- Màu nền sidebar
    SidebarTransparency = 0.8,
    TabBackgroundColor = nil,                       -- Màu nền tab
    ConfirmBackgroundColor = Color3.fromRGB(15,15,15),
    NotificationBackgroundColor = Color3.fromRGB(15,15,15),

    -- NỀN ẢNH (tùy chọn)
    Background = nil,                               -- {Image = "...", Transparency = 0}
    LoadingBackground = nil,
    KeyBackground = nil,
    NotificationBackground = nil,
    FloatBackground = nil,

    -- KEY SYSTEM
    KeySystem = false,
    KeySettings = {
        Title = "KEY SYSTEM",
        Subtitle = "Nhập key",
        Note = "Liên hệ admin",
        Key = "password",                           -- hoặc {"key1","key2"}
        SaveKey = false,
        FileName = "NoirKey"
    },

    -- NHẠC NỀN
    BackgroundMusic = {
        Enabled = false,
        AutoPlay = false,
        Volume = 0.3,
        SingleTrack = nil,                          -- rbxassetid
        Playlist = {},                              -- {id1, id2, ...}
        LoopMode = "single"                         -- "single", "playlist", "off"
    }
}
```

---

📑 Tab & Element

Tạo Tab

```lua
local Tab = Window:CreateTab("Tên", "icon")
```

Các Element

```lua
-- Label
Tab:CreateLabel("Nội dung")
Tab:CreateLabel(function() return "Dynamic" end)

-- Section (nhóm)
Tab:CreateSection("Tên", true)  -- true = ẩn line

-- Paragraph
Tab:CreateParagraph({
    Title = "Tiêu đề",
    Content = "Nội dung..."
})

-- Button
Tab:CreateButton({
    Name = "Nút",
    Subtitle = "Mô tả",
    Align = false,
    Callback = function() end
})

-- Toggle
Tab:CreateToggle({
    Name = "Công tắc",
    Subtitle = "Mô tả",
    Default = true,
    Callback = function(state) end
})

-- Slider
Tab:CreateSlider({
    Name = "Thanh trượt",
    Subtitle = "Mô tả",
    range = {0, 100},
    increment = 5,
    Default = 50,
    Callback = function(value) end
})

-- Color Picker
Tab:CreateColorPicker({
    Name = "Chọn màu",
    Subtitle = "Mô tả",
    Default = Color3.fromRGB(255,0,0),
    Callback = function(color) end
})

-- Dropdown (tĩnh)
Tab:CreateDropdown({
    Name = "Chọn",
    Subtitle = "Mô tả",
    Options = {"A", "B", "C"},
    Default = "A",
    Callback = function(opt) end
})

-- Dropdown (động)
Tab:CreateDropdown({
    Name = "Chọn",
    GetOptions = function() return {"X","Y","Z"} end,
    RefreshOnOpen = true,
    Callback = function(opt) end
})

-- TextBox
Tab:CreateTextBox({
    Name = "Nhập",
    Subtitle = "Mô tả",
    Default = "",
    Callback = function(text) end
})

-- RunBox (thực thi lệnh)
Tab:CreateRunBox({
    Placeholder = "Nhập lệnh...",
    ClearOnExecute = true
})
```

---

🔔 Các Hàm Tiện Ích

```lua
-- Thông báo
NoirUI:Notify("Tiêu đề", "Nội dung", "icon", "Success")

-- Nhạc
NoirUI:StartMusic()
NoirUI:PauseMusic()
NoirUI:ResumeMusic()
NoirUI:StopMusic()
NoirUI:SetMusicVolume(0.5)
NoirUI:AddMusicTrack(id)
NoirUI:RemoveMusicTrack(index)
NoirUI:SetMusicLoopMode("playlist")

-- Âm thanh
NoirUI:SetCustomSound("Click", "rbxassetid://123")
NoirUI:ToggleSound(true)
NoirUI:SetVolume(0.8)

-- Lệnh tùy chỉnh
NoirUI:RegisterCommand("hello", function(args)
    print(args)
end)

-- Hủy UI
NoirUI:Destroy()
```

---

📝 Ví Dụ Đơn Giản

```lua
local NoirUI = loadstring(game:HttpGet("..."))()
local Window = NoirUI:CreateWindow({
    Name = "My UI",
    Accent = Color3.fromRGB(255,100,100),
    UseGlow = true,
    Icon = "home"
})

local tab = Window:CreateTab("Chính", "home")
tab:CreateButton({
    Name = "Click me",
    Callback = function()
        NoirUI:Notify("Done!", "Clicked!", "check", "Success")
    end
})

tab:CreateToggle({
    Name = "Enable",
    Default = true,
    Callback = function(state)
        print(state)
    end
})
```

---

💡 Mẹo

· Blur = 0.2 là đủ để làm nổi bật nội dung mà không quá tối.
· AutoContrast = true giúp chữ luôn đọc được trên mọi màu nền.
· ElementBackgroundColor áp dụng cho tất cả element trong tab (button, toggle, slider, dropdown...).
· Dùng Subtitle để thêm mô tả cho từng element.

---

Chúc bạn thành công! 🚀
