local wezterm = require 'wezterm';

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

    -- window_background_opacity = 0.9,
    window_background_image = "C:/Users/Keagan/.config/wezterm/pic.jpg",
    use_fancy_tab_bar = false,

    keys = {
        { key = "t",     mods = "CTRL|SHIFT", action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
        { key = "w",     mods = "CTRL|SHIFT", action = wezterm.action { CloseCurrentTab = { confirm = true } } },
        { key = "Enter", mods = "ALT",        action = wezterm.action.ToggleFullScreen },
    },
}
