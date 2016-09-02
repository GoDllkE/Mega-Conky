--[[

This script draws percentage meters as rings. It is fully customisable; all options are described in the script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement on line 145 uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
lua_load ~/scripts/rings-v1.2.1.lua
lua_draw_hook_pre ring_stats

Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)
]]

settings_table = {
    --[[
    -- To enable more than 1 thread runtime, copy this one and change the arg to the respective number of the thread you want to show.
    -- And don't forget to change the location (x,y) and the radius, this is really important to realocate it if you want more.
    --]]
    {
        name='cpu',
        arg='cpu0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00C9FF,
        fg_alpha=1.0,
        x=375, y=300,
        radius=245,
        thickness=7,
        start_angle=0,
        end_angle=135
    },

    {
        name='memperc',
        arg='',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0xf0f8ff,
        fg_alpha=1.0,
        x=375, y=300,
        radius=225,
        thickness=7,
        start_angle=0,
        end_angle=135
    },
    {
        name='swapperc',
        arg='',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x47B13E,
        fg_alpha=1.0,
        x=375, y=300,
        radius=213,
        thickness=7,
        start_angle=0,
        end_angle=135
    },
    --[[
    -- Don't forget to change de Network adapter here, in 'arg'.
    -- Select a adapter from your machine like eth0 or wlp3s0 and set there.
    --]]

    {
        name='upspeedf',
        arg='wlp3s0',
        max=1024,               --[[ Change this line as your internet REAL speed is, in KB, like mine is 1mb/s the upload]]
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00FF00,
        fg_alpha=1.0,
        x=375, y=300,
        radius=193,
        thickness=7,
        start_angle=0,
        end_angle=135
    },
    --[[
    -- Don't forget to change de Network adapter here, in 'arg'.
    -- Select a adapter from your machine like eth0 or wlp3s0 and set there.
    --]]
    {
        name='downspeedf',
        arg='wlp3s0',
        max=2457,               --[[ Change this line as your internet REAL speed is, in KB, like mine is 2,4mb/s the download]]
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x1ba1e2,
        fg_alpha=1.0,
        x=375, y=300,
        radius=181,
        thickness=7,
        start_angle=0,
        end_angle=135
    },
    {
        name='fs_used_perc',
        arg='/',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0xf09609,
        fg_alpha=1.0,
        x=375, y=300,
        radius=161,
        thickness=7,
        start_angle=0,
        end_angle=360
    },
    {
        name='fs_used_perc',
        arg='/home',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0xa200ff,
        fg_alpha=1.0,
        x=375, y=300,
        radius=149,
        thickness=7,
        start_angle=0,
        end_angle=360
    },	
    --[[
    -- Don't forget to change the disk/partition or location to use, in 'arg'
    -- Select a location to make it work properly.
    --]]
    {
        name='fs_used_perc',
        arg='/var',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0xff0097,
        fg_alpha=1.0,
        x=375, y=300,
        radius=137,
        thickness=7,
        start_angle=0,
        end_angle=360
    },
    --[[
    -- Don't forget to change the disk/partition or location to use, in 'arg'
    -- Select a location to make it work properly.
    --]]
    {
        name='fs_used_perc',
        arg='/usr',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00aba9,
        fg_alpha=1.0,
        x=375, y=300,
        radius=125,
        thickness=7,
        start_angle=0,
        end_angle=360
    },
    --[[
    -- This one uses the battery as the property to make that beauty rings.
    -- The 'arg' BAT0 set to use the default one, common in laptos.
    -- If not work properly, i recommend to change to BAT1 or anything else,
    -- or if you use a desktop, well, try putting something else, a static one maybe.
    --
    -- Ps: This one makes that circle.
    --]]
    {
        name='battery_percent',
        arg='BAT0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x2baad7,
        fg_alpha=1.0,
        x=376, y=300,
        radius=115,
        thickness=4,
        start_angle=0,
        end_angle=360
    },
    --[[
    -- This one is the hour timer.
    -- you can change for 24h changing the 'max' value to 24.
    --]]
    {
        name='time',
        arg='%I',
        max=12,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0xf0f8ff,
        fg_alpha=1.0,
        x=375, y=300,
        radius=181,
        thickness=7,
        start_angle=135,
        end_angle=225
    },
    --[[
    -- This one is the minute timer.
    --]]
    {
        name='time',
        arg='%M',
        max=60,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00FF00,
        fg_alpha=1.0,
        x=375, y=300,
        radius=193,
        thickness=7,
        start_angle=135,
        end_angle=225
    },
    {
        name='time',
        arg='%S',
        max=60,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00C9FF,
        fg_alpha=1.0,
        x=375, y=300,
        radius=205,
        thickness=7,
        start_angle=135,
        end_angle=225
    },
    {
        name='battery_percent',
        arg='BAT0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00C9FF,
        fg_alpha=1.0,
        x=375, y=300,
        radius=205,
        thickness=7,
        start_angle=305,
        end_angle=325
    },
    {
        name='battery_percent',
        arg='BAT0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00C9FF,
        fg_alpha=1.0,
        x=375, y=300,
        radius=270,
        thickness=7,
        start_angle=45,
        end_angle=135
    },
    {
        name='battery_percent',
        arg='BAT0',
        max=100,
        bg_colour=0xffffff,
        bg_alpha=0.0,
        fg_colour=0x00C9FF,
        fg_alpha=1.0,
        x=375, y=300,
        radius=550,
        thickness=7,
        start_angle=68,
        end_angle=112
    },

}

settings_t = {
} 
require 'cairo'

function rgb_to_r_g_b(colour,alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)
    local w,h=conky_window.width,conky_window.height

    local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
    local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

    local angle_0=sa*(2*math.pi/360)-math.pi/2
    local angle_f=ea*(2*math.pi/360)-math.pi/2
    local t_arc=t*(angle_f-angle_0)

    -- Draw background ring

    cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
    cairo_set_line_width(cr,ring_w)
    cairo_stroke(cr)

    -- Draw indicator ring

    cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
    cairo_stroke(cr)		
end
function draw_ring_cc(cr,t,pt)
    local w,h=conky_window.width,conky_window.height

    local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
    local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

    local angle_0=sa*(2*math.pi/360)-math.pi/2
    local angle_f=ea*(2*math.pi/360)-math.pi/2
    local t_arc=t*(angle_f-angle_0)

    -- Draw background ring

    cairo_arc_negative(cr,xc,yc,ring_r,angle_0,angle_f)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
    cairo_set_line_width(cr,ring_w)
    cairo_stroke(cr)

    -- Draw indicator ring

    cairo_arc_negative(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
    cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
    cairo_stroke(cr)		
end 
function conky_ring_stats()
    local function setup_rings(cr,pt)
        local str=''
        local value=0

        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)

        value=tonumber(str)
        if value == nil then value = 0 end
        pct=value/pt['max']

        draw_ring(cr,pct,pt)
    end
    local function setup_rings_cc(cr,pt)
        local str=''
        local value=0

        str=string.format('${%s %s}',pt['name'],pt['arg'])
        str=conky_parse(str)

        value=tonumber(str)
        if value == nil then value = 0 end
        pct=value/pt['max']

        draw_ring_cc(cr,pct,pt)
    end 
    if conky_window==nil then return end
    local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)

    local cr=cairo_create(cs)	

    local updates=conky_parse('${updates}')
    update_num=tonumber(updates)

    if update_num>5 then
        for i in pairs(settings_table) do
            setup_rings(cr,settings_table[i])
        end
        for i in pairs(settings_t) do
            setup_rings_cc(cr,settings_t[i])
        end
    end
end
require 'imlib2'

function init_drawing_surface()
    imlib_set_cache_size(4096 * 1024)
    imlib_context_set_dither(1)
end

function draw_image()
    init_drawing_surface()

    -- You'll need to change the path here (keep it absolute!)
    -- Change where is "user" to the name of your respective user.
    image = imlib_load_image("/home/godlike/.conky/Mega-Conky/Pictures/Conky.png")
    if image == nil then return end
    imlib_context_set_image(image)
    imlib_render_image_on_drawable(0,0)
    imlib_free_image()
end


function conky_start()
    if conky_window == nil then return end
    draw_image()
end
