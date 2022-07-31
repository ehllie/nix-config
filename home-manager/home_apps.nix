{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.profiles.dev;
  haskellPack = with pkgs.haskellPackages;
    let
      ps = p: with p;  [ async base containers lens mtl random stm text transformers unliftio ];
      ghc = ghcWithHoogle ps;
    in [
      ghc
      cabal-install
      hlint
      ghcide
      hnix
      stack
      haskell-language-server
    ];
  devPack = with pkgs; [
    gcc
    cargo
    nodePackages.pnpm
    python310
    pkgconfig
    nixpkgs-fmt
  ];
  appPack = with pkgs; [
    libreoffice
    dmenu
  ];
  mediaPack = with pkgs; [
    firefox
    thunderbird
    mpv
    mpd
    vlc
  ];
  cliPack = with pkgs; [
    zsh
    git
    wget
    zip
    lazygit
    unzip
    htop
    coreutils
    killall
  ];
in
{
  options.profiles.dev.enable =
    lib.mkOption {
      description = "Enable custom vim configuration.";
      type = with lib.types; bool;
      default = true;
    };
  config = lib.mkIf cfg.enable {
    home.packages = builtins.concatLists [
      haskellPack
      devPack
      appPack
      mediaPack
      cliPack
    ];
  };

}
