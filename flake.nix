{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		niri = {
			url = "github:niri-wm/niri";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
	};

	outputs = { self, nixpkgs, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [
				{ nix.settings.experimental-features = ["nix-command" "flakes"]; }
				./configuration.nix
			];
		};
	};
}
