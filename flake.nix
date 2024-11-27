{
  description = "Home Manager configuration of ntrinite";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    unstable-nix.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # In case you want some "newer" versions

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "unstable-nix";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      unstable-nix,
      nix-vscode-extensions,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      homeConfigurations."ntrinite" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          unhinged-nix = import unstable-nix {
            inherit system;
            config = {
              allowUnfree = true;
            };
            overlays = [ nix-vscode-extensions.overlays.default ];
          };
        };
      };
    };
}
