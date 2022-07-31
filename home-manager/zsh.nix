{ config, pkgs, lib, inputs, ... }:
  {
    config.programs.zsh = {
      enable = true;
      zdotdir = "$HOME/.config/zsh";

      initExtra = builtins.readFile ./zshrc;
  };
}
