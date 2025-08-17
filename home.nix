{ config, pkgs, nixgl, ... }:
{
  imports = [
    ./options
  ];

  # Home Manager basic configurations
  home = {
    username = "anifyuli";
    homeDirectory = "/home/anifyuli";
    stateVersion = "25.05";
    packages = with pkgs; [
      # Unwrapped
      dust
      foundry
      go-ethereum
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
      nodejs_22
      pnpm
      uv
      yarn-berry

      # NixGL wrapped
      (config.lib.nixGL.wrap pkgs.hoppscotch)
    ];
    file = { };
    sessionVariables = {
      HMDIR = "$HOME/.config/home-manager/";
    };
    shell.enableFishIntegration = true;
  };

  # nixGL Home Manager integration
  nixGL = {
    packages = nixgl.packages;
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
    vulkan.enable = true;
  };

  # Home Manager fontconfig
  fonts.fontconfig.enable = true;

  # Generic Linux distro integration
  targets.genericLinux.enable = true;

  # Nixpkgs configuration
  nixpkgs.config = {
    allowDirty = true;
    allowUnfree = true;
  };

  # Enable command-not-found for Home Manager
  programs.command-not-found.enable = true;

  # Enable Home Manager
  programs.home-manager.enable = true;

  # XDG integration
  xdg = {
    mime.enable = true;
  };
}
