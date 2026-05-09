{ config, pkgs, ... }:

let
	dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

	configs = {
		niri = "niri";
	};
in
{
	home.username = "sadles";
	home.homeDirectory = "/home/sadles";
	programs.bash = {
		enable.true;
		shellAliases = {
			btw = "echo I use nixos-btw";
		}
	};

	xdg.configFile = builtins.mapAttrs
		(name: subpath: {
			source = create_symlink "${dotfiles}/${subpath}";
			recursive = true;
		})
		configs;
}
