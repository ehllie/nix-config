{
  description = "A highly awesome system configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = github:nix-community/NUR;
    home-manager = { url = github:nix-community/home-manager/master; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = inputs@{ self, nur, home-manager, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      inherit (lib) recursiveUpdate;
    in
    {
      nixosModules = [
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          nixpkgs.config.allowUnfree = true;
          home-manager.users.ellie = { imports = [ ./home-manager/home.nix ];
          };
        }
      ];

      nixosConfigurations.nixos-gram = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configurations/nixos-gram.host.nix ];
      };
      # overlay = my-pkgs;
      # overlays = [
        # my-pkgs
      # ];

    };
}
