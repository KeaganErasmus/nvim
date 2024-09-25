local wezterm = require 'wezterm';

local target = wezterm.target_triple
-- Declare a variable for the window background image path
local window_background_image = nil

-- Set the background image based on the OS
if string.find(target, "linux") then
  window_background_image = "/home/keagane/.config/wezterm/pic.jpg"
elseif string.find(target, "windows") then
  window_background_image = "C:/Users/Keagan/.config/wezterm/pic.jpg"
elseif string.find(target, "darwin") then
  window_background_image = "/Users/keagan/.config/wezterm/pic.jpg"
end

return {
    font_size = 14.0,

    colors = {
        -- Gruvbox Dark colors
        background = "#282828",
        foreground = "#ebdbb2",

        ansi = {
            "#282828", -- black
            "#fb4934", -- red
            "#b8bb26", -- green
            "#fabd2f", -- yellow
            "#83a598", -- blue
            "#d3869b", -- magenta
            "#8ec07c", -- cyan
            "#ebdbb2", -- white
        },

        brights = {
            "#928374", -- bright black (gray)
            "#fb4934", -- bright red
            "#b8bb26", -- bright green
            "#fabd2f", -- bright yellow
            "#83a598", -- bright blue
            "#d3869b", -- bright magenta
            "#8ec07c", -- bright cyan
            "#ffffff", -- bright white
        },
    },

    window_background_image = window_background_image,
    use_fancy_tab_bar = true,

    -- Adjust image opacity, brightness, and saturation
    window_background_image_hsb = {
      brightness = 0.6,  -- 1.0 means no change to brightness
      hue = 1.0,         -- 1.0 means no change to hue
      saturation = 1.0,  -- 1.0 means no change to saturation
      -- Set opacity (0.0 is fully transparent, 1.0 is fully opaque)
      alpha = 1.0,       -- Set the image to be slightly opaque
    },

    keys = {
        { key = "t",     mods = "CTRL|SHIFT", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "w",     mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
        { key = "Enter", mods = "ALT",        action = wezterm.action.ToggleFullScreen },
    },
}
