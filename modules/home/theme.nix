{ pkgs, ... }:

let
  # Sylveon Dark Palette
  sylveon-bg-base      = "#181825"; # Deep dark slate blue
  sylveon-bg-surface   = "#1e1e2e"; # Surface elements
  sylveon-pink         = "#f7a8b8"; # Primary accent (ribbons/ears)
  sylveon-cyan         = "#9cdbf0"; # Secondary accent (eyes/bow highlights)
  sylveon-fg           = "#f5e0dc"; # Off-white text
  sylveon-fg-muted     = "#bac2de"; # Muted text
in
{
  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    gtk3.extraCss = ''
      @define-color accent_color ${sylveon-pink};
      @define-color accent_bg_color ${sylveon-pink};
      @define-color accent_fg_color ${sylveon-bg-base};
      
      @define-color window_bg_color ${sylveon-bg-base};
      @define-color window_fg_color ${sylveon-fg};
      @define-color view_bg_color ${sylveon-bg-surface};
      @define-color view_fg_color ${sylveon-fg};

      @define-color headerbar_bg_color ${sylveon-bg-surface};
      @define-color headerbar_fg_color ${sylveon-fg};

      /* Selected state highlights */
      @define-color selected_bg_color ${sylveon-pink};
      @define-color selected_fg_color ${sylveon-bg-base};
      
      /* Secondary accents (buttons/badges) */
      @define-color success_color ${sylveon-cyan};
    '';

    gtk4.extraCss = ''
      @define-color accent_color ${sylveon-pink};
      @define-color accent_bg_color ${sylveon-pink};
      @define-color accent_fg_color ${sylveon-bg-base};
      
      @define-color window_bg_color ${sylveon-bg-base};
      @define-color window_fg_color ${sylveon-fg};
      @define-color view_bg_color ${sylveon-bg-surface};
      @define-color view_fg_color ${sylveon-fg};

      @define-color headerbar_bg_color ${sylveon-bg-surface};
      @define-color headerbar_fg_color ${sylveon-fg};

      @define-color selected_bg_color ${sylveon-pink};
      @define-color selected_fg_color ${sylveon-bg-base};
      
      @define-color success_color ${sylveon-cyan};
    '';
  };

  # Ensures GTK4 apps load the custom dark theme settings correctly
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "MoreWaita";
    };
  };
}