📘 NoirUI V3 Ultimate - Hướng Dẫn Đầy Đủ Nhất

---

🚀 Cài Đặt

```lua
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/ui.lua"))()
```

---

⚙️ Tạo Window

```lua
local Window = NoirUI:CreateWindow({
    -- ============================================
    -- CORE - THAM SỐ CỐT LÕI
    -- ============================================
    
    Name = "NOIR HUB",                              -- string: Tiêu đề cửa sổ
    Accent = Color3.fromRGB(170, 85, 255),         -- Color3: Màu chủ đạo (viền, glow, nút, tab active)
    AutoContrast = false,                          -- bool: Tự động điều chỉnh màu chữ tương phản với nền
    UseGlow = false,                               -- bool: Bật hiệu ứng glow aura xung quanh cửa sổ
    Icon = nil,                                    -- string/number: Icon cho nút float (tên Lucide hoặc rbxassetid)
    LogoID = nil,                                  -- string/number: Logo hiển thị trên header
    DefaultPosition = UDim2.new(0.5, -210, 0.5, -150), -- UDim2: Vị trí khởi tạo cửa sổ chính
    FloatDefaultPosition = UDim2.new(0, 15, 0.5, -22), -- UDim2: Vị trí nút float
    FloatSize = 45,                                -- number: Kích thước nút float
    FloatIconSize = 24,                            -- number: Kích thước icon trong nút float
    FloatCornerRadius = 12,                        -- number: Độ bo tròn nút float

    -- ============================================
    -- MÀU NỀN & BLUR
    -- ============================================
    
    MainBgColor = Color3.fromRGB(10, 10, 10),      -- Color3: Màu nền chính của window
    MainBgTransparency = 0,                        -- number: Độ trong suốt nền chính (0-1)
    MainBlur = 0,                                  -- number: Lớp tối phủ lên nền chính (0-1). 0=trong suốt, 1=đen hoàn toàn
    LoadingBlur = 0,                               -- number: Lớp tối màn hình loading (0-1)
    KeyBlur = 0,                                   -- number: Lớp tối key system (0-1)
    NotificationBlur = 0,                          -- number: Lớp tối thông báo (0-1)
    ConfirmBlur = 0,                               -- number: Lớp tối hộp thoại xác nhận (0-1)
    ElementBackgroundColor = nil,                  -- Color3: Màu nền chung cho tất cả element (button, toggle, slider, dropdown, v.v.)
    SidebarBackgroundColor = nil,                  -- Color3: Màu nền sidebar (thanh tab bên trái)
    SidebarTransparency = 0.8,                     -- number: Độ trong suốt sidebar (0-1)
    TabBackgroundColor = nil,                      -- Color3: Màu nền từng tab (khi chưa chọn)
    ConfirmBackgroundColor = Color3.fromRGB(15,15,15), -- Color3: Màu nền hộp thoại xác nhận
    NotificationBackgroundColor = Color3.fromRGB(15,15,15), -- Color3: Màu nền thông báo

    -- ============================================
    -- NỀN ẢNH (TÙY CHỌN)
    -- ============================================
    -- Cấu trúc: { Image = "rbxassetid://..." hoặc "http://...", Transparency = 0.5 }
    
    Background = nil,                              -- table: Ảnh nền cửa sổ chính
    LoadingBackground = nil,                       -- table: Ảnh nền màn hình loading
    KeyBackground = nil,                           -- table: Ảnh nền key system
    NotificationBackground = nil,                  -- table: Ảnh nền thông báo
    FloatBackground = nil,                         -- table: Ảnh nền nút float

    -- ============================================
    -- KEY SYSTEM
    -- ============================================
    
    KeySystem = false,                             -- bool: Bật hệ thống key
    KeySettings = {
        Title = "KEY SYSTEM",                      -- string: Tiêu đề cửa sổ key
        Subtitle = "Nhập key",                     -- string: Phụ đề
        Note = "Liên hệ admin",                    -- string: Ghi chú
        Key = "password",                          -- string/table: Key hoặc danh sách key {"key1","key2"}
        SaveKey = false,                           -- bool: Lưu key vào file (nếu executor hỗ trợ)
        FileName = "NoirKey"                       -- string: Tên file lưu key
    },

    -- ============================================
    -- NHẠC NỀN
    -- ============================================
    
    BackgroundMusic = {
        Enabled = false,                           -- bool: Bật nhạc nền
        AutoPlay = false,                          -- bool: Tự động phát khi UI mở
        Volume = 0.3,                              -- number: Âm lượng nhạc (0-1)
        SingleTrack = nil,                         -- number: ID bài hát đơn (rbxassetid)
        Playlist = {},                             -- table: Danh sách ID bài hát {id1, id2, id3, ...}
        LoopMode = "single"                        -- string: Chế độ lặp ("single", "playlist", "off")
    }
})
```

---

📑 Tạo Tab

Tab Root (luôn hiển thị ở sidebar)

```lua
local tab = Window:CreateTab("Tên Tab", "icon")
```

· "Tên Tab" (string): Tên hiển thị trên tab
· "icon" (string/number): Icon của tab (tên Lucide hoặc rbxassetid)

Ví dụ:

```lua
local homeTab = Window:CreateTab("🏠 Trang Chủ", "home")
local settingsTab = Window:CreateTab("⚙️ Cài Đặt", "settings")
local musicTab = Window:CreateTab("🎵 Nhạc", "music")
```

Tab Trong Group (nhóm tab)

```lua
-- Bước 1: Tạo group
local group = Window:CreateTabGroup("Tên Nhóm", true) -- true = mở sẵn, false = đóng

-- Bước 2: Tạo tab trong group
local tab = group:CreateTab("Tên Tab", "icon")
```

Ví dụ:

```lua
local autoGroup = Window:CreateTabGroup("⚡ Tự Động", true)
local farmTab = autoGroup:CreateTab("Farm", "zap")
local combatTab = autoGroup:CreateTab("Chiến Đấu", "sword")

local settingsGroup = Window:CreateTabGroup("⚙️ Cài Đặt", false)
local uiTab = settingsGroup:CreateTab("Giao Diện", "palette")
local soundTab = settingsGroup:CreateTab("Âm Thanh", "volume-2")
```

---

🧩 Các Element Trong Tab

Tất cả element đều hỗ trợ Subtitle để thêm mô tả bên dưới.

---

1. Label (Nhãn văn bản)

Công dụng: Hiển thị văn bản tĩnh hoặc động.

Cấu trúc tham số:

```lua
tab:CreateLabel("Nội dung")                          -- Tĩnh
tab:CreateLabel(function() return "Nội dung" end)    -- Động (cập nhật liên tục)
```

Ví dụ:

```lua
-- Label tĩnh
tab:CreateLabel("Chào mừng bạn đến với Script Hub!")

-- Label động (cập nhật FPS)
local fps = 0
tab:CreateLabel(function() 
    return "⚡ FPS: " .. fps 
end)

-- Label động (cập nhật thời gian)
tab:CreateLabel(function()
    return "🕐 " .. os.date("%H:%M:%S")
end)
```

---

2. Section (Phần nhóm element)

Công dụng: Nhóm các element liên quan vào cùng một khu vực, có thể thu gọn/mở rộng.

Cấu trúc tham số:

```lua
local section = tab:CreateSection("Tên Section", true) -- true: ẩn đường kẻ phân cách
```

Ví dụ:

```lua
-- Section có đường kẻ
local graphicsSection = tab:CreateSection("🎮 Đồ Họa", false)
tab:CreateSlider({ Name = "Chất Lượng", range = {1, 10}, Default = 5 })
tab:CreateToggle({ Name = "VSync", Default = true })

-- Section không có đường kẻ
local soundSection = tab:CreateSection("🔊 Âm Thanh", true)
tab:CreateSlider({ Name = "Âm Lượng", range = {0, 100}, Default = 50 })
tab:CreateToggle({ Name = "Bật Nhạc", Default = true })
```

---

3. Paragraph (Khối văn bản)

Công dụng: Hiển thị văn bản dài, có tiêu đề và nội dung.

Cấu trúc tham số:

```lua
tab:CreateParagraph({
    Title = "Tiêu đề",          -- string: Tiêu đề của khối
    Content = "Nội dung..."     -- string: Nội dung (có thể xuống dòng bằng \n)
})
```

Ví dụ:

```lua
tab:CreateParagraph({
    Title = "📘 Giới Thiệu",
    Content = "Script Hub Pro v2.0\n\nTính năng chính:\n• Farm tự động\n• Auto combat\n• Tùy chỉnh giao diện\n\nDeveloper: NoirNF"
})

tab:CreateParagraph({
    Title = "📌 Hướng Dẫn",
    Content = "1. Chọn tab chức năng\n2. Bật toggle để kích hoạt\n3. Điều chỉnh thông số\n4. Bắt đầu sử dụng!"
})
```

---

4. Button (Nút bấm)

Công dụng: Tạo nút để thực hiện hành động.

Cấu trúc tham số:

```lua
tab:CreateButton({
    Name = "Tên nút",           -- string: Tên hiển thị trên nút
    Subtitle = "Phụ đề",        -- string: (tùy chọn) Mô tả bên dưới
    Align = false,              -- bool: false = căn trái, true = căn giữa
    Callback = function()       -- function: Hàm gọi khi bấm
        print("Đã bấm!") 
    end
})
```

Ví dụ:

```lua
-- Nút căn giữa
tab:CreateButton({
    Name = "🚀 Bắt Đầu Farm",
    Subtitle = "Bắt đầu quá trình farm tự động",
    Align = true,
    Callback = function()
        startFarm()
        NoirUI:Notify("Farm", "Đã bắt đầu farm!", "zap", "Success")
    end
})

-- Nút căn trái
tab:CreateButton({
    Name = "⏹ Dừng Farm",
    Subtitle = "Dừng quá trình farm",
    Align = false,
    Callback = function()
        stopFarm()
        NoirUI:Notify("Farm", "Đã dừng farm!", "stop")
    end
})

-- Nút không có phụ đề
tab:CreateButton({
    Name = "🔍 Kiểm Tra Kết Nối",
    Align = true,
    Callback = function()
        checkConnection()
    end
})
```

---

5. Toggle (Công tắc)

Công dụng: Bật/tắt một tính năng.

Cấu trúc tham số:

```lua
tab:CreateToggle({
    Name = "Tên toggle",        -- string: Tên hiển thị
    Subtitle = "Mô tả",         -- string: (tùy chọn) Mô tả chức năng
    Default = true,             -- bool: true = bật, false = tắt
    Callback = function(state)  -- function: Hàm gọi khi thay đổi trạng thái
        print("Trạng thái:", state) 
    end
})
```

Ví dụ:

```lua
-- Toggle đơn giản
tab:CreateToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        if state then
            NoirUI:Notify("Auto Farm", "✅ Đã bật!", "zap", "Success")
        else
            NoirUI:Notify("Auto Farm", "❌ Đã tắt!", "zap")
        end
    end
})

-- Toggle có phụ đề
tab:CreateToggle({
    Name = "Auto Click",
    Subtitle = "Tự động click chuột mỗi 0.5 giây",
    Default = true,
    Callback = function(state)
        if state then
            startAutoClick()
        else
            stopAutoClick()
        end
    end
})

-- Toggle lưu trạng thái
local autoFarmState = false
tab:CreateToggle({
    Name = "Farm Vật Phẩm",
    Subtitle = "Tự động nhặt vật phẩm",
    Default = false,
    Callback = function(state)
        autoFarmState = state
        print("Trạng thái farm vật phẩm:", state)
    end
})
```

---

6. Slider (Thanh trượt)

Công dụng: Điều chỉnh giá trị số trong một khoảng.

Cấu trúc tham số:

```lua
tab:CreateSlider({
    Name = "Tên slider",        -- string: Tên hiển thị
    Subtitle = "Mô tả",         -- string: (tùy chọn) Mô tả
    range = {0, 100},           -- table: [min, max] giá trị tối thiểu và tối đa
    increment = 5,              -- number: Bước nhảy (giá trị tăng/giảm mỗi lần)
    Default = 50,               -- number: Giá trị mặc định
    Callback = function(value)  -- function: Hàm gọi khi thay đổi giá trị
        print(value) 
    end
})
```

Ví dụ:

```lua
-- Slider âm lượng
tab:CreateSlider({
    Name = "🔊 Âm Lượng",
    Subtitle = "Điều chỉnh âm lượng tổng thể",
    range = {0, 100},
    increment = 5,
    Default = 50,
    Callback = function(value)
        NoirUI:SetVolume(value / 100)
        print("Âm lượng:", value, "%")
    end
})

-- Slider tốc độ
tab:CreateSlider({
    Name = "🎮 Tốc Độ Farm",
    Subtitle = "Tốc độ thực hiện hành động farm (1-10)",
    range = {1, 10},
    increment = 1,
    Default = 5,
    Callback = function(value)
        farmSpeed = value
        print("Tốc độ farm:", value)
    end
})

-- Slider khoảng cách
tab:CreateSlider({
    Name = "📏 Tầm Đánh",
    Subtitle = "Khoảng cách tấn công tối đa (10-100)",
    range = {10, 100},
    increment = 5,
    Default = 50,
    Callback = function(value)
        attackRange = value
        print("Tầm đánh:", value)
    end
})
```

---

7. Color Picker (Chọn màu)

Công dụng: Chọn màu sắc bằng bảng màu.

Cấu trúc tham số:

```lua
tab:CreateColorPicker({
    Name = "Chọn màu",          -- string: Tên hiển thị
    Subtitle = "Mô tả",         -- string: (tùy chọn) Mô tả
    Default = Color3.fromRGB(255, 0, 0), -- Color3: Màu mặc định
    Callback = function(color)  -- function: Hàm gọi khi chọn màu
        print(color) 
    end
})
```

Ví dụ:

```lua
-- Color picker cơ bản
tab:CreateColorPicker({
    Name = "🎨 Màu Chủ Đạo",
    Subtitle = "Thay đổi màu accent của UI",
    Default = Color3.fromRGB(255, 200, 50),
    Callback = function(color)
        updateAccent(color)
        NoirUI:Notify("Màu sắc", "Đã đổi màu chủ đạo!", "check", "Success")
    end
})

-- Color picker cho nhân vật
tab:CreateColorPicker({
    Name = "🌈 Màu Nhân Vật",
    Subtitle = "Thay đổi màu áo nhân vật",
    Default = Color3.fromRGB(100, 150, 255),
    Callback = function(color)
        local char = game.Players.LocalPlayer.Character
        if char then
            char.Shirt.Color3 = color
            NoirUI:Notify("Nhân vật", "Đã đổi màu áo!", "check")
        end
    end
})

-- Color picker cho hiệu ứng
tab:CreateColorPicker({
    Name = "💡 Màu Hiệu Ứng",
    Subtitle = "Màu sắc của hiệu ứng đặc biệt",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        effectColor = color
        print("Màu hiệu ứng:", color)
    end
})
```

---

8. Dropdown (Danh sách thả xuống)

Công dụng: Chọn một tùy chọn từ danh sách.

Danh sách tĩnh:

```lua
tab:CreateDropdown({
    Name = "Chọn",              -- string: Tên hiển thị
    Subtitle = "Danh sách",     -- string: (tùy chọn) Mô tả
    Options = {"A", "B", "C"},  -- table: Danh sách tùy chọn
    Default = "A",              -- string: Tùy chọn mặc định
    Callback = function(option) -- function: Hàm gọi khi chọn
        print(option) 
    end
})
```

Danh sách động (cập nhật theo thời gian thực):

```lua
tab:CreateDropdown({
    Name = "Chọn",              -- string: Tên hiển thị
    Subtitle = "Danh sách động",-- string: (tùy chọn) Mô tả
    GetOptions = function()     -- function: Hàm trả về danh sách tùy chọn
        return {"X", "Y", "Z"} 
    end,
    RefreshOnOpen = true,       -- bool: Cập nhật mỗi khi mở dropdown
    Callback = function(opt)    -- function: Hàm gọi khi chọn
        print(opt) 
    end
})
```

Ví dụ:

```lua
-- Dropdown danh sách ngôn ngữ
tab:CreateDropdown({
    Name = "🌍 Ngôn Ngữ",
    Subtitle = "Chọn ngôn ngữ hiển thị",
    Options = {"Tiếng Việt", "English", "日本語", "한국어"},
    Default = "Tiếng Việt",
    Callback = function(option)
        setLanguage(option)
        NoirUI:Notify("Ngôn ngữ", "Đã chọn: " .. option, "check", "Success")
    end
})

-- Dropdown chọn server (động)
tab:CreateDropdown({
    Name = "🎮 Chọn Server",
    Subtitle = "Chọn server để kết nối",
    GetOptions = function()
        local servers = {}
        for _, v in pairs(game:GetService("TeleportService"):GetServerList()) do
            table.insert(servers, v.Name)
        end
        return servers
    end,
    RefreshOnOpen = true,
    Default = "Server 1",
    Callback = function(option)
        connectToServer(option)
        NoirUI:Notify("Server", "Đã kết nối: " .. option, "check", "Success")
    end
})

-- Dropdown chọn chế độ
tab:CreateDropdown({
    Name = "⚙️ Chế Độ Farm",
    Subtitle = "Chọn chế độ farm",
    Options = {"Nhanh", "Trung Bình", "Chậm", "Tối Ưu"},
    Default = "Trung Bình",
    Callback = function(option)
        farmMode = option
        print("Chế độ farm:", option)
    end
})
```

---

9. TextBox (Ô nhập liệu)

Công dụng: Nhập văn bản hoặc số.

Cấu trúc tham số:

```lua
tab:CreateTextBox({
    Name = "Nhập",              -- string: Tên hiển thị (placeholder)
    Subtitle = "Mô tả",         -- string: (tùy chọn) Mô tả
    Default = "Giá trị mặc định", -- string: Giá trị mặc định
    Callback = function(text)   -- function: Hàm gọi khi nhấn Enter
        print(text) 
    end
})
```

Ví dụ:

```lua
-- TextBox nhập tên
tab:CreateTextBox({
    Name = "✏️ Nhập Tên",
    Subtitle = "Nhập tên người dùng của bạn",
    Default = "",
    Callback = function(text)
        playerName = text
        NoirUI:Notify("Tên", "Đã cập nhật: " .. text, "check", "Success")
    end
})

-- TextBox nhập số
tab:CreateTextBox({
    Name = "🔢 Số Lần Farm",
    Subtitle = "Nhập số lần farm (1-100)",
    Default = "10",
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 and num <= 100 then
            farmCount = num
            NoirUI:Notify("Farm", "Số lần: " .. num, "zap", "Success")
        else
            NoirUI:Notify("Lỗi", "Vui lòng nhập số từ 1-100!", nil, "Error")
        end
    end
})

-- TextBox nhập ID
tab:CreateTextBox({
    Name = "🎵 Nhập ID Bài Hát",
    Subtitle = "Nhập rbxassetid của bài hát",
    Default = "",
    Callback = function(text)
        local id = tonumber(text)
        if id then
            NoirUI:AddMusicTrack(id)
            NoirUI:Notify("Playlist", "Đã thêm bài hát!", "plus", "Success")
        else
            NoirUI:Notify("Lỗi", "ID không hợp lệ!", nil, "Error")
        end
    end
})
```

---

10. RunBox (Thực thi lệnh)

Công dụng: Thực thi lệnh, code Lua hoặc loadstring.

Cấu trúc tham số:

```lua
tab:CreateRunBox({
    Placeholder = "Nhập .cmd, loadstring, hoặc lua code...", -- string: Văn bản gợi ý
    ClearOnExecute = true       -- bool: Tự động xóa nội dung sau khi chạy
})
```

Hỗ trợ:

· Lệnh tùy chỉnh: .command arg1 arg2
· loadstring("...")
· Lua code trực tiếp

Ví dụ:

```lua
-- RunBox cơ bản
tab:CreateRunBox({
    Placeholder = "Nhập .help để xem lệnh...",
    ClearOnExecute = true
})

-- RunBox không xóa nội dung
tab:CreateRunBox({
    Placeholder = "Nhập lệnh hoặc code...",
    ClearOnExecute = false
})

-- Đăng ký lệnh để sử dụng trong RunBox
NoirUI:RegisterCommand("help", function(args)
    local helpText = [[
📖 Danh sách lệnh:
.farm on/off - Bật/tắt farm
.combat on/off - Bật/tắt combat
.sound on/off - Bật/tắt âm thanh
.music play/pause - Điều khiển nhạc
.stats - Xem thống kê
]]
    NoirUI:Notify("📖 Trợ giúp", helpText, "help-circle")
end)

NoirUI:RegisterCommand("farm", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Farm", "✅ Đã bật farm!", "zap", "Success")
    elseif state == "off" then
        NoirUI:Notify("Farm", "❌ Đã tắt farm!", "zap")
    else
        NoirUI:Notify("Farm", "⚠️ Dùng: .farm on/off")
    end
end)
```

---

🔔 Thông Báo (Notification)

Công dụng: Hiển thị thông báo popup.

Cấu trúc:

```lua
NoirUI:Notify("Tiêu đề", "Nội dung", "icon", "soundType")
```

Tham số:

· "Tiêu đề" (string): Tiêu đề thông báo
· "Nội dung" (string): Nội dung thông báo
· "icon" (string/number): Icon (tên Lucide hoặc rbxassetid), có thể để nil
· "soundType" (string): Loại âm thanh ("Success", "Error", "Notification")

Ví dụ:

```lua
-- Thông báo thành công
NoirUI:Notify("✅ Thành công", "Đã lưu cài đặt!", "check", "Success")

-- Thông báo lỗi
NoirUI:Notify("❌ Lỗi", "Không thể kết nối server!", "x", "Error")

-- Thông báo thường
NoirUI:Notify("📢 Thông báo", "Đã cập nhật phiên bản mới!", "bell")

-- Không có icon
NoirUI:Notify("Chào bạn", "Chào mừng bạn đến với script!", nil)

-- Thông báo có icon tùy chỉnh
NoirUI:Notify("🎮 Game", "Đã kết nối thành công!", "rbxassetid://1234567890", "Success")
```

---

🎵 Hệ Thống Nhạc Nền

Cấu hình khi tạo Window

```lua
BackgroundMusic = {
    Enabled = false,          -- bool: Bật nhạc nền
    AutoPlay = false,         -- bool: Tự động phát khi UI mở
    Volume = 0.3,             -- number: Âm lượng nhạc (0-1)
    SingleTrack = nil,        -- number: ID bài hát đơn (rbxassetid)
    Playlist = {},            -- table: Danh sách ID bài hát {id1, id2, id3, ...}
    LoopMode = "single"       -- string: Chế độ lặp ("single", "playlist", "off")
}
```

Các chế độ lặp:

· "single" - Lặp lại bài hát hiện tại
· "playlist" - Phát lần lượt các bài hát trong playlist
· "off" - Không lặp (dừng sau khi phát xong)

Ví dụ cấu hình:

```lua
-- Phát một bài hát duy nhất
BackgroundMusic = {
    Enabled = true,
    AutoPlay = true,
    Volume = 0.5,
    SingleTrack = 1234567890,
    LoopMode = "single"
}

-- Phát playlist
BackgroundMusic = {
    Enabled = true,
    AutoPlay = false,
    Volume = 0.3,
    Playlist = {1234567890, 9876543210, 5555555555},
    LoopMode = "playlist"
}

-- Tắt nhạc
BackgroundMusic = {
    Enabled = false
}
```

Các hàm điều khiển

```lua
NoirUI:StartMusic()                -- Phát nhạc
NoirUI:PauseMusic()                -- Tạm dừng
NoirUI:ResumeMusic()               -- Tiếp tục
NoirUI:StopMusic()                 -- Dừng
NoirUI:SetMusicVolume(0.5)         -- Âm lượng (0-1)
NoirUI:AddMusicTrack(1234567890)   -- Thêm vào playlist
NoirUI:RemoveMusicTrack(1)         -- Xóa theo index
NoirUI:SetMusicLoopMode("playlist") -- Đổi chế độ lặp
```

Ví dụ điều khiển:

```lua
-- Nút phát
tab:CreateButton({
    Name = "▶ Phát Nhạc",
    Align = true,
    Callback = function()
        NoirUI:StartMusic()
        NoirUI:Notify("Nhạc", "Đang phát!", "music", "Success")
    end
})

-- Nút tạm dừng
tab:CreateButton({
    Name = "⏸ Tạm Dừng",
    Align = true,
    Callback = function()
        NoirUI:PauseMusic()
        NoirUI:Notify("Nhạc", "Đã tạm dừng!", "pause")
    end
})

-- Nút dừng
tab:CreateButton({
    Name = "⏹ Dừng",
    Align = true,
    Callback = function()
        NoirUI:StopMusic()
        NoirUI:Notify("Nhạc", "Đã dừng!", "stop")
    end
})

-- Slider âm lượng nhạc
tab:CreateSlider({
    Name = "🎵 Âm Lượng Nhạc",
    range = {0, 100},
    increment = 5,
    Default = 30,
    Callback = function(value)
        NoirUI:SetMusicVolume(value / 100)
    end
})

-- Dropdown chọn chế độ lặp
tab:CreateDropdown({
    Name = "🔄 Chế Độ Lặp",
    Options = {"single", "playlist", "off"},
    Default = "single",
    Callback = function(mode)
        NoirUI:SetMusicLoopMode(mode)
        NoirUI:Notify("Chế độ", "Đã chọn: " .. mode, "repeat", "Success")
    end
})
```

---

🔊 Âm Thanh Tương Tác

Tùy chỉnh âm thanh

```lua
NoirUI:SetCustomSound("Click", "rbxassetid://123")        -- Âm thanh khi click
NoirUI:SetCustomSound("Tab", "rbxassetid://456")          -- Âm thanh khi chuyển tab
NoirUI:SetCustomSound("Element", "rbxassetid://789")      -- Âm thanh khi tương tác element
NoirUI:SetCustomSound("Open", "...")                      -- Âm thanh khi mở UI
NoirUI:SetCustomSound("Close", "...")                     -- Âm thanh khi đóng UI
NoirUI:SetCustomSound("Notification", "...")              -- Âm thanh thông báo
NoirUI:SetCustomSound("Error", "...")                     -- Âm thanh lỗi
NoirUI:SetCustomSound("Success", "...")                   -- Âm thanh thành công
```

Điều khiển

```lua
NoirUI:ToggleSound(true)   -- Bật/tắt âm thanh
NoirUI:SetVolume(0.8)      -- Âm lượng (0-1)
```

Ví dụ:

```lua
-- Toggle bật/tắt âm thanh
tab:CreateToggle({
    Name = "🔊 Bật Âm Thanh",
    Subtitle = "Bật/tắt âm thanh tương tác",
    Default = true,
    Callback = function(state)
        NoirUI:ToggleSound(state)
        NoirUI:Notify("Âm thanh", state and "Đã bật!" or "Đã tắt!", "volume-2")
    end
})

-- Slider âm lượng
tab:CreateSlider({
    Name = "🔊 Âm Lượng",
    range = {0, 100},
    increment = 5,
    Default = 50,
    Callback = function(value)
        NoirUI:SetVolume(value / 100)
    end
})

-- TextBox nhập ID âm thanh
tab:CreateTextBox({
    Name = "🎵 Âm Thanh Click",
    Subtitle = "Nhập rbxassetid của âm thanh click",
    Default = "",
    Callback = function(text)
        local id = tonumber(text)
        if id then
            NoirUI:SetCustomSound("Click", "rbxassetid://" .. id)
            NoirUI:Notify("Âm thanh", "Đã cập nhật!", "check", "Success")
        end
    end
})
```

---

🛠️ Lệnh Tùy Chỉnh (Custom Commands)

Công dụng: Đăng ký lệnh để sử dụng trong RunBox.

```lua
NoirUI:RegisterCommand("tên_lệnh", function(args)
    -- args là bảng chứa các tham số sau tên lệnh
    print("Đã chạy lệnh với args:", args)
end)
```

Ví dụ:

```lua
-- Lệnh help
NoirUI:RegisterCommand("help", function(args)
    local helpText = [[
📖 Danh sách lệnh:
.farm on/off - Bật/tắt farm
.combat on/off - Bật/tắt combat
.sound on/off - Bật/tắt âm thanh
.music play/pause/stop - Điều khiển nhạc
.stats - Xem thống kê
.teleport x y z - Dịch chuyển
]]
    NoirUI:Notify("📖 Trợ giúp", helpText, "help-circle")
end)

-- Lệnh farm
NoirUI:RegisterCommand("farm", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Farm", "✅ Đã bật farm!", "zap", "Success")
    elseif state == "off" then
        NoirUI:Notify("Farm", "❌ Đã tắt farm!", "zap")
    else
        NoirUI:Notify("Farm", "⚠️ Dùng: .farm on/off")
    end
end)

-- Lệnh combat
NoirUI:RegisterCommand("combat", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Chiến đấu", "✅ Đã bật auto combat!", "sword", "Success")
    elseif state == "off" then
        NoirUI:Notify("Chiến đấu", "❌ Đã tắt auto combat!", "sword")
    else
        NoirUI:Notify("Chiến đấu", "⚠️ Dùng: .combat on/off")
    end
end)

-- Lệnh music
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
            NoirUI:Notify("Nhạc", "⚠️ Dùng: .music volume 50", nil, "Error")
        end
    else
        NoirUI:Notify("Nhạc", "⚠️ Các lệnh: play, pause, stop, volume [0-100]")
    end
end)

-- Lệnh teleport
NoirUI:RegisterCommand("teleport", function(args)
    local x = tonumber(args[1])
    local y = tonumber(args[2])
    local z = tonumber(args[3])
    if x and y and z then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(x, y, z)
        NoirUI:Notify("Teleport", "✅ Đã dịch chuyển!", "target", "Success")
    else
        NoirUI:Notify("Lỗi", "⚠️ Dùng: .teleport x y z", nil, "Error")
    end
end)

-- Lệnh stats
NoirUI:RegisterCommand("stats", function(args)
    NoirUI:Notify("📊 Thống kê", 
        "Online: 1,234\nĐã chạy: 12h 30m\nFPS: 60\nPing: 30ms", 
        "chart")
end)
```

---

🔑 Key System

Công dụng: Bảo vệ UI bằng key.

Cấu trúc:

```lua
KeySystem = true,
KeySettings = {
    Title = "KEY SYSTEM",          -- string: Tiêu đề
    Subtitle = "Nhập key",         -- string: Phụ đề
    Note = "Liên hệ admin",        -- string: Ghi chú
    Key = "password",              -- string/table: Key hoặc danh sách key {"key1","key2"}
    SaveKey = false,               -- bool: Lưu key vào file
    FileName = "NoirKey"           -- string: Tên file lưu key
}
```

Ví dụ:

```lua
-- Key đơn
local Window = NoirUI:CreateWindow({
    Name = "Script Pro",
    Accent = Color3.fromRGB(255, 100, 100),
    KeySystem = true,
    KeySettings = {
        Title = "🔑 KEY SYSTEM",
        Subtitle = "Vui lòng nhập key để sử dụng",
        Note = "Liên hệ Discord: @admin để lấy key",
        Key = "freekey123",
        SaveKey = true,
        FileName = "ScriptKey"
    }
})

-- Nhiều key
local Window = NoirUI:CreateWindow({
    Name = "Script Pro",
    KeySystem = true,
    KeySettings = {
        Title = "🔑 KEY SYSTEM",
        Subtitle = "Vui lòng nhập key",
        Note = "Key: free, pro, premium",
        Key = {"freekey", "prokey", "premiumkey"},
        SaveKey = true,
        FileName = "ScriptKey"
    }
})
```

---

🗑️ Hủy UI

Công dụng: Xóa toàn bộ UI khỏi màn hình.

```lua
NoirUI:Destroy()
```

Ví dụ:

```lua
-- Nút đóng UI
tab:CreateButton({
    Name = "💀 Đóng UI",
    Align = true,
    Callback = function()
        NoirUI:Destroy()
    end
})

-- Tự động hủy sau 5 phút
task.delay(300, function()
    NoirUI:Destroy()
end)
```

---

📝 Ví Dụ Đầy Đủ

```lua
-- ============================================
-- 1. TẢI NOIRUI
-- ============================================
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/ui.lua"))()

-- ============================================
-- 2. TẠO WINDOW
-- ============================================
local Window = NoirUI:CreateWindow({
    -- Core
    Name = "Script Hub Pro",
    Accent = Color3.fromRGB(255, 200, 50),
    AutoContrast = true,
    UseGlow = true,
    Icon = "home",
    FloatSize = 50,
    
    -- Màu nền & Blur
    MainBgColor = Color3.fromRGB(10, 10, 15),
    MainBlur = 0.2,
    ElementBackgroundColor = Color3.fromRGB(25, 25, 35),
    SidebarBackgroundColor = Color3.fromRGB(15, 15, 25),
    TabBackgroundColor = Color3.fromRGB(30, 30, 45),
    
    -- Nhạc nền
    BackgroundMusic = {
        Enabled = true,
        AutoPlay = false,
        Volume = 0.3,
        SingleTrack = 1234567890,
        LoopMode = "single"
    }
})

-- ============================================
-- 3. TẠO TAB ROOT
-- ============================================
local homeTab = Window:CreateTab("🏠 Trang Chủ", "home")
homeTab:CreateParagraph({
    Title = "Script Hub Pro",
    Content = "Chào mừng bạn đến với Script Hub Pro!\n\n✨ Tính năng:\n• Farm tự động\n• Auto combat\n• Tùy chỉnh giao diện\n• Nhạc nền\n\n📌 Sử dụng TabGroup để tổ chức!"
})

homeTab:CreateButton({
    Name = "🚀 Bắt Đầu",
    Align = true,
    Callback = function()
        NoirUI:Notify("Bắt đầu", "Script đã được kích hoạt!", "rocket", "Success")
    end
})

-- ============================================
-- 4. TẠO GROUP 1: TỰ ĐỘNG
-- ============================================
local autoGroup = Window:CreateTabGroup("⚡ Tự Động", true)

-- Tab Farm
local farmTab = autoGroup:CreateTab("Farm", "zap")
farmTab:CreateToggle({
    Name = "Bật Farm",
    Subtitle = "Tự động farm khi bật",
    Default = false,
    Callback = function(state)
        NoirUI:Notify("Farm", state and "✅ Đã bật!" or "❌ Đã tắt!", "zap", state and "Success" or nil)
    end
})

farmTab:CreateToggle({
    Name = "Farm Vật Phẩm",
    Subtitle = "Tự động nhặt vật phẩm",
    Default = true,
    Callback = function(state) print("Farm vật phẩm:", state) end
})

farmTab:CreateSlider({
    Name = "Tốc Độ Farm",
    range = {1, 10},
    Default = 5,
    Callback = function(value) print("Tốc độ farm:", value) end
})

farmTab:CreateDropdown({
    Name = "Chọn Vị Trí Farm",
    Options = {"Vị trí 1", "Vị trí 2", "Vị trí 3"},
    Default = "Vị trí 1",
    Callback = function(option)
        NoirUI:Notify("Đã chọn", "Vị trí: " .. option)
    end
})

-- Tab Combat
local combatTab = autoGroup:CreateTab("Chiến Đấu", "sword")
combatTab:CreateToggle({
    Name = "Auto Attack",
    Subtitle = "Tự động tấn công",
    Default = false,
    Callback = function(state) print("Auto Attack:", state) end
})

combatTab:CreateToggle({
    Name = "Auto Block",
    Subtitle = "Tự động phòng thủ",
    Default = true,
    Callback = function(state) print("Auto Block:", state) end
})

combatTab:CreateSlider({
    Name = "Tầm Đánh",
    range = {10, 100},
    Default = 50,
    Callback = function(value) print("Tầm đánh:", value) end
})

-- ============================================
-- 5. TẠO GROUP 2: CÀI ĐẶT
-- ============================================
local settingsGroup = Window:CreateTabGroup("⚙️ Cài Đặt", false)

-- Tab Giao Diện
local uiTab = settingsGroup:CreateTab("Giao Diện", "palette")
uiTab:CreateColorPicker({
    Name = "Màu Chủ Đạo",
    Subtitle = "Thay đổi màu accent",
    Default = Color3.fromRGB(255, 200, 50),
    Callback = function(color)
        NoirUI:Notify("Màu sắc", "Đã đổi màu chủ đạo!", "check", "Success")
    end
})

uiTab:CreateSlider({
    Name = "Độ Mờ (Blur)",
    range = {0, 100},
    Default = 20,
    Callback = function(value) print("Blur:", value/100) end
})

-- Tab Âm Thanh
local soundTab = settingsGroup:CreateTab("Âm Thanh", "volume-2")
soundTab:CreateToggle({
    Name = "Bật Âm Thanh",
    Subtitle = "Bật/tắt âm thanh tương tác",
    Default = true,
    Callback = function(state)
        NoirUI:ToggleSound(state)
    end
})

soundTab:CreateSlider({
    Name = "Âm Lượng",
    range = {0, 100},
    Default = 50,
    Callback = function(value)
        NoirUI:SetVolume(value/100)
    end
})

soundTab:CreateDropdown({
    Name = "Âm Thanh Click",
    Options = {"Mặc định", "Click 1", "Click 2", "Click 3"},
    Default = "Mặc định",
    Callback = function(option)
        NoirUI:Notify("Âm thanh", "Đã chọn: " .. option)
    end
})

-- ============================================
-- 6. TẠO GROUP 3: NHẠC NỀN
-- ============================================
local musicGroup = Window:CreateTabGroup("🎵 Nhạc Nền", true)

-- Tab Phát Nhạc
local playerTab = musicGroup:CreateTab("Phát Nhạc", "music")
playerTab:CreateButton({
    Name = "▶ Play",
    Align = true,
    Callback = function()
        NoirUI:StartMusic()
        NoirUI:Notify("Nhạc", "Đang phát!", "music", "Success")
    end
})

playerTab:CreateButton({
    Name = "⏸ Pause",
    Align = true,
    Callback = function()
        NoirUI:PauseMusic()
        NoirUI:Notify("Nhạc", "Đã tạm dừng!", "pause")
    end
})

playerTab:CreateButton({
    Name = "⏹ Stop",
    Align = true,
    Callback = function()
        NoirUI:StopMusic()
        NoirUI:Notify("Nhạc", "Đã dừng!", "stop")
    end
})

playerTab:CreateSlider({
    Name = "Âm Lượng Nhạc",
    range = {0, 100},
    Default = 30,
    Callback = function(value)
        NoirUI:SetMusicVolume(value/100)
    end
})

-- Tab Playlist
local playlistTab = musicGroup:CreateTab("Playlist", "list")
playlistTab:CreateTextBox({
    Name = "Nhập ID Bài Hát",
    Subtitle = "Nhập rbxassetid",
    Default = "",
    Callback = function(text)
        local id = tonumber(text)
        if id then
            NoirUI:AddMusicTrack(id)
            NoirUI:Notify("Playlist", "Đã thêm bài hát!", "plus", "Success")
        else
            NoirUI:Notify("Lỗi", "ID không hợp lệ!", nil, "Error")
        end
    end
})

playlistTab:CreateDropdown({
    Name = "Chế Độ Lặp",
    Options = {"single", "playlist", "off"},
    Default = "single",
    Callback = function(mode)
        NoirUI:SetMusicLoopMode(mode)
    end
})

-- ============================================
-- 7. TẠO GROUP 4: TIỆN ÍCH
-- ============================================
local utilGroup = Window:CreateTabGroup("🛠 Tiện Ích", true)

-- Tab Lệnh
local cmdTab = utilGroup:CreateTab("Lệnh", "terminal")
cmdTab:CreateRunBox({
    Placeholder = "Nhập .help để xem lệnh...",
    ClearOnExecute = true
})

cmdTab:CreateParagraph({
    Title = "📖 Lệnh Có Sẵn",
    Content = ".help - Hiển thị trợ giúp\n.farm on/off - Bật/tắt farm\n.combat on/off - Bật/tắt chiến đấu\n.sound on/off - Bật/tắt âm thanh\n.music play/pause/stop - Điều khiển nhạc\n.stats - Xem thống kê"
})

-- Tab Thông Tin
local infoTab = utilGroup:CreateTab("Thông Tin", "info")
infoTab:CreateParagraph({
    Title = "📘 Script Hub Pro v2.0",
    Content = "Chào mừng bạn đến với Script Hub Pro!\n\n🔹 Sử dụng TabGroup để tổ chức các tab theo nhóm\n🔹 Click vào tiêu đề group để thu gọn/mở rộng\n🔹 Tất cả tab vẫn hoạt động bình thường\n🔹 Tùy chỉnh màu sắc, blur, hiệu ứng\n\n📌 Phiên bản: 2.0\n👨‍💻 Developer: NoirNF"
})

-- ============================================
-- 8. ĐĂNG KÝ LỆNH TÙY CHỈNH
-- ============================================
NoirUI:RegisterCommand("help", function(args)
    local helpText = [[
📖 Danh sách lệnh:

.farm on/off     - Bật/tắt farm
.combat on/off   - Bật/tắt chiến đấu
.sound on/off    - Bật/tắt âm thanh
.music play      - Phát nhạc
.music pause     - Tạm dừng nhạc
.music stop      - Dừng nhạc
.music volume 50 - Đặt âm lượng (0-100)
.stats           - Xem thống kê
.help            - Hiển thị trợ giúp này
]]
    NoirUI:Notify("📖 Trợ giúp", helpText, "help-circle")
end)

NoirUI:RegisterCommand("farm", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Farm", "✅ Đã bật farm!", "zap", "Success")
    elseif state == "off" then
        NoirUI:Notify("Farm", "❌ Đã tắt farm!", "zap")
    else
        NoirUI:Notify("Farm", "⚠️ Dùng: .farm on/off")
    end
end)

NoirUI:RegisterCommand("combat", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:Notify("Chiến đấu", "✅ Đã bật auto combat!", "sword", "Success")
    elseif state == "off" then
        NoirUI:Notify("Chiến đấu", "❌ Đã tắt auto combat!", "sword")
    else
        NoirUI:Notify("Chiến đấu", "⚠️ Dùng: .combat on/off")
    end
end)

NoirUI:RegisterCommand("sound", function(args)
    local state = args[1] and args[1]:lower() or "toggle"
    if state == "on" then
        NoirUI:ToggleSound(true)
        NoirUI:Notify("Sound", "🔊 Đã bật âm thanh!", "volume-2", "Success")
    elseif state == "off" then
        NoirUI:ToggleSound(false)
        NoirUI:Notify("Sound", "🔇 Đã tắt âm thanh!", "volume-x")
    else
        NoirUI:Notify("Sound", "⚠️ Dùng: .sound on/off")
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
            NoirUI:SetMusicVolume(vol/100)
            NoirUI:Notify("Nhạc", "🔊 Âm lượng: " .. vol .. "%", "volume-2", "Success")
        else
            NoirUI:Notify("Nhạc", "⚠️ Dùng: .music volume 50", nil, "Error")
        end
    else
        NoirUI:Notify("Nhạc", "⚠️ Các lệnh: play, pause, stop, volume [0-100]")
    end
end)

NoirUI:RegisterCommand("stats", function(args)
    NoirUI:Notify("📊 Thống kê", "Online: 1,234\nĐã chạy: 12h 30m\nFPS: 60\nPing: 30ms", "chart")
end)

-- ============================================
-- 9. THÔNG BÁO KHỞI ĐỘNG
-- ============================================
task.wait(1)
NoirUI:Notify("🚀 Script Hub Pro", "Đã tải thành công!\nGõ .help để xem lệnh", "rocket", "Success")

print("✅ Script Hub Pro đã sẵn sàng!")
```

---

🎨 Bảng Icon

Icon phổ biến

```
🏠 home           ⚙️ settings        📁 folder
💡 lightbulb      🎵 music           🎨 palette
☀️ sun            🌙 moon            🔔 bell
❌ x              ✅ check           📋 clipboard
🔄 refresh-cw     💀 skull           🚀 rocket
📊 chart          ⭐ star            ❤️ heart
🔍 search         📦 package         🎯 target
🛠️ tool          🖥️ monitor        📱 smartphone
🔗 link           📌 pin             🎮 gamepad
🏆 trophy         👤 user            👥 users
🔒 lock           🔓 unlock          📝 edit
🗑️ trash         📤 upload          📥 download
🔄 rotate-cw      🔃 rotate-ccw     💰 dollar
🏷️ tag           🎯 target          🏹 crosshair
```

Cách xem tất cả icon

```lua
local LucideIcons = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/icons.lua"))()

-- In tất cả icon
for name, id in pairs(LucideIcons) do
    print(name, id)
end

-- Tìm kiếm icon
local searchTerm = "home"
for name, id in pairs(LucideIcons) do
    if string.find(name:lower(), searchTerm:lower()) then
        print("Found: " .. name .. " = " .. id)
    end
end
```

---

💡 Mẹo & Thủ Thuật

1. Tạo UI đẹp với màu sắc

```lua
-- Sử dụng màu pastel
local pastelColors = {
    pink = Color3.fromRGB(255, 182, 193),
    lavender = Color3.fromRGB(230, 230, 250),
    mint = Color3.fromRGB(189, 252, 201),
    peach = Color3.fromRGB(255, 218, 185),
    sky = Color3.fromRGB(135, 206, 235)
}

Window:CreateWindow({
    Accent = pastelColors.sky,
    ElementBackgroundColor = pastelColors.lavender,
    -- ...
})
```

2. Tự động cập nhật Label

```lua
local count = 0
local label = tab:CreateLabel(function()
    return "Số lần click: " .. count
end)

-- Cập nhật giá trị
task.spawn(function()
    while true do
        task.wait(1)
        count = count + 1
    end
end)
```

3. Tạo Custom Command với tham số

```lua
NoirUI:RegisterCommand("tp", function(args)
    local x = tonumber(args[1])
    local y = tonumber(args[2])
    local z = tonumber(args[3])
    if x and y and z then
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(x, y, z)
        NoirUI:Notify("Teleport", "✅ Đã dịch chuyển!", "target", "Success")
    else
        NoirUI:Notify("Lỗi", "⚠️ Dùng: .tp x y z", nil, "Error")
    end
end)
```

4. Tạo UI với nhiều group

```lua
-- Group 1: Tự động
local autoGroup = Window:CreateTabGroup("⚡ Tự Động", true)
autoGroup:CreateTab("Farm", "zap")
autoGroup:CreateTab("Combat", "sword")

-- Group 2: Cài đặt
local settingsGroup = Window:CreateTabGroup("⚙️ Cài Đặt", false)
settingsGroup:CreateTab("UI", "palette")
settingsGroup:CreateTab("Sound", "volume-2")

-- Group 3: Tiện ích
local utilGroup = Window:CreateTabGroup("🛠 Tiện Ích", true)
utilGroup:CreateTab("Commands", "terminal")
utilGroup:CreateTab("Info", "info")

-- Tab Root
Window:CreateTab("🏠 Home", "home")
```

5. Lưu cài đặt người dùng

```lua
-- Lưu vào DataStore hoặc file
local function saveSettings()
    local settings = {
        farmEnabled = farmState,
        volume = volumeValue,
        accent = accentColor
    }
    -- Lưu vào file nếu executor hỗ trợ
    if writefile then
        writefile("settings.json", game:GetService("HttpService"):JSONEncode(settings))
    end
end

-- Tải cài đặt
local function loadSettings()
    if isfile and isfile("settings.json") then
        local data = game:GetService("HttpService"):JSONDecode(readfile("settings.json"))
        -- Áp dụng settings
    end
end
```

---

🔧 Khắc Phục Sự Cố

Vấn đề 1: UI không hiển thị

Nguyên nhân: Lỗi executor hoặc CoreGui không hỗ trợ.
Cách khắc phục:

```lua
-- Thử đặt UI vào PlayerGui
if not pcall(function() sc['Parent'] = game:GetService("CoreGui") end) then
    sc['Parent'] = game.Players.LocalPlayer.PlayerGui
end
```

Vấn đề 2: Icon không hiển thị

Nguyên nhân: Tên icon sai hoặc chưa có trong thư viện.
Cách khắc phục:

```lua
-- Kiểm tra icon có tồn tại không
local iconName = "home"
local LucideIcons = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/icons.lua"))()
if LucideIcons[iconName] then
    print("Icon tồn tại!")
else
    print("Icon không tồn tại, dùng icon mặc định")
end
```

Vấn đề 3: Âm thanh không phát

Nguyên nhân: Executor không hỗ trợ Sound hoặc volume = 0.
Cách khắc phục:

```lua
-- Kiểm tra âm thanh
NoirUI:ToggleSound(true)
NoirUI:SetVolume(1)
NoirUI:SetCustomSound("Click", "rbxassetid://9120155391") -- Sound ID mặc định
```

Vấn đề 4: Lỗi khi tải UI

Nguyên nhân: Kết nối mạng kém hoặc file bị thay đổi.
Cách khắc phục:

```lua
-- Sử dụng pcall để bắt lỗi
local success, err = pcall(function()
    local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/ui.lua"))()
end)

if not success then
    warn("Lỗi tải NoirUI:", err)
    -- Thử load từ backup hoặc retry
end
```

---

📝 Tổng Kết

NoirUI V3 Ultimate là một thư viện mạnh mẽ và linh hoạt, giúp bạn tạo giao diện đẹp mắt cho script Roblox của mình một cách dễ dàng.

📌 Điểm mạnh:

· Giao diện đẹp, hiện đại
· Dễ sử dụng, code ngắn gọn
· Tùy biến cao
· Nhiều tính năng (TabGroup, Key System, Music, v.v.)
· Hỗ trợ nhiều executor

📌 Hướng phát triển:

· Thêm nhiều loại element mới
· Tối ưu hiệu năng
· Hỗ trợ theme tối/sáng

---

Chúc bạn tạo được giao diện đẹp mắt và chuyên nghiệp! 🚀
