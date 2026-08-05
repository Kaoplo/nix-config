{ ... }:
{
    wayland.windowManager.hyprland.settings = {
	input = {
		touchpad = {
		    natural_scroll = false;
		};    
};
	general = {
	    layout = "dwindle";
	    gaps_in = 0;
	    gaps_out = 0;
            border_size = 2;
	    "col.active_border" = "rgb(f492a5) rgb(f9cbd0) 45deg";
	    "col.inactive_border" = "0x00000000";
	};
	misc = {
	    disable_hyprland_logo = true;
	    disable_splash_rendering = false;
	    focus_on_activate = true;
	    middle_click_paste = false;
	};
	animations = {
	  enabled = false;
	};
    };
    
	
}
