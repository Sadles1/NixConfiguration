{ config, pkgs, ... }:

{
	programs.mango.enable = true;
	wayland.windowManager.mango = {
		enable = true;
	};
}
