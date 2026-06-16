{ pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		extraPackages = with pkgs; [
			clang-tools
			gcc
			wl-clipboard
			lua-language-server
			stylua
		];
	};

	xdg.configFile."nvim" = {
		source = ../../config/nvim;
		recursive = true;
	};
}
