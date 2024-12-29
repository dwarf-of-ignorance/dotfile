{
    description = "Ideal Flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        stylix.url = "github:danth/stylix";
    };

    outputs =
        { nixpkgs, home-manager, ... }@inputs:
        let
            system = "aarch64-linux";
            host = "ideal";
            username = "ideal";
        in
            {
            nixosConfigurations = {
                "${host}" = nixpkgs.lib.nixosSystem {
                    specialArgs = {
                        inherit system;
                        inherit inputs;
                        inherit username;
                        inherit host;
                    };
                    modules = [
                        ./hosts/${host}/config.nix
                        inputs.stylix.nixosModules.stylix
                        home-manager.nixosModules.home-manager
                        {
                            home-manager.extraSpecialArgs = {
                                inherit username;
                                inherit inputs;
                                inherit host;
                            };
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.backupFileExtension = "backup";
                            home-manager.users.${username} = import ./hosts/${host}/home.nix;
                        }
                    ];
                };
            };
        };
}
