{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
		mango = {
			url = "github:mangowm/mango";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
	};

	outputs = { self, nixpkgs, mango, ...}: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			modules = [	
				{ nix.settings.experimental-features = ["nix-command" "flakes"]; }
				./configuration.nix
				mango.nixosModules.mango
				./mango.nix
			];
		};
	};
}
