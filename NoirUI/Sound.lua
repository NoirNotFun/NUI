-- ============================================
-- NoirUI - Sound Module
-- Version: 3.0
-- ============================================
local Sound = {}

-- ============================================
-- SOUND POOL
-- ============================================
local pool = {}
local pool_size = 5

function Sound.Init()
    for i = 1, pool_size do
        local sound = Instance.new("Sound")
        sound.Volume = 0.3
        sound.Parent = game:GetService("CoreGui")
        table.insert(pool, sound)
    end
end

function Sound.Play(sound_id, volume)
    if not Sound.Settings.Enabled then return end
    for _, sound in ipairs(pool) do
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
    table.insert(pool, sound)
    return sound
end

Sound.Init()

-- ============================================
-- SOUND SETTINGS
-- ============================================
Sound.Settings = {
    Enabled = true,
    Volume = 0.5,
}

-- ============================================
-- BACKGROUND MUSIC
-- ============================================
local BGM = {
    CurrentSound = nil,
    CurrentTrackId = nil,
    IsPlaying = false,
    Volume = 0.3,
    Playlist = {},
    CurrentIndex = 1,
    LoopMode = "single",
    UIHidden = false,
}

function Sound.InitBackgroundMusic(settings)
    if not settings or not settings.Enabled then return end
    
    if settings.Playlist and #settings.Playlist > 0 then
        BGM.Playlist = settings.Playlist
        BGM.LoopMode = settings.LoopMode or "single"
    elseif settings.SingleTrack then
        BGM.Playlist = {settings.SingleTrack}
        BGM.LoopMode = "single"
    end
    
    BGM.Volume = settings.Volume or 0.3
    
    if not BGM.CurrentSound then
        BGM.CurrentSound = Instance.new("Sound")
        BGM.CurrentSound.Volume = BGM.Volume
        BGM.CurrentSound.Looped = false
        BGM.CurrentSound.Parent = game:GetService("CoreGui")
        BGM.CurrentSound.Ended:Connect(function()
            if BGM.IsPlaying and not BGM.UIHidden then
                Sound.PlayNext()
            end
        end)
    end
    
    if settings.AutoPlay and #BGM.Playlist > 0 then
        BGM.CurrentIndex = 1
        Sound.PlayTrack(BGM.Playlist[1])
    end
end

function Sound.PlayTrack(trackId)
    if not trackId or not BGM.CurrentSound then return end
    BGM.CurrentSound:Stop()
    BGM.CurrentSound.SoundId = "rbxassetid://" .. tostring(trackId)
    BGM.CurrentSound:Play()
    BGM.CurrentTrackId = trackId
    BGM.IsPlaying = true
end

function Sound.PlayNext()
    if BGM.LoopMode == "single" and BGM.CurrentTrackId then
        Sound.PlayTrack(BGM.CurrentTrackId)
    elseif BGM.LoopMode == "playlist" and #BGM.Playlist > 0 then
        BGM.CurrentIndex = BGM.CurrentIndex % #BGM.Playlist + 1
        Sound.PlayTrack(BGM.Playlist[BGM.CurrentIndex])
    end
end

function Sound.StartMusic()
    if BGM.CurrentSound and #BGM.Playlist > 0 then
        if BGM.CurrentSound.Playing then
            BGM.CurrentSound:Resume()
        else
            Sound.PlayTrack(BGM.Playlist[BGM.CurrentIndex])
        end
        BGM.IsPlaying = true
        BGM.UIHidden = false
        BGM.CurrentSound.Volume = BGM.Volume
    end
end

function Sound.StopMusic()
    if BGM.CurrentSound then
        BGM.CurrentSound:Stop()
    end
    BGM.IsPlaying = false
end

function Sound.PauseMusic()
    if BGM.CurrentSound and BGM.IsPlaying then
        BGM.CurrentSound:Pause()
        BGM.IsPlaying = false
    end
end

function Sound.ResumeMusic()
    if BGM.CurrentSound and not BGM.IsPlaying and not BGM.UIHidden then
        BGM.CurrentSound:Resume()
        BGM.IsPlaying = true
    end
end

function Sound.SetMusicVolume(volume)
    BGM.Volume = math.clamp(volume, 0, 1)
    if BGM.CurrentSound then
        BGM.CurrentSound.Volume = BGM.Volume
    end
end

function Sound.AddTrack(trackId)
    table.insert(BGM.Playlist, trackId)
end

function Sound.RemoveTrack(index)
    table.remove(BGM.Playlist, index)
    if BGM.CurrentIndex > #BGM.Playlist then
        BGM.CurrentIndex = 1
    end
end

function Sound.SetLoopMode(mode)
    if mode == "single" or mode == "playlist" or mode == "off" then
        BGM.LoopMode = mode
        if mode == "off" then
            Sound.StopMusic()
        end
    end
end

return Sound
