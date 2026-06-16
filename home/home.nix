{ config, pkgs, lib, ... }:

{
	imports = [
		./modules/nvim.nix
		./modules/niri.nix
		./modules/kitty.nix
	];

	xdg.desktopEntries.Bazecor = {
		name = "Bazecor";
		exec = "bazecor --ozone-platform=wayland --enable-features=WaylandWindowDecorations";
		categories = [ "Utility" ];
	};

	home.stateVersion = "25.11";
}
