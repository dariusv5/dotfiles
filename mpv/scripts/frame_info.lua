local assdraw = require "mp.assdraw"
local options = require "mp.options"

local info_active = false
local o = {
    font_size = 10,
    font_color = "FFFFFF",
    border_size = 1.0,
    border_color = "000000",
}
options.read_options(o)

function get_formatting()
    return string.format(
        "{\\fs%d}{\\1c&H%s&}{\\bord%f}{\\3c&H%s&}",
        o.font_size, o.font_color,
        o.border_size, o.border_color
    )
end

function timestamp(duration)
    -- mpv may return nil before exiting.
	local length = mp.get_property_native("duration")
	local hours2 = length / 3600
    local minutes2 = length % 3600 / 60
    local seconds2 = length % 60
    if not duration then return "" end
    local hours = duration / 3600
    local minutes = duration % 3600 / 60
    local seconds = duration % 60
    return string.format("%02d:%02d:%02d/%02d:%02d:%02d", hours, minutes, seconds, hours2, minutes2, seconds2)
end

function get_info()
    return string.format(
        "%s%s\\N%s",
        get_formatting(),
        mp.get_property("filename"),
        timestamp(mp.get_property_native("time-pos"))
    )
end

function render_info()
    ass = assdraw.ass_new()
    ass:pos(0, 0)
    ass:append(get_info())
    mp.set_osd_ass(0, 0, ass.text)
end

function clear_info()
    mp.set_osd_ass(0, 0, "")
end

function toggle_info()
	mp.register_event("tick", render_info)
	render_info()
	os.execute('sleep 3')
	mp.unregister_event(render_info)
	clear_info()
end

mp.add_key_binding("TAB", mp.get_script_name(), toggle_info)
