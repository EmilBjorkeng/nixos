{ inputs, pkgs, config, ... }:

{
  imports =
    [
      ./neovim.nix
      ./kitty.nix
    ];
}