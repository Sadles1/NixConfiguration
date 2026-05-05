{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = inputs: {
		nixosConfiguration.nixos = inputs.lib.nixosSystem {
			modules = [
				{ nix.settings.experemental-features = ["nix-command", "flakes"]; }
				./configuration.nix
			];
		};
	};
}
