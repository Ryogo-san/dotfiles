local wezterm = require 'wezterm'
local act=wezterm.action

local function font_exists(font_name, fonts)
    -- search with binary search
    local ng,ok=0,#fonts
    while ng+1<ok do
        local mid=(ng+ok)>>1
        if fonts[mid]<font_name then
            ng=mid
        else
            ok=mid end end
    return font_name == fonts[ok]
end

local function get_font_fallback(candidates, all_fonts)
    local res --[[array<string>]] = {}
    for i --[[integer]] =1, #candidates do
        local cand --[[string]] = candidates[i]
        table.insert(res,cand)
    end

    return res
end

local function make_font()
    local all_fonts --[[array<string>]] = wezterm.GLOBAL.fonts
    local candidates --[[array<string>]]={
        "IPAGothic"
    }
    local fallback --[[array<string>]] = get_font_fallback(candidates, all_fonts)

    return wezterm.font_with_fallback(fallback)
end

local function set_battery_info()
    wezterm.on('update-right-status',function(window,pane)
        local date=wezterm.strftime '%a %b %-d %H:%M '
        local bat=''
        for _,b in ipairs(wezterm.battery_info()) do
            bat = '🔋'..string.format('%.0f%%',b.state_of_charge*100)
        end

        window:set_right_status(wezterm.format{
            {Text=bat..'   '..date},
        })
    end)
end


return {
    ----------------------------------------------------
    -- fundamental settings
    ----------------------------------------------------
    -- tab bar
    hide_tab_bar_if_only_one_tab=false,
    -- do not hold on exit by default
    exit_behavior='Close',
    -- scroll bar
    enable_scroll_bar=true,
    set_battery_info(),

    ----------------------------------------------------
    -- keys
    ----------------------------------------------------
    keys= {
        {key='C', mods='CTRL', action=act.CopyTo 'Clipboard' },
        {key='v', mods='CTRL', action=act.PasteFrom 'Clipboard' },
        {key='F9', mods='ALT', action=act.ShowTabNavigator },
    },

    ----------------------------------------------------
    -- fonts
    ----------------------------------------------------
    --font = make_font(),
    font_size=13,
    line_height=1.1,
}
