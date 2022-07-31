{ config, pkgs, lib, inputs, ... }:

{

  home = {
    username = "ellie";
    homeDirectory = "/home/ellie";
    # packages = with pkgs; [
    #   (st.overrideAttrs (oa: {
    #     version = "modified";
    #     src = fetchFromGitHub {
    #       owner = "LukeSmithxyz";
    #       repo = "st";
    #       rev = "67ef1c4d4ec3d3a423a078eb746fa2fac4a267e9";
    #       sha256 = "sha256-eiNkW0U0BYg1r075KEqWbiQKSPWoZIS3Epl3SYCnTYQ=";
    #       fetchSubmodules = true;
    #     };
    #     postPatch = ''
    #       substituteInPlace Makefile \
    #         --replace "git submodule init" "# git submodule init" \
    #         --replace "git submodule update" "# git submodule update"
    #     '';
    #     buildInputs = oa.buildInputs ++ [ harfbuzz ];
    #   }))
      # (pkgs.runCommand "artofwar-man" {
        # source = ./manpages/artofwar.3;
      # } ''
        # mkdir -p $out/share/man/man3
        # cp "$source" "$out/share/man/man3/artofwar.3"
      # '')
      # (pkgs.runCommand "taoteching-man" {
        # source = ./manpages/taoteching.3;
      # } ''
        # mkdir -p $out/share/man/man3
        # cp "$source" "$out/share/man/man3/taoteching.3"
      # '')
    # ];

    # Add locations to PATH
    sessionPath = [ "~/.local/bin" ];

    # Add environment variables
    sessionVariables = {
      EDITOR = "nvim";
    };

    # file = {
    #   xresources = {
    #     source = ./Xresources;
    #     target = "~/.Xresources";
    #   };
    # };

    stateVersion = "22.05";
  };

  imports = [
    ./zsh.nix
    ./home_apps.nix
  ];

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "ehllie";
      userEmail = "me@ehllie.xyz";
    };
  };

  services = {
    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
    caffeine = {
      enable = true;
    };
    # dunst = {
      # enable = true; # disabling it for now, since it's kinda ugly
    # };
    # screen-locker = {
    #   enable = true;
    #   lockCmd = "${pkgs.slock}/bin/slock";
    #   inactiveInterval = 10;
    # };
  };

}
