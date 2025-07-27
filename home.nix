{ pkgs, ... }:
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
      dust
      foundry
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
      nodejs_22
      pnpm
      solc-select
      uv
      yarn-berry
    ];
    file = { };
    sessionVariables = {
      HMDIR = "$HOME/.config/home-manager/";
    };
    shell.enableFishIntegration = true;
  };

  # nixGL Home Manager integration
  nixGL = {
    defaultWrapper = "mesa";
    vulkan.enable = true;
  };

  # Nixpkgs configuration
  nixpkgs.config = {
    allowDirty = true;
    allowUnfree = true;
  };

  # Enable command-not-found for Home Manager
  programs.command-not-found.enable = true;

  # Enable Home Manager
  programs.home-manager.enable = true;

}
