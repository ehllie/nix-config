{ config, pkgs, lib, inputs, ... }:
  {
    config.programs.zsh = {
      enable = true;
      dotDir = ".config/zsh";

      initExtra = builtins.readFile ./zshrc;
  };
}
