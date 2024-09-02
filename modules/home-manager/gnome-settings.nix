{ lib, config, pkgs, ... }:

let
  cfg = config.gnome;
in
{
  options.gnome = {
    # Background
    background = {
      light-mode = lib.mkOption {
        default = "file:///nix/store/76qj263z101nv3ija8fp6i2y1183jmc7-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
        description = ''
          Path to light mode background
        '';
      };
      dark-mode = lib.mkOption {
        default = "file:///nix/store/hjmbhkwp2d5zb0822l602k72zcpix4l1-simple-dark-gray-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-dark-gray.png";
        description = ''
          Path to dark mode background
        '';
      };
    };

    # Color Scheme
    color-scheme = lib.mkOption {
      default = "default";
      description = ''
        Change the color scheme
      '';
    };

    # Clock
    clock = {
      # Format
      format = lib.mkOption {
        default = "24h";
        description = ''
          Clock format (12h / 24h)
        '';
      };
      # Show Weekday
      show-weekday = lib.mkOption {
        default = false;
        description = ''
          Show the weekday
        '';
      };
    };

    # Battery
    battery.show-percentage = lib.mkOption {
      default = false;
      description = ''
        Show the battery percentage
      '';
    };

    # Calendar
    calendar.show-weekdate = lib.mkOption {
      default = false;
      description = ''
        Show the calendar weekdate
      '';
    };

    # Update Time/Date
    automatic-timezone = lib.mkOption {
      default = true;
      description = ''
        Automatic update the timezone
      '';
    };
  };

  config = {
    dconf.settings = {
      # Background
      "org/gnome/desktop/background" = {
        "picture-uri" = "${cfg.background.light-mode}";
        "picture-uri-dark" = "${cfg.background.dark-mode}";
      };
      "org/gnome/desktop/interface" = {
        # Darkmode
        color-scheme = "${cfg.color-scheme}";
        # Clock
        clock-format = "${cfg.clock.format}";
        clock-show-weekday = cfg.clock.show-weekday;
        # Battery
        show-battery-percentage = cfg.battery.show-percentage;
      };
      # Calendar
      "org/gnome/desktop/calendar" = {
        show-weekdate = cfg.calendar.show-weekdate;
      };
      # Automatic Update time/timezone
      "org/gnome/desktop/datetime" = {
        automatic-timezone = cfg.automatic-timezone;
      };
    };
  };
}
