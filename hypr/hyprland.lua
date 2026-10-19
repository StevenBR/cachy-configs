local mainMod = "SUPER" -- or "SUPER" if you use the Windows key
local terminal = "ghostty" -- or your preferred terminal

-- LOGIN/AUTOSTART
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	-- Clipboard Syncing (Saves your copy history using cliphist)
	hl.exec_cmd([[bash -c "wl-paste --watch cliphist store &"]])

	hl.exec_cmd("systemctl --user import-environment &")
	hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
	-- Idle Daemon (Triggers screen blanking, locking, and power management profiles)
	-- hl.exec_cmd("hypridle &")

	-- Desktop Shell (Launches your panels, launcher, and status menus)
	hl.exec_cmd("noctalia")
end)

hl.exec_cmd("fcitx5 -d &")
hl.exec_cmd(
	'bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown" &'
)
hl.exec_cmd("$idlehandler")
-- Authentication Agent (Unlocks Polkit prompt popups for root/sudo tasks)
hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")
-- my apps to start
hl.exec_cmd("vicinae server")

-- KEYBINDINGS
-- Bind to open your terminal (using the 'terminal' variable)
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + q", hl.dsp.window.kill())

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

--- Navigating workspaces
-- Bind Super + Page Up to go to the next workspace
hl.bind(mainMod .. " + page_up", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + page_down", hl.dsp.focus({ workspace = "r+1" }))

-- Control windows
-- Resize active window by 20 pixels in the specified direction
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))

-- Swap active window with the neighbor in the specified direction
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

-- Toggle vicinae
hl.bind("SUPER + space", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("vicinae 'vicinae://launch/clipboard/history?toggle=true'"))

-- Noctalia Keybindings
local ipc = "noctalia msg"
-- Toggle workspace overview with qs
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:workspace-overview toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"))
----- how to get the overview working with this?
hl.bind("SUPER + Tab", function()
	hl.dispatch(hl.dsp.window.cycle_next()) -- Focus the next window
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it forward
end, { description = "Cycle through application windows" })

for i = 1, 10 do
	-- Map 1-9 to keys 1-9, and 10 to key 0
	local key = i % 10
	-- Bind Super + Shift + [key] to move the active window to workspace [i]
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- MONITOR
hl.monitor({
	output = "DP-1",
	mode = "3840x2160@165",
	position = "0x0",
	scale = 1,
	-- bitdepth = 10,
	-- cm = "hdr",
})

-- MOUSE ACCELERATION PROFILE
-- INPUT
hl.config({
	input = {
		-- keyboard keys
		repeat_delay = 350, -- Delay in milliseconds before repeating a key
		repeat_rate = 45, -- Number of repeats per second (optional, default is typically 25)
		-- mouse accel and sensitivity
		accel_profile = "flat",
		-- sensitivity = 0.55,
		force_no_accel = 1,
	},
	-- layout = {
	-- dwindle = {
	-- 	default_split_ration = 0.4,
	-- },
	master = {
		-- Sets the master window width to exactly 40% of the screen
		mfact = 0.40,
		-- Forces the master window to stay centered when it is the only window
		orientation = "center",
		slave_count_for_center_master = 0,
		-- New windows become slaves, splitting the screen normally
		new_status = "slave",
		new_on_top = false,
	},
	-- },
})

-- Apply Animations
-- 1. Define the Bezier Curve (Easing)
-- Equivalent to: bezier = easeInOut, 0.4, 0.0, 0.2, 1.0
hl.curve("easeInOut", {
	type = "bezier",
	points = { { 0.4, 0.0 }, { 0.2, 1.0 } },
})

hl.config({
	render = {
		-- 0 = off, 1 = on, 2 = auto (on for 'game' content type)
		direct_scanout = 2,
	},
	-- Ensure tearing is allowed for direct scanout to work effectively
	general = {
		allow_tearing = true,
	},
})

-- Windows: Snappy slide (500ms)
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4,
	curve = "easeInOut",
	bezier = "easeInOut",
	style = "slide",
})

-- Fade: Match window speed
hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 4,
	curve = "easeInOut",
	bezier = "easeInOut",
})

-- Workspaces: Even faster (400ms) for instant feel
hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 3,
	curve = "easeInOut",
	bezier = "easeInOut",
	style = "slide",
})

-- Borders: Instant color switch
hl.animation({
	leaf = "border",
	enabled = true,
	speed = 4,
	curve = "easeInOut",
	bezier = "easeInOut",
})

hl.config({
	general = {
		border_size = 2,
		col = {
			-- Active window border (supports gradients)
			active_border = {
				-- colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				-- colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				colors = {
					"rgba(800080FF)", -- Purple
					"rgba(FF69B4FF)", -- Hot Pink
				},
				angle = 45,
			},
			-- Inactive window border (solid color or gradient)
			-- inactive_border = "rgba(595959aa)",
		},
	},
})
