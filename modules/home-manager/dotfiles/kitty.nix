{ lib, config, pkgs, ... }:

let
  cfg = config.dotfiles-kitty;
in
{
  options.dotfiles-kitty = {
    enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."kitty".source = ../../../dotfiles/kitty;
  };
}
