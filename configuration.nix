{ config, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.blacklistedKernelModules = [ "nouveau" ];
	
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;

	time.timeZone = "Europe/Lisbon";
	
	users.users.root.shell = pkgs.zsh;
	users.users.root.ignoreShellProgramCheck = true;

	users.users.sadles = {
		isNormalUser = true;
		description = "sadles";
		extraGroups = [ "wheel" ];
	};
	
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 5d";
	};

	nix.optimise = {
		automatic = true;
		dates = "weekly";
	};

	services.xserver.enable = true;
	services.xserver.videoDrivers = [ "amdgpu" ];
	services.displayManager.ly.enable = true;
	
	programs.xwayland.enable = true;
	programs.niri.enable = true;
	
	nixpkgs.config.allowUnfree = true;

	services.blueman.enable = true;
	
	programs.firefox.enable = true;

	programs.git = {
		enable = true;
		config = {
			user.name = "sadles";
			user.email = "seledkov.vitaliy@gmail.com";
		};
	};

	programs.bazecor.enable = true;

	environment.systemPackages = with pkgs; [
		wget
		wl-clipboard
		swaybg
		kitty
		zsh
		oh-my-posh
		fzf
		fuzzel
		lsd
		bat
		btop
		zoxide
		fastfetch
		yazi
		claude-code
		qutebrowser
		gcc
		clang
		unzip
		gnumake
		ripgrep
		tree-sitter
		fd
  ];

	environment.sessionVariables = {
		ZDOTDIR = "\${HOME}/.config/zsh";
	};

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];

	system.stateVersion = "25.11"; # Did you read the comment?
}
