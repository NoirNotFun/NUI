-- NOIR UI - SOUND MANAGER
local SoundManager = {
    pool = {},
    pool_size = 5,
}

function SoundManager.init()
    for i = 1, SoundManager.pool_size do
        local sound = Instance.new("Sound")
        sound.Volume = 0.3
        sound.Parent = game:GetService("CoreGui")
        table.insert(SoundManager.pool, sound)
    end
end

SoundManager.init()

function SoundManager.play(sound_id, volume)
    if not SoundSettings.Enabled then return end
    for _, sound in ipairs(SoundManager.pool) do
        if not sound.IsPlaying then
            sound.SoundId = sound_id
            sound.Volume = volume or 0.3
            sound:Play()
            return sound
        end
    end
    local sound = Instance.new("Sound")
    sound.SoundId = sound_id
    sound.Volume = volume or 0.3
    sound.Parent = game:GetService("CoreGui")
    sound:Play()
    table.insert(SoundManager.pool, sound)
    return sound
end

-- ============================================
-- SOUND SETTINGS
-- ============================================
local SoundSettings = {
    Enabled = true,
    Volume = 0.5,
    ClickSoundId = nil,
    TabSoundId = nil,
    ElementSoundId = nil,
    OpenSoundId = nil,
    CloseSoundId = nil,
    NotificationSoundId = nil,
    ErrorSoundId = nil,
    SuccessSoundId = nil,
}

-- ============================================
-- PLAY SOUND
-- ============================================
local function PlaySound(soundType)
    if not SoundSettings.Enabled then return end
    local soundId = nil
    if soundType == "Click" then soundId = SoundSettings.ClickSoundId
    elseif soundType == "Tab" then soundId = SoundSettings.TabSoundId
    elseif soundType == "Element" then soundId = SoundSettings.ElementSoundId
    elseif soundType == "Open" then soundId = SoundSettings.OpenSoundId
    elseif soundType == "Close" then soundId = SoundSettings.CloseSoundId
    elseif soundType == "Notification" then soundId = SoundSettings.NotificationSoundId
    elseif soundType == "Error" then soundId = SoundSettings.ErrorSoundId
    elseif soundType == "Success" then soundId = SoundSettings.SuccessSoundId
    end
    if not soundId then return end
    SoundManager.play(soundId, SoundSettings.Volume)
end

-- ============================================
-- BACKGROUND MUSIC
-- ============================================
local BackgroundMusic = {
    CurrentSound = nil,
    CurrentTrackId = nil,
    IsPlaying = false,
    Volume = 0.3,
    Playlist = {},
    CurrentIndex = 1,
    LoopMode = "single",
    UIHidden = false,
    VibeSound = nil,
}

local function PlayTrackById(trackId)
    if not trackId or not BackgroundMusic.CurrentSound then return end
    BackgroundMusic.CurrentSound:Stop()
    BackgroundMusic.CurrentSound.SoundId = "rbxassetid://" .. tostring(trackId)
    BackgroundMusic.CurrentSound:Play()
    BackgroundMusic.CurrentTrackId = trackId
    BackgroundMusic.IsPlaying = true
end

local function PlayNextTrack()
    if BackgroundMusic.LoopMode == "single" and BackgroundMusic.CurrentTrackId then
        PlayTrackById(BackgroundMusic.CurrentTrackId)
    elseif BackgroundMusic.LoopMode == "playlist" and #BackgroundMusic.Playlist > 0 then
        BackgroundMusic.CurrentIndex = BackgroundMusic.CurrentIndex % #BackgroundMusic.Playlist + 1
        PlayTrackById(BackgroundMusic.Playlist[BackgroundMusic.CurrentIndex])
    end
end

-- ============================================
-- VIBE SOUND
-- ============================================
local function PlayVibeSound(soundId, volume)
    if not SoundSettings.Enabled then return end
    if BackgroundMusic.VibeSound then
        BackgroundMusic.VibeSound:Stop()
        BackgroundMusic.VibeSound:Destroy()
        BackgroundMusic.VibeSound = nil
    end
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = volume or 0.3
    sound.Looped = true
    sound.Parent = game:GetService("CoreGui")
    sound:Play()
    BackgroundMusic.VibeSound = sound
    return sound
end

local function StopVibeSound()
    if BackgroundMusic.VibeSound then
        BackgroundMusic.VibeSound:Stop()
        BackgroundMusic.VibeSound:Destroy()
        BackgroundMusic.VibeSound = nil
    end
end

-- ============================================
-- NOIRUI SOUND API
-- ============================================
local NoirUISound = {}

-- Sound Controls
function NoirUISound:Play(soundType)
    PlaySound(soundType)
end

function NoirUISound:SetCustomSound(soundType, soundId)
    if soundType == "Click" then SoundSettings.ClickSoundId = soundId
    elseif soundType == "Tab" then SoundSettings.TabSoundId = soundId
    elseif soundType == "Element" then SoundSettings.ElementSoundId = soundId
    elseif soundType == "Open" then SoundSettings.OpenSoundId = soundId
    elseif soundType == "Close" then SoundSettings.CloseSoundId = soundId
    elseif soundType == "Notification" then SoundSettings.NotificationSoundId = soundId
    elseif soundType == "Error" then SoundSettings.ErrorSoundId = soundId
    elseif soundType == "Success" then SoundSettings.SuccessSoundId = soundId
    end
end

function NoirUISound:ToggleSound(enabled)
    SoundSettings.Enabled = enabled
end

function NoirUISound:SetVolume(volume)
    SoundSettings.Volume = math.clamp(volume, 0, 1)
end

-- Background Music
function NoirUISound:EnableBackgroundMusic(settings)
    settings = settings or {}
    if not settings.Enabled then return end
    
    if settings.Playlist and #settings.Playlist > 0 then
        BackgroundMusic.Playlist = settings.Playlist
        BackgroundMusic.LoopMode = settings.LoopMode or "single"
    elseif settings.SingleTrack then
        BackgroundMusic.Playlist = {settings.SingleTrack}
        BackgroundMusic.LoopMode = "single"
    end
    
    BackgroundMusic.Volume = settings.Volume or 0.3
    
    if not BackgroundMusic.CurrentSound then
        BackgroundMusic.CurrentSound = Instance.new("Sound")
        BackgroundMusic.CurrentSound.Volume = BackgroundMusic.Volume
        BackgroundMusic.CurrentSound.Looped = false
        BackgroundMusic.CurrentSound.Parent = game:GetService("CoreGui")
        BackgroundMusic.CurrentSound.Ended:Connect(function()
            if BackgroundMusic.IsPlaying and not BackgroundMusic.UIHidden then
                PlayNextTrack()
            end
        end)
    end
    
    if settings.AutoPlay and #BackgroundMusic.Playlist > 0 then
        BackgroundMusic.CurrentIndex = 1
        PlayTrackById(BackgroundMusic.Playlist[1])
    end
end

function NoirUISound:StartMusic()
    if BackgroundMusic.CurrentSound and #BackgroundMusic.Playlist > 0 then
        if BackgroundMusic.CurrentSound.Playing then
            BackgroundMusic.CurrentSound:Resume()
        else
            PlayTrackById(BackgroundMusic.Playlist[BackgroundMusic.CurrentIndex])
        end
        BackgroundMusic.IsPlaying = true
        BackgroundMusic.UIHidden = false
        BackgroundMusic.CurrentSound.Volume = BackgroundMusic.Volume
    end
end

function NoirUISound:StopMusic()
    if BackgroundMusic.CurrentSound then
        BackgroundMusic.CurrentSound:Stop()
    end
    BackgroundMusic.IsPlaying = false
end

function NoirUISound:PauseMusic()
    if BackgroundMusic.CurrentSound and BackgroundMusic.IsPlaying then
        BackgroundMusic.CurrentSound:Pause()
        BackgroundMusic.IsPlaying = false
    end
end

function NoirUISound:ResumeMusic()
    if BackgroundMusic.CurrentSound and not BackgroundMusic.IsPlaying and not BackgroundMusic.UIHidden then
        BackgroundMusic.CurrentSound:Resume()
        BackgroundMusic.IsPlaying = true
    end
end

function NoirUISound:SetMusicVolume(volume)
    BackgroundMusic.Volume = math.clamp(volume, 0, 1)
    if BackgroundMusic.CurrentSound then
        BackgroundMusic.CurrentSound.Volume = BackgroundMusic.Volume
    end
end

function NoirUISound:AddMusicTrack(trackId)
    table.insert(BackgroundMusic.Playlist, trackId)
end

function NoirUISound:RemoveMusicTrack(index)
    table.remove(BackgroundMusic.Playlist, index)
    if BackgroundMusic.CurrentIndex > #BackgroundMusic.Playlist then
        BackgroundMusic.CurrentIndex = 1
    end
end

function NoirUISound:SetMusicLoopMode(mode)
    if mode == "single" or mode == "playlist" or mode == "off" then
        BackgroundMusic.LoopMode = mode
        if mode == "off" then
            self:StopMusic()
        end
    end
end

-- Vibe Sound
function NoirUISound:SetVibeSound(soundId, volume)
    PlayVibeSound(soundId, volume)
end

function NoirUISound:StopVibeSound()
    StopVibeSound()
end

-- ============================================
-- EXPORT
-- ============================================
return NoirUISound
