{ lib, config, pkgs, ... }:

let
  cfg = config.dotfiles-neovim;
in
{
  options.dotfiles-neovim = {
    enable = lib.mkEnableOption "nvim";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."nvim".source = ../../../dotfiles/nvim;
  };
}
