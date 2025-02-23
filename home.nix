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

  # Gradle configurations
  programs.gradle = {
    enable = true;
    package = pkgs.gradle_8;
    settings = {
      "org.gradle.home" = pkgs.jdk17;
    };
  };

  # Java configurations
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}

