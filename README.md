📘 NoirUI V3 Ultimate - Hướng Dẫn Đầy Đủ Nhất

<div align="center">

https://img.shields.io/badge/NoirUI-V3_Ultimate-8A2BE2?style=for-the-badge&logo=lua&logoColor=white

https://img.shields.io/github/stars/NoirNotFun/NUI?style=social
https://img.shields.io/github/forks/NoirNotFun/NUI?style=social
https://img.shields.io/badge/Version-3.0-blue?style=flat-square
https://img.shields.io/badge/License-MIT-green?style=flat-square
https://img.shields.io/badge/Lua-5.1-blue?style=flat-square&logo=lua

</div>

---

📌 Mục Lục

· ✨ Giới Thiệu
· 🚀 Cài Đặt
· ⚙️ Tạo Window
· 🎨 Theme System
· 🔄 Dynamic Update
· 📑 Tạo Tab
· 📂 TabGroup
· 🧩 Elements Cơ Bản
· 🆕 Components Mới
· ✨ Hiệu Ứng
· 🔔 Notification
· 🎵 Music System
· 🔊 Sound System
· 🛠️ Custom Commands
· 🔄 Undo/Redo
· 🔑 Key System
· 📱 Minimize
· 🗑️ Destroy UI
· 📝 Ví Dụ Đầy Đủ
· 🎨 Icon List
· 💡 Mẹo & Thủ Thuật
· 🔧 Khắc Phục Sự Cố
· 📝 License

---

✨ Giới Thiệu

NoirUI V3 Ultimate là thư viện giao diện người dùng hiện đại, tối giản và tùy biến cao dành cho Roblox Executor (Synapse X, Krnl, ScriptWare, Fluxus, v.v.).

🌟 Tính Năng Nổi Bật

Tính năng Mô tả
🎨 Theme System 11+ theme có sẵn (Anime, Cyberpunk, Vaporwave)
🔄 Dynamic Update Cập nhật Accent, Background, Blur sau khi tạo
🆕 8+ Components Icon Button, Grid, Badge, Segmented Control, Progress Bar, Radio Group, Card, Loading Spinner
✨ 10+ Effects Ripple, Particles, Neon, Glitch, Pop, Bounce, Slide, Floating, Confetti, Typing
📂 TabGroup Nhóm tab theo danh mục, collapse/expand
🎵 Music System Nhạc nền, Playlist, Vibe Sound
🔊 Sound System Âm thanh tương tác, tùy chỉnh
🔑 Key System Bảo vệ UI bằng key
📱 Minimize Thu gọn UI về 350px + Description
🔄 Undo/Redo Lưu lịch sử thao tác
🎯 Auto Contrast Tự động tương phản chữ với nền

---

🚀 Cài Đặt

```lua
-- Load NoirUI từ GitHub
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirNotFun/NUI/refs/heads/main/ui.lua"))()
```

---

⚙️ Tạo Window

```lua
local Window = NoirUI:CreateWindow({
    -- ========================================
    -- CORE SETTINGS
    -- ========================================
    Name = "NOIR HUB",                    -- Tiêu đề cửa sổ
    Description = "Version 3.0",           -- Description (hiện khi minimize)
    Accent = Color3.fromRGB(170, 85, 255), -- Màu chủ đạo
    AutoContrast = false,                  -- Tự động tương phản chữ với nền
    UseGlow = false,                       -- Bật hiệu ứng glow viền
    Icon = nil,                            -- Icon cho nút float
    LogoID = nil,                          -- Logo hiển thị trên header
    DefaultPosition = UDim2.new(0.5, -210, 0.5, -150),
    FloatDefaultPosition = UDim2.new(0, 15, 0.5, -22),
    FloatSize = 45,
    FloatIconSize = 24,
    FloatCornerRadius = 12,

    -- ========================================
    -- MÀU NỀN & BLUR
    -- ========================================
    MainBgColor = Color3.fromRGB(10, 10, 10),
    MainBgTransparency = 0,
    MainBlur = 0,                              -- 0-1
    LoadingBlur = 0,
    KeyBlur = 0,
    NotificationBlur = 0,
    ConfirmBlur = 0,
    ElementBackgroundColor = nil,              -- Màu nền chung cho element
    SidebarBackgroundColor = nil,              -- Màu nền sidebar
    SidebarTransparency = 0.8,
    TabBackgroundColor = nil,                  -- Màu nền tab
    ConfirmBackgroundColor = Color3.fromRGB(15, 15, 15),
    NotificationBackgroundColor = Color3.fromRGB(15, 15, 15),

    -- ========================================
    -- NỀN ẢNH
    -- ========================================
    Background = nil,                        -- {Image = "...", Transparency = 0}
    LoadingBackground = nil,
    KeyBackground = nil,
    NotificationBackground = nil,
    FloatBackground = nil,

    -- ========================================
    -- HIỆU ỨNG
    -- ========================================
    UseRipple = false,      -- Gợn sóng khi click
    UseParticles = false,   -- Hạt nền
    ParticleCount = 30,
    UseNeon = false,        -- Viền neon nhấp nháy
    UseGlitch = false,      -- Hiệu ứng lỗi GLITCH
    UsePop = false,         -- Hiệu ứng bật lên
    UseBounce = false,      -- Hiệu ứng nảy
    UseSlide = false,       -- Hiệu ứng trượt
    UseFloating = false,    -- Hiệu ứng lơ lửng
    UseConfetti = false,    -- Hiệu ứng pháo hoa
    UseTyping = false,      -- Hiệu ứng đánh chữ

    -- ========================================
    -- KEY SYSTEM
    -- ========================================
    KeySystem = false,
    KeySettings = {
        Title = "KEY SYSTEM",
        Subtitle = "Nhập key",
        Note = "Liên hệ admin",
        Key = "password",                     -- hoặc {"key1", "key2"}
        SaveKey = false,
        FileName = "NoirKey"
    },

    -- ========================================
    -- NHẠC NỀN
    -- ========================================
    BackgroundMusic = {
        Enabled = false,
        AutoPlay = false,
        Volume = 0.3,
        SingleTrack = nil,
        Playlist = {},
        LoopMode = "single"                  -- "single", "playlist", "off"
    },

    -- ========================================
    -- THEME
    -- ========================================
    DefaultTheme = "default",                -- Theme mặc định khi khởi động
})
```

---

🎨 Theme System

🎭 Danh Sách Theme Có Sẵn

Theme Mô tả Màu Accent
default Mặc định Tím (170, 85, 255)
demonSlayer ⚔️ Demon Slayer Cam đỏ (255, 100, 50)
jujutsuKaisen 🔮 Jujutsu Kaisen Xanh dương (50, 200, 255)
naruto 🍥 Naruto Cam (255, 150, 50)
attackOnTitan ⚔️ Attack on Titan Nâu (150, 100, 50)
onePiece 🏴‍☠️ One Piece Vàng (255, 200, 0)
myHeroAcademia 🦸 MHA Hồng (255, 100, 200)
dragonBall 🐉 Dragon Ball Cam đậm (255, 150, 0)
swordArtOnline ⚔️ SAO Xanh nhạt (100, 200, 255)
cyberpunk 🔮 Cyberpunk Xanh neon (0, 255, 200)
vaporwave 🌴 Vaporwave Hồng (255, 100, 255)

🔧 Sử Dụng Theme

```lua
-- Áp dụng theme
Window:ApplyTheme("demonSlayer")

-- Lấy theme hiện tại
local currentTheme = Window:GetCurrentTheme()
print("Theme hiện tại:", currentTheme) -- "demonSlayer"

-- Dừng Vibe Sound (nếu có)
Window:StopVibeSound()
```

🎨 Tạo Theme Tùy Chỉnh

```lua
-- Thêm theme mới vào hệ thống
NoirUI.Themes.myTheme = {
    name = "🎮 My Theme",
    accent = Color3.fromRGB(255, 100, 100),
    mainBg = Color3.fromRGB(10, 10, 20),
    mainBgImage = "rbxassetid://1234567890",
    floatBgImage = "rbxassetid://1234567891",
    blur = 0.2,
    vibeSound = "rbxassetid://9876543210",
    elementBg = Color3.fromRGB(25, 25, 45),
    sidebarBg = Color3.fromRGB(15, 15, 30),
    tabBg = Color3.fromRGB(20, 20, 35),
    description = "My Custom Theme",
    sidebarTrans = 0.85,
    textColor = Color3.fromRGB(255, 255, 255),
}

-- Áp dụng theme vừa tạo
Window:ApplyTheme("myTheme")
```

---

🔄 Dynamic Update

Sau khi tạo Window, bạn có thể cập nhật các thuộc tính bất kỳ lúc nào:

📋 Danh Sách Hàm Cập Nhật

```lua
-- Cập nhật màu chủ đạo
Window:SetAccent(Color3.fromRGB(255, 100, 100))

-- Cập nhật màu nền chính
Window:SetMainBackground(Color3.fromRGB(20, 20, 30), 0)

-- Cập nhật độ mờ (Blur)
Window:SetBlur(0.3)

-- Cập nhật màu sidebar
Window:SetSidebarBackground(Color3.fromRGB(20, 20, 30), 0.8)

-- Cập nhật màu tab
Window:SetTabBackground(Color3.fromRGB(30, 30, 40))

-- Cập nhật màu element
Window:SetElementBackground(Color3.fromRGB(25, 25, 35))

-- Cập nhật ảnh nền
Window:SetBackgroundImage("rbxassetid://1234567890", 0.5)

-- Cập nhật ảnh nền float button
Window:SetFloatBackgroundImage("rbxassetid://1234567891", 0.5)

-- Cập nhật icon float
Window:SetFloatIcon("home")

-- Cập nhật tiêu đề
Window:SetTitle("New Title")

-- Cập nhật description
Window:SetDescription("New Description")

-- Cập nhật độ trong suốt sidebar
Window:SetSidebarTransparency(0.85)

-- Lấy accent hiện tại
local accent = Window:GetAccent()
print("Accent:", accent)

-- Lấy theme hiện tại
local theme = Window:GetCurrentTheme()
print("Theme:", theme)
```

---

📑 Tạo Tab

Tab Root (luôn hiển thị)

```lua
local tab = Window:CreateTab("Tên Tab", "icon")
```

Tab Trong Group

```lua
local group = Window:CreateTabGroup("⚡ Tự Động", true)  -- true: mở sẵn
local tab = group:CreateTab("Farm", "zap")
```

---

📂 TabGroup

```lua
-- Tạo group
local group = Window:CreateTabGroup("⚡ Tự Động", true)

-- Thêm tab vào group
local tab1 = group:CreateTab("Farm", "zap")
local tab2 = group:CreateTab("Combat", "sword")
local tab3 = group:CreateTab("Auto Click", "mouse")
```

✨ Tính năng:

· Click vào tiêu đề để thu gọn/mở rộng
· Tab con được thụt lề để phân biệt
· Tất cả element hoạt động bình thường
· Có thể tạo nhiều group trong cùng window

---

🧩 Elements Cơ Bản

Tất cả element đều hỗ trợ tham số Subtitle để thêm mô tả.

1. Label (Nhãn)

```lua
-- Label tĩnh
tab:CreateLabel("Nội dung văn bản")

-- Label động (cập nhật liên tục)
local count = 0
tab:CreateLabel(function()
    return "Giá trị hiện tại: " .. count
end)
```

2. Section (Phần nhóm)

```lua
local section = tab:CreateSection("Tên Section", true)  -- true: ẩn đường kẻ
```

3. Paragraph (Khối văn bản)

```lua
tab:CreateParagraph({
    Title = "Tiêu đề",
    Content = "Nội dung dài...\nCó thể xuống dòng bằng \\n."
})
```

4. Button (Nút bấm)

```lua
tab:CreateButton({
    Name = "Tên nút",
    Subtitle = "Phụ đề (tùy chọn)",
    Align = false,  -- false: căn trái, true: căn giữa
    Callback = function()
        print("Đã bấm!")
    end
})
```

5. Toggle (Công tắc)

```lua
tab:CreateToggle({
    Name = "Bật chức năng",
    Subtitle = "Mô tả chức năng",
    Default = true,
    Callback = function(state)
        print("Trạng thái:", state)
    end
})
```

6. Slider (Thanh trượt)

```lua
tab:CreateSlider({
    Name = "Âm lượng",
    Subtitle = "Điều chỉnh âm lượng",
    range = {0, 100},
    increment = 5,
    Default = 50,
    Callback = function(value)
        print("Giá trị:", value)
    end
})
```

7. Color Picker (Chọn màu)

```lua
tab:CreateColorPicker({
    Name = "Chọn màu",
    Subtitle = "Màu accent",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print("Màu:", color)
    end
})
```

8. Dropdown (Thả xuống)

```lua
-- Danh sách tĩnh
tab:CreateDropdown({
    Name = "Chọn",
    Subtitle = "Danh sách tùy chọn",
    Options = {"A", "B", "C"},
    Default = "A",
    Callback = function(option)
        print("Đã chọn:", option)
    end
})

-- Danh sách động (cập nhật theo thời gian thực)
tab:CreateDropdown({
    Name = "Chọn",
    GetOptions = function()
        return {"X", "Y", "Z"}
    end,
    RefreshOnOpen = true,
    Callback = function(opt)
        print("Đã chọn:", opt)
    end
})
```

9. TextBox (Ô nhập liệu)

```lua
tab:CreateTextBox({
    Name = "Nhập",
    Subtitle = "Mô tả",
    Default = "Giá trị mặc định",
    Callback = function(text)
        print("Đã nhập:", text)
    end
})
```

10. RunBox (Thực thi lệnh)

```lua
tab:CreateRunBox({
    Placeholder = "Nhập lệnh hoặc code...",
    ClearOnExecute = true  -- tự động xóa sau khi chạy
})
```

Hỗ trợ:

· ✅ Lệnh tùy chỉnh: help (không cần dấu ".")
· ✅ Lua code trực tiếp: print("Hello")
· ❌ loadstring đã bị vô hiệu hóa
· ❌ require đã bị vô hiệu hóa

---

🆕 Components Mới

⚠️ Lưu ý quan trọng: Các component này CHỈ có thể sử dụng từ Tab, không sử dụng từ Window.

1. Icon Button (Nút icon)

```lua
local btn, icon = tab:CreateIconButton(
    parent,                              -- Frame cha
    "home",                              -- Tên icon
    nil,                                 -- Vị trí (UDim2, mặc định (0,0,0,0))
    36,                                  -- Kích thước (mặc định 36)
    Color3.fromRGB(40, 40, 50),          -- Màu nền
    16,                                  -- Kích thước icon (mặc định 16)
    Color3.fromRGB(255, 255, 255),       -- Màu icon
    function()                           -- Callback khi bấm
        print("Clicked!")
    end
)

-- Hoặc đơn giản hơn:
local btn = tab:CreateIconButton(parent, "home")
```

2. Grid Layout (Bố cục lưới)

```lua
-- Grid ngang
local grid, layout = tab:CreateHorizontalGrid(
    parent,          -- Frame cha
    4,               -- Số cột
    UDim2.new(0, 60, 0, 60), -- Kích thước mỗi ô
    UDim2.new(0, 5, 0, 5)    -- Khoảng cách giữa các ô
)

-- Grid dọc
local grid, layout = tab:CreateVerticalGrid(
    parent,          -- Frame cha
    2,               -- Số cột
    UDim2.new(0, 70, 0, 50),
    UDim2.new(0, 10, 0, 5)
)

-- Grid tùy chỉnh
local grid, layout = tab:CreateGrid(
    parent,          -- Frame cha
    3,               -- Số cột
    UDim2.new(0, 50, 0, 50),
    UDim2.new(0, 5, 0, 5)
)
```

3. Badge (Huy hiệu)

```lua
tab:CreateBadge("12", Color3.fromRGB(255, 50, 50))
tab:CreateBadge("✓", Color3.fromRGB(50, 255, 50))
tab:CreateBadge("99+", Color3.fromRGB(255, 200, 50))
```

4. Segmented Control (Thanh chọn)

```lua
local seg, buttons = tab:CreateSegmentedControl(
    {"Option 1", "Option 2", "Option 3"},
    "Option 1",
    function(selected)
        print("Selected:", selected)
    end
)
```

5. Progress Bar (Thanh tiến trình)

```lua
local bar, update = tab:CreateProgressBar(50, 100)

-- Cập nhật tiến trình
update(75, 100)
update(100, 100)
```

6. Radio Group (Nhóm radio)

```lua
local radio, btns = tab:CreateRadioGroup(
    {"Option A", "Option B", "Option C"},
    "Option A",
    function(selected)
        print("Selected:", selected)
    end
)
```

7. Card (Thẻ nội dung)

```lua
tab:CreateCard("📊 Thông tin", "Nội dung của card")
```

8. Loading Spinner (Vòng xoay loading)

```lua
local spinner = tab:CreateLoadingSpinner(40)

spinner:Show()    -- Hiển thị
spinner:Hide()    -- Ẩn
spinner:Destroy() -- Hủy
```

---

✨ Hiệu Ứng

Cách Bật Hiệu Ứng Khi Tạo Window

```lua
local Window = NoirUI:CreateWindow({
    UseRipple = true,
    UseParticles = true,
    UseNeon = true,
    UseGlitch = true,
    UsePop = true,
    UseBounce = true,
    UseSlide = true,
    UseFloating = true,
    UseConfetti = true,
    UseTyping = true,
})
```

Sử Dụng Hiệu Ứng Thủ Công

```lua
-- 1. Gợn sóng khi click
CreateRippleEffect(button, Color3.fromRGB(255, 255, 255), 0.5)

-- 2. Nảy
BounceEffect(frame, 20, 0.5)

-- 3. Bật lên
PopEffect(frame, 1.2)

-- 4. Rung lắc
ShakeEffect(frame, 5, 0.3)

-- 5. Trượt vào
SlideIn(frame, "left", 0.4)

-- 6. Lơ lửng
CreateFloatingAnimation(frame, 5, 1)

-- 7. Viền neon nhấp nháy
CreateNeonPulse(frame, Color3.fromRGB(255, 0, 0), 0.3)

-- 8. Lỗi GLITCH
CreateGlitchEffect(label, 2)

-- 9. Đánh chữ
CreateTypingEffect(label, "Hello World", 0.05)

-- 10. Pháo hoa
CreateConfettiBurst(parent, 30)

-- 11. Hạt nền
CreateParticleBackground(parent, Color3.fromRGB(170, 85, 255), 30)

-- 12. Gradient chuyển động
CreateMorphingGradient(frame, {
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(0, 255, 0)
}, 1)

-- 13. Đập nhịp
CreatePulseEffect(frame, 1.1, 1)
```

---

🔔 Notification

```lua
NoirUI:Notify("Tiêu đề", "Nội dung", "icon", "soundType")
```

Tham số:

· icon: Tên icon Lucide hoặc rbxassetid (có thể nil)
· soundType: "Success", "Error", "Notification"

Ví dụ:

```lua
-- Thông báo thành công
NoirUI:Notify("✅ Thành công", "Đã lưu cài đặt!", "check", "Success")

-- Thông báo lỗi
NoirUI:Notify("❌ Lỗi", "Không thể kết nối server!", "x", "Error")

-- Thông báo thường
NoirUI:Notify("📢 Thông báo", "Đã cập nhật phiên bản mới!", "bell")
```

---

🎵 Music System

Cấu Hình

```lua
BackgroundMusic = {
    Enabled = true,
    AutoPlay = true,
    Volume = 0.3,
    SingleTrack = 1234567890,      -- rbxassetid
    Playlist = {123, 456, 789},
    LoopMode = "single"            -- "single", "playlist", "off"
}
```

Điều Khiển

```lua
NoirUI:StartMusic()                -- Phát nhạc
NoirUI:PauseMusic()                -- Tạm dừng
NoirUI:ResumeMusic()               -- Tiếp tục
NoirUI:StopMusic()                 -- Dừng
NoirUI:SetMusicVolume(0.5)         -- Âm lượng (0-1)
NoirUI:AddMusicTrack(1234567890)   -- Thêm vào playlist
NoirUI:RemoveMusicTrack(1)         -- Xóa theo index
NoirUI:SetMusicLoopMode("playlist") -- "single", "playlist", "off"
```

---

🔊 Sound System

Tùy Chỉnh Âm Thanh

```lua
NoirUI:SetCustomSound("Click", "rbxassetid://123")
NoirUI:SetCustomSound("Tab", "rbxassetid://456")
NoirUI:SetCustomSound("Element", "rbxassetid://789")
NoirUI:SetCustomSound("Open", "...")
NoirUI:SetCustomSound("Close", "...")
NoirUI:SetCustomSound("Notification", "...")
NoirUI:SetCustomSound("Error", "...")
NoirUI:SetCustomSound("Success", "...")
```

Điều Khiển

```lua
NoirUI:ToggleSound(true)   -- Bật/tắt âm thanh
NoirUI:SetVolume(0.8)      -- Âm lượng (0-1)
```

---

🛠️ Custom Commands

```lua
-- Đăng ký lệnh (không cần dấu ".")
NoirUI:RegisterCommand("hello", function(args)
    NoirUI:Notify("Hello", "Bạn đã gõ: " .. table.concat(args, " "))
end)

-- Sử dụng trong RunBox
-- Gõ: hello xin chào
```

Ví dụ lệnh nâng cao:

```lua
NoirUI:RegisterCommand("farm", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Farm", "✅ Đã bật farm!", "zap", "Success")
    elseif state == "off" then
        NoirUI:Notify("Farm", "❌ Đã tắt farm!", "zap")
    else
        NoirUI:Notify("Farm", "⚠️ Dùng: farm on/off")
    end
end)

NoirUI:RegisterCommand("music", function(args)
    local action = args[1] and args[1]:lower() or "help"
    if action == "play" then
        NoirUI:StartMusic()
        NoirUI:Notify("Nhạc", "▶ Đang phát!", "music", "Success")
    elseif action == "pause" then
        NoirUI:PauseMusic()
        NoirUI:Notify("Nhạc", "⏸ Đã tạm dừng!", "pause")
    elseif action == "stop" then
        NoirUI:StopMusic()
        NoirUI:Notify("Nhạc", "⏹ Đã dừng!", "stop")
    elseif action == "volume" then
        local vol = tonumber(args[2])
        if vol and vol >= 0 and vol <= 100 then
            NoirUI:SetMusicVolume(vol / 100)
            NoirUI:Notify("Nhạc", "🔊 Âm lượng: " .. vol .. "%", "volume-2", "Success")
        else
            NoirUI:Notify("Nhạc", "⚠️ Dùng: music volume 50", nil, "Error")
        end
    else
        NoirUI:Notify("Nhạc", "⚠️ Các lệnh: play, pause, stop, volume [0-100]")
    end
end)
```

---

🔄 Undo/Redo

```lua
-- Lưu state vào history
Window:PushHistory({ value = "Some value" })
Window:PushHistory({ count = 10 })
Window:PushHistory({ enabled = true })

-- Undo (quay lại)
Window:Undo(function(state)
    print("Undo:", state)
end)

-- Redo (làm lại)
Window:Redo(function(state)
    print("Redo:", state)
end)
```

---

🔑 Key System

```lua
KeySystem = true,
KeySettings = {
    Title = "🔑 KEY SYSTEM",
    Subtitle = "Vui lòng nhập key",
    Note = "Liên hệ admin để lấy key",
    Key = "mypassword",   -- hoặc {"key1", "key2"}
    SaveKey = true,       -- lưu vào file
    FileName = "MyKey"    -- tên file lưu (mặc định "NoirKey")
}
```

---

📱 Minimize

Khi bấm nút —, UI sẽ:

· Thu gọn từ 420px xuống 350px
· Hiện Description bên dưới Title
· Ẩn Sidebar và Content

```lua
local Window = NoirUI:CreateWindow({
    Name = "NOIR HUB",
    Description = "Version 1.0",  -- Description hiện khi minimize
})
```

---

🗑️ Destroy UI

```lua
NoirUI:Destroy()
```

---

📝 Ví Dụ Đầy Đủ

```lua
-- ============================================
-- 1. TẢI NOIRUI
-- ============================================
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirNotFun/NUI/refs/heads/main/ui.lua"))()

-- ============================================
-- 2. TẠO WINDOW
-- ============================================
local Window = NoirUI:CreateWindow({
    Name = "Script Hub Pro",
    Description = "Version 3.0",
    Accent = Color3.fromRGB(255, 200, 50),
    AutoContrast = true,
    UseGlow = true,
    UseRipple = true,
    UseParticles = true,
    UseNeon = true,
    UsePop = true,
    UseTyping = true,
    Icon = "home",
    MainBgColor = Color3.fromRGB(10, 10, 15),
    MainBlur = 0.2,
    ElementBackgroundColor = Color3.fromRGB(25, 25, 35),
    SidebarBackgroundColor = Color3.fromRGB(15, 15, 25),
    TabBackgroundColor = Color3.fromRGB(30, 30, 45),
    DefaultTheme = "default",
})

-- ============================================
-- 3. TAB ROOT
-- ============================================
local homeTab = Window:CreateTab("🏠 Trang Chủ", "home")
homeTab:CreateParagraph({
    Title = "Script Hub Pro v3.0",
    Content = "Chào mừng bạn đến với Script Hub Pro!\n\n✨ Tính năng:\n• Farm tự động\n• Auto combat\n• Tùy chỉnh giao diện\n• Nhạc nền\n• 10+ hiệu ứng\n• Dynamic Update\n• Component mới"
})

homeTab:CreateButton({
    Name = "🚀 Bắt Đầu",
    Align = true,
    Callback = function()
        NoirUI:Notify("Bắt đầu", "Script đã được kích hoạt!", "rocket", "Success")
        CreateConfettiBurst(Window._Main, 30)
    end
})

-- ============================================
-- 4. GROUP 1: TỰ ĐỘNG
-- ============================================
local autoGroup = Window:CreateTabGroup("⚡ Tự Động", true)

local farmTab = autoGroup:CreateTab("Farm", "zap")
farmTab:CreateToggle({
    Name = "Bật Farm",
    Default = false,
    Callback = function(s)
        NoirUI:Notify("Farm", s and "✅ Đã bật!" or "❌ Đã tắt!", "zap", s and "Success" or nil)
    end
})

farmTab:CreateSlider({
    Name = "Tốc Độ Farm",
    range = {1, 10},
    Default = 5,
    Callback = function(v) print("Tốc độ farm:", v) end
})

local combatTab = autoGroup:CreateTab("Chiến Đấu", "sword")
combatTab:CreateToggle({
    Name = "Auto Attack",
    Default = false,
    Callback = function(s) print("Auto Attack:", s) end
})

-- ============================================
-- 5. GROUP 2: CÀI ĐẶT DYNAMIC
-- ============================================
local settingsGroup = Window:CreateTabGroup("⚙️ Cài Đặt", false)

local uiTab = settingsGroup:CreateTab("Giao Diện", "palette")

-- Accent
uiTab:CreateSection("🎨 Màu Chủ Đạo")
uiTab:CreateColorPicker({
    Name = "Chọn màu accent",
    Default = Color3.fromRGB(255, 200, 50),
    Callback = function(c)
        Window:SetAccent(c)
        NoirUI:Notify("Accent", "Đã cập nhật!", "check", "Success")
    end
})

-- Theme
uiTab:CreateSection("🎭 Theme")
uiTab:CreateDropdown({
    Name = "Chọn Theme",
    Options = {
        "default", "demonSlayer", "jujutsuKaisen",
        "naruto", "attackOnTitan", "onePiece",
        "myHeroAcademia", "dragonBall", "swordArtOnline",
        "cyberpunk", "vaporwave"
    },
    Default = "default",
    Callback = function(t)
        Window:ApplyTheme(t)
        NoirUI:Notify("Theme", "Đã cập nhật: " .. t, "palette", "Success")
    end
})

-- Blur
uiTab:CreateSection("🌫️ Blur")
uiTab:CreateSlider({
    Name = "Độ mờ",
    range = {0, 100},
    increment = 5,
    Default = 20,
    Callback = function(v)
        Window:SetBlur(v / 100)
    end
})

-- Title
uiTab:CreateSection("📝 Tiêu đề")
uiTab:CreateTextBox({
    Name = "Tiêu đề mới",
    Default = "Script Hub Pro",
    Callback = function(t)
        Window:SetTitle(t)
    end
})

-- ============================================
-- 6. GROUP 3: COMPONENTS
-- ============================================
local compGroup = Window:CreateTabGroup("🧩 Components", true)

local gridTab = compGroup:CreateTab("Grid & Icons", "grid")

-- Icon Grid
gridTab:CreateSection("📱 Icon Grid")
local grid = gridTab:CreateHorizontalGrid(
    gridTab._currentSectionContent or gridTab.ContentFrame,
    4,
    UDim2.new(0, 55, 0, 55),
    UDim2.new(0, 8, 0, 8)
)

local icons = {"home", "settings", "music", "palette", "zap", "sword", "sun", "moon"}
for _, name in ipairs(icons) do
    gridTab:CreateIconButton(grid, name, nil, 40, Color3.fromRGB(40, 40, 55), 18)
end

-- Progress Bar
local progTab = compGroup:CreateTab("Progress", "chart")
progTab:CreateSection("📊 Progress Bar")

local bar, update = progTab:CreateProgressBar(0, 100)
progTab:CreateButton({
    Name = "➡️ Tăng",
    Align = true,
    Callback = function()
        local current = tonumber(bar:FindFirstChild("TextLabel").Text:gsub("%%", "")) or 0
        update(math.min(current + 10, 100), 100)
    end
})

-- ============================================
-- 7. ĐĂNG KÝ LỆNH
-- ============================================
NoirUI:RegisterCommand("help", function(args)
    NoirUI:Notify("📖 Trợ giúp",
        "farm on/off - Bật/tắt farm\nmusic play - Phát nhạc\nstats - Thống kê",
        "help-circle")
end)

NoirUI:RegisterCommand("farm", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Farm", "✅ Đã bật!", "zap", "Success")
    elseif state == "off" then
        NoirUI:Notify("Farm", "❌ Đã tắt!", "zap")
    else
        NoirUI:Notify("Farm", "⚠️ Dùng: farm on/off")
    end
end)

NoirUI:RegisterCommand("music", function(args)
    local action = args[1] and args[1]:lower() or "help"
    if action == "play" then
        NoirUI:StartMusic()
        NoirUI:Notify("Nhạc", "▶ Đang phát!", "music", "Success")
    elseif action == "pause" then
        NoirUI:PauseMusic()
        NoirUI:Notify("Nhạc", "⏸ Đã tạm dừng!", "pause")
    elseif action == "stop" then
        NoirUI:StopMusic()
        NoirUI:Notify("Nhạc", "⏹ Đã dừng!", "stop")
    elseif action == "volume" then
        local vol = tonumber(args[2])
        if vol and vol >= 0 and vol <= 100 then
            NoirUI:SetMusicVolume(vol / 100)
            NoirUI:Notify("Nhạc", "🔊 Âm lượng: " .. vol .. "%", "volume-2", "Success")
        else
            NoirUI:Notify("Nhạc", "⚠️ Dùng: music volume 50", nil, "Error")
        end
    else
        NoirUI:Notify("Nhạc", "⚠️ Các lệnh: play, pause, stop, volume [0-100]")
    end
end)

-- ============================================
-- 8. THÔNG BÁO KHỞI ĐỘNG
-- ============================================
task.wait(1)
NoirUI:Notify("🚀 Script Hub Pro v3.0", "Đã tải thành công!\nGõ help để xem lệnh", "rocket", "Success")

print("✅ Script Hub Pro v3.0 đã sẵn sàng!")
```

---

🎨 Icon List

<div align="center">

Icon Tên Icon Tên
🏠 home ⚙️ settings
📁 folder 💡 lightbulb
🎵 music 🎨 palette
☀️ sun 🌙 moon
🔔 bell ❌ x
✅ check 📋 clipboard
🔄 refresh-cw 💀 skull
🚀 rocket 📊 chart
⭐ star ❤️ heart
🔍 search 📦 package
🎯 target 🛠️ tool
🖥️ monitor 📱 smartphone
🔗 link 📌 pin
🎮 gamepad 🏆 trophy
👤 user 👥 users
🔒 lock 🔓 unlock
📝 edit 🗑️ trash
📤 upload 📥 download
📊 chart 🔄 rotate-cw

</div>

---

💡 Mẹo & Thủ Thuật

1. Tạo UI Với Nhiều TabGroup

```lua
-- Group 1: Tự động
local autoGroup = Window:CreateTabGroup("⚡ Tự Động", true)
autoGroup:CreateTab("Farm", "zap")
autoGroup:CreateTab("Combat", "sword")

-- Group 2: Cài đặt
local settingsGroup = Window:CreateTabGroup("⚙️ Cài Đặt", false)
settingsGroup:CreateTab("UI", "palette")
settingsGroup:CreateTab("Sound", "volume-2")

-- Group 3: Components
local compGroup = Window:CreateTabGroup("🧩 Components", true)
compGroup:CreateTab("Grid", "grid")
compGroup:CreateTab("Progress", "chart")

-- Tab Root
Window:CreateTab("🏠 Home", "home")
```

2. Sử Dụng Undo/Redo

```lua
-- Lưu state
Window:PushHistory({ value = someValue })

-- Undo
Window:Undo(function(state)
    print("Undo:", state)
end)

-- Redo
Window:Redo(function(state)
    print("Redo:", state)
end)
```

3. Tạo Progress Bar Động

```lua
local bar, update = tab:CreateProgressBar(0, 100)

task.spawn(function()
    for i = 1, 100 do
        task.wait(0.05)
        update(i, 100)
    end
end)
```

4. Thêm Icon Button Vào Grid

```lua
local grid = tab:CreateHorizontalGrid(parent, 4)
local icons = {"home", "settings", "music", "palette"}
for _, icon in ipairs(icons) do
    tab:CreateIconButton(grid, icon, nil, 40)
end
```

5. Lưu Cài Đặt Người Dùng

```lua
-- Lưu settings
local function saveSettings()
    local data = {
        accent = Window:GetAccent(),
        theme = Window:GetCurrentTheme(),
        blur = 0.2,
    }
    if writefile then
        writefile("settings.json", game:GetService("HttpService"):JSONEncode(data))
    end
end

-- Load settings
local function loadSettings()
    if isfile and isfile("settings.json") then
        local data = game:GetService("HttpService"):JSONDecode(readfile("settings.json"))
        if data.accent then Window:SetAccent(data.accent) end
        if data.theme then Window:ApplyTheme(data.theme) end
        if data.blur then Window:SetBlur(data.blur) end
    end
end
```

6. Tạo UI Với Hiệu Ứng Đẹp

```lua
local Window = NoirUI:CreateWindow({
    Name = "Beautiful UI",
    UseRipple = true,    -- Gợn sóng khi click
    UseNeon = true,      -- Viền neon
    UseParticles = true, -- Hạt nền
    UseTyping = true,    -- Đánh chữ
    UseConfetti = true,  -- Pháo hoa
})
```

---

🔧 Khắc Phục Sự Cố

Vấn Đề 1: UI không hiển thị

Nguyên nhân: Executor không hỗ trợ CoreGui hoặc lỗi load.

Cách khắc phục:

```lua
-- Thử đặt UI vào PlayerGui
if not pcall(function() sc['Parent'] = game:GetService("CoreGui") end) then
    sc['Parent'] = game.Players.LocalPlayer.PlayerGui
end
```

Vấn Đề 2: Hiệu ứng không hoạt động

Nguyên nhân: Chưa bật hiệu ứng trong settings.

Cách khắc phục:

```lua
local Window = NoirUI:CreateWindow({
    UseRipple = true,  -- Phải bật
    UseNeon = true,    -- Phải bật
})
```

Vấn Đề 3: Âm thanh không phát

Nguyên nhân: Executor không hỗ trợ Sound hoặc volume = 0.

Cách khắc phục:

```lua
NoirUI:ToggleSound(true)
NoirUI:SetVolume(1)
NoirUI:SetCustomSound("Click", "rbxassetid://9120155391")
```

Vấn Đề 4: Theme không áp dụng

Nguyên nhân: Theme không tồn tại hoặc lỗi tên.

Cách khắc phục:

```lua
-- Kiểm tra theme có tồn tại không
if NoirUI.Themes[themeName] then
    Window:ApplyTheme(themeName)
else
    print("Theme không tồn tại!")
    -- Hiển thị danh sách theme có sẵn
    for name, _ in pairs(NoirUI.Themes) do
        print("- " .. name)
    end
end
```

Vấn Đề 5: Lỗi khi tải UI

Nguyên nhân: Kết nối mạng kém hoặc file bị thay đổi.

Cách khắc phục:

```lua
-- Sử dụng pcall để bắt lỗi
local success, err = pcall(function()
    local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirNotFun/NUI/refs/heads/main/ui.lua"))()
end)

if not success then
    warn("Lỗi tải NoirUI:", err)
    -- Thử load từ backup hoặc retry
end
```

---

📝 License

MIT License - Free to use and modify.

---

🙏 Credits

· Developer: NoirNF
· Contributors: Adono
· UI Design: NoirNF

---

<div align="center">

🌟 Star this repository if you find it useful!

https://img.shields.io/github/stars/NoirNotFun/NUI?style=social
https://img.shields.io/github/forks/NoirNotFun/NUI?style=social

Made with ❤️ by NoirNF

</div>
