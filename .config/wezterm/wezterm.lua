local wez = require 'wezterm'

local act = wez.action


-- Show keytable
wez.on('update-right-status', function(window, _pane)
    local name = window:active_key_table()
    if name then
        name = 'TABLE: ' .. name
    end
    window:set_right_status(name or '')
end)

return {
    -- Apearance
    window_background_opacity = 0.9,
    -- font = wez.font 'Iosevka',
    -- font = wez.font 'Hack Nerd Font Mono',
    font = wez.font 'Iosevka Term SS11 Md Ex',
    font_size = 11.0,
    -- color_scheme = 'Default Dark (base16)',
    color_scheme = "Gruvbox dark, pale (base16)",
    check_for_updates = false,

    -- color_scheme = 'Catppuccin Macchiato',
    window_padding = {
        left = 5, right = 1,
        top = 3, bottom = 3,
    },
    use_fancy_tab_bar = false,
    -- hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    enable_scroll_bar = true,


    keys = {
        -- Window Management
        { key = 'Enter', mods = 'CTRL|SHIFT', action = act.SplitVertical { domain = "CurrentPaneDomain" }, },
        { key = 'Enter', mods = 'CTRL|SHIFT|ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
        { key = 'W', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = true }, },
        { key = 'Q', mods = 'CTRL|SHIFT', action = act.CloseCurrentTab { confirm = true }, },
        -- Goto panes
        { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection("Left") },
        { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection("Down") },
        { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection("Up") },
        { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection("Right") },
        -- Move panes
        { key = "p", mods = "CTRL|SHIFT", action = act { PaneSelect = { mode = "SwapWithActive" } } },
        -- Tables
        {
            key = 'r', mods = 'CTRL|SHIFT',
            action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, },
        },
        -- Standard
        { key = 'z', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState},
    },

    key_tables = {
        resize_pane = {
            { key = 'h', action = act.AdjustPaneSize { "Left", 1 } },
            { key = 'j', action = act.AdjustPaneSize { "Down", 1 } },
            { key = 'k', action = act.AdjustPaneSize { "Up", 1 } },
            { key = 'l', action = act.AdjustPaneSize { "Right", 1 } },

            { key = 'Escape', action = 'PopKeyTable' },
        },
    },
}
