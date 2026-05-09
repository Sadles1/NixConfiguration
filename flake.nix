{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				{ nix.settings.experimental-features = ["nix-command" "flakes"]; }
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.users.tony = import ./home.nix
					home-manager.backupFileExtension = "backup";
				}
			];
		};
	};
}
