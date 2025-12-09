{
  inputs,
  pkgs,
  nixgl,
  username,
  ...
}:
{
  imports = [
    ./options
  ];

  # Home Manager basic configurations
  home = {
    username = ''${username}'';
    homeDirectory = ''/home/${username}'';
    stateVersion = "25.05";
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style
      nixpkgs-fmt
      nodejs_24
      pnpm
      uv
      yarn-berry
    ];
    file = { };
    sessionVariables = {
      HM = "$HOME/.config/home-manager/";
    };
    shell.enableFishIntegration = true;
  };

  # Home Manager fontconfig
  fonts.fontconfig.enable = true;

  # Nix configurations
  nix = {
    package = pkgs.lix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" ];
  };

  # Generic Linux distro integration
  targets.genericLinux = {
    enable = true;
    nixGL = {
      packages = nixgl.packages;
      defaultWrapper = "mesa";
      installScripts = [ "mesa" ];
      vulkan.enable = true;
    };
  };

  # Nixpkgs configuration
  nixpkgs.config = {
    allowDirty = true;
    allowUnfree = true;
  };

  # nh, Nix helper
  programs.nh.enable = true;

  # Command-not-found for Home Manager
  programs.command-not-found.enable = false;

  # Enable Home Manager
  programs.home-manager.enable = true;

  # XDG integration
  xdg = {
    mime.enable = true;
  };
}
