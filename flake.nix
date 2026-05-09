{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, nixpkgs-unstable, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				{ nix.settings.experimental-features = ["nix-command" "flakes"]; }
				./configuration.nix
			];
		};
	};
}
