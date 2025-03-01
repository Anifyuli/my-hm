{ pkgs, ... }:
{
  imports = [
    ./modules
  ];

  # Home Manager basic configurations
  home = {
    username = "anifyuli";
    homeDirectory = "/home/anifyuli";
    stateVersion = "25.05";
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
      nodejs_22
      pnpm
    ];
    file = {
      ".ssh/allowed_signers".text = "* ${builtins.readFile /home/anifyuli/.ssh/github.pub}";
    };
    sessionVariables = {
      EDITOR = "vim";
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
  
  # Enable Home Manager
  programs.home-manager.enable = true;

}

