📘 NoirUI V3 Ultimate - Full Documentation

---

🚀 Cài Đặt

```lua
local NoirUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoirGoodBoi/UI/refs/heads/main/ui.lua"))()
```

---

⚙️ Tạo Cửa Sổ (CreateWindow)

<details>
<summary><b>📌 Nhấn để xem tất cả tham số CreateWindow</b></summary>

🧩 Tham số cốt lõi

· Name (string) – Mặc định: "NOIR HUB" – Tiêu đề cửa sổ
· Accent (Color3) – Mặc định: RGB(170,85,255) – Màu chủ đạo (viền, glow, nút)
· AutoContrast (bool) – Mặc định: false – Tự động điều chỉnh màu chữ tương phản với nền
· UseGlow (bool) – Mặc định: false – Bật hiệu ứng glow aura xung quanh cửa sổ
· Icon (string/number) – Mặc định: nil – Icon cho nút float (tên Lucide hoặc rbxassetid)
· LogoID (string/number) – Mặc định: nil – Logo hiển thị trên header
· DefaultPosition (UDim2) – Mặc định: (0.5,-210,0.5,-150) – Vị trí khởi tạo cửa sổ chính
· FloatDefaultPosition (UDim2) – Mặc định: (0,15,0.5,-22) – Vị trí nút float
· FloatSize (number) – Mặc định: 45 – Kích thước nút float
· FloatIconSize (number) – Mặc định: 24 – Kích thước icon trong float
· FloatCornerRadius (number) – Mặc định: 12 – Độ bo tròn nút float

🎨 Màu nền & Blur

· MainBgColor (Color3) – Mặc định: (10,10,10) – Màu nền chính
· MainBgTransparency (number) – Mặc định: 0 – Độ trong suốt nền chính
· MainBlur (number 0-1) – Mặc định: 0 – Lớp tối phủ lên nền chính
· LoadingBlur (number 0-1) – Mặc định: 0 – Lớp tối màn hình loading
· KeyBlur (number 0-1) – Mặc định: 0 – Lớp tối key system
· NotificationBlur (number 0-1) – Mặc định: 0 – Lớp tối thông báo
· ConfirmBlur (number 0-1) – Mặc định: 0 – Lớp tối hộp thoại xác nhận
· ElementBackgroundColor (Color3) – Mặc định: nil – Màu nền chung cho tất cả element (button, toggle, slider, dropdown...)
· SidebarBackgroundColor (Color3) – Mặc định: nil – Màu nền sidebar (thanh tab bên trái)
· SidebarTransparency (number 0-1) – Mặc định: 0.8 – Độ trong suốt sidebar
· TabBackgroundColor (Color3) – Mặc định: nil – Màu nền từng tab (khi chưa chọn)
· ConfirmBackgroundColor (Color3) – Mặc định: (15,15,15) – Màu nền hộp thoại xác nhận
· NotificationBackgroundColor (Color3) – Mặc định: (15,15,15) – Màu nền thông báo

🖼️ Nền ảnh (tùy chọn)

Cấu trúc: { Image = "rbxassetid://..." hoặc "http://...", Transparency = 0.5 }

· Background – Ảnh nền cửa sổ chính
· LoadingBackground – Ảnh nền loading
· KeyBackground – Ảnh nền key system
· NotificationBackground – Ảnh nền thông báo
· FloatBackground – Ảnh nền nút float

🔑 Key System

· KeySystem (bool) – Mặc định: false – Bật hệ thống key
· KeySettings (table) – Mặc định: nil – Cấu hình key system

Cấu trúc KeySettings:

```lua
{
    Title = "KEY SYSTEM",
    Subtitle = "Vui lòng nhập key",
    Note = "Liên hệ admin để lấy key",
    Key = "mypassword",      -- hoặc {"key1", "key2"}
    SaveKey = true,          -- lưu vào file
    FileName = "NoirKey"     -- tên file lưu (không cần đuôi)
}
```

🎵 Background Music

· BackgroundMusic (table) – Mặc định: nil – Cấu hình nhạc nền

Cấu trúc BackgroundMusic:

```lua
{
    Enabled = true,
    AutoPlay = true,
    Volume = 0.3,
    SingleTrack = 1234567890,           -- rbxassetid
    -- hoặc Playlist = {123, 456, 789},
    LoopMode = "single"                 -- "single", "playlist", "off"
}
```

</details>

Ví dụ tạo Window đầy đủ:

```lua
local Window = NoirUI:CreateWindow({
    Name = "My Custom UI",
    Accent = Color3.fromRGB(0, 200, 255),
    AutoContrast = true,
    UseGlow = true,
    MainBgColor = Color3.fromRGB(20, 20, 30),
    MainBlur = 0.3,
    ElementBackgroundColor = Color3.fromRGB(40, 40, 50),
    SidebarBackgroundColor = Color3.fromRGB(15, 15, 25),
    TabBackgroundColor = Color3.fromRGB(30, 30, 45),
    Icon = "home",
    BackgroundMusic = {
        Enabled = true,
        AutoPlay = true,
        SingleTrack = 1234567890,
        Volume = 0.3
    }
})
```

---

📑 Tạo Tab

```lua
local Tab = Window:CreateTab("Tên Tab", "icon")
```

· icon: tên icon từ Lucide hoặc rbxassetid://...

---

🧩 Các Element Trong Tab

<details>
<summary><b>📌 Nhấn để xem tất cả Element</b></summary>

1. Label (Nhãn văn bản)

```lua
Tab:CreateLabel("Nội dung")
-- Cập nhật động:
Tab:CreateLabel(function() return "Giá trị: " .. someVariable end)
```

2. Section (Phần nhóm)

```lua
local section = Tab:CreateSection("Tên Section", true) -- true: ẩn đường kẻ
-- Các element tiếp theo sẽ nằm trong section này
```

3. Paragraph (Khối văn bản)

```lua
Tab:CreateParagraph({
    Title = "Tiêu đề",
    Content = "Nội dung mô tả dài..."
})
```

4. Button (Nút bấm)

```lua
Tab:CreateButton({
    Name = "Tên nút",
    Subtitle = "Phụ đề (tùy chọn)",
    Align = false,  -- false: căn trái, true: căn giữa
    Callback = function() print("Đã bấm!") end
})
```

5. Toggle (Công tắc)

```lua
Tab:CreateToggle({
    Name = "Bật chức năng",
    Subtitle = "Mô tả",
    Default = true,
    Callback = function(state) print(state) end
})
```

6. Slider (Thanh trượt)

```lua
Tab:CreateSlider({
    Name = "Âm lượng",
    Subtitle = "Điều chỉnh âm lượng",
    range = {0, 100},   -- [min, max]
    increment = 5,      -- bước nhảy
    Default = 50,
    Callback = function(value) print(value) end
})
```

7. Color Picker (Chọn màu)

```lua
Tab:CreateColorPicker({
    Name = "Chọn màu",
    Subtitle = "Màu accent",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color) print(color) end
})
```

8. Dropdown (Thả xuống)

```lua
-- Danh sách tĩnh:
Tab:CreateDropdown({
    Name = "Chọn server",
    Subtitle = "Chọn vùng",
    Options = {"US", "EU", "ASIA"},
    Default = "US",
    Callback = function(option) print(option) end
})

-- Danh sách động:
Tab:CreateDropdown({
    Name = "Danh sách động",
    GetOptions = function() return {"A", "B", "C"} end,
    RefreshOnOpen = true,  -- cập nhật mỗi khi mở
    Callback = function(opt) print(opt) end
})
```

9. TextBox (Ô nhập)

```lua
Tab:CreateTextBox({
    Name = "Tên người dùng",
    Subtitle = "Nhập tên",
    Default = "Noir",
    Callback = function(text) print(text) end
})
```

10. RunBox (Thực thi lệnh)

```lua
Tab:CreateRunBox({
    Placeholder = "Nhập lệnh hoặc code...",
    ClearOnExecute = true  -- xóa sau khi chạy
})
```

Hỗ trợ: .command args, loadstring("..."), Lua code trực tiếp.

</details>

---

🔔 Thông Báo (Notification)

```lua
NoirUI:Notify("Tiêu đề", "Nội dung", "icon", "Success")
```

· icon: tên Lucide hoặc rbxassetid (có thể để nil)
· soundType: "Success", "Error", "Notification" (mặc định)

---

🎵 Hệ Thống Nhạc Nền

<details>
<summary><b>📌 Các hàm điều khiển nhạc</b></summary>

```lua
NoirUI:StartMusic()
NoirUI:PauseMusic()
NoirUI:ResumeMusic()
NoirUI:StopMusic()
NoirUI:SetMusicVolume(0.5)
NoirUI:AddMusicTrack(1234567890)
NoirUI:RemoveMusicTrack(1)        -- xóa theo index
NoirUI:SetMusicLoopMode("playlist") -- "single", "playlist", "off"
```

</details>

---

🔊 Âm Thanh Tương Tác

<details>
<summary><b>📌 Các hàm tùy chỉnh âm thanh</b></summary>

```lua
-- Đặt âm thanh tùy chỉnh cho từng hành động
NoirUI:SetCustomSound("Click", "rbxassetid://123")
NoirUI:SetCustomSound("Tab", "...")
NoirUI:SetCustomSound("Element", "...")
NoirUI:SetCustomSound("Open", "...")
NoirUI:SetCustomSound("Close", "...")
NoirUI:SetCustomSound("Notification", "...")
NoirUI:SetCustomSound("Error", "...")
NoirUI:SetCustomSound("Success", "...")

NoirUI:ToggleSound(true)   -- bật/tắt
NoirUI:SetVolume(0.8)
```

</details>

---

🛠️ Lệnh Tùy Chỉnh (Custom Commands)

```lua
NoirUI:RegisterCommand("hello", function(args)
    NoirUI:Notify("Hello", "Bạn đã gõ: " .. table.concat(args, " "))
end)
-- Trong RunBox gõ: .hello xin chào
```

---

🗑️ Hủy UI

```lua
NoirUI:Destroy()
```

---

📝 Ví Dụ Đầy Đủ

```lua
local NoirUI = loadstring(game:HttpGet("..."))()
local Window = NoirUI:CreateWindow({
    Name = "My UI",
    Accent = Color3.fromRGB(255, 100, 100),
    UseGlow = true,
    AutoContrast = true,
    ElementBackgroundColor = Color3.fromRGB(30, 30, 40),
    SidebarBackgroundColor = Color3.fromRGB(20, 20, 30),
    TabBackgroundColor = Color3.fromRGB(35, 35, 45),
    MainBlur = 0.2,
    Icon = "home"
})

-- Tab chính
local mainTab = Window:CreateTab("Chính", "home")
mainTab:CreateSection("Cài đặt")
mainTab:CreateToggle({
    Name = "Bật tự động",
    Default = true,
    Callback = function(s) print(s) end
})
mainTab:CreateButton({
    Name = "Chạy",
    Callback = function() 
        NoirUI:Notify("Thông báo", "Đã chạy!", "check", "Success") 
    end
})

-- Tab cài đặt
local settingTab = Window:CreateTab("Cài đặt", "settings")
settingTab:CreateSlider({
    Name = "Âm lượng",
    range = {0, 100},
    Default = 50,
    Callback = function(v) NoirUI:SetVolume(v / 100) end
})
settingTab:CreateColorPicker({
    Name = "Màu accent",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(c) print(c) end
})
```

---

💡 Ghi Chú Quan Trọng

· Blur là một lớp phủ tối, không phải Gaussian blur thực sự – giúp làm tối nền để làm nổi bật nội dung.
· Với AutoContrast = true, màu chữ sẽ tự động tương phản với màu nền của từng element.
· Tất cả element đều hỗ trợ Subtitle để thêm mô tả bên dưới.
· Bạn có thể tạo nhiều tab, mỗi tab chứa nhiều section và element.

---

Chúc bạn tạo được giao diện đẹp mắt và chuyên nghiệp! 🚀
