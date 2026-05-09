{ config, pkgs, ... }:

let
	dotfiles = "/etc/nixos/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

	configs = {
		niri = "niri";
	};
in
{
	home.username = "sadles";
	home.homeDirectory = "/home/sadles";
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo I use nixos-btw";
		};
	};

	xdg.configFile = builtins.mapAttrs
		(name: subpath: {
			source = create_symlink "${dotfiles}/${subpath}";
			recursive = true;
		})
		configs;

	
}
